@implementation OOPADAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  OOPAWebViewController *v6;
  OOPAWebViewController *webViewController;
  UINavigationController *v8;
  UINavigationController *navViewController;
  char *v10;
  void *v11;
  uint64_t v13;
  _QWORD block[4];
  id v15;
  OOPADAppDelegate *v16;
  _QWORD v17[5];

  v5 = a3;
  -[OOPADAppDelegate _connectToAuthenticationDialogManager](self, "_connectToAuthenticationDialogManager");
  v6 = objc_alloc_init(OOPAWebViewController);
  webViewController = self->_webViewController;
  self->_webViewController = v6;

  -[OOPAWebViewController setDelegate:](self->_webViewController, "setDelegate:", self);
  v8 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_webViewController);
  navViewController = self->_navViewController;
  self->_navViewController = v8;

  v10 = (char *)objc_msgSend(UIApp, "_getSpringBoardOrientation");
  objc_msgSend(UIApp, "setStatusBarOrientation:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OOPADAppDelegate _dialogManager](self, "_dialogManager"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100003A28;
  v17[3] = &unk_100008230;
  v17[4] = self;
  objc_msgSend(v11, "contextForAuthenticationDialog:", v17);

  if ((unint64_t)(v10 - 1) > 1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003B44;
    block[3] = &unk_100008258;
    v15 = v5;
    v16 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    LOBYTE(v13) = 1;
    objc_msgSend(v5, "beginRemoteSheetController:delegate:didEndSelector:contextInfo:requireTopApplication:opaque:presentAnimated:", self->_navViewController, self, "_remoteSheetDidEnd", 0, 0, 0, v13);
  }

  return 1;
}

- (void)_remoteSheetDidEnd
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OOPADAppDelegate _dialogManager](self, "_dialogManager"));
  objc_msgSend(v3, "authenticationDialogDidFinishWithSuccess:response:", self->_cachedSuccess, self->_cachedResponse);

  -[OOPADAppDelegate _disconnectFromAuthenticationDialogManager](self, "_disconnectFromAuthenticationDialogManager");
  objc_msgSend(UIApp, "terminateWithSuccess");
}

- (BOOL)canShowAlerts
{
  return 1;
}

- (void)webViewController:(id)a3 didFinishWithSuccess:(BOOL)a4 response:(id)a5
{
  _BOOL8 v5;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *cachedResponse;
  int v16;
  void *v17;

  v5 = a4;
  v7 = (NSDictionary *)a5;
  v10 = _ACLogSystem(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    v16 = 138412290;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "\"AADWebViewController reports finishing with result %@\", (uint8_t *)&v16, 0xCu);

  }
  v13 = (void *)UIApp;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navViewController, "view"));
  objc_msgSend(v13, "endRemoteSheet:", v14);

  self->_cachedSuccess = v5;
  cachedResponse = self->_cachedResponse;
  self->_cachedResponse = v7;

}

- (id)_dialogManager
{
  return -[NSXPCConnection remoteObjectProxy](self->_connectionToDialogManager, "remoteObjectProxy");
}

- (void)_connectToAuthenticationDialogManager
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSXPCConnection *v12;
  NSXPCConnection *connectionToDialogManager;
  void *v14;

  v3 = _ACLogSystem(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1000041F0(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.accountsd.oopa"), 0);
  connectionToDialogManager = self->_connectionToDialogManager;
  self->_connectionToDialogManager = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___ACDAuthenticationDialogManagerProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToDialogManager, "setRemoteObjectInterface:", v14);

  -[NSXPCConnection setInterruptionHandler:](self->_connectionToDialogManager, "setInterruptionHandler:", &stru_100008298);
  -[NSXPCConnection setInvalidationHandler:](self->_connectionToDialogManager, "setInvalidationHandler:", &stru_1000082B8);
  -[NSXPCConnection resume](self->_connectionToDialogManager, "resume");
}

- (void)_disconnectFromAuthenticationDialogManager
{
  NSXPCConnection *connectionToDialogManager;

  -[NSXPCConnection invalidate](self->_connectionToDialogManager, "invalidate");
  connectionToDialogManager = self->_connectionToDialogManager;
  self->_connectionToDialogManager = 0;

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_cachedResponse, 0);
  objc_storeStrong((id *)&self->_navViewController, 0);
  objc_storeStrong((id *)&self->_webViewController, 0);
  objc_storeStrong((id *)&self->_connectionToDialogManager, 0);
}

@end
