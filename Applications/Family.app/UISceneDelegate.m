@implementation UISceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t isKindOfClass;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  UIWindow *v21;
  UIWindow *window;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;

  v7 = a3;
  v8 = a5;
  v11 = _FALogSystem(v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v33) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Connecting to session.", (uint8_t *)&v33, 2u);
  }

  v13 = objc_opt_class(UIWindowScene);
  isKindOfClass = objc_opt_isKindOfClass(v7, v13);
  v15 = isKindOfClass;
  v18 = _FALogSystem(isKindOfClass, v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Connected to session.", (uint8_t *)&v33, 2u);
    }

    v20 = v7;
    v21 = (UIWindow *)objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v20);
    window = self->_window;
    self->_window = v21;

    v23 = objc_alloc_init((Class)UIViewController);
    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLContexts"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "anyObject"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "URL"));

    v30 = _FALogSystem(v27, v28, v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "absoluteString"));
      v33 = 138412290;
      v34 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Received URL to open in willConnectToSession %@", (uint8_t *)&v33, 0xCu);

    }
    -[UISceneDelegate _handleFamilyURL:](self, "_handleFamilyURL:", v26);

  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    sub_100004D88(v20);
  }

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "anyObject", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));

  v10 = _FALogSystem(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
    v13 = 138412290;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received URL to open in openURLContexts %@", (uint8_t *)&v13, 0xCu);

  }
  -[UISceneDelegate _handleFamilyURL:](self, "_handleFamilyURL:", v6);

}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _FALogSystem(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Family UISceneDelegate - sceneDidDisconnect", v5, 2u);
  }

}

- (void)sceneDidBecomeActive:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _FALogSystem(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Family UISceneDelegate - sceneDidBecomeActive", v5, 2u);
  }

}

- (void)sceneWillResignActive:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _FALogSystem(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Family UISceneDelegate - sceneWillResignActive", v5, 2u);
  }

}

- (void)sceneWillEnterForeground:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _FALogSystem(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Family UISceneDelegate - sceneWillEnterForeground", v5, 2u);
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _FALogSystem(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Family UISceneDelegate - sceneDidEnterBackground", v5, 2u);
  }

}

- (BOOL)_handleFamilyURL:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("family"));

  if (v6)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v4, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject fa_valueForQueryItem:](v10, "fa_valueForQueryItem:", CFSTR("aaaction")));
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("showFamilyInvite")))
    {
      v12 = &FACircleEventTypeAcceptInvitation;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("manageFamily")))
    {
      v12 = &FACircleEventTypeManageCircle;
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("approveWithRestrictionsPIN")))
      {
        v16 = objc_msgSend(v11, "isEqualToString:", CFSTR("cacheMugshotMarquee"));
        if ((_DWORD)v16)
        {
          v19 = objc_alloc_init((Class)FAFetchFamilyCircleRequest);
          objc_msgSend(v19, "setCachePolicy:", 0);
          objc_msgSend(v19, "startRequestWithCompletionHandler:", &stru_100008220);

          v14 = 1;
        }
        else
        {
          v20 = _FALogSystem(v16, v17, v18);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_100004DC8();

          v14 = 0;
        }
        goto LABEL_12;
      }
      v12 = &FACircleEventTypeApproveWithRestrictionsPIN;
    }
    v14 = -[UISceneDelegate _handleFamilyURLComponents:eventType:](self, "_handleFamilyURLComponents:eventType:", v10, *v12);
LABEL_12:

    goto LABEL_13;
  }
  v13 = _FALogSystem(v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_100004E34(v4, v10);
  v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)_handleFamilyURLComponents:(id)a3 eventType:(id)a4
{
  id v6;
  id v7;
  FACircleStateController *currentFamilyCircleStateController;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  FACircleStateController *v19;
  FACircleStateController *v20;
  FACircleStateController *v21;
  _QWORD v23[5];
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = a4;
  currentFamilyCircleStateController = self->_currentFamilyCircleStateController;
  v11 = _FALogSystem(v7, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (currentFamilyCircleStateController)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v27 = v7;
      v28 = 2113;
      v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Ignoring event of type (%{public}@) with components: %{private}@ because an URL is already being handled", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_100004ED8();

    v13 = objc_msgSend(objc_alloc((Class)FACircleContext), "initWithEventType:", v7);
    v24 = CFSTR("requestParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fa_queryItemsDictionary"));
    v25 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    -[NSObject setAdditionalParameters:](v13, "setAdditionalParameters:", v15);

    v16 = objc_alloc((Class)FACircleStateController);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UISceneDelegate window](self, "window"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rootViewController"));
    v19 = (FACircleStateController *)objc_msgSend(v16, "initWithPresenter:", v18);
    v20 = self->_currentFamilyCircleStateController;
    self->_currentFamilyCircleStateController = v19;

    -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
    v21 = self->_currentFamilyCircleStateController;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100004508;
    v23[3] = &unk_100008270;
    v23[4] = self;
    -[FACircleStateController performWithContext:completion:](v21, "performWithContext:completion:", v13, v23);
  }

  return currentFamilyCircleStateController == 0;
}

- (void)_destroyCurrentSceneSession
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[UISceneDelegate _currentSceneSession](self, "_currentSceneSession"));
  if (v3)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v2, "requestSceneSessionDestruction:options:errorHandler:", v3, 0, &stru_1000082B0);

  }
}

- (id)_currentSceneSession
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "openSessions"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scene"));
        v11 = objc_opt_class(UIWindowScene);
        isKindOfClass = objc_opt_isKindOfClass(v10, v11);

        if ((isKindOfClass & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scene"));
          v14 = v13;
          if (self->_window)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "windows"));
            v16 = objc_msgSend(v15, "containsObject:", self->_window);

            if ((v16 & 1) != 0)
            {
              v17 = v9;

              goto LABEL_14;
            }
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_14:

  return v17;
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
  objc_storeStrong((id *)&self->rootViewController, 0);
  objc_storeStrong((id *)&self->_currentFamilyCircleStateController, 0);
}

@end
