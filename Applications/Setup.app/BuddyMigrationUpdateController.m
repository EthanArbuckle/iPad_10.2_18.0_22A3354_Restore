@implementation BuddyMigrationUpdateController

- (BuddyMigrationUpdateController)init
{
  BuddyMigrationUpdateController *v2;
  BuddyMigrationUpdateController *v3;
  objc_super v5;
  SEL v6;
  id location;

  v6 = a2;
  location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyMigrationUpdateController;
  v2 = -[BuddySoftwareUpdateController init](&v5, "init");
  location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
    objc_msgSend(location, "setSoftwareUpdateDelegate:", location);
  v3 = (BuddyMigrationUpdateController *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyMigrationUpdateController *v9;
  id location;
  objc_super v11;
  BOOL v12;
  SEL v13;
  BuddyMigrationUpdateController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BuddyMigrationUpdateController;
  -[BuddySoftwareUpdateController viewDidAppear:](&v11, "viewDidAppear:", a3);
  if (!-[BuddyMigrationUpdateController ableToMigrateWithUpdate](v14, "ableToMigrateWithUpdate"))
  {
    v4 = _NSConcreteStackBlock;
    v5 = -1073741824;
    v6 = 0;
    v7 = sub_10007BFC4;
    v8 = &unk_100280730;
    v9 = v14;
    location = +[BuddyRestoreHelpers alertForBackupError:okButtonAction:](BuddyRestoreHelpers, "alertForBackupError:okButtonAction:", 0, &v4);
    v3 = -[BuddyMigrationUpdateController navigationController](v14, "navigationController");
    objc_msgSend(v3, "presentViewController:animated:completion:", location, 1, 0);

    objc_storeStrong(&location, 0);
    objc_storeStrong((id *)&v9, 0);
  }
}

- (void)_prepareForSoftwareUpdateToBuild:(id)a3 completion:(id)a4
{
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  BuddyMigrationState *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  id v12;
  BYPreferencesController *v13;
  BYPreferencesController *v14;
  BFFSettingsManager *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  ProximitySetupController *v19;
  void **v20;
  int v21;
  int v22;
  void (*v23)(id *);
  void *v24;
  id v25;
  uint8_t v26[7];
  os_log_type_t v27;
  os_log_t v28;
  os_log_type_t v29;
  os_log_t v30;
  uint8_t v31[15];
  os_log_type_t v32;
  os_log_t oslog;
  id v34;
  os_log_type_t v35;
  id v36;
  id v37;
  id location[2];
  BuddyMigrationUpdateController *v39;
  uint8_t v40[16];
  uint8_t buf[24];

  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v36 = (id)_BYLoggingFacility(v5);
  v35 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v36, v35, "Preparing to install update to build %@...", buf, 0xCu);
  }
  objc_storeStrong(&v36, 0);
  v6 = -[BuddyMigrationUpdateController willPerformSoftwareUpdateBlock](v39, "willPerformSoftwareUpdateBlock");

  if (v6)
  {
    v7 = (void (**)(_QWORD))-[BuddyMigrationUpdateController willPerformSoftwareUpdateBlock](v39, "willPerformSoftwareUpdateBlock");
    v7[2](v7);

  }
  v8 = [BuddyMigrationState alloc];
  v34 = -[BuddyMigrationState initWithProductBuild:intent:](v8, "initWithProductBuild:intent:", location[0], 0);
  oslog = (os_log_t)(id)_BYLoggingFacility(v34);
  v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = oslog;
    v10 = v32;
    sub_100038C3C(v31);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Persisting migration state to disk...", v31, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v30 = (os_log_t)(id)_BYLoggingFacility(v11);
  v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)v40, (uint64_t)v34);
    _os_log_impl((void *)&_mh_execute_header, v30, v29, "%@", v40, 0xCu);
  }
  objc_storeStrong((id *)&v30, 0);
  v12 = v34;
  v13 = -[BuddyMigrationUpdateController buddyPreferencesExcludedFromBackup](v39, "buddyPreferencesExcludedFromBackup");
  objc_msgSend(v12, "persistUsingPreferences:", v13);

  v14 = -[BuddyMigrationUpdateController buddyPreferences](v39, "buddyPreferences");
  -[BYPreferencesController persist](v14, "persist");

  v15 = -[BuddyMigrationUpdateController settingsManager](v39, "settingsManager");
  -[BFFSettingsManager hideStashInSafeHavenAsProvisional:](v15, "hideStashInSafeHavenAsProvisional:", 1);

  v28 = (os_log_t)(id)_BYLoggingFacility(v16);
  v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v28;
    v18 = v27;
    sub_100038C3C(v26);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Suspending proximity connection...", v26, 2u);
  }
  objc_storeStrong((id *)&v28, 0);
  v19 = -[BuddyMigrationUpdateController proximitySetupController](v39, "proximitySetupController");
  v20 = _NSConcreteStackBlock;
  v21 = -1073741824;
  v22 = 0;
  v23 = sub_10007C3DC;
  v24 = &unk_100280780;
  v25 = v37;
  -[ProximitySetupController suspendConnectionForSoftwareUpdate:](v19, "suspendConnectionForSoftwareUpdate:", &v20);

  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyMiscState *v3;
  BuddyTargetDeviceMigrationManager *v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  BuddyMiscState *v10;
  BuddyTargetDeviceMigrationManager *v11;
  unsigned __int8 v12;
  ProximitySetupController *v13;
  SUDescriptor *v14;
  id v15;
  BOOL v16;
  SUDescriptor *v17;
  id v18;
  unsigned __int8 v19;
  BuddyMigrationUpdateController *v20;
  void **v21;
  int v22;
  int v23;
  void (*v24)(NSObject *, void *);
  void *v25;
  BuddyMigrationUpdateController *v26;
  id v27;
  id v28;
  void **v29;
  int v30;
  int v31;
  void (*v32);
  void *v33;
  id v34;
  id v35;
  id v36;
  int v37;
  char v38;
  uint8_t buf[7];
  os_log_type_t v40;
  id v41;
  char v42;
  id location[2];
  BuddyMigrationUpdateController *v44;

  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationUpdateController miscState](v44, "miscState");
  v4 = -[BuddyMiscState migrationManager](v3, "migrationManager");
  v5 = -[BuddyTargetDeviceMigrationManager forceUpdateToMigrate](v4, "forceUpdateToMigrate");

  v42 = v5 & 1;
  if ((v5 & 1) != 0)
  {
    v41 = (id)_BYLoggingFacility(v6);
    v40 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v41;
      v8 = v40;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Forcing software update for migration...", buf, 2u);
    }
    objc_storeStrong(&v41, 0);
    v9 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
    objc_msgSend(v9, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("RequireSoftwareUpdateForMigration"));

  }
  v10 = -[BuddyMigrationUpdateController miscState](v44, "miscState");
  v11 = -[BuddyMiscState migrationManager](v10, "migrationManager");
  v12 = -[BuddyTargetDeviceMigrationManager requiresUpdateToMigrate](v11, "requiresUpdateToMigrate");

  v38 = v12 & 1;
  if ((v12 & 1) != 0 || (v42 & 1) != 0)
  {
    v13 = -[BuddyMigrationUpdateController proximitySetupController](v44, "proximitySetupController");
    v36 = -[ProximitySetupController productVersion](v13, "productVersion");

    v14 = -[BuddySoftwareUpdateController update](v44, "update");
    v15 = -[SUDescriptor productBuildVersion](v14, "productBuildVersion");
    v16 = +[SASSystemInformation compareProductVersion:toProductVersion:](SASSystemInformation, "compareProductVersion:toProductVersion:", v36, v15) != (id)1;
    -[BuddyMigrationUpdateController setAbleToMigrateWithUpdate:](v44, "setAbleToMigrateWithUpdate:", v16);

    if ((v42 & 1) != 0)
    {
      v17 = -[BuddySoftwareUpdateController update](v44, "update");
      -[BuddyMigrationUpdateController setAbleToMigrateWithUpdate:](v44, "setAbleToMigrateWithUpdate:", v17 != 0);

    }
    v18 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
    v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("FakeSoftwareUpdate"));

    if ((v19 & 1) != 0)
    {
      -[BuddyMigrationUpdateController _prepareForSoftwareUpdateToBuild:completion:](v44, "_prepareForSoftwareUpdateToBuild:completion:", CFSTR("1A1"), &stru_100281868);
      v37 = 1;
    }
    else
    {
      v29 = _NSConcreteStackBlock;
      v30 = -1073741824;
      v31 = 0;
      v32 = sub_10007CA40;
      v33 = &unk_100280780;
      v34 = location[0];
      v35 = objc_retainBlock(&v29);
      if (-[BuddySoftwareUpdateController scannedForUpdate](v44, "scannedForUpdate")
        && -[BuddyMigrationUpdateController ableToMigrateWithUpdate](v44, "ableToMigrateWithUpdate"))
      {
        (*((void (**)(void))v35 + 2))();
        v37 = 1;
      }
      else
      {
        v20 = v44;
        v21 = _NSConcreteStackBlock;
        v22 = -1073741824;
        v23 = 0;
        v24 = sub_10007CD58;
        v25 = &unk_100281890;
        v26 = v44;
        v27 = v36;
        v28 = v35;
        -[BuddySoftwareUpdateController scanForUpdateCompletion:](v20, "scanForUpdateCompletion:", &v21);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v27, 0);
        objc_storeStrong((id *)&v26, 0);
        v37 = 0;
      }
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v34, 0);
    }
    objc_storeStrong(&v36, 0);
  }
  else
  {
    if (location[0])
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v37 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)softwareUpdateController:(id)a3 prepareToInstallUpdate:(id)a4 completion:(id)a5
{
  BuddyMigrationUpdateController *v7;
  id v8;
  id v9;
  id v10;
  id location[2];
  BuddyMigrationUpdateController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  v7 = v12;
  v8 = objc_msgSend(v10, "productBuildVersion");
  -[BuddyMigrationUpdateController _prepareForSoftwareUpdateToBuild:completion:](v7, "_prepareForSoftwareUpdateToBuild:completion:", v8, v9);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)softwareUpdateController:(id)a3 didStartInstallForUpdate:(id)a4
{
  BYPreferencesController *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BuddyMigrationUpdateController *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _WORD v13[3];
  char v14;
  os_log_t v15;
  uint8_t buf[7];
  os_log_type_t v17;
  os_log_t oslog;
  id v19;
  id location[2];
  BuddyMigrationUpdateController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v5 = -[BuddyMigrationUpdateController buddyPreferencesExcludedFromBackup](v21, "buddyPreferencesExcludedFromBackup");
  LOBYTE(a4) = !+[BuddyMigrationState hasStateFromPreferences:](BuddyMigrationState, "hasStateFromPreferences:", v5);

  if ((a4 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = oslog;
      v8 = v17;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Software update for migration did begin!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v9 = v21;
    v10 = objc_msgSend(v19, "productBuildVersion");
    -[BuddyMigrationUpdateController _prepareForSoftwareUpdateToBuild:completion:](v9, "_prepareForSoftwareUpdateToBuild:completion:", v10, 0);

  }
  else
  {
    v15 = (os_log_t)(id)_BYLoggingFacility(v6);
    v14 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v11 = v15;
      v12 = v14;
      sub_100038C3C(v13);
      _os_log_error_impl((void *)&_mh_execute_header, v11, v12, "Software update for migration did begin with migration state on disk!", (uint8_t *)v13, 2u);
    }
    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)softwareUpdateController:(id)a3 didFailToInstallUpdateWithError:(id)a4
{
  uint64_t v5;
  NSString *v6;
  BYPreferencesController *v7;
  char v8;
  NSString *v9;
  char v10;
  id v11;
  os_log_t oslog;
  id v13;
  id location[2];
  BuddyMigrationUpdateController *v15;
  uint8_t buf[24];

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    v10 = 0;
    v8 = 0;
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v6 = (NSString *)v13;
    }
    else if (v13)
    {
      v11 = objc_msgSend(v13, "domain");
      v10 = 1;
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v11, objc_msgSend(v13, "code"));
      v9 = v6;
      v8 = 1;
    }
    else
    {
      v6 = 0;
    }
    sub_100039500((uint64_t)buf, (uint64_t)v6);
    _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Software update failed, cancelling iCloud Restore launch: %{public}@", buf, 0xCu);
    if ((v8 & 1) != 0)

    if ((v10 & 1) != 0)
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = -[BuddyMigrationUpdateController buddyPreferencesExcludedFromBackup](v15, "buddyPreferencesExcludedFromBackup");
  +[BuddyMigrationState removeFromPreferences:](BuddyMigrationState, "removeFromPreferences:", v7);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (ProximitySetupController)proximitySetupController
{
  return self->proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->proximitySetupController, a3);
}

- (BuddyMiscState)miscState
{
  return self->miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->miscState, a3);
}

- (id)willPerformSoftwareUpdateBlock
{
  return self->willPerformSoftwareUpdateBlock;
}

- (void)setWillPerformSoftwareUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BFFSettingsManager)settingsManager
{
  return self->settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->settingsManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->buddyPreferences, a3);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->buddyPreferencesExcludedFromBackup, a3);
}

- (BOOL)ableToMigrateWithUpdate
{
  return self->_ableToMigrateWithUpdate;
}

- (void)setAbleToMigrateWithUpdate:(BOOL)a3
{
  self->_ableToMigrateWithUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->buddyPreferences, 0);
  objc_storeStrong((id *)&self->settingsManager, 0);
  objc_storeStrong(&self->willPerformSoftwareUpdateBlock, 0);
  objc_storeStrong((id *)&self->miscState, 0);
  objc_storeStrong((id *)&self->proximitySetupController, 0);
}

@end
