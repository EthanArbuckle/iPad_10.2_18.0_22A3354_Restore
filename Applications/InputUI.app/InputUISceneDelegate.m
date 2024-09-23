@implementation InputUISceneDelegate

- (void)sceneDidBecomeActive:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = sub_1000039F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InputUI sceneDidBecomeActive:%@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a3;
  v4 = sub_1000039F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InputUI sceneWillEnterForeground:%@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v6, "resumeTextInputService");

}

- (id)sessionCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[InputUIApp sharedApplication](InputUIApp, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sessionCoordinator"));

  return v3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  InputUIWindow *v11;
  id WeakRetained;
  InputUIWindow *v13;
  UIWindow **p_keyboardWindow;
  id v15;
  IUIInputSourceViewController *v16;
  UIWindow *v17;
  double y;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = sub_1000039F4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "InputUI scene:%@ willConnectToSession:%@", (uint8_t *)&v20, 0x16u);
  }

  objc_storeWeak((id *)&self->_windowScene, v7);
  v11 = [InputUIWindow alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v13 = -[InputUIWindow initWithWindowScene:](v11, "initWithWindowScene:", WeakRetained);

  p_keyboardWindow = &self->_keyboardWindow;
  objc_storeStrong((id *)&self->_keyboardWindow, v13);
  if ((+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP") & 1) != 0
    || !+[UIKeyboard supportsAutoFillPanel](UIKeyboard, "supportsAutoFillPanel"))
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[InputUISceneDelegate sessionCoordinator](self, "sessionCoordinator"));
    v16 = objc_alloc_init(IUIInputSourceViewController);
    -[IUIInputSourceViewController setSessionCoordinator:](v16, "setSessionCoordinator:", v15);
    objc_msgSend(v15, "setInputSourceViewController:", v16);
    -[InputUISceneDelegate setKeyboardContainerVC:](self, "setKeyboardContainerVC:", v16);
    -[UIWindow setRootViewController:](*p_keyboardWindow, "setRootViewController:", v16);

  }
  else
  {
    v15 = objc_alloc_init((Class)UIViewController);
    -[UIWindow setRootViewController:](*p_keyboardWindow, "setRootViewController:", v15);
  }

  -[UIWindow makeKeyAndVisible](*p_keyboardWindow, "makeKeyAndVisible");
  v17 = *p_keyboardWindow;
  y = CGPointZero.y;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v19, "bounds");
  -[UIWindow setFrame:](v17, "setFrame:", CGPointZero.x, y);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = sub_1000039F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InputUI sceneDidDisconnect:%@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)sceneWillResignActive:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = sub_1000039F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InputUI sceneWillResignActive:%@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a3;
  v4 = sub_1000039F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InputUI sceneDidEnterBackground:%@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v6, "pauseTextInputService");

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (IUIInputSourceViewController)keyboardContainerVC
{
  return self->_keyboardContainerVC;
}

- (void)setKeyboardContainerVC:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardContainerVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardContainerVC, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_keyboardWindow, 0);
  objc_destroyWeak((id *)&self->_windowScene);
}

@end
