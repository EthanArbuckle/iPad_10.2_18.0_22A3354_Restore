@implementation MSDViewServiceSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  MSDViewServiceRootViewController *v20;
  void *v21;
  MSDViewServiceRootViewController *v22;
  SecureUIWindow *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  int v28;
  const char *v29;

  v7 = a3;
  v8 = a4;
  v9 = sub_10000262C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136315138;
    v29 = "-[MSDViewServiceSceneDelegate scene:willConnectToSession:options:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: entered", (uint8_t *)&v28, 0xCu);
  }

  v11 = objc_opt_class(SBSUIRemoteAlertScene);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
  {
    v12 = v7;
    objc_msgSend(v12, "setDisablesControlCenter:", 1);
    objc_msgSend(v12, "setDisablesSiri:", 1);
    objc_msgSend(v12, "setDesiredHardwareButtonEvents:", 63);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configurationContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("DisableIdleTimer")));

    if (v15)
    {
      v16 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        v17 = objc_msgSend(v15, "BOOLValue");
        v18 = sub_10000262C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          sub_1000063CC((char)v17, v19);

        objc_msgSend(v12, "setIdleTimerDisabled:forReason:", v17, CFSTR("Blocking UI shouldn't lock in the current mode"));
      }
    }
    v20 = [MSDViewServiceRootViewController alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configurationContext"));
    v22 = -[MSDViewServiceRootViewController initWithContext:](v20, "initWithContext:", v21);

    v23 = -[SecureUIWindow initWithWindowScene:]([SecureUIWindow alloc], "initWithWindowScene:", v12);
    -[MSDViewServiceSceneDelegate setWindow:](self, "setWindow:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceSceneDelegate window](self, "window"));
    objc_msgSend(v24, "setRootViewController:", v22);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceSceneDelegate window](self, "window"));
    objc_msgSend(v25, "makeKeyAndVisible");

  }
  else
  {
    v26 = sub_10000262C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100006444(v27);

    v22 = (MSDViewServiceRootViewController *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    -[MSDViewServiceRootViewController requestSceneSessionDestruction:options:errorHandler:](v22, "requestSceneSessionDestruction:options:errorHandler:", v8, 0, &stru_10000C358);
  }

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = sub_10000262C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[MSDViewServiceSceneDelegate sceneDidDisconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v6, 0xCu);
  }

  -[MSDViewServiceSceneDelegate setWindow:](self, "setWindow:", 0);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_10000262C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[MSDViewServiceSceneDelegate sceneDidBecomeActive:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)sceneWillResignActive:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_10000262C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[MSDViewServiceSceneDelegate sceneWillResignActive:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_10000262C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[MSDViewServiceSceneDelegate sceneWillEnterForeground:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_10000262C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[MSDViewServiceSceneDelegate sceneDidEnterBackground:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_10000262C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[MSDViewServiceSceneDelegate remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - called.", (uint8_t *)&v5, 0xCu);
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
