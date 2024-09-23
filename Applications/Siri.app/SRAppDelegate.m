@implementation SRAppDelegate

+ (id)sharedApplication
{
  return +[UIApplication sharedApplication](UIApplication, "sharedApplication");
}

+ (id)sharedDelegate
{
  return objc_msgSend(UIApp, "delegate");
}

- (void)_verifyAndSyncTrialExperiments
{
  id v3;
  id v4;
  SRUIFTrialManager *trialManager;
  id v6;
  SRUIFTrialManager *v7;
  SRUIFTrialManager *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v3 = objc_alloc((Class)SRUIFPreferences);
  v4 = objc_msgSend(v3, "initWithSuiteName:", SRUIFPreferencesDefaultDomain);
  if ((objc_msgSend(v4, "BOOLForKey:", SRUIFPreferencesDeviceEnrolledInASRSettingTrialExperiment) & 1) == 0)
  {
    trialManager = self->_trialManager;
    if (!trialManager)
    {
      v6 = objc_alloc((Class)SRUIFTrialManager);
      v7 = (SRUIFTrialManager *)objc_msgSend(v6, "initWithNamespace:", SRUIFTrialNamespaceForResponsesSettings);
      v8 = self->_trialManager;
      self->_trialManager = v7;

      trialManager = self->_trialManager;
    }
    v9 = SRUIFTrialFactorForOverrideAlwaysShowRecognizedSpeech;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100074258;
    v10[3] = &unk_100123C00;
    v11 = v4;
    -[SRUIFTrialManager BOOLValueForFactor:defaultValueIfNoFactorsFilePresent:withCompletionHandler:](trialManager, "BOOLValueForFactor:defaultValueIfNoFactorsFilePresent:withCompletionHandler:", v9, 0, v10);

  }
}

- (void)_invalidateTrialManager
{
  SRUIFTrialManager *trialManager;

  trialManager = self->_trialManager;
  if (trialManager)
  {
    self->_trialManager = 0;

  }
}

- (void)_windowDidCreateContext:(id)a3
{
  UIWindow *v4;
  UIWindow *v5;

  v4 = (UIWindow *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (v4 == self->_appWindow)
  {
    v5 = v4;
    -[SRAppDelegate _updateDeferral](self, "_updateDeferral");
    v4 = v5;
  }

}

- (void)_windowWillDestroyContext:(id)a3
{
  UIWindow *v4;
  UIWindow *v5;

  v4 = (UIWindow *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (v4 == self->_appWindow)
  {
    v5 = v4;
    -[SRAppDelegate _updateDeferral](self, "_updateDeferral");
    v4 = v5;
  }

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  void *v5;
  SRViewController *v6;
  SRSecureWindow *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  pid_t v15;
  __int16 v16;
  SRViewController *v17;
  __int16 v18;
  SRSecureWindow *v19;
  __int16 v20;
  unsigned int v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3, a4));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_windowDidCreateContext:", UIWindowDidCreateWindowContextNotification, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_windowWillDestroyContext:", UIWindowWillDestroyWindowContextNotification, 0);
  +[SRAssetsUtilities setupBackgroundAssetCheck](SRAssetsUtilities, "setupBackgroundAssetCheck");
  v6 = objc_alloc_init(SRViewController);
  v7 = objc_alloc_init(SRSecureWindow);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[SRSecureWindow setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[SRSecureWindow setRootViewController:](v7, "setRootViewController:", v6);
  -[SRSecureWindow makeKeyAndVisible](v7, "makeKeyAndVisible");
  +[SRUIDSurveyNotificationUtility setupUserNotificationCenterDelegateIfNeeded:](SRUIDSurveyNotificationUtility, "setupUserNotificationCenterDelegateIfNeeded:", self);
  v9 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v12 = 136316162;
    v13 = "-[SRAppDelegate application:didFinishLaunchingWithOptions:]";
    v14 = 1024;
    v15 = getpid();
    v16 = 2048;
    v17 = v6;
    v18 = 2048;
    v19 = v7;
    v20 = 1024;
    v21 = -[SRSecureWindow _contextId](v7, "_contextId");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s (%u) Creating initial viewController (%p) and window (%p) and contextID %u", (uint8_t *)&v12, 0x2Cu);

  }
  -[SRAppDelegate setAppWindow:](self, "setAppWindow:", v7);

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "configuration", a3));
  *(_QWORD *)&v7 = objc_opt_class(SRWindowSceneDelegate, v6).n128_u64[0];
  objc_msgSend(v5, "setDelegateClass:", v8, v7);
  return v5;
}

- (void)_updateDeferral
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIScene _FBSScene](self->_currentScene, "_FBSScene"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007475C;
  v4[3] = &unk_100124128;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "updateClientSettingsWithBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)invalidateKeyboardWindowIfNeeded
{
  void *v3;
  id v4;
  Class v5;
  BOOL v6;
  Class v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = NSClassFromString(CFSTR("UIRemoteKeyboardWindow"));
  if (v4)
    v6 = 1;
  else
    v6 = v5 == 0;
  if (!v6)
  {
    v7 = v5;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0));
    v4 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    if (v4)
    {
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_isKindOfClass(v11, v7) & 1) != 0)
          {
            v4 = v11;
            goto LABEL_15;
          }
        }
        v4 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_15:

  }
  v12 = objc_msgSend(v4, "_windowInterfaceOrientation", (_QWORD)v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  v14 = objc_msgSend(v13, "_windowInterfaceOrientation");

  if (v4 && (objc_opt_respondsToSelector(v4, "invalidate") & 1) != 0 && v12 != v14)
  {
    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[SRAppDelegate invalidateKeyboardWindowIfNeeded]";
      v22 = 2048;
      v23 = v12;
      v24 = 2048;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #keyboardInvalidation: Invalidating keyboard window because orientation (%ld) didn't match our launch orientation (%ld)", buf, 0x20u);
    }
    objc_msgSend(v4, "invalidate");
  }

}

- (void)setUpViews
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));
  objc_msgSend(v2, "setUpViews");

}

- (void)tearDownViews
{
  void *v3;
  id v4;

  -[SRAppDelegate _invalidateTrialManager](self, "_invalidateTrialManager");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
  objc_msgSend(v3, "tearDownViews");

}

- (void)didBecomeActiveHandler
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));
  objc_msgSend(v2, "didBecomeActiveHandler");

}

- (void)willResignActiveHandler
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));
  objc_msgSend(v2, "willResignActiveHandler");

}

- (void)willEnterForegroundHandler
{
  void *v3;
  id v4;

  SiriUISyncCachedPreferences(-[SRAppDelegate _verifyAndSyncTrialExperiments](self, "_verifyAndSyncTrialExperiments"));
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
  objc_msgSend(v3, "willEnterForegroundHandler");

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 24);
}

- (UIWindow)appWindow
{
  return self->_appWindow;
}

- (void)setAppWindow:(id)a3
{
  objc_storeStrong((id *)&self->_appWindow, a3);
}

- (UIScene)currentScene
{
  return self->_currentScene;
}

- (void)setCurrentScene:(id)a3
{
  objc_storeStrong((id *)&self->_currentScene, a3);
}

- (SRApplicationDataSource)dataSource
{
  return (SRApplicationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_currentScene, 0);
  objc_storeStrong((id *)&self->_appWindow, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
}

@end
