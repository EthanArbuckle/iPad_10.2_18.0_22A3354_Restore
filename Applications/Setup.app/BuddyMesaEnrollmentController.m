@implementation BuddyMesaEnrollmentController

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  BuddyMesaEnrollmentController *v5;

  v5 = self;
  v4 = a2;
  -[BiometricKitUIEnrollViewController setDelegate:](self->_enrollController, "setDelegate:", 0);
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)BuddyMesaEnrollmentController;
  -[BuddyMesaEnrollmentController dealloc](&v3, "dealloc");
}

- (BOOL)controllerNeedsToRun
{
  MCProfileConnection *v2;
  unsigned int v3;
  BYCapabilities *v4;
  char v5;
  BYPreferencesController *v6;
  char v7;
  unsigned __int8 v8;
  BOOL v9;
  char v11;
  BYPreferencesController *v12;
  char v13;
  BYCapabilities *v14;
  BOOL v15;
  BOOL v17;

  v2 = -[BuddyMesaEnrollmentController managedConfiguration](self, "managedConfiguration");
  v3 = -[MCProfileConnection effectiveBoolValueForSetting:](v2, "effectiveBoolValueForSetting:", MCFeatureFingerprintModificationAllowed);

  if (v3 == 2)
    return 0;
  v4 = -[BuddyMesaEnrollmentController capabilities](self, "capabilities");
  v13 = 0;
  v5 = 0;
  if ((-[BYCapabilities supportsTouchID](v4, "supportsTouchID") & 1) != 0)
  {
    v14 = -[BuddyMesaEnrollmentController capabilities](self, "capabilities");
    v13 = 1;
    v5 = -[BYCapabilities isTouchIDEnrolled](v14, "isTouchIDEnrolled") ^ 1;
  }
  if ((v13 & 1) != 0)

  v15 = v5 & 1;
  v6 = -[BuddyMesaEnrollmentController buddyPreferences](self, "buddyPreferences");
  v7 = 0;
  if ((-[BYPreferencesController BOOLForKey:](v6, "BOOLForKey:", CFSTR("Payment2Presented")) & 1) == 0)
    v7 = MGGetBoolAnswer(CFSTR("0dnM19zBqLw5ZPhIo4GEkg")) & 1;

  v11 = 0;
  if ((v7 & 1) != 0
    || (v12 = -[BuddyMesaEnrollmentController buddyPreferences](self, "buddyPreferences"),
        v11 = 1,
        v8 = -[BYPreferencesController BOOLForKey:](v12, "BOOLForKey:", CFSTR("Mesa2Presented")),
        v9 = 0,
        (v8 & 1) == 0))
  {
    v9 = v15;
  }
  v17 = v9;
  if ((v11 & 1) != 0)

  return v17;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  MCProfileConnection *v3;
  unsigned __int8 v4;
  BYPasscodeCacheManager *v5;
  id v6;
  NSObject *v7;
  void **block;
  int v9;
  int v10;
  void (*v11)(_QWORD *);
  void *v12;
  id v13;
  int v14;
  id location[2];
  BuddyMesaEnrollmentController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMesaEnrollmentController managedConfiguration](v16, "managedConfiguration");
  v4 = -[MCProfileConnection isPasscodeSet](v3, "isPasscodeSet");

  if ((v4 & 1) == 0)
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    goto LABEL_6;
  }
  v5 = -[BuddyMesaEnrollmentController passcodeCacheManager](v16, "passcodeCacheManager");
  v6 = -[BYPasscodeCacheManager cachedPasscode](v5, "cachedPasscode");

  if (!v6)
  {
    v7 = dispatch_get_global_queue(25, 0);
    block = _NSConcreteStackBlock;
    v9 = -1073741824;
    v10 = 0;
    v11 = sub_1000801E4;
    v12 = &unk_100280780;
    v13 = location[0];
    dispatch_async(v7, &block);

    objc_storeStrong(&v13, 0);
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  v14 = 1;
LABEL_7:
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupBiometric;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

+ (BOOL)hiddenFromStoreDemoMode
{
  return 1;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BuddyMesaEnrollmentController)init
{
  NSNotificationCenter *v2;
  NSNotificationCenter *v3;
  BuddyMesaEnrollmentController *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMesaEnrollmentController;
  location = -[BuddyMesaEnrollmentController init](&v6, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v2, "addObserver:selector:name:object:", location, "didBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

    v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", location, "didResignActive:", UIApplicationWillResignActiveNotification, 0);

  }
  v4 = (BuddyMesaEnrollmentController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BOOL)controllerAllowsNavigatingBack
{
  BYCapabilities *v2;
  char v3;

  v2 = -[BuddyMesaEnrollmentController capabilities](self, "capabilities", a2, self);
  v3 = -[BYCapabilities isTouchIDEnrolled](v2, "isTouchIDEnrolled") ^ 1;

  return v3 & 1;
}

- (BOOL)isEphemeral
{
  BYCapabilities *v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  char v6;
  BYCapabilities *v7;
  char v9;

  v2 = -[BuddyMesaEnrollmentController capabilities](self, "capabilities");
  v3 = -[BYCapabilities supportsTouchID](v2, "supportsTouchID");
  v6 = 0;
  v4 = 0;
  if ((v3 & 1) != 0)
  {
    v7 = -[BuddyMesaEnrollmentController capabilities](self, "capabilities");
    v6 = 1;
    v4 = -[BYCapabilities isTouchIDEnrolled](v7, "isTouchIDEnrolled");
  }
  v9 = v4 & 1;
  if ((v6 & 1) != 0)

  return v9 & 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (void)controllerWasPopped
{
  BYPreferencesController *v2;

  v2 = -[BuddyMesaEnrollmentController buddyPreferences](self, "buddyPreferences", a2, self);
  -[BYPreferencesController removeObjectForKey:](v2, "removeObjectForKey:", CFSTR("Mesa2Presented"));

}

- (void)didBecomeActive:(id)a3
{
  uint64_t v3;
  BOOL v4;
  char v5;
  BuddyMesaEnrollmentController *v6;
  char v7;
  id v8;
  os_log_t oslog;
  id location[2];
  BuddyMesaEnrollmentController *v11;
  uint8_t buf[24];

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000806F4((uint64_t)buf, (uint64_t)"-[BuddyMesaEnrollmentController didBecomeActive:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "BuddyMesaController: %s", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = 0;
  v5 = 0;
  v4 = 0;
  if (!v11->_enrollController)
  {
    v8 = -[BuddyMesaEnrollmentController navigationController](v11, "navigationController");
    v7 = 1;
    v6 = (BuddyMesaEnrollmentController *)objc_msgSend(v8, "topViewController");
    v5 = 1;
    v4 = v6 == v11;
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  if (v4)
    -[BuddyMesaEnrollmentController beginEnrollment](v11, "beginEnrollment");
  objc_storeStrong(location, 0);
}

- (void)didResignActive:(id)a3
{
  uint64_t v3;
  BOOL v4;
  char v5;
  BuddyMesaEnrollmentController *v6;
  char v7;
  id v8;
  os_log_t oslog;
  id location[2];
  BuddyMesaEnrollmentController *v11;
  uint8_t buf[24];

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000806F4((uint64_t)buf, (uint64_t)"-[BuddyMesaEnrollmentController didResignActive:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "BuddyMesaController: %s", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = 0;
  v5 = 0;
  v4 = 0;
  if (!v11->_enrollComplete)
  {
    v8 = -[BuddyMesaEnrollmentController navigationController](v11, "navigationController");
    v7 = 1;
    v6 = (BuddyMesaEnrollmentController *)objc_msgSend(v8, "topViewController");
    v5 = 1;
    v4 = v6 == v11;
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  if (v4)
    -[BuddyMesaEnrollmentController deleteIdentity](v11, "deleteIdentity");
  -[BuddyMesaEnrollmentController endEnrollment](v11, "endEnrollment");
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  NSBundle *v2;
  NSString *v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  BuddyMesaEnrollmentController *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMesaEnrollmentController;
  -[BuddyMesaEnrollmentController viewDidLoad](&v6, "viewDidLoad");
  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID"), &stru_100284738, CFSTR("Localizable"));
  v4 = -[BuddyMesaEnrollmentController navigationItem](v8, "navigationItem");
  objc_msgSend(v4, "setBackButtonTitle:", v3);

  v5 = -[BuddyMesaEnrollmentController navigationItem](v8, "navigationItem");
  objc_msgSend(v5, "setLeftItemsSupplementBackButton:", 0);

}

- (BOOL)prefersStatusBarHidden
{
  BiometricKitUIEnrollViewController *v2;
  unsigned __int8 v3;

  v2 = -[BuddyMesaEnrollmentController enrollController](self, "enrollController", a2, self);
  v3 = -[BiometricKitUIEnrollViewController prefersStatusBarHidden](v2, "prefersStatusBarHidden");

  return v3 & 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BYPaneFeatureAnalyticsManager *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;
  os_log_type_t v9;
  os_log_t oslog;
  BOOL v11;
  SEL v12;
  BuddyMesaEnrollmentController *v13;
  uint8_t buf[24];

  v13 = self;
  v12 = a2;
  v11 = a3;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000806F4((uint64_t)buf, (uint64_t)"-[BuddyMesaEnrollmentController viewWillAppear:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, "BuddyMesaController: %s", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v8.receiver = v13;
  v8.super_class = (Class)BuddyMesaEnrollmentController;
  -[BuddyMesaEnrollmentController viewWillAppear:](&v8, "viewWillAppear:", v11);
  v3 = -[BuddyMesaEnrollmentController paneFeatureAnalyticsManager](v13, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v3, "clearActionForFeature:", 12);

  v4 = -[BuddyMesaEnrollmentController view](v13, "view");
  v5 = objc_msgSend(v4, "window");
  v6 = objc_msgSend(v5, "windowScene");
  v7 = objc_msgSend(v6, "activationState");

  if (!v7)
    -[BuddyMesaEnrollmentController beginEnrollment](v13, "beginEnrollment");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyMesaEnrollmentController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMesaEnrollmentController;
  -[BuddyMesaEnrollmentController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
  -[BuddyMesaEnrollmentController endEnrollment](v6, "endEnrollment");
}

- (void)beginEnrollment
{
  NSObject *v2;
  os_log_type_t v3;
  LAContext *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location;
  id v14;
  id v15;
  uint8_t buf[7];
  os_log_type_t v17;
  os_log_t oslog[2];
  BuddyMesaEnrollmentController *v19;

  v19 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v17;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "BuddyMesaController: Beginning enrollment", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v15 = objc_msgSend(sub_100080EC8(), "sharedInstance");
  v14 = objc_msgSend(v15, "getEnrollUIViewController:bundleName:", 1, 0);
  if (v14)
  {
    -[BuddyMesaEnrollmentController resetAuthContext](v19, "resetAuthContext");
    v4 = -[BuddyMesaEnrollmentController authContext](v19, "authContext");
    location = -[LAContext externalizedContext](v4, "externalizedContext");

    if (location)
      objc_msgSend(v14, "setProperty:forKey:", location, CFSTR("credset"));
    v5 = -[BuddyMesaEnrollmentController menuButtonPressedBlock](v19, "menuButtonPressedBlock");
    v6 = objc_retainBlock(v5);
    objc_msgSend(v14, "setProperty:forKey:", v6, CFSTR("MENU_ACTION"));

    objc_msgSend(v14, "setProperty:forKey:", &__kCFBooleanTrue, CFSTR("IN_BUDDY"));
    v7 = objc_msgSend(sub_100080FB4(), "manager");
    objc_msgSend(v14, "setBiometricKit:", v7);

    objc_msgSend(v14, "setDelegate:", v19);
    -[BuddyMesaEnrollmentController addChildViewController:](v19, "addChildViewController:", v14);
    v8 = objc_msgSend(v14, "view");
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v9 = -[BuddyMesaEnrollmentController view](v19, "view");
    v10 = objc_msgSend(v14, "view");
    objc_msgSend(v9, "addSubview:", v10);

    v11 = objc_msgSend(v14, "view");
    v12 = -[BuddyMesaEnrollmentController view](v19, "view");
    objc_msgSend(v11, "pinToEdges:", v12);

    objc_msgSend(v14, "didMoveToParentViewController:", v19);
    -[BuddyMesaEnrollmentController setEnrollController:](v19, "setEnrollController:", v14);
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
}

- (void)endEnrollment
{
  id v2;
  id location[2];
  BuddyMesaEnrollmentController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = -[BuddyMesaEnrollmentController enrollController](self, "enrollController");
  objc_msgSend(location[0], "beginAppearanceTransition:animated:", 0, 1);
  objc_msgSend(location[0], "willMoveToParentViewController:", 0);
  v2 = objc_msgSend(location[0], "view");
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(location[0], "removeFromParentViewController");
  objc_msgSend(location[0], "endAppearanceTransition");
  objc_msgSend(location[0], "setDelegate:", 0);
  -[BuddyMesaEnrollmentController setEnrollController:](v4, "setEnrollController:", 0);
  objc_storeStrong(location, 0);
}

- (void)restartEnrollment
{
  LAContext *v2;
  BiometricKitUIEnrollViewController *v3;
  BiometricKitUIEnrollViewController *v4;
  id location[2];
  BuddyMesaEnrollmentController *v6;

  v6 = self;
  location[1] = (id)a2;
  -[BuddyMesaEnrollmentController deleteIdentity](self, "deleteIdentity");
  -[BuddyMesaEnrollmentController resetAuthContext](v6, "resetAuthContext");
  v2 = -[BuddyMesaEnrollmentController authContext](v6, "authContext");
  location[0] = -[LAContext externalizedContext](v2, "externalizedContext");

  if (location[0])
  {
    v3 = -[BuddyMesaEnrollmentController enrollController](v6, "enrollController");
    -[BiometricKitUIEnrollViewController setProperty:forKey:](v3, "setProperty:forKey:", location[0], CFSTR("credset"));

  }
  v4 = -[BuddyMesaEnrollmentController enrollController](v6, "enrollController");
  -[BiometricKitUIEnrollViewController restartEnroll](v4, "restartEnroll");

  -[BuddyMesaEnrollmentController resetLeftNavigationItem](v6, "resetLeftNavigationItem");
  objc_storeStrong(location, 0);
}

- (void)deleteIdentity
{
  BKIdentity *v2;
  PKBiometrics *v3;
  BKIdentity *v4;
  os_log_t oslog[2];
  BuddyMesaEnrollmentController *v6;
  uint8_t buf[24];

  v6 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1000806F4((uint64_t)buf, (uint64_t)"-[BuddyMesaEnrollmentController deleteIdentity]");
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "BuddyMesaController: %s", buf, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  v2 = -[BuddyMesaEnrollmentController identity](v6, "identity");

  if (v2)
  {
    v3 = +[PKBiometrics sharedInstance](PKBiometrics, "sharedInstance");
    v4 = -[BuddyMesaEnrollmentController identity](v6, "identity");
    -[PKBiometrics removeIdentity:](v3, "removeIdentity:", v4);

    -[BuddyMesaEnrollmentController setIdentity:](v6, "setIdentity:", 0);
  }
}

- (id)cancelLeftNavigationItem
{
  UIBarButtonItem *v2;
  UIBarButtonItem *cancelLeftNavigationItem;

  if (!self->_cancelLeftNavigationItem)
  {
    v2 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "restartEnrollment", a2);
    cancelLeftNavigationItem = self->_cancelLeftNavigationItem;
    self->_cancelLeftNavigationItem = v2;

  }
  return self->_cancelLeftNavigationItem;
}

- (void)resetLeftNavigationItem
{
  id v2;
  id v3;
  id v4;
  unsigned __int8 v5;
  id v6;
  id v7;

  v2 = -[BuddyMesaEnrollmentController navigationItem](self, "navigationItem", a2);
  v3 = objc_msgSend(v2, "leftBarButtonItem");
  v4 = -[BuddyMesaEnrollmentController cancelLeftNavigationItem](self, "cancelLeftNavigationItem");
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = -[BuddyMesaEnrollmentController navigationItem](self, "navigationItem");
    objc_msgSend(v6, "performSelector:withObject:withObject:", "setLeftBarButtonItem:animated:", 0, &__kCFBooleanTrue);

    v7 = -[BuddyMesaEnrollmentController navigationItem](self, "navigationItem");
    objc_msgSend(v7, "setHidesBackButton:", 0);

  }
}

- (void)completeMesaController
{
  BYPreferencesController *v2;
  BYCapabilities *v3;
  unsigned __int8 v4;
  BYFlowSkipController *v5;
  BYPasscodeCacheManager *v6;
  MCProfileConnection *v7;
  BYPaneFeatureAnalyticsManager *v8;
  NSNumber *v9;
  BFFFlowItemDelegate *v10;
  id v11;
  char v12;
  SEL v13;
  BuddyMesaEnrollmentController *v14;

  v14 = self;
  v13 = a2;
  self->_enrollComplete = 1;
  v2 = -[BuddyMesaEnrollmentController buddyPreferences](v14, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("Mesa2Presented"));

  v3 = -[BuddyMesaEnrollmentController capabilities](v14, "capabilities");
  v4 = -[BYCapabilities isTouchIDEnrolled](v3, "isTouchIDEnrolled");

  v12 = v4 & 1;
  if ((v4 & 1) != 0)
  {
    v5 = -[BuddyMesaEnrollmentController flowSkipController](v14, "flowSkipController");
    -[BYFlowSkipController didCompleteFlow:](v5, "didCompleteFlow:", BYFlowSkipIdentifierTouchID);

    v6 = -[BuddyMesaEnrollmentController passcodeCacheManager](v14, "passcodeCacheManager");
    v11 = -[BYPasscodeCacheManager cachedPasscode](v6, "cachedPasscode");

    v7 = -[BuddyMesaEnrollmentController managedConfiguration](v14, "managedConfiguration");
    -[MCProfileConnection setFingerprintUnlockAllowed:passcode:completion:](v7, "setFingerprintUnlockAllowed:passcode:completion:", 1, v11, 0);

    objc_storeStrong(&v11, 0);
  }
  v8 = -[BuddyMesaEnrollmentController paneFeatureAnalyticsManager](v14, "paneFeatureAnalyticsManager", v11);
  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12 & 1);
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v8, "recordActionWithValue:forFeature:", v9, 12);

  v10 = -[BuddyMesaEnrollmentController delegate](v14, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v10, "flowItemDone:", v14);

}

- (void)enrollResult:(int)a3 bkIdentity:(id)a4
{
  uint64_t v4;
  PKBiometrics *v5;
  id v6;
  PKBiometrics *v7;
  BYFlowSkipController *v8;
  PKBiometrics *v9;
  BiometricKitUIEnrollViewController *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  os_log_t oslog;
  id location;
  int v17;
  SEL v18;
  BuddyMesaEnrollmentController *v19;
  uint8_t buf[8];

  v19 = self;
  v18 = a2;
  v17 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046FA0(buf, v17);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "BuddyMesaController: Enroll result: %d", buf, 8u);
  }
  objc_storeStrong((id *)&oslog, 0);
  switch(v17)
  {
    case 0:
      v19->_enrollComplete = 0;
      -[BuddyMesaEnrollmentController resetLeftNavigationItem](v19, "resetLeftNavigationItem");
      break;
    case 1:
      if (location)
      {
        -[BuddyMesaEnrollmentController setIdentity:](v19, "setIdentity:", location);
        v5 = +[PKBiometrics sharedInstance](PKBiometrics, "sharedInstance");
        v6 = +[PSBiometricIdentity nextIdentityName](PSBiometricIdentity, "nextIdentityName");
        -[PKBiometrics setName:forIdentity:](v5, "setName:forIdentity:", v6, location);

      }
      break;
    case 3:
      if (location)
      {
        v7 = +[PKBiometrics sharedInstance](PKBiometrics, "sharedInstance");
        -[PKBiometrics removeIdentity:](v7, "removeIdentity:", location);

        -[BuddyMesaEnrollmentController setIdentity:](v19, "setIdentity:", 0);
      }
      v8 = -[BuddyMesaEnrollmentController flowSkipController](v19, "flowSkipController");
      -[BYFlowSkipController didSkipFlow:](v8, "didSkipFlow:", BYFlowSkipIdentifierTouchID);

      -[BuddyMesaEnrollmentController completeMesaController](v19, "completeMesaController");
      break;
    case 4:
      -[BuddyMesaEnrollmentController completeMesaController](v19, "completeMesaController");
      break;
    case 9:
      if (location)
      {
        v9 = +[PKBiometrics sharedInstance](PKBiometrics, "sharedInstance");
        -[PKBiometrics removeIdentity:](v9, "removeIdentity:", location);

        -[BuddyMesaEnrollmentController setIdentity:](v19, "setIdentity:", 0);
      }
      v10 = -[BuddyMesaEnrollmentController enrollController](v19, "enrollController");
      -[BiometricKitUIEnrollViewController restartEnroll](v10, "restartEnroll");

      break;
    case 10:
      -[BuddyMesaEnrollmentController setIdentity:](v19, "setIdentity:", 0);
      v11 = -[BuddyMesaEnrollmentController navigationItem](v19, "navigationItem");
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v11, "setLeftBarButtonItem:", 0);

      v12 = -[BuddyMesaEnrollmentController navigationItem](v19, "navigationItem");
      objc_msgSend(v12, "setHidesBackButton:", 1);

      v13 = -[BuddyMesaEnrollmentController navigationItem](v19, "navigationItem");
      v14 = -[BuddyMesaEnrollmentController cancelLeftNavigationItem](v19, "cancelLeftNavigationItem");
      objc_msgSend(v13, "setLeftBarButtonItem:animated:", v14, 1);

      break;
    default:
      break;
  }
  objc_storeStrong(&location, 0);
}

- (void)generateAuthToken
{
  LAContext *v2;
  BiometricKitUIEnrollViewController *v3;
  id location[2];
  BuddyMesaEnrollmentController *v5;

  v5 = self;
  location[1] = (id)a2;
  -[BuddyMesaEnrollmentController resetAuthContext](self, "resetAuthContext");
  v2 = -[BuddyMesaEnrollmentController authContext](v5, "authContext");
  location[0] = -[LAContext externalizedContext](v2, "externalizedContext");

  if (location[0])
  {
    v3 = -[BuddyMesaEnrollmentController enrollController](v5, "enrollController");
    -[BiometricKitUIEnrollViewController setProperty:forKey:](v3, "setProperty:forKey:", location[0], CFSTR("credset"));

  }
  objc_storeStrong(location, 0);
}

- (void)resetAuthContext
{
  MCProfileConnection *v2;
  char v3;
  BYPasscodeCacheManager *v4;
  id v5;
  BOOL v6;
  id v7;
  LAContext *v8;
  id v9;
  LAContext *v10;
  id location[2];
  BuddyMesaEnrollmentController *v12;

  v12 = self;
  location[1] = (id)a2;
  -[BuddyMesaEnrollmentController setAuthContext:](self, "setAuthContext:", 0);
  v2 = -[BuddyMesaEnrollmentController managedConfiguration](v12, "managedConfiguration");
  v3 = -[MCProfileConnection isPasscodeSet](v2, "isPasscodeSet") ^ 1;

  if ((v3 & 1) == 0)
  {
    v4 = -[BuddyMesaEnrollmentController passcodeCacheManager](v12, "passcodeCacheManager");
    v5 = -[BYPasscodeCacheManager cachedPasscode](v4, "cachedPasscode");
    v6 = v5 == 0;

    if (v6)
    {
      location[0] = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
      v7 = objc_msgSend(location[0], "fetchAuthenticationContextForBiometric");
      -[BuddyMesaEnrollmentController setAuthContext:](v12, "setAuthContext:", v7);

      v8 = -[BuddyMesaEnrollmentController authContext](v12, "authContext");
      -[LAContext setUiDelegate:](v8, "setUiDelegate:", v12);

      objc_storeStrong(location, 0);
    }
    else
    {
      v9 = objc_alloc_init((Class)LAContext);
      -[BuddyMesaEnrollmentController setAuthContext:](v12, "setAuthContext:", v9);

      v10 = -[BuddyMesaEnrollmentController authContext](v12, "authContext");
      -[LAContext setUiDelegate:](v10, "setUiDelegate:", v12);

      -[BuddyMesaEnrollmentController contextEvaluatePolicy](v12, "contextEvaluatePolicy");
    }
  }
}

- (void)contextEvaluatePolicy
{
  LAContext *v2;
  BOOL v3;
  LAContext *v4;
  NSDictionary *v5;
  id v6;
  uint64_t v7;
  NSString *v8;
  char v9;
  NSString *v10;
  char v11;
  id v12;
  os_log_t oslog;
  id obj;
  id location[2];
  BuddyMesaEnrollmentController *v16;
  uint8_t buf[24];
  _UNKNOWN **v18;
  _UNKNOWN **v19;

  v16 = self;
  location[1] = (id)a2;
  v2 = -[BuddyMesaEnrollmentController authContext](self, "authContext");
  v3 = v2 == 0;

  if (!v3)
  {
    location[0] = 0;
    v4 = -[BuddyMesaEnrollmentController authContext](v16, "authContext");
    v18 = &off_100290D00;
    v19 = &off_100290D18;
    v5 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    obj = 0;
    v6 = -[LAContext evaluatePolicy:options:error:](v4, "evaluatePolicy:options:error:", 1007, v5, &obj);
    objc_storeStrong(location, obj);

    if (location[0])
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v7);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        v9 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v8 = (NSString *)location[0];
        }
        else if (location[0])
        {
          v12 = objc_msgSend(location[0], "domain");
          v11 = 1;
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v12, objc_msgSend(location[0], "code"));
          v10 = v8;
          v9 = 1;
        }
        else
        {
          v8 = 0;
        }
        sub_100039500((uint64_t)buf, (uint64_t)v8);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Evaluate policy failed: %{public}@", buf, 0xCu);
        if ((v9 & 1) != 0)

        if ((v11 & 1) != 0)
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(location, 0);
  }
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v6;
  unsigned __int8 v7;
  BYPasscodeCacheManager *v8;
  id v9;
  LAContext *v10;
  BYPasscodeCacheManager *v11;
  id v12;
  id v13;
  int64_t v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, char, id);
  void *v19;
  id v20;
  id v21;
  id location;
  int64_t v23;
  SEL v24;
  BuddyMesaEnrollmentController *v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  if (v23 == 2)
  {
    v6 = objc_msgSend(location, "objectForKey:", &off_100290D30);
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) != 0)
    {
      v8 = -[BuddyMesaEnrollmentController passcodeCacheManager](v25, "passcodeCacheManager");
      v9 = -[BYPasscodeCacheManager cachedPasscode](v8, "cachedPasscode");

      if (v9)
      {
        v10 = -[BuddyMesaEnrollmentController authContext](v25, "authContext");
        v11 = -[BuddyMesaEnrollmentController passcodeCacheManager](v25, "passcodeCacheManager");
        v12 = -[BYPasscodeCacheManager cachedPasscode](v11, "cachedPasscode");
        v13 = objc_msgSend(v12, "dataUsingEncoding:", 4);
        v14 = v23;
        v15 = _NSConcreteStackBlock;
        v16 = -1073741824;
        v17 = 0;
        v18 = sub_1000820F0;
        v19 = &unk_100280690;
        v20 = v21;
        -[LAContext setCredential:forProcessedEvent:credentialType:reply:](v10, "setCredential:forProcessedEvent:credentialType:reply:", v13, v14, -1, &v15);

        objc_storeStrong(&v20, 0);
      }
      else
      {
        (*((void (**)(id, _QWORD, _QWORD))v21 + 2))(v21, 0, 0);
      }
    }
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&location, 0);
}

- (id)menuButtonPressedBlock
{
  return self->_menuButtonPressedBlock;
}

- (void)setMenuButtonPressedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
  objc_storeStrong((id *)&self->_flowSkipController, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BiometricKitUIEnrollViewController)enrollController
{
  return self->_enrollController;
}

- (void)setEnrollController:(id)a3
{
  objc_storeStrong((id *)&self->_enrollController, a3);
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_enrollController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong(&self->_menuButtonPressedBlock, 0);
  objc_storeStrong((id *)&self->_cancelLeftNavigationItem, 0);
}

@end
