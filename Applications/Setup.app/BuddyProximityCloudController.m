@implementation BuddyProximityCloudController

- (BuddyProximityCloudController)init
{
  NSBundle *v3;
  NSString *v4;
  BuddyProximityCloudController *v5;
  id v6;
  id v7;
  BuddyProximityCloudController *v8;
  objc_super v10;
  SEL v11;
  id location;

  v11 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_SETUP_SETTING_UP_APPLE_ID"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v10.receiver = self;
  v10.super_class = (Class)BuddyProximityCloudController;
  v5 = -[BuddyProximityCloudController initWithSpinnerText:](&v10, "initWithSpinnerText:", v4);
  location = v5;
  objc_storeStrong(&location, v5);

  if (v5)
  {
    v6 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v6, "setTitle:", &stru_100284738);

    v7 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v7, "setHidesBackButton:animated:", 1, 0);

  }
  v8 = (BuddyProximityCloudController *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  BuddyMiscState *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  NSObject *v8;
  void **v9;
  int v10;
  int v11;
  id (*v12)(uint64_t);
  void *v13;
  BuddyProximityCloudController *v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(NSObject *, void *);
  void *v19;
  BuddyProximityCloudController *v20;
  uint8_t buf[7];
  os_log_type_t v22;
  id location;
  id v24;
  objc_super v25;
  BOOL v26;
  SEL v27;
  BuddyProximityCloudController *v28;

  v28 = self;
  v27 = a2;
  v26 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BuddyProximityCloudController;
  -[BuddyProximityCloudController viewDidAppear:](&v25, "viewDidAppear:", a3);
  if (!-[BuddyProximityCloudController hasInitiatedLogin](v28, "hasInitiatedLogin"))
  {
    -[BuddyProximityCloudController setHasInitiatedLogin:](v28, "setHasInitiatedLogin:", 1);
    v3 = -[BuddyProximityCloudController miscState](v28, "miscState");
    v24 = -[BuddyMiscState migrationManager](v3, "migrationManager");

    v4 = objc_msgSend(v24, "willMigrate");
    if ((v4 & 1) != 0)
    {
      location = (id)_BYLoggingFacility(v4);
      v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        v5 = location;
        v6 = v22;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Waiting for keychain transfer and import...", buf, 2u);
      }
      objc_storeStrong(&location, 0);
      v7 = v24;
      v15 = _NSConcreteStackBlock;
      v16 = -1073741824;
      v17 = 0;
      v18 = sub_100107490;
      v19 = &unk_100280B80;
      v20 = v28;
      objc_msgSend(v7, "waitForKeychain:", &v15);
      objc_storeStrong((id *)&v20, 0);
    }
    else
    {
      v8 = dispatch_get_global_queue(0, 0);
      v9 = _NSConcreteStackBlock;
      v10 = -1073741824;
      v11 = 0;
      v12 = sub_100107550;
      v13 = &unk_100280730;
      v14 = v28;
      dispatch_async(v8, &v9);

      objc_storeStrong((id *)&v14, 0);
    }
    objc_storeStrong(&v24, 0);
  }
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BOOL)isEphemeral
{
  return 0;
}

- (void)_beginSignIn
{
  ProximitySetupController *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void **v17;
  int v18;
  int v19;
  void (*v20)(id *, void *);
  void *v21;
  id v22;
  os_log_type_t v23;
  os_log_t oslog[2];
  id v25;
  uint8_t buf[40];

  v25 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyProximityCloudController proximitySetupController](self, "proximitySetupController");
  v3 = -[ProximitySetupController createSignInTask](v2, "createSignInTask");
  objc_msgSend(v25, "setSignInTask:", v3);

  v4 = objc_msgSend(v25, "navigationController");
  v5 = objc_msgSend(v25, "signInTask");
  objc_msgSend(v5, "setNavigationController:", v4);

  v6 = objc_msgSend(v25, "miscState");
  v7 = objc_msgSend(v6, "migrationManager");
  v8 = objc_msgSend(v7, "isMigrating");
  v9 = objc_msgSend(v25, "signInTask");
  objc_msgSend(v9, "setIgnoreLockAssertErrors:", v8 & 1);

  v10 = objc_msgSend(v25, "featureFlags");
  LOBYTE(v7) = objc_msgSend(v10, "isUseCDPContextSecretInsteadOfSBDSecretEnabled");

  if ((v7 & 1) != 0)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v11);
    v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v25, "passcodeCacheManager");
      v13 = objc_msgSend(v25, "signInTask");
      sub_1000CB654((uint64_t)buf, (uint64_t)"-[BuddyProximityCloudController _beginSignIn]", (uint64_t)v12, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, oslog[0], v23, "%s: Setting cache manager %@ on sign in task %@", buf, 0x20u);

    }
    objc_storeStrong((id *)oslog, 0);
    v14 = objc_msgSend(v25, "passcodeCacheManager");
    v15 = objc_msgSend(v25, "signInTask");
    objc_msgSend(v15, "setCacheManager:", v14);

  }
  v16 = objc_msgSend(v25, "signInTask");
  v17 = _NSConcreteStackBlock;
  v18 = -1073741824;
  v19 = 0;
  v20 = sub_1001078B8;
  v21 = &unk_100280B80;
  v22 = v25;
  objc_msgSend(v16, "authenticateThenSignInWithCompletion:", &v17);

  objc_storeStrong(&v22, 0);
}

- (void)_signInCompleted:(id)a3
{
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  NSNumber *v7;
  id v8;
  NSString *v9;
  id v10;
  NSNumber *v11;
  NSDictionary *v12;
  void *v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(id *);
  void *v18;
  id v19;
  void **block;
  int v21;
  int v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location[2];
  id v27;
  _QWORD v28[3];
  _QWORD v29[3];

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    v21 = -1073741824;
    v22 = 0;
    v23 = sub_100107C7C;
    v24 = &unk_100280730;
    v25 = v27;
    dispatch_async(v3, &block);

    objc_storeStrong(&v25, 0);
  }
  else
  {
    v4 = objc_msgSend(v27, "lockdownModeProvider");
    objc_msgSend(v4, "fetchAccountStateWithCompletionHandler:", &stru_100282F48);

    v5 = objc_msgSend(v27, "proximitySetupController");
    objc_msgSend(v5, "setSignedIniCloudAccount:", 1);

  }
  v6 = objc_msgSend(v27, "analyticsManager");
  v28[0] = CFSTR("success");
  v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", location[0] == 0);
  v29[0] = v7;
  v28[1] = CFSTR("error");
  v8 = objc_msgSend(location[0], "domain");
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%ld)"), v8, objc_msgSend(location[0], "code"));
  v29[1] = v9;
  v28[2] = CFSTR("connected");
  v10 = objc_msgSend(v27, "proximitySetupController");
  v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)objc_msgSend(v10, "hasConnection") & 1);
  v29[2] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  objc_msgSend(v6, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.proximity.proximity.appleid"), v12, 1);

  v13 = &_dispatch_main_q;
  v14 = _NSConcreteStackBlock;
  v15 = -1073741824;
  v16 = 0;
  v17 = sub_100107CDC;
  v18 = &unk_100280730;
  v19 = v27;
  dispatch_async((dispatch_queue_t)v13, &v14);

  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (LockdownModeProvider)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownModeProvider, a3);
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (BOOL)hasInitiatedLogin
{
  return self->_hasInitiatedLogin;
}

- (void)setHasInitiatedLogin:(BOOL)a3
{
  self->_hasInitiatedLogin = a3;
}

- (BuddyProximityAppleIDSignInTask)signInTask
{
  return self->_signInTask;
}

- (void)setSignInTask:(id)a3
{
  objc_storeStrong((id *)&self->_signInTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInTask, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_lockdownModeProvider, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
}

@end
