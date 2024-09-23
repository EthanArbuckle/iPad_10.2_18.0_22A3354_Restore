@implementation SOUIServiceAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  SOUIServiceAppDelegate *v11;

  v5 = sub_100004980();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[SOUIServiceAppDelegate application:didFinishLaunchingWithOptions:]";
    v10 = 2112;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  SOUIServiceAppDelegate *v9;

  v4 = sub_100004980();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SOUIServiceAppDelegate applicationWillResignActive:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  SOUIServiceAppDelegate *v9;

  v4 = sub_100004980();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SOUIServiceAppDelegate applicationDidEnterBackground:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  SOUIServiceAppDelegate *v9;

  v4 = sub_100004980();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SOUIServiceAppDelegate applicationWillEnterForeground:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  SOUIServiceAppDelegate *v9;

  v4 = sub_100004980();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SOUIServiceAppDelegate applicationDidBecomeActive:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)applicationWillTerminate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  SOUIServiceAppDelegate *v10;

  v4 = sub_100004980();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOUIServiceAppDelegate applicationWillTerminate:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SOExtensionManager sharedInstance](SOExtensionManager, "sharedInstance"));
  objc_msgSend(v6, "unloadExtensions");

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
}

@end
