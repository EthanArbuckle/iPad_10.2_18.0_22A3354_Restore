@implementation BuddyRestoreRenewController

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id location[2];
  BuddyRestoreRenewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
    (*((void (**)(id, unint64_t))location[0] + 2))(location[0], -[BuddyRestoreRenewController forceReauthentication](v4, "forceReauthentication"));
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  UIViewController *v2;
  NSObject *v3;
  os_log_type_t v4;
  BuddyAppleIDController *v5;
  BYPasscodeCacheManager *v6;
  BYAnalyticsManager *v7;
  BYRunState *v8;
  id v9;
  BuddyAppleIDController *v10;
  BuddyAppleIDController *v11;
  BFFFlowItemDelegate *v12;
  BuddyAppleIDController *v13;
  UINavigationController *v14;
  BuddyAppleIDController *v15;
  ProximitySetupController *v16;
  BuddyAppleIDController *v17;
  BuddyAppleIDController *v18;
  id v19;
  BuddyAppleIDController *v20;
  id v21;
  uint8_t buf[15];
  os_log_type_t v24;
  os_log_t oslog;
  id location;
  id v27[2];
  BuddyRestoreRenewController *v28;
  UIViewController *v29;

  v28 = self;
  v27[1] = (id)a2;
  v2 = -[BuddyRestoreRenewController signInController](self, "signInController");

  if (v2)
  {
    v29 = -[BuddyRestoreRenewController signInController](v28, "signInController");
  }
  else
  {
    v27[0] = objc_opt_new(ACAccountStore);
    location = objc_msgSend(v27[0], "aa_primaryAppleAccount");
    if (location)
    {
      v5 = [BuddyAppleIDController alloc];
      v6 = -[BuddyRestoreRenewController passcodeCacheManager](v28, "passcodeCacheManager");
      v7 = -[BuddyRestoreRenewController analyticsManager](v28, "analyticsManager");
      v8 = -[BuddyRestoreRenewController runState](v28, "runState");
      v9 = +[BuddyFeatureFlags currentFlags](BuddyFeatureFlags, "currentFlags");
      v10 = -[BuddyAppleIDController initWithAccount:passcodeCacheManager:analyticsManager:runState:featureFlags:](v5, "initWithAccount:passcodeCacheManager:analyticsManager:runState:featureFlags:", location, v6, v7, v8, v9);
      -[BuddyRestoreRenewController setAppleIDController:](v28, "setAppleIDController:", v10);

      v11 = -[BuddyRestoreRenewController appleIDController](v28, "appleIDController");
      -[BuddyAppleIDController setDelegate:](v11, "setDelegate:", v28);

      v12 = -[BuddyRestoreRenewController delegate](v28, "delegate");
      v13 = -[BuddyRestoreRenewController appleIDController](v28, "appleIDController");
      -[BuddyAppleIDController setFlowItemDelegate:](v13, "setFlowItemDelegate:", v12);

      v14 = -[BuddyRestoreRenewController navigationController](v28, "navigationController");
      v15 = -[BuddyRestoreRenewController appleIDController](v28, "appleIDController");
      -[BuddyAppleIDController setNavigationController:](v15, "setNavigationController:", v14);

      v16 = -[BuddyRestoreRenewController proximitySetupController](v28, "proximitySetupController");
      LOBYTE(v15) = -[ProximitySetupController hasConnection](v16, "hasConnection");
      v17 = -[BuddyRestoreRenewController appleIDController](v28, "appleIDController");
      -[BuddyAppleIDController setHasProximityConnection:](v17, "setHasProximityConnection:", v15 & 1);

      v18 = -[BuddyRestoreRenewController appleIDController](v28, "appleIDController");
      v19 = objc_msgSend(location, "username");
      -[BuddyAppleIDController setExistingAccountUsername:accountType:](v18, "setExistingAccountUsername:accountType:", v19, 1);

      v20 = -[BuddyRestoreRenewController appleIDController](v28, "appleIDController");
      v21 = -[BuddyAppleIDController upgradeAccountForRestoreAfterSoftwareUpdateSignInViewController](v20, "upgradeAccountForRestoreAfterSoftwareUpdateSignInViewController");
      -[BuddyRestoreRenewController setSignInController:](v28, "setSignInController:", v21);

      v29 = -[BuddyRestoreRenewController signInController](v28, "signInController");
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(0);
      v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v3 = oslog;
        v4 = v24;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "No primary account to use for post-software-update restore!", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v29 = 0;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(v27, 0);
  }
  return v29;
}

- (void)appleIDControllerFinished:(id)a3
{
  BuddyAppleIDController *v3;
  BuddyAppleIDController *v4;
  BFFFlowItemDelegate *v5;
  id location[2];
  BuddyRestoreRenewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (BuddyAppleIDController *)location[0];
  v4 = -[BuddyRestoreRenewController appleIDController](v7, "appleIDController");

  if (v3 == v4)
  {
    v5 = -[BuddyRestoreRenewController delegate](v7, "delegate");
    -[BFFFlowItemDelegate flowItemDone:](v5, "flowItemDone:", v7);

  }
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)forceReauthentication
{
  return self->_forceReauthentication;
}

- (void)setForceReauthentication:(BOOL)a3
{
  self->_forceReauthentication = a3;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
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

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNavigationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BuddyAppleIDController)appleIDController
{
  return (BuddyAppleIDController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAppleIDController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (UIViewController)signInController
{
  return (UIViewController *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSignInController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInController, 0);
  objc_storeStrong((id *)&self->_appleIDController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
