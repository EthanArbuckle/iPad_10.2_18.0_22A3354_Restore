@implementation TVRemoteUIServiceAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  __objc2_class **v11;
  void *v12;
  unsigned int v13;

  v5 = a4;
  v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v8 = objc_msgSend(v6, "initWithName:sessionRole:", 0, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v10 = objc_msgSend(v9, "isEqualToString:", UIWindowSceneSessionRoleApplication);

  if ((v10 & 1) != 0)
  {
    v11 = off_1000143C0;
LABEL_5:
    objc_msgSend(v8, "setDelegateClass:", objc_opt_class(*v11));
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v13 = objc_msgSend(v12, "isEqualToString:", _UIWindowSceneSessionTypeCoverSheet);

  if (v13)
  {
    v11 = &off_1000143C8;
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

- (TVDefaultSceneDelegate)defaultSceneDelegate
{
  TVDefaultSceneDelegate **p_defaultSceneDelegate;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  p_defaultSceneDelegate = &self->_defaultSceneDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSceneDelegate);

  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedScenes"));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate", (_QWORD)v26));
          v14 = objc_opt_class(TVDefaultSceneDelegate);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            objc_storeWeak((id *)p_defaultSceneDelegate, v13);
            objc_storeWeak((id *)&self->_defaultScene, v12);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v9);
    }

    v15 = objc_loadWeakRetained((id *)p_defaultSceneDelegate);
    if (!v15)
    {
      v16 = _TVRUIServiceAppLog();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[TVRemoteUIServiceAppDelegate defaultSceneDelegate].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    }
  }
  return (TVDefaultSceneDelegate *)objc_loadWeakRetained((id *)p_defaultSceneDelegate);
}

- (TVLockScreenSceneDelegate)lockScreenSceneDelegate
{
  TVLockScreenSceneDelegate **p_lockScreenSceneDelegate;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  p_lockScreenSceneDelegate = &self->_lockScreenSceneDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenSceneDelegate);

  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectedScenes"));

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v11), "delegate", (_QWORD)v25));
          v13 = objc_opt_class(TVDefaultSceneDelegate);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
            objc_storeWeak((id *)&self->_defaultSceneDelegate, v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }

    v14 = objc_loadWeakRetained((id *)&self->_defaultSceneDelegate);
    if (!v14)
    {
      v15 = _TVRUIServiceAppLog();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[TVRemoteUIServiceAppDelegate lockScreenSceneDelegate].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    }
  }
  return (TVLockScreenSceneDelegate *)objc_loadWeakRetained((id *)p_lockScreenSceneDelegate);
}

- (void)lockScreenSceneDelegateSceneDidDisconnect:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TVRemoteUIServiceAppDelegate defaultSceneDelegate](self, "defaultSceneDelegate", a3));
  objc_msgSend(v3, "resetRootViewController");

}

- (void)setDefaultSceneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_defaultSceneDelegate, a3);
}

- (void)setLockScreenSceneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lockScreenSceneDelegate, a3);
}

- (UIScene)defaultScene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_defaultScene);
}

- (void)setDefaultScene:(id)a3
{
  objc_storeWeak((id *)&self->_defaultScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_defaultScene);
  objc_destroyWeak((id *)&self->_lockScreenSceneDelegate);
  objc_destroyWeak((id *)&self->_defaultSceneDelegate);
}

- (void)defaultSceneDelegate
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "Could not find defaultSceneDelegate in list of connected scenes", a5, a6, a7, a8, 0);
}

- (void)lockScreenSceneDelegate
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "Could not find lockScreenDelegate in list of connected scenes", a5, a6, a7, a8, 0);
}

@end
