@implementation ICQUISceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t isKindOfClass;
  NSObject *v11;
  UIWindow *v12;
  UIWindow *window;
  ICQUIRootViewController *v14;
  ICQUIRootViewController *rootViewController;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint8_t v22[16];
  ICQUISceneDelegate *v23;

  v6 = a3;
  v7 = _ICQGetLogSystem(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connecting to session.", v22, 2u);
  }

  v9 = objc_opt_class(UIWindowScene);
  isKindOfClass = objc_opt_isKindOfClass(v6, v9);
  if ((isKindOfClass & 1) != 0)
  {
    v11 = v6;
    v12 = (UIWindow *)objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v11);
    window = self->_window;
    self->_window = v12;

    v14 = objc_alloc_init(ICQUIRootViewController);
    rootViewController = self->_rootViewController;
    self->_rootViewController = v14;

    v17 = _ICQGetLogSystem(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_100007588(v11, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _sceneIdentifier](v11, "_sceneIdentifier"));
    -[ICQUIRootViewController setSceneIdentifier:](self->_rootViewController, "setSceneIdentifier:", v19);

    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_rootViewController);
    -[UIWindow setContentsPosition:](self->_window, "setContentsPosition:", 0);
    v23 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    -[NSObject _registerSceneActionsHandlerArray:forKey:](v11, "_registerSceneActionsHandlerArray:forKey:", v20, CFSTR("launch_params"));

  }
  else
  {
    v21 = _ICQGetLogSystem(isKindOfClass);
    v11 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10000761C();
  }

}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v3;
  NSObject *v4;

  v3 = _ICQGetLogSystem(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10000764C();

}

- (void)sceneDidBecomeActive:(id)a3
{
  uint64_t v3;
  NSObject *v4;

  v3 = _ICQGetLogSystem(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100007678();

}

- (void)sceneWillResignActive:(id)a3
{
  uint64_t v3;
  NSObject *v4;

  v3 = _ICQGetLogSystem(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1000076A4();

}

- (void)sceneWillEnterForeground:(id)a3
{
  uint64_t v3;
  NSObject *v4;

  v3 = _ICQGetLogSystem(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1000076D0();

}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = _ICQGetLogSystem(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sceneDidEnterBackground. Dismissing upgrade flow.", v6, 2u);
  }

  -[ICQUIRootViewController dismissUpgradeFlow](self->_rootViewController, "dismissUpgradeFlow");
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id obj;
  uint8_t v26;
  _BYTE v27[15];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;

  v6 = a3;
  v7 = _ICQGetLogSystem(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[ICQUISceneDelegate _respondToActions:forFBSScene:inUIScene:fromTransitionContext:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s called.", buf, 0xCu);
  }

  v9 = objc_msgSend(v6, "mutableCopy");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "info"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForSetting:", 0));
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[ICQRemoteContext contextFromDictionary:](ICQRemoteContext, "contextFromDictionary:", v16));
        v18 = _ICQGetLogSystem(v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        v20 = v19;
        if (v17)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetched a remote context: %@", buf, 0xCu);
          }

          -[ICQUIRootViewController setRemoteContext:](self->_rootViewController, "setRemoteContext:", v17);
          objc_msgSend(v9, "removeObject:", v14);
        }
        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            sub_1000076FC(&v26, v27, v20);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  v21 = v9;
  v22 = objc_msgSend(v9, "copy");

  return v22;
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
