@implementation BuddyAppleIDController

- (BuddyAppleIDController)initWithAccount:(id)a3 passcodeCacheManager:(id)a4 analyticsManager:(id)a5 runState:(id)a6 featureFlags:(id)a7
{
  id v11;
  NSPointerArray *v12;
  void *v13;
  BuddyAppleIDController *v14;
  objc_super v16;
  id v17;
  id v18;
  id v19;
  id obj;
  id location[2];
  id v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = 0;
  objc_storeStrong(&v18, a6);
  v17 = 0;
  objc_storeStrong(&v17, a7);
  v11 = v22;
  v22 = 0;
  v16.receiver = v11;
  v16.super_class = (Class)BuddyAppleIDController;
  v22 = -[BuddyAppleIDController init](&v16, "init");
  objc_storeStrong(&v22, v22);
  if (v22)
  {
    objc_storeStrong((id *)v22 + 14, obj);
    objc_storeStrong((id *)v22 + 20, v19);
    objc_storeStrong((id *)v22 + 21, v18);
    *((_QWORD *)v22 + 15) = 0;
    v12 = +[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray");
    v13 = (void *)*((_QWORD *)v22 + 16);
    *((_QWORD *)v22 + 16) = v12;

    objc_storeStrong((id *)v22 + 8, v17);
    if (location[0])
      objc_storeStrong((id *)v22 + 9, location[0]);
  }
  v14 = (BuddyAppleIDController *)v22;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v22, 0);
  return v14;
}

- (BFFFlowItemDelegate)flowItemDelegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
}

- (void)setExistingAccountUsername:(id)a3 accountType:(unint64_t)a4
{
  id location[2];
  BuddyAppleIDController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAppleIDController setExistingAccountUsername:](v6, "setExistingAccountUsername:", location[0]);
  -[BuddyAppleIDController setExistingAccountType:](v6, "setExistingAccountType:", a4);
  objc_storeStrong(location, 0);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  id v3;
  uint64_t v4;
  id location[2];
  BuddyAppleIDController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if (location[0] != v6->_navigationController)
    {
      v3 = location[0];
      v4 = objc_opt_class(BFFNavigationController);
      if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
        objc_msgSend(location[0], "addDelegateObserver:", v6);
    }
  }
  objc_storeStrong((id *)&v6->_navigationController, location[0]);
  objc_storeStrong(location, 0);
}

- (void)showCredentialRecovery
{
  UINavigationController *v2;
  UIViewController *v3;
  BuddyAppleIDSignInTask *v4;
  id v5;
  id v6;
  BuddyAppleIDSignInTask *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  void **v20;
  int v21;
  int v22;
  void (*v23)(id *, void *, void *);
  void *v24;
  id v25;
  uint8_t v26[7];
  os_log_type_t v27;
  os_log_t v28;
  os_log_type_t v29;
  os_log_t oslog[2];
  id v31;
  uint8_t buf[40];

  v31 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyAppleIDController navigationController](self, "navigationController");
  v3 = -[UINavigationController topViewController](v2, "topViewController");
  objc_msgSend(v31, "setAuthAttemptLandingViewController:", v3);

  v4 = [BuddyAppleIDSignInTask alloc];
  v5 = objc_msgSend(v31, "featureFlags");
  v6 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  v7 = -[BuddyAppleIDSignInTask initWithFeatureFlags:accountTools:](v4, "initWithFeatureFlags:accountTools:", v5, v6);
  objc_msgSend(v31, "setSignInTask:", v7);

  v8 = objc_msgSend(v31, "navigationController");
  v9 = objc_msgSend(v31, "signInTask");
  objc_msgSend(v9, "setNavigationController:", v8);

  LOBYTE(v8) = objc_msgSend(v31, "_isRestore");
  v10 = objc_msgSend(v31, "signInTask");
  objc_msgSend(v10, "setRestoreFromBackupMode:", v8 & 1);

  v11 = objc_msgSend(v31, "featureFlags");
  LOBYTE(v10) = objc_msgSend(v11, "isUseCDPContextSecretInsteadOfSBDSecretEnabled");

  if ((v10 & 1) != 0)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v12);
    v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v31, "passcodeCacheManager");
      v14 = objc_msgSend(v31, "signInTask");
      sub_1000CB654((uint64_t)buf, (uint64_t)"-[BuddyAppleIDController showCredentialRecovery]", (uint64_t)v13, (uint64_t)v14);
      _os_log_impl((void *)&_mh_execute_header, oslog[0], v29, "%s: Setting cache manager %@ on sign in task %@", buf, 0x20u);

    }
    objc_storeStrong((id *)oslog, 0);
    v15 = objc_msgSend(v31, "passcodeCacheManager");
    v16 = objc_msgSend(v31, "signInTask");
    objc_msgSend(v16, "setCacheManager:", v15);

  }
  v28 = (os_log_t)(id)_BYLoggingFacility(v12);
  v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v28;
    v18 = v27;
    sub_100038C3C(v26);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Beginning credential recovery...", v26, 2u);
  }
  objc_storeStrong((id *)&v28, 0);
  v19 = objc_msgSend(v31, "signInTask");
  v20 = _NSConcreteStackBlock;
  v21 = -1073741824;
  v22 = 0;
  v23 = sub_1000E0614;
  v24 = &unk_100282880;
  v25 = v31;
  objc_msgSend(v19, "authenticateForCredentialRecoveryWithCompletion:", &v20);

  objc_storeStrong(&v25, 0);
}

- (void)showCreateAppleID
{
  UINavigationController *v2;
  UIViewController *v3;
  BuddyAppleIDSignInTask *v4;
  id v5;
  id v6;
  BuddyAppleIDSignInTask *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  void **v20;
  int v21;
  int v22;
  void (*v23)(id *, void *, void *);
  void *v24;
  id v25;
  uint8_t v26[7];
  os_log_type_t v27;
  os_log_t v28;
  os_log_type_t v29;
  os_log_t oslog[2];
  id v31;
  uint8_t buf[40];

  v31 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyAppleIDController navigationController](self, "navigationController");
  v3 = -[UINavigationController topViewController](v2, "topViewController");
  objc_msgSend(v31, "setAuthAttemptLandingViewController:", v3);

  v4 = [BuddyAppleIDSignInTask alloc];
  v5 = objc_msgSend(v31, "featureFlags");
  v6 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  v7 = -[BuddyAppleIDSignInTask initWithFeatureFlags:accountTools:](v4, "initWithFeatureFlags:accountTools:", v5, v6);
  objc_msgSend(v31, "setSignInTask:", v7);

  v8 = objc_msgSend(v31, "navigationController");
  v9 = objc_msgSend(v31, "signInTask");
  objc_msgSend(v9, "setNavigationController:", v8);

  LOBYTE(v8) = objc_msgSend(v31, "_isRestore");
  v10 = objc_msgSend(v31, "signInTask");
  objc_msgSend(v10, "setRestoreFromBackupMode:", v8 & 1);

  v11 = objc_msgSend(v31, "featureFlags");
  LOBYTE(v10) = objc_msgSend(v11, "isUseCDPContextSecretInsteadOfSBDSecretEnabled");

  if ((v10 & 1) != 0)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v12);
    v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v31, "passcodeCacheManager");
      v14 = objc_msgSend(v31, "signInTask");
      sub_1000CB654((uint64_t)buf, (uint64_t)"-[BuddyAppleIDController showCreateAppleID]", (uint64_t)v13, (uint64_t)v14);
      _os_log_impl((void *)&_mh_execute_header, oslog[0], v29, "%s: Setting cache manager %@ on sign in task %@", buf, 0x20u);

    }
    objc_storeStrong((id *)oslog, 0);
    v15 = objc_msgSend(v31, "passcodeCacheManager");
    v16 = objc_msgSend(v31, "signInTask");
    objc_msgSend(v16, "setCacheManager:", v15);

  }
  v28 = (os_log_t)(id)_BYLoggingFacility(v12);
  v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v28;
    v18 = v27;
    sub_100038C3C(v26);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Beginning account creation...", v26, 2u);
  }
  objc_storeStrong((id *)&v28, 0);
  v19 = objc_msgSend(v31, "signInTask");
  v20 = _NSConcreteStackBlock;
  v21 = -1073741824;
  v22 = 0;
  v23 = sub_1000E1300;
  v24 = &unk_100282880;
  v25 = v31;
  objc_msgSend(v19, "authenticateForAccountCreationWithCompletion:", &v20);

  objc_storeStrong(&v25, 0);
}

- (void)_willStartResponsibilityViewControllerPushSession
{
  void *v2;

  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  -[BuddyAppleIDController setCountOfResponsibilityViewControllerPushSessions:](self, "setCountOfResponsibilityViewControllerPushSessions:", (char *)-[BuddyAppleIDController countOfResponsibilityViewControllerPushSessions](self, "countOfResponsibilityViewControllerPushSessions", a2)+ 1);
}

- (void)_didFinishResponsibilityViewControllerPushSeesion
{
  void *v2;

  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  if (-[BuddyAppleIDController countOfResponsibilityViewControllerPushSessions](self, "countOfResponsibilityViewControllerPushSessions", a2))
  {
    -[BuddyAppleIDController setCountOfResponsibilityViewControllerPushSessions:](self, "setCountOfResponsibilityViewControllerPushSessions:", (char *)-[BuddyAppleIDController countOfResponsibilityViewControllerPushSessions](self, "countOfResponsibilityViewControllerPushSessions")- 1);
  }
}

- (BOOL)responsibleForViewController:(id)a3
{
  id v3;
  uint64_t v4;
  NSPointerArray *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  unint64_t i;
  id v10;
  uint64_t v11;
  _QWORD __b[8];
  id v14;
  int v15;
  id location[2];
  BuddyAppleIDController *v17;
  char v18;
  _BYTE v19[128];

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[BuddyAppleIDController assumeResponsibilityForRUIPage](v17, "assumeResponsibilityForRUIPage")
    && (v3 = location[0], v4 = objc_opt_class(RUIPage), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
  {
    v18 = 1;
    v15 = 1;
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    v5 = -[BuddyAppleIDController responsibilityViewControllers](v17, "responsibilityViewControllers");
    v6 = -[NSPointerArray allObjects](v5, "allObjects");

    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v7; ++i)
        {
          if (*(_QWORD *)__b[2] != v8)
            objc_enumerationMutation(v6);
          v14 = *(id *)(__b[1] + 8 * i);
          if (v14 == location[0])
          {
            v18 = 1;
            v15 = 1;
            goto LABEL_14;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
      }
      while (v7);
    }
    v15 = 0;
LABEL_14:

    if (!v15)
    {
      v10 = location[0];
      v11 = objc_opt_class(BuddyAppleIDSpinnerPage);
      v18 = objc_opt_isKindOfClass(v10, v11) & 1;
      v15 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (void)cancelAuthentication
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  BuddyAppleIDController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Cancelling authentication...", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[BuddyAppleIDController _authCompletedShouldProceed:error:](v7, "_authCompletedShouldProceed:error:", 0, 0);
}

- (id)upgradeAccountSignInViewController
{
  UINavigationController *v2;
  BYPasscodeCacheManager *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  id v7;
  id v8;
  id v9;
  BuddyAppleIDController *v10;
  id v11;
  id v12;
  void **v14;
  uint64_t v15;
  void (*v16)(id *, void *, void *);
  void *v17;
  BuddyAppleIDController *v18;
  void **v19;
  int v20;
  int v21;
  void (*v22)(NSObject *, void *, void *);
  void *v23;
  BuddyAppleIDController *v24;
  id v25[3];
  void **v26;
  int v27;
  int v28;
  void (*v29)(uint64_t);
  void *v30;
  BuddyAppleIDController *v31;
  id v32;
  id location;
  _QWORD v34[4];
  BuddyAppleIDController *v35;
  id v36[2];
  BuddyAppleIDController *v37;

  v37 = self;
  v36[1] = (id)a2;
  v2 = -[BuddyAppleIDController navigationController](self, "navigationController");
  v3 = -[BuddyAppleIDController passcodeCacheManager](v37, "passcodeCacheManager");
  v36[0] = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:](BuddyAppleIDSignInController, "federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:", v2, 4, v3);

  v4 = -[BuddyAppleIDController existingAccountUsername](v37, "existingAccountUsername");
  objc_msgSend(v36[0], "setUsername:", v4);

  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD_QUESTION"), &stru_100284738, CFSTR("Localizable"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000E229C;
  v34[3] = &unk_100280730;
  v35 = v37;
  objc_msgSend(v36[0], "setiForgotText:handler:", v6, v34);

  objc_initWeak(&location, v36[0]);
  v7 = v36[0];
  v26 = _NSConcreteStackBlock;
  v27 = -1073741824;
  v28 = 0;
  v29 = sub_1000E2344;
  v30 = &unk_100280E18;
  objc_copyWeak(&v32, &location);
  v31 = v37;
  objc_msgSend(v7, "setAppearanceHandler:", &v26);
  v8 = v36[0];
  v19 = _NSConcreteStackBlock;
  v20 = -1073741824;
  v21 = 0;
  v22 = sub_1000E23A4;
  v23 = &unk_1002828A8;
  v24 = v37;
  objc_copyWeak(v25, &location);
  objc_msgSend(v8, "setHandler:", &v19);
  v9 = v36[0];
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000E24D0;
  v17 = &unk_100282880;
  v18 = v37;
  objc_msgSend(v9, "setProximityLoginHandler:", &v14);
  v10 = v37;
  v11 = objc_loadWeakRetained(&location);
  -[BuddyAppleIDController _setLogInOptionsForBuddyAppleIDAuthMode:signInController:](v10, "_setLogInOptionsForBuddyAppleIDAuthMode:signInController:", 4, v11, v14, v15, v16, v17);

  v12 = v36[0];
  objc_storeStrong((id *)&v18, 0);
  objc_destroyWeak(v25);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong((id *)&v31, 0);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  objc_storeStrong((id *)&v35, 0);
  objc_storeStrong(v36, 0);
  return v12;
}

- (id)upgradeAccountForRestoreAfterSoftwareUpdateSignInViewController
{
  UINavigationController *v2;
  BYPasscodeCacheManager *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  id v7;
  id v8;
  id v9;
  void **v11;
  int v12;
  int v13;
  void (*v14)(NSObject *, void *, void *);
  void *v15;
  BuddyAppleIDController *v16;
  id v17[3];
  void **v18;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  BuddyAppleIDController *v23;
  id v24;
  id location;
  void **v26;
  int v27;
  int v28;
  id (*v29);
  void *v30;
  BuddyAppleIDController *v31;
  id v32[2];
  BuddyAppleIDController *v33;

  v33 = self;
  v32[1] = (id)a2;
  v2 = -[BuddyAppleIDController navigationController](self, "navigationController");
  v3 = -[BuddyAppleIDController passcodeCacheManager](v33, "passcodeCacheManager");
  v32[0] = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:](BuddyAppleIDSignInController, "federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:", v2, 7, v3);

  v4 = -[BuddyAppleIDController existingAccountUsername](v33, "existingAccountUsername");
  objc_msgSend(v32[0], "setUsername:", v4);

  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD_QUESTION"), &stru_100284738, CFSTR("Localizable"));
  v26 = _NSConcreteStackBlock;
  v27 = -1073741824;
  v28 = 0;
  v29 = sub_1000E2AC0;
  v30 = &unk_100280730;
  v31 = v33;
  objc_msgSend(v32[0], "setiForgotText:handler:", v6, &v26);

  objc_initWeak(&location, v32[0]);
  v7 = v32[0];
  v18 = _NSConcreteStackBlock;
  v19 = -1073741824;
  v20 = 0;
  v21 = sub_1000E2B68;
  v22 = &unk_100280E18;
  objc_copyWeak(&v24, &location);
  v23 = v33;
  objc_msgSend(v7, "setAppearanceHandler:", &v18);
  v8 = v32[0];
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1000E2BC8;
  v15 = &unk_1002828A8;
  v16 = v33;
  objc_copyWeak(v17, &location);
  objc_msgSend(v8, "setHandler:", &v11);
  v9 = v32[0];
  objc_destroyWeak(v17);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong((id *)&v23, 0);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  objc_storeStrong((id *)&v31, 0);
  objc_storeStrong(v32, 0);
  return v9;
}

- (id)securityUpgradeAccountSignInViewController
{
  UINavigationController *v2;
  UIViewController *v3;
  id v4;
  id location[2];
  BuddyAppleIDController *v7;

  v7 = self;
  location[1] = (id)a2;
  -[BuddyAppleIDController setOperationType:](self, "setOperationType:", 4);
  v2 = -[BuddyAppleIDController navigationController](v7, "navigationController");
  v3 = -[UINavigationController topViewController](v2, "topViewController");
  -[BuddyAppleIDController setAuthAttemptLandingViewController:](v7, "setAuthAttemptLandingViewController:", v3);

  location[0] = -[BuddyAppleIDSpinnerPage initWithAccountMode:]([BuddyAppleIDSpinnerPage alloc], "initWithAccountMode:", -[BuddyAppleIDController operationType](v7, "operationType"));
  objc_msgSend(location[0], "setDelegate:", v7);
  -[BuddyAppleIDController _loadSecurityUpgradeUI](v7, "_loadSecurityUpgradeUI");
  v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)silentUpgradeViewControllerWithLoginContext:(id)a3
{
  id v3;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *);
  void *v9;
  BuddyAppleIDController *v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  BuddyAppleIDController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = -[BuddyAppleIDSpinnerPage initForSilentAuthentication]([BuddyAppleIDSpinnerPage alloc], "initForSilentAuthentication");
  objc_msgSend(v13, "setDelegate:", v15);
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000E2EF4;
  v9 = &unk_100280D00;
  v10 = v15;
  v11 = location[0];
  v12 = objc_retainBlock(&v5);
  -[BuddyAppleIDController _setAppearanceHandler:forSpinnerPage:](v15, "_setAppearanceHandler:forSpinnerPage:", v12, v13);
  v3 = v13;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (id)signInViewController
{
  NSObject *v2;
  os_log_type_t v3;
  UINavigationController *v4;
  BYPasscodeCacheManager *v5;
  NSString *v6;
  NSBundle *v7;
  NSString *v8;
  id v9;
  id v10;
  BYAnalyticsManager *v11;
  BuddyAppleIDSignInTask *v12;
  BuddyFeatureFlags *v13;
  id v14;
  BuddyAppleIDSignInTask *v15;
  BuddyAppleIDSignInTask *v16;
  BuddyFeatureFlags *v17;
  uint64_t v18;
  BYPasscodeCacheManager *v19;
  BuddyAppleIDSignInTask *v20;
  BYPasscodeCacheManager *v21;
  BuddyAppleIDSignInTask *v22;
  BuddyAppleIDSignInTask *v23;
  id v24;
  id v25;
  id v26;
  void **v28;
  int v29;
  int v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  id v33;
  id v34;
  void **v35;
  int v36;
  int v37;
  void (*v38)(NSObject *, void *, void *);
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void **v44;
  int v45;
  int v46;
  void (*v47)(id *, void *, void *, void *);
  void *v48;
  BuddyAppleIDController *v49;
  id v50;
  id v51;
  id v52;
  os_log_type_t v53;
  os_log_t oslog;
  id v55;
  void **v56;
  int v57;
  int v58;
  void (*v59)(uint64_t);
  void *v60;
  BuddyAppleIDController *v61;
  id v62;
  id from;
  void **v64;
  int v65;
  int v66;
  void (*v67);
  void *v68;
  BuddyAppleIDController *v69;
  id v70;
  uint8_t buf[7];
  os_log_type_t v72;
  id location[2];
  BuddyAppleIDController *v74;
  uint8_t v75[32];

  v74 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v72 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v72;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Showing sign in UI", buf, 2u);
  }
  objc_storeStrong(location, 0);
  -[BuddyAppleIDController setOperationType:](v74, "setOperationType:", 1);
  v4 = -[BuddyAppleIDController navigationController](v74, "navigationController");
  v5 = -[BuddyAppleIDController passcodeCacheManager](v74, "passcodeCacheManager");
  v70 = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:](BuddyAppleIDSignInController, "federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:", v4, 1, v5);

  v6 = -[BuddyAppleIDController existingAccountUsername](v74, "existingAccountUsername");
  objc_msgSend(v70, "setUsername:", v6);

  if (-[BuddyAppleIDController existingAccountType](v74, "existingAccountType") < 2)
    -[BuddyAppleIDController _setLogInOptionsForBuddyAppleIDAuthMode:signInController:](v74, "_setLogInOptionsForBuddyAppleIDAuthMode:signInController:", 1, v70);
  v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("DONT_HAVE_AN_APPLE_ID_OR_FORGOT_IT"), &stru_100284738, CFSTR("Localizable"));
  v64 = _NSConcreteStackBlock;
  v65 = -1073741824;
  v66 = 0;
  v67 = sub_1000E3A00;
  v68 = &unk_100280730;
  v69 = v74;
  objc_msgSend(v70, "setiForgotText:handler:", v8, &v64);

  objc_initWeak(&from, v70);
  v9 = v70;
  v56 = _NSConcreteStackBlock;
  v57 = -1073741824;
  v58 = 0;
  v59 = sub_1000E3B00;
  v60 = &unk_100280E18;
  objc_copyWeak(&v62, &from);
  v61 = v74;
  objc_msgSend(v9, "setAppearanceHandler:", &v56);
  v10 = objc_alloc((Class)BYAnalyticsEventAppleIDSignIn);
  v11 = -[BuddyAppleIDController analyticsManager](v74, "analyticsManager");
  v55 = objc_msgSend(v10, "initWithAnalyticsManager:context:", v11, 2);

  v12 = [BuddyAppleIDSignInTask alloc];
  v13 = -[BuddyAppleIDController featureFlags](v74, "featureFlags");
  v14 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  v15 = -[BuddyAppleIDSignInTask initWithFeatureFlags:accountTools:](v12, "initWithFeatureFlags:accountTools:", v13, v14);
  -[BuddyAppleIDController setSignInTask:](v74, "setSignInTask:", v15);

  LOBYTE(v13) = -[BuddyAppleIDController _isRestore](v74, "_isRestore");
  v16 = -[BuddyAppleIDController signInTask](v74, "signInTask");
  -[BuddyAppleIDSignInTask setRestoreFromBackupMode:](v16, "setRestoreFromBackupMode:", v13 & 1);

  v17 = -[BuddyAppleIDController featureFlags](v74, "featureFlags");
  LOBYTE(v16) = -[BuddyFeatureFlags isUseCDPContextSecretInsteadOfSBDSecretEnabled](v17, "isUseCDPContextSecretInsteadOfSBDSecretEnabled");

  if ((v16 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v18);
    v53 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[BuddyAppleIDController passcodeCacheManager](v74, "passcodeCacheManager");
      v20 = -[BuddyAppleIDController signInTask](v74, "signInTask");
      sub_1000CB654((uint64_t)v75, (uint64_t)"-[BuddyAppleIDController signInViewController]", (uint64_t)v19, (uint64_t)v20);
      _os_log_impl((void *)&_mh_execute_header, oslog, v53, "%s: Setting cache manager %@ on sign in task %@", v75, 0x20u);

    }
    objc_storeStrong((id *)&oslog, 0);
    v21 = -[BuddyAppleIDController passcodeCacheManager](v74, "passcodeCacheManager");
    v22 = -[BuddyAppleIDController signInTask](v74, "signInTask");
    -[BuddyAppleIDSignInTask setCacheManager:](v22, "setCacheManager:", v21);

  }
  v44 = _NSConcreteStackBlock;
  v45 = -1073741824;
  v46 = 0;
  v47 = sub_1000E3B60;
  v48 = &unk_100282948;
  objc_copyWeak(&v51, &from);
  v49 = v74;
  v50 = v55;
  v52 = objc_retainBlock(&v44);
  v23 = -[BuddyAppleIDController signInTask](v74, "signInTask");
  objc_initWeak(&v43, v23);

  v24 = v70;
  v35 = _NSConcreteStackBlock;
  v36 = -1073741824;
  v37 = 0;
  v38 = sub_1000E45D0;
  v39 = &unk_100282998;
  objc_copyWeak(&v41, &from);
  objc_copyWeak(&v42, &v43);
  v40 = v52;
  objc_msgSend(v24, "setHandler:", &v35);
  v25 = v70;
  v28 = _NSConcreteStackBlock;
  v29 = -1073741824;
  v30 = 0;
  v31 = sub_1000E4868;
  v32 = &unk_100282970;
  v33 = v52;
  objc_copyWeak(&v34, &v43);
  objc_msgSend(v25, "setProximityLoginHandler:", &v28);
  v26 = v70;
  objc_destroyWeak(&v34);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v40, 0);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong((id *)&v49, 0);
  objc_destroyWeak(&v51);
  objc_storeStrong(&v55, 0);
  objc_storeStrong((id *)&v61, 0);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&from);
  objc_storeStrong((id *)&v69, 0);
  objc_storeStrong(&v70, 0);
  return v26;
}

- (id)signInViewControllerForRestore
{
  NSObject *v2;
  os_log_type_t v3;
  UINavigationController *v4;
  BYPasscodeCacheManager *v5;
  NSString *v6;
  id v7;
  NSBundle *v8;
  NSString *v9;
  id v10;
  BuddyAppleIDSignInTask *v11;
  BuddyFeatureFlags *v12;
  id v13;
  BuddyAppleIDSignInTask *v14;
  BuddyAppleIDSignInTask *v15;
  BuddyAppleIDSignInTask *v16;
  BuddyAppleIDSignInTask *v17;
  BuddyFeatureFlags *v18;
  uint64_t v19;
  BYPasscodeCacheManager *v20;
  BuddyAppleIDSignInTask *v21;
  BYPasscodeCacheManager *v22;
  BuddyAppleIDSignInTask *v23;
  BuddyAppleIDSignInTask *v24;
  id v25;
  id v26;
  id v27;
  void **v29;
  int v30;
  int v31;
  void (*v32)(uint64_t, void *, void *);
  void *v33;
  id v34;
  id v35;
  void **v36;
  int v37;
  int v38;
  void (*v39)(NSObject *, void *, void *);
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  os_log_type_t v45;
  os_log_t oslog;
  void **v47;
  int v48;
  int v49;
  void (*v50)(id *, void *, void *, void *);
  void *v51;
  BuddyAppleIDController *v52;
  id v53;
  id v54;
  void **v55;
  int v56;
  int v57;
  void (*v58);
  void *v59;
  id v60;
  id v61;
  id v62;
  void **v63;
  int v64;
  int v65;
  void (*v66);
  void *v67;
  id v68;
  id v69;
  id from;
  uint8_t buf[7];
  os_log_type_t v72;
  id location[2];
  BuddyAppleIDController *v74;
  uint8_t v75[32];

  v74 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(-[BuddyAppleIDController setOperationType:](self, "setOperationType:", 2));
  v72 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v72;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Show Restore from iCloud Sign In", buf, 2u);
  }
  objc_storeStrong(location, 0);
  objc_initWeak(&from, v74);
  v4 = -[BuddyAppleIDController navigationController](v74, "navigationController");
  v5 = -[BuddyAppleIDController passcodeCacheManager](v74, "passcodeCacheManager");
  v69 = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:](BuddyAppleIDSignInController, "federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:", v4, 5, v5);

  v6 = -[BuddyAppleIDController existingAccountUsername](v74, "existingAccountUsername");
  objc_msgSend(v69, "setUsername:", v6);

  v7 = v69;
  v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD_QUESTION"), &stru_100284738, CFSTR("Localizable"));
  v63 = _NSConcreteStackBlock;
  v64 = -1073741824;
  v65 = 0;
  v66 = sub_1000E525C;
  v67 = &unk_1002806B8;
  objc_copyWeak(&v68, &from);
  objc_msgSend(v7, "setiForgotText:handler:", v9, &v63);

  objc_initWeak(&v62, v69);
  v10 = v69;
  v55 = _NSConcreteStackBlock;
  v56 = -1073741824;
  v57 = 0;
  v58 = sub_1000E5318;
  v59 = &unk_1002829C0;
  objc_copyWeak(&v60, &v62);
  objc_copyWeak(&v61, &from);
  objc_msgSend(v10, "setAppearanceHandler:", &v55);
  -[BuddyAppleIDController _setLogInOptionsForBuddyAppleIDAuthMode:signInController:](v74, "_setLogInOptionsForBuddyAppleIDAuthMode:signInController:", 5, v69);
  v47 = _NSConcreteStackBlock;
  v48 = -1073741824;
  v49 = 0;
  v50 = sub_1000E53F8;
  v51 = &unk_100282A38;
  objc_copyWeak(&v53, &v62);
  v52 = v74;
  v54 = objc_retainBlock(&v47);
  v11 = [BuddyAppleIDSignInTask alloc];
  v12 = -[BuddyAppleIDController featureFlags](v74, "featureFlags");
  v13 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  v14 = -[BuddyAppleIDSignInTask initWithFeatureFlags:accountTools:](v11, "initWithFeatureFlags:accountTools:", v12, v13);
  -[BuddyAppleIDController setSignInTask:](v74, "setSignInTask:", v14);

  v15 = -[BuddyAppleIDController signInTask](v74, "signInTask");
  -[BuddyAppleIDSignInTask setSkipDataclassEnablement:](v15, "setSkipDataclassEnablement:", 1);

  v16 = -[BuddyAppleIDController signInTask](v74, "signInTask");
  -[BuddyAppleIDSignInTask setMakeStoreServiceActive:](v16, "setMakeStoreServiceActive:", 0);

  LOBYTE(v16) = -[BuddyAppleIDController _isRestore](v74, "_isRestore");
  v17 = -[BuddyAppleIDController signInTask](v74, "signInTask");
  -[BuddyAppleIDSignInTask setRestoreFromBackupMode:](v17, "setRestoreFromBackupMode:", v16 & 1);

  v18 = -[BuddyAppleIDController featureFlags](v74, "featureFlags");
  LOBYTE(v17) = -[BuddyFeatureFlags isUseCDPContextSecretInsteadOfSBDSecretEnabled](v18, "isUseCDPContextSecretInsteadOfSBDSecretEnabled");

  if ((v17 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v19);
    v45 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = -[BuddyAppleIDController passcodeCacheManager](v74, "passcodeCacheManager");
      v21 = -[BuddyAppleIDController signInTask](v74, "signInTask");
      sub_1000CB654((uint64_t)v75, (uint64_t)"-[BuddyAppleIDController signInViewControllerForRestore]", (uint64_t)v20, (uint64_t)v21);
      _os_log_impl((void *)&_mh_execute_header, oslog, v45, "%s: Setting cache manager %@ on sign in task %@", v75, 0x20u);

    }
    objc_storeStrong((id *)&oslog, 0);
    v22 = -[BuddyAppleIDController passcodeCacheManager](v74, "passcodeCacheManager");
    v23 = -[BuddyAppleIDController signInTask](v74, "signInTask");
    -[BuddyAppleIDSignInTask setCacheManager:](v23, "setCacheManager:", v22);

  }
  v24 = -[BuddyAppleIDController signInTask](v74, "signInTask");
  objc_initWeak(&v44, v24);

  v25 = v69;
  v36 = _NSConcreteStackBlock;
  v37 = -1073741824;
  v38 = 0;
  v39 = sub_1000E5E0C;
  v40 = &unk_100282998;
  objc_copyWeak(&v42, &v62);
  objc_copyWeak(&v43, &v44);
  v41 = v54;
  objc_msgSend(v25, "setHandler:", &v36);
  v26 = v69;
  v29 = _NSConcreteStackBlock;
  v30 = -1073741824;
  v31 = 0;
  v32 = sub_1000E60A4;
  v33 = &unk_100282970;
  v34 = v54;
  objc_copyWeak(&v35, &v44);
  objc_msgSend(v26, "setProximityLoginHandler:", &v29);
  v27 = v69;
  objc_destroyWeak(&v35);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v41, 0);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_storeStrong(&v54, 0);
  objc_storeStrong((id *)&v52, 0);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&v68);
  objc_storeStrong(&v69, 0);
  objc_destroyWeak(&from);
  return v27;
}

- (BOOL)shouldAllowStartOver
{
  UINavigationController *v2;
  uint64_t v3;
  uint64_t v4;
  id location[3];
  BOOL v7;

  location[2] = self;
  location[1] = (id)a2;
  v2 = -[BuddyAppleIDController navigationController](self, "navigationController");
  location[0] = -[UINavigationController topViewController](v2, "topViewController");

  v3 = objc_opt_class(BuddyAppleIDSpinnerPage);
  if ((objc_opt_isKindOfClass(location[0], v3) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v4 = objc_opt_class(BuddyAppleIDSignInController);
    v7 = (objc_opt_isKindOfClass(location[0], v4) & 1) == 0
      || (objc_msgSend(location[0], "enabled") & 1) != 0;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (void)flowItemCancelled:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  id v5;
  id location[2];
  BuddyAppleIDController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BuddyAppleIDController flowItemDone:](v7, "flowItemDone:", location[0]);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id location[2];
  BuddyAppleIDController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAppleIDController flowItemDone:](v6, "flowItemDone:", location[0], a4);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRunForClass:(Class)a3
{
  BFFFlowItemDelegate *v3;
  unsigned __int8 v4;

  v3 = -[BuddyAppleIDController flowItemDelegate](self, "flowItemDelegate");
  v4 = -[BFFFlowItemDelegate controllerNeedsToRunForClass:](v3, "controllerNeedsToRunForClass:", a3);

  return v4 & 1;
}

- (BOOL)isFlowItemOnTop:(id)a3
{
  BFFFlowItemDelegate *v3;
  unsigned __int8 v4;
  id location[2];
  BuddyAppleIDController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDController flowItemDelegate](v7, "flowItemDelegate");
  v4 = -[BFFFlowItemDelegate isFlowItemOnTop:](v3, "isFlowItemOnTop:", location[0]);

  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4
{
  BFFFlowItemDelegate *v4;
  id v5;
  BOOL v7;

  v7 = a4;
  v4 = -[BuddyAppleIDController flowItemDelegate](self, "flowItemDelegate");
  v5 = -[BFFFlowItemDelegate popToBuddyControllerWithClass:animated:](v4, "popToBuddyControllerWithClass:animated:", a3, v7);

  return v5;
}

- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5
{
  BFFFlowItemDelegate *v5;
  id v6;
  BOOL v8;

  v8 = a5;
  v5 = -[BuddyAppleIDController flowItemDelegate](self, "flowItemDelegate");
  v6 = -[BFFFlowItemDelegate popToBuddyControllerWithClass:withOffset:animated:](v5, "popToBuddyControllerWithClass:withOffset:animated:", a3, a4, v8);

  return v6;
}

- (void)pushFlowItem:(id)a3 animated:(BOOL)a4
{
  BFFFlowItemDelegate *v5;
  BOOL v6;
  id location[2];
  BuddyAppleIDController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5 = -[BuddyAppleIDController flowItemDelegate](v8, "flowItemDelegate");
  -[BFFFlowItemDelegate pushFlowItem:animated:](v5, "pushFlowItem:animated:", location[0], v6);

  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5
{
  BFFFlowItemDelegate *v7;
  BOOL v8;
  id v9;
  id location[2];
  BuddyAppleIDController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = a5;
  v7 = -[BuddyAppleIDController flowItemDelegate](v11, "flowItemDelegate");
  -[BFFFlowItemDelegate pushFlowItem:inFlow:animated:](v7, "pushFlowItem:inFlow:animated:", location[0], v9, v8);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6
{
  BFFFlowItemDelegate *v9;
  BOOL v10;
  id v11;
  id location[2];
  BuddyAppleIDController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = a6;
  v9 = -[BuddyAppleIDController flowItemDelegate](v13, "flowItemDelegate");
  -[BFFFlowItemDelegate pushFlowItem:inFlow:withExtendedInitialization:animated:](v9, "pushFlowItem:inFlow:withExtendedInitialization:animated:", location[0], v11, a5, v10);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7
{
  BFFFlowItemDelegate *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id v15;
  id location[2];
  BuddyAppleIDController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = a5;
  v13 = a6;
  v12 = 0;
  objc_storeStrong(&v12, a7);
  v11 = -[BuddyAppleIDController flowItemDelegate](v17, "flowItemDelegate");
  -[BFFFlowItemDelegate pushFlowItem:inFlow:withExtendedInitialization:animated:willPushFlowItem:](v11, "pushFlowItem:inFlow:withExtendedInitialization:animated:willPushFlowItem:", location[0], v15, v14, v13, v12);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)removeViewControllersOnNextPush:(id)a3
{
  BFFFlowItemDelegate *v3;
  id location[2];
  BuddyAppleIDController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDController flowItemDelegate](v5, "flowItemDelegate");
  -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v3, "removeViewControllersOnNextPush:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)markFlowItemDone:(id)a3
{
  BFFFlowItemDelegate *v3;
  id location[2];
  BuddyAppleIDController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDController flowItemDelegate](v5, "flowItemDelegate");
  -[BFFFlowItemDelegate markFlowItemDone:](v3, "markFlowItemDone:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)buddyAppleIDSpinnerPageDidAppear:(id)a3
{
  uint64_t v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  NSMutableDictionary *v8;
  NSObject *v9;
  os_log_type_t v10;
  UINavigationController *v11;
  id v12;
  _WORD v13[3];
  os_log_type_t v14;
  os_log_t v15;
  uint8_t v16[15];
  os_log_type_t v17;
  os_log_t v18;
  id v19;
  id v20;
  os_log_type_t v21;
  os_log_t oslog;
  id location[2];
  BuddyAppleIDController *v24;
  uint8_t buf[24];

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100039500((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v21, "Spinner page %{public}@ appeared", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v20 = +[NSValue valueWithPointer:](NSValue, "valueWithPointer:", location[0]);
  v4 = -[BuddyAppleIDController spinnerAppearanceHandlers](v24, "spinnerAppearanceHandlers");
  v19 = -[NSMutableDictionary objectForKey:](v4, "objectForKey:", v20);

  if (v19)
  {
    v18 = (os_log_t)(id)_BYLoggingFacility(v5);
    v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v18;
      v7 = v17;
      sub_100038C3C(v16);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Spinner page matched!", v16, 2u);
    }
    objc_storeStrong((id *)&v18, 0);
    v8 = -[BuddyAppleIDController spinnerAppearanceHandlers](v24, "spinnerAppearanceHandlers");
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v20);

    (*((void (**)(void))v19 + 2))();
  }
  else
  {
    v15 = (os_log_t)(id)_BYLoggingFacility(v5);
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v15;
      v10 = v14;
      sub_100038C3C(v13);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Spinner page had no handler!", (uint8_t *)v13, 2u);
    }
    objc_storeStrong((id *)&v15, 0);
    v11 = -[BuddyAppleIDController navigationController](v24, "navigationController");
    v12 = -[UINavigationController popViewControllerAnimated:](v11, "popViewControllerAnimated:", 1);

  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  NSPointerArray *v6;
  id v7;
  id location[2];
  BuddyAppleIDController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if (-[BuddyAppleIDController countOfResponsibilityViewControllerPushSessions](v9, "countOfResponsibilityViewControllerPushSessions"))
  {
    v6 = -[BuddyAppleIDController responsibilityViewControllers](v9, "responsibilityViewControllers");
    -[NSPointerArray addPointer:](v6, "addPointer:", v7);

  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_isRestore
{
  unint64_t v2;
  char v4;

  v2 = -[BuddyAppleIDController operationType](self, "operationType");
  if (v2 < 2)
    goto LABEL_4;
  if (v2 == 2)
  {
    v4 = 1;
    return v4 & 1;
  }
  if (v2 - 3 <= 1)
LABEL_4:
    v4 = 0;
  return v4 & 1;
}

- (void)_showTwoAccountsiTunesSignInController
{
  UINavigationController *v2;
  BYPasscodeCacheManager *v3;
  id v4;
  NSString *v5;
  id v6;
  id v7;
  UINavigationController *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(id *, void *, void *);
  void *v12;
  BuddyAppleIDController *v13;
  id v14[3];
  void **v15;
  int v16;
  int v17;
  void (*v18)(id *);
  void *v19;
  BuddyAppleIDController *v20;
  id v21;
  id location;
  id v23[2];
  BuddyAppleIDController *v24;

  v24 = self;
  v23[1] = (id)a2;
  v2 = -[BuddyAppleIDController navigationController](self, "navigationController");
  v3 = -[BuddyAppleIDController passcodeCacheManager](v24, "passcodeCacheManager");
  v23[0] = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:](BuddyAppleIDSignInController, "federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:", v2, 3, v3);

  v4 = objc_msgSend(v23[0], "navigationItem");
  objc_msgSend(v4, "setHidesBackButton:", 1);

  if ((id)-[BuddyAppleIDController existingAccountType](v24, "existingAccountType") == (id)2)
  {
    v5 = -[BuddyAppleIDController existingAccountUsername](v24, "existingAccountUsername");
    objc_msgSend(v23[0], "setUsername:", v5);

  }
  objc_initWeak(&location, v23[0]);
  v6 = v23[0];
  v15 = _NSConcreteStackBlock;
  v16 = -1073741824;
  v17 = 0;
  v18 = sub_1000E6EFC;
  v19 = &unk_100280E18;
  objc_copyWeak(&v21, &location);
  v20 = v24;
  objc_msgSend(v6, "setAppearanceHandler:", &v15);
  v7 = v23[0];
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_1000E7050;
  v12 = &unk_1002828A8;
  v13 = v24;
  objc_copyWeak(v14, &location);
  objc_msgSend(v7, "setHandler:", &v9);
  v8 = -[BuddyAppleIDController navigationController](v24, "navigationController", v9, v10, v11, v12, v13);
  -[UINavigationController pushViewController:animated:](v8, "pushViewController:animated:", v23[0], 1);

  objc_destroyWeak(v14);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  objc_storeStrong(v23, 0);
}

- (void)_showProximityiCloudSignInController:(id)a3
{
  UINavigationController *v3;
  BuddyAppleIDSignInTask *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BuddyAppleIDSignInTask *v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(NSObject *, void *, void *);
  void *v13;
  id v14;
  uint8_t buf[15];
  os_log_type_t v16;
  id v17;
  id location[2];
  BuddyAppleIDController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDController navigationController](v19, "navigationController");
  v4 = -[BuddyAppleIDController signInTask](v19, "signInTask");
  -[BuddyAppleIDSignInTask setNavigationController:](v4, "setNavigationController:", v3);

  v17 = (id)_BYLoggingFacility(v5);
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v17;
    v7 = v16;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Starting proximity authentication.", buf, 2u);
  }
  objc_storeStrong(&v17, 0);
  v8 = -[BuddyAppleIDController signInTask](v19, "signInTask");
  v9 = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_1000E8130;
  v13 = &unk_100282880;
  v14 = location[0];
  -[BuddyAppleIDSignInTask authenticateWithProximity:](v8, "authenticateWithProximity:", &v9);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)_showTwoAccountsiCloudSignInController
{
  UINavigationController *v2;
  BYPasscodeCacheManager *v3;
  NSString *v4;
  id v5;
  id v6;
  UINavigationController *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(NSObject *, void *, void *);
  void *v11;
  BuddyAppleIDController *v12;
  id v13[3];
  void **v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  BuddyAppleIDController *v19;
  id v20;
  id location;
  id v22[2];
  BuddyAppleIDController *v23;

  v23 = self;
  v22[1] = (id)a2;
  -[BuddyAppleIDController setOperationType:](self, "setOperationType:", 1);
  v2 = -[BuddyAppleIDController navigationController](v23, "navigationController");
  v3 = -[BuddyAppleIDController passcodeCacheManager](v23, "passcodeCacheManager");
  v22[0] = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:](BuddyAppleIDSignInController, "federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:", v2, 2, v3);

  v4 = -[BuddyAppleIDController existingAccountUsername](v23, "existingAccountUsername");
  objc_msgSend(v22[0], "setUsername:", v4);

  objc_initWeak(&location, v22[0]);
  v5 = v22[0];
  v14 = _NSConcreteStackBlock;
  v15 = -1073741824;
  v16 = 0;
  v17 = sub_1000E8640;
  v18 = &unk_100280E18;
  objc_copyWeak(&v20, &location);
  v19 = v23;
  objc_msgSend(v5, "setAppearanceHandler:", &v14);
  v6 = v22[0];
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000E86A0;
  v11 = &unk_1002828A8;
  v12 = v23;
  objc_copyWeak(v13, &location);
  objc_msgSend(v6, "setHandler:", &v8);
  v7 = -[BuddyAppleIDController navigationController](v23, "navigationController", v8, v9, v10, v11, v12);
  -[UINavigationController pushViewController:animated:](v7, "pushViewController:animated:", v22[0], 1);

  -[BuddyAppleIDController setTwoAccountsiCloudSignInController:](v23, "setTwoAccountsiCloudSignInController:", v22[0]);
  objc_destroyWeak(v13);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  objc_storeStrong(v22, 0);
}

- (void)_appleIDControllerCompletedShouldProceed:(BOOL)a3 error:(id)a4
{
  id v4;
  BOOL v5;
  uint64_t v6;
  const __CFString *v7;
  NSString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  UINavigationController *v13;
  UIViewController *v14;
  id v15;
  BuddyAppleIDControllerDelegate *v16;
  void **v17;
  int v18;
  int v19;
  void (*v20)(uint64_t, char, id);
  void *v21;
  id v22;
  BuddyAppleIDController *v23;
  id v24;
  id v25;
  os_log_type_t v26;
  os_log_t oslog;
  id v28;
  id v29;
  char v31;
  id v32;
  char v33;
  id v34;
  os_log_type_t v35;
  id v36;
  id location;
  BOOL v38;
  SEL v39;
  BuddyAppleIDController *v40;
  uint8_t v41[16];
  uint8_t buf[24];

  v40 = self;
  v39 = a2;
  v38 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = objc_msgSend(location, "domain");
  v5 = 1;
  if ((objc_msgSend(v4, "isEqualToString:", AKAppleIDAuthenticationErrorDomain) & 1) != 0)
    v5 = objc_msgSend(location, "code") != (id)-7003;

  if (v5)
  {
    v36 = (id)_BYLoggingFacility(v6);
    v35 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
    {
      if (v38)
        v7 = CFSTR("YASE");
      else
        v7 = CFSTR("NERP");
      v33 = 0;
      v31 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v8 = (NSString *)location;
      }
      else if (location)
      {
        v34 = objc_msgSend(location, "domain");
        v33 = 1;
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v34, objc_msgSend(location, "code"));
        v32 = v8;
        v31 = 1;
      }
      else
      {
        v8 = 0;
      }
      sub_10003A6BC((uint64_t)buf, (uint64_t)v7, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v36, v35, "Auth finished, shouldProceed = %{public}@, error = %{public}@", buf, 0x16u);
      if ((v31 & 1) != 0)

      if ((v33 & 1) != 0)
    }
    objc_storeStrong(&v36, 0);
  }
  v9 = +[BYAppleIDAccountsManager sharedManager](BYAppleIDAccountsManager, "sharedManager");
  objc_msgSend(v9, "clearStoredLoginContext");

  if (v38)
  {
    v16 = -[BuddyAppleIDController delegate](v40, "delegate");
    -[BuddyAppleIDControllerDelegate appleIDControllerFinished:](v16, "appleIDControllerFinished:", v40);

  }
  else if ((BYSetupAssistantHasCompletedInitialRun(v10, v11) & 1) == 0)
  {
    v29 = objc_opt_new(ACAccountStore);
    v12 = objc_msgSend(v29, "aa_primaryAppleAccount");
    v28 = v12;
    if (v12)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v12);
      v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_msgSend(v28, "aa_primaryEmail");
        sub_100038C28((uint64_t)v41, (uint64_t)v25);
        _os_log_impl((void *)&_mh_execute_header, oslog, v26, "Removing primary account '%@' due to failure", v41, 0xCu);

        objc_storeStrong(&v25, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    v13 = -[BuddyAppleIDController navigationController](v40, "navigationController");
    v14 = -[UINavigationController topViewController](v13, "topViewController");
    v24 = -[UIViewController view](v14, "view");

    objc_msgSend(v24, "setUserInteractionEnabled:", 0);
    v15 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
    v17 = _NSConcreteStackBlock;
    v18 = -1073741824;
    v19 = 0;
    v20 = sub_1000E9A14;
    v21 = &unk_100282B50;
    v22 = v24;
    v23 = v40;
    objc_msgSend(v15, "removePrimaryAccountCompletion:", &v17);

    objc_storeStrong((id *)&v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    -[BuddyAppleIDController _popBackToAuthAttemptLandingPage](v40, "_popBackToAuthAttemptLandingPage");
  }
  objc_storeStrong(&location, 0);
}

- (void)_authCompletedShouldProceed:(BOOL)a3 error:(id)a4
{
  uint64_t v4;
  id v5;
  BuddyAppleIDControllerDelegate *v6;
  BuddyAppleIDControllerDelegate *v7;
  char v8;
  BuddyAppleIDControllerDelegate *v9;
  UIViewController *v10;
  UINavigationController *v11;
  NSArray *v12;
  UIViewController *v13;
  BOOL v14;
  UINavigationController *v15;
  UIViewController *v16;
  id v17;
  char v18;
  UIViewController *v19;
  char v20;
  UIViewController *v21;
  char v22;
  NSArray *v23;
  char v24;
  UINavigationController *v25;
  os_log_t oslog;
  id location;
  BOOL v28;
  SEL v29;
  BuddyAppleIDController *v30;
  uint8_t buf[40];

  v30 = self;
  v29 = a2;
  v28 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_1000E9E1C((uint64_t)buf, (uint64_t)"-[BuddyAppleIDController _authCompletedShouldProceed:error:]", v28, (uint64_t)location);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "%s shouldProceed = %d, error = %@", buf, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v5 = +[BYAppleIDAccountsManager sharedManager](BYAppleIDAccountsManager, "sharedManager");
  objc_msgSend(v5, "clearStoredLoginContext");

  if (v28)
  {
    v6 = -[BuddyAppleIDController delegate](v30, "delegate");
    -[BuddyAppleIDControllerDelegate appleIDControllerFinished:](v6, "appleIDControllerFinished:", v30);

  }
  else
  {
    v7 = -[BuddyAppleIDController delegate](v30, "delegate");
    v8 = objc_opt_respondsToSelector(v7, "appleIDController:failedWithError:");

    if ((v8 & 1) != 0)
    {
      v9 = -[BuddyAppleIDController delegate](v30, "delegate");
      -[BuddyAppleIDControllerDelegate appleIDController:failedWithError:](v9, "appleIDController:failedWithError:", v30, location);

    }
    else
    {
      v10 = -[BuddyAppleIDController authAttemptLandingViewController](v30, "authAttemptLandingViewController");

      if (v10)
      {
        v11 = -[BuddyAppleIDController navigationController](v30, "navigationController");
        v12 = -[UINavigationController viewControllers](v11, "viewControllers");
        v13 = -[BuddyAppleIDController authAttemptLandingViewController](v30, "authAttemptLandingViewController");
        v24 = 0;
        v22 = 0;
        v20 = 0;
        v18 = 0;
        v14 = 0;
        if (-[NSArray containsObject:](v12, "containsObject:", v13))
        {
          v25 = -[BuddyAppleIDController navigationController](v30, "navigationController");
          v24 = 1;
          v23 = -[UINavigationController viewControllers](v25, "viewControllers");
          v22 = 1;
          v21 = (UIViewController *)-[NSArray lastObject](v23, "lastObject");
          v20 = 1;
          v19 = -[BuddyAppleIDController authAttemptLandingViewController](v30, "authAttemptLandingViewController");
          v18 = 1;
          v14 = v21 != v19;
        }
        if ((v18 & 1) != 0)

        if ((v20 & 1) != 0)
        if ((v22 & 1) != 0)

        if ((v24 & 1) != 0)
        if (v14)
        {
          v15 = -[BuddyAppleIDController navigationController](v30, "navigationController");
          v16 = -[BuddyAppleIDController authAttemptLandingViewController](v30, "authAttemptLandingViewController");
          v17 = -[UINavigationController popToViewController:animated:](v15, "popToViewController:animated:", v16, 1);

        }
        -[BuddyAppleIDController setAuthAttemptLandingViewController:](v30, "setAuthAttemptLandingViewController:", 0);
      }
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)_signInSucceeded
{
  BYRunState *v2;
  char v3;
  NSObject *v4;
  BuddyAppleIDControllerDelegate *v5;
  void **block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11[2];
  BuddyAppleIDController *v12;

  v12 = self;
  v11[1] = (id)a2;
  if ((id)-[BuddyAppleIDController operationType](self, "operationType") == (id)1)
  {
    v2 = -[BuddyAppleIDController runState](v12, "runState");
    v3 = -[BYRunState hasCompletedInitialRun](v2, "hasCompletedInitialRun") ^ 1;

    if ((v3 & 1) != 0)
    {
      v4 = dispatch_get_global_queue(25, 0);
      block = _NSConcreteStackBlock;
      v7 = -1073741824;
      v8 = 0;
      v9 = sub_1000E9F7C;
      v10 = &unk_100280730;
      v11[0] = v12;
      dispatch_async(v4, &block);

      objc_storeStrong(v11, 0);
    }
  }
  v5 = -[BuddyAppleIDController delegate](v12, "delegate");
  -[BuddyAppleIDControllerDelegate appleIDControllerFinished:](v5, "appleIDControllerFinished:", v12);

}

- (void)_signInFailedWithError:(id)a3
{
  BuddyAppleIDControllerDelegate *v3;
  char v4;
  BuddyAppleIDControllerDelegate *v5;
  UIViewController *v6;
  UINavigationController *v7;
  UIViewController *v8;
  id v9;
  id location[2];
  BuddyAppleIDController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDController delegate](v11, "delegate");
  v4 = objc_opt_respondsToSelector(v3, "appleIDController:failedWithError:");

  if ((v4 & 1) != 0)
  {
    v5 = -[BuddyAppleIDController delegate](v11, "delegate");
    -[BuddyAppleIDControllerDelegate appleIDController:failedWithError:](v5, "appleIDController:failedWithError:", v11, location[0]);

  }
  else
  {
    v6 = -[BuddyAppleIDController authAttemptLandingViewController](v11, "authAttemptLandingViewController");

    if (v6)
    {
      v7 = -[BuddyAppleIDController navigationController](v11, "navigationController");
      v8 = -[BuddyAppleIDController authAttemptLandingViewController](v11, "authAttemptLandingViewController");
      v9 = -[UINavigationController popToViewController:animated:](v7, "popToViewController:animated:", v8, 1);

      -[BuddyAppleIDController setAuthAttemptLandingViewController:](v11, "setAuthAttemptLandingViewController:", 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_createMeCard
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  NSString *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t v15[7];
  char v16;
  os_log_t v17;
  char v18;
  id v19;
  char v20;
  id v21;
  os_log_type_t v22;
  os_log_t v23;
  uint8_t v24[15];
  os_log_type_t v25;
  os_log_t oslog;
  id obj;
  char v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[15];
  char v33;
  id location;
  id v35[3];
  uint8_t v36[24];

  v35[2] = self;
  v35[1] = (id)a2;
  v35[0] = objc_alloc_init((Class)CNContactStore);
  location = (id)_BYLoggingFacility(v35[0]);
  v33 = 16;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
  {
    v2 = location;
    v3 = v33;
    sub_100038C3C(buf);
    _os_log_error_impl((void *)&_mh_execute_header, v2, v3, "Creating Me card...", buf, 2u);
  }
  objc_storeStrong(&location, 0);
  if (v35[0])
  {
    v31 = objc_alloc_init((Class)ACAccountStore);
    v30 = objc_msgSend(v31, "aa_primaryAppleAccount");
    v29 = 0;
    v28 = 0;
    v5 = v35[0];
    v6 = objc_msgSend(v30, "aa_firstName");
    v7 = objc_msgSend(v30, "aa_lastName");
    v8 = objc_msgSend(v30, "aa_primaryEmail");
    obj = 0;
    LOBYTE(v5) = objc_msgSend(v5, "setBestMeIfNeededForGivenName:familyName:email:error:", v6, v7, v8, &obj);
    objc_storeStrong(&v29, obj);

    v28 = v5 & 1;
    if ((v5 & 1) != 0)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v9);
      v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = oslog;
        v11 = v25;
        sub_100038C3C(v24);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Successfully created Me card", v24, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    else if (v29)
    {
      v23 = (os_log_t)(id)_BYLoggingFacility(v9);
      v22 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v20 = 0;
        v18 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v12 = (NSString *)v29;
        }
        else if (v29)
        {
          v21 = objc_msgSend(v29, "domain");
          v20 = 1;
          v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v21, objc_msgSend(v29, "code"));
          v19 = v12;
          v18 = 1;
        }
        else
        {
          v12 = 0;
        }
        sub_100039500((uint64_t)v36, (uint64_t)v12);
        _os_log_error_impl((void *)&_mh_execute_header, v23, v22, "Failed to create Me card: %{public}@", v36, 0xCu);
        if ((v18 & 1) != 0)

        if ((v20 & 1) != 0)
      }
      objc_storeStrong((id *)&v23, 0);
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v17 = (os_log_t)(id)_BYLoggingFacility(v4);
    v16 = 16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v13 = v17;
      v14 = v16;
      sub_100038C3C(v15);
      _os_log_error_impl((void *)&_mh_execute_header, v13, v14, "Failed to create contact store to create Me card", v15, 2u);
    }
    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong(v35, 0);
}

- (void)_nameDevice
{
  uint64_t v2;
  id v3;
  id v4;
  NSBundle *v5;
  id v6;
  NSString *v7;
  uint64_t v8;
  os_log_t oslog;
  id v10;
  id location;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18[3];
  id v19;
  id v20;
  uint8_t buf[24];

  v18[2] = self;
  v18[1] = (id)a2;
  v18[0] = objc_alloc_init((Class)ACAccountStore);
  v17 = objc_msgSend(v18[0], "aa_primaryAppleAccount");
  v16 = objc_msgSend(v17, "aa_firstName");
  if ((BYSetupAssistantHasCompletedInitialRun(v16, v2) & 1) == 0 && objc_msgSend(v16, "length"))
  {
    v20 = (id)MGCopyAnswer(CFSTR("DeviceName"), 0);
    v15 = v20;
    v14 = lockdown_connect();
    if (v14)
    {
      v19 = (id)MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
      v13 = v19;
      if (objc_msgSend(v15, "length") && (objc_msgSend(v15, "isEqualToString:", v13) & 1) != 0)
      {
        v12 = v16;
        if ((objc_msgSend(v16, "_containsCJKScriptsOnly") & 1) != 0)
        {
          location = objc_msgSend(v17, "aa_lastName");
          if (objc_msgSend(location, "length")
            && (objc_msgSend(location, "_containsCJKScriptsOnly") & 1) != 0)
          {
            v3 = objc_msgSend(location, "stringByAppendingString:", v16);
            v4 = v12;
            v12 = v3;

          }
          objc_storeStrong(&location, 0);
        }
        v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("DEVICE_NAME"));
        v7 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("Localizable"));
        v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v12);

        oslog = (os_log_t)(id)_BYLoggingFacility(v8);
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          sub_100038C28((uint64_t)buf, (uint64_t)v10);
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Setting device name to '%@'", buf, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        lockdown_set_value(v14, 0, kLockdownDeviceNameKey, v10);
        objc_storeStrong(&v10, 0);
        objc_storeStrong(&v12, 0);
      }
      lockdown_disconnect(v14);
      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

- (void)_beginPostUpgradeAppleIDLoginWithUsername:(id)a3 password:(id)a4 signInController:(id)a5
{
  id v7;
  id v8;
  id location[2];
  BuddyAppleIDController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = 0;
  objc_storeStrong(&v7, a5);
  -[BuddyAppleIDController _beginPostUpgradeAppleIDLoginWithUsername:password:continuationKey:signInController:](v10, "_beginPostUpgradeAppleIDLoginWithUsername:password:continuationKey:signInController:", location[0], v8, 0, v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_beginPostUpgradeAppleIDLoginWithUsername:(id)a3 password:(id)a4 continuationKey:(id)a5 signInController:(id)a6
{
  UINavigationController *v9;
  BYPasscodeCacheManager *v10;
  BuddyAppleIDAuthManager *v11;
  BuddyAppleIDAuthManager *v12;
  BuddyAppleIDAuthManager *v13;
  ACAccount *v14;
  BuddyAppleIDAuthManager *v15;
  BuddyAppleIDAuthManager *v16;
  id v17;
  id v18;
  id v19;
  void **v20;
  int v21;
  int v22;
  void (*v23)(id *, void *, void *);
  void *v24;
  BuddyAppleIDController *v25;
  id v26;
  id v27;
  id v28;
  id location[2];
  BuddyAppleIDController *v30;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v26 = 0;
  objc_storeStrong(&v26, a6);
  if (location[0] && (v28 || v27))
  {
    v9 = -[BuddyAppleIDController navigationController](v30, "navigationController");
    v10 = -[BuddyAppleIDController passcodeCacheManager](v30, "passcodeCacheManager");
    v11 = +[BuddyAppleIDAuthManager managerWithNavigationController:passcodeCacheManager:](BuddyAppleIDAuthManager, "managerWithNavigationController:passcodeCacheManager:", v9, v10);
    -[BuddyAppleIDController setAuthManager:](v30, "setAuthManager:", v11);

    v12 = -[BuddyAppleIDController authManager](v30, "authManager");
    -[BuddyAppleIDAuthManager setShouldOfferSecurityUpgrade:](v12, "setShouldOfferSecurityUpgrade:", 1);

    v13 = -[BuddyAppleIDController authManager](v30, "authManager");
    v14 = -[BuddyAppleIDController accountToUpgrade](v30, "accountToUpgrade");
    -[BuddyAppleIDAuthManager setAccountToUpgrade:](v13, "setAccountToUpgrade:", v14);

    v15 = -[BuddyAppleIDController authManager](v30, "authManager");
    -[BuddyAppleIDAuthManager setHasContinuationKey:](v15, "setHasContinuationKey:", v27 != 0);

    v16 = -[BuddyAppleIDController authManager](v30, "authManager");
    v17 = v26;
    v18 = location[0];
    v19 = v28;
    v20 = _NSConcreteStackBlock;
    v21 = -1073741824;
    v22 = 0;
    v23 = sub_1000EABAC;
    v24 = &unk_100282880;
    v25 = v30;
    -[BuddyAppleIDAuthManager authenticateWithSignInController:username:password:completion:](v16, "authenticateWithSignInController:username:password:completion:", v17, v18, v19, &v20);

    objc_storeStrong((id *)&v25, 0);
  }
  else
  {
    -[BuddyAppleIDController _authCompletedShouldProceed:error:](v30, "_authCompletedShouldProceed:error:", 1, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)_upgradeAccountWithAuthenticationResults:(id)a3 completion:(id)a4
{
  BuddyAppleIDSignInTask *v5;
  BuddyFeatureFlags *v6;
  id v7;
  BuddyAppleIDSignInTask *v8;
  UINavigationController *v9;
  BuddyAppleIDSignInTask *v10;
  BuddyAppleIDSignInTask *v11;
  BuddyAppleIDSignInTask *v12;
  BuddyFeatureFlags *v13;
  uint64_t v14;
  BYPasscodeCacheManager *v15;
  BuddyAppleIDSignInTask *v16;
  BYPasscodeCacheManager *v17;
  BuddyAppleIDSignInTask *v18;
  BuddyAppleIDSpinnerPage *v19;
  UINavigationController *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  id v24;
  id v25;
  id v26;
  unsigned __int8 v27;
  BuddyAppleIDSignInTask *v28;
  id v29;
  void **v30;
  int v31;
  int v32;
  void (*v33)(uint64_t, char, id);
  void *v34;
  BuddyAppleIDController *v35;
  id v36;
  id v37;
  id v38;
  uint8_t v39[15];
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  os_log_type_t v43;
  os_log_t oslog;
  id v45;
  id location[2];
  BuddyAppleIDController *v47;
  uint8_t buf[40];

  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = 0;
  objc_storeStrong(&v45, a4);
  v5 = [BuddyAppleIDSignInTask alloc];
  v6 = -[BuddyAppleIDController featureFlags](v47, "featureFlags");
  v7 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  v8 = -[BuddyAppleIDSignInTask initWithFeatureFlags:accountTools:](v5, "initWithFeatureFlags:accountTools:", v6, v7);
  -[BuddyAppleIDController setSignInTask:](v47, "setSignInTask:", v8);

  v9 = -[BuddyAppleIDController navigationController](v47, "navigationController");
  v10 = -[BuddyAppleIDController signInTask](v47, "signInTask");
  -[BuddyAppleIDSignInTask setNavigationController:](v10, "setNavigationController:", v9);

  v11 = -[BuddyAppleIDController signInTask](v47, "signInTask");
  -[BuddyAppleIDSignInTask setSkipDataclassEnablement:](v11, "setSkipDataclassEnablement:", 1);

  LOBYTE(v11) = -[BuddyAppleIDController _isRestore](v47, "_isRestore");
  v12 = -[BuddyAppleIDController signInTask](v47, "signInTask");
  -[BuddyAppleIDSignInTask setRestoreFromBackupMode:](v12, "setRestoreFromBackupMode:", v11 & 1);

  v13 = -[BuddyAppleIDController featureFlags](v47, "featureFlags");
  LOBYTE(v12) = -[BuddyFeatureFlags isUseCDPContextSecretInsteadOfSBDSecretEnabled](v13, "isUseCDPContextSecretInsteadOfSBDSecretEnabled");

  if ((v12 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v14);
    v43 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[BuddyAppleIDController passcodeCacheManager](v47, "passcodeCacheManager");
      v16 = -[BuddyAppleIDController signInTask](v47, "signInTask");
      sub_1000CB654((uint64_t)buf, (uint64_t)"-[BuddyAppleIDController _upgradeAccountWithAuthenticationResults:completion:]", (uint64_t)v15, (uint64_t)v16);
      _os_log_impl((void *)&_mh_execute_header, oslog, v43, "%s: Setting cache manager %@ on sign in task %@", buf, 0x20u);

    }
    objc_storeStrong((id *)&oslog, 0);
    v17 = -[BuddyAppleIDController passcodeCacheManager](v47, "passcodeCacheManager");
    v18 = -[BuddyAppleIDController signInTask](v47, "signInTask");
    -[BuddyAppleIDSignInTask setCacheManager:](v18, "setCacheManager:", v17);

  }
  v19 = [BuddyAppleIDSpinnerPage alloc];
  v42 = -[BuddyAppleIDSpinnerPage initWithAccountMode:](v19, "initWithAccountMode:", -[BuddyAppleIDController operationType](v47, "operationType"));
  v20 = -[BuddyAppleIDController navigationController](v47, "navigationController");
  -[UINavigationController pushViewController:animated:](v20, "pushViewController:animated:", v42, 1);

  v41 = (os_log_t)(id)_BYLoggingFacility(v21);
  v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v41;
    v23 = v40;
    sub_100038C3C(v39);
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Beginning sign-in...", v39, 2u);
  }
  objc_storeStrong((id *)&v41, 0);
  v38 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", AIDAServiceTypeCloud);
  v37 = +[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore");
  v24 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationAlternateDSIDKey);
  v25 = objc_msgSend(v37, "ams_activeiTunesAccount");
  v26 = objc_msgSend(v25, "aa_altDSID");
  v27 = objc_msgSend(v24, "isEqualToString:", v26);

  if ((v27 & 1) != 0)
    objc_msgSend(v38, "addObject:", AIDAServiceTypeStore);
  -[BuddyAppleIDController _willStartResponsibilityViewControllerPushSession](v47, "_willStartResponsibilityViewControllerPushSession");
  v28 = -[BuddyAppleIDController signInTask](v47, "signInTask");
  v29 = location[0];
  v30 = _NSConcreteStackBlock;
  v31 = -1073741824;
  v32 = 0;
  v33 = sub_1000EB430;
  v34 = &unk_100282BC0;
  v35 = v47;
  v36 = v45;
  -[BuddyAppleIDSignInTask signInToServices:authenticationResults:completion:](v28, "signInToServices:authenticationResults:completion:", v38, v29, &v30);

  objc_storeStrong(&v36, 0);
  objc_storeStrong((id *)&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
}

- (void)_loadSecurityUpgradeUI
{
  void **v2;
  int v3;
  int v4;
  void (*v5)(id *, void *, void *);
  void *v6;
  BuddyAppleIDController *v7;
  id location;
  id v9[2];
  BuddyAppleIDController *v10;

  v10 = self;
  v9[1] = (id)a2;
  -[BuddyAppleIDController setAssumeResponsibilityForRUIPage:](self, "setAssumeResponsibilityForRUIPage:", 1);
  -[BuddyAppleIDController _setupAccountForSecurityUpgrade](v10, "_setupAccountForSecurityUpgrade");
  v9[0] = -[BuddyAppleIDController _authenticationContextForSecurityUpgrade](v10, "_authenticationContextForSecurityUpgrade");
  location = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v2 = _NSConcreteStackBlock;
  v3 = -1073741824;
  v4 = 0;
  v5 = sub_1000EB814;
  v6 = &unk_100282880;
  v7 = v10;
  objc_msgSend(location, "authenticateWithContext:completion:", v9[0], &v2);
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v9, 0);
}

- (id)_authenticationContextForSecurityUpgrade
{
  UINavigationController *v2;
  AKAccountManager *v3;
  ACAccount *v4;
  id v5;
  ACAccount *v6;
  NSString *v7;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;
  char v13;
  NSMutableDictionary *v14;
  id location;
  id v16[2];
  BuddyAppleIDController *v17;

  v17 = self;
  v16[1] = (id)a2;
  v16[0] = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  v2 = -[BuddyAppleIDController navigationController](v17, "navigationController");
  objc_msgSend(v16[0], "setPresentingViewController:", v2);

  v3 = +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v4 = -[BuddyAppleIDController accountToUpgrade](v17, "accountToUpgrade");
  v5 = -[AKAccountManager altDSIDForAccount:](v3, "altDSIDForAccount:", v4);
  objc_msgSend(v16[0], "setAltDSID:", v5);

  v6 = -[BuddyAppleIDController accountToUpgrade](v17, "accountToUpgrade");
  v7 = -[ACAccount username](v6, "username");
  objc_msgSend(v16[0], "setUsername:", v7);

  objc_msgSend(v16[0], "setIsUsernameEditable:", 0);
  objc_msgSend(v16[0], "setAppProvidedContext:", AKAppleIDAuthenticationAppProvidedContextAuthless);
  objc_msgSend(v16[0], "setNeedsSecurityUpgradeUI:", 1);
  objc_msgSend(v16[0], "setShouldOfferSecurityUpgrade:", 1);
  objc_msgSend(v16[0], "setForceInlinePresentation:", 1);
  if (-[BuddyAppleIDController accountToUpgradeIsPrimary](v17, "accountToUpgradeIsPrimary"))
  {
    if ((+[BYWarranty shouldDisplay](BYWarranty, "shouldDisplay") & 1) != 0)
    {
      v8 = objc_msgSend(v16[0], "httpHeadersForRemoteUI");
      v9 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
      v10 = v9;
      v13 = 0;
      if (!v9)
      {
        v9 = objc_opt_new(NSMutableDictionary);
        v14 = v9;
        v13 = 1;
      }
      location = v9;
      if ((v13 & 1) != 0)

      objc_msgSend(location, "setObject:forKey:", CFSTR("true"), CFSTR("X-MMe-Show-Warranty"));
      objc_msgSend(v16[0], "setHttpHeadersForRemoteUI:", location);
      objc_storeStrong(&location, 0);
    }
    objc_msgSend(v16[0], "setAnticipateEscrowAttempt:", 1);
    objc_msgSend(v16[0], "setShouldRequestConfigurationInfo:", 1);
  }
  v11 = v16[0];
  objc_storeStrong(v16, 0);
  return v11;
}

- (void)_setupAccountForSecurityUpgrade
{
  AKAccountManager *v2;
  AKAccountManager *v3;
  AKAccountManager *v4;
  id v5;
  id v6;
  id v7;
  id location;
  id v9;
  id v10[2];
  BuddyAppleIDController *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = -[BuddyAppleIDController accountToUpgrade](self, "accountToUpgrade");
  v2 = +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v9 = -[AKAccountManager altDSIDForAccount:](v2, "altDSIDForAccount:", v10[0]);

  v3 = +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  location = -[AKAccountManager primaryAuthKitAccount](v3, "primaryAuthKitAccount");

  v4 = +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v5 = -[AKAccountManager altDSIDForAccount:](v4, "altDSIDForAccount:", location);
  -[BuddyAppleIDController setAccountToUpgradeIsPrimary:](v11, "setAccountToUpgradeIsPrimary:", (unint64_t)objc_msgSend(v9, "isEqualToString:", v5) & 1);

  if (-[BuddyAppleIDController accountToUpgradeIsPrimary](v11, "accountToUpgradeIsPrimary"))
  {
    v6 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
    v7 = objc_msgSend(v6, "primaryAccount");
    -[BuddyAppleIDController setAccountToUpgrade:](v11, "setAccountToUpgrade:", v7);

  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
}

- (void)_showSpinnerPageWithIdentifier:(id)a3 handler:(id)a4
{
  id v5;
  uint64_t v6;
  char isKindOfClass;
  BuddyAppleIDSpinnerPage *v8;
  BuddyAppleIDSpinnerPage *v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  BuddyAppleIDController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = -[BuddyAppleIDController navigationController](v14, "navigationController");
  v5 = objc_msgSend(v11, "topViewController");
  v6 = objc_opt_class(BuddyAppleIDSpinnerPage);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    (*((void (**)(void))v12 + 2))();
  }
  else
  {
    v8 = [BuddyAppleIDSpinnerPage alloc];
    v9 = -[BuddyAppleIDSpinnerPage initWithAccountMode:](v8, "initWithAccountMode:", -[BuddyAppleIDController operationType](v14, "operationType"));
    -[BuddyAppleIDController _showSpinnerPage:appearanceHandler:](v14, "_showSpinnerPage:appearanceHandler:", v9, v12, v9);
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_showSpinnerPage:(id)a3 appearanceHandler:(id)a4
{
  UINavigationController *v5;
  UIViewController *v6;
  uint64_t v7;
  char isKindOfClass;
  void (**v9)(void);
  id location[2];
  BuddyAppleIDController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong((id *)&v9, a4);
  v5 = -[BuddyAppleIDController navigationController](v11, "navigationController");
  v6 = -[UINavigationController topViewController](v5, "topViewController");
  v7 = objc_opt_class(BuddyAppleIDSpinnerPage);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9[2]();
  }
  else
  {
    -[BuddyAppleIDController _setAppearanceHandler:forSpinnerPage:](v11, "_setAppearanceHandler:forSpinnerPage:", v9, location[0]);
    objc_msgSend(location[0], "setSpinnerDelegate:", v11);
    -[BuddyAppleIDController _pushNextViewController:](v11, "_pushNextViewController:", location[0]);
  }
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_pushNextViewController:(id)a3
{
  UINavigationController *v3;
  id v4;
  UINavigationController *v5;
  UIViewController *v6;
  id location[2];
  BuddyAppleIDController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDController navigationController](v8, "navigationController");
  v6 = -[UINavigationController topViewController](v3, "topViewController");

  if ((objc_opt_respondsToSelector(v6, "controllerAllowsNavigatingBack") & 1) != 0
    && (-[UIViewController controllerAllowsNavigatingBack](v6, "controllerAllowsNavigatingBack") & 1) == 0)
  {
    v4 = objc_msgSend(location[0], "navigationItem");
    objc_msgSend(v4, "setHidesBackButton:", 1);

  }
  v5 = -[BuddyAppleIDController navigationController](v8, "navigationController", v6);
  -[UINavigationController pushViewController:animated:](v5, "pushViewController:animated:", location[0], 1);

  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_setAppearanceHandler:(id)a3 forSpinnerPage:(id)a4
{
  NSMutableDictionary *v5;
  BOOL v6;
  id v7;
  id v8;
  NSMutableDictionary *v9;
  NSValue *v10;
  int v11;
  id v12;
  id location[2];
  BuddyAppleIDController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  if (location[0])
  {
    v5 = -[BuddyAppleIDController spinnerAppearanceHandlers](v14, "spinnerAppearanceHandlers");
    v6 = v5 == 0;

    if (v6)
    {
      v7 = objc_alloc_init((Class)NSMutableDictionary);
      -[BuddyAppleIDController setSpinnerAppearanceHandlers:](v14, "setSpinnerAppearanceHandlers:", v7);

    }
    v10 = +[NSValue valueWithPointer:](NSValue, "valueWithPointer:", v12);
    v8 = objc_retainBlock(location[0]);
    v9 = -[BuddyAppleIDController spinnerAppearanceHandlers](v14, "spinnerAppearanceHandlers");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

    objc_msgSend(v12, "setSpinnerDelegate:", v14);
    objc_storeStrong((id *)&v10, 0);
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_popBackToAuthAttemptLandingPage
{
  UIViewController *v2;
  UINavigationController *v3;
  UIViewController *v4;
  UIViewController *v5;
  UINavigationController *v6;
  NSArray *v7;
  UIViewController *v8;
  unsigned __int8 v9;
  UINavigationController *v10;
  UIViewController *v11;
  id v12;
  os_log_t oslog[2];
  BuddyAppleIDController *v14;
  uint8_t buf[24];

  v14 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    v2 = -[BuddyAppleIDController authAttemptLandingViewController](v14, "authAttemptLandingViewController");
    v3 = -[BuddyAppleIDController navigationController](v14, "navigationController");
    v4 = -[UINavigationController topViewController](v3, "topViewController");
    sub_10003EB04((uint64_t)buf, (uint64_t)v2, (uint64_t)v4);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "Auth attempt landing = %@, top view controller = %@", buf, 0x16u);

  }
  objc_storeStrong((id *)oslog, 0);
  v5 = -[BuddyAppleIDController authAttemptLandingViewController](v14, "authAttemptLandingViewController");

  if (v5)
  {
    v6 = -[BuddyAppleIDController navigationController](v14, "navigationController");
    v7 = -[UINavigationController viewControllers](v6, "viewControllers");
    v8 = -[BuddyAppleIDController authAttemptLandingViewController](v14, "authAttemptLandingViewController");
    v9 = -[NSArray containsObject:](v7, "containsObject:", v8);

    if ((v9 & 1) != 0)
    {
      v10 = -[BuddyAppleIDController navigationController](v14, "navigationController");
      v11 = -[BuddyAppleIDController authAttemptLandingViewController](v14, "authAttemptLandingViewController");
      v12 = -[UINavigationController popToViewController:animated:](v10, "popToViewController:animated:", v11, 1);

    }
    -[BuddyAppleIDController setAuthAttemptLandingViewController:](v14, "setAuthAttemptLandingViewController:", 0);
  }
}

- (void)_removeBackToViewControllerMatchingBlock:(id)a3 withOffset:(int64_t)a4
{
  UINavigationController *v5;
  uint64_t (**v6)(id, id);
  id v7;
  id v8;
  BFFFlowItemDelegate *v9;
  char *i;
  id v11;
  id v12;
  char v13;
  unint64_t v14;
  id location[2];
  BuddyAppleIDController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  v13 = 0;
  v12 = objc_opt_new(NSMutableArray);
  v5 = -[BuddyAppleIDController navigationController](v16, "navigationController");
  v11 = -[UINavigationController viewControllers](v5, "viewControllers");

  if ((unint64_t)objc_msgSend(v11, "count") > v14)
  {
    for (i = (char *)objc_msgSend(v11, "count", 0) - v14 - 1; (uint64_t)i > 0; --i)
    {
      v6 = (uint64_t (**)(id, id))location[0];
      v7 = objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      LOBYTE(v6) = v6[2](v6, v7) ^ 1;

      if ((v6 & 1) == 0)
      {
        v13 = 1;
        break;
      }
      v8 = objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      objc_msgSend(v12, "addObject:", v8);

    }
    if ((v13 & 1) != 0)
    {
      v9 = -[BuddyAppleIDController flowItemDelegate](v16, "flowItemDelegate");
      -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v9, "removeViewControllersOnNextPush:", v12);

    }
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_setLogInOptionsForBuddyAppleIDAuthMode:(int)a3 signInController:(id)a4
{
  id v4;
  char v5;
  id v6;
  id v7;
  id v8;
  os_log_t v9;
  os_log_type_t v10;
  os_log_t v11;
  void **v12;
  int v13;
  int v14;
  void ***(*v15)(id *, _QWORD *);
  void *v16;
  id v17;
  id v18;
  void **v19;
  int v20;
  int v21;
  void ***(*v22)(id *, _QWORD *);
  void *v23;
  id v24;
  os_log_type_t v25;
  os_log_t oslog;
  void **v27;
  int v28;
  int v29;
  void ***(*v30)(id *, _QWORD *);
  void *v31;
  id v32;
  id v33;
  int v34;
  os_log_type_t v35;
  id v36;
  char v37;
  char v38;
  char v39;
  id v40;
  id location;
  int v42;
  SEL v43;
  BuddyAppleIDController *v44;
  uint8_t v45[16];
  uint8_t v46[16];
  uint8_t v47[16];
  uint8_t buf[8];

  v44 = self;
  v43 = a2;
  v42 = a3;
  objc_initWeak(&location, a4);
  v40 = v44;
  v39 = -[BuddyAppleIDController hasProximityConnection](v44, "hasProximityConnection");
  v4 = +[AKFeatureManager isProxAuthEnabled](AKFeatureManager, "isProxAuthEnabled");
  v38 = v4 & 1;
  v37 = 0;
  v5 = 0;
  if ((v39 & 1) == 0)
    v5 = v38;
  v37 = v5;
  if (v42 == 1 || v42 == 5 || v42 == 4)
  {
    if (v42 == 1)
    {
      if ((v37 & 1) != 0)
      {
        v6 = objc_loadWeakRetained(&location);
        v27 = _NSConcreteStackBlock;
        v28 = -1073741824;
        v29 = 0;
        v30 = sub_1000ED210;
        v31 = &unk_100282BE8;
        v32 = v40;
        objc_copyWeak(&v33, &location);
        objc_msgSend(v6, "setLoginOptionsConstructor:", &v27);

        objc_destroyWeak(&v33);
        objc_storeStrong(&v32, 0);
      }
      else
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v4);
        v25 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          sub_10003CBAC((uint64_t)v47, v42, -[BuddyAppleIDController hasProximityConnection](v44, "hasProximityConnection"));
          _os_log_impl((void *)&_mh_execute_header, oslog, v25, "Not showing Apple ID Proximity Login for auth mode %i, in prox flow %i", v47, 0xEu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v7 = objc_loadWeakRetained(&location);
        v19 = _NSConcreteStackBlock;
        v20 = -1073741824;
        v21 = 0;
        v22 = sub_1000ED7C8;
        v23 = &unk_100282C10;
        v24 = v40;
        objc_msgSend(v7, "setLoginOptionsConstructor:", &v19);

        objc_storeStrong(&v24, 0);
      }
      goto LABEL_27;
    }
    if ((v42 - 2) < 2)
      goto LABEL_24;
    if ((v42 - 4) < 2)
    {
      if ((v37 & 1) != 0)
      {
        v8 = objc_loadWeakRetained(&location);
        v12 = _NSConcreteStackBlock;
        v13 = -1073741824;
        v14 = 0;
        v15 = sub_1000ED8E4;
        v16 = &unk_100282BE8;
        v17 = v40;
        objc_copyWeak(&v18, &location);
        objc_msgSend(v8, "setLoginOptionsConstructor:", &v12);

        objc_destroyWeak(&v18);
        objc_storeStrong(&v17, 0);
      }
      else
      {
        v11 = (os_log_t)(id)_BYLoggingFacility(v4);
        v10 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          sub_10003CBAC((uint64_t)v46, v42, -[BuddyAppleIDController hasProximityConnection](v44, "hasProximityConnection"));
          _os_log_impl((void *)&_mh_execute_header, v11, v10, "Not showing Apple ID Proximity Login for auth mode %i, in prox flow %i", v46, 0xEu);
        }
        objc_storeStrong((id *)&v11, 0);
      }
      goto LABEL_27;
    }
    if ((v42 - 6) < 3)
    {
LABEL_24:
      v9 = (os_log_t)(id)_BYLoggingFacility(v4);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        sub_100046FA0(v45, v42);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not elegible for Proximity Login with auth mode %i", v45, 8u);
      }
      objc_storeStrong((id *)&v9, 0);
    }
LABEL_27:
    v34 = 0;
    goto LABEL_28;
  }
  v36 = (id)_BYLoggingFacility(v4);
  v35 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
  {
    sub_100046FA0(buf, v42);
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v36, v35, "_setLogInOptionsForBuddyAppleIDAuthMode called for unsupported auth mode %i", buf, 8u);
  }
  objc_storeStrong(&v36, 0);
  v34 = 1;
LABEL_28:
  objc_storeStrong(&v40, 0);
  objc_destroyWeak(&location);
}

- (BuddyAppleIDControllerDelegate)delegate
{
  return (BuddyAppleIDControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setFlowItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowItemDelegate, a3);
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (UIViewController)authAttemptLandingViewController
{
  return self->_authAttemptLandingViewController;
}

- (void)setAuthAttemptLandingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_authAttemptLandingViewController, a3);
}

- (BOOL)hasProximityConnection
{
  return self->_hasProximityConnection;
}

- (void)setHasProximityConnection:(BOOL)a3
{
  self->_hasProximityConnection = a3;
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

- (ACAccount)accountToUpgrade
{
  return self->_accountToUpgrade;
}

- (void)setAccountToUpgrade:(id)a3
{
  objc_storeStrong((id *)&self->_accountToUpgrade, a3);
}

- (BOOL)accountToUpgradeIsPrimary
{
  return self->_accountToUpgradeIsPrimary;
}

- (void)setAccountToUpgradeIsPrimary:(BOOL)a3
{
  self->_accountToUpgradeIsPrimary = a3;
}

- (NSString)existingAccountUsername
{
  return self->_existingAccountUsername;
}

- (void)setExistingAccountUsername:(id)a3
{
  objc_storeStrong((id *)&self->_existingAccountUsername, a3);
}

- (unint64_t)existingAccountType
{
  return self->_existingAccountType;
}

- (void)setExistingAccountType:(unint64_t)a3
{
  self->_existingAccountType = a3;
}

- (BuddyAppleIDSignInTask)signInTask
{
  return self->_signInTask;
}

- (void)setSignInTask:(id)a3
{
  objc_storeStrong((id *)&self->_signInTask, a3);
}

- (UINavigationController)modalNavigationController
{
  return self->_modalNavigationController;
}

- (void)setModalNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_modalNavigationController, a3);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (BOOL)assumeResponsibilityForRUIPage
{
  return self->_assumeResponsibilityForRUIPage;
}

- (void)setAssumeResponsibilityForRUIPage:(BOOL)a3
{
  self->_assumeResponsibilityForRUIPage = a3;
}

- (unint64_t)countOfResponsibilityViewControllerPushSessions
{
  return self->_countOfResponsibilityViewControllerPushSessions;
}

- (void)setCountOfResponsibilityViewControllerPushSessions:(unint64_t)a3
{
  self->_countOfResponsibilityViewControllerPushSessions = a3;
}

- (NSPointerArray)responsibilityViewControllers
{
  return self->_responsibilityViewControllers;
}

- (void)setResponsibilityViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_responsibilityViewControllers, a3);
}

- (NSMutableDictionary)spinnerAppearanceHandlers
{
  return self->_spinnerAppearanceHandlers;
}

- (void)setSpinnerAppearanceHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerAppearanceHandlers, a3);
}

- (BuddyAppleIDAuthManager)authManager
{
  return self->_authManager;
}

- (void)setAuthManager:(id)a3
{
  objc_storeStrong((id *)&self->_authManager, a3);
}

- (BuddyAppleIDSignInController)twoAccountsiCloudSignInController
{
  return (BuddyAppleIDSignInController *)objc_loadWeakRetained((id *)&self->_twoAccountsiCloudSignInController);
}

- (void)setTwoAccountsiCloudSignInController:(id)a3
{
  objc_storeWeak((id *)&self->_twoAccountsiCloudSignInController, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_destroyWeak((id *)&self->_twoAccountsiCloudSignInController);
  objc_storeStrong((id *)&self->_authManager, 0);
  objc_storeStrong((id *)&self->_spinnerAppearanceHandlers, 0);
  objc_storeStrong((id *)&self->_responsibilityViewControllers, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_modalNavigationController, 0);
  objc_storeStrong((id *)&self->_signInTask, 0);
  objc_storeStrong((id *)&self->_existingAccountUsername, 0);
  objc_storeStrong((id *)&self->_accountToUpgrade, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_lockdownModeProvider, 0);
  objc_storeStrong((id *)&self->_authAttemptLandingViewController, 0);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
