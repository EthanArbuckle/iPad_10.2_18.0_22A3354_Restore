@implementation CTCarrierSpaceAuthAppDelegate

- (void)application:(id)a3 didFinishLaunchingSuspendedWithOptions:(id)a4
{
  NSDictionary *v5;
  NSDictionary *launchContext;
  id v7;
  void *v8;
  void *v9;
  SBSRemoteAlertHandle *v10;
  SBSRemoteAlertHandle *alertHandle;
  id v12;
  id v13;

  if (a4)
  {
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "valueForKey:", CFSTR("kCTCarrierSpaceAuthContext")));
    launchContext = self->_launchContext;
    self->_launchContext = v5;

  }
  v7 = objc_alloc((Class)SBSRemoteAlertDefinition);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  v13 = objc_msgSend(v7, "initWithServiceName:viewControllerClassName:", v9, CFSTR("AuthRemoteAlertViewController"));

  v10 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v13, 0);
  alertHandle = self->_alertHandle;
  self->_alertHandle = v10;

  -[SBSRemoteAlertHandle addObserver:](self->_alertHandle, "addObserver:", self);
  v12 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  objc_msgSend(v12, "setReason:", CFSTR("CTCarrierSpaceAuth Flow"));
  -[SBSRemoteAlertHandle activateWithContext:](self->_alertHandle, "activateWithContext:", v12);

}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = sub_1000036C4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received request to open URL %@, options %@", (uint8_t *)&v12, 0x16u);
  }

  -[AuthRemoteAlertViewController handleAppURL:](self->_alertViewController, "handleAppURL:", v7);
  return 1;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  objc_msgSend(UIApp, "terminateWithSuccess", a3);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (AuthRemoteAlertViewController)alertViewController
{
  return self->_alertViewController;
}

- (void)setAlertViewController:(id)a3
{
  objc_storeStrong((id *)&self->_alertViewController, a3);
}

- (NSDictionary)launchContext
{
  return self->_launchContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchContext, 0);
  objc_storeStrong((id *)&self->_alertViewController, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
