@implementation BuddyProximityCloudFlow

- (BuddyProximityCloudFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  NSArray *v10;
  BuddyProximityCloudFlow *v11;
  objc_super v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  id v18;
  _QWORD v19[2];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = 0;
  objc_storeStrong(&v14, a6);
  v9 = v18;
  v18 = 0;
  v13.receiver = v9;
  v13.super_class = (Class)BuddyProximityCloudFlow;
  v18 = -[BuddyProximityCloudFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v13, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v16, v15, v14);
  objc_storeStrong(&v18, v18);
  if (v18)
  {
    v19[0] = objc_opt_class(BuddyProximityCloudController);
    v19[1] = objc_opt_class(BuddyAssociationController);
    v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2);
    objc_msgSend(v18, "setClassList:", v10);

  }
  v11 = (BuddyProximityCloudFlow *)v18;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v11;
}

+ (id)allowedFlowItems
{
  _QWORD v3[2];

  v3[0] = objc_opt_class(BuddyAssociationController);
  v3[1] = objc_opt_class(BuddyProximityCloudController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppleID;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  MCProfileConnection *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BuddyNetworkProvider *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  ProximitySetupController *v13;
  SASProximityInformation *v14;
  id v15;
  BOOL v16;
  ProximitySetupController *v17;
  id v18;
  id v19;
  char v20;
  BuddyMiscState *v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  _WORD v25[3];
  os_log_type_t v26;
  os_log_t v27;
  id v28;
  char v29;
  char v30;
  char v31;
  BOOL v32;
  uint8_t v33[15];
  os_log_type_t v34;
  os_log_t oslog;
  int v36;
  uint8_t buf[15];
  os_log_type_t v38;
  id v39;
  id location[2];
  BuddyProximityCloudFlow *v41;

  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityCloudFlow managedConfiguration](v41, "managedConfiguration");
  v4 = -[MCProfileConnection effectiveBoolValueForSetting:](v3, "effectiveBoolValueForSetting:", MCFeatureAccountModificationAllowed);

  if (v4 == 2)
  {
    v39 = (id)_BYLoggingFacility(v5);
    v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v39;
      v7 = v38;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Skipping proximity sign in, account modification is restricted", buf, 2u);
    }
    objc_storeStrong(&v39, 0);
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v36 = 1;
  }
  else
  {
    v8 = -[BuddyProximityCloudFlow networkProvider](v41, "networkProvider");
    v9 = !-[BuddyNetworkProvider networkReachable](v8, "networkReachable");

    if ((v9 & 1) != 0)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v10);
      v34 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = oslog;
        v12 = v34;
        sub_100038C3C(v33);
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Skipping proximity sign in, network is not reachable", v33, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
      v36 = 1;
    }
    else
    {
      v13 = -[BuddyProximityCloudFlow proximitySetupController](v41, "proximitySetupController");
      v14 = -[ProximitySetupController information](v13, "information");
      v15 = -[SASProximityInformation appleID](v14, "appleID");
      v16 = v15 != 0;

      v32 = v16;
      v17 = -[BuddyProximityCloudFlow proximitySetupController](v41, "proximitySetupController");
      LOBYTE(v14) = -[ProximitySetupController hasConnection](v17, "hasConnection");

      v31 = v14 & 1;
      v18 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
      v19 = objc_msgSend(v18, "aa_primaryAppleAccount");
      LOBYTE(v14) = v19 != 0;

      v30 = v14 & 1;
      v29 = 0;
      v20 = 0;
      if (v16)
      {
        v20 = 0;
        if ((v31 & 1) != 0)
          v20 = v30 ^ 1;
      }
      v29 = v20 & 1;
      if ((v20 & 1) != 0)
      {
        v21 = -[BuddyProximityCloudFlow miscState](v41, "miscState");
        v28 = -[BuddyMiscState migrationManager](v21, "migrationManager");

        if ((objc_msgSend(v28, "requiresUpdateToMigrate") & 1) != 0)
        {
          v22 = objc_msgSend(v28, "willMigrate");
          if ((v22 & 1) != 0)
          {
            v27 = (os_log_t)(id)_BYLoggingFacility(v22);
            v26 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v23 = v27;
              v24 = v26;
              sub_100038C3C(v25);
              _os_log_impl((void *)&_mh_execute_header, v23, v24, "Skipping proximity sign in, update required to migrate", (uint8_t *)v25, 2u);
            }
            objc_storeStrong((id *)&v27, 0);
            v29 = 0;
          }
        }
        objc_storeStrong(&v28, 0);
      }
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], v29 & 1);
      v36 = 0;
    }
  }
  objc_storeStrong(location, 0);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
}

@end
