@implementation SVSBaseMainController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  id v14;
  _QWORD v15[6];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (dword_1001A8D28 <= 30 && (dword_1001A8D28 != -1 || _LogCategory_Initialize(&dword_1001A8D28, 30)))
    LogPrintF(&dword_1001A8D28, "-[SVSBaseMainController configureWithContext:completion:]", 30, "BaseMain Configure\n");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  objc_storeStrong((id *)&self->_userInfo, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));
  if (v9 && CFDictionaryGetInt64(v8, CFSTR("_proxXPC"), 0))
  {
    v10 = objc_alloc_init((Class)SFProxCardSessionServer);
    objc_storeStrong((id *)&self->_proxCardSessionServer, v10);
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("_proxLabel"), TypeID, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v13)
      objc_msgSend(v10, "setLabel:", v13);
    v14 = objc_alloc_init((Class)NSXPCListenerEndpoint);
    objc_msgSend(v14, "_setEndpoint:", v9);
    objc_msgSend(v10, "setXpcEndpoint:", v14);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100115150;
    v15[3] = &unk_10017DE60;
    v15[4] = v10;
    v15[5] = self;
    objc_msgSend(v10, "activateWithCompletion:", v15);

  }
  if (v7)
    v7[2](v7);

}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  SFProxCardSessionServer *proxCardSessionServer;
  SFProxCardSessionServer *v6;
  SFProxCardSessionServer *v7;
  objc_super v8;

  v3 = a3;
  if (dword_1001A8D28 <= 30 && (dword_1001A8D28 != -1 || _LogCategory_Initialize(&dword_1001A8D28, 30)))
    LogPrintF(&dword_1001A8D28, "-[SVSBaseMainController viewDidDisappear:]", 30, "BaseMain ViewDidDisappear\n");
  proxCardSessionServer = self->_proxCardSessionServer;
  if (proxCardSessionServer)
  {
    v6 = proxCardSessionServer;
    -[SFProxCardSessionServer invalidate](v6, "invalidate");
    v7 = self->_proxCardSessionServer;
    self->_proxCardSessionServer = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)SVSBaseMainController;
  -[SVSBaseMainController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
}

- (void)_willAppearInRemoteViewController
{
  id v3;

  if (dword_1001A8D28 <= 30 && (dword_1001A8D28 != -1 || _LogCategory_Initialize(&dword_1001A8D28, 30)))
    LogPrintF(&dword_1001A8D28, "-[SVSBaseMainController _willAppearInRemoteViewController]", 30, "BaseMain WillAppearInRemoteViewController\n");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SVSBaseMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "setAllowsBanners:", 1);
  objc_msgSend(v3, "setDesiredHardwareButtonEvents:", -[SVSBaseMainController desiredHomeButtonEvents](self, "desiredHomeButtonEvents"));

}

- (unint64_t)desiredHomeButtonEvents
{
  return 16 * (SFDeviceHomeButtonType(self, a2) != 3);
}

- (void)dismiss:(int)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("SubclassUnimplementedException"), CFSTR("dismiss must be overridden by a subclasses."), 0));
  objc_msgSend(v3, "raise");

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return (unint64_t)-[SVSBaseMainController supportedInterfaceOrientations](self, "supportedInterfaceOrientations", a3);
}

- (SFProxCardSessionServer)proxCardSessionServer
{
  return self->_proxCardSessionServer;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_proxCardSessionServer, 0);
}

@end
