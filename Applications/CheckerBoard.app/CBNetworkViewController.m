@implementation CBNetworkViewController

- (CBNetworkViewController)initWithSetupPresentationTheme:(BOOL)a3
{
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  CBNetworkViewController *v10;
  CBNetworkViewController *v11;
  uint64_t v12;
  CBBootIntentManager *bootIntentManager;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 isPresentedForSetupFlow;
  objc_super v18;
  uint8_t buf[4];
  _BOOL4 v20;

  v5 = MGGetBoolAnswer(CFSTR("wapi"), a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (v5)
    v8 = CFSTR("CHOOSE_WLAN_HEADER");
  else
    v8 = CFSTR("CHOOSE_WIFI_HEADER");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1000769A0, 0));

  v18.receiver = self;
  v18.super_class = (Class)CBNetworkViewController;
  v10 = -[CBNetworkViewController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v18, "initWithTitle:detailText:icon:adoptTableViewScrollView:", v9, 0, 0, 1);
  v11 = v10;
  if (v10)
  {
    v10->_isPresentedForSetupFlow = a3;
    v10->_networkReachable = 0;
    v12 = objc_claimAutoreleasedReturnValue(+[CBBootIntentManager sharedInstance](CBBootIntentManager, "sharedInstance"));
    bootIntentManager = v11->_bootIntentManager;
    v11->_bootIntentManager = (CBBootIntentManager *)v12;

    v11->_networkConnectionInProgress = 0;
    v14 = CheckerBoardLogHandleForCategory(8);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      isPresentedForSetupFlow = v11->_isPresentedForSetupFlow;
      *(_DWORD *)buf = 67109120;
      v20 = isPresentedForSetupFlow;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Initializing Network View Controller with [Next] button (%d)", buf, 8u);
    }

  }
  return v11;
}

- (void)viewDidLoad
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi picker pane loaded", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)CBNetworkViewController;
  -[CBNetworkViewController viewDidLoad](&v6, "viewDidLoad");
  -[CBNetworkViewController setupView](self, "setupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
  -[CBNetworkViewController setWifiManager:](self, "setWifiManager:", v5);

  -[CBNetworkViewController _updatePowerState](self, "_updatePowerState");
  -[CBNetworkViewController _registerForNotifications](self, "_registerForNotifications");
  -[CBNetworkViewController setListDelegate:](self, "setListDelegate:", self);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  CBNetworkListRecord *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CBNetworkListRecord *v18;
  uint8_t v19[16];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CBNetworkViewController;
  -[CBNetworkViewController viewDidAppear:](&v20, "viewDidAppear:", a3);
  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi picker pane did appear. Beginning observation for reachability changes", v19, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CPNetworkObserver sharedNetworkObserver](CPNetworkObserver, "sharedNetworkObserver"));
  objc_msgSend(v6, "addObserver:selector:forHostname:", self, "_reachabilityChanged:", CFSTR("apple.com"));
  v7 = CheckerBoardLogHandleForCategory(8);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing immediate reachability check", v19, 2u);
  }

  if (v6 && objc_msgSend(v6, "isNetworkReachable"))
  {
    v9 = CheckerBoardLogHandleForCategory(8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Network is immediately reachable", v19, 2u);
    }

    -[CBNetworkViewController setNetworkReachable:](self, "setNetworkReachable:", 1);
    -[CBNetworkViewController _enableAndUpdateUI](self, "_enableAndUpdateUI");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController bootIntentManager](self, "bootIntentManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bootIntentWifiSSID"));

  if (v12)
  {
    v13 = [CBNetworkListRecord alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController bootIntentManager](self, "bootIntentManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bootIntentWifiSSID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController bootIntentManager](self, "bootIntentManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bootIntentWifiPassword"));
    v18 = -[CBNetworkListRecord initWithBootIntentSSID:passwordProtected:](v13, "initWithBootIntentSSID:passwordProtected:", v15, v17 != 0);
    -[CBNetworkViewController setTargetNetworkForBootIntent:](self, "setTargetNetworkForBootIntent:", v18);

  }
}

- (void)setupView
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_1000769A0, 0));
  v6 = objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, "backButtonTapped:");
  -[CBNetworkViewController setCustomBackButton:](self, "setCustomBackButton:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController customBackButton](self, "customBackButton"));
  objc_msgSend(v7, "_setShowsBackButtonIndicator:", 1);

  if (-[CBNetworkViewController isPresentedForSetupFlow](self, "isPresentedForSetupFlow"))
  {
    -[CBNetworkViewController showBackButton](self, "showBackButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1000769A0, 0));
    objc_msgSend(v8, "setTitle:forState:", v10, 0);

    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "continueTapped", 64);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController buttonTray](self, "buttonTray"));
    objc_msgSend(v11, "addButton:", v8);

    -[CBNetworkViewController setContinueButton:](self, "setContinueButton:", v8);
    -[CBNetworkViewController enableContinueButton:](self, "enableContinueButton:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000769A0, 0));
    objc_msgSend(v12, "setTitle:forState:", v14, 0);

    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "_presentExitDiagnosticsAlert", 64);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController buttonTray](self, "buttonTray"));
    objc_msgSend(v15, "addButton:", v12);

  }
  else
  {
    -[CBNetworkViewController hideBackButton](self, "hideBackButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1000769A0, 0));
    objc_msgSend(v8, "setTitle:forState:", v17, 0);

    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "doneTapped", 64);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController buttonTray](self, "buttonTray"));
    objc_msgSend(v18, "addButton:", v8);

    -[CBNetworkViewController setContinueButton:](self, "setContinueButton:", v8);
  }

  -[CBNetworkViewController setShowNetworkSettings:](self, "setShowNetworkSettings:", 0);
  -[CBNetworkViewController setSupportsCellularActivation:](self, "setSupportsCellularActivation:", 0);
  -[CBNetworkViewController setShowOtherNetwork:](self, "setShowOtherNetwork:", 1);
  v20 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController tableView](self, "tableView"));
  objc_msgSend(v19, "setBackgroundColor:", v20);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network view controller will appear", buf, 2u);
  }

  -[CBNetworkViewController setNetworkViewControllerVisible:](self, "setNetworkViewControllerVisible:", 1);
  v7.receiver = self;
  v7.super_class = (Class)CBNetworkViewController;
  -[CBNetworkViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  -[CBNetworkViewController cleanUp](self, "cleanUp");
  -[CBNetworkViewController _startNetworkScan](self, "_startNetworkScan");
}

- (void)_startNetworkScan
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController wifiManager](self, "wifiManager"));
  objc_msgSend(v3, "startWiFiNetworkScanRequestFrom:", self);

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi scan started", v6, 2u);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network view controller will disappear", buf, 2u);
  }

  -[CBNetworkViewController setNetworkViewControllerVisible:](self, "setNetworkViewControllerVisible:", 0);
  v7.receiver = self;
  v7.super_class = (Class)CBNetworkViewController;
  -[CBNetworkViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  -[CBNetworkViewController cleanUp](self, "cleanUp");
  -[CBNetworkViewController _deregisterNotifications](self, "_deregisterNotifications");
}

- (void)cleanUp
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up Network View Controller…", v5, 2u);
  }

  -[CBNetworkViewController _stopNetworkScan](self, "_stopNetworkScan");
}

- (void)_stopNetworkScan
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController wifiManager](self, "wifiManager"));
  objc_msgSend(v3, "stopWiFiNetworkScanRequestFrom:", self);

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi scan stopped", v6, 2u);
  }

}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  -[CBNetworkViewController cleanUp](self, "cleanUp");
  v5.receiver = self;
  v5.super_class = (Class)CBNetworkViewController;
  -[CBNetworkViewController dealloc](&v5, "dealloc");
}

- (void)_registerForNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  -[CBNetworkViewController _deregisterNotifications](self, "_deregisterNotifications");
  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering for notifications…", v15, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_updatePowerState", CFSTR("CBWiFiPowerStateDidChangeNotification"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_wifiNetworkScanCompleted", CFSTR("CBWiFiNetworkScanCompletedNotification"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_wifiNetworkAssociationCompleted:", CFSTR("CBWiFiNetworkAssociationCompletedNotification"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_attemptingToAssociateToOpenNetwork:", CFSTR("CBWiFiManagerWillAssociateToOpenNetworkNotification"), 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "_presentOpenNetworkAssociationFailureAlert:", CFSTR("CBWiFiManagerAssociateToOpenNetworkFailedNotification"), 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "_attemptingToAssociateToOpenNetwork:", CFSTR("CBWiFiManagerWillAssociateToEncryptedNetworkNotification"), 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "_startWiFiScan:", CFSTR("CBScreenDidUndimNotification"), 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "_stopWiFiScan:", CFSTR("CBScreenDidDimNotification"), 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "_deregisterNotifications", CFSTR("CBNetworkViewControllerDidAdvanceToNextSceneNotification"), 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", self, "_deregisterNotifications", CFSTR("CBNetworkViewControllerWillDismissFromDoneButtonNotification"), 0);

}

- (void)_deregisterNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
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
  uint8_t v16[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deregistering notifications…", v16, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("CBWiFiPowerStateDidChangeNotification"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("CBWiFiNetworkScanCompletedNotification"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("CBWiFiNetworkAssociationCompletedNotification"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("CBWiFiManagerWillAssociateToOpenNetworkNotification"), 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("CBWiFiManagerAssociateToOpenNetworkFailedNotification"), 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("CBWiFiManagerWillAssociateToEncryptedNetworkNotification"), 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("CBScreenDidUndimNotification"), 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("CBScreenDidDimNotification"), 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("CBNetworkViewControllerDidAdvanceToNextSceneNotification"), 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "removeObserver:name:object:", self, CFSTR("CBNetworkViewControllerWillDismissFromDoneButtonNotification"), 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CPNetworkObserver sharedNetworkObserver](CPNetworkObserver, "sharedNetworkObserver"));
  objc_msgSend(v15, "removeObserver:forHostname:", self, CFSTR("apple.com"));

}

- (void)_updatePowerState
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController wifiManager](self, "wifiManager"));
  v3 = objc_msgSend(v2, "isWiFiPoweredOn");

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v10 = 0;
      v7 = "Wi-Fi is on";
      v8 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else if (v6)
  {
    v9 = 0;
    v7 = "Wi-Fi is off…";
    v8 = (uint8_t *)&v9;
    goto LABEL_6;
  }

}

- (void)_wifiNetworkScanCompleted
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100013A98;
  v2[3] = &unk_100075510;
  objc_copyWeak(&v3, &location);
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_wifiNetworkAssociationCompleted:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Wi-Fi network association completed notification sent", (uint8_t *)&v18, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController otherNetworkWindow](self, "otherNetworkWindow"));
  if (v7)
  {
    v8 = CheckerBoardLogHandleForCategory(8);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Dismissing Alternate Network View Controller…", (uint8_t *)&v18, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController otherNetworkWindow](self, "otherNetworkWindow"));
    objc_msgSend(v10, "dismissViewControllerAnimated:", 1);

    -[CBNetworkViewController setOtherNetworkWindow:](self, "setOtherNetworkWindow:", 0);
  }
  -[CBNetworkViewController _disableUIAndDisplaySpinnerBarItem](self, "_disableUIAndDisplaySpinnerBarItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CBWiFiManagerErrorKey")));
  v13 = CheckerBoardLogHandleForCategory(8);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Association completed with error (%@)", (uint8_t *)&v18, 0xCu);
  }

  if (v12)
  {
    -[CBNetworkViewController _enableAndUpdateUI](self, "_enableAndUpdateUI");
  }
  else
  {
    v15 = CheckerBoardLogHandleForCategory(8);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Starting Wi-Fi timeout timer…", (uint8_t *)&v18, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_wifiTimeoutFired:", 0, 0, 20.0));
    -[CBNetworkViewController setWifiTimeoutTimer:](self, "setWifiTimeoutTimer:", v17);

  }
}

- (void)_attemptingToAssociateToOpenNetwork:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("CBWiFiManagerWillAssociateToEncryptedNetworkNotification"))&& (v5 = objc_claimAutoreleasedReturnValue(-[CBNetworkViewController targetNetworkForBootIntent](self, "targetNetworkForBootIntent"))) != 0)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController currentNetwork](self, "currentNetwork"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController targetNetworkForBootIntent](self, "targetNetworkForBootIntent"));
    v9 = objc_msgSend(v7, "isEquivalentRecord:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = CheckerBoardLogHandleForCategory(8);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to associate to open network, but the network is encrypted and not a boot intent target. Ignoring", buf, 2u);
      }
      goto LABEL_10;
    }
  }
  else
  {

  }
  -[CBNetworkViewController _disableUIAndDisplaySpinnerBarItem](self, "_disableUIAndDisplaySpinnerBarItem");
  v12 = CheckerBoardLogHandleForCategory(8);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Starting Wi-Fi timeout timer…", v14, 2u);
  }

  v11 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_wifiTimeoutFired:", 0, 0, 20.0));
  -[CBNetworkViewController setWifiTimeoutTimer:](self, "setWifiTimeoutTimer:", v11);
LABEL_10:

}

- (void)_presentOpenNetworkAssociationFailureAlert:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CBNetworkInfoKey")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "networkName"));
  -[CBNetworkViewController _presentOpenNetworkAssociationFailureAlertWithNetworkName:](self, "_presentOpenNetworkAssociationFailureAlertWithNetworkName:", v5);

}

- (void)_presentOpenNetworkAssociationFailureAlertWithNetworkName:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting open network association failure alert…", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_JOIN_NETWORK_TITLE"), &stru_1000769A0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, 0, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DISMISS"), &stru_1000769A0, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 1, 0));
  objc_msgSend(v10, "addAction:", v13);

  -[CBNetworkViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  v14 = objc_claimAutoreleasedReturnValue(-[CBNetworkViewController targetNetworkForBootIntent](self, "targetNetworkForBootIntent"));
  if (v14)
  {
    v15 = (void *)v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController currentNetwork](self, "currentNetwork"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController targetNetworkForBootIntent](self, "targetNetworkForBootIntent"));
    v18 = objc_msgSend(v16, "isEquivalentRecord:", v17);

    if (v18)
    {
      -[CBNetworkViewController setTargetNetworkForBootIntent:](self, "setTargetNetworkForBootIntent:", 0);
      -[CBNetworkViewController setCurrentNetwork:](self, "setCurrentNetwork:", 0);
      -[CBNetworkViewController setCurrentNetworkState:](self, "setCurrentNetworkState:", 0);
      -[CBNetworkViewController reloadNetworkList](self, "reloadNetworkList");
    }
  }

}

- (void)_presentEncryptedNetworkAssociationScene:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting (Enter the password) network scene…", v9, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CBNetworkInfoKey")));
  -[CBNetworkViewController _presentAlternateNetworkViewControllerWithInfo:](self, "_presentAlternateNetworkViewControllerWithInfo:", v8);

}

- (void)_presentExitDiagnosticsAlert
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Exit Diagnostics] button tapped", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
  objc_msgSend(v4, "showExitConfirmationWithCompletion:response:", 0, &stru_100075848);

}

- (void)_startWiFiScan:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  if (-[CBNetworkViewController networkViewControllerVisible](self, "networkViewControllerVisible", a3))
  {
    v4 = CheckerBoardLogHandleForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen undimmed. Starting Wi-Fi scan…", v6, 2u);
    }

    -[CBNetworkViewController _startNetworkScan](self, "_startNetworkScan");
  }
}

- (void)_stopWiFiScan:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  if (-[CBNetworkViewController networkViewControllerVisible](self, "networkViewControllerVisible", a3))
  {
    v4 = CheckerBoardLogHandleForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen dimmed. Stopping Wi-Fi scan…", v6, 2u);
    }

    -[CBNetworkViewController _stopNetworkScan](self, "_stopNetworkScan");
  }
}

- (void)_reachabilityChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _DWORD v18[2];
  __int16 v19;
  _BOOL4 v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CPNetworkObserverReachable));
  -[CBNetworkViewController setNetworkReachable:](self, "setNetworkReachable:", objc_msgSend(v6, "BOOLValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CPNetworkObserverReachableFlags));

  v9 = objc_retainAutorelease(v8);
  v10 = *(_DWORD *)objc_msgSend(v9, "bytes");
  v11 = CheckerBoardLogHandleForCategory(8);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109376;
    v18[1] = -[CBNetworkViewController networkReachable](self, "networkReachable");
    v19 = 1024;
    v20 = ((v10 >> 18) & 1) == 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Network reachability changed (%d) and is connected over Wi-Fi (%d)", (uint8_t *)v18, 0xEu);
  }

  if (-[CBNetworkViewController networkReachable](self, "networkReachable"))
  {
    v13 = CheckerBoardLogHandleForCategory(8);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Network became reachable", (uint8_t *)v18, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController wifiTimeoutTimer](self, "wifiTimeoutTimer"));
    if (v15)
    {
      v16 = CheckerBoardLogHandleForCategory(8);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Wi-Fi timeout timer exists…", (uint8_t *)v18, 2u);
      }

      -[CBNetworkViewController _stopWiFiTimeroutTimer](self, "_stopWiFiTimeroutTimer");
      -[CBNetworkViewController _enableAndUpdateUI](self, "_enableAndUpdateUI");
      -[CBNetworkViewController autoAdvanceToNextScene](self, "autoAdvanceToNextScene");
    }
  }
  else
  {
    -[CBNetworkViewController reevaluateNetworkList](self, "reevaluateNetworkList");
  }

}

- (void)updateNetworkList
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  CBNetworkViewController *v13;
  id v14;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating the network list…", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSMutableSet);
  global_queue = dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100014758;
  v12 = &unk_1000754E8;
  v13 = self;
  v14 = v5;
  v8 = v5;
  dispatch_sync(v7, &v9);

  -[CBNetworkViewController reloadNetworkList](self, "reloadNetworkList", v9, v10, v11, v12, v13);
}

- (void)reloadNetworkList
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reloading the network list…", v5, 2u);
  }

  -[CBNetworkViewController refresh](self, "refresh");
}

- (void)reevaluateNetworkList
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi pane reevaluating network list", v5, 2u);
  }

  -[CBNetworkViewController reloadNetworkList](self, "reloadNetworkList");
  -[CBNetworkViewController setContinueButtonAvailable](self, "setContinueButtonAvailable");
  -[CBNetworkViewController enableContinueButton:](self, "enableContinueButton:", -[CBNetworkViewController networkReachable](self, "networkReachable"));
}

- (void)_disableUIAndDisplaySpinnerBarItem
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabling UI…", v6, 2u);
  }

  -[CBNetworkViewController disableBackButton](self, "disableBackButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  -[CBNetworkViewController setNetworkConnectionInProgress:](self, "setNetworkConnectionInProgress:", 1);
  -[CBNetworkViewController setContinueButtonBusy](self, "setContinueButtonBusy");
}

- (void)_enableAndUpdateUI
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enabling and updating UI…", v6, 2u);
  }

  -[CBNetworkViewController enableBackButton](self, "enableBackButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  -[CBNetworkViewController setNetworkConnectionInProgress:](self, "setNetworkConnectionInProgress:", 0);
  -[CBNetworkViewController reevaluateNetworkList](self, "reevaluateNetworkList");
}

- (void)setContinueButtonBusy
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (-[CBNetworkViewController isPresentedForSetupFlow](self, "isPresentedForSetupFlow"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController continueButton](self, "continueButton"));

    if (v3)
    {
      v4 = CheckerBoardLogHandleForCategory(8);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting continue button to busy", v7, 2u);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController continueButton](self, "continueButton"));
      objc_msgSend(v6, "showsBusyIndicator");

    }
  }
}

- (void)setContinueButtonAvailable
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (-[CBNetworkViewController isPresentedForSetupFlow](self, "isPresentedForSetupFlow"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController continueButton](self, "continueButton"));

    if (v3)
    {
      v4 = CheckerBoardLogHandleForCategory(8);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting continue button to not busy", v7, 2u);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController continueButton](self, "continueButton"));
      objc_msgSend(v6, "hidesBusyIndicator");

    }
  }
}

- (void)enableContinueButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;

  v3 = a3;
  if (-[CBNetworkViewController isPresentedForSetupFlow](self, "isPresentedForSetupFlow"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController continueButton](self, "continueButton"));

    if (v5)
    {
      v6 = CheckerBoardLogHandleForCategory(8);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = CFSTR("disabled");
        if (v3)
          v8 = CFSTR("enabled");
        v10 = 138412290;
        v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Continue button is %@", (uint8_t *)&v10, 0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController continueButton](self, "continueButton"));
      objc_msgSend(v9, "setEnabled:", v3);

    }
  }
}

- (void)_presentAlternateNetworkViewControllerWithInfo:(id)a3
{
  -[CBNetworkViewController _presentAlternateNetworkViewControllerWithInfo:password:ssid:](self, "_presentAlternateNetworkViewControllerWithInfo:password:ssid:", a3, 0, 0);
}

- (void)_presentAlternateNetworkViewControllerWithInfo:(id)a3 password:(id)a4 ssid:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CBAlternateNetworkViewController *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v14 = -[CBAlternateNetworkViewController initWithScanResult:prepopulatedPassword:prepopulatedSSID:]([CBAlternateNetworkViewController alloc], "initWithScanResult:prepopulatedPassword:prepopulatedSSID:", v10, v9, v8);

  v11 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowManager sharedInstance](CBWindowManager, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentViewController:onLayer:backgroundTunnel:statusBarVisible:animated:completion:", v11, 2, 0, 1, 1, &stru_100075868));
  -[CBNetworkViewController setOtherNetworkWindow:](self, "setOtherNetworkWindow:", v13);

}

- (void)_presentWiFiNetworkTimeoutAlert
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Presenting Wi-Fi timeout alert…", v18, 2u);
  }

  v7 = MGGetBoolAnswer(CFSTR("wapi"), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v7)
    v10 = CFSTR("NO_NETWORK_CONNECTION_MESSAGE_WLAN");
  else
    v10 = CFSTR("NO_NETWORK_CONNECTION_MESSAGE_WIFI");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1000769A0, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NO_NETWORK_CONNECTION_TITLE"), &stru_1000769A0, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v11, 1));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000769A0, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 1, 0));
  objc_msgSend(v14, "addAction:", v17);

  -[CBNetworkViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

- (void)_wifiTimeoutFired:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi timeout fired…", v6, 2u);
  }

  -[CBNetworkViewController _stopWiFiTimeroutTimer](self, "_stopWiFiTimeroutTimer");
  -[CBNetworkViewController _enableAndUpdateUI](self, "_enableAndUpdateUI");
  -[CBNetworkViewController _presentWiFiNetworkTimeoutAlert](self, "_presentWiFiNetworkTimeoutAlert");
}

- (void)_stopWiFiTimeroutTimer
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating Wi-Fi timeout timer…", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController wifiTimeoutTimer](self, "wifiTimeoutTimer"));
  objc_msgSend(v5, "invalidate");

  -[CBNetworkViewController setWifiTimeoutTimer:](self, "setWifiTimeoutTimer:", 0);
}

- (void)autoAdvanceToNextScene
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[CBNetworkViewController isPresentedForSetupFlow](self, "isPresentedForSetupFlow"))
  {
    v3 = CheckerBoardLogHandleForCategory(8);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Auto advancing to next pane", v5, 2u);
    }

    -[CBNetworkViewController continueTapped](self, "continueTapped");
  }
}

- (void)continueTapped
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  CBEndgameViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Continue] button tapped", v12, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController currentNetwork](self, "currentNetwork"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController targetNetworkForBootIntent](self, "targetNetworkForBootIntent"));
  if (objc_msgSend(v5, "isEquivalentRecord:", v6))
  {
    v7 = -[CBNetworkViewController networkReachable](self, "networkReachable");

    if ((v7 & 1) == 0)
    {
      v8 = (CBEndgameViewController *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController targetNetworkForBootIntent](self, "targetNetworkForBootIntent"));
      -[CBNetworkViewController networkListViewController:didTapRecord:](self, "networkListViewController:didTapRecord:", self, v8);
      goto LABEL_9;
    }
  }
  else
  {

  }
  v8 = objc_alloc_init(CBEndgameViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController navigationController](self, "navigationController"));
  objc_msgSend(v9, "pushViewController:animated:", v8, 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("CBNetworkViewControllerDidAdvanceToNextSceneNotification"), 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController targetNetworkForBootIntent](self, "targetNetworkForBootIntent"));
  if (v11)
    -[CBNetworkViewController setTargetNetworkForBootIntent:](self, "setTargetNetworkForBootIntent:", 0);
LABEL_9:

}

- (void)doneTapped
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Done] button tapped", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CBNetworkViewControllerWillDismissFromDoneButtonNotification"), 0);

}

- (void)networkListViewController:(id)a3 didTapRecord:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v5 = a4;
  v7 = objc_opt_class(CBNetworkListRecord, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = v5;
    if ((objc_msgSend(v8, "isBootIntentRecord") & 1) != 0
      || (v9 = objc_claimAutoreleasedReturnValue(-[CBNetworkViewController targetNetworkForBootIntent](self, "targetNetworkForBootIntent"))) != 0
      && (v10 = (void *)v9,
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController targetNetworkForBootIntent](self, "targetNetworkForBootIntent")),
          v12 = objc_msgSend(v8, "isEquivalentRecord:", v11),
          v11,
          v10,
          v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController bootIntentManager](self, "bootIntentManager"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bootIntentWifiSSID"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController bootIntentManager](self, "bootIntentManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bootIntentWifiPassword"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController wifiManager](self, "wifiManager"));
      v18 = v17;
      if (v16)
        objc_msgSend(v17, "associateToHiddenEncryptedNetworkWithName:password:", v14, v16);
      else
        objc_msgSend(v17, "associateToHiddenUnencryptedNetworkWithName:", v14);

      goto LABEL_16;
    }
    if (!objc_msgSend(v8, "isSecure"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController wifiManager](self, "wifiManager"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ssid"));
      objc_msgSend(v14, "associateToHiddenUnencryptedNetworkWithName:", v23);

      goto LABEL_16;
    }
    v22 = objc_opt_class(CBNetworkListRecord, v21);
    if ((objc_opt_isKindOfClass(v8, v22) & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scanResult"));
      -[CBNetworkViewController _presentAlternateNetworkViewControllerWithInfo:](self, "_presentAlternateNetworkViewControllerWithInfo:", v14);
LABEL_16:

    }
  }
  else
  {
    v19 = CheckerBoardLogHandleForCategory(8);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      sub_1000453F0(v20);

    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    -[CBNetworkViewController _presentOpenNetworkAssociationFailureAlertWithNetworkName:](self, "_presentOpenNetworkAssociationFailureAlertWithNetworkName:", v8);
  }

}

- (void)networkListViewControllerDidTapOtherNetwork:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Choose Another Network] button tapped", v6, 2u);
  }

  -[CBNetworkViewController _presentAlternateNetworkViewControllerWithInfo:](self, "_presentAlternateNetworkViewControllerWithInfo:", 0);
}

- (BOOL)networkListViewControllerCurrentPowerState:(id)a3
{
  return 1;
}

- (unint64_t)networkListViewControllerCurrentPowerStateToggle:(id)a3
{
  return 1;
}

- (BOOL)networkListViewControllerWAPIEnabled:(id)a3
{
  return MGGetBoolAnswer(CFSTR("wapi"), a2, a3);
}

- (BOOL)networkListViewControllerNetworkRestrictionActive:(id)a3
{
  return 0;
}

- (BOOL)networkListViewControllerLockdownModeActive:(id)a3
{
  return 0;
}

- (int64_t)networkListViewControllerAutoInstantHotspotOption:(id)a3
{
  return 0;
}

- (BOOL)networkListViewControllerPowerModificationDisabled:(id)a3
{
  return 0;
}

- (BOOL)networkListViewControllerIsManagedAppleID:(id)a3
{
  return 0;
}

- (BOOL)networkListViewControllerIsAutoUnlockEnabled:(id)a3
{
  return 0;
}

- (void)backButtonTapped:(id)a3
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController navigationController](self, "navigationController", a3));
  v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)disableBackButton
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController navigationItem](self, "navigationItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leftBarButtonItem"));
  objc_msgSend(v2, "setEnabled:", 0);

}

- (void)enableBackButton
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController navigationItem](self, "navigationItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leftBarButtonItem"));
  objc_msgSend(v2, "setEnabled:", 1);

}

- (void)hideBackButton
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setHidesBackButton:", 1);

}

- (void)showBackButton
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController customBackButton](self, "customBackButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);

}

- (CBWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (CBWindow)otherNetworkWindow
{
  return self->_otherNetworkWindow;
}

- (void)setOtherNetworkWindow:(id)a3
{
  objc_storeStrong((id *)&self->_otherNetworkWindow, a3);
}

- (BOOL)isPresentedForSetupFlow
{
  return self->_isPresentedForSetupFlow;
}

- (void)setIsPresentedForSetupFlow:(BOOL)a3
{
  self->_isPresentedForSetupFlow = a3;
}

- (BOOL)networkViewControllerVisible
{
  return self->_networkViewControllerVisible;
}

- (void)setNetworkViewControllerVisible:(BOOL)a3
{
  self->_networkViewControllerVisible = a3;
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  self->_continueButton = (OBTrayButton *)a3;
}

- (UIBarButtonItem)customBackButton
{
  return self->_customBackButton;
}

- (void)setCustomBackButton:(id)a3
{
  objc_storeStrong((id *)&self->_customBackButton, a3);
}

- (NSTimer)wifiTimeoutTimer
{
  return self->_wifiTimeoutTimer;
}

- (void)setWifiTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_wifiTimeoutTimer, a3);
}

- (BOOL)networkReachable
{
  return self->_networkReachable;
}

- (void)setNetworkReachable:(BOOL)a3
{
  self->_networkReachable = a3;
}

- (CBBootIntentManager)bootIntentManager
{
  return self->_bootIntentManager;
}

- (void)setBootIntentManager:(id)a3
{
  objc_storeStrong((id *)&self->_bootIntentManager, a3);
}

- (CBNetworkListRecord)targetNetworkForBootIntent
{
  return self->_targetNetworkForBootIntent;
}

- (void)setTargetNetworkForBootIntent:(id)a3
{
  objc_storeStrong((id *)&self->_targetNetworkForBootIntent, a3);
}

- (BOOL)networkConnectionInProgress
{
  return self->_networkConnectionInProgress;
}

- (void)setNetworkConnectionInProgress:(BOOL)a3
{
  self->_networkConnectionInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNetworkForBootIntent, 0);
  objc_storeStrong((id *)&self->_bootIntentManager, 0);
  objc_storeStrong((id *)&self->_wifiTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_customBackButton, 0);
  objc_storeStrong((id *)&self->_otherNetworkWindow, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
}

@end
