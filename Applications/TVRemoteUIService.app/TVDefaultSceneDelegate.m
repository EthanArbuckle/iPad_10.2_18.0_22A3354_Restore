@implementation TVDefaultSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  TVRemoteWindow *v18;
  UIWindow *window;
  TVRemoteViewController *v20;
  TVRemoteViewController *mainViewController;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _TVRUIServiceAppLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    v26 = 136315906;
    v27 = "-[TVDefaultSceneDelegate scene:willConnectToSession:options:]";
    v28 = 2112;
    v29 = v25;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s: %@, %@, %@", (uint8_t *)&v26, 0x2Au);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14 == (id)1)
  {
    v15 = _TVRUIServiceAppLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[TVDefaultSceneDelegate scene:willConnectToSession:options:].cold.1(v16);
  }
  else
  {
    v17 = v8;
    v18 = -[TVRemoteWindow initWithWindowScene:]([TVRemoteWindow alloc], "initWithWindowScene:", v17);
    window = self->_window;
    self->_window = &v18->super;

    v20 = objc_alloc_init(TVRemoteViewController);
    mainViewController = self->_mainViewController;
    self->_mainViewController = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate mainViewController](self, "mainViewController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate window](self, "window"));
    objc_msgSend(v23, "setRootViewController:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLContexts"));
    -[TVDefaultSceneDelegate scene:openURLContexts:](self, "scene:openURLContexts:", v17, v24);

    v16 = objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate window](self, "window"));
    -[NSObject makeKeyAndVisible](v16, "makeKeyAndVisible");
  }

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;

  v4 = _TVRUIServiceAppLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TVDefaultSceneDelegate sceneDidBecomeActive:].cold.1(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate mainViewController](self, "mainViewController"));
  v7 = objc_msgSend(v6, "isConfigured");

  if ((v7 & 1) == 0)
  {
    v8 = objc_msgSend(objc_alloc((Class)TVRViewServiceConfigContext), "_initWithLaunchContext:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate mainViewController](self, "mainViewController"));
    objc_msgSend(v9, "configureWithContext:", v8);

  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;

  v4 = _TVRUIServiceAppLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[TVDefaultSceneDelegate sceneWillEnterForeground:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate window](self, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate mainViewController](self, "mainViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate window](self, "window"));
    objc_msgSend(v9, "setRootViewController:", v8);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v10, "willExitLockScreenScene");

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint8_t buf[4];
  const char *v11;

  v4 = _TVRUIServiceAppLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[TVDefaultSceneDelegate sceneWillResignActive:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = 0;
  if (SBSGetScreenLockStatus(&v9))
  {
    v6 = _TVRUIServiceAppLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Screen is locked", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate mainViewController](self, "mainViewController"));
    objc_msgSend(v8, "willEnterLockScreenScene");

  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = _TVRUIServiceAppLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TVDefaultSceneDelegate sceneDidEnterBackground:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "allObjects", a3));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URL"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "options"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "annotation"));
    v9 = objc_opt_class(NSDictionary);
    v10 = v8;
    v11 = v10;
    if (v9)
    {
      if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    v14 = objc_msgSend(objc_alloc((Class)TVRViewServiceConfigContext), "_initWithUserInfo:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate mainViewController](self, "mainViewController"));
    objc_msgSend(v15, "configureWithContext:", v14);

  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;

  v4 = _TVRUIServiceAppLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[TVDefaultSceneDelegate sceneDidDisconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v6, "dismiss");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate window](self, "window"));
  objc_msgSend(v7, "setRootViewController:", 0);

}

- (void)resetRootViewController
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = _TVRUIServiceAppLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[TVDefaultSceneDelegate resetRootViewController]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultSceneDelegate window](self, "window"));
  objc_msgSend(v5, "setRootViewController:", 0);

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (TVRemoteViewController)mainViewController
{
  return self->_mainViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

- (void)scene:(os_log_t)log willConnectToSession:options:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SpringBoard is attempting to launch the app instead of the view service. Ignoring setting up the scene", v1, 2u);
}

- (void)sceneDidBecomeActive:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[TVDefaultSceneDelegate sceneDidBecomeActive:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

@end
