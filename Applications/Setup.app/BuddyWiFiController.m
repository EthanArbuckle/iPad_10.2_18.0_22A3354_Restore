@implementation BuddyWiFiController

+ (void)preheat
{
  sub_1001A4768();
  sub_1001A4898();
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  BuddyNetworkProvider *v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  char v6;
  BuddyNetworkProvider *v7;
  char v9;

  v2 = -[BuddyWiFiController networkProvider](self, "networkProvider");
  v3 = -[BuddyNetworkProvider connectedOverWiFiAndNetworkReachable](v2, "connectedOverWiFiAndNetworkReachable");
  v6 = 0;
  v4 = 0;
  if ((v3 & 1) == 0)
  {
    v7 = -[BuddyWiFiController networkProvider](self, "networkProvider");
    v6 = 1;
    v4 = -[BuddyNetworkProvider supportsWiFi](v7, "supportsWiFi");
  }
  v9 = v4 & 1;
  if ((v6 & 1) != 0)

  return v9 & 1;
}

- (void)controllerWillNotRun
{
  -[BuddyWiFiController stopScanning](self, "stopScanning", a2, self);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipWiFi;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)isTrailingWithEnvironment:(id)a3
{
  id v3;
  unsigned __int8 v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "proximitySetupController");
  v4 = objc_msgSend(v3, "hasAppliedSettings");

  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BuddyWiFiController)init
{
  BuddyWiFiController *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSNotificationCenter *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  BuddyWiFiController *v15;
  objc_super v17;
  SEL v18;
  id location;

  v18 = a2;
  location = 0;
  v17.receiver = self;
  v17.super_class = (Class)BuddyWiFiController;
  v2 = -[BuddyWiFiController init](&v17, "init");
  location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    v3 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
    objc_msgSend(v3, "addDelegate:", location);

    v4 = objc_alloc_init((Class)sub_1001A4D50());
    v5 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v4;

    objc_msgSend(*((id *)location + 1), "setBuddyDelegate:", location);
    objc_msgSend(*((id *)location + 1), "setShowNetworkSettings:", 0);
    v6 = (void *)*((_QWORD *)location + 1);
    v7 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
    objc_msgSend(v6, "setSupportsCellularActivation:", (unint64_t)objc_msgSend(v7, "supportsCellularActivation") & 1);

    v8 = objc_msgSend(location, "_createAnimationController");
    objc_msgSend(location, "setAnimationController:", v8);

    v9 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    v10 = location;
    v11 = sub_1001A4E3C();
    -[NSNotificationCenter addObserver:selector:name:object:](v9, "addObserver:selector:name:object:", v10, "wifiNetworkJoinFinished:", v11, 0);

    v12 = objc_alloc((Class)sub_1001A4F34());
    v13 = objc_msgSend(v12, "initWithViewController:", *((_QWORD *)location + 1));
    v14 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v13;

  }
  v15 = (BuddyWiFiController *)location;
  objc_storeStrong(&location, 0);
  return v15;
}

- (void)startScanningIfNecessary
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  _WORD v5[3];
  os_log_type_t v6;
  os_log_t oslog[2];
  BuddyWiFiController *v8;

  v8 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyWiFiController controllerNeedsToRun](self, "controllerNeedsToRun");
  if (v2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v2);
    v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog[0];
      v4 = v6;
      sub_100038C3C(v5);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Starting early Wi-Fi pane scan..", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    -[WFNetworkListController startScanning](v8->_wifiManager, "startScanning");
  }
}

- (void)stopScanning
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  BuddyWiFiController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Stopping Wi-Fi pane scan..", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[WFNetworkListController stopScanning](v7->_wifiManager, "stopScanning");
}

- (id)viewController
{
  return self->_viewController;
}

- (void)setNavigationController:(id)a3
{
  id WeakRetained;
  BOOL v4;
  id v5;
  id location[2];
  BuddyWiFiController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v7->_navigationController);
  v4 = WeakRetained == 0;

  if (v4)
  {
    objc_storeWeak((id *)&v7->_navigationController, location[0]);
    v5 = objc_loadWeakRetained((id *)&v7->_navigationController);
    objc_msgSend(v5, "addDelegateObserver:", v7);

  }
  objc_storeStrong(location, 0);
}

- (void)controllerWasPopped
{
  BuddyMiscState *v2;

  v2 = -[BuddyWiFiController miscState](self, "miscState", a2, self);
  -[BuddyMiscState setUserSkippedWiFi:](v2, "setUserSkippedWiFi:", 0);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  id v9;
  uint64_t v10;
  BuddyProximityAutomatedDeviceEnrollmentController *v11;
  ProximitySetupController *v12;
  unsigned __int8 v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  BuddyProximityAutomatedDeviceEnrollmentController *v17;
  OBAnimationController *v18;
  id v19;
  OBAnimationController *v20;
  DMCReturnToServiceController *v21;
  unsigned __int8 v22;
  _WORD v23[3];
  os_log_type_t v24;
  os_log_t oslog;
  int v26;
  BOOL v27;
  int64_t v28;
  id v29;
  id location[2];
  BuddyWiFiController *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = a5;
  v27 = a6;
  if (v29 == v31->_viewController
    || (v9 = v29,
        v10 = objc_opt_class(BuddyProximityAutomatedDeviceEnrollmentPairingController),
        (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
  {
    -[BuddyWiFiController setWillPush:](v31, "setWillPush:", 0);
    -[BuddyWiFiController setPreventNextButtonCreation:](v31, "setPreventNextButtonCreation:", 0);
    -[BuddyWiFiController updateNextButton](v31, "updateNextButton");
    v12 = -[BuddyWiFiController proximitySetupController](v31, "proximitySetupController");
    v13 = -[ProximitySetupController hasConnection](v12, "hasConnection");

    if ((v13 & 1) != 0)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v14);
      v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = oslog;
        v16 = v24;
        sub_100038C3C(v23);
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Skipping beginning advertising for device enrollment; we're already performing proximity setup",
          (uint8_t *)v23,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    else
    {
      v17 = -[BuddyWiFiController proximityAutomatedDeviceEnrollmentController](v31, "proximityAutomatedDeviceEnrollmentController");
      -[BuddyProximityAutomatedDeviceEnrollmentController beginAdvertising](v17, "beginAdvertising");

    }
    -[WFNetworkListController startScanning](v31->_wifiManager, "startScanning");
    if (v28 == 1)
    {
      -[BuddyWiFiController _updateActivationMethod](v31, "_updateActivationMethod");
      v18 = -[BuddyWiFiController animationController](v31, "animationController");

      if (v18)
      {
        v19 = -[BuddyWiFiController _createAnimationController](v31, "_createAnimationController");
        -[BuddyWiFiController setAnimationController:](v31, "setAnimationController:", v19);

      }
      v20 = -[BuddyWiFiController animationController](v31, "animationController");
      -[OBAnimationController startAnimation](v20, "startAnimation");

      v21 = -[BuddyWiFiController mdmReturnToServiceController](v31, "mdmReturnToServiceController");
      v22 = -[DMCReturnToServiceController shouldDoReturnToService](v21, "shouldDoReturnToService");

      if ((v22 & 1) != 0)
        -[BuddyWiFiController _startReturnToServiceTimer](v31, "_startReturnToServiceTimer");
    }
    v26 = 0;
  }
  else
  {
    v11 = -[BuddyWiFiController proximityAutomatedDeviceEnrollmentController](v31, "proximityAutomatedDeviceEnrollmentController");
    -[BuddyProximityAutomatedDeviceEnrollmentController endAdvertising](v11, "endAdvertising");

    v26 = 1;
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (id)_createAnimationController
{
  return -[WFBuddyViewController buddy_animationController:](self->_viewController, "buddy_animationController:", CFSTR("WIFI"), a2, self);
}

- (void)setShowNetworkSettings:(BOOL)a3
{
  -[WFBuddyViewController setShowNetworkSettings:](self->_viewController, "setShowNetworkSettings:", a3);
}

- (void)_flowItemDone
{
  -[BuddyWiFiController _flowItemDoneWithResetActivationMethod:](self, "_flowItemDoneWithResetActivationMethod:", 1, a2, self);
}

- (void)_flowItemDoneWithResetActivationMethod:(BOOL)a3
{
  BuddyMiscState *v3;
  BuddyMiscState *v4;
  unsigned __int8 v5;
  BuddyMiscState *v6;
  id v7;
  id v8;
  WFBuddyViewController *v9;
  WFBuddyViewController *viewController;
  BFFFlowItemDelegate *v11;

  if (!-[BuddyWiFiController willPush](self, "willPush"))
  {
    if (a3)
    {
      v3 = -[BuddyWiFiController miscState](self, "miscState");
      -[BuddyMiscState setUserSelectedCellularActivation:](v3, "setUserSelectedCellularActivation:", 0);

      v4 = -[BuddyWiFiController miscState](self, "miscState");
      -[BuddyMiscState setUserSelectedTetheredActivation:](v4, "setUserSelectedTetheredActivation:", 0);
    }
    else
    {
      v4 = (BuddyMiscState *)+[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
      v5 = -[BuddyMiscState supportsCellularActivation](v4, "supportsCellularActivation");
      v6 = -[BuddyWiFiController miscState](self, "miscState");
      -[BuddyMiscState setUserSelectedCellularActivation:](v6, "setUserSelectedCellularActivation:", v5 & 1);

    }
    -[BuddyWiFiController setWillPush:](self, "setWillPush:", 1);
    v7 = -[BuddyWiFiController viewController](self, "viewController");
    v8 = objc_msgSend(v7, "navigationController");
    v9 = (WFBuddyViewController *)objc_msgSend(v8, "topViewController");
    viewController = self->_viewController;

    if (v9 == viewController)
    {
      v11 = -[BuddyWiFiController delegate](self, "delegate");
      -[BFFFlowItemDelegate flowItemDone:](v11, "flowItemDone:", self);

    }
    -[BuddyWiFiController stopScanning](self, "stopScanning");
  }
}

- (void)_confirmThenFlowItemDoneWithResetActivationMethod:(BOOL)a3
{
  BuddyNetworkProvider *v3;
  char v4;
  id v5;
  void **v6;
  int v7;
  int v8;
  id (*v9)(uint64_t);
  void *v10;
  BuddyWiFiController *v11;
  void **v12;
  int v13;
  int v14;
  id (*v15)(uint64_t);
  void *v16;
  BuddyWiFiController *v17;
  BOOL v18;
  id location;
  BOOL v20;
  SEL v21;
  BuddyWiFiController *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  v3 = -[BuddyWiFiController networkProvider](self, "networkProvider");
  v4 = !-[BuddyNetworkProvider networkReachable](v3, "networkReachable");

  if ((v4 & 1) != 0)
  {
    location = +[BuddySkipWiFiAlertController alertController](BuddySkipWiFiAlertController, "alertController");
    v12 = _NSConcreteStackBlock;
    v13 = -1073741824;
    v14 = 0;
    v15 = sub_1001A58D8;
    v16 = &unk_100280B18;
    v17 = v22;
    v18 = v20;
    objc_msgSend(location, "setSkipWiFi:", &v12);
    v6 = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_1001A5940;
    v10 = &unk_100280730;
    v11 = v22;
    objc_msgSend(location, "setUseWiFi:", &v6);
    v5 = -[BuddyWiFiController viewController](v22, "viewController");
    objc_msgSend(v5, "presentViewController:animated:completion:", location, 1, 0);

    objc_storeStrong((id *)&v11, 0);
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    -[BuddyWiFiController _flowItemDoneWithResetActivationMethod:](v22, "_flowItemDoneWithResetActivationMethod:", v20);
  }
}

- (void)_nextTapped:(id)a3
{
  BuddyNetworkProvider *v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  id v9;
  uint8_t buf[15];
  os_log_type_t v11;
  os_log_t oslog;
  id location[2];
  BuddyWiFiController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyWiFiController networkProvider](v14, "networkProvider");
  v4 = 0;
  if (!-[BuddyNetworkProvider networkReachable](v3, "networkReachable"))
    v4 = v14->_wifiTimeoutTimer != 0;

  if (v4)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v11;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Waiting for Wi-Fi Network", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v8 = -[BuddyWiFiController viewController](v14, "viewController");
    v9 = objc_msgSend(v8, "view");
    objc_msgSend(v9, "setUserInteractionEnabled:", 0);

    -[BuddyWiFiController _showNavBarSpinner](v14, "_showNavBarSpinner");
  }
  else
  {
    -[BuddyWiFiController _confirmThenFlowItemDoneWithResetActivationMethod:](v14, "_confirmThenFlowItemDoneWithResetActivationMethod:", 1);
  }
  objc_storeStrong(location, 0);
}

- (void)reachabilityChanged:(BOOL)a3
{
  DMCReturnToServiceController *v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  id v7;
  UIAlertController *v8;
  BOOL v9;
  BuddyNetworkProvider *v10;
  BOOL v11;

  if (a3)
  {
    if (self->_showingWifiTimeoutSpinner)
    {
      -[BuddyWiFiController setPreventNextButtonCreation:](self, "setPreventNextButtonCreation:", 1);
      -[BuddyWiFiController _clearWifiTimeoutTimer](self, "_clearWifiTimeoutTimer");
      -[BuddyWiFiController _resetWifiControllerTimeoutSpinner](self, "_resetWifiControllerTimeoutSpinner");
      -[BuddyWiFiController _flowItemDone](self, "_flowItemDone");
    }
    else
    {
      v3 = -[BuddyWiFiController mdmReturnToServiceController](self, "mdmReturnToServiceController");
      v4 = 1;
      if ((-[DMCReturnToServiceController shouldDoReturnToService](v3, "shouldDoReturnToService") & 1) == 0)
      {
        v4 = 0;
        if ((+[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession") & 1) != 0)v4 = +[DMCMultiUserModeUtilities awaitUserConfigurationEnabled](DMCMultiUserModeUtilities, "awaitUserConfigurationEnabled");
      }

      if ((v4 & 1) != 0)
        -[BuddyWiFiController _flowItemDone](self, "_flowItemDone");
    }
    -[BuddyWiFiController _clearReturnToServiceTimer](self, "_clearReturnToServiceTimer");
  }
  -[BuddyWiFiController updateNextButton](self, "updateNextButton");
  v5 = -[BuddyWiFiController viewController](self, "viewController");
  v6 = objc_msgSend(v5, "navigationController");
  v7 = objc_msgSend(v6, "topViewController");
  v8 = (UIAlertController *)objc_msgSend(v7, "presentedViewController");
  v9 = v8 == self->_badWifiAlert;

  v10 = -[BuddyWiFiController networkProvider](self, "networkProvider");
  v11 = 0;
  if (-[BuddyNetworkProvider connectedOverWiFiAndNetworkReachable](v10, "connectedOverWiFiAndNetworkReachable"))
    v11 = v9;

  if (v11)
  {
    -[UIAlertController dismissViewControllerAnimated:completion:](self->_badWifiAlert, "dismissViewControllerAnimated:completion:", 1, 0);
    objc_storeStrong((id *)&self->_badWifiAlert, 0);
  }
}

- (void)updateNextButton
{
  NSObject *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  BuddyWiFiController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1001A5D40;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)_showNavBarSpinner
{
  id v2;

  if (!self->_showingWifiTimeoutSpinner)
  {
    v2 = -[BuddyWiFiController viewController](self, "viewController", a2);
    +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v2, CFSTR("WifiSpinner"));

    self->_showingWifiTimeoutSpinner = 1;
  }
}

- (void)_resetWifiControllerTimeoutSpinner
{
  id v2;
  id v3;

  if (self->_showingWifiTimeoutSpinner)
  {
    v2 = -[BuddyWiFiController viewController](self, "viewController", a2);
    v3 = objc_msgSend(v2, "view");
    objc_msgSend(v3, "setUserInteractionEnabled:", 1);

    self->_showingWifiTimeoutSpinner = 0;
    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("WifiSpinner"));
    -[BuddyWiFiController updateNextButton](self, "updateNextButton");
  }
}

- (void)wifiNetworkJoinFinished:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  BuddyNetworkProvider *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  NSTimer *v11;
  NSTimer *wifiTimeoutTimer;
  id v13;
  id v14;
  NSString *v15;
  char v16;
  NSString *v17;
  char v18;
  id v19;
  os_log_t v20;
  uint8_t buf[7];
  char v22;
  os_log_t oslog;
  id v24;
  id location[2];
  BuddyWiFiController *v26;
  uint8_t v27[24];

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "userInfo");
  v4 = sub_1001A6550();
  v24 = objc_msgSend(v3, "objectForKey:", v4);

  if (v24)
  {
    v20 = (os_log_t)(id)_BYLoggingFacility(v5);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 0;
      v16 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v15 = (NSString *)v24;
      }
      else
      {
        v19 = objc_msgSend(v24, "domain");
        v18 = 1;
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v19, objc_msgSend(v24, "code"));
        v17 = v15;
        v16 = 1;
      }
      sub_100039500((uint64_t)v27, (uint64_t)v15);
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "WiFi Join Failed: %{public}@", v27, 0xCu);
      if ((v16 & 1) != 0)

      if ((v18 & 1) != 0)
    }
    objc_storeStrong((id *)&v20, 0);
    -[BuddyWiFiController _clearWifiTimeoutTimer](v26, "_clearWifiTimeoutTimer");
    -[BuddyWiFiController _resetWifiControllerTimeoutSpinner](v26, "_resetWifiControllerTimeoutSpinner");
  }
  else
  {
    v6 = -[BuddyWiFiController networkProvider](v26, "networkProvider");
    v7 = -[BuddyNetworkProvider networkReachable](v6, "networkReachable");

    if ((v7 & 1) != 0)
    {
      -[BuddyWiFiController _flowItemDone](v26, "_flowItemDone");
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v8);
      v22 = 2;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        v9 = oslog;
        v10 = v22;
        sub_100038C3C(buf);
        _os_log_debug_impl((void *)&_mh_execute_header, v9, v10, "WiFi network joined, waiting for reachability notification", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      -[BuddyWiFiController _clearWifiTimeoutTimer](v26, "_clearWifiTimeoutTimer");
      v11 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v26, "wifiTimeoutFired:", 0, 0, 20.0);
      wifiTimeoutTimer = v26->_wifiTimeoutTimer;
      v26->_wifiTimeoutTimer = v11;

      v13 = -[BuddyWiFiController viewController](v26, "viewController");
      v14 = objc_msgSend(v13, "view");
      objc_msgSend(v14, "setUserInteractionEnabled:", 0);

      -[BuddyWiFiController _showNavBarSpinner](v26, "_showNavBarSpinner");
    }
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)_clearWifiTimeoutTimer
{
  -[NSTimer invalidate](self->_wifiTimeoutTimer, "invalidate", a2);
  objc_storeStrong((id *)&self->_wifiTimeoutTimer, 0);
}

- (void)wifiTimeoutFired:(id)a3
{
  id v3;
  id v4;
  WFBuddyViewController *v5;
  WFBuddyViewController *viewController;
  BOOL v7;
  BuddyNetworkProvider *v8;
  unsigned __int8 v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  os_log_type_t v13;
  NSBundle *v14;
  NSString *v15;
  NSBundle *v16;
  id v17;
  NSString *v18;
  UIAlertController *v19;
  UIAlertController *badWifiAlert;
  UIAlertController *v21;
  NSBundle *v22;
  NSString *v23;
  UIAlertAction *v24;
  UIAlertController *v25;
  NSBundle *v26;
  NSString *v27;
  UIAlertAction *v28;
  id v29;
  void **v30;
  uint64_t v31;
  void (*v32)(_QWORD *, void *);
  void *v33;
  BuddyWiFiController *v34;
  void **v35;
  int v36;
  int v37;
  void (*v38)(id *, void *);
  void *v39;
  BuddyWiFiController *v40;
  uint8_t buf[7];
  os_log_type_t v42;
  os_log_t oslog;
  uint64_t state64;
  int out_token;
  int v46;
  char v47;
  id v48;
  char v49;
  id v50;
  char v51;
  id v52;
  BOOL showingWifiTimeoutSpinner;
  id location[2];
  BuddyWiFiController *v55;

  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyWiFiController _clearWifiTimeoutTimer](v55, "_clearWifiTimeoutTimer");
  showingWifiTimeoutSpinner = 0;
  showingWifiTimeoutSpinner = v55->_showingWifiTimeoutSpinner;
  -[BuddyWiFiController _resetWifiControllerTimeoutSpinner](v55, "_resetWifiControllerTimeoutSpinner");
  v3 = -[BuddyWiFiController viewController](v55, "viewController");
  v4 = objc_msgSend(v3, "navigationController");
  v5 = (WFBuddyViewController *)objc_msgSend(v4, "topViewController");
  viewController = v55->_viewController;
  v51 = 0;
  v49 = 0;
  v47 = 0;
  v7 = 1;
  if (v5 == viewController)
  {
    v52 = -[BuddyWiFiController viewController](v55, "viewController");
    v51 = 1;
    v50 = objc_msgSend(v52, "navigationController");
    v49 = 1;
    v48 = objc_msgSend(v50, "presentedViewController");
    v47 = 1;
    v7 = v48 != 0;
  }
  if ((v47 & 1) != 0)

  if ((v49 & 1) != 0)
  if ((v51 & 1) != 0)

  if (v7)
  {
    v46 = 1;
  }
  else
  {
    v8 = -[BuddyWiFiController networkProvider](v55, "networkProvider");
    v9 = -[BuddyNetworkProvider connectedOverWiFiAndNetworkReachable](v8, "connectedOverWiFiAndNetworkReachable");

    if ((v9 & 1) != 0)
    {
      v46 = 1;
    }
    else
    {
      v10 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
      v11 = 0;
      if (!v10)
        v11 = !showingWifiTimeoutSpinner;

      if (v11)
      {
        v46 = 1;
      }
      else
      {
        out_token = 0;
        state64 = 0;
        if (!notify_register_check("com.apple.springboard.remoteSheetActive", &out_token))
          notify_get_state(out_token, &state64);
        if (state64 == 1)
        {
          v46 = 1;
        }
        else
        {
          oslog = (os_log_t)(id)_BYLoggingFacility(-[BuddyWiFiController updateNextButton](v55, "updateNextButton"));
          v42 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            v12 = oslog;
            v13 = v42;
            sub_100038C3C(buf);
            _os_log_impl((void *)&_mh_execute_header, v12, v13, "Showing WiFi Timeout Alert", buf, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
          v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v15 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", CFSTR("NO_NETWORK_CONNECTION_TITLE"), &stru_100284738, CFSTR("Localizable"));
          v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v17 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("NO_NETWORK_CONNECTION_BODY_WIFI"));
          v18 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", v17, &stru_100284738, CFSTR("Localizable"));
          v19 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v15, v18, 1);
          badWifiAlert = v55->_badWifiAlert;
          v55->_badWifiAlert = v19;

          v21 = v55->_badWifiAlert;
          v22 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v23 = -[NSBundle localizedStringForKey:value:table:](v22, "localizedStringForKey:value:table:", CFSTR("NO_NETWORK_CONNECTION_SETTINGS"), &stru_100284738, CFSTR("Localizable"));
          v35 = _NSConcreteStackBlock;
          v36 = -1073741824;
          v37 = 0;
          v38 = sub_1001A6C88;
          v39 = &unk_100280A28;
          v40 = v55;
          v24 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v23, 1, &v35);
          -[UIAlertController addAction:](v21, "addAction:", v24);

          v25 = v55->_badWifiAlert;
          v26 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v27 = -[NSBundle localizedStringForKey:value:table:](v26, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
          v30 = _NSConcreteStackBlock;
          v31 = 3221225472;
          v32 = sub_1001A6D04;
          v33 = &unk_100280A28;
          v34 = v55;
          v28 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 0, &v30);
          -[UIAlertController addAction:](v25, "addAction:", v28, v30, v31, v32, v33);

          v29 = -[BuddyWiFiController viewController](v55, "viewController");
          objc_msgSend(v29, "presentViewController:animated:completion:", v55->_badWifiAlert, 1, 0);

          objc_storeStrong((id *)&v34, 0);
          objc_storeStrong((id *)&v40, 0);
          v46 = 0;
        }
      }
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_startReturnToServiceTimer
{
  NSObject *v2;
  os_log_type_t v3;
  void **v4;
  uint64_t v5;
  void (*v6)(id *, void *);
  void *v7;
  BuddyWiFiController *v8;
  id v9;
  uint8_t buf[7];
  os_log_type_t v11;
  id location[2];
  BuddyWiFiController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v11;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Return to Service: Waiting 30 seconds for any network...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1001A6E88;
  v7 = &unk_100281ED8;
  v8 = v13;
  v9 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v4, 30.0);
  -[BuddyWiFiController setRtsTimeoutTimer:](v13, "setRtsTimeoutTimer:", v9, v4, v5, v6, v7);
  objc_storeStrong(&v9, 0);
  objc_storeStrong((id *)&v8, 0);
}

- (void)_clearReturnToServiceTimer
{
  NSTimer *v2;

  v2 = -[BuddyWiFiController rtsTimeoutTimer](self, "rtsTimeoutTimer", a2);
  -[NSTimer invalidate](v2, "invalidate");

  -[BuddyWiFiController setRtsTimeoutTimer:](self, "setRtsTimeoutTimer:", 0);
}

- (void)_updateActivationMethod
{
  id v2;
  unsigned __int8 v3;

  v2 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
  v3 = objc_msgSend(v2, "supportsCellularActivation");

  -[WFBuddyViewController setSupportsCellularActivation:](self->_viewController, "setSupportsCellularActivation:", v3 & 1);
}

- (void)buddyViewControllerDidPressAlternateSetupButton:(id)a3
{
  char v3;
  BuddyMiscState *v4;
  id location[2];
  BuddyWiFiController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[WFBuddyViewController supportsCellularActivation](v6->_viewController, "supportsCellularActivation") ^ 1;
  v4 = -[BuddyWiFiController miscState](v6, "miscState");
  -[BuddyMiscState setUserSelectedTetheredActivation:](v4, "setUserSelectedTetheredActivation:", v3 & 1);

  -[BuddyWiFiController _confirmThenFlowItemDoneWithResetActivationMethod:](v6, "_confirmThenFlowItemDoneWithResetActivationMethod:", 0);
  objc_storeStrong(location, 0);
}

- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4
{
  void *v4;
  void **v5;
  int v6;
  int v7;
  id (*v8)(uint64_t);
  void *v9;
  BuddyWiFiController *v10;
  BOOL v11;
  BOOL v12;
  SEL v13;
  BuddyWiFiController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  v4 = &_dispatch_main_q;
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001A7220;
  v9 = &unk_100280730;
  v10 = v14;
  dispatch_async((dispatch_queue_t)v4, &v5);

  objc_storeStrong((id *)&v10, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showNetworkSettings
{
  return self->_showNetworkSettings;
}

- (BOOL)supportsCellularActivation
{
  return self->_supportsCellularActivation;
}

- (void)setSupportsCellularActivation:(BOOL)a3
{
  self->_supportsCellularActivation = a3;
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController
{
  return self->_proximityAutomatedDeviceEnrollmentController;
}

- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3
{
  objc_storeStrong((id *)&self->_proximityAutomatedDeviceEnrollmentController, a3);
}

- (id)showModalWiFiSettingsBlock
{
  return self->_showModalWiFiSettingsBlock;
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (DMCReturnToServiceController)mdmReturnToServiceController
{
  return self->_mdmReturnToServiceController;
}

- (void)setMdmReturnToServiceController:(id)a3
{
  objc_storeStrong((id *)&self->_mdmReturnToServiceController, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (BOOL)willPush
{
  return self->_willPush;
}

- (void)setWillPush:(BOOL)a3
{
  self->_willPush = a3;
}

- (BOOL)preventNextButtonCreation
{
  return self->_preventNextButtonCreation;
}

- (void)setPreventNextButtonCreation:(BOOL)a3
{
  self->_preventNextButtonCreation = a3;
}

- (NSTimer)rtsTimeoutTimer
{
  return self->_rtsTimeoutTimer;
}

- (void)setRtsTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_rtsTimeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtsTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_mdmReturnToServiceController, 0);
  objc_storeStrong(&self->_showModalWiFiSettingsBlock, 0);
  objc_storeStrong((id *)&self->_proximityAutomatedDeviceEnrollmentController, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wifiTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_badWifiAlert, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
