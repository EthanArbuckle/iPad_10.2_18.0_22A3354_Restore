@implementation TouchResponseViewController

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
  _QWORD v24[5];
  _QWORD v25[5];

  -[TouchResponseViewController setInputs:](self, "setInputs:", a3, a4);
  -[TouchResponseViewController setTestFinished:](self, "setTestFinished:", 0);
  v5 = objc_alloc_init((Class)NSMutableArray);
  -[TouchResponseViewController setTouchRegions:](self, "setTouchRegions:", v5);

  v6 = objc_alloc_init(MultiTouchHelper);
  -[TouchResponseViewController setMultiTouchHelper:](self, "setMultiTouchHelper:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
  v8 = objc_msgSend(v7, "connectedToPowerRequired");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    -[TouchResponseViewController setDevice:](self, "setDevice:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController device](self, "device"));
    objc_msgSend(v10, "setBatteryMonitoringEnabled:", 1);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  v12 = objc_msgSend(v11, "testAutomationEnabled");

  if (v12)
  {
    v24[0] = CFSTR("touchMap");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "touchMapDictionary"));
    v25[0] = v13;
    v24[1] = CFSTR("blockColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "blockColor"));
    v25[1] = v15;
    v24[2] = CFSTR("noInputTimeout");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
    objc_msgSend(v16, "noInputTimeout");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v25[2] = v17;
    v24[3] = CFSTR("timeoutSeconds");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
    objc_msgSend(v18, "timeoutSeconds");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v25[3] = v19;
    v24[4] = CFSTR("connectedToPowerRequired");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v20, "connectedToPowerRequired")));
    v25[4] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 5));
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NO_INPUT_DETECTED"), &stru_1000084B0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v4, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RETRY"), &stru_1000084B0, 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000437C;
  v13[3] = &unk_100008238;
  v13[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v13));
  objc_msgSend(v5, "addAction:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1000084B0, 0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000043F4;
  v12[3] = &unk_100008238;
  v12[4] = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v12));
  objc_msgSend(v5, "addAction:", v11);

  -[TouchResponseViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)timedOut
{
  -[TouchResponseViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_100008698);
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  -[TouchResponseViewController setupView](self, "setupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
  objc_msgSend(v3, "noInputTimeout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0));
  -[TouchResponseViewController setTimeoutTimer:](self, "setTimeoutTimer:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
  LODWORD(v3) = objc_msgSend(v5, "connectedToPowerRequired");

  if ((_DWORD)v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "batteryStateChanged", UIDeviceBatteryStateDidChangeNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController multiTouchHelper](self, "multiTouchHelper"));
    v8 = objc_msgSend(v7, "isPowerConnected");

    if ((v8 & 1) == 0)
      -[TouchResponseViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_1000086B0);
  }
}

- (void)setupView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "nativeScale");
  v7 = v6;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "touchMap"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v13);
        v15 = objc_alloc((Class)UIView);
        objc_msgSend(v14, "x");
        v17 = v16 / v7;
        objc_msgSend(v14, "y");
        v19 = v18 / v7;
        objc_msgSend(v14, "width");
        v21 = v20 / v7;
        objc_msgSend(v14, "height");
        v23 = objc_msgSend(v15, "initWithFrame:", v17, v19, v21, v22 / v7);
        objc_msgSend(v23, "setTag:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        objc_msgSend(v23, "setBackgroundColor:", v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController touchRegions](self, "touchRegions"));
        objc_msgSend(v25, "addObject:", v23);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController view](self, "view"));
        objc_msgSend(v26, "addSubview:", v23);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController view](self, "view"));
  objc_msgSend(v7, "locationInView:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hitTest:withEvent:", 0));

  v9 = v11;
  if (v11)
  {
    v10 = objc_msgSend(v11, "tag");
    v9 = v11;
    if (v10 == (id)1)
    {
      -[TouchResponseViewController highlightView:](self, "highlightView:", v11);
      v9 = v11;
    }
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController view](self, "view"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController view](self, "view"));
        objc_msgSend(v10, "locationInView:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hitTest:withEvent:", 0));

        if (v13 && objc_msgSend(v13, "tag") == (id)1)
          -[TouchResponseViewController highlightView:](self, "highlightView:", v13);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController view](self, "view"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController view](self, "view"));
        objc_msgSend(v10, "locationInView:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hitTest:withEvent:", 0));

        if (v13 && objc_msgSend(v13, "tag") == (id)1)
          -[TouchResponseViewController highlightView:](self, "highlightView:", v13);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)highlightView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController timeoutTimer](self, "timeoutTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v6, "invalidate");

    -[TouchResponseViewController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
  objc_msgSend(v7, "timeoutSeconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timedOut", 0, 0));
  -[TouchResponseViewController setTimeoutTimer:](self, "setTimeoutTimer:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[TouchResponseViewController setStartDate:](self, "setStartDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "blockColor"));
  objc_msgSend(v4, "setBackgroundColor:", v11);

  objc_msgSend(v4, "setTag:", 0);
  -[TouchResponseViewController checkIfAllViewsHaveBeenTouched](self, "checkIfAllViewsHaveBeenTouched");
}

- (void)checkIfAllViewsHaveBeenTouched
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C54;
  block[3] = &unk_100008260;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cleanUp
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController timeoutTimer](self, "timeoutTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v4, "invalidate");

    -[TouchResponseViewController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController inputs](self, "inputs"));
  v6 = objc_msgSend(v5, "connectedToPowerRequired");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController device](self, "device"));
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
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id obj;
  id obja;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[6];
  _QWORD v67[6];
  _QWORD v68[4];
  _QWORD v69[4];
  _BYTE v70[128];

  v4 = a3;
  if (!-[TouchResponseViewController testFinished](self, "testFinished"))
  {
    -[TouchResponseViewController setTestFinished:](self, "setTestFinished:", 1);
    -[TouchResponseViewController cleanUp](self, "cleanUp");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController result](self, "result"));
    objc_msgSend(v5, "setStatusCode:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController result](self, "result"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusCode"));
    v8 = objc_msgSend(v7, "isEqualToNumber:", &off_1000086E0);

    if (v8)
    {
      v9 = DiagnosticLogHandleForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100005B28(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_8:

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController result](self, "result"));
      objc_msgSend(v29, "setData:", &__NSDictionary0__struct);

      -[TouchResponseViewController setFinished:](self, "setFinished:", 1);
      goto LABEL_19;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController result](self, "result"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "statusCode"));
    v20 = objc_msgSend(v19, "isEqualToNumber:", &off_1000086B0);

    if (v20)
    {
      v21 = DiagnosticLogHandleForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100005B5C(v10, v22, v23, v24, v25, v26, v27, v28);
      goto LABEL_8;
    }
    v55 = v4;
    v59 = objc_alloc_init((Class)NSMutableArray);
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController touchRegions](self, "touchRegions"));
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v34, "tag") == (id)1)
          {
            v68[0] = CFSTR("xPos");
            objc_msgSend(v34, "frame");
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            v69[0] = v35;
            v68[1] = CFSTR("yPos");
            objc_msgSend(v34, "frame");
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v36));
            v69[1] = v37;
            v68[2] = CFSTR("width");
            objc_msgSend(v34, "frame");
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v38));
            v69[2] = v39;
            v68[3] = CFSTR("height");
            objc_msgSend(v34, "frame");
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40));
            v69[3] = v41;
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 4));
            objc_msgSend(v59, "addObject:", v42);

          }
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v31);
    }

    v66[0] = CFSTR("displayResX");
    obja = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(obja, "bounds");
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v43));
    v67[0] = v58;
    v66[1] = CFSTR("displayResY");
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v57, "bounds");
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v44));
    v67[1] = v56;
    v67[2] = v59;
    v66[2] = CFSTR("missedRegions");
    v66[3] = CFSTR("isCharging");
    v45 = objc_alloc((Class)NSNumber);
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController multiTouchHelper](self, "multiTouchHelper"));
    v46 = objc_msgSend(v45, "initWithBool:", objc_msgSend(v54, "isBatteryCharging"));
    v67[3] = v46;
    v66[4] = CFSTR("isPluggedIntoPower");
    v47 = objc_alloc((Class)NSNumber);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController multiTouchHelper](self, "multiTouchHelper"));
    v49 = objc_msgSend(v47, "initWithBool:", objc_msgSend(v48, "isPowerConnected"));
    v67[4] = v49;
    v66[5] = CFSTR("temperatureData");
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController multiTouchHelper](self, "multiTouchHelper"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "temperatureData"));
    v67[5] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 6));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController result](self, "result"));
    objc_msgSend(v53, "setData:", v52);

    -[TouchResponseViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "finish", 0, 0.5);
    v4 = v55;
  }
LABEL_19:

}

- (void)finish
{
  -[TouchResponseViewController setFinished:](self, "setFinished:", 1);
}

- (void)batteryStateChanged
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController device](self, "device"));
  if (objc_msgSend(v3, "batteryState") == (id)1)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchResponseViewController device](self, "device"));
    v5 = objc_msgSend(v4, "batteryState");

    if (v5)
      return;
  }
  -[TouchResponseViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_1000086B0);
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

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (BOOL)testFinished
{
  return self->_testFinished;
}

- (void)setTestFinished:(BOOL)a3
{
  self->_testFinished = a3;
}

- (NSMutableArray)touchRegions
{
  return self->_touchRegions;
}

- (void)setTouchRegions:(id)a3
{
  objc_storeStrong((id *)&self->_touchRegions, a3);
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

- (TouchResponseInputs)inputs
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
  objc_storeStrong((id *)&self->_touchRegions, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
