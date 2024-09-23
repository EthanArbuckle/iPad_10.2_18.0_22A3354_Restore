@implementation CBSceneManager

+ (id)sharedInstance
{
  if (qword_10008BDD8 != -1)
    dispatch_once(&qword_10008BDD8, &stru_1000761C8);
  return (id)qword_10008BDD0;
}

- (CBSceneManager)init
{
  CBSceneManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *windowDict;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CBSceneManager;
  v2 = -[CBSceneManager init](&v7, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    windowDict = v2->_windowDict;
    v2->_windowDict = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_removeAllScenes", CFSTR("AppManagerPrimaryAppDidExit"), 0);

  }
  return v2;
}

- (void)addScene:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CBSceneWindow *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  CBRecordingIndicatorManager *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  uint8_t buf[4];
  void *v42;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBSceneManager sceneIdentifier:](CBSceneManager, "sceneIdentifier:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneManager windowDict](self, "windowDict"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (v7)
  {
    v8 = CheckerBoardLogHandleForCategory(9);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CBSceneManager: %@ already exists", buf, 0xCu);
    }
  }
  else
  {
    +[CBSceneManager windowLevel:](CBSceneManager, "windowLevel:", a3);
    v11 = v10;
    v9 = objc_claimAutoreleasedReturnValue(+[CBSceneManager rootViewController:](CBSceneManager, "rootViewController:", a3));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneDefinition definition](FBSMutableSceneDefinition, "definition"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneIdentity identityForIdentifier:](FBSSceneIdentity, "identityForIdentifier:", v5));
    objc_msgSend(v12, "setIdentity:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneClientIdentity localIdentity](FBSSceneClientIdentity, "localIdentity"));
    objc_msgSend(v12, "setClientIdentity:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindowSceneSpecification specification](UIWindowSceneSpecification, "specification"));
    objc_msgSend(v12, "setSpecification:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "specification"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneParameters parametersForSpecification:](FBSMutableSceneParameters, "parametersForSpecification:", v16));

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10002C4DC;
    v40[3] = &unk_100075B00;
    v40[4] = v11;
    objc_msgSend(v17, "updateSettingsWithBlock:", v40);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10002C590;
    v38[3] = &unk_1000761F0;
    v18 = v17;
    v39 = v18;
    objc_msgSend(v18, "updateClientSettingsWithBlock:", v38);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "createSceneWithDefinition:initialParameters:", v12, v18));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[FBLocalSynchronousSceneClientProvider sharedInstance](FBLocalSynchronousSceneClientProvider, "sharedInstance"));
    v37 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fbsSceneWithIdentifier:", v22));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[FBLocalSynchronousSceneClientProvider sharedInstance](FBLocalSynchronousSceneClientProvider, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "fbsSceneWithIdentifier:", v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindowScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v26));

    v28 = [CBSceneWindow alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v29, "_referenceBounds");
    v30 = -[CBSceneWindow _initWithFrame:debugName:scene:attached:](v28, "_initWithFrame:debugName:scene:attached:", v5, v23, 1);

    objc_msgSend(v30, "setWindowScene:", v27);
    objc_msgSend(v30, "setHidden:", 0);
    objc_msgSend(v30, "setLevel:", 1.0);
    v31 = CheckerBoardLogHandleForCategory(6);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Creating CBRecordingIndicatorManager for scene status bar", buf, 2u);
    }

    v33 = -[CBRecordingIndicatorManager initWithWindowScene:]([CBRecordingIndicatorManager alloc], "initWithWindowScene:", v27);
    objc_msgSend(v30, "setRecordingIndicatorManager:", v33);
    objc_msgSend(v30, "setRootViewController:", v9);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneManager windowDict](self, "windowDict"));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v30, v5);

    v35 = CheckerBoardLogHandleForCategory(9);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v5;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "CBSceneManager: created scene %@", buf, 0xCu);
    }

  }
}

- (id)presentViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = CheckerBoardLogHandleForCategory(9);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CBSceneManager: presenting %@", (uint8_t *)&v16, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBSceneManager sceneIdentifier:](CBSceneManager, "sceneIdentifier:", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneManager windowDict](self, "windowDict"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

  if (!v12)
    -[CBSceneManager addScene:](self, "addScene:", 0);
  objc_msgSend(v6, "setModalPresentationStyle:", 0);
  -[CBSceneManager _additionalSafeAreaInsets](self, "_additionalSafeAreaInsets");
  objc_msgSend(v6, "setAdditionalSafeAreaInsets:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneManager windowDict](self, "windowDict"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v10));

  objc_msgSend(v14, "presentViewController:animated:completion:", v6, 1, v7);
  return v14;
}

- (void)statusBarStyle:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;

  v5 = CheckerBoardLogHandleForCategory(9);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CBSceneManager: statusBarStyle %li", (uint8_t *)&v9, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneManager _rootStatusBarViewController](self, "_rootStatusBarViewController"));
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "statusBarStyle:", a3);

}

- (void)showSceneStatusBar
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CBSceneManager: showSceneStatusBar", v5, 2u);
  }

  -[CBSceneManager _showSceneStatusBar:](self, "_showSceneStatusBar:", 1);
}

- (void)hideSceneStatusBar
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CBSceneManager: hideSceneStatusBar", v5, 2u);
  }

  -[CBSceneManager _showSceneStatusBar:](self, "_showSceneStatusBar:", 0);
}

- (void)_showSceneStatusBar:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneManager _rootStatusBarViewController](self, "_rootStatusBarViewController"));
  if (v4)
  {
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "showStatusBar");
    else
      objc_msgSend(v4, "hideStatusBar");
    v4 = v5;
  }

}

- (id)_rootStatusBarViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v14[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBSceneManager sceneIdentifier:](CBSceneManager, "sceneIdentifier:", 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneManager windowDict](self, "windowDict"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
  v8 = objc_opt_class(CBRootStatusBarViewController, v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
  }
  else
  {
    v11 = CheckerBoardLogHandleForCategory(9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CBSceneManager: CBRootStatusBarViewController is nil", v14, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)_removeAllScenes
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CBSceneManager: _removeAllScenes", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneManager windowDict](self, "windowDict"));
  v6 = objc_msgSend(v5, "copy");

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CB8C;
  block[3] = &unk_1000753E8;
  v10 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneManager windowDict](self, "windowDict"));
  objc_msgSend(v8, "removeAllObjects");

}

+ (id)sceneIdentifier:(unint64_t)a3
{
  __CFString *v3;
  void *v4;

  if (a3 == 2)
  {
    v3 = CFSTR("checkerboard-diagnostics-statusbar");
  }
  else if (a3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager keyboardScene](FBSceneManager, "keyboardScene"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = CFSTR("checkerboard-diagnostics-viewcontroller");
  }
  return v3;
}

+ (double)windowLevel:(unint64_t)a3
{
  double result;

  result = UIWindowLevelStatusBar;
  if (!a3)
    result = UIWindowLevelStatusBar + 1.0;
  if (a3 == 1)
    result = UIWindowLevelStatusBar + 2.0;
  if (a3 == 2)
    return UIWindowLevelStatusBar + 3.0;
  return result;
}

+ (id)rootViewController:(unint64_t)a3
{
  __objc2_class **v3;

  if (a3)
  {
    if (a3 != 2)
      return 0;
    v3 = &off_100074948;
  }
  else
  {
    v3 = &off_100074968;
  }
  return objc_alloc_init(*v3);
}

- (UIEdgeInsets)_additionalSafeAreaInsets
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "_peripheryInsets");
  v4 = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windows"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statusBarManager"));
  objc_msgSend(v9, "statusBarFrame");
  v11 = v10;

  v12 = 0.0;
  if (v4 <= 0.0)
    v12 = v11;
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (NSMutableDictionary)windowDict
{
  return self->_windowDict;
}

- (void)setWindowDict:(id)a3
{
  objc_storeStrong((id *)&self->_windowDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowDict, 0);
}

@end
