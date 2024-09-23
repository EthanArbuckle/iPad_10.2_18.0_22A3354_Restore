@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  int *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  FBATestSupport *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double Height;
  void *v27;
  void *v28;
  void *v29;
  double Width;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v54;
  void *v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  CGRect v59;
  CGRect v60;

  v6 = a3;
  v7 = a4;
  v8 = &OBJC_IVAR___FBASubmissionTimer__delegate;
  v9 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_100099B88();

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "environment"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST")));

  if (!v12)
  {
    _FBKResetDefaultsIfNeeded(+[FBAUserDefaultsMigrator run](_TtC18Feedback_Assistant23FBAUserDefaultsMigrator, "run"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[DEDManager sharedInstance](DEDManager, "sharedInstance"));
    objc_msgSend(v13, "start");
    v14 = +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
    v15 = objc_alloc_init(FBATestSupport);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arguments"));
    -[FBATestSupport processLaunchArgumentsWithArgs:](v15, "processLaunchArgumentsWithArgs:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rootViewController"));

    objc_msgSend(v19, "setDelegate:", self);
    v20 = objc_alloc((Class)UIVisualEffectView);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 4));
    v22 = objc_msgSend(v20, "initWithEffect:", v21);
    -[AppDelegate setBlurView:](self, "setBlurView:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "rootViewController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "view"));
    objc_msgSend(v25, "bounds");
    Height = CGRectGetHeight(v59);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "rootViewController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));
    objc_msgSend(v29, "bounds");
    Width = CGRectGetWidth(v60);

    if (Height <= Width)
      Height = Width;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate blurView](self, "blurView"));
    objc_msgSend(v31, "setFrame:", 0.0, 0.0, Height, Height);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v56 = objc_msgSend(v32, "applicationState");

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "loginManager"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v36 = objc_msgSend(v35, "BOOLForKey:", FBKPushNotificationsEnabled);

    if (v36)
      objc_msgSend(v6, "registerForRemoteNotifications");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
    objc_msgSend(v37, "setDelegate:", self);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants tintColor](iFBAConstants, "tintColor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
    objc_msgSend(v39, "setTintColor:", v38);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", UIApplicationLaunchOptionsURLKey));
    if (FBKIsInternalInstall(v40, v41))
    {
      v55 = v13;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v43 = FBKLaunchActionOnLaunch;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringForKey:", FBKLaunchActionOnLaunch));

      if (!v44)
      {
        v13 = v55;
        v8 = &OBJC_IVAR___FBASubmissionTimer__delegate;
        if (!v40)
          goto LABEL_19;
        goto LABEL_14;
      }
      v54 = v19;
      v45 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringForKey:", v43));
        *(_DWORD *)buf = 138412290;
        v58 = v47;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Auto-running URL Action %@", buf, 0xCu);

      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringForKey:", v43));
      v50 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v49));

      v51 = (void *)objc_claimAutoreleasedReturnValue(+[FBKLaunchAction actionWithURL:](FBKLaunchAction, "actionWithURL:", v50));
      -[AppDelegate handleLaunchAction:completion:](self, "handleLaunchAction:completion:", v51, 0);

      v40 = (void *)v50;
      v19 = v54;
      v13 = v55;
      v8 = &OBJC_IVAR___FBASubmissionTimer__delegate;
    }
    if (!v40)
      goto LABEL_19;
LABEL_14:
    if (objc_msgSend(v40, "handlesLogin"))
    {
      v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8 + 688, "appHandle"));
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Anon url action found. Skipping interactive login sequence", buf, 2u);
      }

      goto LABEL_22;
    }
LABEL_19:
    if (v56 == (id)2)
      objc_msgSend(v34, "backgroundStartupWithCompletion:", &stru_1000E69D8);
    else
      -[AppDelegate _performInteractiveLoginWithManager:](self, "_performInteractiveLoginWithManager:", v34);
LABEL_22:
    +[FBADraftDirectoriesCleanUp run](_TtC18Feedback_Assistant26FBADraftDirectoriesCleanUp, "run");
    +[FBADirectoriesMigrator run](_TtC18Feedback_Assistant22FBADirectoriesMigrator, "run");
    +[FBAAppGroupMigrator run](_TtC18Feedback_Assistant19FBAAppGroupMigrator, "run");
    +[FBKSharedConstants deleteStaleAttachmentLegalTextEntries](FBKSharedConstants, "deleteStaleAttachmentLegalTextEntries");
    -[AppDelegate setOrientationMask:](self, "setOrientationMask:", -[AppDelegate supportedInterfaceOrientations](self, "supportedInterfaceOrientations"));

  }
  return 1;
}

- (void)applicationDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST")));

  if (!v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Did become active", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loginManager"));

    -[AppDelegate _performInteractiveLoginWithManager:](self, "_performInteractiveLoginWithManager:", v9);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001D27C;
    v10[3] = &unk_1000E6A00;
    v10[4] = self;
    objc_msgSend(v9, "runAfterLogin:", v10);

  }
}

- (void)applicationWillResignActive:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will resign active", v4, 2u);
  }

}

- (void)applicationDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST")));

  if (!v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Did enter background", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v11 = 0;
    objc_msgSend(v8, "saveToStore:", &v11);
    if (!v11)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));
        objc_msgSend(v8, "reduceToFault:", v10);

      }
    }
    -[AppDelegate addBlurView](self, "addBlurView");
    -[AppDelegate saveBiometricsDate](self, "saveBiometricsDate");

  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  AppDelegate *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will enter foreground", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loginManager"));

  if (objc_msgSend(v6, "loginState") != (id)1)
  {
    v9 = sub_10001D448();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_100099C00();

    v7 = self;
    v8 = 1;
    goto LABEL_9;
  }
  if ((id)-[AppDelegate biometricsState](self, "biometricsState") == (id)3)
  {
    v7 = self;
    v8 = 5;
LABEL_9:
    -[AppDelegate setBiometricsState:](v7, "setBiometricsState:", v8);
    goto LABEL_13;
  }
  v11 = sub_10001D448();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "will perform biometric evaluation if needed", v13, 2u);
  }

  -[AppDelegate performBiometricAuthenticationIfNeeded](self, "performBiometricAuthenticationIfNeeded");
LABEL_13:

}

- (void)applicationWillTerminate:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will terminate", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DEDRequestAdvertiser sharedInstance](DEDRequestAdvertiser, "sharedInstance"));
  objc_msgSend(v5, "stop");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loginManager"));

  if (objc_msgSend(v7, "loginState") == (id)1)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[AppDelegate launchAction](self, "launchAction"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate launchAction](self, "launchAction"));
      v11 = objc_msgSend(v10, "isCaptive");

      if (v11)
      {
        v12 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "App was force quit in restricted mode, logging out.", v15, 2u);
        }

        objc_msgSend(v7, "logOut");
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate launchAction](self, "launchAction"));
        if (objc_msgSend(v13, "shouldMakeFBAVisible"))
        {
          v14 = +[iFBKUtils wasFBAVisibleAtFirstLaunch](iFBKUtils, "wasFBAVisibleAtFirstLaunch");

          if ((v14 & 1) == 0)
            +[iFBKUtils removeFromHomeScreen](iFBKUtils, "removeFromHomeScreen");
        }
        else
        {

        }
        -[AppDelegate setLaunchAction:](self, "setLaunchAction:", 0);
      }
    }
  }

}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void (**v13)(id, _QWORD);

  v13 = (void (**)(id, _QWORD))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(".")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("compose"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("applefeedback://new")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBKLaunchAction actionWithURL:](FBKLaunchAction, "actionWithURL:", v11));

    -[AppDelegate handleLaunchAction:completion:](self, "handleLaunchAction:completion:", v12, v13);
  }
  else
  {
    v13[2](v13, 0);
  }

}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = 136446210;
    v11 = "-[AppDelegate application:openURL:options:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}s]", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBKLaunchAction actionWithURL:](FBKLaunchAction, "actionWithURL:", v6));
  -[AppDelegate handleLaunchAction:completion:](self, "handleLaunchAction:completion:", v8, 0);

  return 1;
}

- (void)handleLaunchAction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  AppDelegate *v26;
  id v27;
  uint8_t buf[4];
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling Launch Action [%{public}@]", buf, 0xCu);
  }

  -[AppDelegate setLaunchAction:](self, "setLaunchAction:", v6);
  if ((objc_msgSend(v6, "launchesInbox") & 1) != 0)
    v9 = 1;
  else
    v9 = (uint64_t)objc_msgSend(v6, "isShowContentItemAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FBADraftManager sharedInstance](FBADraftManager, "sharedInstance"));
  objc_msgSend(v10, "setInboxLiteMode:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loginManager"));
  if (objc_msgSend(v6, "handlesLogin"))
  {
    objc_msgSend(v12, "clearLoginTaskQueue");
    v13 = +[FBALog newURLActionActivity](FBALog, "newURLActionActivity");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001DD50;
    block[3] = &unk_1000E6A50;
    v14 = &v24;
    v24 = v12;
    v25 = v6;
    v26 = self;
    v27 = v7;
    v15 = v6;
    v16 = v7;
    os_activity_apply(v13, block);

    v17 = v25;
  }
  else
  {
    -[AppDelegate updateHomeScreenVisibilityFromLaunchAction:](self, "updateHomeScreenVisibilityFromLaunchAction:", v6);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001DF64;
    v20[3] = &unk_1000E6AA0;
    v14 = &v22;
    v21 = v6;
    v22 = v7;
    v20[4] = self;
    v18 = v6;
    v19 = v7;
    objc_msgSend(v12, "runAfterLogin:", v20);
    v17 = v21;
  }

}

- (void)updateHomeScreenVisibilityFromLaunchAction:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "shouldMakeFBAVisible"))
  {
    +[iFBKUtils addToHomeScreen](iFBKUtils, "addToHomeScreen");
  }
  else if (objc_msgSend(v3, "shouldUndoMakeFBAVisible"))
  {
    +[iFBKUtils removeFromHomeScreen](iFBKUtils, "removeFromHomeScreen");
  }

}

- (void)handleInteractiveLoginResultWithLoginManager:(id)a3 pendingUI:(unint64_t)a4 startupFailures:(unint64_t)a5
{
  -[AppDelegate handleInteractiveLoginResultWithLoginManager:pendingUI:startupFailures:skipBiometrics:](self, "handleInteractiveLoginResultWithLoginManager:pendingUI:startupFailures:skipBiometrics:", a3, a4, a5, 0);
}

- (void)handleInteractiveLoginResultWithLoginManager:(id)a3 pendingUI:(unint64_t)a4 startupFailures:(unint64_t)a5 skipBiometrics:(BOOL)a6
{
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));

  if ((a5 & 1) != 0)
  {
    objc_msgSend(v11, "presentConnectionErrorUI");
    goto LABEL_9;
  }
  if ((a5 & 2) != 0)
  {
    objc_msgSend(v11, "presentVersionOutdatedUI");
    goto LABEL_9;
  }
  if ((a5 & 4) != 0)
  {
    objc_msgSend(v11, "displayNonParticipant");
LABEL_9:
    if (a4)
      goto LABEL_13;
    goto LABEL_10;
  }
  if (a4)
  {
    objc_msgSend(v11, "presentStartupUI:", a4);
    goto LABEL_13;
  }
  if (!a5)
    objc_msgSend(v11, "clearBlockingUI");
LABEL_10:
  if (objc_msgSend(v12, "loginState") == (id)1 && !a6)
    -[AppDelegate performBiometricAuthenticationIfNeeded](self, "performBiometricAuthenticationIfNeeded");
LABEL_13:

}

- (void)_performInteractiveLoginWithManager:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  AppDelegate *v9;

  v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_10001E2D4;
  v8[4] = sub_10001E2E4;
  v9 = self;
  if (objc_msgSend(v4, "loginState") != (id)3
    && objc_msgSend(v4, "loginState") != (id)4
    && objc_msgSend(v4, "loginState") != (id)1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001E2EC;
    v5[3] = &unk_1000E6AC8;
    v7 = v8;
    v6 = v4;
    objc_msgSend(v6, "interactiveStartupWithCompletion:", v5);

  }
  _Block_object_dispose(v8, 8);

}

- (void)addBlurView
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  if (+[iFBAConstants supportsBiometricsLock](iFBAConstants, "supportsBiometricsLock"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_100099C2C();

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate blurView](self, "blurView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

    if (!v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did add blur view", v9, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate blurView](self, "blurView"));
      objc_msgSend(v7, "addSubview:", v8);

    }
  }
}

- (void)removeBlurView
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100099C58();

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate blurView](self, "blurView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "did remove blur view", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate blurView](self, "blurView"));
    objc_msgSend(v7, "removeFromSuperview");

  }
}

- (BOOL)_touchIDDidTimeout
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("TouchIDLastRequested")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("TouchIDTimeoutDuration"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "timeIntervalSinceDate:", v3);
  LOBYTE(v5) = v7 >= (double)(uint64_t)v5;

  return (char)v5;
}

- (void)setBiometricsState:(unint64_t)a3
{
  AppDelegate *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  int v32;
  void *v33;

  v4 = self;
  objc_sync_enter(v4);
  v4->_biometricsState = a3;
  switch(a3)
  {
    case 0uLL:
      v22 = sub_10001D448();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Biometrics authentication is not enabled", (uint8_t *)&v32, 2u);
      }

      goto LABEL_38;
    case 1uLL:
      goto LABEL_38;
    case 2uLL:
      v10 = sub_10001D448();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Biometric evaluation pending. Will perform evaluation", (uint8_t *)&v32, 2u);
      }

      -[AppDelegate addBlurView](v4, "addBlurView");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate lastUsedLAContext](v4, "lastUsedLAContext"));
      -[AppDelegate _performBiometricsEvaluationWithContext:](v4, "_performBiometricsEvaluationWithContext:", v12);
      goto LABEL_12;
    case 3uLL:
      v24 = sub_10001D448();
      v14 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate lastUsedLAContext](v4, "lastUsedLAContext"));
        v32 = 138412290;
        v33 = v25;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Biometric evaluation began with context [%@]", (uint8_t *)&v32, 0xCu);

      }
      goto LABEL_34;
    case 4uLL:
    case 0xAuLL:
      v5 = sub_10001D448();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      LOWORD(v32) = 0;
      v7 = "Biometrics stuck - locking out";
      v8 = v6;
      v9 = OS_LOG_TYPE_INFO;
      goto LABEL_18;
    case 5uLL:
      v26 = sub_10001D448();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Biometrics evaluation happened while app was in background - Retrying", (uint8_t *)&v32, 2u);
      }

      -[AppDelegate addBlurView](v4, "addBlurView");
      -[AppDelegate performBiometricAuthenticationIfNeeded](v4, "performBiometricAuthenticationIfNeeded");
      goto LABEL_39;
    case 6uLL:
      v13 = sub_10001D448();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_34;
      LOWORD(v32) = 0;
      v15 = "Biometric evaluation completed";
      v16 = v14;
      v17 = OS_LOG_TYPE_INFO;
      goto LABEL_33;
    case 7uLL:
      v28 = sub_10001D448();
      v14 = objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      LOWORD(v32) = 0;
      v15 = "Biometric unlock failed - not authenticated";
      goto LABEL_32;
    case 8uLL:
      v18 = sub_10001D448();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Biometric unlock cancelled by user - likely that user pressed Cancel (suspending).", (uint8_t *)&v32, 2u);
      }

      -[AppDelegate addBlurView](v4, "addBlurView");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v12, "suspendReturningToLastApp:", 1);
LABEL_12:

      goto LABEL_39;
    case 9uLL:
      v29 = sub_10001D448();
      v14 = objc_claimAutoreleasedReturnValue(v29);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      LOWORD(v32) = 0;
      v15 = "Biometric unlock cancelled by system – likely that user went home.";
LABEL_32:
      v16 = v14;
      v17 = OS_LOG_TYPE_DEFAULT;
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, (uint8_t *)&v32, 2u);
LABEL_34:

      -[AppDelegate addBlurView](v4, "addBlurView");
      goto LABEL_39;
    case 0xBuLL:
      v20 = sub_10001D448();
      v6 = objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      LOWORD(v32) = 0;
      v7 = "Biometric unlock unavailable - biometry is in lockout.";
      goto LABEL_17;
    case 0xCuLL:
      v21 = sub_10001D448();
      v6 = objc_claimAutoreleasedReturnValue(v21);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      LOWORD(v32) = 0;
      v7 = "Biometric unlock failed - unknown error.";
LABEL_17:
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v32, 2u);
LABEL_19:

      -[AppDelegate _logOutForBiometricsAuthFailure](v4, "_logOutForBiometricsAuthFailure");
LABEL_39:
      objc_sync_exit(v4);

      return;
    case 0xDuLL:
      v30 = sub_10001D448();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Biometric unlock succeeded", (uint8_t *)&v32, 2u);
      }

      -[AppDelegate _invalidateWatchDogTimer](v4, "_invalidateWatchDogTimer");
      -[AppDelegate saveBiometricsDate](v4, "saveBiometricsDate");
LABEL_38:
      -[AppDelegate removeBlurView](v4, "removeBlurView");
      goto LABEL_39;
    default:
      goto LABEL_39;
  }
}

- (void)_invalidateWatchDogTimer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate biometricsWatchDog](self, "biometricsWatchDog"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate biometricsWatchDog](self, "biometricsWatchDog"));
    objc_msgSend(v4, "invalidate");

    -[AppDelegate setBiometricsWatchDog:](self, "setBiometricsWatchDog:", 0);
  }
}

- (void)_startBiometricsTimer
{
  id v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  AppDelegate *v9;
  id v10;

  -[AppDelegate _invalidateWatchDogTimer](self, "_invalidateWatchDogTimer");
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_10001EB24;
  v8 = &unk_1000E6AF0;
  v9 = self;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[AppDelegate lastUsedLAContext](self, "lastUsedLAContext"));
  v3 = v10;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v5, 8.0));
  -[AppDelegate setBiometricsWatchDog:](self, "setBiometricsWatchDog:", v4, v5, v6, v7, v8, v9);

}

- (void)_logOutForBiometricsAuthFailure
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AppDelegate addBlurView](self, "addBlurView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loginManager"));
  objc_msgSend(v4, "logOut");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (void)saveBiometricsDate
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  NSObject *v10;
  int v11;
  void *v12;

  if ((id)-[AppDelegate biometricsState](self, "biometricsState") == (id)13)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v4 = sub_10001D448();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](v3, "description"));
      v11 = 138412290;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving biometrics date [%@]", (uint8_t *)&v11, 0xCu);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v7, "setObject:forKey:", v3, CFSTR("TouchIDLastRequested"));

  }
  else
  {
    v8 = -[AppDelegate biometricsState](self, "biometricsState");
    v9 = sub_10001D448();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v3 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Not Authenticated. Will not save bio timer", (uint8_t *)&v11, 2u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      sub_100099E08();
    }
  }

}

- (id)newLAContext
{
  void *v3;

  v3 = (void *)objc_opt_new(LAContext, a2);
  -[AppDelegate setLastUsedLAContext:](self, "setLastUsedLAContext:", v3);
  return v3;
}

- (void)performBiometricAuthenticationIfNeeded
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  if (!+[iFBAConstants supportsBiometricsLock](iFBAConstants, "supportsBiometricsLock"))
    goto LABEL_12;
  if ((id)-[AppDelegate biometricsState](self, "biometricsState") == (id)3)
  {
    v3 = sub_10001D448();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already evaluating biometrics", buf, 2u);
    }

    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("UseTouchIDLogin"));

  if ((v6 & 1) == 0)
  {
LABEL_12:
    -[AppDelegate setBiometricsState:](self, "setBiometricsState:", 0);
    return;
  }
  v7 = sub_10001D448();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Biometrics authentication enabled", v18, 2u);
  }

  if (-[AppDelegate _touchIDDidTimeout](self, "_touchIDDidTimeout"))
  {
    v9 = -[AppDelegate newLAContext](self, "newLAContext");
    v16 = 0;
    v10 = objc_msgSend(v9, "canEvaluatePolicy:error:", 1, &v16);
    v11 = v16;
    v12 = v11;
    if ((v10 & 1) != 0)
    {
      v13 = 2;
    }
    else if (v11 && objc_msgSend(v11, "code") == (id)-8)
    {
      v13 = 11;
    }
    else
    {
      v13 = 12;
    }
    -[AppDelegate setBiometricsState:](self, "setBiometricsState:", v13);

  }
  else
  {
    v14 = sub_10001D448();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Biometrics authentication has not timed out", v17, 2u);
    }

    -[AppDelegate setBiometricsState:](self, "setBiometricsState:", 13);
  }
}

- (void)_performBiometricsEvaluationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  AppDelegate *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v5, "setObject:forKey:", &off_1000EE898, &off_1000EE8B0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_PROMPT"), &stru_1000EA660, 0));

  if (+[iFBKUtils deviceSupportsFaceID](iFBKUtils, "deviceSupportsFaceID"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACE_ID_PROMPT"), &stru_1000EA660, 0));

    v7 = (void *)v9;
  }
  objc_msgSend(v5, "setObject:forKey:", v7, &off_1000EE8C8);
  -[AppDelegate setBiometricsState:](self, "setBiometricsState:", 3);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001F2B0;
  v11[3] = &unk_1000E6B18;
  v12 = v4;
  v13 = self;
  v10 = v4;
  objc_msgSend(v10, "evaluatePolicy:options:reply:", 1, v5, v11);

}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[FBANotificationManager sharedManager](_TtC18Feedback_Assistant22FBANotificationManager, "sharedManager"));
  objc_msgSend(v5, "saveToken:", v4);

}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100099ED0(v4);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  _QWORD *v46;
  void (**v47)(_QWORD);
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  Block_layout *v56;
  void (**v57)(_QWORD);
  uint8_t buf[4];
  void *v59;

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_100099F4C();

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "request"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));

  v14 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "user info: %@", buf, 0xCu);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", FBKPushItemTypeKey));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", FBKPushItemIDKey));
  if (v16 && v15)
  {
    v48 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rootViewController"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewControllers"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastObject"));
    v22 = objc_opt_class(UINavigationController);
    isKindOfClass = objc_opt_isKindOfClass(v21, v22);

    if ((isKindOfClass & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewControllers"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastObject"));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topViewController"));
    }
    else
    {
      v26 = 0;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("Main"), 0));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10001FB84;
    v49[3] = &unk_1000E6BE8;
    v50 = v15;
    v28 = v26;
    v51 = v28;
    v29 = v27;
    v52 = v29;
    v30 = v19;
    v53 = v30;
    v54 = v16;
    v31 = v18;
    v55 = v31;
    v56 = &stru_1000E6B58;
    v47 = v8;
    v57 = v8;
    v46 = objc_retainBlock(v49);
    if ((objc_msgSend(v30, "isReloadingContentAndFormItems") & 1) != 0
      || (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "loginManager")),
          v33 = objc_msgSend(v32, "loginState"),
          v32,
          !v33))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "notificationCenter"));
      v36 = FBKDidRefreshContentItemsNotification;
      v37 = v13;
      v38 = v16;
      v39 = v15;
      v40 = v31;
      v41 = v29;
      v42 = v28;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
      v44 = v36;
      v34 = v46;
      v45 = objc_msgSend(v35, "addObserverForName:object:queue:usingBlock:", v44, v30, v43, v46);

      v28 = v42;
      v29 = v41;
      v31 = v40;
      v15 = v39;
      v16 = v38;
      v13 = v37;

    }
    else
    {
      v34 = v46;
      ((void (*)(_QWORD *, _QWORD))v46[2])(v46, 0);
    }

    v8 = v47;
    v7 = v48;
  }
  else
  {
    v8[2](v8);
  }

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 26);
}

- (unint64_t)supportedInterfaceOrientations
{
  if (qword_100118018 != -1)
    dispatch_once(&qword_100118018, &stru_1000E6C08);
  return qword_100118010;
}

- (void)blockLandscapeOrientations:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  __int16 v11;
  unint64_t v12;

  v3 = a3;
  if (a3)
    v5 = 6;
  else
    v5 = -[AppDelegate supportedInterfaceOrientations](self, "supportedInterfaceOrientations");
  -[AppDelegate setOrientationMask:](self, "setOrientationMask:", v5);
  v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 136446722;
    v8 = "-[AppDelegate blockLandscapeOrientations:]";
    v9 = 1024;
    v10 = v3;
    v11 = 2048;
    v12 = -[AppDelegate orientationMask](self, "orientationMask");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}s shouldBlock? [%i] mask [%lu]", (uint8_t *)&v7, 0x1Cu);
  }

}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle", a3, a4, a5));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "handleEventsForBackgroundURLSession", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loginManager"));
  objc_msgSend(v7, "backgroundStartupWithCompletion:", &stru_1000E6C28);

}

- (void)showSimpleAlertWithErrorTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000EA660, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 1, 0));
  objc_msgSend(v10, "addAction:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
  objc_msgSend(v9, "presentViewController:animated:completion:", v10, 1, 0);

}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  int64_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "viewControllerForColumn:", a4));
  v5 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController")),
        v7 = objc_opt_class(FBAEmptyViewController),
        isKindOfClass = objc_opt_isKindOfClass(v6, v7),
        v6,
        (isKindOfClass & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    v9 = 2;
  }

  return v9;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (unint64_t)biometricsState
{
  return self->_biometricsState;
}

- (LAContext)lastUsedLAContext
{
  return self->_lastUsedLAContext;
}

- (void)setLastUsedLAContext:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedLAContext, a3);
}

- (NSTimer)biometricsWatchDog
{
  return (NSTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBiometricsWatchDog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (FBKLaunchAction)launchAction
{
  return self->_launchAction;
}

- (void)setLaunchAction:(id)a3
{
  objc_storeStrong((id *)&self->_launchAction, a3);
}

- (unint64_t)orientationMask
{
  return self->_orientationMask;
}

- (void)setOrientationMask:(unint64_t)a3
{
  self->_orientationMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchAction, 0);
  objc_storeStrong((id *)&self->_biometricsWatchDog, 0);
  objc_storeStrong((id *)&self->_lastUsedLAContext, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
