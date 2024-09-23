@implementation TouchAccuracyViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v5;
  MultiTouchHelper *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[6];
  _QWORD v27[6];

  -[TouchAccuracyViewController setInputs:](self, "setInputs:", a3, a4);
  -[TouchAccuracyViewController setGoodTaps:](self, "setGoodTaps:", 0);
  -[TouchAccuracyViewController setBadTaps:](self, "setBadTaps:", 0);
  v5 = objc_alloc_init((Class)NSMutableArray);
  -[TouchAccuracyViewController setAllResults:](self, "setAllResults:", v5);

  v6 = objc_alloc_init(MultiTouchHelper);
  -[TouchAccuracyViewController setMultiTouchHelper:](self, "setMultiTouchHelper:", v6);

  -[TouchAccuracyViewController setTouchStatus:](self, "setTouchStatus:", 0);
  -[TouchAccuracyViewController shufflePositions](self, "shufflePositions");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  v8 = objc_msgSend(v7, "connectedToPowerRequired");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    -[TouchAccuracyViewController setDevice:](self, "setDevice:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController device](self, "device"));
    objc_msgSend(v10, "setBatteryMonitoringEnabled:", 1);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  v12 = objc_msgSend(v11, "testAutomationEnabled");

  if (v12)
  {
    v26[0] = CFSTR("blockWidth");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
    objc_msgSend(v25, "blockWidth");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v27[0] = v24;
    v26[1] = CFSTR("blockHeight");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
    objc_msgSend(v23, "blockHeight");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v27[1] = v13;
    v26[2] = CFSTR("positions");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "positions"));
    v27[2] = v15;
    v26[3] = CFSTR("noInputTimeout");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
    objc_msgSend(v16, "noInputTimeout");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v27[3] = v17;
    v26[4] = CFSTR("partialInputTimeout");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
    objc_msgSend(v18, "partialInputTimeout");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v27[4] = v19;
    v26[5] = CFSTR("connectedToPowerRequired");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v20, "connectedToPowerRequired")));
    v27[5] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 6));
    +[DSTestAutomation postConfiguration:](DSTestAutomation, "postConfiguration:", v22);

  }
}

- (void)noInputTimedOut
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NO_INPUT_DETECTED"), &stru_100008588, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v4, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RETRY"), &stru_100008588, 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003EB8;
  v13[3] = &unk_1000082A0;
  v13[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v13));
  objc_msgSend(v5, "addAction:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100008588, 0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003F30;
  v12[3] = &unk_1000082A0;
  v12[4] = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v12));
  objc_msgSend(v5, "addAction:", v11);

  -[TouchAccuracyViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)timedOut
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  LODWORD(v3) = -[TouchAccuracyViewController totalTaps](self, "totalTaps");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  v5 = objc_msgSend(v4, "numberOfBlocks");

  if ((int)v3 < v5)
  {
    v3 = (int)v3;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "positions"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v3));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController allResults](self, "allResults"));
      v16[0] = CFSTR("tapX");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v17[0] = v10;
      v16[1] = CFSTR("tapY");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v17[1] = v11;
      v16[2] = CFSTR("targetX");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("xPos")));
      v17[2] = v12;
      v16[3] = CFSTR("targetY");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("yPos")));
      v16[4] = CFSTR("hit");
      v17[3] = v13;
      v17[4] = &__kCFBooleanFalse;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 5));
      objc_msgSend(v9, "addObject:", v14);

      ++v3;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
      LODWORD(v8) = objc_msgSend(v15, "numberOfBlocks");

    }
    while (v3 < (int)v8);
  }
  -[TouchAccuracyViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_100008808);
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;

  -[TouchAccuracyViewController setupView](self, "setupView");
  v10 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "handleTouch:");
  objc_msgSend(v10, "setMinimumPressDuration:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController view](self, "view"));
  objc_msgSend(v3, "addGestureRecognizer:", v10);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  objc_msgSend(v4, "noInputTimeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0));
  -[TouchAccuracyViewController setTimeoutTimer:](self, "setTimeoutTimer:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  LODWORD(v4) = objc_msgSend(v6, "connectedToPowerRequired");

  if ((_DWORD)v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "batteryStateChanged", UIDeviceBatteryStateDidChangeNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController multiTouchHelper](self, "multiTouchHelper"));
    v9 = objc_msgSend(v8, "isPowerConnected");

    if ((v9 & 1) == 0)
      -[TouchAccuracyViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_100008820);
  }

}

- (void)shufflePositions
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "positions"));
  v5 = (char *)objc_msgSend(v4, "count");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "positions"));
  v11 = objc_msgSend(v7, "mutableCopy");

  if (v5)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v11, "exchangeObjectAtIndex:withObjectAtIndex:", v8, v8 + arc4random_uniform((uint32_t)v5));
      ++v8;
      --v5;
    }
    while (v5);
  }
  v9 = objc_msgSend(v11, "copy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  objc_msgSend(v10, "setPositions:", v9);

}

- (void)setupView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc((Class)UIView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  objc_msgSend(v6, "blockWidth");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  objc_msgSend(v9, "blockHeight");
  v11 = objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v8, v10);
  -[TouchAccuracyViewController setTargetView:](self, "setTargetView:", v11);

  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHexValue:error:](UIColor, "colorWithHexValue:error:", CFSTR("007AFF"), 0)));
  v13 = objc_msgSend(v12, "CGColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
  objc_msgSend(v15, "setBorderColor:", v13);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v16, "setBackgroundColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
  objc_msgSend(v19, "setBorderWidth:", 1.5);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
  objc_msgSend(v20, "addSubview:", v21);

  v22 = (id)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
  -[TouchAccuracyViewController placeNextTarget:](self, "placeNextTarget:", v22);

}

- (void)placeNextTarget:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  _QWORD v33[4];
  uint8_t buf[4];
  unint64_t v35;

  v4 = a3;
  v5 = -[TouchAccuracyViewController totalTaps](self, "totalTaps");
  v6 = DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Index of the next target: %lu", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positions"));
  v10 = objc_msgSend(v9, "count");

  if ((unint64_t)v10 > v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "positions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v5));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("xPos")));
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("yPos")));
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(v4, "setCenter:", v16, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
    LODWORD(v17) = objc_msgSend(v19, "testAutomationEnabled");

    if ((_DWORD)v17)
    {
      v32[0] = CFSTR("width");
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
      objc_msgSend(v31, "frame");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20));
      v33[0] = v21;
      v32[1] = CFSTR("height");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
      objc_msgSend(v22, "frame");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
      v33[1] = v24;
      v32[2] = CFSTR("x");
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
      objc_msgSend(v25, "center");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v33[2] = v26;
      v32[3] = CFSTR("y");
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
      objc_msgSend(v27, "center");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
      v33[3] = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 4));
      +[DSTestAutomation postInteractiveTestEvent:info:](DSTestAutomation, "postInteractiveTestEvent:info:", CFSTR("TapTargetAppeared"), v30);

    }
  }

}

- (int)totalTaps
{
  unsigned int v3;

  v3 = -[TouchAccuracyViewController goodTaps](self, "goodTaps");
  return -[TouchAccuracyViewController badTaps](self, "badTaps") + v3;
}

- (void)handleTouch:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == (id)1)
  {
    -[TouchAccuracyViewController handleTouchBegan:](self, "handleTouchBegan:", v4);
  }
  else if (objc_msgSend(v4, "state") == (id)3 || objc_msgSend(v4, "state") == (id)4)
  {
    -[TouchAccuracyViewController handleTouchEnded:](self, "handleTouchEnded:", v4);
  }

}

- (void)handleTouchBegan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  _QWORD v12[5];
  uint8_t buf[4];
  unsigned int v14;

  v4 = a3;
  if (!-[TouchAccuracyViewController touchStatus](self, "touchStatus"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController view](self, "view"));
    objc_msgSend(v4, "locationInView:", v5);
    -[TouchAccuracyViewController setTouchLocation:](self, "setTouchLocation:");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController view](self, "view"));
    -[TouchAccuracyViewController touchLocation](self, "touchLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hitTest:withEvent:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));

    v9 = DiagnosticLogHandleForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7 == v8)
    {
      if (v11)
      {
        *(_DWORD *)buf = 67109120;
        v14 = -[TouchAccuracyViewController totalTaps](self, "totalTaps");
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#%d Hit!", buf, 8u);
      }

      -[TouchAccuracyViewController setTouchStatus:](self, "setTouchStatus:", 2);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100004B38;
      v12[3] = &unk_1000082C8;
      v12[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v12, 0.25);
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 67109120;
        v14 = -[TouchAccuracyViewController totalTaps](self, "totalTaps");
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#%d Missed!", buf, 8u);
      }

      -[TouchAccuracyViewController setTouchStatus:](self, "setTouchStatus:", 1);
    }
  }

}

- (void)handleTouchEnded:(id)a3
{
  unint64_t v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  if (-[TouchAccuracyViewController touchStatus](self, "touchStatus", a3))
  {
    v4 = -[TouchAccuracyViewController touchStatus](self, "touchStatus");
    if (v4 == 2)
      -[TouchAccuracyViewController setGoodTaps:](self, "setGoodTaps:", -[TouchAccuracyViewController goodTaps](self, "goodTaps") + 1);
    else
      -[TouchAccuracyViewController setBadTaps:](self, "setBadTaps:", -[TouchAccuracyViewController badTaps](self, "badTaps") + 1);
    v5 = v4 == 2;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController allResults](self, "allResults"));
    v17[0] = CFSTR("tapX");
    -[TouchAccuracyViewController touchLocation](self, "touchLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v18[0] = v7;
    v17[1] = CFSTR("tapY");
    -[TouchAccuracyViewController touchLocation](self, "touchLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    v18[1] = v9;
    v17[2] = CFSTR("targetX");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
    objc_msgSend(v10, "center");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v18[2] = v11;
    v17[3] = CFSTR("targetY");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
    objc_msgSend(v12, "center");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
    v18[3] = v14;
    v17[4] = CFSTR("hit");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    v18[4] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 5));
    objc_msgSend(v6, "addObject:", v16);

    -[TouchAccuracyViewController checkForNextTarget](self, "checkForNextTarget");
  }
}

- (void)checkForNextTarget
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController timeoutTimer](self, "timeoutTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v4, "invalidate");

    -[TouchAccuracyViewController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  objc_msgSend(v5, "partialInputTimeout");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timedOut", 0, 0));
  -[TouchAccuracyViewController setTimeoutTimer:](self, "setTimeoutTimer:", v6);

  LODWORD(v6) = -[TouchAccuracyViewController totalTaps](self, "totalTaps");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  v8 = objc_msgSend(v7, "numberOfBlocks");

  if ((int)v6 >= v8)
  {
    if (-[TouchAccuracyViewController badTaps](self, "badTaps") < 1)
      v11 = &off_100008838;
    else
      v11 = &off_100008808;
    -[TouchAccuracyViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", v11);
  }
  else
  {
    -[TouchAccuracyViewController setTouchLocation:](self, "setTouchLocation:", CGPointZero.x, CGPointZero.y);
    -[TouchAccuracyViewController setTouchStatus:](self, "setTouchStatus:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
    objc_msgSend(v10, "setBackgroundColor:", v9);

    v12 = (id)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController targetView](self, "targetView"));
    -[TouchAccuracyViewController placeNextTarget:](self, "placeNextTarget:", v12);

  }
}

- (void)cleanUp
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController timeoutTimer](self, "timeoutTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v4, "invalidate");

    -[TouchAccuracyViewController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController inputs](self, "inputs"));
  v6 = objc_msgSend(v5, "connectedToPowerRequired");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController device](self, "device"));
    objc_msgSend(v7, "setBatteryMonitoringEnabled:", 0);

    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "removeObserver:", self);

  }
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[6];
  _QWORD v47[6];

  v4 = a3;
  -[TouchAccuracyViewController cleanUp](self, "cleanUp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController result](self, "result"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusCode"));
  v8 = objc_msgSend(v7, "isEqualToNumber:", &off_100008850);

  if (v8)
  {
    v9 = DiagnosticLogHandleForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000058F8(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController result](self, "result"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "statusCode"));
    v20 = objc_msgSend(v19, "isEqualToNumber:", &off_100008820);

    if (!v20)
    {
      v46[0] = CFSTR("displayResX");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v29, "bounds");
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30));
      v47[0] = v45;
      v46[1] = CFSTR("displayResY");
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v44, "bounds");
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v31));
      v47[1] = v43;
      v46[2] = CFSTR("allTaps");
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController allResults](self, "allResults"));
      v47[2] = v42;
      v46[3] = CFSTR("isCharging");
      v32 = objc_alloc((Class)NSNumber);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController multiTouchHelper](self, "multiTouchHelper"));
      v34 = objc_msgSend(v32, "initWithBool:", objc_msgSend(v33, "isBatteryCharging"));
      v47[3] = v34;
      v46[4] = CFSTR("isPluggedIntoPower");
      v35 = objc_alloc((Class)NSNumber);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController multiTouchHelper](self, "multiTouchHelper"));
      v37 = objc_msgSend(v35, "initWithBool:", objc_msgSend(v36, "isPowerConnected"));
      v47[4] = v37;
      v46[5] = CFSTR("temperatureData");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController multiTouchHelper](self, "multiTouchHelper"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "temperatureData"));
      v47[5] = v39;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 6));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController result](self, "result"));
      objc_msgSend(v41, "setData:", v40);

      goto LABEL_9;
    }
    v21 = DiagnosticLogHandleForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000592C(v10, v22, v23, v24, v25, v26, v27, v28);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController result](self, "result"));
  objc_msgSend(v29, "setData:", &__NSDictionary0__struct);
LABEL_9:

  -[TouchAccuracyViewController setFinished:](self, "setFinished:", 1);
}

- (void)batteryStateChanged
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController device](self, "device"));
  if (objc_msgSend(v3, "batteryState") == (id)1)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchAccuracyViewController device](self, "device"));
    v5 = objc_msgSend(v4, "batteryState");

    if (v5)
      return;
  }
  -[TouchAccuracyViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_100008820);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
  objc_storeStrong((id *)&self->_targetView, a3);
}

- (unint64_t)touchStatus
{
  return self->_touchStatus;
}

- (void)setTouchStatus:(unint64_t)a3
{
  self->_touchStatus = a3;
}

- (int)goodTaps
{
  return self->_goodTaps;
}

- (void)setGoodTaps:(int)a3
{
  self->_goodTaps = a3;
}

- (int)badTaps
{
  return self->_badTaps;
}

- (void)setBadTaps:(int)a3
{
  self->_badTaps = a3;
}

- (CGPoint)touchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchLocation.x;
  y = self->_touchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTouchLocation:(CGPoint)a3
{
  self->_touchLocation = a3;
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
  objc_storeStrong((id *)&self->_allResults, a3);
}

- (UIDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (MultiTouchHelper)multiTouchHelper
{
  return self->_multiTouchHelper;
}

- (void)setMultiTouchHelper:(id)a3
{
  objc_storeStrong((id *)&self->_multiTouchHelper, a3);
}

- (TouchAccuracyInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_multiTouchHelper, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
