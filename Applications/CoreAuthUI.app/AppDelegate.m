@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = LALogForCategory(0, a2, a3, a4);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didFinishLaunching", v7, 2u);
  }

  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = LALogForCategory(0, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "willResignActive", v5, 2u);
  }

}

- (void)applicationDidEnterBackground:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = LALogForCategory(0, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "didEnterBackground", v5, 2u);
  }

}

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = LALogForCategory(0, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "willEnterForground", v5, 2u);
  }

}

- (void)applicationDidBecomeActive:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = LALogForCategory(0, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "didBecomeActive", v5, 2u);
  }

}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = LALogForCategory(0, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "willTerminate", v5, 2u);
  }

}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  const __CFString *v15;
  id v16;
  int v18;
  const char *v19;

  v5 = a4;
  v8 = LALogForCategory(0, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[AppDelegate application:configurationForConnectingSceneSession:options:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v18, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("RemoteAlert"));

  v13 = objc_alloc((Class)UISceneConfiguration);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  if (v12)
    v15 = CFSTR("RemoteAlert");
  else
    v15 = CFSTR("Default Configuration");
  v16 = objc_msgSend(v13, "initWithName:sessionRole:", v15, v14);

  return v16;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;

  v4 = a4;
  v7 = LALogForCategory(0, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[AppDelegate application:didDiscardSceneSessions:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }

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
