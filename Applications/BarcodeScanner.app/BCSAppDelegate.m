@implementation BCSAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  BCSSecureWindow *v5;
  void *v6;
  BCSSecureWindow *v7;
  BCSRootViewController *v8;
  BCSRootViewController *rootViewController;

  v5 = [BCSSecureWindow alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "bounds");
  v7 = -[BCSSecureWindow initWithFrame:](v5, "initWithFrame:");

  -[BCSAppDelegate setWindow:](self, "setWindow:", v7);
  -[BCSSecureWindow makeKeyAndVisible](v7, "makeKeyAndVisible");
  v8 = (BCSRootViewController *)objc_alloc_init((Class)BCSRootViewController);
  rootViewController = self->_rootViewController;
  self->_rootViewController = v8;

  -[BCSSecureWindow setRootViewController:](v7, "setRootViewController:", self->_rootViewController);
  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCSAppDelegate window](self, "window", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));

  objc_msgSend(v4, "suspendCapturing");
  v5 = sub_1000036D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "applicationWillResignActive:", v6, 2u);
  }

}

- (void)applicationDidBecomeActive:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCSAppDelegate window](self, "window", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));

  objc_msgSend(v4, "resumeCapturing");
  v5 = sub_1000036D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "applicationDidBecomeActive:", v6, 2u);
  }

}

- (void)applicationDidEnterBackground:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCSAppDelegate window](self, "window", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));

  objc_msgSend(v4, "applicationDidEnterBackground");
  v5 = sub_1000036D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "applicationDidEnterBackground:", v6, 2u);
  }

}

- (void)applicationWillEnterForeground:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCSAppDelegate window](self, "window", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));

  objc_msgSend(v4, "applicationWillEnterForeground");
  v5 = sub_1000036D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "applicationWillEnterForeground:", v6, 2u);
  }

}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v6;
  NSObject *v7;
  int v9;
  id v10;

  v6 = a4;
  -[BCSRootViewController continueUserActivity:](self->_rootViewController, "continueUserActivity:", v6);
  v7 = sub_1000036D8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138543362;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "continueUserActivity: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  return 1;
}

- (void)application:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;

  v6 = a4;
  v7 = a5;
  v8 = sub_1000036D8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138543362;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didFailToContinueUserActivityWithType: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10000556C(v7);

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
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
