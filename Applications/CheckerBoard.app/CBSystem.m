@implementation CBSystem

- (CBSystem)init
{
  CBSystem *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  CBWiFiManager *wifiManager;
  NSMutableDictionary *v7;
  NSMutableDictionary *shutdownTasks;
  BSInvalidatable *touchSensitiveButtonEnabledAssertion;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CBSystem;
  v2 = -[CBSystem init](&v12, "init");
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up the system…", v11, 2u);
    }

    v5 = objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
    wifiManager = v2->_wifiManager;
    v2->_wifiManager = (CBWiFiManager *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    shutdownTasks = v2->_shutdownTasks;
    v2->_shutdownTasks = v7;

    touchSensitiveButtonEnabledAssertion = v2->_touchSensitiveButtonEnabledAssertion;
    v2->_touchSensitiveButtonEnabledAssertion = 0;

  }
  return v2;
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enabling CheckerBoard services…", buf, 2u);
  }

  if (+[CBUtilities isInternalInstall](CBUtilities, "isInternalInstall"))
  {
    v5 = CheckerBoardLogHandleForCategory(1);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unsetting default…", v12, 2u);
    }

    +[CBInternalSettings setPreferencesValue:key:domain:](CBInternalSettings, "setPreferencesValue:key:domain:", &__kCFBooleanFalse, CFSTR("LaunchCheckerBoard"), CFSTR("com.apple.CheckerBoard"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBShellServer sharedInstance](CBShellServer, "sharedInstance"));
  v8 = +[CBAppManager sharedInstance](CBAppManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBIdleSleepManager sharedInstance](CBIdleSleepManager, "sharedInstance"));
  objc_msgSend(v9, "enableIdleSleep");

  v10 = +[CBStatusBarStateAggregator sharedInstance](CBStatusBarStateAggregator, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBThermalManager sharedInstance](CBThermalManager, "sharedInstance"));
  objc_msgSend(v11, "startListeningForThermalEvents");

  objc_msgSend(v7, "setSystemServicesDelegate:", self);
  objc_msgSend(v7, "start");
  -[CBSystem _registerForNotifications](self, "_registerForNotifications");
  -[CBSystem _startInactivityTimer](self, "_startInactivityTimer");

}

+ (void)checkoutAndReboot:(BOOL)a3 userInitiated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[4];
  BOOL v17;
  uint8_t buf[4];
  _BOOL4 v19;

  v4 = a4;
  v5 = a3;
  v6 = CheckerBoardLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CheckerBoard is checking out and will reboot (%d)", buf, 8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SystemWillReboot"), 0);

  +[CBSystem _checkOutUserSettings](CBSystem, "_checkOutUserSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBBootIntentManager sharedInstance](CBBootIntentManager, "sharedInstance"));
  objc_msgSend(v9, "deleteBootIntentSourceData");

  if (v4)
    +[CBSNVRamUtil clearNVRamVariable:](CBSNVRamUtil, "clearNVRamVariable:", CFSTR("boot-command"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100031784;
  v16[3] = &unk_100076358;
  v17 = v5;
  v10 = objc_retainBlock(v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBRemoteSetupManager sharedInstance](CBRemoteSetupManager, "sharedInstance"));
  v12 = v11;
  if (v11 && (unint64_t)objc_msgSend(v11, "setupState") >= 2)
  {
    objc_msgSend(v12, "endRemoteSetupBroadcast");
    v13 = dispatch_time(0, 1000000000);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000317FC;
    v14[3] = &unk_100075AE0;
    v15 = v10;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);

  }
  else
  {
    ((void (*)(_QWORD *))v10[2])(v10);
  }

}

+ (void)_checkOutUserSettings
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  _QWORD *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v2 = CheckerBoardLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking out and resetting back to user's settings…", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100031904;
  v6[3] = &unk_1000753E8;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[CBUserSettings sharedInstance](CBUserSettings, "sharedInstance"));
  v7 = v4;
  v5 = objc_retainBlock(v6);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v5[2])(v5);
  else
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)exitRequestedWithServer:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Exiting CheckerBoard", v5, 2u);
  }

  +[CBSystem checkoutAndReboot:userInitiated:](CBSystem, "checkoutAndReboot:userInitiated:", 1, 0);
}

- (id)proxyServer
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  v2 = CheckerBoardLogHandleForCategory(11);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Get proxyServer.", v7, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUserSettings sharedInstance](CBUserSettings, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "proxyServer"));

  return v5;
}

- (void)showSceneStatusBar
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CBSceneManager sharedInstance](CBSceneManager, "sharedInstance"));
  objc_msgSend(v2, "showSceneStatusBar");

}

- (void)hideSceneStatusBar
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CBSceneManager sharedInstance](CBSceneManager, "sharedInstance"));
  objc_msgSend(v2, "hideSceneStatusBar");

}

- (void)statusBarStyle:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CBSceneManager sharedInstance](CBSceneManager, "sharedInstance"));
  objc_msgSend(v4, "statusBarStyle:", a3);

}

- (void)dimDisplay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CBIdleSleepManager sharedInstance](CBIdleSleepManager, "sharedInstance"));
  objc_msgSend(v2, "dimDisplay");

}

- (void)undimDisplay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CBIdleSleepManager sharedInstance](CBIdleSleepManager, "sharedInstance"));
  objc_msgSend(v2, "undimDisplay");

}

- (void)enableTouchButtonEvents
{
  uint64_t v3;
  id v4;

  -[CBSystem disableTouchButtonEvents](self, "disableTouchButtonEvents");
  v3 = BKSHIDTouchSensitiveButtonRequestScanMode(1, 1, CFSTR("com.apple.CheckerBoard"));
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[CBSystem setTouchSensitiveButtonEnabledAssertion:](self, "setTouchSensitiveButtonEnabledAssertion:", v4);

}

- (void)disableTouchButtonEvents
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem touchSensitiveButtonEnabledAssertion](self, "touchSensitiveButtonEnabledAssertion"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem touchSensitiveButtonEnabledAssertion](self, "touchSensitiveButtonEnabledAssertion"));
    objc_msgSend(v4, "invalidate");

    -[CBSystem setTouchSensitiveButtonEnabledAssertion:](self, "setTouchSensitiveButtonEnabledAssertion:", 0);
  }
}

- (void)addShutdownTask:(id)a3 forReason:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = objc_retainBlock(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem shutdownTasks](self, "shutdownTasks"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)removeShutdownTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem shutdownTasks](self, "shutdownTasks"));
  objc_msgSend(v5, "removeObjectForKey:", v4);

  v7 = objc_claimAutoreleasedReturnValue(-[CBSystem shutdownTasks](self, "shutdownTasks"));
  if (!-[NSObject count](v7, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem shutdownTasksPendingSemaphore](self, "shutdownTasksPendingSemaphore"));

    if (!v6)
      return;
    v7 = objc_claimAutoreleasedReturnValue(-[CBSystem shutdownTasksPendingSemaphore](self, "shutdownTasksPendingSemaphore"));
    dispatch_semaphore_signal(v7);
  }

}

- (void)disableNetworkReconnect
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  objc_msgSend(v2, "setAttemptsNetworkReconnect:", 0);

}

- (void)enableNetworkReconnect
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  objc_msgSend(v2, "setAttemptsNetworkReconnect:", 1);

}

- (void)launchDiagnostics
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "launchDiagnosticsApp");
    v3 = v4;
  }

}

- (void)diagnosticsRunning:(id)a3
{
  void (**v3)(id, id);
  void *v4;
  id v5;

  v3 = (void (**)(id, id))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBAppManager sharedInstance](CBAppManager, "sharedInstance"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentOpenAppBundleIDs"));

  v3[2](v3, objc_msgSend(v5, "containsObject:", CFSTR("com.apple.Diagnostics")));
}

- (void)connectToSSID:(id)a3 completion:(id)a4
{
  -[CBSystem _connectToSSID:password:completion:](self, "_connectToSSID:password:completion:", a3, 0, a4);
}

- (void)connectToSSID:(id)a3 password:(id)a4 completion:(id)a5
{
  -[CBSystem _connectToSSID:password:completion:](self, "_connectToSSID:password:completion:", a3, a4, a5);
}

- (void)_connectToSSID:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint8_t buf[16];
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  id v35;
  id location;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[5];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v8 = a3;
  v9 = a4;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_1000322AC;
  v57 = sub_1000322BC;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_1000322AC;
  v51 = sub_1000322BC;
  v52 = 0;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000322C4;
  v43[3] = &unk_100076380;
  v45 = &v53;
  v46 = &v47;
  v29 = a5;
  v43[4] = self;
  v44 = v29;
  v10 = objc_retainBlock(v43);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("CBWiFiManagerDidAssociateToEncryptedNetworkNotification"), 0, v12, v10));
  v14 = (void *)v54[5];
  v54[5] = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", CFSTR("CBWiFiManagerDidAssociateToOpenNetworkNotification"), 0, v16, v10));
  v18 = (void *)v48[5];
  v48[5] = v17;

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1000322AC;
  v41 = sub_1000322BC;
  v42 = 0;
  objc_initWeak(&location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100032458;
  v31[3] = &unk_1000763A8;
  v34 = &v37;
  objc_copyWeak(&v35, &location);
  v19 = v8;
  v32 = v19;
  v20 = v9;
  v33 = v20;
  v21 = objc_retainBlock(v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", CFSTR("CBWiFiNetworkScanCompletedNotification"), 0, v23, v21));
  v25 = (void *)v38[5];
  v38[5] = v24;

  v26 = CheckerBoardLogHandleForCategory(8);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Starting network scan for CBSystem as part of network association attempt", buf, 2u);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  objc_msgSend(v28, "startWiFiNetworkScanRequestFrom:", self);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

}

- (void)networkScanWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1000322AC;
  v24 = sub_1000322BC;
  v25 = 0;
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003295C;
  v15[3] = &unk_1000763D0;
  v17 = &v20;
  objc_copyWeak(&v18, &location);
  v5 = v4;
  v16 = v5;
  v6 = objc_retainBlock(v15);
  v7 = CheckerBoardLogHandleForCategory(8);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting network scan for CBSystem (without association)", v14, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", CFSTR("CBWiFiNetworkScanCompletedNotification"), 0, v10, v6));
  v12 = (void *)v21[5];
  v21[5] = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  objc_msgSend(v13, "startWiFiNetworkScanRequestFrom:", self);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

}

- (void)connectedNetwork:(id)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "isAssociatedToNetwork");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentNetworkSSID"));
    v7[2](v7, v6);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)displayDimmed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[CBIdleSleepManager sharedInstance](CBIdleSleepManager, "sharedInstance"));
  (*((void (**)(id, id))a3 + 2))(v4, objc_msgSend(v5, "isDisplayDim"));

}

- (void)networkReconnectEnabled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  (*((void (**)(id, id))a3 + 2))(v4, objc_msgSend(v5, "attemptsNetworkReconnect"));

}

- (void)currentLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localeIdentifier"));
  (*((void (**)(id, void *))a3 + 2))(v4, v5);

}

- (void)setLocaleIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBLocationController sharedLocationController](CBLocationController, "sharedLocationController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100032E74;
  v9[3] = &unk_100075AE0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "selectLanguage:restartAfterCompletion:", v6, v9);

}

- (void)_registerForNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering for notifications…", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_stopInactivityTimer:", CFSTR("CBEndGameViewControllerLaunchingDiagnosticsNotification"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_runShutdownImminentCompletions", CFSTR("SystemWillReboot"), 0);

}

- (void)_deregisterNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deregistering notifications…", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("CBEndGameViewControllerLaunchingDiagnosticsNotification"), 0);

}

- (void)_stopInactivityTimer:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stop inactivity timer notification sent", v6, 2u);
  }

  -[CBSystem _stopInactivityTimer](self, "_stopInactivityTimer");
}

- (void)_startInactivityTimer
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem inactivityTimer](self, "inactivityTimer"));

  if (!v3)
  {
    v4 = CheckerBoardLogHandleForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting inactivity timer…", v12, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v6, 300.0));

    v8 = objc_msgSend(objc_alloc((Class)PCPersistentTimer), "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v7, CFSTR("com.apple.CheckerBoard.inactivitytimer"), self, "_inactivityTimerFired:", 0);
    -[CBSystem setInactivityTimer:](self, "setInactivityTimer:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem inactivityTimer](self, "inactivityTimer"));
    objc_msgSend(v9, "setMinimumEarlyFireProportion:", 1.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem inactivityTimer](self, "inactivityTimer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v10, "scheduleInRunLoop:", v11);

  }
}

- (void)_stopInactivityTimer
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  -[CBSystem _deregisterNotifications](self, "_deregisterNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem inactivityTimer](self, "inactivityTimer"));

  if (v3)
  {
    v4 = CheckerBoardLogHandleForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating inactivity timer…", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem inactivityTimer](self, "inactivityTimer"));
    objc_msgSend(v6, "invalidate");

    -[CBSystem setInactivityTimer:](self, "setInactivityTimer:", 0);
  }
}

- (void)_inactivityTimerFired:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CheckerBoardLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Inactivity timeout fired…", v6, 2u);
  }

  -[CBSystem _stopInactivityTimer](self, "_stopInactivityTimer");
  +[CBSystem checkoutAndReboot:userInitiated:](CBSystem, "checkoutAndReboot:userInitiated:", 1, 0);
}

- (void)_runShutdownImminentCompletions
{
  void *v3;
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void (**v15)(void);
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem shutdownTasks](self, "shutdownTasks"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = dispatch_semaphore_create(0);
    -[CBSystem setShutdownTasksPendingSemaphore:](self, "setShutdownTasksPendingSemaphore:", v5);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem shutdownTasks](self, "shutdownTasks"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v12 = CheckerBoardLogHandleForCategory(1);
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Running shutdown imminent completion for reason %@", buf, 0xCu);
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBSystem shutdownTasks](self, "shutdownTasks"));
          v15 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v11));
          v15[2]();

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v8);
    }

    v16 = objc_claimAutoreleasedReturnValue(-[CBSystem shutdownTasksPendingSemaphore](self, "shutdownTasksPendingSemaphore"));
    v17 = dispatch_time(0, 5000000000);
    v18 = dispatch_semaphore_wait(v16, v17);

    if (v18)
    {
      v19 = CheckerBoardLogHandleForCategory(1);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100045C6C(v20);

    }
  }
}

- (CBWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (PCPersistentTimer)inactivityTimer
{
  return self->_inactivityTimer;
}

- (void)setInactivityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_inactivityTimer, a3);
}

- (NSMutableDictionary)shutdownTasks
{
  return self->_shutdownTasks;
}

- (void)setShutdownTasks:(id)a3
{
  objc_storeStrong((id *)&self->_shutdownTasks, a3);
}

- (OS_dispatch_semaphore)shutdownTasksPendingSemaphore
{
  return self->_shutdownTasksPendingSemaphore;
}

- (void)setShutdownTasksPendingSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_shutdownTasksPendingSemaphore, a3);
}

- (BSInvalidatable)touchSensitiveButtonEnabledAssertion
{
  return self->_touchSensitiveButtonEnabledAssertion;
}

- (void)setTouchSensitiveButtonEnabledAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_touchSensitiveButtonEnabledAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchSensitiveButtonEnabledAssertion, 0);
  objc_storeStrong((id *)&self->_shutdownTasksPendingSemaphore, 0);
  objc_storeStrong((id *)&self->_shutdownTasks, 0);
  objc_storeStrong((id *)&self->_inactivityTimer, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
}

@end
