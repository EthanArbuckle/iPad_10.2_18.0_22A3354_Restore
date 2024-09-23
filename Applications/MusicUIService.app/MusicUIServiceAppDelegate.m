@implementation MusicUIServiceAppDelegate

- (MusicUIServiceAppDelegate)init
{
  MusicUIServiceAppDelegate *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *environments;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MusicUIServiceAppDelegate;
  v2 = -[MusicUIServiceAppDelegate init](&v7, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    environments = v2->_environments;
    v2->_environments = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_sceneWillEnterForeground:", UISceneWillEnterForegroundNotification, 0);

  }
  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  void *v5;
  MusicUIServiceScreenManager *v6;
  MusicUIServiceScreenManager *screenManager;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary", a3, a4));
  objc_msgSend(v5, "beginGeneratingLibraryChangeNotifications");

  v6 = objc_alloc_init(MusicUIServiceScreenManager);
  screenManager = self->_screenManager;
  self->_screenManager = v6;

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));

  LODWORD(v5) = objc_msgSend(v7, "isEqualToString:", _UIWindowSceneSessionRoleCarPlay);
  if ((_DWORD)v5)
    objc_msgSend(v6, "setDelegateClass:", objc_opt_class(MusicUIServiceAppEnvironment));
  return v6;
}

- (void)appEnvironmentWillDisconnect:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "applicationIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppDelegate environments](self, "environments"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

}

- (void)_sceneWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_FBSScene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "settings"));
  v7 = objc_opt_class(CRSUIProxyApplicationSceneSettings);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "settings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "proxiedApplicationBundleIdentifier"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppDelegate environments](self, "environments"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

      if (!v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
        v14 = objc_opt_class(MusicUIServiceAppEnvironment);
        v15 = objc_opt_isKindOfClass(v13, v14);

        v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
        if ((v15 & 1) == 0)
        {
          if (v16)
          {
            v19 = 138543362;
            v20 = v10;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No available environment for app %{public}@", (uint8_t *)&v19, 0xCu);
          }
          goto LABEL_9;
        }
        if (v16)
        {
          v19 = 138543362;
          v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assigning environment for app %{public}@", (uint8_t *)&v19, 0xCu);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceAppDelegate environments](self, "environments"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, v10);

        objc_msgSend(v12, "setDelegate:", self);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
      -[MusicUIServiceAppDelegate setActiveWindow:](self, "setActiveWindow:", v18);

    }
LABEL_9:

  }
}

- (id)_keyWindowForScreen:(id)a3
{
  return -[MusicUIServiceAppDelegate activeWindow](self, "activeWindow", a3);
}

- (NSMutableDictionary)environments
{
  return self->_environments;
}

- (void)setEnvironments:(id)a3
{
  objc_storeStrong((id *)&self->_environments, a3);
}

- (UIWindow)activeWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_activeWindow);
}

- (void)setActiveWindow:(id)a3
{
  objc_storeWeak((id *)&self->_activeWindow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeWindow);
  objc_storeStrong((id *)&self->_environments, 0);
  objc_storeStrong((id *)&self->_screenManager, 0);
}

@end
