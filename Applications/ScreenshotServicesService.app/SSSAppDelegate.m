@implementation SSSAppDelegate

- (BOOL)_shouldSetUpDevelopmentUI
{
  return !self->_didLaunchSuspended && NSClassFromString(CFSTR("SSSTestCase")) == 0;
}

- (void)_setUpDevelopmentUI
{
  SSSDittoDebugViewController *v3;
  SSSDittoDebugViewController *debugViewController;
  id v5;

  +[SSSDittoDebugViewController prepareForDebugging](SSSDittoDebugViewController, "prepareForDebugging");
  v5 = objc_alloc_init((Class)UIWindow);
  -[SSSAppDelegate setWindow:](self, "setWindow:", v5);
  v3 = objc_alloc_init(SSSDittoDebugViewController);
  debugViewController = self->_debugViewController;
  self->_debugViewController = v3;

  objc_msgSend(v5, "setRootViewController:", self->_debugViewController);
  objc_msgSend(v5, "makeKeyAndVisible");

}

- (SSSViewControllerManager)viewControllerManager
{
  return self->_viewControllerManager;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (-[SSSAppDelegate _shouldSetUpDevelopmentUI](self, "_shouldSetUpDevelopmentUI", a3, a4))
    -[SSSAppDelegate _setUpDevelopmentUI](self, "_setUpDevelopmentUI");
  return 1;
}

- (void)application:(id)a3 didFinishLaunchingSuspendedWithOptions:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  SSSViewControllerManager *v8;
  SSSViewControllerManager *viewControllerManager;
  uint8_t v10[16];
  uint8_t buf[16];

  v5 = _SSSignpostLog(self, a2, a3, a4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceLaunch", (const char *)&unk_10008BF43, buf, 2u);
  }

  v7 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "END \"ServiceLaunch\", v10, 2u);
  }

  v8 = objc_alloc_init(SSSViewControllerManager);
  viewControllerManager = self->_viewControllerManager;
  self->_viewControllerManager = v8;

  self->_didLaunchSuspended = 1;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (BOOL)didLaunchSuspended
{
  return self->_didLaunchSuspended;
}

- (void)setDidLaunchSuspended:(BOOL)a3
{
  self->_didLaunchSuspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_viewControllerManager, 0);
  objc_storeStrong((id *)&self->_debugViewController, 0);
}

@end
