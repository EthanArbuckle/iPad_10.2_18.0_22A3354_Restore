@implementation PBAAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  UIRootWindowScenePresentationBinder *v10;
  UIRootWindowScenePresentationBinder *rootWindowScenePresentationBinder;
  int64_t v12;
  void *v13;
  PBASecureWindow *v14;
  void *v15;
  UIWindow *v16;
  UIWindow *window;
  UIWindow *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PBADataRecoveryEngine *v23;
  PBADataRecoveryEngine *dataRecoveryEngine;
  PBAStackViewController *v25;
  PBAStackViewController *stackViewController;
  void *v27;
  unsigned int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint8_t v36[16];
  _QWORD v37[5];
  char v38;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance"));
  objc_msgSend(v6, "addObserver:", self);

  v7 = objc_alloc((Class)UIRootWindowScenePresentationBinder);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](FBDisplayManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainConfiguration"));
  v10 = (UIRootWindowScenePresentationBinder *)objc_msgSend(v7, "initWithPriority:displayConfiguration:", 0, v9);
  rootWindowScenePresentationBinder = self->_rootWindowScenePresentationBinder;
  self->_rootWindowScenePresentationBinder = v10;

  -[PBAAppDelegate _createInitialAppScene](self, "_createInitialAppScene");
  v12 = -[PBAAppDelegate _computeBootOrientation](self, "_computeBootOrientation");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  objc_msgSend(v13, "setOrientation:", v12);

  BKSHIDServicesLockOrientation(v12, 0);
  objc_msgSend(v5, "setStatusBarHidden:withAnimation:", 1, 0);

  v14 = [PBASecureWindow alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v15, "_referenceBounds");
  v16 = -[PBASecureWindow initWithFrame:](v14, "initWithFrame:");
  window = self->_window;
  self->_window = v16;

  v18 = self->_window;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UIWindow setBackgroundColor:](v18, "setBackgroundColor:", v19);

  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  LODWORD(v19) = objc_msgSend(v20, "BOOLForKey:", CFSTR("PBAForceMockRecovery"));

  if ((_DWORD)v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("111111"), "dataUsingEncoding:", 4));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SBFShamMobileKeyBag shamKeyBagWithRecoveryRequired:correctPasscode:](SBFShamMobileKeyBag, "shamKeyBagWithRecoveryRequired:correctPasscode:", 1, v21));

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SBFMobileKeyBag sharedInstance](SBFMobileKeyBag, "sharedInstance"));
  }
  v23 = -[PBADataRecoveryEngine initWithMobileKeyBag:]([PBADataRecoveryEngine alloc], "initWithMobileKeyBag:", v22);
  dataRecoveryEngine = self->_dataRecoveryEngine;
  self->_dataRecoveryEngine = v23;

  v25 = -[PBAStackViewController initWithNibName:bundle:]([PBAStackViewController alloc], "initWithNibName:bundle:", 0, 0);
  stackViewController = self->_stackViewController;
  self->_stackViewController = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v28 = objc_msgSend(v27, "isRequired");

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100004A54;
  v37[3] = &unk_1000187C0;
  v38 = v28;
  v37[4] = self;
  AnalyticsSendEventLazy(CFSTR("com.apple.preboard.activations"), v37);
  if (v28)
  {
    -[PBAAppDelegate presentLAPasscodeVerification](self, "presentLAPasscodeVerification");
  }
  else if (-[PBADataRecoveryEngine requiresDataRecovery](self->_dataRecoveryEngine, "requiresDataRecovery"))
  {
    -[PBAAppDelegate presentDataRecovery](self, "presentDataRecovery");
  }
  else
  {
    -[PBAAppDelegate presentDeviceUnlock](self, "presentDeviceUnlock");
  }
  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_stackViewController);
  -[PBAAppDelegate _setupTapToWakeRecognition](self, "_setupTapToWakeRecognition");
  -[PBAAppDelegate _reconfigureHomeButton](self, "_reconfigureHomeButton");
  -[PBAAppDelegate _setupHomeButtonRecognition](self, "_setupHomeButtonRecognition");
  v29 = +[_UIKeyboardArbiterHost launchAdvisorWithOmniscientDelegate:sceneDelegate:](_UIKeyboardArbiterHost, "launchAdvisorWithOmniscientDelegate:sceneDelegate:", 0, self);
  -[PBAAppDelegate _createInputUIScene](self, "_createInputUIScene");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[PBAHIDEventController sharedController](PBAHIDEventController, "sharedController"));
  objc_msgSend(v30, "startReceivingEvents");

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v31, "addObserver:selector:name:object:", self, "displayDidBlank:", CFSTR("PBAScreenDidBlankNotification"), 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v32, "addObserver:selector:name:object:", self, "displayWillUnblank:", CFSTR("PBAScreenWillUnblankNotification"), 0);

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000187E0);
  v33 = sub_100006038();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "now running", v36, 2u);
  }

  return 1;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  int64_t v4;

  v4 = -[PBAAppDelegate _computeBootOrientation](self, "_computeBootOrientation", a3, a4);
  if ((unint64_t)(v4 - 2) > 2)
    return 2;
  else
    return qword_1000176E0[v4 - 2];
}

- (void)authenticationPolicyEncounteredPolicyError:(id)a3
{
  if (-[PBADataRecoveryEngine requiresDataRecovery](self->_dataRecoveryEngine, "requiresDataRecovery", a3))
    -[PBAAppDelegate presentDataRecovery](self, "presentDataRecovery");
}

- (void)_setupTapToWakeRecognition
{
  SBFTapToWakeGestureRecognizer *v3;
  SBFTapToWakeGestureRecognizer *tapToWakeGestureRecognizer;

  v3 = (SBFTapToWakeGestureRecognizer *)objc_msgSend(objc_alloc((Class)SBFTapToWakeGestureRecognizer), "initWithTarget:action:", self, "tapToWake:");
  tapToWakeGestureRecognizer = self->_tapToWakeGestureRecognizer;
  self->_tapToWakeGestureRecognizer = v3;

  -[SBFTapToWakeGestureRecognizer setEnabled:](self->_tapToWakeGestureRecognizer, "setEnabled:", 0);
  -[UIWindow addGestureRecognizer:](self->_window, "addGestureRecognizer:", self->_tapToWakeGestureRecognizer);
}

- (void)_setupMouseButtonRecognition
{
  SBFMouseButtonDownGestureRecognizer *v3;
  SBFMouseButtonDownGestureRecognizer *mouseButtonDownGestureRecognizer;

  v3 = (SBFMouseButtonDownGestureRecognizer *)objc_msgSend(objc_alloc((Class)SBFMouseButtonDownGestureRecognizer), "initWithTarget:action:", self, "mouseButtonDown:");
  mouseButtonDownGestureRecognizer = self->_mouseButtonDownGestureRecognizer;
  self->_mouseButtonDownGestureRecognizer = v3;

  -[UIWindow addGestureRecognizer:](self->_window, "addGestureRecognizer:", self->_mouseButtonDownGestureRecognizer);
}

- (void)_setupHomeButtonRecognition
{
  UIHBClickGestureRecognizer *v3;
  UIHBClickGestureRecognizer *singlePressDownGestureRecognizer;
  UIHBClickGestureRecognizer *v5;
  UIHBClickGestureRecognizer *triplePressUpGestureRecognizer;

  v3 = (UIHBClickGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIHBClickGestureRecognizer), "initWithTarget:action:", self, "homeButtonSinglePressDown:");
  singlePressDownGestureRecognizer = self->_singlePressDownGestureRecognizer;
  self->_singlePressDownGestureRecognizer = v3;

  -[UIHBClickGestureRecognizer setRecognizesOnPressPhaseBegan:](self->_singlePressDownGestureRecognizer, "setRecognizesOnPressPhaseBegan:", 1);
  -[UIHBClickGestureRecognizer setClickCount:](self->_singlePressDownGestureRecognizer, "setClickCount:", 1);
  -[UIHBClickGestureRecognizer setEnabled:](self->_singlePressDownGestureRecognizer, "setEnabled:", 0);
  -[UIWindow addGestureRecognizer:](self->_window, "addGestureRecognizer:", self->_singlePressDownGestureRecognizer);
  v5 = (UIHBClickGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIHBClickGestureRecognizer), "initWithTarget:action:", self, "homeButtonTriplePressUp:");
  triplePressUpGestureRecognizer = self->_triplePressUpGestureRecognizer;
  self->_triplePressUpGestureRecognizer = v5;

  -[UIHBClickGestureRecognizer setClickCount:](self->_triplePressUpGestureRecognizer, "setClickCount:", 3);
  -[UIWindow addGestureRecognizer:](self->_window, "addGestureRecognizer:", self->_triplePressUpGestureRecognizer);
}

- (void)presentDataRecovery
{
  PBADataRecoveryViewController *v3;

  v3 = -[PBADataRecoveryViewController initWithContainingStackViewController:]([PBADataRecoveryViewController alloc], "initWithContainingStackViewController:", self->_stackViewController);
  -[PBADataRecoveryViewController setDataRecoveryEngine:](v3, "setDataRecoveryEngine:", self->_dataRecoveryEngine);
  -[PBAAppDelegate setMainViewController:](self, "setMainViewController:", v3);

}

- (void)presentDeviceUnlock
{
  PBADeviceUnlockViewController *v3;
  PBAAuthenticationPolicy *v4;

  v4 = objc_alloc_init(PBAAuthenticationPolicy);
  -[PBAAuthenticationPolicy setDelegate:](v4, "setDelegate:", self);
  v3 = -[PBADevicePasscodeViewController initWithContainingStackViewController:authenticationPolicy:]([PBADeviceUnlockViewController alloc], "initWithContainingStackViewController:authenticationPolicy:", self->_stackViewController, v4);
  -[PBAAppDelegate setMainViewController:](self, "setMainViewController:", v3);

}

- (void)presentLAPasscodeVerification
{
  PBAProtectedOptionsViewController *v3;
  PBAAuthenticationPolicy *v4;

  v4 = objc_alloc_init(PBAAuthenticationPolicy);
  -[PBAAuthenticationPolicy setDelegate:](v4, "setDelegate:", self);
  v3 = -[PBADevicePasscodeViewController initWithContainingStackViewController:authenticationPolicy:]([PBAProtectedOptionsViewController alloc], "initWithContainingStackViewController:authenticationPolicy:", self->_stackViewController, v4);
  -[PBAAppDelegate setMainViewController:](self, "setMainViewController:", v3);

}

- (void)setMainViewController:(id)a3
{
  PBAStackViewController *stackViewController;
  void *v5;
  _BOOL8 v6;
  id v7;

  stackViewController = self->_stackViewController;
  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAStackViewController topViewController](stackViewController, "topViewController"));
  v6 = v5 != 0;

  -[PBAAppDelegate setMainViewController:animated:](self, "setMainViewController:animated:", v7, v6);
}

- (void)setMainViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIViewController *v7;
  UIViewController **p_mainViewController;
  PBAStackViewController *stackViewController;
  void *v10;
  UIViewController *v11;

  v4 = a4;
  v7 = (UIViewController *)a3;
  p_mainViewController = &self->_mainViewController;
  if (self->_mainViewController != v7)
  {
    objc_storeStrong((id *)&self->_mainViewController, a3);
    stackViewController = self->_stackViewController;
    v11 = *p_mainViewController;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    -[PBAStackViewController setViewControllers:animated:](stackViewController, "setViewControllers:animated:", v10, v4);

  }
}

- (void)_reconfigureHomeButton
{
  const __CFArray *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  float v6;
  double v7;
  float v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;

  v2 = (const __CFArray *)_AXSTripleClickCopyOptions(self, a2);
  v3 = sub_100006038();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10000C6E4((uint64_t)v2, v4);

  if (v2)
  {
    if (CFArrayGetCount(v2) < 1)
      v5 = 1;
    else
      v5 = 3;
    CFRelease(v2);
  }
  else
  {
    v5 = 1;
  }
  v6 = _AXSHomeClickSpeed();
  v7 = 0.100000001;
  if (v6 <= 0.0)
  {
    v8 = 0.3;
  }
  else
  {
    v8 = v6;
    v9 = sub_100006038();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "maximumMultiplePressInterval override from AX is:%g", buf, 0xCu);
    }

    if (v8 < 0.1)
    {
      v11 = sub_100006038();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v7 = v8;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        v20 = v8;
        v21 = 2048;
        v22 = v8;
        v23 = 2048;
        v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "multiplePressInterval: minimum > maximum, using maximum(%g): %g > %g", buf, 0x20u);
      }

    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKSButtonHapticsDefinition definitionForHomeButton](BKSButtonHapticsDefinition, "definitionForHomeButton"));
  objc_msgSend(v13, "setMaximumPressCount:", v5);
  objc_msgSend(v13, "setMinimumMultiplePressTimeInterval:", v7);
  objc_msgSend(v13, "setMaximumMultiplePressTimeInterval:", v8);
  v14 = sub_100006038();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = *(double *)&v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "new button definition:%{public}@", buf, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKSButtonHapticsController sharedInstance](BKSButtonHapticsController, "sharedInstance"));
  v18 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  objc_msgSend(v16, "applyDefinitions:", v17);

}

- (void)_resetIdleTimerForReason:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a3;
  v4 = sub_100006038();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Resetting idle timer if needed (reason:%{public}@)", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBAIdleSleepController sharedController](PBAIdleSleepController, "sharedController"));
  if (objc_msgSend(v6, "isDisplayDim"))
    objc_msgSend(v6, "resetIdleTimerAndUndim:", 1);

}

- (void)homeButtonSinglePressDown:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
    -[PBAAppDelegate _resetIdleTimerForReason:](self, "_resetIdleTimerForReason:", CFSTR("home button single press down"));
}

- (void)homeButtonTriplePressUp:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (objc_msgSend(a3, "state") == (id)3)
  {
    v3 = sub_100006038();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "home button triple press up! Hello AX", v5, 2u);
    }

    _AXSHandleTripleClickHomeButtonPress();
  }
}

- (void)tapToWake:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
    -[PBAAppDelegate _resetIdleTimerForReason:](self, "_resetIdleTimerForReason:", CFSTR("tap to wake"));
}

- (void)mouseButtonDown:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
    -[PBAAppDelegate _resetIdleTimerForReason:](self, "_resetIdleTimerForReason:", CFSTR("mouse button"));
}

- (void)displayDidBlank:(id)a3
{
  id v4;
  id v5;
  id v6;
  BKSTouchStream *v7;
  BKSTouchStream *touchStream;

  v4 = objc_alloc((Class)BKSTouchStream);
  v5 = -[UIWindow _contextId](self->_window, "_contextId");
  v6 = objc_alloc_init((Class)BKSTouchStreamPolicy);
  v7 = (BKSTouchStream *)objc_msgSend(v4, "initWithContextID:displayUUID:identifier:policy:", v5, 0, 1, v6);
  touchStream = self->_touchStream;
  self->_touchStream = v7;

  -[SBFTapToWakeGestureRecognizer setEnabled:](self->_tapToWakeGestureRecognizer, "setEnabled:", 1);
  -[UIHBClickGestureRecognizer setEnabled:](self->_singlePressDownGestureRecognizer, "setEnabled:", 1);
}

- (void)displayWillUnblank:(id)a3
{
  BKSTouchStream *touchStream;

  -[UIHBClickGestureRecognizer setEnabled:](self->_singlePressDownGestureRecognizer, "setEnabled:", 0);
  -[SBFTapToWakeGestureRecognizer setEnabled:](self->_tapToWakeGestureRecognizer, "setEnabled:", 0);
  -[BKSTouchStream invalidate](self->_touchStream, "invalidate");
  touchStream = self->_touchStream;
  self->_touchStream = 0;

}

- (void)_createInitialAppScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];

  v13 = (id)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneDefinition definition](FBSMutableSceneDefinition, "definition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneIdentity identityForIdentifier:](FBSSceneIdentity, "identityForIdentifier:", v4));
  objc_msgSend(v13, "setIdentity:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneClientIdentity localIdentity](FBSSceneClientIdentity, "localIdentity"));
  objc_msgSend(v13, "setClientIdentity:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationSceneSpecification specification](UIApplicationSceneSpecification, "specification"));
  objc_msgSend(v13, "setSpecification:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "specification"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneParameters parametersForSpecification:](FBSMutableSceneParameters, "parametersForSpecification:", v8));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000058B4;
  v16[3] = &unk_100018828;
  v16[4] = self;
  objc_msgSend(v9, "updateSettingsWithBlock:", v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005990;
  v14[3] = &unk_100018850;
  v15 = v9;
  v10 = v9;
  objc_msgSend(v10, "updateClientSettingsWithBlock:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "createSceneWithDefinition:initialParameters:", v13, v10));

  -[UIRootWindowScenePresentationBinder addScene:](self->_rootWindowScenePresentationBinder, "addScene:", v12);
}

- (void)_createInputUIScene
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
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void **v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  PBAAppDelegate *v35;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
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
        v30 = _NSConcreteStackBlock;
        v31 = 3221225472;
        v32 = sub_100005C08;
        v33 = &unk_100018878;
        v34 = (id)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](FBDisplayManager, "mainConfiguration"));
        v35 = self;
        v12 = v34;
        -[NSObject performUpdate:](v11, "performUpdate:", &v30);
        -[UIRootWindowScenePresentationBinder addScene:](self->_rootWindowScenePresentationBinder, "addScene:", v11, v30, v31, v32, v33);

      }
      else
      {
        v21 = sub_100006038();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_10000C78C(v22, v23, v24, v25, v26, v27, v28, v29);

      }
    }
    else
    {
      v13 = sub_100006038();
      v11 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10000C758(v11, v14, v15, v16, v17, v18, v19, v20);
    }

  }
}

- (int64_t)_computeBootOrientation
{
  int v2;
  int64_t v3;

  v2 = MGGetSInt32Answer(CFSTR("DisplayBootRotation"), 0xFFFFFFFFLL);
  v3 = 1;
  if (v2 == 90)
    v3 = 3;
  if (v2 == 180)
    v3 = 2;
  if (v2 == 270)
    return 4;
  else
    return v3;
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  v6 = (void *)_UIKeyboardArbiter_SceneIdentifier;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    v8 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");

    if ((v8 & 1) == 0)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100005DAC;
      v9[3] = &unk_1000188E0;
      v9[4] = self;
      v10 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

    }
  }
  else
  {

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

- (UIRootWindowScenePresentationBinder)rootWindowScenePresentationBinder
{
  return self->_rootWindowScenePresentationBinder;
}

- (void)setRootWindowScenePresentationBinder:(id)a3
{
  objc_storeStrong((id *)&self->_rootWindowScenePresentationBinder, a3);
}

- (UIViewController)mainViewController
{
  return self->_mainViewController;
}

- (UIHBClickGestureRecognizer)singlePressDownGestureRecognizer
{
  return self->_singlePressDownGestureRecognizer;
}

- (void)setSinglePressDownGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_singlePressDownGestureRecognizer, a3);
}

- (UIHBClickGestureRecognizer)triplePressUpGestureRecognizer
{
  return self->_triplePressUpGestureRecognizer;
}

- (void)setTriplePressUpGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_triplePressUpGestureRecognizer, a3);
}

- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer
{
  return self->_tapToWakeGestureRecognizer;
}

- (void)setTapToWakeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapToWakeGestureRecognizer, a3);
}

- (SBFMouseButtonDownGestureRecognizer)mouseButtonDownGestureRecognizer
{
  return self->_mouseButtonDownGestureRecognizer;
}

- (void)setMouseButtonDownGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_mouseButtonDownGestureRecognizer, a3);
}

- (BKSTouchStream)touchStream
{
  return self->_touchStream;
}

- (void)setTouchStream:(id)a3
{
  objc_storeStrong((id *)&self->_touchStream, a3);
}

- (PBADataRecoveryEngine)dataRecoveryEngine
{
  return self->_dataRecoveryEngine;
}

- (void)setDataRecoveryEngine:(id)a3
{
  objc_storeStrong((id *)&self->_dataRecoveryEngine, a3);
}

- (PBAStackViewController)stackViewController
{
  return self->_stackViewController;
}

- (void)setStackViewController:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewController, 0);
  objc_storeStrong((id *)&self->_dataRecoveryEngine, 0);
  objc_storeStrong((id *)&self->_touchStream, 0);
  objc_storeStrong((id *)&self->_mouseButtonDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToWakeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_triplePressUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singlePressDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_mainViewController, 0);
  objc_storeStrong((id *)&self->_rootWindowScenePresentationBinder, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
