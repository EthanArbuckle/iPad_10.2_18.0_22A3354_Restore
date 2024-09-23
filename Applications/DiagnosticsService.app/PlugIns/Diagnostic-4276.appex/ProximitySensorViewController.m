@implementation ProximitySensorViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  __objc2_class **v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];

  v6 = a4;
  -[ProximitySensorViewController setInputs:](self, "setInputs:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController inputs](self, "inputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downImageFileName"));
  v9 = objc_msgSend(v8, "isEqualToString:", &stru_10000C760);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController inputs](self, "inputs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "downImageFileName"));
    v35 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController downloadImageAsset:withResponder:error:](self, "downloadImageAsset:withResponder:error:", v12, v6, &v35));
    v10 = v35;
    -[ProximitySensorViewController setDownImage:](self, "setDownImage:", v13);

    if (v10)
      -[ProximitySensorViewController finishEarlyWithStatus:](self, "finishEarlyWithStatus:", objc_msgSend(v10, "code"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController inputs](self, "inputs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "upImageFileName"));
  v16 = objc_msgSend(v15, "isEqualToString:", &stru_10000C760);

  if ((v16 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController inputs](self, "inputs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "upImageFileName"));
    v34 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController downloadImageAsset:withResponder:error:](self, "downloadImageAsset:withResponder:error:", v18, v6, &v34));
    v20 = v34;

    -[ProximitySensorViewController setUpImage:](self, "setUpImage:", v19);
    if (v20)
    {
      -[ProximitySensorViewController finishEarlyWithStatus:](self, "finishEarlyWithStatus:", objc_msgSend(v20, "code"));
      v10 = v20;
    }
    else
    {
      v10 = 0;
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[DAOpticalProximityManager sharedInstance](DAOpticalProximityManager, "sharedInstance"));
  v22 = objc_msgSend(v21, "opticalSensorPresent");

  v23 = v22 ^ 1;
  v24 = off_10000C130;
  if (v22)
    v24 = &off_10000C138;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v24, "sharedInstance"));
  -[ProximitySensorViewController setProximityManager:](self, "setProximityManager:", v25);

  -[ProximitySensorViewController setSensorType:](self, "setSensorType:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  LODWORD(v25) = objc_msgSend(v26, "testAutomationEnabled");

  if ((_DWORD)v25)
  {
    v36[0] = CFSTR("noInputTimeout");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController inputs](self, "inputs"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "noInputTimeout"));
    v29 = numberOrNull(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v37[0] = v30;
    v36[1] = CFSTR("holdTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController inputs](self, "inputs"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "holdTime"));
    v37[1] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
    +[DSTestAutomation postConfiguration:](DSTestAutomation, "postConfiguration:", v33);

  }
  -[ProximitySensorViewController setupUI](self, "setupUI");

}

- (id)downloadImageAsset:(id)a3 withResponder:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  dispatch_time_t v16;
  intptr_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  NSErrorUserInfoKey v40;
  const __CFString *v41;

  v8 = a3;
  v9 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_100003FD0;
  v38 = sub_100003FE0;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_100003FD0;
  v32 = sub_100003FE0;
  v33 = 0;
  v10 = dispatch_semaphore_create(0);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100003FE8;
  v23[3] = &unk_10000C4E0;
  v11 = v8;
  v24 = v11;
  v26 = &v34;
  v27 = &v28;
  v12 = v10;
  v25 = v12;
  objc_msgSend(v9, "getAsset:completion:", v11, v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController inputs](self, "inputs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assetDownloadTimeout"));
  objc_msgSend(v14, "doubleValue");
  v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  v17 = dispatch_semaphore_wait(v12, v16);

  if (v17)
  {
    v40 = NSLocalizedDescriptionKey;
    v41 = CFSTR("Timed out downloading image asset.");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v19 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAProximitySensorErrorDomain"), -6, v18));
    v20 = (void *)v29[5];
    v29[5] = v19;

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v29[5]);
  v21 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v21;
}

- (void)start
{
  -[ProximitySensorViewController setTestPhase:](self, "setTestPhase:", 0);
}

- (void)setupUI
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController view](self, "view"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)cleanUp
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;

  -[ProximitySensorViewController stopTimeoutTimer](self, "stopTimeoutTimer");
  -[ProximitySensorViewController stopHoldTimer](self, "stopHoldTimer");
  -[ProximitySensorViewController disableProximitySensor](self, "disableProximitySensor");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController eventMonitor](self, "eventMonitor"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController eventMonitor](self, "eventMonitor"));
    v5 = objc_msgSend(v4, "currentlyMonitoring");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController eventMonitor](self, "eventMonitor"));
      objc_msgSend(v6, "stopMonitoring");

    }
    -[ProximitySensorViewController setEventMonitor:](self, "setEventMonitor:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController proximityManager](self, "proximityManager"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController proximityManager](self, "proximityManager"));
    v9 = objc_msgSend(v8, "isUpdating");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController proximityManager](self, "proximityManager"));
      objc_msgSend(v10, "stopProximitySensorUpdates");

    }
    -[ProximitySensorViewController setProximityManager:](self, "setProximityManager:", 0);
  }
}

- (void)setProximityState:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;

  self->_proximityState = a3;
  if (!-[ProximitySensorViewController timedOut](self, "timedOut"))
  {
    v5 = -[ProximitySensorViewController testPhase](self, "testPhase");
    switch(v5)
    {
      case 2uLL:
        goto LABEL_5;
      case 1uLL:
        if (a3)
          return;
        goto LABEL_8;
      case 0uLL:
LABEL_5:
        if (a3 != 1)
          return;
LABEL_8:
        -[ProximitySensorViewController setTestPhase:](self, "setTestPhase:", (char *)-[ProximitySensorViewController testPhase](self, "testPhase") + 1);
        return;
    }
    v6 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100007234(self);

  }
}

- (void)setTestPhase:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;

  self->_testPhase = a3;
  switch(a3)
  {
    case 0uLL:
      -[ProximitySensorViewController beginTest](self, "beginTest");
      break;
    case 1uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
      v7 = objc_msgSend(v6, "testAutomationEnabled");

      if (v7)
        +[DSTestAutomation postInteractiveTestEvent:info:](DSTestAutomation, "postInteractiveTestEvent:info:", CFSTR("BeganListeningForProximityStateChange"), &off_10000CCA0);
      goto LABEL_11;
    case 2uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
      v9 = objc_msgSend(v8, "testAutomationEnabled");

      if (v9)
        +[DSTestAutomation postInteractiveTestEvent:info:](DSTestAutomation, "postInteractiveTestEvent:info:", CFSTR("BeganListeningForProximityStateChange"), &off_10000CCC8);
LABEL_11:
      -[ProximitySensorViewController resetTimeoutTimer](self, "resetTimeoutTimer");
      -[ProximitySensorViewController showInstructionImageForPhase:animated:](self, "showInstructionImageForPhase:animated:");
      break;
    case 3uLL:
      -[ProximitySensorViewController endTest](self, "endTest");
      -[ProximitySensorViewController hideInstructionImageAnimated:](self, "hideInstructionImageAnimated:", 1);
      break;
    default:
      v4 = DiagnosticLogHandleForCategory(3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1000072B4(self);

      break;
  }
}

- (void)beginTest
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController result](self, "result"));
  objc_msgSend(v3, "setStatusCode:", &off_10000CAB8);

  -[ProximitySensorViewController setTimedOut:](self, "setTimedOut:", 0);
  -[ProximitySensorViewController enableProximitySensor](self, "enableProximitySensor");
  -[ProximitySensorViewController setProximityState:](self, "setProximityState:", 1);
}

- (void)endTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ProximitySensorViewController cleanUp](self, "cleanUp");
  if (!-[ProximitySensorViewController sensorType](self, "sensorType"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController proximityManager](self, "proximityManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sensorData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", -[ProximitySensorViewController actualCloseStateThreshold](self, "actualCloseStateThreshold")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("actualCloseStateThreshold"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController result](self, "result"));
    objc_msgSend(v7, "setData:", v5);

  }
  -[ProximitySensorViewController setFinished:](self, "setFinished:", 1);
}

- (void)finishEarlyWithStatus:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", v4);

  -[ProximitySensorViewController setFinished:](self, "setFinished:", 1);
}

- (void)showAlertWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v6 = a4;
  v7 = a3;
  -[ProximitySensorViewController stopTimeoutTimer](self, "stopTimeoutTimer");
  -[ProximitySensorViewController setTimedOut:](self, "setTimedOut:", 1);
  -[ProximitySensorViewController hideInstructionImageAnimated:](self, "hideInstructionImageAnimated:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v6, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SKIP"), &stru_10000C760, 0));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100004928;
  v16[3] = &unk_10000C508;
  v16[4] = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v16));
  objc_msgSend(v8, "addAction:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RETRY"), &stru_10000C760, 0));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000049F4;
  v15[3] = &unk_10000C508;
  v15[4] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 1, v15));
  objc_msgSend(v8, "addAction:", v14);

  -[ProximitySensorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)enableProximitySensor
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  _QWORD v13[6];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requesting Backboard HID Services to set proximity detection mode to passive.", buf, 2u);
  }

  BKSHIDServicesRequestProximityDetectionMode(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController eventMonitor](self, "eventMonitor"));
  if (v5)
  {

LABEL_6:
    *(_QWORD *)buf = 0;
    v15 = buf;
    v16 = 0x2020000000;
    v17 = 0;
    v17 = -[ProximitySensorViewController proximityState](self, "proximityState");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController proximityManager](self, "proximityManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100004BE0;
    v13[3] = &unk_10000C530;
    v13[4] = self;
    v13[5] = buf;
    v7 = objc_msgSend(v6, "startProximitySensorUpdatesWithHandler:", v13);

    if ((v7 & 1) == 0)
      -[ProximitySensorViewController finishEarlyWithStatus:](self, "finishEarlyWithStatus:", -4);
    _Block_object_dispose(buf, 8);
    return;
  }
  if (-[ProximitySensorViewController sensorType](self, "sensorType"))
    goto LABEL_6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](DAHIDEventMonitor, "sharedInstance"));
  -[ProximitySensorViewController setEventMonitor:](self, "setEventMonitor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController eventMonitor](self, "eventMonitor"));
  objc_msgSend(v9, "setDelegate:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController eventMonitor](self, "eventMonitor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_10000CB18));
  v12 = objc_msgSend(v10, "startMonitoringWithHIDEvents:", v11);

  if ((v12 & 1) == 0)
    -[ProximitySensorViewController finishEarlyWithStatus:](self, "finishEarlyWithStatus:", -3);
}

- (void)disableProximitySensor
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController eventMonitor](self, "eventMonitor"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController eventMonitor](self, "eventMonitor"));
    v5 = objc_msgSend(v4, "currentlyMonitoring");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController eventMonitor](self, "eventMonitor"));
      objc_msgSend(v6, "stopMonitoring");

    }
    -[ProximitySensorViewController setEventMonitor:](self, "setEventMonitor:", 0);
  }
  else if ((id)-[ProximitySensorViewController sensorType](self, "sensorType") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController proximityManager](self, "proximityManager"));
    v8 = objc_msgSend(v7, "isUpdating");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController proximityManager](self, "proximityManager"));
      objc_msgSend(v9, "stopProximitySensorUpdates");

    }
  }
  v10 = DiagnosticLogHandleForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Requesting Backboard HID Services to restore proximity detection mode.", v12, 2u);
  }

  BKSHIDServicesRequestProximityDetectionMode(0);
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue;
  uint64_t v6;

  if (IOHIDEventGetType(a3, a2) == 14)
  {
    IntegerValue = IOHIDEventGetIntegerValue(a3, 917504);
    if (IntegerValue < 1)
    {
      v6 = 1;
    }
    else
    {
      -[ProximitySensorViewController setActualCloseStateThreshold:](self, "setActualCloseStateThreshold:", IntegerValue);
      v6 = 0;
    }
    -[ProximitySensorViewController resetHoldTimerWithProximityState:](self, "resetHoldTimerWithProximityState:", v6);
  }
}

- (void)timeoutOccurred
{
  void *v3;
  id v4;

  -[ProximitySensorViewController disableProximitySensor](self, "disableProximitySensor");
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NO_INPUT_DETECTED"), &stru_10000C760, 0));
  -[ProximitySensorViewController showAlertWithTitle:message:](self, "showAlertWithTitle:message:", v3, 0);

}

- (void)resetTimeoutTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ProximitySensorViewController stopTimeoutTimer](self, "stopTimeoutTimer");
  -[ProximitySensorViewController setTimedOut:](self, "setTimedOut:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController inputs](self, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noInputTimeout"));

  if (v4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController inputs](self, "inputs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noInputTimeout"));
    objc_msgSend(v5, "doubleValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timeoutOccurred", 0, 0));
    -[ProximitySensorViewController setTimeoutTimer:](self, "setTimeoutTimer:", v6);

  }
}

- (void)stopTimeoutTimer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController timeoutTimer](self, "timeoutTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v4, "invalidate");

    -[ProximitySensorViewController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
}

- (void)holdTimerFinished:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[ProximitySensorViewController timedOut](self, "timedOut"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    -[ProximitySensorViewController setProximityState:](self, "setProximityState:", objc_msgSend(v4, "unsignedIntegerValue"));

  }
}

- (void)resetHoldTimerWithProximityState:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000504C;
  v3[3] = &unk_10000C558;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)stopHoldTimer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController holdTimer](self, "holdTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController holdTimer](self, "holdTimer"));
    objc_msgSend(v4, "invalidate");

    -[ProximitySensorViewController setHoldTimer:](self, "setHoldTimer:", 0);
  }
}

- (id)instructionImageForPhase:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;

  if (a3 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController downImage](self, "downImage"));

    if (v7)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController downImage](self, "downImage"));
      goto LABEL_7;
    }
LABEL_8:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v14, "scale");
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v18 = v17;
    if (a3 == 2)
    {
      v19 = CFSTR("up-");
    }
    else
    {
      if (a3 != 1)
      {
        v8 = 0;
        goto LABEL_14;
      }
      v19 = CFSTR("down-");
    }
    objc_msgSend(v17, "appendString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11 * v16));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13 * v16));
    objc_msgSend(v18, "appendFormat:", CFSTR("%@-%@.png"), v20, v21);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v18));
LABEL_14:

    return v8;
  }
  if (a3 != 2)
    goto LABEL_8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController upImage](self, "upImage"));

  if (!v5)
    goto LABEL_8;
  v6 = objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController upImage](self, "upImage"));
LABEL_7:
  v8 = (void *)v6;
  return v8;
}

- (void)showInstructionImageForPhase:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController instructionImageView](self, "instructionImageView"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController instructionImageView](self, "instructionImageView"));
    objc_msgSend(v8, "removeFromSuperview");

    -[ProximitySensorViewController setInstructionImageView:](self, "setInstructionImageView:", 0);
  }
  v9 = objc_alloc((Class)UIImageView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v11 = objc_msgSend(v9, "initWithFrame:");
  -[ProximitySensorViewController setInstructionImageView:](self, "setInstructionImageView:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController instructionImageForPhase:](self, "instructionImageForPhase:", a3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController instructionImageView](self, "instructionImageView"));
  objc_msgSend(v13, "setImage:", v12);

  if (v4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController instructionImageView](self, "instructionImageView"));
    objc_msgSend(v14, "setAlpha:", 0.0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController instructionImageView](self, "instructionImageView"));
    objc_msgSend(v15, "addSubview:", v16);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000054EC;
    v19[3] = &unk_10000C480;
    v19[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v19, 0, 0.25, 0.0);
  }
  else
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController view](self, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController instructionImageView](self, "instructionImageView"));
    objc_msgSend(v18, "addSubview:", v17);

  }
}

- (void)hideInstructionImageAnimated:(BOOL)a3
{
  id v3;
  _QWORD v4[5];

  if (a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000055B4;
    v4[3] = &unk_10000C480;
    v4[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v4, 0, 0.25, 0.0);
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[ProximitySensorViewController instructionImageView](self, "instructionImageView"));
    objc_msgSend(v3, "setAlpha:", 0.0);

  }
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

- (UIImageView)instructionImageView
{
  return self->_instructionImageView;
}

- (void)setInstructionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_instructionImageView, a3);
}

- (UIImage)upImage
{
  return self->_upImage;
}

- (void)setUpImage:(id)a3
{
  objc_storeStrong((id *)&self->_upImage, a3);
}

- (UIImage)downImage
{
  return self->_downImage;
}

- (void)setDownImage:(id)a3
{
  objc_storeStrong((id *)&self->_downImage, a3);
}

- (unint64_t)proximityState
{
  return self->_proximityState;
}

- (unint64_t)testPhase
{
  return self->_testPhase;
}

- (NSTimer)holdTimer
{
  return self->_holdTimer;
}

- (void)setHoldTimer:(id)a3
{
  objc_storeStrong((id *)&self->_holdTimer, a3);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (unint64_t)sensorType
{
  return self->_sensorType;
}

- (void)setSensorType:(unint64_t)a3
{
  self->_sensorType = a3;
}

- (int64_t)actualCloseStateThreshold
{
  return self->_actualCloseStateThreshold;
}

- (void)setActualCloseStateThreshold:(int64_t)a3
{
  self->_actualCloseStateThreshold = a3;
}

- (DAHIDEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_eventMonitor, a3);
}

- (DAProximityManagerProtocol)proximityManager
{
  return self->_proximityManager;
}

- (void)setProximityManager:(id)a3
{
  objc_storeStrong((id *)&self->_proximityManager, a3);
}

- (ProximitySensorInputs)inputs
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
  objc_storeStrong((id *)&self->_proximityManager, 0);
  objc_storeStrong((id *)&self->_eventMonitor, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_holdTimer, 0);
  objc_storeStrong((id *)&self->_downImage, 0);
  objc_storeStrong((id *)&self->_upImage, 0);
  objc_storeStrong((id *)&self->_instructionImageView, 0);
}

@end
