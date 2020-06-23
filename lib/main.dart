import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

final _colorG1 = Color.fromRGBO(255, 173, 78, 1);
final _colorG2 = Color.fromRGBO(255, 94, 84, 1);

final _colorG3 = Color.fromRGBO(31, 171, 255, 1);
final _colorG4 = Color.fromRGBO(0, 241, 255, 1);

final _colorBtn1 = Color.fromRGBO(0, 207, 200, 1);
final _colorBtn2 = Color.fromRGBO(0, 241, 158, 1);

final _actionBtnColor = Color.fromRGBO(255, 131, 82, 1);

final _stripeHeight = 12.0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  String _actionBtnText = 'Register';

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: -120).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInCubic,
    ));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(Duration(milliseconds: 150), () {
          if (_actionBtnText == 'Register') {
            setState(() {
              _actionBtnText = 'Login';
            });
          } else {
            setState(() {
              _actionBtnText = 'Register';
            });
          }
          animationController.reverse();
        });
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _nextPressed() {
    // if (animationController.status == AnimationStatus.completed) {
    //   animationController.reverse();
    // } else {
    //   animationController.forward();
    // }
    // if (animationController.status == AnimationStatus.)
    animationController.forward();
  }

  Widget navButton() {
    return Container(
      height: 50.0,
      width: 120.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(65.0),
          bottomRight: Radius.circular(65.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(208, 209, 217, 0.5),
            offset: Offset(0.0, 4.0),
            blurRadius: 8.0,
            spreadRadius: 0.3,
          ),
        ],
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          onTap: _nextPressed,
          child: Center(
            child: Text(
              _actionBtnText,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: _actionBtnColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavButton() {
    return AnimatedBuilder(
      animation: animationController,
      child: navButton(),
      builder: (context, child) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Transform.translate(
            offset: Offset(animation.value, 0),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildTopSection(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: TopSectionClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_colorG1, _colorG2, _colorG2],
          ),
        ),
        height: size.height / 4,
        alignment: Alignment.bottomCenter,
        // child: Container(
        //   height: _stripeHeight,
        //   color: Color.fromRGBO(255, 255, 255, 0.6),
        // ),
      ),
    );
  }

  Widget _buildCenterSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 70.0),
          child: Text('Login',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w600)),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(65.0),
                      bottomRight: Radius.circular(65.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        // color: Color.fromRGBO(208, 209, 217, 0.7),
                        // offset: Offset(1.0, 1.0),
                        // blurRadius: 10.0,
                        // spreadRadius: 0.8,
                        color: Color.fromRGBO(208, 209, 217, 0.5),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 8.0,
                        spreadRadius: 0.3,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Icon(
                                  Feather.user,
                                  color: Color.fromRGBO(203, 207, 218, 1),
                                  size: 18.0,
                                ),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Username',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(132, 144, 155, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Color.fromRGBO(208, 209, 217, 1),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Icon(
                                  Feather.lock,
                                  color: Color.fromRGBO(203, 207, 218, 1),
                                  size: 18.0,
                                ),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(132, 144, 155, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 35.0,
                  right: 20,
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [_colorBtn1, _colorBtn1, _colorBtn2],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(208, 209, 217, 0.7),
                          offset: Offset(0.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white54,
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: _nextPressed,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              'Forgot ?',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(203, 207, 218, 1),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        buildNavButton(),
      ],
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: BottomSectionClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [_colorG3, _colorG4, _colorG4],
          ),
        ),
        height: size.height / 4,
        alignment: Alignment.topCenter,
        // child: Container(
        //   height: _stripeHeight,
        //   color: Color.fromRGBO(255, 255, 255, 0.6),
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildTopSection(context),
              _buildCenterSection(context),
              _buildBottomSection(context),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSectionClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height / 1.5);

    var ctrlPoint = Offset(size.width, size.height);
    var endPoint = Offset(size.width, 0);
    path.quadraticBezierTo(
        ctrlPoint.dx, ctrlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TopSectionClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);

    var ctrlPoint = Offset(size.width / 6, 0);
    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        ctrlPoint.dx, ctrlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
