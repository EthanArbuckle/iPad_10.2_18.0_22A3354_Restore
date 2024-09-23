@implementation BuddyAppleIDHostController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppleID;
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

- (BuddyAppleIDHostController)initWithAccount:(id)a3
{
  id v3;
  BuddyAppleIDHostController *v4;
  id location[2];
  id v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0;
  v7 = objc_msgSend(v3, "initWithAccount:mode:", location[0], 0);
  v4 = (BuddyAppleIDHostController *)v7;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v4;
}

- (BuddyAppleIDHostController)initWithAccount:(id)a3 mode:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  BuddyAppleIDHostController *v8;
  objc_super v10;
  unint64_t v11;
  id location[2];
  id v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  v5 = v13;
  v13 = 0;
  v10.receiver = v5;
  v10.super_class = (Class)BuddyAppleIDHostController;
  v13 = -[BuddyAppleIDHostController init](&v10, "init");
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    *((_QWORD *)v13 + 2) = v11;
    objc_storeStrong((id *)v13 + 6, location[0]);
    v6 = objc_msgSend(location[0], "accountStore");
    v7 = (void *)*((_QWORD *)v13 + 5);
    *((_QWORD *)v13 + 5) = v6;

  }
  v8 = (BuddyAppleIDHostController *)v13;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v13, 0);
  return v8;
}

- (void)setNavigationController:(id)a3
{
  id location[2];
  BuddyAppleIDHostController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAppleIDController setNavigationController:](v4->_appleIDController, "setNavigationController:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)setDelegate:(id)a3
{
  id location[2];
  BuddyAppleIDHostController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_delegate, location[0]);
  -[BuddyAppleIDController setFlowItemDelegate:](v4->_appleIDController, "setFlowItemDelegate:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerAllowsNavigatingBack
{
  return self->_allowBack;
}

- (BOOL)shouldAllowStartOver
{
  return -[BuddyAppleIDController shouldAllowStartOver](self->_appleIDController, "shouldAllowStartOver", a2, self);
}

- (BOOL)_forceInteractiveAuthFromPreTigrisUpgrade
{
  char HasCompletedInitialRun;
  BOOL v3;
  NSInteger v4;
  char v6;
  NSUserDefaults *v7;
  BOOL v8;

  HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun(self, a2);
  v6 = 0;
  v3 = 0;
  if ((HasCompletedInitialRun & 1) != 0)
  {
    v7 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v6 = 1;
    v4 = -[NSUserDefaults integerForKey:](v7, "integerForKey:", BYBuddyIOSVersionKey);
    v3 = v4 < BYTigrisVersion;
  }
  v8 = v3;
  if ((v6 & 1) != 0)

  return v8;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyAppleIDController *v3;
  ACAccount *account;
  BYPasscodeCacheManager *v5;
  BYAnalyticsManager *v6;
  BYRunState *v7;
  id v8;
  BuddyAppleIDController *v9;
  BuddyAppleIDController *appleIDController;
  BFFFlowItemDelegate *v11;
  ProximitySetupController *v12;
  unsigned __int8 v13;
  LockdownModeProvider *v14;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  BuddyAppleIDController *v21;
  NSString *v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL8 v25;
  NSObject *v26;
  os_log_type_t v27;
  id v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  BuddyMiscState *v33;
  unsigned __int8 v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  NSObject *v38;
  os_log_type_t v39;
  NSObject *v40;
  os_log_type_t v41;
  id v42;
  ACAccount *v43;
  BuddyMiscState *v44;
  ProximitySetupController *v45;
  SASProximityInformation *v46;
  id v47;
  void **v48;
  int v49;
  int v50;
  void (*v51)(uint64_t, char, id);
  void *v52;
  id v53;
  BuddyAppleIDHostController *v54;
  id v55;
  uint8_t v56[15];
  os_log_type_t v57;
  os_log_t v58;
  id v59;
  uint8_t v60[7];
  os_log_type_t v61;
  os_log_t v62;
  uint8_t v63[7];
  os_log_type_t v64;
  os_log_t v65;
  uint8_t v66[7];
  os_log_type_t v67;
  os_log_t v68;
  uint8_t v69[7];
  os_log_type_t v70;
  os_log_t v71;
  uint8_t buf[7];
  os_log_type_t v73;
  os_log_t oslog;
  char v75;
  id v76;
  char v77;
  id v78;
  BOOL v79;
  id v80;
  char v81;
  id v82;
  BOOL v83;
  id location[2];
  BuddyAppleIDHostController *v85;

  v85 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAppleIDHostController setRanSilentUpdateProperties:](v85, "setRanSilentUpdateProperties:", 0);
  v3 = [BuddyAppleIDController alloc];
  account = v85->_account;
  v5 = -[BuddyAppleIDHostController passcodeCacheManager](v85, "passcodeCacheManager");
  v6 = -[BuddyAppleIDHostController analyticsManager](v85, "analyticsManager");
  v7 = -[BuddyAppleIDHostController runState](v85, "runState");
  v8 = +[BuddyFeatureFlags currentFlags](BuddyFeatureFlags, "currentFlags");
  v9 = -[BuddyAppleIDController initWithAccount:passcodeCacheManager:analyticsManager:runState:featureFlags:](v3, "initWithAccount:passcodeCacheManager:analyticsManager:runState:featureFlags:", account, v5, v6, v7, v8);
  appleIDController = v85->_appleIDController;
  v85->_appleIDController = v9;

  -[BuddyAppleIDController setDelegate:](v85->_appleIDController, "setDelegate:", v85);
  v11 = -[BuddyAppleIDHostController delegate](v85, "delegate");
  -[BuddyAppleIDController setFlowItemDelegate:](v85->_appleIDController, "setFlowItemDelegate:", v11);

  v12 = -[BuddyAppleIDHostController proximitySetupController](v85, "proximitySetupController");
  v13 = -[ProximitySetupController hasConnection](v12, "hasConnection");
  -[BuddyAppleIDController setHasProximityConnection:](v85->_appleIDController, "setHasProximityConnection:", v13 & 1);

  v14 = -[BuddyAppleIDHostController lockdownModeProvider](v85, "lockdownModeProvider");
  -[BuddyAppleIDController setLockdownModeProvider:](v85->_appleIDController, "setLockdownModeProvider:", v14);

  v83 = 0;
  v15 = -[ACAccount aa_authToken](v85->_account, "aa_authToken");
  v81 = 0;
  v16 = 1;
  if (!v15)
  {
    v82 = -[ACAccount aa_password](v85->_account, "aa_password");
    v81 = 1;
    v16 = v82 != 0;
  }
  if ((v81 & 1) != 0)

  v83 = v16;
  v17 = +[BYAppleIDAccountsManager sharedManager](BYAppleIDAccountsManager, "sharedManager");
  v80 = objc_msgSend(v17, "storedLoginContext");

  v79 = 0;
  v18 = objc_msgSend(v80, "appleID");
  v77 = 0;
  v75 = 0;
  v19 = 0;
  if (v18)
  {
    v78 = objc_msgSend(v80, "rawPassword");
    v77 = 1;
    v19 = 1;
    if (!v78)
    {
      v76 = objc_msgSend(v80, "continuationKey");
      v75 = 1;
      v19 = v76 != 0;
    }
  }
  if ((v75 & 1) != 0)

  if ((v77 & 1) != 0)
  v79 = v19;
  if (v85->_account)
  {
    v21 = v85->_appleIDController;
    v22 = -[ACAccount username](v85->_account, "username");
    -[BuddyAppleIDController setExistingAccountUsername:accountType:](v21, "setExistingAccountUsername:accountType:", v22, 1);

  }
  if (v85->_mode == 1 || !v79)
  {
    v25 = -[BuddyAppleIDHostController _forceInteractiveAuthFromPreTigrisUpgrade](v85, "_forceInteractiveAuthFromPreTigrisUpgrade");
    if (v25)
    {
      v71 = (os_log_t)(id)_BYLoggingFacility(v25);
      v70 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v71;
        v27 = v70;
        sub_100038C3C(v69);
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "AppleIDHost: Forcing interactive Apple ID upgrade auth", v69, 2u);
      }
      objc_storeStrong((id *)&v71, 0);
      (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    }
    else
    {
      v28 = +[BYSetupStateManager sharedManager](BYSetupStateManager, "sharedManager");
      v29 = objc_msgSend(v28, "restoreType");

      if (v29 == (id)1)
      {
        v68 = (os_log_t)(id)_BYLoggingFacility(v30);
        v67 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          v31 = v68;
          v32 = v67;
          sub_100038C3C(v66);
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "AppleIDHost: Running post-iTunes-Restore interactive Apple ID renew", v66, 2u);
        }
        objc_storeStrong((id *)&v68, 0);
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
      }
      else
      {
        v33 = -[BuddyAppleIDHostController miscState](v85, "miscState");
        v34 = -[BuddyMiscState forcePrimaryAppleIDAuthentication](v33, "forcePrimaryAppleIDAuthentication");

        if ((v34 & 1) != 0)
        {
          v65 = (os_log_t)(id)_BYLoggingFacility(v35);
          v64 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v36 = v65;
            v37 = v64;
            sub_100038C3C(v63);
            _os_log_impl((void *)&_mh_execute_header, v36, v37, "AppleIDHost: Running forced interactive Apple ID renew", v63, 2u);
          }
          objc_storeStrong((id *)&v65, 0);
          (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
        }
        else if (v85->_mode == 2)
        {
          v62 = (os_log_t)(id)_BYLoggingFacility(v35);
          v61 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v38 = v62;
            v39 = v61;
            sub_100038C3C(v60);
            _os_log_impl((void *)&_mh_execute_header, v38, v39, "AppleIDHost: Running Apple ID security upgrade", v60, 2u);
          }
          objc_storeStrong((id *)&v62, 0);
          (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
        }
        else if (v85->_mode == 1 || !v83)
        {
          if (v85->_mode == 1)
          {
            v44 = -[BuddyAppleIDHostController miscState](v85, "miscState");
            v47 = -[BuddyMiscState iCloudAppleIdFromActivation](v44, "iCloudAppleIdFromActivation");

            if (!v47)
            {
              v45 = -[BuddyAppleIDHostController proximitySetupController](v85, "proximitySetupController");
              v46 = -[ProximitySetupController information](v45, "information");
              v47 = -[SASProximityInformation appleID](v46, "appleID");

            }
            -[BuddyAppleIDController setExistingAccountUsername:accountType:](v85->_appleIDController, "setExistingAccountUsername:accountType:", v47, 1, v47);
            (*((void (**)(id, BOOL))location[0] + 2))(location[0], v85->_account == 0);
            objc_storeStrong(&v47, 0);
          }
          else
          {
            (*((void (**)(id, BOOL))location[0] + 2))(location[0], v85->_account == 0);
          }
        }
        else
        {
          v59 = objc_alloc_init((Class)ACAccountStore);
          v58 = (os_log_t)(id)_BYLoggingFacility(v59);
          v57 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v58;
            v41 = v57;
            sub_100038C3C(v56);
            _os_log_impl((void *)&_mh_execute_header, v40, v41, "AppleIDHost: Attempting silent -upgradeProperties...", v56, 2u);
          }
          objc_storeStrong((id *)&v58, 0);
          v42 = v59;
          v43 = v85->_account;
          v48 = _NSConcreteStackBlock;
          v49 = -1073741824;
          v50 = 0;
          v51 = sub_1001964AC;
          v52 = &unk_1002836B0;
          v53 = v59;
          v54 = v85;
          v55 = location[0];
          objc_msgSend(v42, "aa_updatePropertiesForAppleAccount:completion:", v43, &v48);
          objc_storeStrong(&v55, 0);
          objc_storeStrong((id *)&v54, 0);
          objc_storeStrong(&v53, 0);
          objc_storeStrong(&v59, 0);
        }
      }
    }
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v20);
    v73 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v23 = oslog;
      v24 = v73;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "AppleIDHost: Transient storage has credentials", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(&v80, 0);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  UIViewController *v2;
  UIViewController *viewController;
  UIViewController *v4;
  UIViewController *v5;
  id v6;
  id v7;
  BOOL v8;
  UIViewController *v9;
  UIViewController *v10;
  UIViewController *v11;
  UIViewController *v12;
  UIViewController *v13;
  UIViewController *v14;
  char v16;
  id v17;
  char v18;
  id v19;
  id location[2];
  BuddyAppleIDHostController *v21;

  v21 = self;
  location[1] = (id)a2;
  if (!self->_viewController)
  {
    if (v21->_mode == 1)
    {
      v2 = (UIViewController *)-[BuddyAppleIDController signInViewControllerForRestore](v21->_appleIDController, "signInViewControllerForRestore");
      viewController = v21->_viewController;
      v21->_viewController = v2;

      v21->_allowBack = 1;
    }
    else if (v21->_account)
    {
      if (v21->_mode == 2)
      {
        v4 = (UIViewController *)-[BuddyAppleIDController securityUpgradeAccountSignInViewController](v21->_appleIDController, "securityUpgradeAccountSignInViewController");
        v5 = v21->_viewController;
        v21->_viewController = v4;

        v21->_allowBack = 1;
      }
      else
      {
        v6 = +[BYAppleIDAccountsManager sharedManager](BYAppleIDAccountsManager, "sharedManager");
        location[0] = objc_msgSend(v6, "storedLoginContext");

        v7 = objc_msgSend(location[0], "appleID");
        v18 = 0;
        v16 = 0;
        v8 = 0;
        if (v7)
        {
          v19 = objc_msgSend(location[0], "rawPassword");
          v18 = 1;
          v8 = 1;
          if (!v19)
          {
            v17 = objc_msgSend(location[0], "continuationKey");
            v16 = 1;
            v8 = v17 != 0;
          }
        }
        if ((v16 & 1) != 0)

        if ((v18 & 1) != 0)
        if (v8)
        {
          v9 = (UIViewController *)-[BuddyAppleIDController silentUpgradeViewControllerWithLoginContext:](v21->_appleIDController, "silentUpgradeViewControllerWithLoginContext:", location[0]);
          v10 = v21->_viewController;
          v21->_viewController = v9;

          v21->_allowBack = 0;
        }
        else
        {
          v11 = (UIViewController *)-[BuddyAppleIDController upgradeAccountSignInViewController](v21->_appleIDController, "upgradeAccountSignInViewController");
          v12 = v21->_viewController;
          v21->_viewController = v11;

          v21->_allowBack = 1;
        }
        objc_storeStrong(location, 0);
      }
    }
    else
    {
      v13 = (UIViewController *)-[BuddyAppleIDController signInViewController](v21->_appleIDController, "signInViewController");
      v14 = v21->_viewController;
      v21->_viewController = v13;

    }
  }
  return v21->_viewController;
}

- (BOOL)responsibleForViewController:(id)a3
{
  unsigned __int8 v3;
  id location[2];
  BuddyAppleIDHostController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDController responsibleForViewController:](v6->_appleIDController, "responsibleForViewController:", location[0]);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)setExistingAccountUsername:(id)a3 accountType:(unint64_t)a4
{
  id location[2];
  BuddyAppleIDHostController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAppleIDController setExistingAccountUsername:accountType:](v6->_appleIDController, "setExistingAccountUsername:accountType:", location[0], a4, a4);
  objc_storeStrong(location, 0);
}

- (void)controllerWasPopped
{
  BYPreferencesController *v2;

  v2 = -[BuddyAppleIDHostController buddyPreferences](self, "buddyPreferences", a2, self);
  -[BYPreferencesController setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("AppleIDPB10Presented"));

}

- (void)appleIDControllerWantsChoiceController:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BYPreferencesController *v6;
  id WeakRetained;
  _WORD v8[7];
  os_log_type_t v9;
  os_log_t oslog;
  id location[2];
  BuddyAppleIDHostController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12->_allowBack = 1;
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v9;
    sub_100038C3C(v8);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "BuddyAppleIDHostController wants choice controller", (uint8_t *)v8, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = -[BuddyAppleIDHostController buddyPreferences](v12, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v6, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("AppleIDPB10Presented"));

  WeakRetained = objc_loadWeakRetained((id *)&v12->_delegate);
  objc_msgSend(WeakRetained, "flowItemDone:nextItemClass:", v12, objc_opt_class(BuddyAppleIDChoiceController));

  objc_storeStrong(location, 0);
}

- (void)appleIDControllerFinished:(id)a3
{
  uint64_t v3;
  NSBundle *v4;
  NSString *v5;
  NSBundle *v6;
  NSString *v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  UIAlertAction *v11;
  id WeakRetained;
  NSObject *v13;
  os_log_type_t v14;
  BYPreferencesController *v15;
  BYPaneFeatureAnalyticsManager *v16;
  id v17;
  id v18;
  uint8_t buf[15];
  os_log_type_t v20;
  os_log_t oslog;
  void **v22;
  int v23;
  int v24;
  void (*v25)(id *, void *);
  void *v26;
  BuddyAppleIDHostController *v27;
  id v28;
  id v29;
  id v30;
  id location[2];
  BuddyAppleIDHostController *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v32->_mode == 1)
  {
    v32->_allowBack = 1;
    v30 = objc_alloc_init((Class)ACAccountStore);
    v29 = objc_msgSend(v30, "aa_primaryAppleAccount");
    if (v29)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v32->_delegate);
      objc_msgSend(WeakRetained, "flowItemDone:", v32);

    }
    else
    {
      v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("CANT_LOGIN_APPLEID_GENERIC_TITLE"), &stru_100284738, CFSTR("Localizable"));
      v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("CANT_LOGIN_APPLEID_UNKNOWN_ERROR"), &stru_100284738, CFSTR("Localizable"));
      v28 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);

      v8 = v28;
      v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
      v22 = _NSConcreteStackBlock;
      v23 = -1073741824;
      v24 = 0;
      v25 = sub_1001971C4;
      v26 = &unk_100280A28;
      v27 = v32;
      v11 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, &v22);
      objc_msgSend(v8, "addAction:", v11);

      -[UIViewController presentViewController:animated:completion:](v32->_viewController, "presentViewController:animated:completion:", v28, 1, 0);
      objc_storeStrong((id *)&v27, 0);
      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    v32->_allowBack = 0;
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = oslog;
      v14 = v20;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "BuddyAppleIDHostController finished!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v15 = -[BuddyAppleIDHostController buddyPreferences](v32, "buddyPreferences");
    -[BYPreferencesController setObject:forKey:](v15, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("AppleIDPB10Presented"));

    v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32->_mode == 2);
    v16 = -[BuddyAppleIDHostController paneFeatureAnalyticsManager](v32, "paneFeatureAnalyticsManager");
    -[BYPaneFeatureAnalyticsManager recordActionWithValue:previousValue:forFeature:](v16, "recordActionWithValue:previousValue:forFeature:", &__kCFBooleanTrue, v18, 14);

    v17 = objc_loadWeakRetained((id *)&v32->_delegate);
    objc_msgSend(v17, "flowItemDone:", v32);

    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BOOL)ranSilentUpdateProperties
{
  return self->_ranSilentUpdateProperties;
}

- (void)setRanSilentUpdateProperties:(BOOL)a3
{
  self->_ranSilentUpdateProperties = a3;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
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

- (LockdownModeProvider)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownModeProvider, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_lockdownModeProvider, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_appleIDController, 0);
}

@end
