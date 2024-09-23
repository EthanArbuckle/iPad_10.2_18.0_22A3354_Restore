@implementation CBAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  CBSystem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  CBNavigationController *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  CBLocalServiceClient *v24;
  void *v25;
  CBLocalServiceClient *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  dispatch_queue_global_t global_queue;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint8_t v47[16];
  _QWORD v48[5];
  id v49;
  id buf[2];

  v6 = a3;
  v7 = a4;
  v8 = CheckerBoardLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finished launching", (uint8_t *)buf, 2u);
  }

  -[CBAppDelegate _startSystemStatusServer](self, "_startSystemStatusServer");
  objc_msgSend(v6, "_createInitialAppScene");
  v10 = objc_alloc_init(CBSystem);
  -[CBAppDelegate setSystem:](self, "setSystem:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppDelegate system](self, "system"));
  objc_msgSend(v11, "start");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBBootIntentManager sharedInstance](CBBootIntentManager, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bootIntentLocale"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CBBootIntentManager sharedInstance](CBBootIntentManager, "sharedInstance"));
  v15 = objc_msgSend(v14, "isCurrentProcessFirstToReadIntent");

  if (v13 && v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBShellServer sharedInstance](CBShellServer, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "systemServicesDelegate"));
    objc_msgSend(v17, "setLocaleIdentifier:completion:", v13, &stru_1000758D8);

  }
  v18 = +[CBLocationController sharedLocationController](CBLocationController, "sharedLocationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CBOpeningViewController openingViewControllerForBootIntent](CBOpeningViewController, "openingViewControllerForBootIntent"));
  v20 = -[CBNavigationController initWithRootViewController:]([CBNavigationController alloc], "initWithRootViewController:", v19);
  -[CBAppDelegate setMainNavigationController:](self, "setMainNavigationController:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppDelegate mainNavigationController](self, "mainNavigationController"));
  objc_msgSend(v21, "setDelegate:", self);

  v22 = CheckerBoardLogHandleForCategory(11);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Start CBDLocalServiceClient.", (uint8_t *)buf, 2u);
  }

  v24 = [CBLocalServiceClient alloc];
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppDelegate mainNavigationController](self, "mainNavigationController"));
  v26 = -[CBLocalServiceClient initWithMainNavController:](v24, "initWithMainNavController:", v25);
  -[CBAppDelegate setLocalServiceClient:](self, "setLocalServiceClient:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppDelegate localServiceClient](self, "localServiceClient"));
  objc_msgSend(v27, "resume");

  objc_initWeak(buf, self);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[CBAppManager sharedInstance](CBAppManager, "sharedInstance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000175E4;
  v48[3] = &unk_100075900;
  objc_copyWeak(&v49, buf);
  v48[4] = self;
  v31 = objc_msgSend(v28, "addObserverForName:object:queue:usingBlock:", CFSTR("AppManagerPrimaryAppDidExit"), v29, v30, v48);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[BFFStyle sharedStyle](BFFStyle, "sharedStyle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppDelegate mainNavigationController](self, "mainNavigationController"));
  objc_msgSend(v32, "applyThemeToNavigationController:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowManager sharedInstance](CBWindowManager, "sharedInstance"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppDelegate mainNavigationController](self, "mainNavigationController"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "presentViewController:onLayer:backgroundTunnel:statusBarVisible:animated:completion:", v35, 0, 1, 0, 0, 0));
  -[CBAppDelegate setWindow:](self, "setWindow:", v36);

  v37 = +[CBIdleSleepManager sharedInstance](CBIdleSleepManager, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[CBUserSettings sharedInstance](CBUserSettings, "sharedInstance"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppDelegate mainNavigationController](self, "mainNavigationController"));
  objc_msgSend(v38, "applyPostUISettingsFromNvramWithNavigationController:", v39);

  if (+[CBUtilities wasRemoteSetupPerformed](CBUtilities, "wasRemoteSetupPerformed"))
  {
    v40 = CheckerBoardLogHandleForCategory(1);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "CheckerBoard has ran before and completed remote setup. Launching Diagnostics app.", v47, 2u);
    }

    global_queue = dispatch_get_global_queue(0, 0);
    v43 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v43, &stru_100075920);

    -[CBAppDelegate launchDiagnosticsApp](self, "launchDiagnosticsApp");
  }
  v44 = CheckerBoardLogHandleForCategory(1);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v47 = 0;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Resetting media services..", v47, 2u);
  }

  AVResetMediaServices();
  objc_destroyWeak(&v49);
  objc_destroyWeak(buf);

  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resigning active", v5, 2u);
  }

}

- (void)applicationDidEnterBackground:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entered background", v5, 2u);
  }

}

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering foreground", v5, 2u);
  }

}

- (void)applicationDidBecomeActive:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Became active", v5, 2u);
  }

}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Terminating process", v5, 2u);
  }

}

- (void)launchDiagnosticsApp
{
  uint64_t v3;
  NSObject *v4;
  CBEndgameViewController *v5;
  void *v6;
  uint8_t v7[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Launching Diagnostics.", v7, 2u);
  }

  v5 = objc_alloc_init(CBEndgameViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppDelegate mainNavigationController](self, "mainNavigationController"));
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t v24[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v9 = objc_opt_class(v7, v8);
  v11 = objc_opt_class(CBRemoteSetupAuthenticationViewController, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0
    || (v13 = objc_opt_class(v7, v12),
        v15 = objc_opt_class(CBRemoteSetupConfiguringViewController, v14),
        (objc_opt_isKindOfClass(v13, v15) & 1) != 0)
    || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllers")),
        v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject")),
        v17,
        v16,
        v17 != v7))
  {
    v18 = CheckerBoardLogHandleForCategory(1);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Root view controller no longer displayed. Unconfiguring for Remote Setup", v24, 2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllers"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
    objc_msgSend(v21, "unConfigureForRemoteSetup");

  }
  else
  {
    v22 = CheckerBoardLogHandleForCategory(1);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Root view controller displayed. Configuring forSyst Remote Setup", buf, 2u);
    }

    objc_msgSend(v7, "configureForRemoteSetup");
  }

}

- (void)_startSystemStatusServer
{
  uint64_t v3;
  NSObject *v4;
  STStatusServer *v5;
  STStatusServer *systemStatusServer;
  STDynamicActivityAttributionManager *v7;
  STDynamicActivityAttributionManager *dynamicAttributionManager;
  STDynamicActivityAttributionMonitor *v9;
  STDynamicActivityAttributionMonitor *systemStatusDynamicAttributionMonitor;
  uint64_t v11;
  NSObject *v12;
  CBSensorActivityDataProvider *v13;
  CBSensorActivityDataProvider *sensorActivityDataProvider;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting system status server", buf, 2u);
  }

  v5 = (STStatusServer *)objc_alloc_init((Class)STStatusServer);
  systemStatusServer = self->_systemStatusServer;
  self->_systemStatusServer = v5;

  v7 = (STDynamicActivityAttributionManager *)objc_alloc_init((Class)STDynamicActivityAttributionManager);
  dynamicAttributionManager = self->_dynamicAttributionManager;
  self->_dynamicAttributionManager = v7;

  v9 = (STDynamicActivityAttributionMonitor *)objc_msgSend(objc_alloc((Class)STDynamicActivityAttributionMonitor), "initWithServerHandle:", self->_dynamicAttributionManager);
  systemStatusDynamicAttributionMonitor = self->_systemStatusDynamicAttributionMonitor;
  self->_systemStatusDynamicAttributionMonitor = v9;

  -[STDynamicActivityAttributionMonitor activate](self->_systemStatusDynamicAttributionMonitor, "activate");
  v11 = CheckerBoardLogHandleForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating sensor activity data provider", v15, 2u);
  }

  v13 = -[CBSensorActivityDataProvider initWithSystemStatusServer:]([CBSensorActivityDataProvider alloc], "initWithSystemStatusServer:", self->_systemStatusServer);
  sensorActivityDataProvider = self->_sensorActivityDataProvider;
  self->_sensorActivityDataProvider = v13;

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (STStatusServer)systemStatusServer
{
  return self->_systemStatusServer;
}

- (void)setSystemStatusServer:(id)a3
{
  objc_storeStrong((id *)&self->_systemStatusServer, a3);
}

- (CBSensorActivityDataProvider)sensorActivityDataProvider
{
  return self->_sensorActivityDataProvider;
}

- (CBSystem)system
{
  return self->_system;
}

- (void)setSystem:(id)a3
{
  objc_storeStrong((id *)&self->_system, a3);
}

- (CBNavigationController)mainNavigationController
{
  return self->_mainNavigationController;
}

- (void)setMainNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_mainNavigationController, a3);
}

- (CBLocalServiceClient)localServiceClient
{
  return self->_localServiceClient;
}

- (void)setLocalServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_localServiceClient, a3);
}

- (STDynamicActivityAttributionManager)dynamicAttributionManager
{
  return self->_dynamicAttributionManager;
}

- (void)setDynamicAttributionManager:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicAttributionManager, a3);
}

- (STDynamicActivityAttributionMonitor)systemStatusDynamicAttributionMonitor
{
  return self->_systemStatusDynamicAttributionMonitor;
}

- (void)setSystemStatusDynamicAttributionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemStatusDynamicAttributionMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemStatusDynamicAttributionMonitor, 0);
  objc_storeStrong((id *)&self->_dynamicAttributionManager, 0);
  objc_storeStrong((id *)&self->_localServiceClient, 0);
  objc_storeStrong((id *)&self->_mainNavigationController, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_sensorActivityDataProvider, 0);
  objc_storeStrong((id *)&self->_systemStatusServer, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
