@implementation SRWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315650;
    v20 = "-[SRWindowSceneDelegate scene:willConnectToSession:options:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Options: %@, scene: %@", (uint8_t *)&v19, 0x20u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_FBSScene"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "settings"));

  v13 = objc_msgSend(v12, "interfaceOrientation");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SRApplication sharedApplication](SRApplication, "sharedApplication"));
  objc_msgSend(v14, "setFrontMostAppOrientation:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "delegate"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "appWindow"));
  objc_msgSend(v17, "_setWindowInterfaceOrientation:", v13);
  objc_msgSend(v16, "setCurrentScene:", v7);
  if (!v17)
  {
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009FEF8(v18);
  }
  objc_msgSend(v17, "setWindowScene:", v7);
  objc_msgSend(v17, "makeKeyWindow");
  objc_msgSend(v17, "setHidden:", 0);
  objc_msgSend(v16, "invalidateKeyboardWindowIfNeeded");

}

- (void)sceneDidDisconnect:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;

  v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[SRWindowSceneDelegate sceneDidDisconnect:]";
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Scene: %@", (uint8_t *)&v8, 0x16u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appWindow"));
  objc_msgSend(v6, "setCurrentScene:", 0);
  objc_msgSend(v6, "tearDownViews");
  objc_msgSend(v7, "setHidden:", 1);
  objc_msgSend(v7, "setWindowScene:", 0);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SRWindowSceneDelegate sceneDidBecomeActive:]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Scene: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

  objc_msgSend(v6, "didBecomeActiveHandler");
}

- (void)sceneWillResignActive:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SRWindowSceneDelegate sceneWillResignActive:]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Scene: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

  objc_msgSend(v6, "willResignActiveHandler");
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SRWindowSceneDelegate sceneWillEnterForeground:]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Scene: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

  objc_msgSend(v6, "willEnterForegroundHandler");
  objc_msgSend(v6, "setUpViews");

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;

  v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SRWindowSceneDelegate sceneDidEnterBackground:]";
    v7 = 2112;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Scene: %@", (uint8_t *)&v5, 0x16u);
  }

}

@end
