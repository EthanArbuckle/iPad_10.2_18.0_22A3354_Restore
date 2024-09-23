@implementation BuddySoftwareUpdateRestoreFlow

- (BuddySoftwareUpdateRestoreFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  BuddySoftwareUpdateRestoreFlow *v10;
  NSArray *v11;
  BuddySoftwareUpdateRestoreFlow *v12;
  objc_super v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  id v19;
  _QWORD v20[4];

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v15 = 0;
  objc_storeStrong(&v15, a6);
  v9 = v19;
  v19 = 0;
  v14.receiver = v9;
  v14.super_class = (Class)BuddySoftwareUpdateRestoreFlow;
  v10 = -[BuddyRestoreFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v14, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v17, v16, v15);
  v19 = v10;
  objc_storeStrong(&v19, v10);
  if (v10)
  {
    v20[0] = objc_opt_class(BuddyRestoreSilentRenewController);
    v20[1] = objc_opt_class(BuddyRestoreRenewController);
    v20[2] = objc_opt_class(BuddyRestoreStoreRenewController);
    v20[3] = objc_opt_class(BackupRestoreProgressController);
    v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4);
    objc_msgSend(v19, "setClassList:", v11);

  }
  v12 = (BuddySoftwareUpdateRestoreFlow *)v19;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v19, 0);
  return v12;
}

- (id)precedingItemsClasses
{
  _QWORD v5[3];

  v5[0] = objc_opt_class(BuddyWiFiController);
  v5[1] = objc_opt_class(DeviceRestoreChoiceController);
  v5[2] = objc_opt_class(RestoreFromBackupController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, self);
}

- (void)startFlowAnimated:(BOOL)a3
{
  BYSeedProgramManager *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BFFSettingsManager *v7;
  NSObject *v8;
  os_log_type_t v9;
  objc_super v10;
  uint8_t v11[7];
  char v12;
  os_log_t v13;
  uint8_t buf[15];
  char v15;
  os_log_t oslog;
  id location;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  SEL v22;
  BuddySoftwareUpdateRestoreFlow *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v3 = -[BuddySoftwareUpdateRestoreFlow seedProgramManager](self, "seedProgramManager");
  v20 = -[BYSeedProgramManager currentEnrollmentMetadata](v3, "currentEnrollmentMetadata");

  v19 = objc_msgSend(v20, "bySeedProgramManager_valueForProgramKey");
  v18 = objc_msgSend(v20, "bySeedProgramManager_valueForAssetAudienceKey");
  v4 = objc_msgSend(v20, "bySeedProgramManager_valueForProgramIDKey");
  location = v4;
  if (v19 && v18)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    v15 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v5 = oslog;
      v6 = v15;
      sub_100038C3C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v5, v6, "Beta Re-Enroll: Post-software update stashing enrollment info", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v7 = -[BuddySoftwareUpdateRestoreFlow settingsManager](v23, "settingsManager");
    -[BFFSettingsManager setSeedEnrollmentProgramName:assetAudience:programID:](v7, "setSeedEnrollmentProgramName:assetAudience:programID:", v19, v18, location);

  }
  else
  {
    v13 = (os_log_t)(id)_BYLoggingFacility(v4);
    v12 = 2;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v8 = v13;
      v9 = v12;
      sub_100038C3C(v11);
      _os_log_debug_impl((void *)&_mh_execute_header, v8, v9, "Beta Re-Enroll: Post-software update found no seed enrollment info", v11, 2u);
    }
    objc_storeStrong((id *)&v13, 0);
  }
  v10.receiver = v23;
  v10.super_class = (Class)BuddySoftwareUpdateRestoreFlow;
  -[BuddySoftwareUpdateRestoreFlow startFlowAnimated:](&v10, "startFlowAnimated:", v21);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
}

- (id)firstItem
{
  id v2;
  uint64_t v3;
  id v4;
  objc_super v6;
  id location[2];
  BuddySoftwareUpdateRestoreFlow *v8;

  v8 = self;
  location[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddySoftwareUpdateRestoreFlow;
  location[0] = -[BuddyRestoreFlow firstItem](&v6, "firstItem");
  v2 = location[0];
  v3 = objc_opt_class(BuddyRestoreSilentRenewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    -[BuddySoftwareUpdateRestoreFlow setSilentRenewController:](v8, "setSilentRenewController:", location[0]);
  v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4
{
  id v4;
  uint64_t v5;
  BuddyRestoreSilentRenewController *v6;
  unsigned __int8 v7;
  id v8;
  objc_super v10;
  id location[4];
  BuddySoftwareUpdateRestoreFlow *v12;

  v12 = self;
  location[3] = (id)a2;
  location[2] = a3;
  location[1] = a4;
  v10.receiver = self;
  v10.super_class = (Class)BuddySoftwareUpdateRestoreFlow;
  location[0] = -[BuddyRestoreFlow controllerFollowingControllerClass:requestedNext:](&v10, "controllerFollowingControllerClass:requestedNext:", a3, a4);
  v4 = location[0];
  v5 = objc_opt_class(BuddyRestoreRenewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = -[BuddySoftwareUpdateRestoreFlow silentRenewController](v12, "silentRenewController");
    v7 = -[BuddyRestoreSilentRenewController renewSucceeded](v6, "renewSucceeded");
    objc_msgSend(location[0], "setForceReauthentication:", (v7 ^ 1) & 1);

  }
  if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyRestoreFlowItem) & 1) != 0)
    objc_msgSend(location[0], "setSoftwareUpdateDidOccur:", 1);
  v8 = location[0];
  objc_storeStrong(location, 0);
  return v8;
}

+ (id)allowedFlowItems
{
  _QWORD v3[4];

  v3[0] = objc_opt_class(BackupRestoreProgressController);
  v3[1] = objc_opt_class(BuddyRestoreRenewController);
  v3[2] = objc_opt_class(BuddyRestoreSilentRenewController);
  v3[3] = objc_opt_class(BuddyRestoreStoreRenewController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 4);
}

+ (BOOL)controllerNeedsToRunWithPendingRestoreState:(id)a3 buddyPreferences:(id)a4
{
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  os_log_type_t v18;
  os_log_t v19;
  id v20;
  int v21;
  uint8_t buf[7];
  char v23;
  os_log_t oslog;
  id v25;
  id v26;
  id location[3];
  BOOL v28;
  uint8_t v29[24];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = +[BuddyRestoreState loadFromPreferences:](BuddyRestoreState, "loadFromPreferences:", v26);
  if (v25)
  {
    v7 = +[BYDeviceConfiguration currentConfiguration](BYDeviceConfiguration, "currentConfiguration");
    v20 = objc_msgSend(v7, "buildVersion");

    v8 = objc_msgSend(v25, "productBuild");
    v9 = objc_msgSend(v8, "isEqualToString:", v20) ^ 1;

    if ((v9 & 1) != 0)
    {
      v19 = (os_log_t)(id)_BYLoggingFacility(v10);
      v18 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_msgSend(v25, "productBuild");
        sub_10003EB04((uint64_t)v29, (uint64_t)v11, (uint64_t)v20);
        _os_log_error_impl((void *)&_mh_execute_header, v19, v18, "Expected update to %@, but currently running %@!", v29, 0x16u);

      }
      objc_storeStrong((id *)&v19, 0);
      +[BuddyRestoreState removeFromPreferences:](BuddyRestoreState, "removeFromPreferences:", v26);
      v28 = 0;
      v21 = 1;
    }
    else
    {
      v12 = objc_msgSend(v25, "backupUDID");
      v13 = objc_msgSend(v25, "backupUUID");
      v17 = +[RestorableBackupItem restorableBackupItemWithPendingBackupUDID:backupUUID:snapshotID:](RestorableBackupItem, "restorableBackupItemWithPendingBackupUDID:backupUUID:snapshotID:", v12, v13, objc_msgSend(v25, "snapshotID"));

      objc_msgSend(location[0], "setBackupItem:updateBackupMetadata:prefetchAccounts:", v17, 1, 1);
      v14 = location[0];
      v15 = objc_msgSend(v25, "snapshotDate");
      objc_msgSend(v14, "setSnapshotDate:", v15);

      objc_msgSend(location[0], "setUseLatestSnapshot:", (unint64_t)objc_msgSend(v25, "useLatestSnapshot") & 1);
      objc_msgSend(location[0], "setAllowCellularNetwork:", (unint64_t)objc_msgSend(v25, "allowCellularNetwork") & 1);
      v28 = v17 != 0;
      v21 = 1;
      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(0);
    v23 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v5 = oslog;
      v6 = v23;
      sub_100038C3C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "No restore state found on disk!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    +[BuddyRestoreState removeFromPreferences:](BuddyRestoreState, "removeFromPreferences:", v26);
    v28 = 0;
    v21 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v28;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  void (**v3)(id, unint64_t);
  BuddyPendingRestoreState *v4;
  BYPreferencesController *v5;
  id location[2];
  BuddySoftwareUpdateRestoreFlow *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(id, unint64_t))location[0];
  v4 = -[BuddyRestoreFlow pendingRestoreState](v7, "pendingRestoreState");
  v5 = -[BuddyRestoreFlow buddyPreferences](v7, "buddyPreferences");
  v3[2](v3, +[BuddySoftwareUpdateRestoreFlow controllerNeedsToRunWithPendingRestoreState:buddyPreferences:](BuddySoftwareUpdateRestoreFlow, "controllerNeedsToRunWithPendingRestoreState:buddyPreferences:", v4, v5));

  objc_storeStrong(location, 0);
}

- (BYSeedProgramManager)seedProgramManager
{
  return self->seedProgramManager;
}

- (void)setSeedProgramManager:(id)a3
{
  objc_storeStrong((id *)&self->seedProgramManager, a3);
}

- (BFFSettingsManager)settingsManager
{
  return self->settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->settingsManager, a3);
}

- (BuddyRestoreSilentRenewController)silentRenewController
{
  return (BuddyRestoreSilentRenewController *)objc_loadWeakRetained((id *)&self->_silentRenewController);
}

- (void)setSilentRenewController:(id)a3
{
  objc_storeWeak((id *)&self->_silentRenewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_silentRenewController);
  objc_storeStrong((id *)&self->settingsManager, 0);
  objc_storeStrong((id *)&self->seedProgramManager, 0);
}

@end
