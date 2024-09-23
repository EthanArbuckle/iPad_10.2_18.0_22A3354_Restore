@implementation BuddyWatchMigrationController

+ (void)setWatchDataForMigration:(id)a3 presented:(BOOL)a4 settingsManager:(id)a5 buddyPreferencesExcludedFromBackup:(id)a6
{
  id v9;
  NSNumber *v10;
  id v11;
  id v12;
  BOOL v13;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v11 = 0;
  objc_storeStrong(&v11, a6);
  objc_msgSend(v12, "stashWatchData:", location[0]);
  v9 = v11;
  v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13);
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("WatchMigrationPresented"));

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

+ (void)clearWatchDataForMigrationWithSettingsManager:(id)a3 buddyPreferencesExcludedFromBackup:(id)a4
{
  void *v5;
  id v6;
  id location[2];
  id v8;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = (void *)objc_opt_class(v8);
  objc_msgSend(v5, "setWatchDataForMigration:presented:settingsManager:buddyPreferencesExcludedFromBackup:", 0, 0, location[0], v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupWatchMigration;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  BYCapabilities *v2;
  unsigned __int8 v3;
  char v4;
  char v6;
  BYPreferencesController *v7;
  char v9;

  v2 = -[BuddyWatchMigrationController capabilities](self, "capabilities");
  v3 = -[BYCapabilities supportsAppleWatch](v2, "supportsAppleWatch");
  v6 = 0;
  v4 = 0;
  if ((v3 & 1) != 0)
  {
    v7 = -[BuddyWatchMigrationController buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
    v6 = 1;
    v4 = -[BYPreferencesController BOOLForKey:](v7, "BOOLForKey:", CFSTR("WatchMigrationPresented")) ^ 1;
  }
  v9 = v4 & 1;
  if ((v6 & 1) != 0)

  return v9 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyPendingRestoreState *v3;
  RestorableBackupItem *v4;
  ProximitySetupController *v5;
  id v6;
  BuddyWatchMigrationController *v7;
  BPSWatchMigrationController *v8;
  NSObject *v9;
  void **block;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  BuddyWatchMigrationController *v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  BuddyWatchMigrationController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyWatchMigrationController pendingRestoreState](v20, "pendingRestoreState");
  v4 = -[BuddyPendingRestoreState backupItem](v3, "backupItem");
  v18 = -[RestorableBackupItem snapshot](v4, "snapshot");

  v17 = objc_msgSend(v18, "deviceName");
  if (!v17)
  {
    v5 = -[BuddyWatchMigrationController proximitySetupController](v20, "proximitySetupController");
    v17 = -[ProximitySetupController deviceName](v5, "deviceName");

  }
  v6 = objc_msgSend(objc_alloc((Class)BPSWatchMigrationController), "initWithSourceDeviceName:", v17);
  -[BuddyWatchMigrationController setMigrationController:](v20, "setMigrationController:", v6);

  v7 = v20;
  v8 = -[BuddyWatchMigrationController migrationController](v20, "migrationController");
  -[BPSWatchMigrationController setMigrationDelegate:](v8, "setMigrationDelegate:", v7);

  v9 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_10012ACD8;
  v14 = &unk_1002806E0;
  v15 = v20;
  v16 = location[0];
  dispatch_async(v9, &block);

  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  return self->_migrationController;
}

- (void)controllerItemCompletedWithMigration:(BOOL)a3 preRestoreData:(id)a4
{
  BFFSettingsManager *v4;
  BYPaneFeatureAnalyticsManager *v5;
  NSNumber *v6;
  BYPreferencesController *v7;
  id WeakRetained;
  id v9;
  BOOL v10;
  SEL v11;
  BuddyWatchMigrationController *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = 0;
  objc_storeStrong(&v9, a4);
  if (v10)
  {
    v4 = -[BuddyWatchMigrationController settingsManager](v12, "settingsManager");
    -[BFFSettingsManager stashWatchData:](v4, "stashWatchData:", v9);
  }
  else
  {
    v4 = -[BuddyWatchMigrationController settingsManager](v12, "settingsManager");
    -[BFFSettingsManager stashWatchData:](v4, "stashWatchData:", 0);
  }

  v5 = -[BuddyWatchMigrationController paneFeatureAnalyticsManager](v12, "paneFeatureAnalyticsManager");
  v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10);
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v5, "recordActionWithValue:forFeature:", v6, 10);

  v7 = -[BuddyWatchMigrationController buddyPreferencesExcludedFromBackup](v12, "buddyPreferencesExcludedFromBackup");
  -[BYPreferencesController setObject:forKey:](v7, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("WatchMigrationPresented"));

  WeakRetained = objc_loadWeakRetained((id *)&v12->_delegate);
  objc_msgSend(WeakRetained, "flowItemDone:", v12);

  objc_storeStrong(&v9, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestoreState, a3);
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_existingSettings, a3);
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

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManager, a3);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (BPSWatchMigrationController)migrationController
{
  return self->_migrationController;
}

- (void)setMigrationController:(id)a3
{
  objc_storeStrong((id *)&self->_migrationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationController, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_existingSettings, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
