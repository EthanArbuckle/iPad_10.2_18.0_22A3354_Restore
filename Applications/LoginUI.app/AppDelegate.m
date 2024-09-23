@implementation AppDelegate

+ (void)load
{
  +[AppDelegate setupTestEnvironmentIfNeeded](AppDelegate, "setupTestEnvironmentIfNeeded");
}

+ (void)initialize
{
  +[AppDelegate _hackCanShowWhileLockedMethodIfNeeded](AppDelegate, "_hackCanShowWhileLockedMethodIfNeeded");
}

+ (void)_hackCanShowWhileLockedMethodIfNeeded
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  if ((objc_msgSend(v6, "isLoginSession") & 1) != 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUser"));
    v4 = objc_msgSend(v3, "isLoginUser");

    if ((v4 & 1) == 0)
    {
      v5 = objc_opt_class(UIViewController);
      +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "_canShowWhileLocked", v5, "_canShowWhileLocked", objc_opt_class(LUIReluctantLockScreenHack));
    }
  }
  else
  {

  }
}

+ (void)setupTestEnvironmentIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;

  if (+[AppDelegate _underTestingEnvironment](AppDelegate, "_underTestingEnvironment"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("LUILocalAuthOnly"));

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TestCase")));

    if (objc_msgSend(v22, "isEqualToString:", CFSTR("ClassScreenTest")))
    {
      +[AppDelegate _setupEnvironmentForClassScreenTest](AppDelegate, "_setupEnvironmentForClassScreenTest");
    }
    else if (objc_msgSend(v22, "isEqualToString:", CFSTR("AppleIDScreenTest")))
    {
      +[AppDelegate _setupEnvironmentForAppleIDScreenTest](AppDelegate, "_setupEnvironmentForAppleIDScreenTest");
    }
    else if (objc_msgSend(v22, "isEqualToString:", CFSTR("AssignStudentScreenTest")))
    {
      +[AppDelegate _setupEnvironmentForAssignStudentScreenTest](AppDelegate, "_setupEnvironmentForAssignStudentScreenTest");
    }
    else if (objc_msgSend(v22, "isEqualToString:", CFSTR("RecentUserScreenTest")))
    {
      +[AppDelegate _setupEnvironmentForRecentUserScreenTest](AppDelegate, "_setupEnvironmentForRecentUserScreenTest");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hardwareWithoutHome")));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("YES"));

    if (v8)
    {
      v9 = objc_opt_class(BSPlatform);
      +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "homeButtonType", v9, "_test_homeButtonType_assignStudentScreen", objc_opt_class(AppDelegate));
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "environment"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("alternativeWifiPickerTrigger")));
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("YES"));

    if (v13)
      +[AppDelegate _setupWIFIPicker](AppDelegate, "_setupWIFIPicker");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "environment"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("LUITestShowFakeFooterNote")));
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("YES"));

    if (v17)
      +[AppDelegate _setupFooterNote](AppDelegate, "_setupFooterNote");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "environment"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("fastLaunch")));
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("YES"));

    if (v21)
      +[AppDelegate _setupFastLaunch](AppDelegate, "_setupFastLaunch");

  }
}

+ (void)_setupFastLaunch
{
  uint64_t v2;

  v2 = objc_opt_class(AppDelegate);
  +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "applicationDidBecomeActive:", v2, "_test_applicationDidBecomeActive:", objc_opt_class(AppDelegate));
}

+ (void)_setupFooterNote
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[16];

  v2 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting up test environment for footer note test", v5, 2u);
  }
  v3 = objc_opt_class(MCProfileConnection);
  +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "deviceLockScreenFootnote", v3, "_test_deviceLockScreenFootnote_footerNote", objc_opt_class(AppDelegate));
  v4 = objc_opt_class(MCProfileConnection);
  +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "deviceAssetTag", v4, "_test_deviceAssetTag_footerNote", objc_opt_class(AppDelegate));
}

+ (void)_setupWIFIPicker
{
  uint64_t v2;

  v2 = objc_opt_class(LUIHomeButtonController);
  +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "consumeSinglePressUpForButtonKind:", v2, "_test_consumeSinglePressUpForButtonKind_wifiPicker", objc_opt_class(AppDelegate));
}

+ (void)_setupEnvironmentForRecentUserScreenTest
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[16];

  v2 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting up test environment for recent user view", v5, 2u);
  }
  v3 = objc_opt_class(LKLoginController);
  +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "recentUsers", v3, "_test_recentUsers_recentUserScreen", objc_opt_class(AppDelegate));
  v4 = objc_opt_class(AppDelegate);
  +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "_fetchConfiguration:", v4, "_test_fetchConfiguration_appleIDScreen:", objc_opt_class(AppDelegate));
}

+ (void)_setupEnvironmentForClassScreenTest
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[16];

  v2 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting up test environment for class view", v4, 2u);
  }
  v3 = objc_opt_class(AppDelegate);
  +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "_fetchConfiguration:", v3, "_test_fetchConfiguration_classScreen:", objc_opt_class(AppDelegate));
}

+ (void)_setupEnvironmentForAppleIDScreenTest
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[16];

  v2 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting up test environment for apple ID view", v5, 2u);
  }
  v3 = objc_opt_class(AppDelegate);
  +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "_fetchConfiguration:", v3, "_test_fetchConfiguration_appleIDScreen:", objc_opt_class(AppDelegate));
  v4 = objc_opt_class(AppDelegate);
  +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "_setupLogViewerIfNeeded", v4, "_test_setupLogViewerIfNeeded_appleIDScreen", objc_opt_class(AppDelegate));
}

+ (void)_setupEnvironmentForAssignStudentScreenTest
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[16];

  v2 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting up test environment for assign student view", v4, 2u);
  }
  v3 = objc_opt_class(AppDelegate);
  +[AppDelegate _swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:](AppDelegate, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:", "_fetchConfiguration:", v3, "_test_fetchConfiguration_assignStudentScreen:", objc_opt_class(AppDelegate));
}

+ (void)_swapClassMethod:(SEL)a3 originalClass:(Class)a4 forNewClassMethod:(SEL)a5 newClass:(Class)a6
{
  Method ClassMethod;
  Method v11;
  Class Class;
  Class v13;

  ClassMethod = class_getClassMethod(a4, a3);
  v11 = class_getClassMethod(a6, a5);
  Class = object_getClass(a4);
  v13 = object_getClass(a6);
  +[AppDelegate _exchangeMethod:originalSelector:originalClass:forNewMethod:newSelector:newClass:](AppDelegate, "_exchangeMethod:originalSelector:originalClass:forNewMethod:newSelector:newClass:", ClassMethod, a3, Class, v11, a5, v13);
}

+ (void)_swapInstanceMethod:(SEL)a3 originalClass:(Class)a4 forNewInstanceMethod:(SEL)a5 newClass:(Class)a6
{
  Method InstanceMethod;
  Method v11;

  InstanceMethod = class_getInstanceMethod(a4, a3);
  v11 = class_getInstanceMethod(a6, a5);
  +[AppDelegate _exchangeMethod:originalSelector:originalClass:forNewMethod:newSelector:newClass:](AppDelegate, "_exchangeMethod:originalSelector:originalClass:forNewMethod:newSelector:newClass:", InstanceMethod, a3, a4, v11, a5, a6);
}

+ (void)_exchangeMethod:(objc_method *)a3 originalSelector:(SEL)a4 originalClass:(Class)a5 forNewMethod:(objc_method *)a6 newSelector:(SEL)a7 newClass:(Class)a8
{
  void (*Implementation)(void);
  const char *TypeEncoding;
  NSObject *v16;
  _BOOL4 v17;
  void (*v18)(void);
  const char *v19;
  int v20;
  const char *v21;

  Implementation = method_getImplementation(a6);
  TypeEncoding = method_getTypeEncoding(a6);
  LODWORD(a4) = class_addMethod(a5, a4, Implementation, TypeEncoding);
  v16 = qword_100088F08;
  v17 = os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)a4)
  {
    if (v17)
    {
      v20 = 136315138;
      v21 = "+[AppDelegate(Test) _exchangeMethod:originalSelector:originalClass:forNewMethod:newSelector:newClass:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Took replace path", (uint8_t *)&v20, 0xCu);
    }
    v18 = method_getImplementation(a3);
    v19 = method_getTypeEncoding(a3);
    class_replaceMethod(a8, a7, v18, v19);
  }
  else
  {
    if (v17)
    {
      v20 = 136315138;
      v21 = "+[AppDelegate(Test) _exchangeMethod:originalSelector:originalClass:forNewMethod:newSelector:newClass:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Took exchange path", (uint8_t *)&v20, 0xCu);
    }
    method_exchangeImplementations(a3, a6);
  }
}

+ (BOOL)_underTestingEnvironment
{
  unsigned int v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = +[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arguments"));
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("Testing"));

    LOBYTE(v2) = v5;
  }
  return v2;
}

- (void)_test_fetchConfiguration_classScreen:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environment"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClassConfigurationInfo")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, 0));
  v3[2](v3, v7, 0);

}

- (void)_test_fetchConfiguration_assignStudentScreen:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environment"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClassConfigurationInfo")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataUsingEncoding:", 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v8, 0, 0));
  v4[2](v4, v9, 0);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004C44;
  v11[3] = &unk_100068C30;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

- (int64_t)_test_homeButtonType_assignStudentScreen
{
  return 2;
}

- (void)_test_fetchConfiguration_appleIDScreen:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)_test_consumeSinglePressUpForButtonKind_wifiPicker
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("LUIHomeButtonDoubleTapNofication"), 0);

}

- (id)_test_recentUsers_recentUserScreen
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;
  void *v13;
  uint8_t buf[4];
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "environment"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RecentUserInfo")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));
  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v5, 0, &v12));
  v7 = v12;
  if (v7)
  {
    v8 = qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to create student info dictionary due to %@", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[LKUser userFromDictionary:](LKUser, "userFromDictionary:", v6));
    v13 = v10;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

  }
  return v9;
}

- (id)_test_deviceLockScreenFootnote_footerNote
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "environment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceLockScreenFootnote")));

  return v4;
}

- (id)_test_deviceAssetTag_footerNote
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "environment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceAssetTag")));

  return v4;
}

- (void)_test_applicationDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a3;
  if (byte_100088CD8 == 1)
  {
    -[AppDelegate _cleanUpEverything](self, "_cleanUpEverything");
    -[AppDelegate _initializeLoginWindow](self, "_initializeLoginWindow");
  }
  else
  {
    byte_100088CD8 = 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  LODWORD(v8) = 1120403456;
  objc_msgSend(v7, "setSpeed:", v8);

  -[AppDelegate _test_applicationDidBecomeActive:](self, "_test_applicationDidBecomeActive:", v9);
}

- (void)_cleanUpEverything
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __objc2_prot *v7;
  Class *v8;
  unint64_t i;
  Class v10;
  unsigned int outCount;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subviews"));
  objc_msgSend(v4, "makeObjectsPerformSelector:", "removeFromSuperview");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v5, "setRootViewController:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v6, "removeFromSuperview");

  -[AppDelegate setWindow:](self, "setWindow:", 0);
  v7 = &OBJC_PROTOCOL___LUIResetableSingleton_Test;
  outCount = 0;
  v8 = objc_copyClassList(&outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v10 = v8[i];
      if (class_getClassMethod(v10, "conformsToProtocol:")
        && -[objc_class conformsToProtocol:](v10, "conformsToProtocol:", v7)
        && (objc_opt_respondsToSelector(v10, "reset") & 1) != 0)
      {
        -[objc_class performSelectorOnMainThread:withObject:waitUntilDone:](v10, "performSelectorOnMainThread:withObject:waitUntilDone:", "reset", 0, 1);
      }
    }
  }
  free(v8);

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id mLegibilityObserver;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;

  v5 = a3;
  sub_10002D808();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  objc_msgSend(v7, "loginUICheckInWithCompletionHandler:", &stru_1000691D0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentUser"));
  v9 = objc_msgSend(v8, "mutableCopy");

  if (objc_msgSend(v9, "isLoginUser"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userAuxiliaryString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localeIdentifier"));

    if (v10 != v11)
    {
      v12 = (void *)qword_100088F08;
      if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userAuxiliaryString"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localeIdentifier"));
        v30 = 138412546;
        v31 = v14;
        v32 = 2112;
        v33 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting login user's language (%@) to current locale identifier (%@)", (uint8_t *)&v30, 0x16u);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localeIdentifier"));
      objc_msgSend(v9, "setUserAuxiliaryString:", v16);

      objc_msgSend(v9, "commitChanges");
    }
  }
  if (+[LUIAttentionAwareIdleTimer shouldSetupAttentionAwareIdleTimer](LUIAttentionAwareIdleTimer, "shouldSetupAttentionAwareIdleTimer"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[LUIAttentionAwareIdleTimer sharedInstance](LUIAttentionAwareIdleTimer, "sharedInstance"));
    objc_msgSend(v17, "setDelegate:", self);
    objc_msgSend(v17, "start");

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "preferredLocalizations"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale canonicalLanguageIdentifierFromString:](NSLocale, "canonicalLanguageIdentifierFromString:", v20));
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("ja")))
    +[LKUser setAutogeneratesPhoneticNameWithLocale:](LKUser, "setAutogeneratesPhoneticNameWithLocale:", v6);
  -[AppDelegate _initializeLoginWindow](self, "_initializeLoginWindow");
  objc_msgSend(v7, "registerUserListUpdateObserver:", self);
  if ((SBSUIWallpaperSetVariant(0) & 1) == 0)
  {
    v22 = qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v30) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Unable to switch to lock screen wallpaper variant", (uint8_t *)&v30, 2u);
    }
  }
  objc_msgSend(v5, "_setBackgroundStyle:", +[LUIUIUpdateSupport defaultBackgroundStyle](LUIUIUpdateSupport, "defaultBackgroundStyle"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "windowScene"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_FBSScene"));
  objc_msgSend(v25, "updateClientSettingsWithBlock:", &stru_100069210);

  -[AppDelegate enableWiFi](self, "enableWiFi");
  -[AppDelegate enableBluetooth](self, "enableBluetooth");
  -[AppDelegate disableAirplaneMode](self, "disableAirplaneMode");
  -[AppDelegate _connectToLoginD](self, "_connectToLoginD");
  -[AppDelegate clearPasteboard](self, "clearPasteboard");
  -[AppDelegate deleteAnyAccountsWeShould](self, "deleteAnyAccountsWeShould");
  if (MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) == 2)
    -[AppDelegate observeLockButtonDoubleTapEvent](self, "observeLockButtonDoubleTapEvent");
  else
    -[AppDelegate observeHomeButtonDoubleTapNotification](self, "observeHomeButtonDoubleTapNotification");
  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
    -[AppDelegate observeHomeButtonLongPressNotification](self, "observeHomeButtonLongPressNotification");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "addObserverForName:object:queue:usingBlock:", off_100087DE0, 0, 0, &stru_100069250));
  mLegibilityObserver = self->mLegibilityObserver;
  self->mLegibilityObserver = v27;

  return 1;
}

- (void)dealloc
{
  int mConfigurationDidChangeNotificationToken;
  void *v4;
  id mLegibilityObserver;
  objc_super v6;

  mConfigurationDidChangeNotificationToken = self->mConfigurationDidChangeNotificationToken;
  if (mConfigurationDidChangeNotificationToken != -1)
  {
    notify_cancel(mConfigurationDidChangeNotificationToken);
    self->mConfigurationDidChangeNotificationToken = -1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self->mLegibilityObserver);

  mLegibilityObserver = self->mLegibilityObserver;
  self->mLegibilityObserver = 0;

  -[AppDelegate endObservingHomeButtonDoubleTapNotification](self, "endObservingHomeButtonDoubleTapNotification");
  v6.receiver = self;
  v6.super_class = (Class)AppDelegate;
  -[AppDelegate dealloc](&v6, "dealloc");
}

- (void)_initializeLoginWindow
{
  LUISecureWindow *v3;
  void *v4;
  LUISecureWindow *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = [LUISecureWindow alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v5 = -[LUISecureWindow initWithFrame:](v3, "initWithFrame:");
  -[AppDelegate setWindow:](self, "setWindow:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

  -[AppDelegate generateLoginUserView](self, "generateLoginUserView");
  v15 = (id)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate navigationController](self, "navigationController"));
  objc_msgSend(v8, "setNavigationBarHidden:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate navigationController](self, "navigationController"));
  objc_msgSend(v9, "setDelegate:", v15);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v10, "setRootViewController:", self->_navigationController);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v11, "setBackgroundColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v13, "setOpaque:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v14, "makeKeyAndVisible");

}

- (void)generateLoginUserView
{
  LUINavigationController *v3;
  id v4;
  uint32_t v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v3 = objc_opt_new(LUINavigationController);
  -[AppDelegate setNavigationController:](self, "setNavigationController:", v3);

  objc_initWeak(&location, self);
  v4 = &_dispatch_main_q;
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100014EDC;
  v9 = &unk_100069278;
  objc_copyWeak(&v10, &location);
  v5 = notify_register_dispatch("com.apple.studentd.configuration.didchange", &self->mConfigurationDidChangeNotificationToken, (dispatch_queue_t)&_dispatch_main_q, &v6);

  if (v5)
    self->mConfigurationDidChangeNotificationToken = -1;
  -[AppDelegate readCachedClassRoster](self, "readCachedClassRoster", v6, v7, v8, v9);
  -[AppDelegate fetchConfiguration](self, "fetchConfiguration");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)deleteAnyAccountsWeShould
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allUsers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUser"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (((objc_msgSend(v10, "isAuditor") & 1) != 0
           || objc_msgSend(v10, "isTransientUser"))
          && (objc_msgSend(v10, "isEqual:", v4) & 1) == 0)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_1000150A4;
          v11[3] = &unk_1000692A0;
          v11[4] = v10;
          objc_msgSend(v2, "deleteUser:completionHandler:", v10, v11);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)presentUserLoginViewControllerForUserInfo:(id)a3 inClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllerStackForAssignedUser:inClass:", v7, v6));

  -[UINavigationController setViewControllers:animated:](self->_navigationController, "setViewControllers:animated:", v9, 1);
}

- (void)readCachedClassRoster
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  _QWORD v7[5];
  _QWORD block[5];
  id v9;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cachedClassConfiguration"));

  v5 = qword_100088F08;
  v6 = os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cached configuration found.", buf, 2u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001532C;
    block[3] = &unk_100068C30;
    block[4] = self;
    v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cached configuration not found. Setting up LoginUI with no configuration...", buf, 2u);
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100015338;
    v7[3] = &unk_100068C58;
    v7[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }

}

- (void)newClassRosterReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  objc_msgSend(v5, "setClassConfiguration:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "classConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "students"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "classConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instructors"));
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  LODWORD(v10) = objc_msgSend(v11, "BOOLForKey:", CFSTR("LUIAssignRandomImages"));

  if ((_DWORD)v10)
  {
    v12 = qword_100088F28;
    if (os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Assigning fixed images randomly to users", v15, 2u);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LUIRandomImageAssignment sharedInstance](LUIRandomImageAssignment, "sharedInstance"));
    objc_msgSend(v13, "assignImagesRandomlyToUsers:", v8);

  }
  else
  {
    -[AppDelegate fetchAllPhotosForUsers:](self, "fetchAllPhotosForUsers:", v8);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  objc_msgSend(v14, "setViewControllerStackAnimated:deferrable:", 1, 1);

}

- (void)fetchAllPhotosForUsers:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015570;
  block[3] = &unk_100068C58;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

- (void)_connectToLoginD
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  -[AppDelegate setLogindAcceptedOurConnection:](self, "setLogindAcceptedOurConnection:", 0);
  v3 = objc_alloc((Class)NSXPCConnection);
  v4 = objc_msgSend(v3, "initWithMachServiceName:options:", LKLoginDaemonLoginUIServiceName, 4096);
  -[AppDelegate setConnectionToLoginD:](self, "setConnectionToLoginD:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LKLoginUICheckInProtocol));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate connectionToLoginD](self, "connectionToLoginD"));
  objc_msgSend(v6, "setRemoteObjectInterface:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LKLoginUIProtocol));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate connectionToLoginD](self, "connectionToLoginD"));
  objc_msgSend(v8, "setExportedInterface:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate connectionToLoginD](self, "connectionToLoginD"));
  objc_msgSend(v9, "setExportedObject:", self);

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000157D8;
  v15[3] = &unk_1000692C8;
  objc_copyWeak(&v16, &location);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate connectionToLoginD](self, "connectionToLoginD"));
  objc_msgSend(v10, "setInterruptionHandler:", v15);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100015810;
  v13[3] = &unk_1000692C8;
  objc_copyWeak(&v14, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate connectionToLoginD](self, "connectionToLoginD"));
  objc_msgSend(v11, "setInvalidationHandler:", v13);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate connectionToLoginD](self, "connectionToLoginD"));
  objc_msgSend(v12, "resume");

  -[AppDelegate checkInWithLoginD](self, "checkInWithLoginD");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)checkInWithLoginD
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate connectionToLoginD](self, "connectionToLoginD"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &stru_1000692E8));

  objc_msgSend(v3, "loginUICheckedIn");
}

- (void)checkedInWithLoginD
{
  -[AppDelegate setLogindAcceptedOurConnection:](self, "setLogindAcceptedOurConnection:", 1);
}

- (void)presentUserSwitchTestDonePopup
{
  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100069308);
}

- (void)presentUserSwitchTestOngoingIndicatorWithCancelAction:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100015A4C;
    v5[3] = &unk_100069330;
    v5[4] = self;
    v6 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  }
}

- (void)hideUserSwitchTestOngoingIndicator
{
  _QWORD block[5];

  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015B60;
    block[3] = &unk_100068C58;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)chooseUserWithIdentifier:(id)a3 inClassWithID:(id)a4 password:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  void (**v11)(id, id);
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  void (**v21)(id, id);

  v10 = a5;
  v11 = (void (**)(id, id))a6;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "classInfoForClassID:", v12));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "studentForStudentIdentifier:inClass:", v13, v15));

    v12 = 0;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "studentForStudentIdentifier:", v13));

    if (v12)
      v12 = (id)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 6));
  }
  if (v13 && !v16)
  {
    v17 = objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 7));

    v12 = (id)v17;
  }
  if (v12)
  {
    if (v11)
      v11[2](v11, v12);
  }
  else if (v10)
  {
    -[AppDelegate programmaticallyAuthenticateWithUser:password:completionHandler:](self, "programmaticallyAuthenticateWithUser:password:completionHandler:", v16, v10, v11);
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100015D60;
    v18[3] = &unk_100069358;
    v18[4] = self;
    v19 = v16;
    v20 = v15;
    v21 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

  }
}

- (void)loginAppleID:(id)a3 password:(id)a4 localLoginOnly:(BOOL)a5 isTemporarySession:(BOOL)a6 withCompletionHandler:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  LKUser *v14;
  id v15;

  v8 = a6;
  v9 = a5;
  v15 = a3;
  v12 = a4;
  v13 = a7;
  kdebug_trace(728825860, 0, 0, 0, 0);
  if (v8)
  {
    v14 = (LKUser *)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
    -[LKUser startLoginFlowForAnonymousTemporaryUserWithResultResponder:](v14, "startLoginFlowForAnonymousTemporaryUserWithResultResponder:", 0);
  }
  else if (v9)
  {
    v14 = (LKUser *)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
    -[LKUser createAndLoginLocalUserWithUsername:password:completionHandler:](v14, "createAndLoginLocalUserWithUsername:password:completionHandler:", v15, v12, v13);
  }
  else
  {
    v14 = objc_opt_new(LKUser);
    -[LKUser setUsername:](v14, "setUsername:", v15);
    -[AppDelegate programmaticallyAuthenticateWithUser:password:completionHandler:](self, "programmaticallyAuthenticateWithUser:password:completionHandler:", v14, v12, v13);
  }

}

- (void)programmaticallyAuthenticateWithUser:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  SBSSetAllApplicationsShowProgress(1, 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100015F74;
  v12[3] = &unk_100069380;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "authenticateWithUser:password:completionHandler:", v9, v8, v12);

}

- (void)saveClassConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classRosterInformationFileURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Writing file to URL:\n %@ \n", buf, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "classRosterInformationFileURL"));
    objc_msgSend(v13, "writeToURL:atomically:", v15, 0);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000161B8;
    block[3] = &unk_1000693A8;
    block[4] = self;
    v18 = v6;
    v19 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 6));
    (*((void (**)(id, void *))v7 + 2))(v7, v16);

  }
}

- (void)fetchConfiguration
{
  NSObject *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching configuration", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000162A4;
  block[3] = &unk_100068C58;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)_fetchConfiguration:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016938;
  v4[3] = &unk_1000693F8;
  v5 = a3;
  v3 = v5;
  +[CRKClassroomConfiguration fetchConfiguration:](CRKClassroomConfiguration, "fetchConfiguration:", v4);

}

- (void)enableWiFi
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  uint64_t v4;

  global_queue = dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_100069418);

  v4 = SBSSpringBoardServerPort();
  SBSetApplicationNetworkFlags(v4, 1, 1);
  objc_msgSend(UIApp, "setUsesBackgroundNetwork:", 1);
}

- (void)disableAirplaneMode
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;

  global_queue = dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_100069438);

}

- (void)clearPasteboard
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
  objc_msgSend(v2, "setValue:forPasteboardType:", &stru_100069EB8, UIPasteboardNameGeneral);

}

- (void)enableBluetooth
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[LUIBluetoothSupport sharedInstance](LUIBluetoothSupport, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "bluetoothPowerStatusChanged:", CFSTR("LUIBluetoothPowerStatusChangedNotification"), 0);

  objc_msgSend(v4, "turnBluetoothOn");
}

- (void)bluetoothPowerStatusChanged:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[LUIBluetoothSupport sharedInstance](LUIBluetoothSupport, "sharedInstance", a3));
  objc_msgSend(v3, "bluetoothStatus");

}

- (void)userListDidUpdate
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "UMUserListUpdateObserver detected that user list updated. ", v3, 2u);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100069458);
}

- (void)endObservingHomeButtonDoubleTapNotification
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIHomeButtonController sharedController](LUIHomeButtonController, "sharedController"));
  objc_msgSend(v3, "deactivateTapType:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("LUIHomeButtonDoubleTapNofication"), 0);

}

- (void)observeHomeButtonDoubleTapNotification
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIHomeButtonController sharedController](LUIHomeButtonController, "sharedController"));
  objc_msgSend(v3, "activateTapType:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "menuButtonPressed", CFSTR("LUIHomeButtonDoubleTapNofication"), 0);

}

- (void)observeHomeButtonLongPressNotification
{
  void *v3;
  id v4;

  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIHomeButtonController sharedController](LUIHomeButtonController, "sharedController"));
    objc_msgSend(v3, "activateTapType:", 2);

    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "menuButtonLongPressed", CFSTR("LUIHomeButtonLongPressNofication"), 0);

  }
}

- (void)observeLockButtonDoubleTapEvent
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUILockButtonController sharedInstance](LUILockButtonController, "sharedInstance"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100016E8C;
  v3[3] = &unk_1000692C8;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "startConsumingLockButtonDoublePressEventWithAction:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)menuButtonPressed
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Home button / lock button double-press", v4, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIWiFiManager sharedInstance](LUIWiFiManager, "sharedInstance"));
  objc_msgSend(v3, "showWiFiPicker");

}

- (void)idleTimerFired
{
  NSObject *v3;
  LUIGettingReadyViewController *v4;
  LUIGettingReadyViewController *v5;
  _QWORD v6[5];
  LUIGettingReadyViewController *v7;
  uint8_t buf[16];

  v3 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Logout because of inactivity in login session", buf, 2u);
  }
  v4 = objc_opt_new(LUIGettingReadyViewController);
  -[LUIGettingReadyViewController setTitleType:](v4, "setTitleType:", 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001700C;
  v6[3] = &unk_100068C30;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

- (void)menuButtonLongPressed
{
  _QWORD block[5];

  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000171A8;
    block[3] = &unk_100068C58;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_setupLogViewerIfNeeded
{
  void *v3;
  LUILogViewerController *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate logViewerVC](self, "logViewerVC"));

  if (!v3)
  {
    v4 = objc_opt_new(LUILogViewerController);
    -[AppDelegate setLogViewerVC:](self, "setLogViewerVC:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate logViewerVC](self, "logViewerVC"));
    objc_msgSend(v5, "setup");

    v6 = (id)objc_claimAutoreleasedReturnValue(-[AppDelegate logViewerVC](self, "logViewerVC"));
    objc_msgSend(v6, "setDelegate:", self);

  }
}

- (void)logViewerControllerDidOpenLogViewer:(id)a3
{
  id v3;

  if (+[LUIAttentionAwareIdleTimer shouldSetupAttentionAwareIdleTimer](LUIAttentionAwareIdleTimer, "shouldSetupAttentionAwareIdleTimer", a3))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[LUIAttentionAwareIdleTimer sharedInstance](LUIAttentionAwareIdleTimer, "sharedInstance"));
    objc_msgSend(v3, "pause");

  }
}

- (void)logViewerControllerDidCloseLogViewer:(id)a3
{
  id v3;

  if (+[LUIAttentionAwareIdleTimer shouldSetupAttentionAwareIdleTimer](LUIAttentionAwareIdleTimer, "shouldSetupAttentionAwareIdleTimer", a3))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[LUIAttentionAwareIdleTimer sharedInstance](LUIAttentionAwareIdleTimer, "sharedInstance"));
    objc_msgSend(v3, "start");

  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (LUILogViewerController)logViewerVC
{
  return self->_logViewerVC;
}

- (void)setLogViewerVC:(id)a3
{
  objc_storeStrong((id *)&self->_logViewerVC, a3);
}

- (NSXPCConnection)connectionToLoginD
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConnectionToLoginD:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)logindAcceptedOurConnection
{
  return self->_logindAcceptedOurConnection;
}

- (void)setLogindAcceptedOurConnection:(BOOL)a3
{
  self->_logindAcceptedOurConnection = a3;
}

- (LUIUserSwitchTestOngoingIndicatorController)testOngoingIndicatorController
{
  return self->_testOngoingIndicatorController;
}

- (void)setTestOngoingIndicatorController:(id)a3
{
  objc_storeStrong((id *)&self->_testOngoingIndicatorController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testOngoingIndicatorController, 0);
  objc_storeStrong((id *)&self->_connectionToLoginD, 0);
  objc_storeStrong((id *)&self->_logViewerVC, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong(&self->mLegibilityObserver, 0);
}

@end
