@implementation ContinuityCaptureShieldUISecureSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  ContinuityCaptureShieldUISecureWindow *v16;
  ContinuityCaptureShieldUIViewController *v17;
  void *v18;
  void *v19;
  ContinuityCaptureShieldUIViewController *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100007074();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    v22 = 136315906;
    v23 = "-[ContinuityCaptureShieldUISecureSceneDelegate scene:willConnectToSession:options:]";
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s: %@, %@, %@", (uint8_t *)&v22, 0x2Au);

  }
  v14 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
  {
    v15 = v8;
    v16 = -[ContinuityCaptureShieldUISecureWindow initWithWindowScene:]([ContinuityCaptureShieldUISecureWindow alloc], "initWithWindowScene:", v15);
    objc_msgSend(v15, "_setBackgroundStyle:", 4);
    v17 = [ContinuityCaptureShieldUIViewController alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "session"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "role"));
    v20 = -[ContinuityCaptureShieldUIViewController initWithSceneSessionRole:](v17, "initWithSceneSessionRole:", v19);

    -[ContinuityCaptureShieldUISecureWindow setRootViewController:](v16, "setRootViewController:", v20);
    -[ContinuityCaptureShieldUIBaseSceneDelegate setWindow:](self, "setWindow:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLContexts"));
    -[ContinuityCaptureShieldUIBaseSceneDelegate scene:openURLContexts:](self, "scene:openURLContexts:", v15, v21);

    -[ContinuityCaptureShieldUISecureWindow makeKeyAndVisible](v16, "makeKeyAndVisible");
  }

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  ContinuityCaptureShieldUISecureSceneDelegate *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = sub_100007074();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "-[ContinuityCaptureShieldUISecureSceneDelegate sceneWillEnterForeground:]";
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: <%p> Called %@", (uint8_t *)&v7, 0x20u);
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  ContinuityCaptureShieldUISecureSceneDelegate *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = sub_100007074();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "-[ContinuityCaptureShieldUISecureSceneDelegate sceneDidEnterBackground:]";
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: <%p> Called %@", (uint8_t *)&v7, 0x20u);
  }

}

@end
