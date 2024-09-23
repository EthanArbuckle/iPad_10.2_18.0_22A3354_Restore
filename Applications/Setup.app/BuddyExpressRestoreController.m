@implementation BuddyExpressRestoreController

- (void)viewWillAppear:(BOOL)a3
{
  BYPreferencesController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyExpressRestoreController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyExpressRestoreController;
  -[BuddyExpressRestoreController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyExpressWelcomeController buddyPreferences](v7, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("RestoreChoice"));

}

- (void)continueTapped
{
  void **v3;
  int v4;
  int v5;
  void (*v6)(uint64_t, char);
  void *v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100126B28;
  v7 = &unk_1002808D0;
  v8[0] = self;
  -[BuddyExpressRestoreController _presentNetworkWarning:](self, "_presentNetworkWarning:", &v3);
  objc_storeStrong(v8, 0);
}

- (void)customizeTapped
{
  BuddyPendingRestoreState *v2;
  BYAnalyticsExpressRestore *v3;
  NSObject *v4;
  objc_super v5;
  void **block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11[2];
  BuddyExpressRestoreController *v12;

  v12 = self;
  v11[1] = (id)a2;
  v2 = -[BuddyExpressWelcomeController pendingRestoreState](self, "pendingRestoreState");
  -[BuddyPendingRestoreState clearBackupItem](v2, "clearBackupItem");

  v3 = -[BuddyExpressRestoreController expressRestoreAnalytics](v12, "expressRestoreAnalytics");
  -[BYAnalyticsExpressRestore setRestoreChoice:](v3, "setRestoreChoice:", 3);

  v4 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_10012707C;
  v10 = &unk_100280730;
  v11[0] = v12;
  dispatch_async(v4, &block);

  v5.receiver = v12;
  v5.super_class = (Class)BuddyExpressRestoreController;
  -[BuddyExpressWelcomeController customizeTapped](&v5, "customizeTapped");
  objc_storeStrong(v11, 0);
}

- (void)createDataProvider:(id)a3
{
  BuddyExpressRestoreController *v3;
  objc_super v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *, void *);
  void *v9;
  id v10;
  id location[2];
  BuddyExpressRestoreController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100127194;
  v9 = &unk_100283338;
  v10 = location[0];
  v4.receiver = v3;
  v4.super_class = (Class)BuddyExpressRestoreController;
  -[BuddyExpressWelcomeController createDataProvider:](&v4, "createDataProvider:", &v5);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)createBackupDataSource:(id)a3
{
  RestorableBackupItem *v3;
  NSString *v4;
  BOOL v5;
  NSObject *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  BuddyExpressRestoreController *v12;
  id v13;
  int v14;
  id location[2];
  BuddyExpressRestoreController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[BuddyExpressRestoreController isAbleToBackupBeforeRestore](v16, "isAbleToBackupBeforeRestore")
    || (v3 = -[BuddyExpressRestoreController backupItem](v16, "backupItem"),
        v4 = -[RestorableBackupItem backupUDID](v3, "backupUDID"),
        v5 = v4 == 0,
        v4,
        v3,
        v5))
  {
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v14 = 1;
  }
  else
  {
    v6 = dispatch_get_global_queue(25, 0);
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_100127370;
    v11 = &unk_1002806E0;
    v12 = v16;
    v13 = location[0];
    dispatch_async(v6, &v7);

    objc_storeStrong(&v13, 0);
    objc_storeStrong((id *)&v12, 0);
    v14 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)createCloudDataSource:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)dataTransferMethod
{
  if (-[BuddyExpressRestoreController isAbleToBackupBeforeRestore](self, "isAbleToBackupBeforeRestore"))
    return 2;
  else
    return 1;
}

- (id)dateForChosenBackup
{
  RestorableBackupItem *v2;
  MBSnapshot *v3;
  id v4;

  v2 = -[BuddyExpressRestoreController backupItem](self, "backupItem", a2, self);
  v3 = -[RestorableBackupItem snapshot](v2, "snapshot");
  v4 = -[MBSnapshot date](v3, "date");

  return v4;
}

- (id)deviceNameForChosenBackup
{
  RestorableBackupItem *v2;
  MBSnapshot *v3;
  id v4;

  v2 = -[BuddyExpressRestoreController backupItem](self, "backupItem", a2, self);
  v3 = -[RestorableBackupItem snapshot](v2, "snapshot");
  v4 = -[MBSnapshot deviceName](v3, "deviceName");

  return v4;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  id v2;
  id v3;
  BOOL v4;
  BuddyMiscState *v5;
  BuddyTargetDeviceMigrationManager *v6;
  unsigned __int8 v7;
  ProximitySetupController *v8;
  ProximitySetupController *v9;
  unsigned __int8 v10;
  NSObject *v11;
  void **block;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  BuddyExpressRestoreController *v18;
  char v19;
  char v20;
  char v21;
  BOOL v22;
  objc_super v23;
  SEL v24;
  BuddyExpressRestoreController *v25;

  v25 = self;
  v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)BuddyExpressRestoreController;
  if (!-[BuddyExpressWelcomeController controllerNeedsToRun](&v23, "controllerNeedsToRun"))
    return 0;
  v2 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  v4 = v3 != 0;

  v22 = v4;
  v5 = -[BuddyExpressWelcomeController miscState](v25, "miscState");
  v6 = -[BuddyMiscState migrationManager](v5, "migrationManager");
  v7 = -[BuddyTargetDeviceMigrationManager willMigrate](v6, "willMigrate");

  v21 = v7 & 1;
  v8 = -[BuddyExpressRestoreController proximitySetupController](v25, "proximitySetupController");
  LOBYTE(v6) = -[ProximitySetupController skipExpressRestore](v8, "skipExpressRestore");

  v20 = v6 & 1;
  if ((v7 & 1) == 0 && (v20 & 1) == 0 && v22)
    return 1;
  v9 = -[BuddyExpressRestoreController proximitySetupController](v25, "proximitySetupController");
  v10 = -[ProximitySetupController hasConnection](v9, "hasConnection");

  v19 = v10 & 1;
  if ((v10 & 1) != 0 && (v21 & 1) == 0)
  {
    v11 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    v14 = -1073741824;
    v15 = 0;
    v16 = sub_100127888;
    v17 = &unk_100280730;
    v18 = v25;
    dispatch_async(v11, &block);

    objc_storeStrong((id *)&v18, 0);
  }
  return 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  BuddyExpressRestoreController *v9;
  id v10;
  id location[2];
  BuddyExpressRestoreController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001279C4;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_suggestedBackupToRestore:(id)a3
{
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  uint64_t v6;
  NSString *v7;
  NSObject *v8;
  os_log_type_t v9;
  ProximitySetupController *v10;
  SASProximityInformation *v11;
  id v12;
  uint64_t v13;
  ProximitySetupController *v14;
  SASProximityInformation *v15;
  id v16;
  id v17;
  NSString *v18;
  NSObject *v19;
  os_log_type_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  BuddyExpressRestoreController *v29;
  id v30;
  void **v31;
  int v32;
  int v33;
  void (*v34)(NSObject *, char);
  void *v35;
  id v36;
  id v37;
  id v38;
  uint8_t v39[7];
  os_log_type_t v40;
  os_log_t v41;
  os_log_type_t v42;
  os_log_t v43;
  uint8_t v44[7];
  os_log_type_t v45;
  os_log_t v46;
  char v47;
  id v48;
  char v49;
  id v50;
  os_log_type_t v51;
  os_log_t v52;
  os_log_type_t v53;
  os_log_t v54;
  id v55;
  id obj;
  id v57;
  id v58;
  uint8_t v59[7];
  os_log_type_t v60;
  os_log_t oslog;
  int v62;
  char v63;
  id v64;
  char v65;
  id v66;
  os_log_type_t v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[15];
  os_log_type_t v72;
  id v73;
  id v74;
  id v75;
  id location[2];
  BuddyExpressRestoreController *v77;
  uint8_t v78[16];
  uint8_t v79[16];
  uint8_t v80[16];
  uint8_t v81[24];

  v77 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v75 = 0;
  v74 = objc_alloc_init((Class)MBManager);
  v73 = (id)_BYLoggingFacility(v74);
  v72 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v73;
    v4 = v72;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetching backup list...", buf, 2u);
  }
  objc_storeStrong(&v73, 0);
  v69 = v75;
  v5 = +[BuddyBackupUtilities getBackupListWithFiltering:manager:retries:error:](BuddyBackupUtilities, "getBackupListWithFiltering:manager:retries:error:", 0, v74, 3, &v69);
  objc_storeStrong(&v75, v69);
  v70 = v5;
  if (v75)
  {
    v68 = (id)_BYLoggingFacility(v6);
    v67 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_ERROR))
    {
      v65 = 0;
      v63 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v7 = (NSString *)v75;
      }
      else if (v75)
      {
        v66 = objc_msgSend(v75, "domain");
        v65 = 1;
        v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v66, objc_msgSend(v75, "code"));
        v64 = v7;
        v63 = 1;
      }
      else
      {
        v7 = 0;
      }
      sub_100039500((uint64_t)v81, (uint64_t)v7);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v68, v67, "Failed to get backups: %{public}@", v81, 0xCu);
      if ((v63 & 1) != 0)

      if ((v65 & 1) != 0)
    }
    objc_storeStrong(&v68, 0);
    if (location[0])
      (*((void (**)(id, _QWORD, _QWORD))location[0] + 2))(location[0], 0, 0);
    v62 = 1;
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    v60 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = oslog;
      v9 = v60;
      sub_100038C3C(v59);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Searching for backup from source device...", v59, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v58 = (id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
    v10 = -[BuddyExpressRestoreController proximitySetupController](v77, "proximitySetupController");
    v11 = -[ProximitySetupController information](v10, "information");
    obj = v75;
    v12 = +[BuddyBackupUtilities suggestedBackupForProximity:deviceClass:withManager:error:](BuddyBackupUtilities, "suggestedBackupForProximity:deviceClass:withManager:error:", v11, v58, v74, &obj);
    objc_storeStrong(&v75, obj);
    v57 = v12;

    v55 = 0;
    if (v57)
    {
      v54 = (os_log_t)(id)_BYLoggingFacility(v13);
      v53 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        sub_100038C28((uint64_t)v80, (uint64_t)v57);
        _os_log_impl((void *)&_mh_execute_header, v54, v53, "Found backup from source device: %@", v80, 0xCu);
      }
      objc_storeStrong((id *)&v54, 0);
      v14 = -[BuddyExpressRestoreController proximitySetupController](v77, "proximitySetupController");
      v15 = -[ProximitySetupController information](v14, "information");
      v16 = -[SASProximityInformation deviceName](v15, "deviceName");
      v17 = v55;
      v55 = v16;

    }
    else
    {
      if (v75)
      {
        v52 = (os_log_t)(id)_BYLoggingFacility(v13);
        v51 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v49 = 0;
          v47 = 0;
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v18 = (NSString *)v75;
          }
          else if (v75)
          {
            v50 = objc_msgSend(v75, "domain");
            v49 = 1;
            v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v50, objc_msgSend(v75, "code"));
            v48 = v18;
            v47 = 1;
          }
          else
          {
            v18 = 0;
          }
          sub_100039500((uint64_t)v79, (uint64_t)v18);
          _os_log_error_impl((void *)&_mh_execute_header, v52, v51, "Failed to find backup from proximity: %{public}@", v79, 0xCu);
          if ((v47 & 1) != 0)

          if ((v49 & 1) != 0)
        }
        objc_storeStrong((id *)&v52, 0);
      }
      v46 = (os_log_t)(id)_BYLoggingFacility(v13);
      v45 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v46;
        v20 = v45;
        sub_100038C3C(v44);
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Searching for latest backup for current device...", v44, 2u);
      }
      objc_storeStrong((id *)&v46, 0);
      v21 = +[BuddyBackupUtilities suggestedBackupForCurrentDeviceWithBackups:](BuddyBackupUtilities, "suggestedBackupForCurrentDeviceWithBackups:", v70);
      v22 = v57;
      v57 = v21;

      v23 = objc_msgSend(v57, "snapshot");
      v24 = objc_msgSend(v23, "deviceName");
      v25 = v55;
      v55 = v24;

      if (v57)
      {
        v43 = (os_log_t)(id)_BYLoggingFacility(v26);
        v42 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          sub_100038C28((uint64_t)v78, (uint64_t)v57);
          _os_log_impl((void *)&_mh_execute_header, v43, v42, "Found backup: %@", v78, 0xCu);
        }
        objc_storeStrong((id *)&v43, 0);
      }
      else
      {
        v41 = (os_log_t)(id)_BYLoggingFacility(v26);
        v40 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v41;
          v28 = v40;
          sub_100038C3C(v39);
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "No appropriate backups found", v39, 2u);
        }
        objc_storeStrong((id *)&v41, 0);
      }
    }
    if (v57)
    {
      v29 = v77;
      v30 = v57;
      v31 = _NSConcreteStackBlock;
      v32 = -1073741824;
      v33 = 0;
      v34 = sub_100128848;
      v35 = &unk_100283388;
      v38 = location[0];
      v36 = v57;
      v37 = v55;
      -[BuddyExpressRestoreController _validateBackupIsCompatible:completion:](v29, "_validateBackupIsCompatible:completion:", v30, &v31);
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v38, 0);
      v62 = 0;
    }
    else
    {
      if (location[0])
        (*((void (**)(id, _QWORD, _QWORD))location[0] + 2))(location[0], 0, 0);
      v62 = 1;
    }
    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v57, 0);
    objc_storeStrong(&v58, 0);
  }
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong(location, 0);
}

- (void)_validateBackupIsCompatible:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  BYSoftwareUpdateCache *v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(NSObject *, void *, void *, void *);
  void *v13;
  BuddyExpressRestoreController *v14;
  id v15;
  id v16;
  uint8_t buf[15];
  os_log_type_t v18;
  os_log_t oslog;
  int v20;
  id v21;
  id location[2];
  BuddyExpressRestoreController *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  if (v21)
  {
    if (location[0])
    {
      v5 = objc_msgSend(location[0], "isCompatible");
      if ((v5 & 1) != 0)
      {
        (*((void (**)(id, uint64_t))v21 + 2))(v21, 1);
        v20 = 1;
      }
      else
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v5);
        v18 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v6 = oslog;
          v7 = v18;
          sub_100038C3C(buf);
          _os_log_impl((void *)&_mh_execute_header, v6, v7, "Backup is not compatible, checking to see if a Software Update is available...", buf, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        v8 = -[BuddyExpressRestoreController softwareUpdateCache](v23, "softwareUpdateCache");
        v9 = _NSConcreteStackBlock;
        v10 = -1073741824;
        v11 = 0;
        v12 = sub_100128B3C;
        v13 = &unk_100281A18;
        v14 = v23;
        v15 = location[0];
        v16 = v21;
        -[BYSoftwareUpdateCache scanUsingCache:withCompletion:](v8, "scanUsingCache:withCompletion:", 1, &v9);

        objc_storeStrong(&v16, 0);
        objc_storeStrong(&v15, 0);
        objc_storeStrong((id *)&v14, 0);
        v20 = 0;
      }
    }
    else
    {
      (*((void (**)(id, _QWORD))v21 + 2))(v21, 0);
      v20 = 1;
    }
  }
  else
  {
    v20 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_ableToBackupBeforeRestore:(id)a3 softwareUpdateRequired:(BOOL *)a4
{
  id v5;
  unsigned __int8 v6;
  ProximitySetupController *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL8 v12;
  NSObject *v13;
  os_log_type_t v14;
  ProximitySetupController *v15;
  SASProximityInformation *v16;
  unsigned __int8 v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  ProximitySetupController *v21;
  SASProximityInformation *v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  ProximitySetupController *v27;
  SASProximityInformation *v28;
  ProximitySetupController *v29;
  SASProximityInformation *v30;
  ProximitySetupController *v31;
  SASProximityInformation *v32;
  id v33;
  unsigned __int8 v34;
  NSObject *v35;
  os_log_type_t v36;
  id v37;
  id v38;
  id v39;
  BOOL v40;
  uint64_t v41;
  id v42;
  id v43;
  ProximitySetupController *v44;
  SASProximityInformation *v45;
  UIDevice *v46;
  BYSoftwareUpdateCache *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  id v51;
  char v52;
  uint64_t v53;
  id v54;
  os_log_t v56;
  uint8_t v57[15];
  os_log_type_t v58;
  os_log_t v59;
  id v60;
  id v61;
  id v62;
  os_log_type_t v63;
  os_log_t v64;
  BOOL v65;
  id v66;
  id v67;
  id v68;
  uint8_t v69[7];
  os_log_type_t v70;
  os_log_t oslog;
  char v72;
  id v73;
  id v74;
  id v75;
  uint8_t v76[7];
  os_log_type_t v77;
  id v78;
  uint8_t v79[7];
  os_log_type_t v80;
  id v81;
  uint8_t v82[7];
  os_log_type_t v83;
  id v84;
  uint8_t buf[7];
  os_log_type_t v86;
  id v87;
  int v88;
  BOOL *v89;
  id location[2];
  BuddyExpressRestoreController *v91;
  char v92;
  uint8_t v93[32];
  uint8_t v94[24];

  v91 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v89 = a4;
  v5 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("AlwaysAttemptBackupAndRestore"));

  if ((v6 & 1) != 0)
  {
    v92 = 1;
    v88 = 1;
  }
  else
  {
    v7 = -[BuddyExpressRestoreController proximitySetupController](v91, "proximitySetupController");
    v8 = -[ProximitySetupController hasConnection](v7, "hasConnection");

    if (v8)
    {
      v12 = -[BuddyExpressRestoreController _isBackupFromProximityDevice:](v91, "_isBackupFromProximityDevice:", location[0]);
      if (v12)
      {
        v15 = -[BuddyExpressRestoreController proximitySetupController](v91, "proximitySetupController");
        v16 = -[ProximitySetupController information](v15, "information");
        v17 = -[SASProximityInformation isRestoring](v16, "isRestoring");

        if ((v17 & 1) != 0)
        {
          v81 = (id)_BYLoggingFacility(v18);
          v80 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_DEFAULT))
          {
            v19 = v81;
            v20 = v80;
            sub_100038C3C(v79);
            _os_log_impl((void *)&_mh_execute_header, v19, v20, "Not offering Guide User to Backup as source device is restoring", v79, 2u);
          }
          objc_storeStrong(&v81, 0);
          v92 = 0;
          v88 = 1;
        }
        else
        {
          v21 = -[BuddyExpressRestoreController proximitySetupController](v91, "proximitySetupController");
          v22 = -[ProximitySetupController information](v21, "information");
          v23 = -[SASProximityInformation isBackupEnabled](v22, "isBackupEnabled") ^ 1;

          if ((v23 & 1) != 0)
          {
            v78 = (id)_BYLoggingFacility(v24);
            v77 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_DEFAULT))
            {
              v25 = v78;
              v26 = v77;
              sub_100038C3C(v76);
              _os_log_impl((void *)&_mh_execute_header, v25, v26, "Not offering Guide User to Backup as source device has backup disabled", v76, 2u);
            }
            objc_storeStrong(&v78, 0);
            v92 = 0;
            v88 = 1;
          }
          else
          {
            v27 = -[BuddyExpressRestoreController proximitySetupController](v91, "proximitySetupController");
            v28 = -[ProximitySetupController information](v27, "information");
            v75 = -[SASProximityInformation connectedToWiFi](v28, "connectedToWiFi");

            v29 = -[BuddyExpressRestoreController proximitySetupController](v91, "proximitySetupController");
            v30 = -[ProximitySetupController information](v29, "information");
            v74 = -[SASProximityInformation supportsCellularBackup](v30, "supportsCellularBackup");

            v31 = -[BuddyExpressRestoreController proximitySetupController](v91, "proximitySetupController");
            v32 = -[ProximitySetupController information](v31, "information");
            v73 = -[SASProximityInformation hasInexpensiveCellularNetwork](v32, "hasInexpensiveCellularNetwork");

            v72 = 0;
            v33 = 0;
            if (v75)
              v33 = objc_msgSend(v75, "BOOLValue");
            v72 = v33 & 1;
            if ((v33 & 1) == 0)
            {
              v34 = objc_msgSend(v74, "BOOLValue");
              v33 = 0;
              if ((v34 & 1) != 0)
                v33 = objc_msgSend(v73, "BOOLValue");
              v72 = v33 & 1;
            }
            if ((v72 & 1) != 0)
            {
              v68 = +[NSCalendar currentCalendar](NSCalendar, "currentCalendar");
              v67 = objc_alloc_init((Class)NSDateComponents);
              v66 = +[NSDate date](NSDate, "date");
              objc_msgSend(v67, "setMonth:", -1);
              v37 = objc_msgSend(location[0], "snapshot");
              v38 = objc_msgSend(v37, "date");
              v39 = objc_msgSend(v68, "dateByAddingComponents:toDate:options:", v67, v66, 0);
              v40 = objc_msgSend(v38, "compare:", v39) == (id)1;

              v65 = v40;
              if (v40)
              {
                v44 = -[BuddyExpressRestoreController proximitySetupController](v91, "proximitySetupController");
                v45 = -[ProximitySetupController information](v44, "information");
                v62 = -[SASProximityInformation productVersion](v45, "productVersion");

                v46 = +[UIDevice currentDevice](UIDevice, "currentDevice");
                v61 = -[UIDevice systemVersion](v46, "systemVersion");

                if (+[BuddyBackupUtilities canRestoreBackupMadeOnVersion:toSystemVersion:](BuddyBackupUtilities, "canRestoreBackupMadeOnVersion:toSystemVersion:", v62, v61))
                {
                  goto LABEL_46;
                }
                v47 = -[BuddyExpressRestoreController softwareUpdateCache](v91, "softwareUpdateCache");
                v60 = -[BYSoftwareUpdateCache latestUpdate](v47, "latestUpdate");

                if (v60)
                {
                  v51 = objc_msgSend(v60, "productVersion");
                  v52 = !+[BuddyBackupUtilities canRestoreBackupMadeOnVersion:toSystemVersion:](BuddyBackupUtilities, "canRestoreBackupMadeOnVersion:toSystemVersion:", v62, v51);

                  if ((v52 & 1) != 0)
                  {
                    v56 = (os_log_t)(id)_BYLoggingFacility(v53);
                    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                    {
                      v54 = objc_msgSend(v60, "productVersion");
                      sub_10003EB04((uint64_t)v93, (uint64_t)v62, (uint64_t)v54);
                      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Not offering Guide User to Backup as source device is on a newer version of iOS that this device cannot update to (%@ vs %@)", v93, 0x16u);

                    }
                    objc_storeStrong((id *)&v56, 0);
                    v92 = 0;
                    v88 = 1;
                  }
                  else
                  {
                    if (v89)
                      *v89 = 1;
                    v88 = 0;
                  }
                }
                else
                {
                  v59 = (os_log_t)(id)_BYLoggingFacility(v48);
                  v58 = OS_LOG_TYPE_DEFAULT;
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    v49 = v59;
                    v50 = v58;
                    sub_100038C3C(v57);
                    _os_log_impl((void *)&_mh_execute_header, v49, v50, "Not offering Guide User to Backup as source device is on a newer version of iOS that this device cannot update to (no update found)", v57, 2u);
                  }
                  objc_storeStrong((id *)&v59, 0);
                  v92 = 0;
                  v88 = 1;
                }
                objc_storeStrong(&v60, 0);
                if (!v88)
                {
LABEL_46:
                  v92 = 1;
                  v88 = 1;
                }
                objc_storeStrong(&v61, 0);
                objc_storeStrong(&v62, 0);
              }
              else
              {
                v64 = (os_log_t)(id)_BYLoggingFacility(v41);
                v63 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = objc_msgSend(location[0], "snapshot");
                  v43 = objc_msgSend(v42, "date");
                  sub_100038C28((uint64_t)v94, (uint64_t)v43);
                  _os_log_impl((void *)&_mh_execute_header, v64, v63, "Not offering Guide User to Backup as backup is not new enough (created on %@)", v94, 0xCu);

                }
                objc_storeStrong((id *)&v64, 0);
                v92 = 0;
                v88 = 1;
              }
              objc_storeStrong(&v66, 0);
              objc_storeStrong(&v67, 0);
              objc_storeStrong(&v68, 0);
            }
            else
            {
              oslog = (os_log_t)(id)_BYLoggingFacility(v33);
              v70 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                v35 = oslog;
                v36 = v70;
                sub_100038C3C(v69);
                _os_log_impl((void *)&_mh_execute_header, v35, v36, "Not offering Guide User to Backup as source device is not connected to Wi-Fi or an inexpensive cellular network", v69, 2u);
              }
              objc_storeStrong((id *)&oslog, 0);
              v92 = 0;
              v88 = 1;
            }
            objc_storeStrong(&v73, 0);
            objc_storeStrong(&v74, 0);
            objc_storeStrong(&v75, 0);
          }
        }
      }
      else
      {
        v84 = (id)_BYLoggingFacility(v12);
        v83 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v84, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v84;
          v14 = v83;
          sub_100038C3C(v82);
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "Not offering Guide User to Backup as chosen backup is not for source device", v82, 2u);
        }
        objc_storeStrong(&v84, 0);
        v92 = 0;
        v88 = 1;
      }
    }
    else
    {
      v87 = (id)_BYLoggingFacility(v9);
      v86 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v87, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v87;
        v11 = v86;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Not offering Guide User to Backup as no connection to source device", buf, 2u);
      }
      objc_storeStrong(&v87, 0);
      v92 = 0;
      v88 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v92 & 1;
}

- (BOOL)_isBackupFromProximityDevice:(id)a3
{
  ProximitySetupController *v3;
  SASProximityInformation *v4;
  id v5;
  id v6;
  unsigned __int8 v7;
  id v9;
  id location[2];
  BuddyExpressRestoreController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyExpressRestoreController proximitySetupController](v11, "proximitySetupController");
  v4 = -[ProximitySetupController information](v3, "information");
  v9 = -[SASProximityInformation backupUUID](v4, "backupUUID");

  v5 = objc_msgSend(location[0], "backup");
  v6 = objc_msgSend(v5, "backupUUID");
  v7 = objc_msgSend(v6, "isEqualToString:", v9);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (void)_presentNetworkWarning:(id)a3
{
  BuddyNetworkProvider *v3;
  RestorableBackupItem *v4;
  MBSnapshot *v5;
  id v6;
  id v7;
  void **v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  int v13;
  id v14;
  id location[2];
  BuddyExpressRestoreController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyExpressRestoreController networkProvider](v16, "networkProvider");
  v4 = -[BuddyExpressRestoreController backupItem](v16, "backupItem");
  v5 = -[RestorableBackupItem snapshot](v4, "snapshot");
  v14 = +[BuddyRestoreNetworkAlertController alertControllerForNetworkConnectionWithProvider:estimatedRestoreSize:](BuddyRestoreNetworkAlertController, "alertControllerForNetworkConnectionWithProvider:estimatedRestoreSize:", v3, -[MBSnapshot estimatedRestoreSize](v5, "estimatedRestoreSize"));

  if (v14)
  {
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_100129BE4;
    v11 = &unk_100280780;
    v12 = location[0];
    objc_msgSend(v14, "setRestoreOverCellular:", &v8);
    v6 = -[BuddyExpressRestoreController showModalWiFiSettingsBlock](v16, "showModalWiFiSettingsBlock", v8, v9, v10, v11);
    objc_msgSend(v14, "setPresentWiFiSettings:", v6);

    v7 = -[BuddyExpressRestoreController navigationController](v16, "navigationController");
    objc_msgSend(v7, "presentViewController:animated:completion:", v14, 1, 0);

    objc_storeStrong(&v12, 0);
    v13 = 0;
  }
  else
  {
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v13 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->networkProvider, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->proximitySetupController, a3);
}

- (id)showModalWiFiSettingsBlock
{
  return self->showModalWiFiSettingsBlock;
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BuddyBetaEnrollmentStateManager)betaEnrollmentStateManager
{
  return self->betaEnrollmentStateManager;
}

- (void)setBetaEnrollmentStateManager:(id)a3
{
  objc_storeStrong((id *)&self->betaEnrollmentStateManager, a3);
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
  objc_storeStrong((id *)&self->softwareUpdateCache, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->analyticsManager, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (RestorableBackupItem)backupItem
{
  return self->_backupItem;
}

- (void)setBackupItem:(id)a3
{
  objc_storeStrong((id *)&self->_backupItem, a3);
}

- (BOOL)isAbleToBackupBeforeRestore
{
  return self->_ableToBackupBeforeRestore;
}

- (void)setAbleToBackupBeforeRestore:(BOOL)a3
{
  self->_ableToBackupBeforeRestore = a3;
}

- (BOOL)forceSoftwareUpdateRequiredForNewBackup
{
  return self->_forceSoftwareUpdateRequiredForNewBackup;
}

- (void)setForceSoftwareUpdateRequiredForNewBackup:(BOOL)a3
{
  self->_forceSoftwareUpdateRequiredForNewBackup = a3;
}

- (BYAnalyticsExpressRestore)expressRestoreAnalytics
{
  return self->_expressRestoreAnalytics;
}

- (void)setExpressRestoreAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_expressRestoreAnalytics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressRestoreAnalytics, 0);
  objc_storeStrong((id *)&self->_backupItem, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->analyticsManager, 0);
  objc_storeStrong((id *)&self->softwareUpdateCache, 0);
  objc_storeStrong((id *)&self->betaEnrollmentStateManager, 0);
  objc_storeStrong(&self->showModalWiFiSettingsBlock, 0);
  objc_storeStrong((id *)&self->proximitySetupController, 0);
  objc_storeStrong((id *)&self->networkProvider, 0);
}

@end
