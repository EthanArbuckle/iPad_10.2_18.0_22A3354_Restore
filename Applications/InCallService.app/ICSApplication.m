@implementation ICSApplication

+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch
{
  return 0;
}

- (void)sendEvent:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICSApplication;
  -[ICSApplication sendEvent:](&v7, "sendEvent:", v4);
  if (!objc_msgSend(v4, "type"))
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

  }
}

- (BOOL)_supportsAlwaysOnDisplay
{
  return 1;
}

- (unint64_t)beginBackgroundTaskWithExpirationHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = objc_opt_class(self, v7);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ beginBackgroundTaskWithExpirationHandler", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)ICSApplication;
  v8 = -[ICSApplication beginBackgroundTaskWithExpirationHandler:](&v10, "beginBackgroundTaskWithExpirationHandler:", v4);

  return (unint64_t)v8;
}

- (unint64_t)beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = objc_opt_class(self, v10);
    v16 = 2114;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ beginBackgroundTaskWithName:expirationHandler %{public}@", buf, 0x16u);
  }

  v13.receiver = self;
  v13.super_class = (Class)ICSApplication;
  v11 = -[ICSApplication beginBackgroundTaskWithName:expirationHandler:](&v13, "beginBackgroundTaskWithName:expirationHandler:", v6, v7);

  return (unint64_t)v11;
}

- (void)endBackgroundTask:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  unint64_t v12;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = objc_opt_class(self, v7);
    v11 = 2048;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ endBackgroundTask %lu", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)ICSApplication;
  -[ICSApplication endBackgroundTask:](&v8, "endBackgroundTask:", a3);
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  unsigned __int8 v10;
  BOOL v11;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Asked to run testName: %@ with options: %@", buf, 0x16u);
  }

  -[ICSApplication setUpTestNamed:](self, "setUpTestNamed:", v6);
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PlaceOutgoingCall")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("FaceTimePlaceOutgoingCall")))
  {
    v10 = -[ICSApplication runOutgoingCallTestWithOptions:](self, "runOutgoingCallTestWithOptions:", v7);
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("AnswerIncomingCall")) & 1) != 0
         || objc_msgSend(v6, "isEqualToString:", CFSTR("FaceTimeAnswerIncomingCall")))
  {
    v10 = -[ICSApplication runIncomingCallTestWithOptions:](self, "runIncomingCallTestWithOptions:", v7);
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("FaceTimeEndActiveCall")) & 1) != 0
         || objc_msgSend(v6, "isEqualToString:", CFSTR("EndActiveCall")))
  {
    v10 = -[ICSApplication runEndCallTestWithOptions:](self, "runEndCallTestWithOptions:", v7);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("FaceTimeSwapCamera")))
  {
    v10 = -[ICSApplication runSwapCameraTestWithOptions:](self, "runSwapCameraTestWithOptions:", v7);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICSApplication;
    v10 = -[ICSApplication runTest:options:](&v13, "runTest:options:", v6, v7);
  }
  v11 = v10;

  return v11;
}

- (void)setUpTestNamed:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&qword_1002E2CB0, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleCallStatusChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "handleCallStatusChangedNotification:", TUCallCenterVideoCallStatusChangedNotification, 0);

}

- (void)handleCallStatusChangedNotification:(id)a3
{
  id v3;

  if (qword_1002E2CB8)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
    (*(void (**)(uint64_t, id))(qword_1002E2CB8 + 16))(qword_1002E2CB8, v3);

  }
}

- (BOOL)currentTestIsFaceTime
{
  return objc_msgSend((id)qword_1002E2CB0, "hasPrefix:", CFSTR("FaceTime"));
}

- (id)pptOutgoingDialRequestWithDestinationID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "providerManager"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superboxProvider"));
    if (-[ICSApplication currentTestIsFaceTime](self, "currentTestIsFaceTime") || v8)
      v9 = v8;
    else
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "telephonyProvider"));
    v11 = v9;
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithProvider:", v9);
      objc_msgSend(v10, "setHandle:", v5);
      objc_msgSend(v10, "setVideo:", -[ICSApplication currentTestIsFaceTime](self, "currentTestIsFaceTime"));
    }
    else
    {
      v12 = qword_1002E2CB0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not create a call provider using the call provider manager %@."), v7));
      -[ICSApplication failedTest:withFailure:](self, "failedTest:withFailure:", v12, v13);

      v10 = 0;
    }

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid destination ID: %@.  Did you remember to set the defaults?"), v4));

    -[ICSApplication failedTest:withFailure:](self, "failedTest:withFailure:", qword_1002E2CB0, v5);
    v10 = 0;
  }

  return v10;
}

- (BOOL)runOutgoingCallTestWithOptions:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v14;

  v4 = -[ICSApplication currentTestIsFaceTime](self, "currentTestIsFaceTime", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
  v6 = v5;
  if ((v4 & 1) != 0)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pptOutgoingFaceTimeCallHandleValue"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pptOutgoingCallHandleValue"));
  v8 = (void *)v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplication pptOutgoingDialRequestWithDestinationID:](self, "pptOutgoingDialRequestWithDestinationID:", v8));
  -[ICSApplication startedTest:](self, "startedTest:", qword_1002E2CB0);
  -[ICSApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("end-to-end"), qword_1002E2CB0);
  v10 = qword_1002E2CB0;
  v14 = CFSTR("time");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  -[ICSApplication startedSubTest:forTest:withMetrics:](self, "startedSubTest:forTest:withMetrics:", CFSTR("applicationOpenURL"), v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  objc_msgSend(v12, "launchAppForDialRequest:completion:", v9, 0);

  return 1;
}

- (BOOL)runIncomingCallTestWithOptions:(id)a3
{
  _QWORD *v4;
  void *v5;
  const char *v6;
  _QWORD v8[5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FE9A4;
  v8[3] = &unk_100287F98;
  v8[4] = self;
  v4 = objc_retainBlock(v8);
  v5 = (void *)qword_1002E2CB8;
  qword_1002E2CB8 = (uint64_t)v4;

  -[ICSApplication startedTest:](self, "startedTest:", qword_1002E2CB0);
  -[ICSApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("AwaitIncomingCall"), qword_1002E2CB0);
  if (-[ICSApplication currentTestIsFaceTime](self, "currentTestIsFaceTime"))
    v6 = "triggerIncomingSuperboxVideoCall";
  else
    v6 = "triggerIncomingSuperboxAudioCall";
  notify_post(v6);
  return 1;
}

- (BOOL)runEndCallTestWithOptions:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[ICSApplication currentTestIsFaceTime](self, "currentTestIsFaceTime", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
  v6 = v5;
  if ((v4 & 1) != 0)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pptOutgoingFaceTimeCallHandleValue"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pptOutgoingCallHandleValue"));
  v8 = (void *)v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplication pptOutgoingDialRequestWithDestinationID:](self, "pptOutgoingDialRequestWithDestinationID:", v8));
  -[ICSApplication startedTest:](self, "startedTest:", qword_1002E2CB0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  objc_msgSend(v10, "launchAppForDialRequest:completion:", v9, 0);

  return 1;
}

- (BOOL)runSwapCameraTestWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pptOutgoingFaceTimeCallHandleValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSApplication pptOutgoingDialRequestWithDestinationID:](self, "pptOutgoingDialRequestWithDestinationID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
    objc_msgSend(v8, "openURL:withCompletionHandler:", v9, 0);

    -[ICSApplication startedTest:](self, "startedTest:", qword_1002E2CB0);
  }

  return 1;
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  if ((objc_msgSend(UIApp, "isRunningTest:", CFSTR("AnswerIncomingCall"), a4) & 1) != 0
    || objc_msgSend(UIApp, "isRunningTest:", CFSTR("FaceTimeAnswerIncomingCall")))
  {
    -[ICSApplication failedTest:withFailure:](self, "failedTest:withFailure:", qword_1002E2CB0, CFSTR("Connection Error"));
  }
}

@end
