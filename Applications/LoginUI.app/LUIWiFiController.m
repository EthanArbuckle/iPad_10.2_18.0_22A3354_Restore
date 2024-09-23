@implementation LUIWiFiController

+ (LUIWiFiController)sharedController
{
  if (qword_100088EF0 != -1)
    dispatch_once(&qword_100088EF0, &stru_100069E08);
  return (LUIWiFiController *)(id)qword_100088EE8;
}

- (WFBuddyViewController)viewController
{
  WFBuddyViewController *viewController;
  WFBuddyViewController *v4;
  WFBuddyViewController *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WFNetworkListController *v15;
  WFNetworkListController *wifiManager;

  viewController = self->_viewController;
  if (!viewController)
  {
    v4 = (WFBuddyViewController *)objc_alloc_init((Class)WFBuddyViewController);
    v5 = self->_viewController;
    self->_viewController = v4;

    -[WFBuddyViewController setShowNetworkSettings:](self->_viewController, "setShowNetworkSettings:", 1);
    -[WFBuddyViewController setAdditionalSafeAreaInsets:](self->_viewController, "setAdditionalSafeAreaInsets:", 30.0, 0.0, 0.0, 0.0);
    v6 = objc_alloc((Class)UIBarButtonItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DONE_BUTTON_TITLE"), &stru_100069EB8, 0));
    v9 = objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 2, self, "done:");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBuddyViewController navigationItem](self->_viewController, "navigationItem"));
    objc_msgSend(v10, "setRightBarButtonItem:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFBuddyViewController navigationItem](self->_viewController, "navigationItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rightBarButtonItem"));
    objc_msgSend(v12, "setEnabled:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", self, "_wifiNetworkJoinStarted:", WFNetworkListControllerAssociationDidStartNotification, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", self, "_wifiNetworkJoinFinished:", WFNetworkListControllerAssociationDidFinishNotification, 0);

    v15 = (WFNetworkListController *)objc_msgSend(objc_alloc((Class)WFNetworkListController), "initWithViewController:", self->_viewController);
    wifiManager = self->_wifiManager;
    self->_wifiManager = v15;

    -[WFNetworkListController startScanning](self->_wifiManager, "startScanning");
    viewController = self->_viewController;
  }
  return viewController;
}

- (void)done:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[LUIWiFiController viewController](self, "viewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_wifiNetworkJoinStarted:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = qword_100088F18;
  if (os_log_type_enabled((os_log_t)qword_100088F18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WiFi network join started", v8, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIWiFiController viewController](self, "viewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rightBarButtonItem"));
  objc_msgSend(v7, "setEnabled:", 0);

}

- (void)_wifiNetworkJoinFinished:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = qword_100088F18;
  if (os_log_type_enabled((os_log_t)qword_100088F18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WiFi network join finished", v8, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIWiFiController viewController](self, "viewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rightBarButtonItem"));
  objc_msgSend(v7, "setEnabled:", 1);

}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (WFNetworkListController)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
