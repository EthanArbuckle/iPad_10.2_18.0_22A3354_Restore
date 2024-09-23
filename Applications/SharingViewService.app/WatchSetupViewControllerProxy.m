@implementation WatchSetupViewControllerProxy

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  NSDictionary *v6;
  NSDictionary *userInfo;
  void *v8;
  id v9;

  v9 = a4;
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001A8F28 <= 30 && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
    LogPrintF(&dword_1001A8F28, "-[WatchSetupViewControllerProxy configureWithContext:completion:]", 30, "Proxy configuration: %@\n", self->super._userInfo);
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSetupViewControllerProxy view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));

  if (!v3)
    return 30;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == (id)1)
    return (1 << (char)objc_msgSend(UIApp, "activeInterfaceOrientation"));
  else
    return 2;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  id v8;
  SVSWatchSetupInitialViewController *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v3 = a3;
  if (dword_1001A8F28 <= 30 && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
    LogPrintF(&dword_1001A8F28, "-[WatchSetupViewControllerProxy viewDidAppear:]", 30, "Proxy ViewDidAppear\n");
  v23.receiver = self;
  v23.super_class = (Class)WatchSetupViewControllerProxy;
  -[WatchSetupViewControllerProxy viewDidAppear:](&v23, "viewDidAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->super._userInfo, "objectForKeyedSubscript:", CFSTR("pairingVersion")));
  if (v5
    && (v6 = -[objc_class systemVersions](off_1001A8F98(), "systemVersions"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6),
        v8 = objc_msgSend(v7, "maxPairingCompatibilityVersion"),
        v7,
        (uint64_t)objc_msgSend(v5, "integerValue") > (uint64_t)v8))
  {
    if (dword_1001A8F28 <= 30
      && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
    {
      LogPrintF(&dword_1001A8F28, "-[WatchSetupViewControllerProxy viewDidAppear:]", 30, "Pairing version %ld greater than max pairing version\n", objc_msgSend(v5, "integerValue"));
    }
    v9 = (SVSWatchSetupInitialViewController *)objc_alloc_init((Class)PRXSoftwareUpdateViewController);
    v11 = sub_1001171A8(CFSTR("Localizable"), CFSTR("SOFTWARE_UPDATE_REQUIRED"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[SVSWatchSetupInitialViewController setTitle:](v9, "setTitle:", v12);

    v13 = sub_1001171A8(CFSTR("Localizable"), CFSTR("APPLE_WATCH_SOFTWARE_UPDATE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[SVSWatchSetupInitialViewController setSubtitle:](v9, "setSubtitle:", v14);

    location = 0;
    objc_initWeak(&location, v9);
    v15 = sub_1001171A8(CFSTR("Localizable"), CFSTR("SET_UP_LATER"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10011B8A8;
    v20[3] = &unk_10017E008;
    objc_copyWeak(&v21, &location);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v16, 1, v20));

    v18 = -[SVSWatchSetupInitialViewController addAction:](v9, "addAction:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSetupViewControllerProxy presentProxCardFlowWithDelegate:initialViewController:](self, "presentProxCardFlowWithDelegate:initialViewController:", self, v9));
    -[WatchSetupViewControllerProxy setProxCardNavigationController:](self, "setProxCardNavigationController:", v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = -[SVSWatchSetupInitialViewController initWithUserInfo:]([SVSWatchSetupInitialViewController alloc], "initWithUserInfo:", self->super._userInfo);
    -[SVSWatchSetupInitialViewController setMainController:](v9, "setMainController:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSetupViewControllerProxy presentProxCardFlowWithDelegate:initialViewController:](self, "presentProxCardFlowWithDelegate:initialViewController:", self, v9));
    -[WatchSetupViewControllerProxy setProxCardNavigationController:](self, "setProxCardNavigationController:", v10);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8F28 <= 30 && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
    LogPrintF(&dword_1001A8F28, "-[WatchSetupViewControllerProxy viewDidDisappear:]", 30, "Proxy ViewDidDisappear\n");
  if (!self->_dismissed)
  {
    if (dword_1001A8F28 <= 30
      && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
    {
      LogPrintF(&dword_1001A8F28, "-[WatchSetupViewControllerProxy viewDidDisappear:]", 30, "Proxy disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[WatchSetupViewControllerProxy dismiss:](self, "dismiss:", 21);
  }
  v5.receiver = self;
  v5.super_class = (Class)WatchSetupViewControllerProxy;
  -[SVSBaseMainController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[WatchSetupViewControllerProxy dismissAnimated:completion:](self, "dismissAnimated:completion:", a3 != 19, 0);
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v6 = a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSetupViewControllerProxy _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSetupViewControllerProxy proxCardNavigationController](self, "proxCardNavigationController"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSetupViewControllerProxy proxCardNavigationController](self, "proxCardNavigationController"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10011B810;
      v10[3] = &unk_10017E100;
      v12 = v6;
      v11 = v7;
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", v4, v10);

    }
    else
    {
      objc_msgSend(v7, "dismiss");
    }

  }
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "events") & 0x10) != 0)
        {
          if (dword_1001A8F28 <= 30
            && (dword_1001A8F28 != -1 || _LogCategory_Initialize(&dword_1001A8F28, 30)))
          {
            LogPrintF(&dword_1001A8F28, "-[WatchSetupViewControllerProxy handleButtonActions:]", 30, "Home button\n");
          }
          -[WatchSetupViewControllerProxy dismiss:](self, "dismiss:", 4);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)proxCardFlowDidDismiss
{
  -[WatchSetupViewControllerProxy dismissAnimated:completion:](self, "dismissAnimated:completion:", 0, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UINavigationController)proxCardNavigationController
{
  return self->_proxCardNavigationController;
}

- (void)setProxCardNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_proxCardNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxCardNavigationController, 0);
}

@end
