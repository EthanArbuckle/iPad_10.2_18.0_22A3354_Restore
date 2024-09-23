@implementation ProximitySetupController

- (ProximitySetupController)initWithMiscState:(id)a3 buddyPreferences:(id)a4 buddyPreferencesExcludedFromBackup:(id)a5 featureFlags:(id)a6 analyticsManager:(id)a7 setupMethod:(id)a8
{
  id v13;
  ProximitySetupController *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  dispatch_queue_t v22;
  NSNotificationCenter *v23;
  ProximitySetupController *v24;
  objc_super v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location[2];
  id v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = 0;
  objc_storeStrong(&v29, a6);
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = 0;
  objc_storeStrong(&v27, a8);
  v13 = v33;
  v33 = 0;
  v26.receiver = v13;
  v26.super_class = (Class)ProximitySetupController;
  v14 = -[ProximitySetupController init](&v26, "init");
  v33 = v14;
  objc_storeStrong(&v33, v14);
  if (v14)
  {
    objc_msgSend(v33, "setMiscState:", location[0]);
    objc_msgSend(v33, "setBuddyPreferences:", v31);
    objc_msgSend(v33, "setBuddyPreferencesExcludedFromBackup:", v30);
    objc_msgSend(v33, "setFeatureFlags:", v29);
    objc_msgSend(v33, "setSetupMethod:", v27);
    v15 = objc_alloc_init((Class)BYBuddyDaemonProximityTargetClient);
    objc_msgSend(v33, "setClient:", v15);

    v16 = v33;
    v17 = objc_msgSend(v33, "client");
    objc_msgSend(v17, "setDelegate:", v16);

    objc_msgSend(v33, "setShouldApplySettings:", 1);
    v18 = objc_alloc_init((Class)SASProximitySession);
    objc_msgSend(v33, "setSession:", v18);

    v19 = v33;
    v20 = objc_msgSend(v33, "session");
    objc_msgSend(v20, "setDelegate:", v19);

    v21 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v33, "setObservers:", v21);

    v22 = dispatch_queue_create("Proximity Setup Termination Observer Queue", 0);
    objc_msgSend(v33, "setObserverQueue:", v22);

    objc_msgSend(v33, "setAnalyticsManager:", v28);
    v23 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v23, "addObserver:selector:name:object:", v33, "cloudConfigDidChange:", MCCloudConfigurationDidChangeNotification, 0);

  }
  v24 = (ProximitySetupController *)v33;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v33, 0);
  return v24;
}

- (BOOL)shouldEnableProximity
{
  id v2;
  unsigned __int8 v3;
  id v4;
  unsigned __int8 v5;
  BYPreferencesController *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  char v11;
  unsigned __int8 v12;
  char v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;

  v2 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
  v17 = 0;
  v15 = 0;
  v3 = 1;
  if ((objc_msgSend(v2, "isMultiUser") & 1) == 0)
  {
    v18 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
    v17 = 1;
    v3 = 1;
    if ((objc_msgSend(v18, "hasCloudConfiguration") & 1) == 0)
    {
      v16 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
      v15 = 1;
      v3 = objc_msgSend(v16, "shouldShowCloudConfigurationUI");
    }
  }
  if ((v15 & 1) != 0)

  if ((v17 & 1) != 0)
  v19 = v3 & 1;
  v4 = +[BuddyDeviceManagementSupport sharedSupport](BuddyDeviceManagementSupport, "sharedSupport");
  v5 = objc_msgSend(v4, "shouldDisallowProximityAdvertisement");

  if ((v19 & 1) != 0 || (v5 & 1) != 0)
    return 0;
  v6 = -[ProximitySetupController buddyPreferences](self, "buddyPreferences");
  v7 = +[BuddyRestoreState hasStateFromPreferences:](BuddyRestoreState, "hasStateFromPreferences:", v6);

  if ((v7 & 1) != 0)
    return 0;
  v14 = BYSetupAssistantHasCompletedInitialRun(v8, v9) & 1;
  v10 = -[ProximitySetupController userSkippedProximity](self, "userSkippedProximity");
  v11 = 1;
  if ((v10 & 1) == 0)
  {
    v12 = -[ProximitySetupController hasAppliedSettings](self, "hasAppliedSettings");
    v11 = 1;
    if ((v12 & 1) == 0)
      v11 = v14;
  }
  return (v11 ^ 1) & 1;
}

- (BOOL)hasConnection
{
  SASProximitySession *v2;
  unsigned __int8 v3;

  v2 = -[ProximitySetupController session](self, "session");
  v3 = -[SASProximitySession isConnected](v2, "isConnected");

  if ((v3 & 1) != 0)
    return !-[ProximitySetupController isDisconnecting](self, "isDisconnecting");
  else
    return 0;
}

- (void)needsToResume:(id)a3
{
  BYBuddyDaemonProximityTargetClient *v3;
  void **v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, char);
  void *v8;
  ProximitySetupController *v9;
  id v10;
  int v11;
  id location[2];
  ProximitySetupController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if (-[ProximitySetupController hasConnection](v13, "hasConnection")
      || -[ProximitySetupController hasResumed](v13, "hasResumed"))
    {
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    }
    else
    {
      v3 = -[ProximitySetupController client](v13, "client");
      v4 = _NSConcreteStackBlock;
      v5 = -1073741824;
      v6 = 0;
      v7 = sub_100159854;
      v8 = &unk_100280708;
      v9 = v13;
      v10 = location[0];
      -[BYBuddyDaemonProximityTargetClient hasConnection:](v3, "hasConnection:", &v4);

      objc_storeStrong(&v10, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)resumeSession
{
  NSObject *v2;
  os_log_type_t v3;
  BYBuddyDaemonProximityTargetClient *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, void *, void *, void *, void *, void *, char);
  void *v9;
  ProximitySetupController *v10;
  uint8_t buf[7];
  os_log_type_t v12;
  id location[2];
  ProximitySetupController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v12;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Resuming existing proximity setup session...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  v4 = -[ProximitySetupController client](v14, "client");
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001599BC;
  v9 = &unk_1002839A8;
  v10 = v14;
  -[BYBuddyDaemonProximityTargetClient resumeProximitySetup:](v4, "resumeProximitySetup:", &v5);

  objc_storeStrong((id *)&v10, 0);
}

- (void)beginAdvertisingProximitySetup
{
  BYBuddyDaemonProximityTargetClient *v2;

  if (!-[ProximitySetupController hasConnection](self, "hasConnection", a2))
  {
    v2 = -[ProximitySetupController client](self, "client");
    -[BYBuddyDaemonProximityTargetClient beginAdvertisingProximitySetup](v2, "beginAdvertisingProximitySetup");

  }
}

- (void)endAdvertisingProximitySetup
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  BYBuddyDaemonProximityTargetClient *v5;
  _WORD v6[3];
  os_log_type_t v7;
  os_log_t oslog[2];
  ProximitySetupController *v9;

  v9 = self;
  oslog[1] = (os_log_t)a2;
  if (!-[ProximitySetupController hasConnection](self, "hasConnection"))
  {
    v2 = -[ProximitySetupController reconnecting](v9, "reconnecting");
    if (v2)
    {
      oslog[0] = (os_log_t)(id)_BYLoggingFacility(v2);
      v7 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
      {
        v3 = oslog[0];
        v4 = v7;
        sub_100038C3C(v6);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Not ending advertising for proximity setup as we're waiting for reconnection...", (uint8_t *)v6, 2u);
      }
      objc_storeStrong((id *)oslog, 0);
    }
    else
    {
      v5 = -[ProximitySetupController client](v9, "client");
      -[BYBuddyDaemonProximityTargetClient endAdvertisingProximitySetup](v5, "endAdvertisingProximitySetup");

    }
  }
}

- (void)endPairing
{
  BYBuddyDaemonProximityTargetClient *v2;

  -[ProximitySetupController setResumeBlock:](self, "setResumeBlock:", 0, a2);
  v2 = -[ProximitySetupController client](self, "client");
  -[BYBuddyDaemonProximityTargetClient endPairing](v2, "endPairing");

}

- (void)resetInformation
{
  -[ProximitySetupController setInformation:](self, "setInformation:", 0, a2);
  -[ProximitySetupController setBackupMetadataFromTerminatedConnection:](self, "setBackupMetadataFromTerminatedConnection:", 0);
  -[ProximitySetupController setReceivedLanguages:](self, "setReceivedLanguages:", 0);
  -[ProximitySetupController setReceivedLocale:](self, "setReceivedLocale:", 0);
  -[ProximitySetupController setModel:](self, "setModel:", 0);
  -[ProximitySetupController setDeviceClass:](self, "setDeviceClass:", 0);
  -[ProximitySetupController setDeviceName:](self, "setDeviceName:", 0);
  -[ProximitySetupController setAccessibilitySettings:](self, "setAccessibilitySettings:", 0);
}

- (void)updateInformation:(id)a3
{
  SASProximityInformation *v3;
  id v4;
  SASProximityInformation *v5;
  id v6;
  SASProximityInformation *v7;
  id v8;
  SASProximityInformation *v9;
  id v10;
  BYExpressSetupProximityDataSource *v11;
  SASProximityInformation *v12;
  BYExpressSetupProximityDataSource *v13;
  id location[2];
  ProximitySetupController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ProximitySetupController setInformation:](v15, "setInformation:", location[0]);
  -[ProximitySetupController setBackupMetadataFromTerminatedConnection:](v15, "setBackupMetadataFromTerminatedConnection:", 0);
  v3 = -[ProximitySetupController information](v15, "information");
  v4 = -[SASProximityInformation deviceName](v3, "deviceName");
  -[ProximitySetupController setDeviceName:](v15, "setDeviceName:", v4);

  v5 = -[ProximitySetupController information](v15, "information");
  v6 = -[SASProximityInformation deviceModel](v5, "deviceModel");
  -[ProximitySetupController setModel:](v15, "setModel:", v6);

  v7 = -[ProximitySetupController information](v15, "information");
  v8 = -[SASProximityInformation deviceClass](v7, "deviceClass");
  -[ProximitySetupController setDeviceClass:](v15, "setDeviceClass:", v8);

  v9 = -[ProximitySetupController information](v15, "information");
  v10 = -[SASProximityInformation productVersion](v9, "productVersion");
  -[ProximitySetupController setProductVersion:](v15, "setProductVersion:", v10);

  v11 = [BYExpressSetupProximityDataSource alloc];
  v12 = -[ProximitySetupController information](v15, "information");
  v13 = -[BYExpressSetupProximityDataSource initWithInformation:](v11, "initWithInformation:", v12);
  -[ProximitySetupController setExpressDataSource:](v15, "setExpressDataSource:", v13);

  objc_storeStrong(location, 0);
}

- (void)setupFinished
{
  SASProximitySession *v2;
  id v3;
  id v4;
  BuddyMiscState *v5;
  BuddyTargetDeviceMigrationManager *v6;

  if (-[ProximitySetupController hasConnection](self, "hasConnection", a2))
  {
    -[ProximitySetupController setDisconnecting:](self, "setDisconnecting:", 1);
    v2 = -[ProximitySetupController session](self, "session");
    v3 = objc_alloc_init((Class)SASProximityFinishedAction);
    v4 = -[SASProximitySession sendAction:](v2, "sendAction:", v3);

    -[ProximitySetupController _setConnected:](self, "_setConnected:", 0);
    -[ProximitySetupController notifyObserversConnectionTerminated](self, "notifyObserversConnectionTerminated");
  }
  -[ProximitySetupController endAdvertisingProximitySetup](self, "endAdvertisingProximitySetup");
  v5 = -[ProximitySetupController miscState](self, "miscState");
  v6 = -[BuddyMiscState migrationManager](v5, "migrationManager");
  -[BuddyTargetDeviceMigrationManager cancelWithCause:](v6, "cancelWithCause:", 9);

}

- (void)cloudConfigDidChange:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _WORD v8[7];
  os_log_type_t v9;
  os_log_t oslog;
  id location[2];
  ProximitySetupController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
  v4 = objc_msgSend(v3, "cloudConfigurationDetails");

  if (v4)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v9;
      sub_100038C3C(v8);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Ending proximity setup advertising due to cloud configuration...", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[ProximitySetupController endAdvertisingProximitySetup](v12, "endAdvertisingProximitySetup");
  }
  objc_storeStrong(location, 0);
}

- (BYBackupMetadata)backupMetadata
{
  SASProximityInformation *v2;
  id v3;
  id v4;

  v2 = -[ProximitySetupController information](self, "information", a2, self);
  v3 = -[SASProximityInformation backupMetadata](v2, "backupMetadata");
  v4 = (id)BYMetadataFromDataArchive(v3);

  return (BYBackupMetadata *)v4;
}

- (NSArray)preferredLanguages
{
  SASProximityInformation *v2;
  id v3;
  id v4;

  v2 = -[ProximitySetupController information](self, "information", a2, self);
  v3 = -[SASProximityInformation localePreferences](v2, "localePreferences");
  v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));

  return (NSArray *)v4;
}

- (void)languageChangeCompleted
{
  NSObject *v2;
  os_log_type_t v3;
  BYBackupMetadata *v4;
  unsigned __int8 v5;
  BYPreferencesController *v6;
  _WORD v7[3];
  os_log_type_t v8;
  os_log_t oslog[2];
  ProximitySetupController *v10;

  v10 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v8;
    sub_100038C3C(v7);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Applying settings from proximity setup after a language reboot..", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = -[ProximitySetupController backupMetadata](v10, "backupMetadata");
  v5 = -[BYBackupMetadata hasUserInterfaceStyleMode](v4, "hasUserInterfaceStyleMode");

  if ((v5 & 1) != 0)
  {
    v6 = -[ProximitySetupController buddyPreferences](v10, "buddyPreferences");
    -[BYPreferencesController setObject:forKey:](v6, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("UserInterfaceStyleModePresented"));

  }
}

- (CUMessageSession)sharingMessageSession
{
  SASProximitySession *v2;
  id v3;

  v2 = -[ProximitySetupController session](self, "session", a2, self);
  v3 = -[SASProximitySession sharingMessageSession](v2, "sharingMessageSession");

  return (CUMessageSession *)v3;
}

- (id)createTargetDeviceMigrationManagerWithPrepareForMigrationRebootBlock:(id)a3 passcodeCacheManager:(id)a4 analyticsManager:(id)a5 lockdownModeProvider:(id)a6
{
  BYBuddyDaemonProximityTargetClient *v9;
  BuddyTargetDeviceMigrationManager *v10;
  ProximitySetupController *v11;
  id v12;
  id v13;
  BYPreferencesController *v14;
  BuddyTargetDeviceMigrationManager *v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  ProximitySetupController *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = 0;
  objc_storeStrong(&v18, a6);
  v9 = -[ProximitySetupController client](v22, "client");
  v17 = -[BYBuddyDaemonProximityTargetClient fileTransferSessionTemplate](v9, "fileTransferSessionTemplate");

  v10 = [BuddyTargetDeviceMigrationManager alloc];
  v11 = v22;
  v12 = location[0];
  v13 = v20;
  v14 = -[ProximitySetupController buddyPreferencesExcludedFromBackup](v22, "buddyPreferencesExcludedFromBackup");
  v15 = -[BuddyTargetDeviceMigrationManager initWithFileTranferSession:proximitySetupController:prepareForMigrationRebootBlock:passcodeCacheManager:buddyPreferencesExcludedFromBackup:analyticsManager:lockdownModeProvider:](v10, "initWithFileTranferSession:proximitySetupController:prepareForMigrationRebootBlock:passcodeCacheManager:buddyPreferencesExcludedFromBackup:analyticsManager:lockdownModeProvider:", v17, v11, v12, v13, v14, v19, v18);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (void)beginDeviceToDeviceMigration
{
  NSObject *v2;
  BuddyMiscState *v3;
  BuddyTargetDeviceMigrationManager *v4;
  void **block;
  int v6;
  int v7;
  void (*v8)(id *);
  void *v9;
  id v10[2];
  ProximitySetupController *v11;

  v11 = self;
  v10[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_10015A558;
  v9 = &unk_100280730;
  v10[0] = v11;
  dispatch_async(v2, &block);

  v3 = -[ProximitySetupController miscState](v11, "miscState");
  v4 = -[BuddyMiscState migrationManager](v3, "migrationManager");
  -[BuddyTargetDeviceMigrationManager start](v4, "start");

  objc_storeStrong(v10, 0);
}

- (void)endDeviceToDeviceMigration
{
  BYBuddyDaemonProximityTargetClient *v2;

  v2 = -[ProximitySetupController client](self, "client", a2, self);
  -[BYBuddyDaemonProximityTargetClient endDeviceToDeviceMigration](v2, "endDeviceToDeviceMigration");

}

- (void)showMigrationInterfaceOnSource
{
  id v2;
  SASProximitySession *v3;
  id v4;
  BYBuddyDaemonProximityTargetClient *v5;
  id v6[2];
  ProximitySetupController *v7;
  id v8;

  v7 = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init((Class)SASProximityMigrationTransferPreparationAction);
  v8 = (id)MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
  v2 = v8;
  objc_msgSend(v6[0], "setDeviceName:", v2);

  v3 = -[ProximitySetupController session](v7, "session");
  v4 = -[SASProximitySession sendAction:](v3, "sendAction:", v6[0]);

  v5 = -[ProximitySetupController client](v7, "client");
  -[BYBuddyDaemonProximityTargetClient showMigrationInterfaceOnSource](v5, "showMigrationInterfaceOnSource");

  objc_storeStrong(v6, 0);
}

- (void)suspendConnectionForSoftwareUpdate:(id)a3
{
  BYBuddyDaemonProximityTargetClient *v3;
  id location[2];
  ProximitySetupController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[ProximitySetupController client](v5, "client");
  -[BYBuddyDaemonProximityTargetClient suspendConnectionForSoftwareUpdate:](v3, "suspendConnectionForSoftwareUpdate:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setSourceProxCardVisibliityForSIMSetupExternalAuthentication:(BOOL)a3
{
  BYBuddyDaemonProximityTargetClient *v3;

  if (a3)
  {
    v3 = -[ProximitySetupController client](self, "client");
    -[BYBuddyDaemonProximityTargetClient endSIMSetupExternalAuthentication](v3, "endSIMSetupExternalAuthentication");
  }
  else
  {
    v3 = -[ProximitySetupController client](self, "client");
    -[BYBuddyDaemonProximityTargetClient beginSIMSetupExternalAuthentication](v3, "beginSIMSetupExternalAuthentication");
  }

}

- (void)startReconnecting
{
  -[ProximitySetupController setReconnecting:](self, "setReconnecting:", 1, a2);
  -[ProximitySetupController beginAdvertisingProximitySetup](self, "beginAdvertisingProximitySetup");
}

- (void)stopReconnecting
{
  -[ProximitySetupController setReconnecting:](self, "setReconnecting:", 0, a2, self);
}

- (void)waitForSessionReconnection:(id)a3
{
  BOOL v3;
  char v4;
  SASProximityInformation *v5;
  id location[2];
  ProximitySetupController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = 0;
  v3 = 0;
  if (-[ProximitySetupController hasConnection](v7, "hasConnection"))
  {
    v5 = -[ProximitySetupController information](v7, "information");
    v4 = 1;
    v3 = v5 != 0;
  }
  if ((v4 & 1) != 0)

  if (v3)
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    -[ProximitySetupController setResumeBlock:](v7, "setResumeBlock:", 0);
  }
  else
  {
    -[ProximitySetupController setResumeBlock:](v7, "setResumeBlock:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)prepareForDependentSetup
{
  uint64_t v2;
  SASProximityInformation *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  BuddyProximitySetupDependentController *v7;
  CUMessageSession *v8;
  BuddyFeatureFlags *v9;
  BuddyProximitySetupDependentController *v10;
  ProximitySetupController *v11;
  BuddyProximitySetupDependentController *v12;
  _WORD v13[3];
  os_log_type_t v14;
  os_log_t oslog[2];
  ProximitySetupController *v16;

  v16 = self;
  oslog[1] = (os_log_t)a2;
  v2 = objc_opt_class(self);
  v3 = -[ProximitySetupController information](v16, "information");
  LOBYTE(v2) = objc_msgSend((id)v2, "_supportsDependentSetup:", v3);

  if ((v2 & 1) != 0)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v4);
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog[0];
      v6 = v14;
      sub_100038C3C(v13);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Preparing for dependent setup...", (uint8_t *)v13, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    v7 = [BuddyProximitySetupDependentController alloc];
    v8 = -[ProximitySetupController sharingMessageSession](v16, "sharingMessageSession");
    v9 = -[ProximitySetupController featureFlags](v16, "featureFlags");
    v10 = -[BuddyProximitySetupDependentController initWithMessageSession:featureFlags:](v7, "initWithMessageSession:featureFlags:", v8, v9);
    -[ProximitySetupController setDependentController:](v16, "setDependentController:", v10);

    v11 = v16;
    v12 = -[ProximitySetupController dependentController](v16, "dependentController");
    -[ProximitySetupController addObserver:](v11, "addObserver:", v12);

  }
  else
  {
    -[ProximitySetupController setDependentController:](v16, "setDependentController:", 0);
  }
}

- (BOOL)supportsIntent
{
  BuddyProximitySetupDependentController *v2;
  BOOL v3;

  v2 = -[ProximitySetupController dependentController](self, "dependentController", a2, self);
  v3 = v2 != 0;

  return v3;
}

- (void)waitForIntent:(id)a3
{
  BuddyProximitySetupDependentController *v3;
  void **v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  int v10;
  id location[2];
  ProximitySetupController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[ProximitySetupController supportsIntent](v12, "supportsIntent"))
  {
    v3 = -[ProximitySetupController dependentController](v12, "dependentController");
    v4 = _NSConcreteStackBlock;
    v5 = -1073741824;
    v6 = 0;
    v7 = sub_10015ABE0;
    v8 = &unk_1002839D0;
    v9 = location[0];
    -[BuddyProximitySetupDependentController waitForSelectedAccountType:](v3, "waitForSelectedAccountType:", &v4);

    objc_storeStrong(&v9, 0);
    v10 = 0;
  }
  else
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    v10 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)startOver
{
  BuddyMiscState *v2;
  BuddyTargetDeviceMigrationManager *v3;
  NSObject *v4;
  void **block;
  int v6;
  int v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10[2];
  ProximitySetupController *v11;

  v11 = self;
  v10[1] = (id)a2;
  -[ProximitySetupController setHasAppliedSettings:](self, "setHasAppliedSettings:", 0);
  -[ProximitySetupController setHasValidatedPasscode:](v11, "setHasValidatedPasscode:", 0);
  -[ProximitySetupController setSignedIniCloudAccount:](v11, "setSignedIniCloudAccount:", 0);
  -[ProximitySetupController setSkipExpressRestore:](v11, "setSkipExpressRestore:", 0);
  v2 = -[ProximitySetupController miscState](v11, "miscState");
  v3 = -[BuddyMiscState migrationManager](v2, "migrationManager");
  -[BuddyTargetDeviceMigrationManager reset](v3, "reset");

  v4 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_10015AD64;
  v9 = &unk_100280730;
  v10[0] = v11;
  dispatch_async(v4, &block);

  objc_storeStrong(v10, 0);
}

- (id)createSignInTask
{
  BuddyProximityAppleIDSignInTask *v2;
  SASProximitySession *v3;
  BYAnalyticsManager *v4;
  BuddyFeatureFlags *v5;
  CUMessageSession *v6;
  SASProximityInformation *v7;
  id v8;
  id location[2];
  ProximitySetupController *v11;

  v11 = self;
  location[1] = (id)a2;
  v2 = [BuddyProximityAppleIDSignInTask alloc];
  v3 = -[ProximitySetupController session](v11, "session");
  v4 = -[ProximitySetupController analyticsManager](v11, "analyticsManager");
  v5 = -[ProximitySetupController featureFlags](v11, "featureFlags");
  location[0] = -[BuddyProximityAppleIDSignInTask initWithSession:analyticsManager:featureFlags:](v2, "initWithSession:analyticsManager:featureFlags:", v3, v4, v5);

  v6 = -[ProximitySetupController sharingMessageSession](v11, "sharingMessageSession");
  objc_msgSend(location[0], "setMessageSession:", v6);

  v7 = -[ProximitySetupController information](v11, "information");
  objc_msgSend(location[0], "setMakeStoreServiceActive:", (unint64_t)-[SASProximityInformation usesSameAccountForiTunes](v7, "usesSameAccountForiTunes") & 1);

  v8 = location[0];
  objc_storeStrong(location, 0);
  return v8;
}

- (void)prepareForReboot
{
  id v2;
  BOOL v3;
  NSObject *v4;
  os_log_type_t v5;
  BYBuddyDaemonProximityTargetClient *v6;
  SASProximityInformation *v7;
  BYBuddyDaemonProximityTargetClient *v8;
  SASProximityHandshake *v9;
  _WORD v10[3];
  os_log_type_t v11;
  os_log_t oslog;
  char v13;
  id v14;
  SEL v15;
  ProximitySetupController *v16;

  v16 = self;
  v15 = a2;
  v2 = (id)-[ProximitySetupController hasAppliedSettings](self, "hasAppliedSettings");
  v13 = 0;
  v3 = 1;
  if ((v2 & 1) != 0)
  {
    v2 = -[ProximitySetupController information](v16, "information");
    v14 = v2;
    v13 = 1;
    v3 = v2 == 0;
  }
  if ((v13 & 1) != 0)

  if (!v3)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v2);
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = oslog;
      v5 = v11;
      sub_100038C3C(v10);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Saving proximity state for language/locale reboot...", (uint8_t *)v10, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v6 = -[ProximitySetupController client](v16, "client");
    v7 = -[ProximitySetupController information](v16, "information");
    -[BYBuddyDaemonProximityTargetClient storeInformation:](v6, "storeInformation:", v7);

    v8 = -[ProximitySetupController client](v16, "client");
    v9 = -[ProximitySetupController handshake](v16, "handshake");
    -[BYBuddyDaemonProximityTargetClient storeHandshake:](v8, "storeHandshake:", v9);

  }
}

- (BOOL)validatePasscode:(id)a3
{
  SASProximitySession *v3;
  id v4;
  id v6;
  id location[2];
  ProximitySetupController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = objc_alloc_init((Class)SASProximityPasscodeValidationAction);
  objc_msgSend(v6, "setPasscode:", location[0]);
  v3 = -[ProximitySetupController session](v8, "session");
  v4 = -[SASProximitySession sendAction:](v3, "sendAction:", v6);

  LOBYTE(v3) = objc_msgSend(v6, "passcodeValid");
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)willApplySettings:(id)a3
{
  ProximitySetupControllerDelegate *v3;
  id location[2];
  ProximitySetupController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[ProximitySetupController delegate](v5, "delegate");
  -[ProximitySetupControllerDelegate willApplyProximitySettingsWithCompletion:](v3, "willApplyProximitySettingsWithCompletion:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)didApplySettings
{
  ProximitySetupControllerDelegate *v2;
  void **v3;
  int v4;
  int v5;
  id *(*v6)(id *, char);
  void *v7;
  id v8[2];
  ProximitySetupController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[ProximitySetupController delegate](self, "delegate");
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10015B214;
  v7 = &unk_1002808D0;
  v8[0] = v9;
  -[ProximitySetupControllerDelegate didApplyProximitySettingsWithWillReboot:](v2, "didApplyProximitySettingsWithWillReboot:", &v3);

  objc_storeStrong(v8, 0);
}

- (void)skippedApplySettings
{
  ProximitySetupControllerDelegate *v2;

  v2 = -[ProximitySetupController delegate](self, "delegate", a2, self);
  -[ProximitySetupControllerDelegate skippedApplyProximitySettings](v2, "skippedApplyProximitySettings");

}

- (void)applySettings
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  SASProximityInformation *v5;
  id v6;
  SASProximityInformation *v7;
  id v8;
  uint64_t v9;
  SASProximityInformation *v10;
  id v11;
  id v12;
  BYPreferencesController *v13;
  NSObject *v14;
  os_log_type_t v15;
  SASProximityInformation *v16;
  id v17;
  uint64_t v18;
  SASProximityInformation *v19;
  id v20;
  id v21;
  SASProximityInformation *v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  SASProximityInformation *v26;
  id v27;
  uint64_t v28;
  SASProximityInformation *v29;
  id v30;
  int v31;
  uint64_t v32;
  SASProximityInformation *v33;
  const __CFString *v34;
  SASProximityInformation *v35;
  uint64_t v36;
  SASProximityInformation *v37;
  id v38;
  SASProximityInformation *v39;
  id v40;
  SASProximityInformation *v41;
  id v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  BYBackupMetadata *v46;
  unsigned __int8 v47;
  uint64_t v48;
  BYBackupMetadata *v49;
  id v50;
  BYBackupMetadata *v51;
  BYPreferencesController *v52;
  NSObject *v53;
  os_log_type_t v54;
  SASProximityInformation *v55;
  id v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  SASProximityInformation *v60;
  id v61;
  NSObject *v62;
  os_log_type_t v63;
  SASProximityInformation *v64;
  id v65;
  unsigned __int8 v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  id v70;
  NSObject *v71;
  id v72;
  uint64_t v73;
  NSString *v74;
  id v75;
  id v76;
  uint64_t v77;
  NSString *v78;
  id v79;
  id v80;
  uint64_t v81;
  NSString *v82;
  char v83;
  NSString *v84;
  char v85;
  id v86;
  os_log_t v87;
  char v88;
  id v89;
  char v90;
  id v91;
  os_log_type_t v92;
  os_log_t oslog;
  id v94;
  char v95;
  id v96;
  char v97;
  id v98;
  os_log_type_t v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  uint8_t v105[7];
  os_log_type_t v106;
  id v107;
  uint8_t v108[7];
  os_log_type_t v109;
  id v110;
  uint8_t v111[7];
  os_log_type_t v112;
  id v113;
  uint8_t v114[7];
  os_log_type_t v115;
  id v116;
  os_log_type_t v117;
  id v118;
  uint8_t v119[15];
  os_log_type_t v120;
  id v121;
  os_log_type_t v122;
  id v123;
  os_log_type_t v124;
  id v125;
  os_log_type_t v126;
  id v127;
  int v128;
  uint8_t v129[7];
  os_log_type_t v130;
  id v131;
  os_log_type_t v132;
  id v133;
  uint8_t v134[15];
  os_log_type_t v135;
  id v136;
  os_log_type_t v137;
  id v138;
  id v139;
  os_log_type_t v140;
  id v141;
  uint8_t buf[7];
  os_log_type_t v143;
  os_log_t location[2];
  ProximitySetupController *v145;
  uint8_t v146[16];
  uint8_t v147[16];
  uint8_t v148[16];
  uint8_t v149[16];
  uint8_t v150[32];
  uint8_t v151[16];
  uint8_t v152[16];
  uint8_t v153[16];
  uint8_t v154[16];
  uint8_t v155[24];

  v145 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v143 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v143;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Applying settings from proximity setup...", buf, 2u);
  }
  objc_storeStrong((id *)location, 0);
  v141 = (id)_BYLoggingFacility(v4);
  v140 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v141, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[ProximitySetupController information](v145, "information");
    v6 = -[SASProximityInformation localePreferences](v5, "localePreferences");
    sub_100038C28((uint64_t)v155, (uint64_t)v6);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v141, v140, "Setting the locale preferences to %@", v155, 0xCu);

  }
  objc_storeStrong(&v141, 0);
  v7 = -[ProximitySetupController information](v145, "information");
  v8 = -[SASProximityInformation localePreferences](v7, "localePreferences");

  if (v8)
  {
    v10 = -[ProximitySetupController information](v145, "information");
    v11 = -[SASProximityInformation localePreferences](v10, "localePreferences");
    +[NSLocale setArchivedPreferences:](NSLocale, "setArchivedPreferences:", v11);

    v139 = (id)CFPreferencesCopyValue(CFSTR("AppleLocale"), kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    v138 = (id)_BYLoggingFacility(v139);
    v137 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v138, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)v154, (uint64_t)v139);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v138, v137, "Setting the locale to %@", v154, 0xCu);
    }
    objc_storeStrong(&v138, 0);
    v12 = +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    objc_msgSend(v12, "setValue:forKey:", v139, 3);

    v13 = -[ProximitySetupController buddyPreferences](v145, "buddyPreferences");
    -[BYPreferencesController setObject:forKey:](v13, "setObject:forKey:", v139, CFSTR("Locale"));

    objc_storeStrong(&v139, 0);
  }
  else
  {
    v136 = (id)_BYLoggingFacility(v9);
    v135 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v136, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v136;
      v15 = v135;
      sub_100038C3C(v134);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "No data received for locale preferences. Proximity data source obsolete.", v134, 2u);
    }
    objc_storeStrong(&v136, 0);
  }
  v16 = -[ProximitySetupController information](v145, "information");
  v17 = -[SASProximityInformation keyboards](v16, "keyboards");

  if (v17)
  {
    v133 = (id)_BYLoggingFacility(v18);
    v132 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v133, OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[ProximitySetupController information](v145, "information");
      v20 = -[SASProximityInformation keyboards](v19, "keyboards");
      sub_100038C28((uint64_t)v153, (uint64_t)v20);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v133, v132, "Setting the keyboards to %@", v153, 0xCu);

    }
    objc_storeStrong(&v133, 0);
    v21 = +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v22 = -[ProximitySetupController information](v145, "information");
    v23 = -[SASProximityInformation keyboards](v22, "keyboards");
    objc_msgSend(v21, "saveInputModes:", v23);

  }
  else
  {
    v131 = (id)_BYLoggingFacility(v18);
    v130 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v131, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v131;
      v25 = v130;
      sub_100038C3C(v129);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "No data received for keyboards...", v129, 2u);
    }
    objc_storeStrong(&v131, 0);
  }
  v26 = -[ProximitySetupController information](v145, "information");
  v27 = -[SASProximityInformation timeZone](v26, "timeZone");

  if (v27)
  {
    v29 = -[ProximitySetupController information](v145, "information");
    v30 = objc_retainAutorelease(-[SASProximityInformation timeZone](v29, "timeZone"));
    v31 = tzlink(objc_msgSend(v30, "UTF8String"));

    v128 = v31;
    if (v31)
    {
      v123 = (id)_BYLoggingFacility(v32);
      v122 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v123, OS_LOG_TYPE_DEFAULT))
      {
        v41 = -[ProximitySetupController information](v145, "information");
        v42 = -[SASProximityInformation timeZone](v41, "timeZone");
        v43 = strerror(v128);
        sub_10015C454((uint64_t)v150, (uint64_t)v42, (uint64_t)v43);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v123, v122, "Failed to change time zone to %@ - %s", v150, 0x16u);

      }
      objc_storeStrong(&v123, 0);
    }
    else
    {
      v127 = (id)_BYLoggingFacility(v32);
      v126 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v127, OS_LOG_TYPE_DEFAULT))
      {
        v33 = -[ProximitySetupController information](v145, "information");
        if ((-[SASProximityInformation automaticTimeZoneEnabled](v33, "automaticTimeZoneEnabled") & 1) != 0)
          v34 = CFSTR("enabled");
        else
          v34 = CFSTR("disabled");
        sub_100038C28((uint64_t)v152, (uint64_t)v34);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v127, v126, "Setting automatic time zone setting to %@", v152, 0xCu);

      }
      objc_storeStrong(&v127, 0);
      v35 = -[ProximitySetupController information](v145, "information");
      TMSetAutomaticTimeZoneEnabled((unint64_t)-[SASProximityInformation automaticTimeZoneEnabled](v35, "automaticTimeZoneEnabled") & 1);

      v125 = (id)_BYLoggingFacility(v36);
      v124 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v125, OS_LOG_TYPE_DEFAULT))
      {
        v37 = -[ProximitySetupController information](v145, "information");
        v38 = -[SASProximityInformation timeZone](v37, "timeZone");
        sub_100038C28((uint64_t)v151, (uint64_t)v38);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v125, v124, "Setting the time zone to %@...", v151, 0xCu);

      }
      objc_storeStrong(&v125, 0);
      v39 = -[ProximitySetupController information](v145, "information");
      v40 = -[SASProximityInformation timeZone](v39, "timeZone");
      CFPreferencesSetAppValue(CFSTR("timezone"), v40, CFSTR("com.apple.preferences.datetime"));

      CFPreferencesSetAppValue(CFSTR("timezoneset"), kCFBooleanTrue, CFSTR("com.apple.preferences.datetime"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.preferences.datetime"));
      +[NSTimeZone resetSystemTimeZone](NSTimeZone, "resetSystemTimeZone");
    }
  }
  else
  {
    v121 = (id)_BYLoggingFacility(v28);
    v120 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v121, OS_LOG_TYPE_DEFAULT))
    {
      v44 = v121;
      v45 = v120;
      sub_100038C3C(v119);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "No data received for time zone...", v119, 2u);
    }
    objc_storeStrong(&v121, 0);
  }
  v46 = -[ProximitySetupController backupMetadata](v145, "backupMetadata");
  v47 = -[BYBackupMetadata hasUserInterfaceStyleMode](v46, "hasUserInterfaceStyleMode");

  if ((v47 & 1) != 0)
  {
    v118 = (id)_BYLoggingFacility(v48);
    v117 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v118, OS_LOG_TYPE_DEFAULT))
    {
      v49 = -[ProximitySetupController backupMetadata](v145, "backupMetadata");
      sub_1000342B4((uint64_t)v149, (uint64_t)-[BYBackupMetadata userInterfaceStyleMode](v49, "userInterfaceStyleMode"));
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v118, v117, "Applying settings from proximity setup for appearance %lli ...", v149, 0xCu);

    }
    objc_storeStrong(&v118, 0);
    v50 = objc_msgSend(objc_alloc((Class)UISUserInterfaceStyleMode), "initWithDelegate:", 0);
    v51 = -[ProximitySetupController backupMetadata](v145, "backupMetadata");
    objc_msgSend(v50, "setModeValue:", -[BYBackupMetadata userInterfaceStyleMode](v51, "userInterfaceStyleMode"));

    v52 = -[ProximitySetupController buddyPreferences](v145, "buddyPreferences");
    -[BYPreferencesController setObject:forKey:](v52, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("UserInterfaceStyleModePresented"));

  }
  else
  {
    v116 = (id)_BYLoggingFacility(v48);
    v115 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v116, OS_LOG_TYPE_DEFAULT))
    {
      v53 = v116;
      v54 = v115;
      sub_100038C3C(v114);
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "No data received for appearance settings...", v114, 2u);
    }
    objc_storeStrong(&v116, 0);
  }
  v55 = -[ProximitySetupController information](v145, "information");
  v56 = -[SASProximityInformation accessibilitySettings](v55, "accessibilitySettings");

  if (v56)
  {
    v113 = (id)_BYLoggingFacility(v57);
    v112 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v113, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v113;
      v59 = v112;
      sub_100038C3C(v111);
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "Applying accessibility settings...", v111, 2u);
    }
    objc_storeStrong(&v113, 0);
    v60 = -[ProximitySetupController information](v145, "information");
    v61 = -[SASProximityInformation accessibilitySettings](v60, "accessibilitySettings");
    _AXSRestoreSettingsFromDataBlobForBuddy(v61);

  }
  else
  {
    v110 = (id)_BYLoggingFacility(v57);
    v109 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v110, OS_LOG_TYPE_DEFAULT))
    {
      v62 = v110;
      v63 = v109;
      sub_100038C3C(v108);
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "No data received for accessibility settings...", v108, 2u);
    }
    objc_storeStrong(&v110, 0);
  }
  v64 = -[ProximitySetupController information](v145, "information");
  v65 = -[SASProximityInformation allowMoreOn5G](v64, "allowMoreOn5G");
  v66 = objc_msgSend(v65, "BOOLValue");

  if ((v66 & 1) != 0)
  {
    v107 = (id)_BYLoggingFacility(v67);
    v106 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v107, OS_LOG_TYPE_DEFAULT))
    {
      v68 = v107;
      v69 = v106;
      sub_100038C3C(v105);
      _os_log_impl((void *)&_mh_execute_header, v68, v69, "Enabling Allow More on 5G...", v105, 2u);
    }
    objc_storeStrong(&v107, 0);
    v70 = objc_alloc((Class)CoreTelephonyClient);
    v71 = dispatch_get_global_queue(0, 0);
    v104 = objc_msgSend(v70, "initWithQueue:", v71);

    v103 = 0;
    v101 = 0;
    v72 = objc_msgSend(v104, "getCurrentDataSubscriptionContextSync:", &v101);
    objc_storeStrong(&v103, v101);
    v102 = v72;
    if (v103)
    {
      v100 = (id)_BYLoggingFacility(v73);
      v99 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v100, OS_LOG_TYPE_ERROR))
      {
        v97 = 0;
        v95 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v74 = (NSString *)v103;
        }
        else if (v103)
        {
          v98 = objc_msgSend(v103, "domain");
          v97 = 1;
          v74 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v98, objc_msgSend(v103, "code"));
          v96 = v74;
          v95 = 1;
        }
        else
        {
          v74 = 0;
        }
        sub_100039500((uint64_t)v148, (uint64_t)v74);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v100, v99, "Failed to get data subscription context: %{public}@", v148, 0xCu);
        if ((v95 & 1) != 0)

        if ((v97 & 1) != 0)
      }
      objc_storeStrong(&v100, 0);
    }
    v94 = +[CTServiceDescriptor descriptorWithSubscriptionContext:](CTServiceDescriptor, "descriptorWithSubscriptionContext:", v102);
    v75 = objc_msgSend(v104, "setLowDataMode:enable:", v94, 0);
    v76 = v103;
    v103 = v75;

    if (v103)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v77);
      v92 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v90 = 0;
        v88 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v78 = (NSString *)v103;
        }
        else if (v103)
        {
          v91 = objc_msgSend(v103, "domain");
          v90 = 1;
          v78 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v91, objc_msgSend(v103, "code"));
          v89 = v78;
          v88 = 1;
        }
        else
        {
          v78 = 0;
        }
        sub_100039500((uint64_t)v147, (uint64_t)v78);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v92, "Failed to set low data mode: %{public}@", v147, 0xCu);
        if ((v88 & 1) != 0)

        if ((v90 & 1) != 0)
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    v79 = objc_msgSend(v104, "setInterfaceCost:expensive:", v94, 0);
    v80 = v103;
    v103 = v79;

    if (v103)
    {
      v87 = (os_log_t)(id)_BYLoggingFacility(v81);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        v85 = 0;
        v83 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v82 = (NSString *)v103;
        }
        else if (v103)
        {
          v86 = objc_msgSend(v103, "domain");
          v85 = 1;
          v82 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v86, objc_msgSend(v103, "code"));
          v84 = v82;
          v83 = 1;
        }
        else
        {
          v82 = 0;
        }
        sub_100039500((uint64_t)v146, (uint64_t)v82);
        _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "Failed to set interface cost: %{public}@", v146, 0xCu);
        if ((v83 & 1) != 0)

        if ((v85 & 1) != 0)
      }
      objc_storeStrong((id *)&v87, 0);
    }
    objc_storeStrong(&v94, 0);
    objc_storeStrong(&v102, 0);
    objc_storeStrong(&v103, 0);
    objc_storeStrong(&v104, 0);
  }
  -[ProximitySetupController setHasAppliedSettings:](v145, "setHasAppliedSettings:", 1);
  -[ProximitySetupController didApplySettings](v145, "didApplySettings");
}

- (void)startiCloudBackup
{
  SASProximitySession *v2;
  id v3;
  id location[2];
  ProximitySetupController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)SASProximityBackupAction);
  objc_msgSend(location[0], "setShouldStartBackup:", 1);
  v2 = -[ProximitySetupController session](v5, "session");
  v3 = -[SASProximitySession sendAction:](v2, "sendAction:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)addObserver:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  ProximitySetupController *v9;
  id v10;
  id location[2];
  ProximitySetupController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[ProximitySetupController observerQueue](v12, "observerQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10015C5E8;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)removeObserver:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  ProximitySetupController *v9;
  id v10;
  id location[2];
  ProximitySetupController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[ProximitySetupController observerQueue](v12, "observerQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10015C728;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)notifyObserversConnectionTerminated
{
  OS_dispatch_queue *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  ProximitySetupController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[ProximitySetupController observerQueue](self, "observerQueue");
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10015C824;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (BOOL)_allowedToPair
{
  NSString *v2;
  id v4[2];
  ProximitySetupController *v5;
  char v6;

  v5 = self;
  v4[1] = (id)a2;
  if (-[ProximitySetupController intentToMigrate](self, "intentToMigrate"))
  {
    v4[0] = (id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
    v2 = -[ProximitySetupController deviceClass](v5, "deviceClass");
    v6 = +[BuddyMigrationCapability isMigrationSupportedFromDeviceClass:toDeviceClass:reason:](BuddyMigrationCapability, "isMigrationSupportedFromDeviceClass:toDeviceClass:reason:", v2, v4[0], 0);

    objc_storeStrong(v4, 0);
  }
  else
  {
    v6 = 1;
  }
  return v6 & 1;
}

- (void)_updatedMessageSession:(id)a3
{
  id v3;
  SASProximitySession *v4;
  SASProximitySession *v5;
  id location[2];
  ProximitySetupController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = -[ProximitySetupController session](v7, "session");
  -[SASProximitySession setSharingMessageSession:](v4, "setSharingMessageSession:", v3);

  v5 = -[ProximitySetupController session](v7, "session");
  -[SASProximitySession activate](v5, "activate");

  objc_storeStrong(location, 0);
}

- (void)_setConnected:(BOOL)a3
{
  SASProximitySession *v3;
  SASProximitySession *v4;

  -[ProximitySetupController setDisconnecting:](self, "setDisconnecting:", 0);
  v3 = -[ProximitySetupController session](self, "session");
  -[SASProximitySession setConnected:](v3, "setConnected:", a3);

  if (!a3)
  {
    v4 = -[ProximitySetupController session](self, "session");
    -[SASProximitySession setSharingMessageSession:](v4, "setSharingMessageSession:", 0);

  }
}

+ (BOOL)_supportsDependentSetup:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  char v7;
  id v8;
  id location[3];
  BOOL v10;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "productVersion");
  v4 = objc_msgSend(v3, "compare:options:", CFSTR("16"), 64);
  v7 = 0;
  v5 = 0;
  if (v4 != (id)-1)
  {
    v8 = objc_msgSend(location[0], "appleID");
    v7 = 1;
    v5 = v8 != 0;
  }
  v10 = v5;
  if ((v7 & 1) != 0)

  objc_storeStrong(location, 0);
  return v10;
}

- (void)_setSetupIntent
{
  BuddySetupMethod *v2;

  v2 = -[ProximitySetupController setupMethod](self, "setupMethod", a2, self);
  -[BuddySetupMethod setIntent:](v2, "setIntent:", 1);

}

- (void)proximitySetupCompleted:(id)a3
{
  uint64_t v3;
  NSString *v4;
  char v5;
  NSString *v6;
  char v7;
  id v8;
  os_log_t oslog;
  id location[3];
  uint8_t buf[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v5 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v4 = (NSString *)location[0];
      }
      else if (location[0])
      {
        v8 = objc_msgSend(location[0], "domain");
        v7 = 1;
        v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v8, objc_msgSend(location[0], "code"));
        v6 = v4;
        v5 = 1;
      }
      else
      {
        v4 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v4);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Proximity setup failed with error: %{public}@", buf, 0xCu);
      if ((v5 & 1) != 0)

      if ((v7 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)displayProximityPinCode:(id)a3 visual:(BOOL)a4
{
  _BOOL8 v5;
  NSObject *v6;
  os_log_type_t v7;
  void (**v8)(id, _QWORD);
  _BOOL8 v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  ProximitySetupController *v19;
  id v20;
  BOOL v21;
  uint8_t v22[7];
  os_log_type_t v23;
  os_log_t oslog;
  void **block;
  int v26;
  int v27;
  void (*v28)(uint64_t);
  void *v29;
  ProximitySetupController *v30;
  int v31;
  uint8_t buf[7];
  os_log_type_t v33;
  id v34;
  BOOL v35;
  id location[2];
  ProximitySetupController *v37;

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = a4;
  v5 = -[ProximitySetupController _isWaitingForReconnection](v37, "_isWaitingForReconnection");
  if (v5)
  {
    v34 = (id)_BYLoggingFacility(v5);
    v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v34;
      v7 = v33;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "DisplayProximityPinCode called while reconnecting session. Abort proximity setup...", buf, 2u);
    }
    objc_storeStrong(&v34, 0);
    v8 = (void (**)(id, _QWORD))-[ProximitySetupController resumeBlock](v37, "resumeBlock");
    v8[2](v8, 0);

    -[ProximitySetupController endPairing](v37, "endPairing");
    v31 = 1;
  }
  else
  {
    v9 = -[ProximitySetupController _allowedToPair](v37, "_allowedToPair");
    if (v9)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v9);
      v23 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = oslog;
        v12 = v23;
        sub_100038C3C(v22);
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Displaying pairing code to user...", v22, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v13 = &_dispatch_main_q;
      v14 = _NSConcreteStackBlock;
      v15 = -1073741824;
      v16 = 0;
      v17 = sub_10015D140;
      v18 = &unk_100280FB0;
      v19 = v37;
      v20 = location[0];
      v21 = v35;
      dispatch_async((dispatch_queue_t)v13, &v14);

      objc_storeStrong(&v20, 0);
      objc_storeStrong((id *)&v19, 0);
      v31 = 0;
    }
    else
    {
      v10 = &_dispatch_main_q;
      block = _NSConcreteStackBlock;
      v26 = -1073741824;
      v27 = 0;
      v28 = sub_10015D0D0;
      v29 = &unk_100280730;
      v30 = v37;
      dispatch_async((dispatch_queue_t)v10, &block);

      -[ProximitySetupController endPairing](v37, "endPairing");
      v31 = 1;
      objc_storeStrong((id *)&v30, 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (void)dismissProximityPinCode
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  void **block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  ProximitySetupController *v10;
  uint8_t buf[7];
  os_log_type_t v12;
  id location[2];
  ProximitySetupController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v12;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Dismissing pairing code...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  -[ProximitySetupController resetInformation](v14, "resetInformation");
  v4 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_10015D42C;
  v9 = &unk_100280730;
  v10 = v14;
  dispatch_async((dispatch_queue_t)v4, &block);

  objc_storeStrong((id *)&v10, 0);
}

- (void)proximityConnectionPreparing:(id)a3
{
  id location[2];
  ProximitySetupController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ProximitySetupController _updatedMessageSession:](v4, "_updatedMessageSession:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)proximityConnectionInitiated
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  ProximitySetupController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Proximity connection initiated...", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[ProximitySetupController _setConnected:](v7, "_setConnected:", 1);
}

- (id)performHandshake
{
  NSObject *v2;
  os_log_type_t v3;
  SASProximitySession *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  _WORD v14[7];
  os_log_type_t v15;
  os_log_t v16;
  os_log_type_t v17;
  os_log_t v18;
  id location;
  uint8_t buf[15];
  os_log_type_t v21;
  os_log_t oslog;
  id v23[2];
  ProximitySetupController *v24;
  uint8_t v25[24];

  v24 = self;
  v23[1] = (id)a2;
  v23[0] = 0;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog;
    v3 = v21;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Handshaking with source device...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  location = objc_alloc_init((Class)SASProximityHandshakeAction);
  v4 = -[ProximitySetupController session](v24, "session");
  v5 = -[SASProximitySession sendAction:](v4, "sendAction:", location);
  v6 = v23[0];
  v23[0] = v5;

  if (v23[0])
  {
    v18 = (os_log_t)(id)_BYLoggingFacility(v7);
    v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)v25, (uint64_t)v23[0]);
      _os_log_impl((void *)&_mh_execute_header, v18, v17, "Failed to handshake - %@", v25, 0xCu);
    }
    objc_storeStrong((id *)&v18, 0);
  }
  else
  {
    v8 = objc_msgSend(location, "handshake");
    -[ProximitySetupController setHandshake:](v24, "setHandshake:", v8);

    v16 = (os_log_t)(id)_BYLoggingFacility(v9);
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v16;
      v11 = v15;
      sub_100038C3C(v14);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Handshake complete!", (uint8_t *)v14, 2u);
    }
    objc_storeStrong((id *)&v16, 0);
  }
  v12 = v23[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v23, 0);
  return v12;
}

- (void)readyForInformation
{
  NSObject *v2;
  os_log_type_t v3;
  SASProximitySession *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  SASProximitySession *v9;
  id v10;
  id v11;
  NSString *v12;
  NSString *v13;
  unsigned __int8 v14;
  void *v15;
  ProximitySetupController *v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, uint64_t);
  NSObject *v21;
  os_log_type_t v22;
  ProximitySetupController *v23;
  void **v24;
  int v25;
  int v26;
  id (*v27)(uint64_t);
  void *v28;
  ProximitySetupController *v29;
  uint8_t v30[7];
  os_log_type_t v31;
  os_log_t oslog;
  int v33;
  void **block;
  int v35;
  int v36;
  void (*v37)(uint64_t);
  void *v38;
  ProximitySetupController *v39;
  char v40;
  id v41;
  uint8_t v42[7];
  char v43;
  id v44;
  uint8_t buf[7];
  os_log_type_t v46;
  id location[2];
  ProximitySetupController *v48;

  v48 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v46 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v46;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Requesting information from source device...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  v4 = -[ProximitySetupController session](v48, "session");
  v5 = -[SASProximitySession isConnected](v4, "isConnected") & 1;

  if (!v5)
  {
    v44 = (id)_BYLoggingFacility(v6);
    v43 = 16;
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
    {
      v7 = v44;
      v8 = v43;
      sub_100038C3C(v42);
      _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "ProximitySetupController should have valid connection since we are ready for information.", v42, 2u);
    }
    objc_storeStrong(&v44, 0);
  }
  -[ProximitySetupController _setSetupIntent](v48, "_setSetupIntent");
  v41 = objc_alloc_init((Class)SASProximityInformationAction);
  v9 = -[ProximitySetupController session](v48, "session");
  v10 = -[SASProximitySession sendAction:](v9, "sendAction:", v41);

  if (!-[ProximitySetupController intentToMigrate](v48, "intentToMigrate"))
    goto LABEL_10;
  v11 = objc_msgSend(v41, "information");
  v12 = -[ProximitySetupController productVersion](v48, "productVersion");
  v13 = -[ProximitySetupController deviceClass](v48, "deviceClass");
  v14 = +[BuddyMigrationCapability sourceDeviceSupportsMigration:productVersion:deviceClass:softwareUpdateRequired:reason:](BuddyMigrationCapability, "sourceDeviceSupportsMigration:productVersion:deviceClass:softwareUpdateRequired:reason:", v11, v12, v13, 0, 0);

  v40 = v14 & 1;
  if ((v14 & 1) != 0)
  {
LABEL_10:
    v16 = v48;
    v17 = objc_msgSend(v41, "information");
    -[ProximitySetupController updateInformation:](v16, "updateInformation:", v17);

    v18 = -[ProximitySetupController resumeBlock](v48, "resumeBlock");
    if (v18)
    {
      v20 = (void (**)(id, uint64_t))-[ProximitySetupController resumeBlock](v48, "resumeBlock");
      v20[2](v20, 1);

      v19 = -[ProximitySetupController setResumeBlock:](v48, "setResumeBlock:", 0);
    }
    oslog = (os_log_t)(id)_BYLoggingFacility(v19);
    v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = oslog;
      v22 = v31;
      sub_100038C3C(v30);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Received information from source device!", v30, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (-[ProximitySetupController shouldApplySettings](v48, "shouldApplySettings"))
    {
      v23 = v48;
      v24 = _NSConcreteStackBlock;
      v25 = -1073741824;
      v26 = 0;
      v27 = sub_10015DC48;
      v28 = &unk_100280730;
      v29 = v48;
      -[ProximitySetupController willApplySettings:](v23, "willApplySettings:", &v24);
      objc_storeStrong((id *)&v29, 0);
    }
    else
    {
      -[ProximitySetupController skippedApplySettings](v48, "skippedApplySettings");
    }
    v33 = 0;
  }
  else
  {
    -[ProximitySetupController setupFinished](v48, "setupFinished");
    v15 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v35 = -1073741824;
    v36 = 0;
    v37 = sub_10015DBFC;
    v38 = &unk_100280730;
    v39 = v48;
    dispatch_async((dispatch_queue_t)v15, &block);

    v33 = 1;
    objc_storeStrong((id *)&v39, 0);
  }
  objc_storeStrong(&v41, 0);
}

- (void)proximityConnectionTerminated
{
  NSObject *v2;
  os_log_type_t v3;
  id location;
  uint8_t buf[7];
  os_log_type_t v6;
  os_log_t oslog[2];
  ProximitySetupController *v8;

  v8 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v6;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Proximity connection has disconnected", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[ProximitySetupController _setConnected:](v8, "_setConnected:", 0);
  -[ProximitySetupController notifyObserversConnectionTerminated](v8, "notifyObserversConnectionTerminated");
  location = -[ProximitySetupController backupMetadata](v8, "backupMetadata");
  -[ProximitySetupController resetInformation](v8, "resetInformation");
  -[ProximitySetupController setBackupMetadataFromTerminatedConnection:](v8, "setBackupMetadataFromTerminatedConnection:", location);
  -[ProximitySetupController endAdvertisingProximitySetup](v8, "endAdvertisingProximitySetup");
  objc_storeStrong(&location, 0);
}

- (void)proximityConnectionReconnected
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  ProximitySetupController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Proximity connection has reconnected", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[ProximitySetupController setShouldApplySettings:](v7, "setShouldApplySettings:", 0);
  -[ProximitySetupController stopReconnecting](v7, "stopReconnecting");
  -[ProximitySetupController _setConnected:](v7, "_setConnected:", 1);
}

- (void)receivedLanguages:(id)a3 locale:(id)a4 model:(id)a5 deviceClass:(id)a6 accessibilitySettings:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  os_log_t v13;
  os_log_type_t v14;
  os_log_t oslog;
  id v16;
  id v17;
  id v18;
  id v19;
  id location[2];
  ProximitySetupController *v21;
  uint8_t v22[32];
  uint8_t buf[24];

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = 0;
  objc_storeStrong(&v17, a6);
  v16 = 0;
  objc_storeStrong(&v16, a7);
  oslog = (os_log_t)(id)_BYLoggingFacility(v11);
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003EB04((uint64_t)buf, (uint64_t)location[0], (uint64_t)v19);
    _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Received language and locale: %@ and %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v13 = (os_log_t)(id)_BYLoggingFacility(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003EB04((uint64_t)v22, (uint64_t)v18, (uint64_t)v17);
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Source device is %@ (%@)", v22, 0x16u);
  }
  objc_storeStrong((id *)&v13, 0);
  -[ProximitySetupController setReceivedLanguages:](v21, "setReceivedLanguages:", location[0]);
  -[ProximitySetupController setReceivedLocale:](v21, "setReceivedLocale:", v19);
  -[ProximitySetupController setModel:](v21, "setModel:", v18);
  -[ProximitySetupController setDeviceClass:](v21, "setDeviceClass:", v17);
  -[ProximitySetupController setAccessibilitySettings:](v21, "setAccessibilitySettings:", v16);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_isWaitingForReconnection
{
  id v2;
  BOOL v3;

  v2 = -[ProximitySetupController resumeBlock](self, "resumeBlock", a2, self);
  v3 = v2 != 0;

  return v3;
}

- (void)ready
{
  NSObject *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[2];
  ProximitySetupController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10015E120;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)receivedBackupAction:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  ProximitySetupController *v9;
  id v10;
  id location[2];
  ProximitySetupController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[ProximitySetupController observerQueue](v12, "observerQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10015E2B4;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_sync(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)pairingEndedByUser
{
  -[ProximitySetupController endPairing](self, "endPairing", a2, self);
}

- (ProximitySetupControllerDelegate)delegate
{
  return (ProximitySetupControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)userSkippedProximity
{
  return self->_userSkippedProximity;
}

- (void)setUserSkippedProximity:(BOOL)a3
{
  self->_userSkippedProximity = a3;
}

- (SASProximityInformation)information
{
  return (SASProximityInformation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInformation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)hasAppliedSettings
{
  return self->_hasAppliedSettings;
}

- (void)setHasAppliedSettings:(BOOL)a3
{
  self->_hasAppliedSettings = a3;
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)receivedLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReceivedLanguages:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)receivedLocale
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setReceivedLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProductVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (SASProximityHandshake)handshake
{
  return (SASProximityHandshake *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHandshake:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)hasValidatedPasscode
{
  return self->_hasValidatedPasscode;
}

- (void)setHasValidatedPasscode:(BOOL)a3
{
  self->_hasValidatedPasscode = a3;
}

- (BOOL)signedIniCloudAccount
{
  return self->_signedIniCloudAccount;
}

- (void)setSignedIniCloudAccount:(BOOL)a3
{
  self->_signedIniCloudAccount = a3;
}

- (BYBackupMetadata)backupMetadataFromTerminatedConnection
{
  return (BYBackupMetadata *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBackupMetadataFromTerminatedConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)skipExpressRestore
{
  return self->_skipExpressRestore;
}

- (void)setSkipExpressRestore:(BOOL)a3
{
  self->_skipExpressRestore = a3;
}

- (BOOL)intentToMigrate
{
  return self->_intentToMigrate;
}

- (void)setIntentToMigrate:(BOOL)a3
{
  self->_intentToMigrate = a3;
}

- (BYExpressSetupDataSource)expressDataSource
{
  return self->_expressDataSource;
}

- (void)setExpressDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_expressDataSource, a3);
}

- (BuddyProximitySetupDependentController)dependentController
{
  return self->_dependentController;
}

- (void)setDependentController:(id)a3
{
  objc_storeStrong((id *)&self->_dependentController, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (NSData)accessibilitySettings
{
  return self->_accessibilitySettings;
}

- (void)setAccessibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilitySettings, a3);
}

- (BYBuddyDaemonProximityTargetClient)client
{
  return (BYBuddyDaemonProximityTargetClient *)objc_getProperty(self, a2, 136, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (SASProximitySession)session
{
  return (SASProximitySession *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (BOOL)hasResumed
{
  return self->_hasResumed;
}

- (void)setHasResumed:(BOOL)a3
{
  self->_hasResumed = a3;
}

- (NSMutableArray)observers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setObserverQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (BOOL)reconnecting
{
  return self->_reconnecting;
}

- (void)setReconnecting:(BOOL)a3
{
  self->_reconnecting = a3;
}

- (BOOL)shouldApplySettings
{
  return self->_shouldApplySettings;
}

- (void)setShouldApplySettings:(BOOL)a3
{
  self->_shouldApplySettings = a3;
}

- (id)resumeBlock
{
  return self->_resumeBlock;
}

- (void)setResumeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
  objc_storeStrong((id *)&self->_setupMethod, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupMethod, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong(&self->_resumeBlock, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_accessibilitySettings, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_dependentController, 0);
  objc_storeStrong((id *)&self->_expressDataSource, 0);
  objc_storeStrong((id *)&self->_backupMetadataFromTerminatedConnection, 0);
  objc_storeStrong((id *)&self->_handshake, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_receivedLocale, 0);
  objc_storeStrong((id *)&self->_receivedLanguages, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_information, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
