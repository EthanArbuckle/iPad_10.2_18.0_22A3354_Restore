@implementation CBAppManager

+ (id)sharedInstance
{
  if (qword_10008BD20 != -1)
    dispatch_once(&qword_10008BD20, &stru_100075A40);
  return (id)qword_10008BD18;
}

- (CBAppManager)init
{
  CBAppManager *v2;
  uint64_t v3;
  NSSet *whitelist;
  uint64_t v5;
  NSSet *v6;
  uint64_t v7;
  NSSet *whitelistPrefixes;
  uint64_t v9;
  NSMutableSet *openApps;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  UIRootWindowScenePresentationBinder *v17;
  UIRootWindowScenePresentationBinder *rootWindowSceneBinder;
  void *v19;
  CBAppManager *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  CBAppManager *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CBAppManager;
  v2 = -[CBAppManager init](&v26, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("com.apple.Diagnostics"), CFSTR("com.apple.DiagnosticsService"), 0));
    whitelist = v2->_whitelist;
    v2->_whitelist = (NSSet *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[CBEmergencyCallManager setByAddingEmergencyCallAppToSet:](CBEmergencyCallManager, "setByAddingEmergencyCallAppToSet:", v2->_whitelist));
    v6 = v2->_whitelist;
    v2->_whitelist = (NSSet *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("com.apple.DiagnosticsService.")));
    whitelistPrefixes = v2->_whitelistPrefixes;
    v2->_whitelistPrefixes = (NSSet *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    openApps = v2->_openApps;
    v2->_openApps = (NSMutableSet *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBSystemService sharedInstance](FBSystemService, "sharedInstance"));
    objc_msgSend(v11, "setDelegate:", v2);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance"));
    objc_msgSend(v12, "addObserver:", v2);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance"));
    objc_msgSend(v13, "addObserver:", v2);
    objc_msgSend(v13, "setDelegate:", v2);
    v14 = objc_alloc((Class)UIRootWindowScenePresentationBinder);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](FBDisplayManager, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mainConfiguration"));
    v17 = (UIRootWindowScenePresentationBinder *)objc_msgSend(v14, "initWithPriority:displayConfiguration:", 0, v16);
    rootWindowSceneBinder = v2->_rootWindowSceneBinder;
    v2->_rootWindowSceneBinder = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000196E0;
    v24[3] = &unk_100075A68;
    v20 = v2;
    v25 = v20;
    objc_msgSend(v19, "enumerateScenesWithBlock:", v24);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "addObserver:selector:name:object:", v20, "_windowDidBecomeKey:", UIWindowDidBecomeKeyNotification, 0);

    v22 = +[_UIKeyboardArbiterHost launchAdvisorWithOmniscientDelegate:sceneDelegate:](_UIKeyboardArbiterHost, "launchAdvisorWithOmniscientDelegate:sceneDelegate:", 0, v20);
    -[CBAppManager _createInputScene](v20, "_createInputScene");

  }
  return v2;
}

- (void)launchAppWithBundleID:(id)a3 suspended:(BOOL)a4 native:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  CBAppManager *v18;
  id v19;
  BOOL v20;
  BOOL v21;

  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FBSystemService-OpenApplicationRequest: %@"), v10));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000197F8;
  v16[3] = &unk_100075A90;
  v20 = a4;
  v21 = a5;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBWorkspaceEvent eventWithName:handler:](FBWorkspaceEvent, "eventWithName:handler:", v12, v16));
  objc_msgSend(v15, "execute");

}

- (void)terminateAppWithBundleID:(id)a3 reason:(int64_t)a4 reportCrash:(BOOL)a5 description:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  int IsGraceful;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30[2];
  BOOL v31;
  id buf;
  __int16 v33;
  void *v34;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    v16 = FBSApplicationTerminationReasonDescription(a4);
    v15 = (id)objc_claimAutoreleasedReturnValue(v16);
  }
  v17 = v15;
  IsGraceful = FBSApplicationTerminationReasonIsGraceful(a4);
  v19 = CheckerBoardLogHandleForCategory(9);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = IsGraceful;
    v33 = 2112;
    v34 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Terminating application (gracefully %d) because %@", (uint8_t *)&buf, 0x12u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TerminateApp: %@ (%@)"), v12, v17));
  objc_initWeak(&buf, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100019BA0;
  v26[3] = &unk_100075AB8;
  objc_copyWeak(v30, &buf);
  v22 = v12;
  v27 = v22;
  v30[1] = (id)a4;
  v31 = a5;
  v23 = v13;
  v28 = v23;
  v24 = v14;
  v29 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[FBWorkspaceEvent eventWithName:handler:](FBWorkspaceEvent, "eventWithName:handler:", v21, v26));
  objc_msgSend(v25, "execute");

  objc_destroyWeak(v30);
  objc_destroyWeak(&buf);

}

- (void)_terminateApps:(id)a3 reason:(int64_t)a4 reportCrash:(BOOL)a5 description:(id)a6 completion:(id)a7
{
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  id v31;
  _BOOL4 v32;
  id v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int64_t v47;
  __int16 v48;
  id v49;

  v32 = a5;
  v9 = a3;
  v34 = a6;
  v10 = a7;
  v11 = CheckerBoardLogHandleForCategory(9);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
    *(_DWORD *)buf = 138412802;
    v45 = v13;
    v46 = 2048;
    v47 = a4;
    v48 = 2112;
    v49 = v34;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Processes to be killed: (%@) for reason (%ld) and description (%@)", buf, 0x20u);

  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10001A030;
  v41[3] = &unk_100075AE0;
  v14 = v10;
  v42 = v14;
  v15 = objc_retainBlock(v41);
  v16 = objc_msgSend(v9, "count");
  v17 = CheckerBoardLogHandleForCategory(9);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    v31 = v14;
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "We have at least one process to kill", buf, 2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BSBlockSentinel sentinelWithQueue:signalCount:completion:](BSBlockSentinel, "sentinelWithQueue:signalCount:completion:", &_dispatch_main_q, objc_msgSend(v9, "count"), v15));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = v9;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v27 = objc_msgSend(v26, "isSystemApplicationProcess");
          v28 = CheckerBoardLogHandleForCategory(9);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if (v27)
          {
            if (v30)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Process is the system application. Let's leave it be.", buf, 2u);
            }

            objc_msgSend(v20, "signal");
          }
          else
          {
            if (v30)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Process is a non-system application. Killing process…", buf, 2u);
            }

            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_10001A048;
            v35[3] = &unk_1000754C0;
            v36 = v20;
            objc_msgSend(v26, "killForReason:andReport:withDescription:completion:", a4, v32, v34, v35);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v23);
    }

    v14 = v31;
  }
  else
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "There are no processes to kill…", buf, 2u);
    }

    ((void (*)(_QWORD *))v15[2])(v15);
  }

}

- (id)currentOpenAppBundleIDs
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppManager openApps](self, "openApps", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "bundleID"));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "copy");
  return v10;
}

- (void)processManager:(id)a3 didAddProcess:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  _QWORD v11[4];
  id v12;
  CBAppManager *v13;
  uint8_t buf[4];
  void *v15;

  v5 = a4;
  v6 = CheckerBoardLogHandleForCategory(9);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "processManager:didAddProcess: %@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.Diagnostics"));

  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001A32C;
    v11[3] = &unk_1000754E8;
    v12 = v5;
    v13 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

  }
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  CBAppManager *v24;
  uint8_t buf[4];
  void *v26;

  v5 = a4;
  v6 = CheckerBoardLogHandleForCategory(9);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "processManager:didRemoveProcess: %@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.Diagnostics"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBIdleSleepManager sharedInstance](CBIdleSleepManager, "sharedInstance"));
    objc_msgSend(v11, "setIdleTimerDisabled:forReason:", 0, CFSTR("AppRequest"));

    v12 = CheckerBoardLogHandleForCategory(9);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100045470(v13, v14, v15, v16, v17, v18, v19, v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "postNotificationName:object:", CFSTR("AppManagerPrimaryAppDidExit"), self);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001A648;
    v22[3] = &unk_1000754E8;
    v23 = v5;
    v24 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);

  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  CBAppClientSettingObserverContext *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientProcess"));
  if (objc_msgSend(v14, "isApplicationProcess")
    && (objc_msgSend(v14, "isSystemApplicationProcess") & 1) == 0)
  {
    v15 = CheckerBoardLogHandleForCategory(9);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Process is a non-system application.", v21, 2u);
    }

    v17 = objc_alloc_init(CBAppClientSettingObserverContext);
    -[CBAppClientSettingObserverContext setScene:](v17, "setScene:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "settings"));
    -[CBAppClientSettingObserverContext setSettings:](v17, "setSettings:", v18);

    -[CBAppClientSettingObserverContext setOldClientSettings:](v17, "setOldClientSettings:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientSettings"));
    -[CBAppClientSettingObserverContext setUpdatedClientSettings:](v17, "setUpdatedClientSettings:", v19);

    -[CBAppClientSettingObserverContext setTransition:](v17, "setTransition:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppManager _appClientSettingsDiffInspector](self, "_appClientSettingsDiffInspector"));
    objc_msgSend(v20, "inspectDiff:withContext:", v11, v17);

  }
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "addObserver:", self);
  -[UIRootWindowScenePresentationBinder addScene:](self->_rootWindowSceneBinder, "addScene:", v5);

}

- (void)_windowDidBecomeKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBSceneManager sceneIdentifier:](CBSceneManager, "sceneIdentifier:", 1));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneWithIdentifier:", v5));

  v6 = v7;
  if (v7)
  {
    -[CBAppManager _updateLevelForScene:transitionContext:](self, "_updateLevelForScene:transitionContext:", v7, 0);
    v6 = v7;
  }

}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBSceneManager sceneIdentifier:](CBSceneManager, "sceneIdentifier:", 1));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
    -[CBAppManager _updateLevelForScene:transitionContext:](self, "_updateLevelForScene:transitionContext:", v9, 0);

}

- (double)_effectiveKeyboardSceneLevelForClientSettings:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredSceneHostIdentifier"));
  if (!objc_msgSend(v4, "length")
    || (v5 = FBSystemAppBundleID(),
        v6 = (void *)objc_claimAutoreleasedReturnValue(v5),
        v7 = objc_msgSend(v4, "isEqualToString:", v6),
        v6,
        v8 = 11.0,
        v7))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow keyWindow](UIWindow, "keyWindow"));
    v10 = v9;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstResponder"));

      if (v11)
      {
        objc_msgSend(v10, "windowLevel");
        v8 = v12 + 2.0;
      }
      else
      {
        objc_msgSend(v3, "preferredLevel");
        v8 = v13;
      }
    }
    else
    {
      v8 = 11.0;
    }

  }
  return v8;
}

- (void)_updateLevelForScene:(id)a3 transitionContext:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  double v25;

  v5 = a3;
  v6 = a4;
  +[CBSceneManager windowLevel:](CBSceneManager, "windowLevel:", 1);
  v8 = v7;
  v9 = CheckerBoardLogHandleForCategory(9);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v5;
    v24 = 2048;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating level for scene (%@) to client settings' preferred level %f", buf, 0x16u);
  }

  v11 = CheckerBoardLogHandleForCategory(9);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "settings"));
    objc_msgSend(v13, "level");
    *(_DWORD *)buf = 134218240;
    v23 = v14;
    v24 = 2048;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Comparing scene settings level (%f) to level (%f)", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "settings"));
  objc_msgSend(v15, "level");
  v17 = v16;

  if (v17 != v8)
  {
    v18 = CheckerBoardLogHandleForCategory(9);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v5;
      v24 = 2048;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Scene (%@) is setting level to: %f", buf, 0x16u);
    }

    if (v6)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "animationFence"));
      +[UIScene _synchronizeDrawingWithFence:](UIScene, "_synchronizeDrawingWithFence:", v20);

    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10001AD28;
    v21[3] = &unk_100075B00;
    *(double *)&v21[4] = v8;
    objc_msgSend(v5, "updateSettingsWithBlock:", v21);
  }

}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  -[UIRootWindowScenePresentationBinder removeScene:](self->_rootWindowSceneBinder, "removeScene:", a4);
}

- (id)_appClientSettingsDiffInspector
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppManager appClientSettingsDiffInspector](self, "appClientSettingsDiffInspector"));

  if (!v3)
  {
    v4 = CheckerBoardLogHandleForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating app client settings diff inspector…", v9, 2u);
    }

    v6 = objc_alloc_init((Class)UIApplicationSceneClientSettingsDiffInspector);
    -[CBAppManager setAppClientSettingsDiffInspector:](self, "setAppClientSettingsDiffInspector:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppManager appClientSettingsDiffInspector](self, "appClientSettingsDiffInspector"));
    objc_msgSend(v7, "observeIdleTimerDisabledWithBlock:", &stru_100075B40);

  }
  return (id)objc_claimAutoreleasedReturnValue(-[CBAppManager appClientSettingsDiffInspector](self, "appClientSettingsDiffInspector"));
}

- (void)systemService:(id)a3 canActivateApplication:(id)a4 withResult:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppManager whitelist](self, "whitelist"));
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if ((v10 & 1) != 0)
  {
    v11 = 0;
    if (!v8)
      goto LABEL_8;
    goto LABEL_7;
  }
  v12 = CheckerBoardLogHandleForCategory(9);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_1000454A0((uint64_t)v7, v13, v14, v15, v16, v17, v18, v19);

  v11 = 3;
  if (v8)
LABEL_7:
    v8[2](v8, v11);
LABEL_8:

}

- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppManager whitelist](self, "whitelist"));
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientProcess"));
    v13 = CheckerBoardLogHandleForCategory(9);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v9;
      v33 = 2112;
      v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received open application request for [%@] from %@.", buf, 0x16u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "options"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dictionary"));
    v18 = objc_msgSend(v16, "bs_safeObjectForKey:ofType:", FBSOpenApplicationOptionKeyActivateSuspended, objc_opt_class(NSNumber, v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = CheckerBoardLogHandleForCategory(9);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Suspended request: %@", buf, 0xCu);
    }

    -[CBAppManager launchAppWithBundleID:suspended:native:completion:](self, "launchAppWithBundleID:suspended:native:completion:", v9, objc_msgSend(v19, "BOOLValue"), 0, v8);
  }
  else
  {
    v22 = CheckerBoardLogHandleForCategory(9);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000454A0((uint64_t)v9, v23, v24, v25, v26, v27, v28, v29);

    v30 = FBSOpenApplicationErrorCreate(3, CFSTR("Requested application [%@] is not in the whitelist."));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v30);
    (*((void (**)(id, void *))v8 + 2))(v8, v12);
    v19 = v8;
  }

}

- (void)systemService:(id)a3 isPasscodeLockedOrBlockedWithResult:(id)a4
{
  if (a4)
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

- (void)systemService:(id)a3 handleActions:(id)a4 origin:(id)a5 withResult:(id)a6
{
  if (a6)
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)systemService:(id)a3 dataReset:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
}

- (void)_createInputScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneDefinition definition](FBSMutableSceneDefinition, "definition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneIdentity identityForIdentifier:](FBSSceneIdentity, "identityForIdentifier:", v4));
  objc_msgSend(v5, "setIdentity:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentity identityForAngelJobLabel:](RBSProcessIdentity, "identityForAngelJobLabel:", CFSTR("com.apple.InputUI")));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneClientIdentity identityForProcessIdentity:](FBSSceneClientIdentity, "identityForProcessIdentity:", v7));
    objc_msgSend(v5, "setClientIdentity:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationSceneSpecification specification](UIApplicationSceneSpecification, "specification"));
    objc_msgSend(v5, "setSpecification:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "createSceneWithDefinition:", v5));

    if (v11)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10001B59C;
      v30[3] = &unk_100075B68;
      v31 = (id)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](FBDisplayManager, "mainConfiguration"));
      v12 = v31;
      -[NSObject performUpdate:](v11, "performUpdate:", v30);
      -[UIRootWindowScenePresentationBinder addScene:](self->_rootWindowSceneBinder, "addScene:", v11);

    }
    else
    {
      v21 = CheckerBoardLogHandleForCategory(4);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_100045538(v22, v23, v24, v25, v26, v27, v28, v29);

    }
  }
  else
  {
    v13 = CheckerBoardLogHandleForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100045508(v11, v14, v15, v16, v17, v18, v19, v20);
  }

}

- (NSMutableSet)openApps
{
  return self->_openApps;
}

- (void)setOpenApps:(id)a3
{
  objc_storeStrong((id *)&self->_openApps, a3);
}

- (NSSet)whitelist
{
  return self->_whitelist;
}

- (NSSet)whitelistPrefixes
{
  return self->_whitelistPrefixes;
}

- (UIApplicationSceneClientSettingsDiffInspector)appClientSettingsDiffInspector
{
  return self->_appClientSettingsDiffInspector;
}

- (void)setAppClientSettingsDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, a3);
}

- (BSInvalidatable)layoutElementInvalidator
{
  return self->_layoutElementInvalidator;
}

- (void)setLayoutElementInvalidator:(id)a3
{
  objc_storeStrong((id *)&self->_layoutElementInvalidator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutElementInvalidator, 0);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_whitelistPrefixes, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_openApps, 0);
  objc_storeStrong((id *)&self->_rootWindowSceneBinder, 0);
}

@end
