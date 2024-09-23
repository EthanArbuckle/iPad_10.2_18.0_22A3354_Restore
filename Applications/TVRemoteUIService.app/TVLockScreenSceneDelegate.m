@implementation TVLockScreenSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  TVRemoteWindow *v17;
  UIWindow *window;
  TVRemoteViewController *v19;
  TVRemoteViewController *mainViewController;
  TVRemoteViewController *v21;
  TVRemoteViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _TVRUIServiceAppLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    v26 = 138412802;
    v27 = v13;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[TVLockScreenSceneDelegate] -scene:willConnectToSession:withOptions: %@, %@, %@", (uint8_t *)&v26, 0x20u);

  }
  v14 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "delegate"));
  objc_storeWeak((id *)&self->_lockScreenRemoteDelegate, v16);

  v17 = -[TVRemoteWindow initWithWindowScene:]([TVRemoteWindow alloc], "initWithWindowScene:", v14);
  window = self->_window;
  self->_window = &v17->super;

  v19 = (TVRemoteViewController *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate _mainViewController](self, "_mainViewController"));
  mainViewController = self->_mainViewController;
  self->_mainViewController = v19;

  if (!self->_mainViewController)
  {
    v21 = objc_alloc_init(TVRemoteViewController);
    v22 = self->_mainViewController;
    self->_mainViewController = v21;

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate mainViewController](self, "mainViewController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate window](self, "window"));
  objc_msgSend(v24, "setRootViewController:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate window](self, "window"));
  objc_msgSend(v25, "makeKeyAndVisible");

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  int v10;
  const char *v11;

  v4 = _TVRUIServiceAppLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[TVLockScreenSceneDelegate sceneDidBecomeActive:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate mainViewController](self, "mainViewController"));
  v7 = objc_msgSend(v6, "isConfigured");

  if ((v7 & 1) == 0)
  {
    v8 = objc_msgSend(objc_alloc((Class)TVRViewServiceConfigContext), "_initWithLaunchContext:", 14);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate mainViewController](self, "mainViewController"));
    objc_msgSend(v9, "configureWithContext:", v8);

  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;

  v4 = _TVRUIServiceAppLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[TVLockScreenSceneDelegate sceneWillEnterForeground:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v6, "willEnterLockScreenScene");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate mainViewController](self, "mainViewController"));
  v8 = objc_msgSend(v7, "isConnectedToDevice");

  if ((v8 & 1) == 0)
  {
    v9 = _TVRUIServiceAppLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Entering lock screen but device is not connected. Dismissing remote view.", (uint8_t *)&v12, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate mainViewController](self, "mainViewController"));
    objc_msgSend(v11, "dismiss");

    -[TVLockScreenSceneDelegate setMainViewController:](self, "setMainViewController:", 0);
  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;

  v4 = _TVRUIServiceAppLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[TVLockScreenSceneDelegate sceneWillResignActive:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v6, "willExitLockScreenScene");

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  UIWindow *window;
  void *v8;
  void *v9;
  TVRemoteViewController *mainViewController;
  void *v11;
  char v12;
  void *v13;
  int v14;
  const char *v15;

  v4 = _TVRUIServiceAppLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[TVLockScreenSceneDelegate sceneDidDisconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate window](self, "window"));
  objc_msgSend(v6, "setRootViewController:", 0);

  window = self->_window;
  self->_window = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v8, "willExitLockScreenScene");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v9, "dismiss");

  mainViewController = self->_mainViewController;
  self->_mainViewController = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate lockScreenRemoteDelegate](self, "lockScreenRemoteDelegate"));
  v12 = objc_opt_respondsToSelector(v11, "lockScreenSceneDelegateSceneDidDisconnect:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVLockScreenSceneDelegate lockScreenRemoteDelegate](self, "lockScreenRemoteDelegate"));
    objc_msgSend(v13, "lockScreenSceneDelegateSceneDidDisconnect:", self);

  }
}

- (id)_mainViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultSceneDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainViewController"));

  return v5;
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

- (void)setMainViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mainViewController, a3);
}

- (TVLockScreenRemoteDelegate)lockScreenRemoteDelegate
{
  return (TVLockScreenRemoteDelegate *)objc_loadWeakRetained((id *)&self->_lockScreenRemoteDelegate);
}

- (void)setLockScreenRemoteDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lockScreenRemoteDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lockScreenRemoteDelegate);
  objc_storeStrong((id *)&self->_mainViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
