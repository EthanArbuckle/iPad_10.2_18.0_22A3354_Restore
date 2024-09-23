@implementation APUISetupViewController

- (void)viewDidLoad
{
  uint64_t IntWithDefault;
  uint64_t v4;
  id v5;
  dispatch_time_t v6;
  id v7;
  AVOutputDeviceDiscoverySession *discoverySession;
  id v9;
  void *v10;
  void *v11;
  APUIRouteManager *v12;
  APUIRouteManager *routeManager;
  _QWORD block[4];
  id v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)APUISetupViewController;
  -[APUISetupViewController viewDidLoad](&v18, "viewDidLoad");
  IntWithDefault = APSSettingsGetIntWithDefault(CFSTR("AirPlaySenderUIAppDiscoveryPreWarmSecs"), 30);
  if ((_DWORD)IntWithDefault)
  {
    v4 = IntWithDefault;
    v5 = objc_msgSend(objc_alloc((Class)AVOutputDeviceDiscoverySession), "initWithDeviceFeatures:", 8);
    if (dword_10001EDE8 <= 50
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
    {
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController viewDidLoad]", 33554482, "[%{ptr}] Starting discovery pre-warm for %ds with session [%{ptr}]", self, v4, v5);
    }
    objc_msgSend(v5, "setDiscoveryMode:", 3);
    objc_initWeak(&location, self);
    v6 = dispatch_time(0, 1000000000 * (int)v4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A190;
    block[3] = &unk_100018878;
    objc_copyWeak(&v16, &location);
    v7 = v5;
    v15 = v7;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    discoverySession = self->_discoverySession;
    self->_discoverySession = (AVOutputDeviceDiscoverySession *)v7;
    v9 = v7;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  -[APUISetupViewController setShouldSkipInvalidateOnProxCardFlowDidDismiss:](self, "setShouldSkipInvalidateOnProxCardFlowDidDismiss:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[APUIConnectivityManager sharedInstance](APUIConnectivityManager, "sharedInstance"));
  objc_msgSend(v10, "startMonitoringWiFiInterfaceChange");

  if (dword_10001EDE8 <= 50
    && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController viewDidLoad]", 33554482, "[%{ptr}] Disable captive websheet", self);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[APUIConnectivityManager sharedInstance](APUIConnectivityManager, "sharedInstance"));
  objc_msgSend(v11, "enableCaptiveWebsheet:", 0);

  v12 = objc_opt_new(APUIRouteManager);
  routeManager = self->_routeManager;
  self->_routeManager = v12;

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APUISetupViewController;
  -[APUISetupViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[APUISetupViewController invalidate](self, "invalidate");
}

- (void)invalidate
{
  AVOutputDeviceDiscoverySession *discoverySession;
  int v4;
  AVOutputDeviceDiscoverySession *v5;
  void *v6;
  void *v7;
  APUIRouteManager *routeManager;
  id v9;

  discoverySession = self->_discoverySession;
  if (discoverySession)
  {
    if (dword_10001EDE8 <= 50)
    {
      if (dword_10001EDE8 != -1
        || (v4 = _LogCategory_Initialize(&dword_10001EDE8, 33554482), discoverySession = self->_discoverySession, v4))
      {
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController invalidate]", 33554482, "[%{ptr}] Disabling discovery pre-warm session [%{ptr}]", self, discoverySession);
        discoverySession = self->_discoverySession;
      }
    }
    -[AVOutputDeviceDiscoverySession setDiscoveryMode:](discoverySession, "setDiscoveryMode:", 0);
    v5 = self->_discoverySession;
    self->_discoverySession = 0;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APUIConnectivityManager sharedInstance](APUIConnectivityManager, "sharedInstance"));
  objc_msgSend(v6, "stopMonitoringWiFiInterfaceChange");

  v9 = (id)objc_claimAutoreleasedReturnValue(-[APUISetupViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v9, "invalidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APUIConnectivityManager sharedInstance](APUIConnectivityManager, "sharedInstance"));
  objc_msgSend(v7, "enableCaptiveWebsheet:", 1);

  -[APUIRouteManager invalidate](self->_routeManager, "invalidate");
  routeManager = self->_routeManager;
  self->_routeManager = 0;

  if (dword_10001EDE8 <= 50
    && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController invalidate]", 33554482, "[%{ptr}] invalidate", self);
  }

}

- (void)_setupAirPlayConnectingProxCardManagerWithSetupPayload:(id)a3 withTitle:(id)a4 withSubTitle:(id)a5 withImageName:(id)a6 andCompletion:(id)a7
{
  id v10;
  id v11;
  id v12;
  AirPlayProxCardViewController *v13;
  void *v14;
  AirPlayProxCardViewController *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = [AirPlayProxCardViewController alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v15 = -[AirPlayProxCardViewController initWithTitle:subTitle:imageName:tintColor:shouldAnimate:actionTitle:bottomSubtitle:completion:](v13, "initWithTitle:subTitle:imageName:tintColor:shouldAnimate:actionTitle:bottomSubtitle:completion:", v12, v11, v10, v14, 0, 0, 0, &stru_1000188B8);

  -[APUISetupViewController setConnectingProxCardController:](self, "setConnectingProxCardController:", v15);
  v18 = (id)objc_claimAutoreleasedReturnValue(-[APUISetupViewController connectingProxCardController](self, "connectingProxCardController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_Action_Connecting"), &stru_100018E60, 0));
  objc_msgSend(v18, "showActivityIndicatorWithStatus:", v17);

}

- (void)_initializeAirPlayConnectionProxCardManagerWithSetupPayload:(id)a3 andCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AirPlayProxCardViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  AirPlayProxCardViewController *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  __CFString *v27;
  id v28;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_AirPlayConnect_Title"), &stru_100018E60, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_AirPlayConnect_Subtitle"), &stru_100018E60, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "wifiSSID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11));

  v13 = [AirPlayProxCardViewController alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_Action_Continue"), &stru_100018E60, 0));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000A750;
  v23[3] = &unk_1000188E0;
  v23[4] = self;
  v24 = v5;
  v25 = v8;
  v26 = v12;
  v27 = CFSTR("tv.badge.wifi");
  v28 = v6;
  v21 = v6;
  v17 = v12;
  v18 = v8;
  v19 = v5;
  v20 = -[AirPlayProxCardViewController initWithTitle:subTitle:imageName:tintColor:shouldAnimate:actionTitle:bottomSubtitle:completion:](v13, "initWithTitle:subTitle:imageName:tintColor:shouldAnimate:actionTitle:bottomSubtitle:completion:", v18, v17, CFSTR("tv.badge.wifi"), v14, 0, v16, 0, v23);
  -[APUISetupViewController setSetupProxCardController:](self, "setSetupProxCardController:", v20);

}

- (void)_initializeSetupCompletionProxCardManagerWithSetupPayload:(id)a3 isAirPlaySetUp:(BOOL)a4 andCompletion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  AirPlayProxCardViewController *v25;
  uint64_t v26;
  void *v27;
  id v28;
  AirPlayProxCardViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  _QWORD v35[4];
  id v36;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APUIConnectivityManager sharedInstance](APUIConnectivityManager, "sharedInstance"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentNetworkSSID"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_AirPlayCompleted_Title"), &stru_100018E60, 0));

  v12 = objc_msgSend(v7, "routeToReceiver") | v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = v13;
  if (v12)
    v15 = CFSTR("AirPlaySenderUI_AirPlaySetupCompleted_Subtitle");
  else
    v15 = CFSTR("AirPlaySenderUI_WiFiSetupCompleted_Subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_100018E60, 0));
  v34 = (void *)v10;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v10));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_Action_Done"), &stru_100018E60, 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_UnableToConnect_HelpContact_FrontDesk"), &stru_100018E60, 0));

  if (v6)
  {
    v20 = 0;
    v21 = CFSTR("checkmark");
  }
  else
  {
    if ((objc_msgSend(v7, "routeToReceiver") & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_UnableToSetUpAirPlay_BottomSubTitle"), &stru_100018E60, 0));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v19));

    }
    v21 = CFSTR("wifi");
  }
  v24 = v21;
  v25 = [AirPlayProxCardViewController alloc];
  if (v6)
    v26 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  else
    v26 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v27 = (void *)v26;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000AAE4;
  v35[3] = &unk_100018908;
  v36 = v8;
  v28 = v8;
  v29 = -[AirPlayProxCardViewController initWithTitle:subTitle:imageName:tintColor:shouldAnimate:actionTitle:bottomSubtitle:completion:](v25, "initWithTitle:subTitle:imageName:tintColor:shouldAnimate:actionTitle:bottomSubtitle:completion:", v32, v31, v24, v27, v6, v30, v20, v35);

  -[APUISetupViewController setCompletedProxCardController:](self, "setCompletedProxCardController:", v29);
}

+ (id)_localizedSystemWiFiString
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = SFLocalizableWAPIStringKeyForKey(CFSTR("AirPlaySenderUI_WiFi"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_100018E60, 0));

  return v5;
}

- (void)_presentUnableToConnectToWiFiAlertWithSetupPayload:(id)a3
{
  id v3;
  void *v4;
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
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_UnableToConnect_WiFi_Title"), &stru_100018E60, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wifiSSID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APUISetupViewController _localizedSystemWiFiString](APUISetupViewController, "_localizedSystemWiFiString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_UnableToConnect_WiFi_Subtitle"), &stru_100018E60, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wifiSSID"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_UnableToConnect_WiFi_Action"), &stru_100018E60, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v8));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_Action_Dismiss"), &stru_100018E60, 0));

  v28[0] = v15;
  v28[1] = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AE18;
  block[3] = &unk_100018958;
  block[4] = self;
  v24 = v7;
  v25 = v12;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
  v27 = v15;
  v18 = v15;
  v19 = v26;
  v20 = v12;
  v21 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_presentUnableToConnectToDeviceAlertWithSetupPayload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  void *v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_UnableToConnect_Title"), &stru_100018E60, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_UnableToConnect_HelpContact_FrontDesk"), &stru_100018E60, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_UnableToConnect_Device_Subtitle"), &stru_100018E60, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_Action_Dismiss"), &stru_100018E60, 0));

  v20 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B2B8;
  block[3] = &unk_1000189A8;
  block[4] = self;
  v17 = v5;
  v18 = v10;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v13 = v19;
  v14 = v10;
  v15 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_presentInvalidCodeAlertWithSetupPayload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  void *v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_UnableToConnect_Title"), &stru_100018E60, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_UnableToConnect_InvalidQRCode_Subtitle"), &stru_100018E60, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AirPlaySenderUI_Action_Dismiss"), &stru_100018E60, 0));

  v17 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B61C;
  v13[3] = &unk_1000189A8;
  v13[4] = self;
  v14 = v5;
  v15 = v7;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v10 = v16;
  v11 = v7;
  v12 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

}

- (void)_presentProxCardFlowForLaunchType:(int64_t)a3 andSetupPayload:(id)a4
{
  id v6;
  int v7;
  int v8;
  int v9;
  id v10;

  v6 = a4;
  v10 = v6;
  if (dword_10001EDE8 <= 50)
  {
    if (dword_10001EDE8 != -1 || (v7 = _LogCategory_Initialize(&dword_10001EDE8, 33554482), v6 = v10, v7))
    {
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentProxCardFlowForLaunchType:andSetupPayload:]", 33554482, "[%{ptr}] presentProxCardFlow for launchType: %d", self, a3);
      v6 = v10;
    }
  }
  if (!v6 && dword_10001EDE8 <= 90)
  {
    if (dword_10001EDE8 != -1 || (v8 = _LogCategory_Initialize(&dword_10001EDE8, 33554522), v6 = v10, v8))
    {
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentProxCardFlowForLaunchType:andSetupPayload:]", 33554522, "[%{ptr}] presentProxCardFlow setup payload is nil, bailing out", self);
      v6 = v10;
    }
  }
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (!a3)
    {
      -[APUISetupViewController _setUpByURL:](self, "_setUpByURL:", v10);
LABEL_16:
      v6 = v10;
      goto LABEL_17;
    }
    if (dword_10001EDE8 <= 50)
    {
      if (dword_10001EDE8 != -1 || (v9 = _LogCategory_Initialize(&dword_10001EDE8, 33554482), v6 = v10, v9))
      {
        LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentProxCardFlowForLaunchType:andSetupPayload:]", 33554482, "[%{ptr}] presentProxCardFlow invalid launchType: %d", self, a3);
        goto LABEL_16;
      }
    }
  }
LABEL_17:

}

- (void)_setUpByURL:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wifiSSID"));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wifiSSID")),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v5,
        v7))
  {
    -[APUISetupViewController _presentAirPlayConnectionProxCardWithSetupPayload:](self, "_presentAirPlayConnectionProxCardWithSetupPayload:", v8);
  }
  else if (dword_10001EDE8 <= 50
         && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _setUpByURL:]", 33554482, "[%{ptr}] setUpByURL: invalid wifiSSID", self);
  }

}

- (void)_joinWiFiAndConnectToReceiverWithSetupPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (dword_10001EDE8 <= 50
    && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _joinWiFiAndConnectToReceiverWithSetupPayload:]", 33554482, "[%{ptr}] joinWiFiAndConnectToAirPlayWithSetupPayload", self);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APUIConnectivityManager sharedInstance](APUIConnectivityManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wifiSSID"));
  v7 = objc_msgSend(v4, "isNetworkHidden");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wifiPassphrase"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "captivePortalAuthToken"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000BBA0;
  v11[3] = &unk_1000189D0;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v5, "joinWiFiNetworkWithSSID:isNetworkHidden:passPhrase:captivePortalAuthToken:completion:", v6, v7, v8, v9, v11);

}

- (void)_getSupportedNetworks:(id)a3 withSetupPayload:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  unsigned int v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(_QWORD, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "wifiSSID"));
    v13 = objc_msgSend(v12, "isEqualToString:", v8);

    if (v13)
    {
      if (v11)
        v11[2](v11, 1);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[APUIBrokerHelper sharedInstance](APUIBrokerHelper, "sharedInstance"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000BEE0;
      v15[3] = &unk_1000189F8;
      v15[4] = self;
      v17 = v11;
      v16 = v8;
      objc_msgSend(v14, "getBrokerGroupInfo:completion:", 0, v15);

    }
  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)_performBrokerAuthenticationWithSetupPayload:(id)a3 switchWiFiIfFailed:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APUIBrokerHelper sharedInstance](APUIBrokerHelper, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "brokerToken"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C174;
  v10[3] = &unk_100018A20;
  v12 = a4;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "performBrokerAuthenticationForBrokerGroup:withBrokerAuth:completion:", 0, v8, v10);

}

- (void)_connectToAirPlayReceiverWithDeviceID:(id)a3 andSetupPayload:(id)a4
{
  id v6;
  APUIRouteManager *routeManager;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  routeManager = self->_routeManager;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "receiverToken"));
  v10 = objc_msgSend(v6, "routeToReceiver") ^ 1;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C570;
  v12[3] = &unk_1000189D0;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[APUIRouteManager pickRouteWithRouteID:authString:useRemoteControl:completion:](routeManager, "pickRouteWithRouteID:authString:useRemoteControl:completion:", v8, v9, v10, v12);

}

- (void)_presentAirPlayConnectionProxCardWithSetupPayload:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  APUISetupViewController *v12;

  v4 = a3;
  if (dword_10001EDE8 <= 50
    && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentAirPlayConnectionProxCardWithSetupPayload:]", 33554482, "[%{ptr}] presentAirPlayConnectionProxCardWithSetupPayload", self);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C8FC;
  v10[3] = &unk_100018A70;
  v5 = v4;
  v11 = v5;
  v12 = self;
  -[APUISetupViewController _initializeAirPlayConnectionProxCardManagerWithSetupPayload:andCompletion:](self, "_initializeAirPlayConnectionProxCardManagerWithSetupPayload:andCompletion:", v5, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APUISetupViewController setupProxCardController](self, "setupProxCardController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APUISetupViewController setupProxCardController](self, "setupProxCardController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PRXFlowConfiguration defaultConfiguration](PRXFlowConfiguration, "defaultConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APUISetupViewController presentProxCardFlowWithDelegate:initialViewController:configuration:](self, "presentProxCardFlowWithDelegate:initialViewController:configuration:", self, v7, v8));
    -[APUISetupViewController setProxCardNavigationController:](self, "setProxCardNavigationController:", v9);

  }
}

- (void)_presentSetupCompletedProxCard:(id)a3 isAirPlaySetUp:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const __CFString *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v4 = a4;
  v6 = a3;
  if (dword_10001EDE8 <= 50
    && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    v7 = CFSTR("not set up.");
    if (v4)
      v7 = CFSTR("set up.");
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController _presentSetupCompletedProxCard:isAirPlaySetUp:]", 33554482, "[%{ptr}] presentSetupCompletedProxCard with AirPlay %@", self, v7);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CD88;
  block[3] = &unk_100018AC0;
  block[4] = self;
  v10 = v6;
  v11 = v4;
  v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)proxCardFlowWillPresent
{
  if (dword_10001EDE8 <= 50
    && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController proxCardFlowWillPresent]", 33554482, "[%{ptr}] proxCardFlowWillPresent", self);
  }
}

- (void)proxCardFlowDidDismiss
{
  if (!-[APUISetupViewController shouldSkipInvalidateOnProxCardFlowDidDismiss](self, "shouldSkipInvalidateOnProxCardFlowDidDismiss"))-[APUISetupViewController invalidate](self, "invalidate");
  if (dword_10001EDE8 <= 50
    && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
  {
    LogPrintF(&dword_10001EDE8, "-[APUISetupViewController proxCardFlowDidDismiss]", 33554482, "[%{ptr}] proxCardFlowDidDismiss", self);
  }
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  _QWORD v7[5];

  v5 = (void (**)(_QWORD))a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D11C;
  v7[3] = &unk_100018A98;
  v7[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APUISetupViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", v7));
  objc_msgSend(v6, "setReachabilityDisabled:", 1);
  objc_msgSend(v6, "setAllowsAlertStacking:", 0);
  objc_msgSend(v6, "setAllowsBanners:", 1);
  objc_msgSend(v6, "setAllowsAlertItems:", 1);
  objc_msgSend(v6, "setAllowsControlCenter:", 1);
  objc_msgSend(v6, "setAllowsSiri:", 1);
  objc_msgSend(v6, "setAllowsMenuButtonDismissal:", 1);
  if (v5)
    v5[2](v5);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];

  v6 = (void (**)(_QWORD))a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000D434;
  v15[3] = &unk_100018A98;
  v15[4] = self;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APUISetupViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", v15));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("setupPayload")));
  v14 = 0;
  v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(APUIAirPlaySetupPayload), v10, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v14;
  if (v12)
  {
    objc_msgSend(v8, "setStatusBarHidden:withDuration:", 1, 0.4);
    if (v6)
      v6[2](v6);
    if (dword_10001EDE8 <= 50
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554482)))
    {
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController prepareForActivationWithContext:completion:]", 33554482, "[%{ptr}] - launching flow for type %d payload %@", self, 0, v12);
    }
    -[APUISetupViewController _presentProxCardFlowForLaunchType:andSetupPayload:](self, "_presentProxCardFlowForLaunchType:andSetupPayload:", 0, v12);
  }
  else
  {
    if (dword_10001EDE8 <= 90
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554522)))
    {
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController prepareForActivationWithContext:completion:]", 33554522, "[%{ptr}]:Failed to obtain setup payload from activation context, bailing out", self);
    }
    if (v13
      && dword_10001EDE8 <= 90
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize(&dword_10001EDE8, 33554522)))
    {
      LogPrintF(&dword_10001EDE8, "-[APUISetupViewController prepareForActivationWithContext:completion:]", 33554522, "[%{ptr}]:NSKeyedUnarchiver error: %@", self, v13);
    }
  }

}

+ (BOOL)isMultipleWifiFeatureEnabled
{
  return APSSettingsIsFeatureEnabled(CFSTR("SetupAssistantMultipleWiFiSupport")) != 0;
}

- (UIButton)pinPairingButton
{
  return self->_pinPairingButton;
}

- (void)setPinPairingButton:(id)a3
{
  objc_storeStrong((id *)&self->_pinPairingButton, a3);
}

- (BOOL)shouldSkipInvalidateOnProxCardFlowDidDismiss
{
  return self->_shouldSkipInvalidateOnProxCardFlowDidDismiss;
}

- (void)setShouldSkipInvalidateOnProxCardFlowDidDismiss:(BOOL)a3
{
  self->_shouldSkipInvalidateOnProxCardFlowDidDismiss = a3;
}

- (AirPlayAlertViewController)airPlayAlertController
{
  return (AirPlayAlertViewController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAirPlayAlertController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (UINavigationController)proxCardNavigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProxCardNavigationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (AirPlayProxCardViewController)setupProxCardController
{
  return (AirPlayProxCardViewController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSetupProxCardController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (AirPlayProxCardViewController)connectingProxCardController
{
  return (AirPlayProxCardViewController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConnectingProxCardController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (AirPlayProxCardViewController)completedProxCardController
{
  return (AirPlayProxCardViewController *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCompletedProxCardController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedProxCardController, 0);
  objc_storeStrong((id *)&self->_connectingProxCardController, 0);
  objc_storeStrong((id *)&self->_setupProxCardController, 0);
  objc_storeStrong((id *)&self->_proxCardNavigationController, 0);
  objc_storeStrong((id *)&self->_airPlayAlertController, 0);
  objc_storeStrong((id *)&self->_pinPairingButton, 0);
  objc_storeStrong((id *)&self->_routeManager, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
}

@end
