@implementation BuddyAppleIDFlow

- (BOOL)controllerNeedsToRun
{
  BYCapabilities *v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  BuddyNetworkProvider *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _WORD v18[3];
  os_log_type_t v19;
  os_log_t v20;
  uint8_t v21[7];
  os_log_type_t v22;
  os_log_t oslog;
  char v24;
  id v25;
  uint8_t buf[15];
  os_log_type_t v27;
  id location[2];
  BuddyAppleIDFlow *v29;

  v29 = self;
  location[1] = (id)a2;
  v2 = -[BuddyAppleIDFlow capabilities](self, "capabilities");
  v3 = -[BYCapabilities canShowAppleIDScreen](v2, "canShowAppleIDScreen") ^ 1;

  if ((v3 & 1) != 0)
  {
    location[0] = (id)_BYLoggingFacility(v4);
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = location[0];
      v6 = v27;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Skipping Apple ID Setup because changing accounts is restricted", buf, 2u);
    }
    objc_storeStrong(location, 0);
    return 0;
  }
  else
  {
    v7 = -[BuddyAppleIDFlow networkProvider](v29, "networkProvider");
    v24 = 0;
    v8 = 0;
    if (!-[BuddyNetworkProvider networkReachable](v7, "networkReachable"))
    {
      v25 = -[BuddyAppleIDFlow miscState](v29, "miscState");
      v24 = 1;
      v8 = objc_msgSend(v25, "userSkippedWiFi");
    }
    if ((v24 & 1) != 0)

    if ((v8 & 1) != 0)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v9);
      v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = oslog;
        v11 = v22;
        sub_100038C3C(v21);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Skipping Apple ID Setup because the network is not reachable and the user skipped Wi-Fi", v21, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      return 0;
    }
    else
    {
      v12 = +[BuddyAppleIDConfigurationManager sharedManager](BuddyAppleIDConfigurationManager, "sharedManager");
      v13 = objc_msgSend(v12, "isServiceEnabled") ^ 1;

      if ((v13 & 1) != 0)
      {
        v20 = (os_log_t)(id)_BYLoggingFacility(v14);
        v19 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v20;
          v16 = v19;
          sub_100038C3C(v18);
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "Skipping Apple ID Setup because the service not enabled", (uint8_t *)v18, 2u);
        }
        objc_storeStrong((id *)&v20, 0);
        return 0;
      }
      else
      {
        return 1;
      }
    }
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;
  id v6;
  BuddyAppleIDFlow *v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(id *, char);
  void *v12;
  BuddyAppleIDFlow *v13;
  id v14;
  id v15;
  id v16;
  int v17;
  id location[2];
  BuddyAppleIDFlow *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
    v5 = objc_msgSend(v4, "aa_isManagedAppleID");

    if ((v5 & 1) != 0)
    {
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
      v17 = 1;
    }
    else
    {
      v6 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
      v16 = objc_msgSend(v6, "primaryAccount");

      v7 = v19;
      v8 = _NSConcreteStackBlock;
      v9 = -1073741824;
      v10 = 0;
      v11 = sub_100168CFC;
      v12 = &unk_100283B20;
      v13 = v19;
      v14 = v16;
      v15 = location[0];
      -[BuddyAppleIDFlow _fetchRequiresTermsAcceptanceForAccount:completion:](v7, "_fetchRequiresTermsAcceptanceForAccount:completion:", v16, &v8);
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v14, 0);
      objc_storeStrong((id *)&v13, 0);
      objc_storeStrong(&v16, 0);
      v17 = 0;
    }
  }
  else
  {
    v17 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)firstItem
{
  BuddyMiscState *v2;
  BuddyTargetDeviceMigrationManager *v3;
  unsigned __int8 v4;
  ACAccount *v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  BuddyAppleIDRepairController *v10;
  id v11;
  ACAccount *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  BuddyAppleIDHostController *v16;
  ACAccount *v17;
  BuddyAppleIDHostController *v18;
  id v19;
  ACAccount *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  BuddyAppleIDHostController *v24;
  ACAccount *v25;
  BuddyAppleIDHostController *v26;
  id v27;
  NSString *v28;
  NSUInteger v29;
  NSString *v30;
  unsigned __int8 v31;
  char v33;
  id v34;
  id obj;
  uint8_t v36[7];
  os_log_type_t v37;
  os_log_t v38;
  uint8_t v39[7];
  os_log_type_t v40;
  os_log_t v41;
  uint8_t buf[15];
  os_log_type_t v43;
  os_log_t oslog;
  id location;
  char v46;
  SEL v47;
  BuddyAppleIDFlow *v48;
  id v49;

  v48 = self;
  v47 = a2;
  v2 = -[BuddyAppleIDFlow miscState](self, "miscState");
  v3 = -[BuddyMiscState migrationManager](v2, "migrationManager");
  v4 = -[BuddyTargetDeviceMigrationManager willMigrate](v3, "willMigrate");

  v46 = v4 & 1;
  location = 0;
  v5 = -[BuddyAppleIDFlow accountToRepair](v48, "accountToRepair");
  v6 = 0;
  if (v5)
    v6 = -[BuddyAppleIDFlow performAuthKitRepair](v48, "performAuthKitRepair");

  if ((v6 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v7);
    v43 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = oslog;
      v9 = v43;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Apple ID needs AuthKit repair.", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v10 = objc_alloc_init(BuddyAppleIDRepairController);
    v11 = location;
    location = v10;

  }
  else
  {
    v12 = -[BuddyAppleIDFlow accountToRepair](v48, "accountToRepair");

    if (v12)
    {
      v41 = (os_log_t)(id)_BYLoggingFacility(v13);
      v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v41;
        v15 = v40;
        sub_100038C3C(v39);
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Apple ID needs repair.", v39, 2u);
      }
      objc_storeStrong((id *)&v41, 0);
      v16 = [BuddyAppleIDHostController alloc];
      v17 = -[BuddyAppleIDFlow accountToRepair](v48, "accountToRepair");
      v18 = -[BuddyAppleIDHostController initWithAccount:](v16, "initWithAccount:", v17);
      v19 = location;
      location = v18;

    }
    else
    {
      v20 = -[BuddyAppleIDFlow accountForSecurityUpgrade](v48, "accountForSecurityUpgrade");

      if (v20)
      {
        v38 = (os_log_t)(id)_BYLoggingFacility(v21);
        v37 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v38;
          v23 = v37;
          sub_100038C3C(v36);
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "Apple ID needs security upgrade.", v36, 2u);
        }
        objc_storeStrong((id *)&v38, 0);
        v24 = [BuddyAppleIDHostController alloc];
        v25 = -[BuddyAppleIDFlow accountForSecurityUpgrade](v48, "accountForSecurityUpgrade");
        v26 = -[BuddyAppleIDHostController initWithAccount:mode:](v24, "initWithAccount:mode:", v25, 2);
        v27 = location;
        location = v26;

      }
      else if ((v46 & 1) == 0)
      {
        obj = -[BuddyAppleIDHostController initWithAccount:]([BuddyAppleIDHostController alloc], "initWithAccount:", 0);
        v28 = -[BuddyAppleIDFlow existingAccountUsername](v48, "existingAccountUsername");
        v29 = -[NSString length](v28, "length");

        if (v29)
        {
          v30 = -[BuddyAppleIDFlow existingAccountUsername](v48, "existingAccountUsername");
          objc_msgSend(obj, "setExistingAccountUsername:accountType:", v30, -[BuddyAppleIDFlow existingAccountType](v48, "existingAccountType"));

        }
        objc_storeStrong(&location, obj);
        objc_storeStrong(&obj, 0);
      }
    }
  }
  -[BuddyAppleIDFlow configureFlowItem:](v48, "configureFlowItem:", location);
  v33 = 0;
  v31 = 0;
  if (location)
  {
    v34 = -[BuddyAppleIDFlow starter](v48, "starter");
    v33 = 1;
    v31 = objc_msgSend(v34, "controllerNeedsToRunForClass:", objc_opt_class(location));
  }
  if ((v33 & 1) != 0)

  if ((v31 & 1) != 0)
    v49 = location;
  else
    v49 = 0;
  objc_storeStrong(&location, 0);
  return v49;
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id v5;
  uint64_t v6;
  char isKindOfClass;
  unsigned __int8 v8;
  BuddyAppleIDFlow *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  BuddyAppleIDFlow *v14;
  id v15;
  uint64_t v16;
  objc_super v17;
  objc_super v18;
  objc_super v19;
  char v20;
  Class v21;
  id location[2];
  BuddyAppleIDFlow *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = a4;
  v20 = 0;
  v5 = location[0];
  v6 = objc_opt_class(BuddyAppleIDHostController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);
  v8 = 0;
  if ((isKindOfClass & 1) != 0)
    v8 = objc_msgSend(location[0], "ranSilentUpdateProperties");
  v20 = v8 & 1;
  if (v21 || (v20 & 1) == 0)
  {
    v12 = location[0];
    v13 = objc_opt_class(BuddyAppleIDRepairController);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v14 = v23;
      v15 = location[0];
      v16 = objc_opt_class(BuddyCombinedTermsController);
      v18.receiver = v14;
      v18.super_class = (Class)BuddyAppleIDFlow;
      -[BuddyAppleIDFlow flowItemDone:nextItemClass:](&v18, "flowItemDone:nextItemClass:", v15, v16);
    }
    else
    {
      v17.receiver = v23;
      v17.super_class = (Class)BuddyAppleIDFlow;
      -[BuddyAppleIDFlow flowItemDone:nextItemClass:](&v17, "flowItemDone:nextItemClass:", location[0], v21);
    }
  }
  else
  {
    v9 = v23;
    v10 = location[0];
    v11 = objc_opt_class(BuddyCombinedTermsController);
    v19.receiver = v9;
    v19.super_class = (Class)BuddyAppleIDFlow;
    -[BuddyAppleIDFlow flowItemDone:nextItemClass:](&v19, "flowItemDone:nextItemClass:", v10, v11);
  }
  objc_storeStrong(location, 0);
}

+ (id)allowedFlowItems
{
  _QWORD v5[3];

  v5[0] = objc_opt_class(BuddyAppleIDHostController);
  v5[1] = objc_opt_class(BuddyAppleIDRepairController);
  v5[2] = objc_opt_class(BuddyCombinedTermsController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, a1);
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

- (void)_fetchRequiresTermsAcceptanceForAccount:(id)a3 completion:(id)a4
{
  id v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(NSObject *, void *, void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  if (location[0])
  {
    v5 = objc_msgSend(location[0], "aa_altDSID");
    v6 = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_100169DDC;
    v10 = &unk_100283B48;
    v11 = location[0];
    v12 = v13;
    +[SecureBackup getAcceptedTermsForAltDSID:reply:](SecureBackup, "getAcceptedTermsForAltDSID:reply:", v5, &v6);

    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v11, 0);
  }
  else if (v13)
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_startSilentEscrowRecordRepairIfNecessaryWithAccount:(id)a3 completion:(id)a4
{
  CDPAccount *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  os_log_t v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(NSObject *, char, id);
  void *v19;
  id v20;
  id v21;
  id v22;
  os_log_type_t v23;
  os_log_t v24;
  id v25;
  int v26;
  uint8_t buf[7];
  os_log_type_t v28;
  os_log_t oslog;
  id v30;
  id location[3];
  uint8_t v32[16];
  uint8_t v33[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v5 = +[CDPAccount sharedInstance](CDPAccount, "sharedInstance");
  v6 = -[CDPAccount primaryAccountNeedsEscrowRecordRepair](v5, "primaryAccountNeedsEscrowRecordRepair") ^ 1;

  if ((v6 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v7);
    v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = oslog;
      v9 = v28;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Skipping silent escrow record repair because it is not necessary", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v30)
      (*((void (**)(void))v30 + 2))();
    v26 = 1;
  }
  else
  {
    v10 = objc_msgSend(location[0], "aa_altDSID");
    v25 = +[CDPContext contextForAccountWithAltDSID:](CDPContext, "contextForAccountWithAltDSID:", v10);

    objc_msgSend(v25, "set_useSecureBackupCachedPassphrase:", 1);
    v11 = objc_msgSend(v25, "set_disableAsyncSecureBackupEnrollment:", 1);
    if (v25)
    {
      v24 = (os_log_t)(id)_BYLoggingFacility(v11);
      v23 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(v25, "altDSID");
        sub_100038C28((uint64_t)v33, (uint64_t)v12);
        _os_log_impl((void *)&_mh_execute_header, v24, v23, "Attempting to start silent escrow record repair for account with altDSID (%@)", v33, 0xCu);

      }
      objc_storeStrong((id *)&v24, 0);
      v13 = objc_alloc((Class)CDPStateController);
      v22 = objc_msgSend(v13, "initWithContext:", v25);
      v15 = _NSConcreteStackBlock;
      v16 = -1073741824;
      v17 = 0;
      v18 = sub_10016A3B0;
      v19 = &unk_1002831A0;
      v20 = v25;
      v21 = v30;
      objc_msgSend(v22, "startSilentEscrowRecordRepairWithCompletion:", &v15);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v22, 0);
    }
    else
    {
      v14 = (os_log_t)(id)_BYLoggingFacility(v11);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        sub_100038C28((uint64_t)v32, (uint64_t)location[0]);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CDPContext could not be created for account: %@", v32, 0xCu);
      }
      objc_storeStrong((id *)&v14, 0);
      if (v30)
        (*((void (**)(void))v30 + 2))();
    }
    objc_storeStrong(&v25, 0);
    v26 = 0;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)_determineAccountToRepair:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL8 v9;
  NSObject *v10;
  os_log_type_t v11;
  _WORD v12[3];
  os_log_type_t v13;
  os_log_t v14;
  uint8_t buf[7];
  os_log_type_t v16;
  os_log_t oslog;
  id v18;
  id location[2];
  BuddyAppleIDFlow *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  v18 = objc_msgSend(v3, "primaryAccount");

  if (v18)
  {
    v4 = objc_msgSend(v18, "aa_repairState");
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

    if (v5 == (id)1)
    {
      v9 = -[BuddyAppleIDFlow requiresTermsAcceptanceForPrimaryAccount](v20, "requiresTermsAcceptanceForPrimaryAccount");
      if (v9)
      {
        v14 = (os_log_t)(id)_BYLoggingFacility(v9);
        v13 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v14;
          v11 = v13;
          sub_100038C3C(v12);
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Primary Apple Account needs terms acceptance", (uint8_t *)v12, 2u);
        }
        objc_storeStrong((id *)&v14, 0);
        (*((void (**)(id, id, _QWORD))location[0] + 2))(location[0], v18, 0);
      }
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v6);
      v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = oslog;
        v8 = v16;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Primary Apple Account needs repair and will be used for update", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      (*((void (**)(id, id, uint64_t))location[0] + 2))(location[0], v18, 1);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))location[0] + 2))(location[0], 0, 0);
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (id)_accountToUpdate
{
  AKAccountManager *v2;
  id v3;

  v2 = +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance", a2, self);
  v3 = -[AKAccountManager accountEligibleForUpdate](v2, "accountEligibleForUpdate");

  return v3;
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

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BOOL)requiresTermsAcceptanceForPrimaryAccount
{
  return self->_requiresTermsAcceptanceForPrimaryAccount;
}

- (void)setRequiresTermsAcceptanceForPrimaryAccount:(BOOL)a3
{
  self->_requiresTermsAcceptanceForPrimaryAccount = a3;
}

- (NSString)existingAccountUsername
{
  return self->_existingAccountUsername;
}

- (void)setExistingAccountUsername:(id)a3
{
  self->_existingAccountUsername = (NSString *)a3;
}

- (unint64_t)existingAccountType
{
  return self->_existingAccountType;
}

- (void)setExistingAccountType:(unint64_t)a3
{
  self->_existingAccountType = a3;
}

- (ACAccount)accountToRepair
{
  return self->_accountToRepair;
}

- (void)setAccountToRepair:(id)a3
{
  objc_storeStrong((id *)&self->_accountToRepair, a3);
}

- (BOOL)performAuthKitRepair
{
  return self->_performAuthKitRepair;
}

- (void)setPerformAuthKitRepair:(BOOL)a3
{
  self->_performAuthKitRepair = a3;
}

- (ACAccount)accountForSecurityUpgrade
{
  return self->_accountForSecurityUpgrade;
}

- (void)setAccountForSecurityUpgrade:(id)a3
{
  objc_storeStrong((id *)&self->_accountForSecurityUpgrade, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountForSecurityUpgrade, 0);
  objc_storeStrong((id *)&self->_accountToRepair, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
}

@end
