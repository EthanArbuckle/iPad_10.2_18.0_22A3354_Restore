@implementation BuddyExpressWelcomeController

- (BuddyExpressWelcomeController)init
{
  NSBundle *v2;
  id v3;
  NSBundle *v4;
  id v5;
  id v6;
  BuddyExpressWelcomeController *v7;
  objc_super v9;
  id v10;
  id v11[2];
  id location;

  location = self;
  v11[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("EXPRESS_SETUP_TITLE"));
  v11[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));

  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("EXPRESS_SETUP_DETAIL"));
  v10 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("Localizable"));

  v6 = location;
  location = 0;
  v9.receiver = v6;
  v9.super_class = (Class)BuddyExpressWelcomeController;
  location = -[BuddyExpressWelcomeController initWithTitle:detailText:icon:](&v9, "initWithTitle:detailText:icon:", v11[0], v10, 0);
  objc_storeStrong(&location, location);
  v7 = (BuddyExpressWelcomeController *)location;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  BuddyExpressWelcomeController *v2;
  NSBundle *v3;
  NSString *v4;
  BuddyExpressWelcomeController *v5;
  NSBundle *v6;
  NSString *v7;
  id v8;
  BuddyExpressWelcomeController *v9;
  BYExpressSetupDataProvider *v10;
  BYExpressSetupDataSource *v11;
  id v12;
  id v13;
  NSArray *v14;
  NSUInteger v15;
  BuddyExpressWelcomeController *v16;
  BYExpressSetupDataProvider *v17;
  id v18;
  objc_super v19;
  SEL v20;
  BuddyExpressWelcomeController *v21;

  v21 = self;
  v20 = a2;
  v19.receiver = self;
  v19.super_class = (Class)BuddyExpressWelcomeController;
  -[BuddyExpressWelcomeController viewDidLoad](&v19, "viewDidLoad");
  v2 = v21;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v2, "addBoldButton:action:", v4, "continueTapped");

  v5 = v21;
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("CUSTOMIZE"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addLinkButton:action:](v5, "addLinkButton:action:", v7, "customizeTapped");

  v8 = -[BuddyExpressWelcomeController headerView](v21, "headerView");
  v9 = v21;
  v10 = -[BuddyExpressWelcomeController expressSetupDataProvider](v21, "expressSetupDataProvider");
  v11 = -[BYExpressSetupDataProvider resolvedDataSource](v10, "resolvedDataSource");
  v12 = -[BYExpressSetupDataSource sourceDeviceClass](v11, "sourceDeviceClass");
  v13 = -[BuddyExpressWelcomeController _detailForDataSourceDeviceClass:](v9, "_detailForDataSourceDeviceClass:", v12);
  objc_msgSend(v8, "setDetailText:", v13);

  v14 = -[BuddyExpressWelcomeController privacyIdentifiers](v21, "privacyIdentifiers");
  v15 = -[NSArray count](v14, "count");

  if (v15)
    -[BuddyExpressWelcomeController _addLearnMoreButton](v21, "_addLearnMoreButton");
  v16 = v21;
  v17 = -[BuddyExpressWelcomeController expressSetupDataProvider](v21, "expressSetupDataProvider");
  v18 = -[BYExpressSetupDataProvider expressSetupFeatures](v17, "expressSetupFeatures");
  -[BuddyExpressWelcomeController _addFeatureCardsForFeatures:](v16, "_addFeatureCardsForFeatures:", v18);

}

- (void)viewDidAppear:(BOOL)a3
{
  BuddyMiscState *v3;
  BYExpressSetupDataProvider *v4;
  BuddyPendingRestoreState *v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  BuddyExpressWelcomeController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyExpressWelcomeController;
  -[BuddyExpressWelcomeController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v3 = -[BuddyExpressWelcomeController miscState](v9, "miscState");
  -[BuddyMiscState setUserChoseExpress:](v3, "setUserChoseExpress:", 0);

  v4 = -[BuddyExpressWelcomeController expressSetupDataProvider](v9, "expressSetupDataProvider");
  -[BYExpressSetupDataProvider revertExpressSettings](v4, "revertExpressSettings");

  v5 = -[BuddyExpressWelcomeController pendingRestoreState](v9, "pendingRestoreState");
  -[BuddyPendingRestoreState setAttemptedBackupItem:](v5, "setAttemptedBackupItem:", 0);

}

- (void)continueTapped
{
  id v2;
  id v3;
  objc_class *v4;
  NSString *v5;
  NSObject *v6;
  BuddyExpressWelcomeController *v7;
  BYExpressSetupDataProvider *v8;
  void **block;
  int v10;
  int v11;
  void (*v12)(id *);
  void *v13;
  id v14[2];
  BuddyExpressWelcomeController *v15;

  v15 = self;
  v14[1] = (id)a2;
  v2 = -[BuddyExpressWelcomeController view](self, "view");
  v3 = objc_msgSend(v2, "window");
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  v4 = (objc_class *)objc_opt_class(v15);
  v5 = NSStringFromClass(v4);
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v15, v5);

  v6 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_100096A58;
  v13 = &unk_100280730;
  v14[0] = v15;
  dispatch_async(v6, &block);

  v7 = v15;
  v8 = -[BuddyExpressWelcomeController expressSetupDataProvider](v15, "expressSetupDataProvider");
  -[BuddyExpressWelcomeController _recordAnalyticsEventForDataProvider:presented:customized:](v7, "_recordAnalyticsEventForDataProvider:presented:customized:", v8, 1, 0);

  objc_storeStrong(v14, 0);
}

- (void)customizeTapped
{
  NSObject *v2;
  os_log_type_t v3;
  BuddyExpressWelcomeController *v4;
  BYExpressSetupDataProvider *v5;
  BFFFlowItemDelegate *v6;
  _WORD v7[3];
  os_log_type_t v8;
  os_log_t oslog[2];
  BuddyExpressWelcomeController *v10;

  v10 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v8;
    sub_100038C3C(v7);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Customize express settings", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = v10;
  v5 = -[BuddyExpressWelcomeController expressSetupDataProvider](v10, "expressSetupDataProvider");
  -[BuddyExpressWelcomeController _recordAnalyticsEventForDataProvider:presented:customized:](v4, "_recordAnalyticsEventForDataProvider:presented:customized:", v5, 1, 1);

  v6 = -[BuddyWelcomeController delegate](v10, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v6, "flowItemDone:", v10);

}

- (void)createDataProvider:(id)a3
{
  BYExpressSetupDataProvider *v3;
  BYChronicle *v4;
  BuddyDisplayZoomExecutor *v5;
  BYCapabilities *v6;
  BFFSettingsManager *v7;
  BYPreferencesController *v8;
  BYPreferencesController *v9;
  MCProfileConnection *v10;
  BYDeviceProvider *v11;
  BuddyMiscState *v12;
  BuddyPendingRestoreState *v13;
  RestorableBackupItem *v14;
  unsigned __int8 v15;
  BuddyExpressWelcomeController *v16;
  void **v17;
  int v18;
  int v19;
  void (*v20)(id *);
  void *v21;
  id v22;
  id v23;
  char v24;
  id v25;
  char v26;
  id v27;
  id v28;
  id location[2];
  BuddyExpressWelcomeController *v30;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [BYExpressSetupDataProvider alloc];
  v4 = -[BuddyExpressWelcomeController chronicle](v30, "chronicle");
  v5 = -[BuddyExpressWelcomeController displayZoomExecutor](v30, "displayZoomExecutor");
  v6 = -[BuddyExpressWelcomeController capabilities](v30, "capabilities");
  v7 = -[BuddyExpressWelcomeController settingsManager](v30, "settingsManager");
  v8 = -[BuddyExpressWelcomeController buddyPreferences](v30, "buddyPreferences");
  v9 = -[BuddyExpressWelcomeController buddyPreferencesExcludedFromBackup](v30, "buddyPreferencesExcludedFromBackup");
  v10 = -[BuddyExpressWelcomeController managedConfiguration](v30, "managedConfiguration");
  v11 = -[BuddyExpressWelcomeController deviceProvider](v30, "deviceProvider");
  v28 = -[BYExpressSetupDataProvider initWithChronicle:displayZoomExecutor:capabilities:settingsManager:buddyPreferences:buddyPreferencesExcludedFromBackup:managedConfiguration:deviceProvider:](v3, "initWithChronicle:displayZoomExecutor:capabilities:settingsManager:buddyPreferences:buddyPreferencesExcludedFromBackup:managedConfiguration:deviceProvider:", v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = -[BuddyExpressWelcomeController miscState](v30, "miscState");
  objc_msgSend(v28, "setMiscState:", v12);

  v13 = -[BuddyExpressWelcomeController pendingRestoreState](v30, "pendingRestoreState");
  v14 = -[BuddyPendingRestoreState backupItem](v13, "backupItem");
  v26 = 0;
  v24 = 0;
  v15 = 1;
  if (!v14)
  {
    v27 = -[BuddyExpressWelcomeController miscState](v30, "miscState");
    v26 = 1;
    v25 = objc_msgSend(v27, "migrationManager");
    v24 = 1;
    v15 = objc_msgSend(v25, "migrationInProgressOrCompleted");
  }
  objc_msgSend(v28, "setWillRestoreOrMigrate:", v15 & 1);
  if ((v24 & 1) != 0)

  if ((v26 & 1) != 0)
  v16 = v30;
  v17 = _NSConcreteStackBlock;
  v18 = -1073741824;
  v19 = 0;
  v20 = sub_100097038;
  v21 = &unk_1002806E0;
  v22 = v28;
  v23 = location[0];
  -[BuddyExpressWelcomeController _populateDataSourcesForDataProvider:completion:](v16, "_populateDataSourcesForDataProvider:completion:", v28, &v17);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)createBackupDataSource:(id)a3
{
  BuddyPendingRestoreState *v3;
  RestorableBackupItem *v4;
  BOOL v5;
  NSObject *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  BuddyExpressWelcomeController *v12;
  id v13;
  int v14;
  id location[2];
  BuddyExpressWelcomeController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyExpressWelcomeController pendingRestoreState](v16, "pendingRestoreState");
  v4 = -[BuddyPendingRestoreState backupItem](v3, "backupItem");
  v5 = v4 == 0;

  if (v5)
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
    v10 = sub_100097278;
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

- (unint64_t)dataTransferMethod
{
  BuddySetupMethod *v2;
  unint64_t v3;
  unint64_t v5;

  v2 = -[BuddyExpressWelcomeController setupMethod](self, "setupMethod");
  v3 = -[BuddySetupMethod dataTransferMethod](v2, "dataTransferMethod");

  switch(v3)
  {
    case 0uLL:
      v5 = 0;
      break;
    case 1uLL:
      v5 = 1;
      break;
    case 2uLL:
      v5 = 3;
      break;
    case 3uLL:
      v5 = 4;
      break;
    default:
      return v5;
  }
  return v5;
}

- (void)createWalletProvisionalContextUsingDataProvider:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(NSObject *, void *);
  void *v11;
  id v12;
  id v13;
  id v14;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v5 = objc_msgSend(location[0], "resolvedDataSource");
  v13 = objc_msgSend(v5, "walletMetadata");

  v6 = objc_msgSend(sub_100097560(), "sharedInstance");
  objc_msgSend(v6, "setBackupMetadata:", v13);

  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_10009764C;
  v11 = &unk_100281C08;
  v12 = v14;
  +[BuddyPaymentController setupAssistantExpressProvisioningContext:](BuddyPaymentController, "setupAssistantExpressProvisioningContext:", &v7);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)createCloudDataSource:(id)a3
{
  void **v3;
  int v4;
  int v5;
  void (*v6)(_QWORD *, void *, void *);
  void *v7;
  id v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = objc_alloc_init((Class)SASExpressCloudSettings);
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1000977F4;
  v7 = &unk_100281C30;
  v8 = location[0];
  objc_msgSend(v9, "fetchSettingsWithCompletion:", &v3);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)dateForChosenBackup
{
  BuddyPendingRestoreState *v2;
  RestorableBackupItem *v3;
  BOOL v4;
  BFFBackupDeviceController *v5;
  NSDate *v6;
  BFFBackupDeviceController *v7;
  id v8;
  id v9;
  NSDate *v12;

  v2 = -[BuddyExpressWelcomeController pendingRestoreState](self, "pendingRestoreState");
  v3 = -[BuddyPendingRestoreState backupItem](v2, "backupItem");
  v4 = v3 == 0;

  if (v4)
  {
    v12 = 0;
  }
  else
  {
    v5 = -[BuddyExpressWelcomeController backupDeviceController](self, "backupDeviceController");
    v6 = -[BFFBackupDeviceController completionDate](v5, "completionDate");

    if (v6)
    {
      v7 = -[BuddyExpressWelcomeController backupDeviceController](self, "backupDeviceController");
      v12 = -[BFFBackupDeviceController completionDate](v7, "completionDate");
    }
    else
    {
      v7 = -[BuddyExpressWelcomeController pendingRestoreState](self, "pendingRestoreState");
      v8 = -[BFFBackupDeviceController backupItem](v7, "backupItem");
      v9 = objc_msgSend(v8, "snapshot");
      v12 = (NSDate *)objc_msgSend(v9, "date");

    }
  }
  return v12;
}

- (id)deviceNameForChosenBackup
{
  BuddyPendingRestoreState *v2;
  RestorableBackupItem *v3;
  BOOL v4;
  BuddyPendingRestoreState *v5;
  RestorableBackupItem *v6;
  MBSnapshot *v7;
  id v10;

  v2 = -[BuddyExpressWelcomeController pendingRestoreState](self, "pendingRestoreState");
  v3 = -[BuddyPendingRestoreState backupItem](v2, "backupItem");
  v4 = v3 == 0;

  if (v4)
  {
    v10 = 0;
  }
  else
  {
    v5 = -[BuddyExpressWelcomeController pendingRestoreState](self, "pendingRestoreState");
    v6 = -[BuddyPendingRestoreState backupItem](v5, "backupItem");
    v7 = -[RestorableBackupItem snapshot](v6, "snapshot");
    v10 = -[MBSnapshot deviceName](v7, "deviceName");

  }
  return v10;
}

- (void)_populateDataSourcesForDataProvider:(id)a3 completion:(id)a4
{
  ProximitySetupController *v5;
  BYExpressSetupDataSource *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_signpost_type_t v11;
  os_signpost_id_t v12;
  BuddyExpressWelcomeController *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  os_signpost_type_t v18;
  os_signpost_id_t v19;
  BuddyExpressWelcomeController *v20;
  NSObject *v21;
  void *v22;
  void **block;
  int v24;
  int v25;
  void (*v26)(uint64_t);
  void *v27;
  BuddyExpressWelcomeController *v28;
  id v29;
  id v30;
  void **v31;
  int v32;
  int v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  id v37[3];
  os_log_type_t v38;
  os_log_t oslog;
  __int16 v40;
  uint64_t v41;
  char v42;
  os_log_t log;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void **v48;
  int v49;
  int v50;
  void (*v51)(uint64_t, void *);
  void *v52;
  id v53;
  id v54;
  __int128 v55;
  os_log_type_t v56;
  id v57;
  __int16 buf;
  os_signpost_id_t v59;
  char v60;
  id v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  id location[2];
  BuddyExpressWelcomeController *v67;
  uint8_t v68[16];
  uint8_t v69[24];

  v67 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v65 = 0;
  objc_storeStrong(&v65, a4);
  v5 = -[BuddyExpressWelcomeController proximitySetupController](v67, "proximitySetupController");
  v6 = -[ProximitySetupController expressDataSource](v5, "expressDataSource");
  objc_msgSend(location[0], "setProximitySetupDataSource:", v6);

  v64 = dispatch_group_create();
  dispatch_group_enter((dispatch_group_t)v64);
  v63 = 0uLL;
  v7 = (id)_BYSignpostSubsystem();
  v8 = _BYSignpostCreate(v7);
  *((_QWORD *)&v62 + 1) = v9;
  *(_QWORD *)&v62 = v8;

  v61 = (id)_BYSignpostSubsystem();
  v60 = 1;
  v59 = v62;
  if ((_QWORD)v62 && v59 != -1 && os_signpost_enabled((os_log_t)v61))
  {
    v10 = v61;
    v11 = v60;
    v12 = v59;
    sub_100038C3C(&buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, v11, v12, "ExpressSetupBackupDataSource", ", (uint8_t *)&buf, 2u);
  }
  objc_storeStrong(&v61, 0);
  v57 = (id)_BYSignpostSubsystem();
  v56 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)v69, v62);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v57, v56, "BEGIN [%lld]: ExpressSetupBackupDataSource ", v69, 0xCu);
  }
  objc_storeStrong(&v57, 0);
  v63 = v62;
  v13 = v67;
  v48 = _NSConcreteStackBlock;
  v49 = -1073741824;
  v50 = 0;
  v51 = sub_100098128;
  v52 = &unk_100281C58;
  v53 = location[0];
  v55 = v63;
  v54 = v64;
  -[BuddyExpressWelcomeController createBackupDataSource:](v13, "createBackupDataSource:", &v48);
  dispatch_group_enter((dispatch_group_t)v64);
  v47 = 0;
  v46 = 0;
  v14 = (id)_BYSignpostSubsystem();
  v15 = _BYSignpostCreate(v14);
  v45 = v16;
  v44 = (void *)v15;

  log = (os_log_t)(id)_BYSignpostSubsystem();
  v42 = 1;
  v41 = (uint64_t)v44;
  if (v44 && v41 != -1 && os_signpost_enabled(log))
  {
    v17 = log;
    v18 = v42;
    v19 = v41;
    sub_100038C3C(&v40);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, v18, v19, "ExpressSetupCloudDataSource", ", (uint8_t *)&v40, 2u);
  }
  objc_storeStrong((id *)&log, 0);
  oslog = (os_log_t)(id)_BYSignpostSubsystem();
  v38 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)v68, (uint64_t)v44);
    _os_log_impl((void *)&_mh_execute_header, oslog, v38, "BEGIN [%lld]: ExpressSetupCloudDataSource ", v68, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v46 = v44;
  v47 = v45;
  v20 = v67;
  v31 = _NSConcreteStackBlock;
  v32 = -1073741824;
  v33 = 0;
  v34 = sub_1000982EC;
  v35 = &unk_100281C80;
  v36 = location[0];
  v37[1] = v46;
  v37[2] = v47;
  v37[0] = v64;
  -[BuddyExpressWelcomeController createCloudDataSource:](v20, "createCloudDataSource:", &v31);
  v21 = v64;
  v22 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v24 = -1073741824;
  v25 = 0;
  v26 = sub_1000984B0;
  v27 = &unk_100281168;
  v28 = v67;
  v29 = location[0];
  v30 = v65;
  dispatch_group_notify(v21, (dispatch_queue_t)v22, &block);

  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong((id *)&v28, 0);
  objc_storeStrong(v37, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(location, 0);
}

- (id)_detailForDataSourceDeviceClass:(id)a3
{
  NSBundle *v3;
  id v4;
  NSBundle *v5;
  NSBundle *v6;
  NSBundle *v7;
  id v9;
  id location[3];
  NSString *v11;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = (id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  if ((objc_msgSend(v9, "isEqualToString:", location[0]) & 1) != 0)
  {
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("EXPRESS_SETUP_DETAIL_OTHER"));
    v11 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("EXPRESS_SETUP_DETAIL_IPHONE"), &stru_100284738, CFSTR("Localizable"));

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("iPad")) & 1) != 0)
  {
    v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("EXPRESS_SETUP_DETAIL_IPAD"), &stru_100284738, CFSTR("Localizable"));

  }
  else
  {
    if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("iPod")) & 1) != 0)
    {
      v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v11 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("EXPRESS_SETUP_DETAIL_IPOD"), &stru_100284738, CFSTR("Localizable"));
    }
    else
    {
      v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v11 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("EXPRESS_SETUP_DETAIL_MAC"), &stru_100284738, CFSTR("Localizable"));
    }

  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (void)_addLearnMoreButton
{
  NSBundle *v2;
  NSString *v3;
  id v4;
  id location[2];
  BuddyExpressWelcomeController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = +[OBHeaderAccessoryButton accessoryButton](OBHeaderAccessoryButton, "accessoryButton");
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_ELLIPSIS"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(location[0], "setTitle:forState:", v3, 0);

  objc_msgSend(location[0], "addTarget:action:forControlEvents:", v6, "_learnMoreTapped", 0x2000);
  v4 = -[BuddyExpressWelcomeController headerView](v6, "headerView");
  objc_msgSend(v4, "addAccessoryButton:", location[0]);

  objc_storeStrong(location, 0);
}

+ (id)_privacyIdentifiersForFeatures:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  id v9;
  _QWORD __b[8];
  id v11;
  id v12;
  id location[2];
  id v14;
  _BYTE v15[128];

  v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  v3 = location[0];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v3);
        v11 = *(id *)(__b[1] + 8 * i);
        v9 = objc_msgSend(v14, "_privacyIdentifiersForFeature:", objc_msgSend(v11, "unsignedIntegerValue"));
        if (v9)
          objc_msgSend(v12, "addObjectsFromArray:", v9);
        objc_storeStrong(&v9, 0);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
    }
    while (v4);
  }

  v7 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)_privacyIdentifiersForFeature:(unint64_t)a3
{
  NSArray *v4;
  _QWORD v5[4];
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  switch(a3)
  {
    case 1uLL:
      v11 = BYPrivacyLocationServicesIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1, a3, a2, a1);
      break;
    case 2uLL:
      v10 = BYPrivacyAnalyticsDeviceIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, a3, a2, a1);
      break;
    case 3uLL:
      v9 = BYPrivacyAnalyticsAppIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1, a3, a2, a1);
      break;
    case 4uLL:
      v8[0] = BYPrivacyAnalyticsDeviceIdentifier;
      v8[1] = BYPrivacyAnalyticsAppIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2, a3, a2, a1);
      break;
    case 5uLL:
      v7 = BYPrivacySiriIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1, a3, a2, a1);
      break;
    case 6uLL:
      v6 = BYPrivacyImproveSiriIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1, a3, a2, a1);
      break;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xCuLL:
      v4 = 0;
      break;
    case 0xBuLL:
      v5[0] = BYPrivacyAppleCard;
      v5[1] = BYPrivacyApplePay;
      v5[2] = BYPrivacyApplePayCash;
      v5[3] = BYPrivacyAppleWallet;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 4, a3, a2, a1);
      break;
    default:
      return v4;
  }
  return v4;
}

- (void)_addFeatureCardsForFeatures:(id)a3
{
  BuddyExpressWelcomeController *v3;
  BYExpressSetupDataProvider *v4;
  PKPaymentSetupAssistantProvisioningContext *v5;
  BuddyExpressWelcomeController *v6;
  BYExpressSetupDataProvider *v7;
  id v8;
  void *v9;
  BYExpressSetupDataProvider *v10;
  BYExpressSetupDataSource *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSArray *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id location[2];
  BuddyExpressWelcomeController *v46;
  _QWORD v47[4];

  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v44, "setAxis:", 1);
  objc_msgSend(v44, "setSpacing:", 10.0);
  if ((objc_msgSend(location[0], "containsObject:", &off_100290D48) & 1) != 0)
  {
    v3 = v46;
    v4 = -[BuddyExpressWelcomeController expressSetupDataProvider](v46, "expressSetupDataProvider");
    v5 = -[BYExpressSetupDataProvider walletProvisioningContext](v4, "walletProvisioningContext");
    v43 = -[BuddyExpressWelcomeController _createFeatureCardForApplePay:](v3, "_createFeatureCardForApplePay:", v5);

    objc_msgSend(v44, "addArrangedSubview:", v43);
    objc_storeStrong(&v43, 0);
  }
  if ((objc_msgSend(location[0], "containsObject:", &off_100290D60) & 1) != 0)
  {
    v6 = v46;
    v7 = -[BuddyExpressWelcomeController expressSetupDataProvider](v46, "expressSetupDataProvider");
    v8 = -[BYExpressSetupDataProvider pairedWatches](v7, "pairedWatches");
    v42 = -[BuddyExpressWelcomeController _createFeatureCardForConnections:](v6, "_createFeatureCardForConnections:", v8);

    objc_msgSend(v44, "addArrangedSubview:", v42);
    objc_storeStrong(&v42, 0);
  }
  v41 = objc_msgSend(location[0], "mutableCopy");
  objc_msgSend(v41, "removeObject:", &off_100290D60);
  if (objc_msgSend(v41, "count"))
  {
    v9 = (void *)objc_opt_class(v46);
    v10 = -[BuddyExpressWelcomeController expressSetupDataProvider](v46, "expressSetupDataProvider");
    v11 = -[BYExpressSetupDataProvider resolvedDataSource](v10, "resolvedDataSource");
    v40 = objc_msgSend(v9, "_createFeatureCardForSettings:withDataSource:", v41, v11);

    objc_msgSend(v44, "insertArrangedSubview:atIndex:", v40, 0);
    objc_storeStrong(&v40, 0);
  }
  v12 = (void *)objc_opt_class(v46);
  v13 = -[BuddyExpressWelcomeController dataTransferMethod](v46, "dataTransferMethod");
  v14 = -[BuddyExpressWelcomeController deviceNameForChosenBackup](v46, "deviceNameForChosenBackup");
  v15 = -[BuddyExpressWelcomeController dateForChosenBackup](v46, "dateForChosenBackup");
  v39 = objc_msgSend(v12, "_createFeatureCardForDataTransferMethod:deviceName:lastBackupDate:", v13, v14, v15);

  if (v39)
    objc_msgSend(v44, "insertArrangedSubview:atIndex:", v39, 0);
  v16 = -[BuddyExpressWelcomeController contentView](v46, "contentView");
  objc_msgSend(v16, "addSubview:", v44);

  v17 = objc_msgSend(v44, "arrangedSubviews");
  v18 = objc_msgSend(v17, "count");

  if (v18 == (id)1)
  {
    v19 = objc_msgSend(v44, "arrangedSubviews");
    v38 = objc_msgSend(v19, "firstObject");

    objc_msgSend(v38, "setExpanded:", 1);
    objc_storeStrong(&v38, 0);
  }
  v20 = -[BuddyExpressWelcomeController contentView](v46, "contentView");
  v37 = -[BuddyExpressWelcomeController contentView](v46, "contentView");
  v36 = objc_msgSend(v37, "topAnchor");
  v35 = objc_msgSend(v44, "topAnchor");
  v34 = objc_msgSend(v36, "constraintEqualToAnchor:");
  v47[0] = v34;
  v33 = -[BuddyExpressWelcomeController contentView](v46, "contentView");
  v32 = objc_msgSend(v33, "leadingAnchor");
  v31 = objc_msgSend(v44, "leadingAnchor");
  v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
  v47[1] = v30;
  v21 = -[BuddyExpressWelcomeController contentView](v46, "contentView");
  v22 = objc_msgSend(v21, "trailingAnchor");
  v23 = objc_msgSend(v44, "trailingAnchor");
  v24 = objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v47[2] = v24;
  v25 = -[BuddyExpressWelcomeController contentView](v46, "contentView");
  v26 = objc_msgSend(v25, "bottomAnchor");
  v27 = objc_msgSend(v44, "bottomAnchor");
  v28 = objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v47[3] = v28;
  v29 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4);
  objc_msgSend(v20, "addConstraints:", v29);

  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
}

- (id)_createFeatureCardForConnections:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  NSBundle *v8;
  NSString *v9;
  NSString *v10;
  BuddyExpressSetupFeatureCardView *v11;
  NSBundle *v12;
  NSString *v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t j;
  NSBundle *v18;
  NSString *v19;
  id v20;
  NSBundle *v21;
  NSString *v22;
  id v23;
  BuddyExpressSetupFeatureCardCell *v24;
  id v25;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[8];
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD __b[8];
  id v37;
  id v38;
  id v39;
  id location[2];
  BuddyExpressWelcomeController *v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("applewatch.watchface"));
  v38 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  v3 = location[0];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
  if (v4)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v3);
        v37 = *(id *)(__b[1] + 8 * i);
        v35 = objc_msgSend(v37, "valueForProperty:", NRDevicePropertyName);
        if (v35)
        {
          v7 = v38;
          v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_CONNECTION_NAME"), &stru_100284738, CFSTR("Localizable"));
          v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v35);
          objc_msgSend(v7, "addObject:", v10);

        }
        objc_storeStrong(&v35, 0);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
    }
    while (v4);
  }

  v34 = +[NSListFormatter localizedStringByJoiningStrings:](NSListFormatter, "localizedStringByJoiningStrings:", v38);
  v11 = [BuddyExpressSetupFeatureCardView alloc];
  v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_CONNECTIONS"), &stru_100284738, CFSTR("Localizable"));
  v33 = -[BuddyExpressSetupFeatureCardView initWithTitle:subtitle:icon:](v11, "initWithTitle:subtitle:icon:", v13, v34, v39);

  memset(v31, 0, sizeof(v31));
  v14 = location[0];
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v31, v42, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v31[2];
    do
    {
      for (j = 0; j < (unint64_t)v15; ++j)
      {
        if (*(_QWORD *)v31[2] != v16)
          objc_enumerationMutation(v14);
        v32 = *(id *)(v31[1] + 8 * j);
        v18 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v19 = -[NSBundle localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_CONNECTION_NAME"), &stru_100284738, CFSTR("Localizable"));
        v20 = objc_msgSend(v32, "valueForProperty:", NRDevicePropertyName);
        v30 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v20);

        v29 = objc_msgSend(v32, "valueForProperty:", NRDevicePropertyMarketingProductName);
        v28 = objc_msgSend((id)objc_opt_class(v41), "_accessoryViewForFeature:", 10);
        if (!v29)
        {
          v21 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v22 = -[NSBundle localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_APPLE_WATCH"), &stru_100284738, CFSTR("Localizable"));
          v23 = v29;
          v29 = v22;

        }
        v24 = [BuddyExpressSetupFeatureCardCell alloc];
        v27 = -[BuddyExpressSetupFeatureCardCell initWithTitle:subtitle:state:accessoryView:](v24, "initWithTitle:subtitle:state:accessoryView:", v29, v30, 0, v28);
        objc_msgSend(v33, "addCardCell:", v27);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v31, v42, 16);
    }
    while (v15);
  }

  v25 = v33;
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  return v25;
}

- (id)_createFeatureCardForApplePay:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  id v9;
  NSBundle *v10;
  NSString *v11;
  NSString *v12;
  NSBundle *v13;
  NSString *v14;
  BuddyExpressWalletFeatureCardView *v15;
  NSBundle *v16;
  NSString *v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t j;
  id v22;
  id v23;
  BuddyExpressWalletFeatureCardCell *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v30;
  id v31;
  _QWORD v32[8];
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD __b[8];
  id v38;
  id v39;
  id v40;
  id v41;
  id location[3];
  _BYTE v43[128];
  _BYTE v44[128];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("wallet"));
  v40 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_msgSend(location[0], "setupAssistantCredentials");
  v4 = objc_msgSend(location[0], "selectedIndices");
  v39 = objc_msgSend(v3, "objectsAtIndexes:", v4);

  memset(__b, 0, sizeof(__b));
  v5 = v39;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
  if (v6)
  {
    v7 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v6; ++i)
      {
        if (*(_QWORD *)__b[2] != v7)
          objc_enumerationMutation(v5);
        v38 = *(id *)(__b[1] + 8 * i);
        v36 = objc_msgSend(v38, "title");
        if (v36)
        {
          v9 = v40;
          v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_TITLE_APPLE_WALLET_NAME"), &stru_100284738, CFSTR("Localizable"));
          v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v36);
          objc_msgSend(v9, "addObject:", v12);

        }
        objc_storeStrong(&v36, 0);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
    }
    while (v6);
  }

  v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("WALLET_ITEMS"), &stru_100284738, CFSTR("Localizable"));
  v35 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, objc_msgSend(v39, "count"));

  v15 = [BuddyExpressWalletFeatureCardView alloc];
  v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v17 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_TITLE_APPLE_WALLET"), &stru_100284738, CFSTR("Localizable"));
  v34 = -[BuddyExpressWalletFeatureCardView initWithTitle:subtitle:icon:](v15, "initWithTitle:subtitle:icon:", v17, v35, v41);

  objc_msgSend(location[0], "setDelegate:", v34);
  memset(v32, 0, sizeof(v32));
  v18 = v39;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v32, v43, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v32[2];
    do
    {
      for (j = 0; j < (unint64_t)v19; ++j)
      {
        if (*(_QWORD *)v32[2] != v20)
          objc_enumerationMutation(v18);
        v33 = *(id *)(v32[1] + 8 * j);
        v22 = objc_alloc((Class)UIImageView);
        v23 = objc_msgSend(location[0], "passSnapshotForCredential:", v33);
        v31 = objc_msgSend(v22, "initWithImage:", v23);

        objc_msgSend(v31, "setContentMode:", 1);
        objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v24 = [BuddyExpressWalletFeatureCardCell alloc];
        v25 = objc_msgSend(v33, "title");
        v26 = objc_msgSend(v33, "subtitle");
        v30 = -[BuddyExpressSetupFeatureCardCell initWithTitle:subtitle:state:accessoryView:](v24, "initWithTitle:subtitle:state:accessoryView:", v25, v26, 0, v31);

        v27 = objc_msgSend(v33, "uniqueIdentifier");
        objc_msgSend(v30, "setUniqueIdentifier:", v27);

        objc_msgSend(v34, "addCardCell:", v30);
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v32, v43, 16);
    }
    while (v19);
  }

  v28 = v34;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  return v28;
}

+ (id)_createFeatureCardForSettings:(id)a3 withDataSource:(id)a4
{
  id v5;
  NSPredicate *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t i;
  id v13;
  void *v14;
  id v15;
  id v16;
  BuddyExpressSetupFeatureCardView *v17;
  NSBundle *v18;
  NSString *v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BuddyExpressSetupFeatureCardCell *v28;
  id v29;
  BuddyExpressSetupFeatureCardCell *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[8];
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD __b[8];
  id v43;
  id v44;
  void **v45;
  int v46;
  int v47;
  BOOL (*v48)(_QWORD *, void *, void *);
  void *v49;
  id v50;
  void **v51;
  int v52;
  int v53;
  uint64_t (*v54)(_QWORD *, void *, void *);
  void *v55;
  id v56;
  id v57;
  id v58;
  id location[2];
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];

  v60 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v58 = 0;
  objc_storeStrong(&v58, a4);
  v5 = location[0];
  v51 = _NSConcreteStackBlock;
  v52 = -1073741824;
  v53 = 0;
  v54 = sub_10009A750;
  v55 = &unk_100281CC8;
  v56 = v60;
  v6 = +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &v51);
  v57 = objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);

  v45 = _NSConcreteStackBlock;
  v46 = -1073741824;
  v47 = 0;
  v48 = sub_10009A7DC;
  v49 = &unk_100281CE8;
  v50 = v60;
  v7 = objc_msgSend(v57, "sortedArrayUsingComparator:", &v45);
  v8 = v57;
  v57 = v7;

  v44 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  v9 = v57;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v62, 16);
  if (v10)
  {
    v11 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v10; ++i)
      {
        if (*(_QWORD *)__b[2] != v11)
          objc_enumerationMutation(v9);
        v43 = *(id *)(__b[1] + 8 * i);
        v13 = v44;
        v14 = (void *)objc_opt_class(v60);
        v15 = objc_msgSend(v14, "_localizedNameForFeature:", objc_msgSend(v43, "unsignedIntegerValue"));
        objc_msgSend(v13, "addObject:", v15);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v62, 16);
    }
    while (v10);
  }

  v41 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("gear"));
  v16 = objc_msgSend(v44, "copy");
  v40 = +[BuddyExpressSetupFeatureCardView formattedSubtitleStringForComponents:](BuddyExpressSetupFeatureCardView, "formattedSubtitleStringForComponents:", v16);

  v17 = [BuddyExpressSetupFeatureCardView alloc];
  v18 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v19 = -[NSBundle localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_SETTINGS"), &stru_100284738, CFSTR("Localizable"));
  v39 = -[BuddyExpressSetupFeatureCardView initWithTitle:subtitle:icon:](v17, "initWithTitle:subtitle:icon:", v19, v40, v41);

  memset(v37, 0, sizeof(v37));
  v20 = v57;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v37, v61, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v37[2];
    do
    {
      for (j = 0; j < (unint64_t)v21; ++j)
      {
        if (*(_QWORD *)v37[2] != v22)
          objc_enumerationMutation(v20);
        v38 = *(id *)(v37[1] + 8 * j);
        v36 = 0;
        v36 = objc_msgSend(v38, "unsignedIntegerValue");
        v24 = (void *)objc_opt_class(v60);
        v35 = objc_msgSend(v24, "_localizedNameForFeature:", v36);
        v25 = (void *)objc_opt_class(v60);
        v34 = objc_msgSend(v25, "_localizedDescriptionForFeature:", v36);
        v26 = (void *)objc_opt_class(v60);
        v33 = objc_msgSend(v26, "_stateForFeature:withDataSource:", v36, v58);
        v27 = (void *)objc_opt_class(v60);
        v32 = objc_msgSend(v27, "_accessoryViewForFeature:", v36);
        v28 = [BuddyExpressSetupFeatureCardCell alloc];
        v31 = -[BuddyExpressSetupFeatureCardCell initWithTitle:subtitle:state:accessoryView:](v28, "initWithTitle:subtitle:state:accessoryView:", v35, v34, v33, v32);
        objc_msgSend(v39, "addCardCell:", v31, v31);
        objc_storeStrong((id *)&v31, 0);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
        objc_storeStrong(&v34, 0);
        objc_storeStrong(&v35, 0);
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v37, v61, 16);
    }
    while (v21);
  }

  v29 = v39;
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
  return v29;
}

+ (id)_createFeatureCardForDataTransferMethod:(unint64_t)a3 deviceName:(id)a4 lastBackupDate:(id)a5
{
  NSBundle *v6;
  NSBundle *v7;
  NSString *v8;
  id v9;
  NSBundle *v10;
  NSString *v11;
  id v12;
  NSBundle *v13;
  NSString *v14;
  id v15;
  id v16;
  id v17;
  BuddyExpressSetupFeatureCardCell *v18;
  BuddyExpressSetupFeatureCardCell *v19;
  id v20;
  NSBundle *v21;
  id v22;
  NSString *v23;
  id v24;
  NSBundle *v25;
  NSString *v26;
  id v27;
  BuddyExpressSetupFeatureCardView *v28;
  id v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id location;
  unint64_t v40;
  SEL v41;
  id v42;

  v42 = a1;
  v41 = a2;
  v40 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v38 = 0;
  objc_storeStrong(&v38, a5);
  v37 = +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("app.3.stack.3d"));
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v36 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("APPS_AND_DATA"), &stru_100284738, CFSTR("Localizable"));

  v35 = 0;
  v34 = 0;
  switch(v40)
  {
    case 0uLL:
      v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("DONT_TRANSFER_APPS_DATA"), &stru_100284738, CFSTR("Localizable"));
      v9 = v35;
      v35 = v8;

      break;
    case 1uLL:
    case 2uLL:
      v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("EXPRESS_RESTORE_METHOD_CLOUD"), &stru_100284738, CFSTR("Localizable"));
      v12 = v35;
      v35 = v11;

      v33 = 0;
      if (v40 == 2)
      {
        v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("EXPRESS_RESTORE_METHOD_CELL_DESCRIPTION_CLOUD_WITH_BACKUP"), &stru_100284738, CFSTR("Localizable"));
        v15 = v33;
        v33 = v14;

      }
      else
      {
        v32 = objc_alloc_init((Class)NSDateFormatter);
        objc_msgSend(v32, "setDateStyle:", 3);
        objc_msgSend(v32, "setTimeStyle:", 1);
        objc_msgSend(v32, "setDoesRelativeDateFormatting:", 1);
        v16 = objc_msgSend(v32, "stringFromDate:", v38);
        v17 = v33;
        v33 = v16;

        objc_storeStrong(&v32, 0);
      }
      v18 = [BuddyExpressSetupFeatureCardCell alloc];
      v19 = -[BuddyExpressSetupFeatureCardCell initWithTitle:subtitle:state:accessoryView:](v18, "initWithTitle:subtitle:state:accessoryView:", location, v33, 0, 0);
      v20 = v34;
      v34 = v19;

      objc_storeStrong(&v33, 0);
      break;
    case 3uLL:
      v21 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v22 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("TRANSFER_DIRECTLY"));
      v23 = -[NSBundle localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", v22, &stru_100284738, CFSTR("Localizable"));
      v24 = v35;
      v35 = v23;

      break;
    case 4uLL:
      v25 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v26 = -[NSBundle localizedStringForKey:value:table:](v25, "localizedStringForKey:value:table:", CFSTR("MIGRATE_FROM_ANDROID_DEVICE"), &stru_100284738, CFSTR("Localizable"));
      v27 = v35;
      v35 = v26;

      break;
    default:
      break;
  }
  v28 = [BuddyExpressSetupFeatureCardView alloc];
  v31 = -[BuddyExpressSetupFeatureCardView initWithTitle:subtitle:icon:](v28, "initWithTitle:subtitle:icon:", v36, v35, v37);
  objc_msgSend(v31, "setNumberOfLinesForSubtitle:", 0);
  if (v34)
    objc_msgSend(v31, "addCardCell:", v34);
  v29 = v31;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&location, 0);
  return v29;
}

+ (BOOL)_isSettingsFeature:(unint64_t)a3
{
  char v4;

  if (a3 - 1 < 5)
    goto LABEL_8;
  switch(a3)
  {
    case 6uLL:
      goto LABEL_9;
    case 7uLL:
LABEL_8:
      v4 = 1;
      return v4 & 1;
    case 8uLL:
LABEL_9:
      v4 = 0;
      return v4 & 1;
    case 9uLL:
      goto LABEL_8;
  }
  if (a3 - 10 < 2)
    goto LABEL_9;
  if (a3 == 12)
    goto LABEL_8;
  return v4 & 1;
}

+ (id)_localizedNameForFeature:(unint64_t)a3
{
  NSBundle *v3;
  NSBundle *v4;
  id v5;
  NSBundle *v6;
  NSBundle *v7;
  id v8;
  NSBundle *v9;
  NSBundle *v10;
  NSBundle *v11;
  NSBundle *v12;
  NSBundle *v13;
  NSString *v15;

  switch(a3)
  {
    case 1uLL:
      v3 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v15 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_TITLE_LOCATION_SERVICES"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 2uLL:
      v4 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("EXPRESS_FEATURE_TITLE_DEVICE_ANALYTICS"));
      v15 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("Localizable"));

      break;
    case 3uLL:
      v6 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v15 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_TITLE_APP_ANALYTICS"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 4uLL:
      v7 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("EXPRESS_FEATURE_TITLE_DEVICE_AND_APP_ANALYTICS"));
      v15 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", v8, &stru_100284738, CFSTR("Localizable"));

      break;
    case 5uLL:
      v9 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v15 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_TITLE_SIRI"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 6uLL:
    case 8uLL:
    case 0xAuLL:
      v15 = 0;
      break;
    case 7uLL:
      v10 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v15 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_TITLE_SCREEN_TIME"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 9uLL:
      v11 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v15 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_TITLE_APPEARANCE"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 0xBuLL:
      v12 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v15 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_TITLE_APPLE_WALLET"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 0xCuLL:
      v13 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v15 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_TITLE_APPLE_ACTION_BUTTON"), &stru_100284738, CFSTR("Localizable"));

      break;
    default:
      return v15;
  }
  return v15;
}

+ (id)_localizedDescriptionForFeature:(unint64_t)a3
{
  NSBundle *v3;
  NSBundle *v4;
  id v5;
  NSBundle *v6;
  NSBundle *v7;
  id v8;
  NSBundle *v9;
  NSBundle *v10;
  NSBundle *v11;
  id v12;
  NSBundle *v13;
  id v14;
  NSString *v16;

  switch(a3)
  {
    case 1uLL:
      v3 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v16 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_DESCRIPTION_LOCATION_SERVICES"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 2uLL:
      v4 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("EXPRESS_FEATURE_DESCRIPTION_DEVICE_ANALYTICS"));
      v16 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("Localizable"));

      break;
    case 3uLL:
      v6 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v16 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_DESCRIPTION_APP_ANALYTICS"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 4uLL:
      v7 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("EXPRESS_FEATURE_DESCRIPTION_DEVICE_AND_APP_ANALYTICS"));
      v16 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", v8, &stru_100284738, CFSTR("Localizable"));

      break;
    case 5uLL:
      v9 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v16 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_DESCRIPTION_SIRI"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 6uLL:
    case 8uLL:
    case 0xAuLL:
      v16 = 0;
      break;
    case 7uLL:
      v10 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v16 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_DESCRIPTION_SCREEN_TIME"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 9uLL:
      v11 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v12 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("EXPRESS_FEATURE_DESCRIPTION_APPEARANCE"));
      v16 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", v12, &stru_100284738, CFSTR("Localizable"));

      break;
    case 0xBuLL:
      v16 = 0;
      break;
    case 0xCuLL:
      v13 = +[NSBundle mainBundle](NSBundle, "mainBundle", a3, a2, a1);
      v14 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("EXPRESS_FEATURE_DESCRIPTION_ACTION_BUTTON"));
      v16 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", v14, &stru_100284738, CFSTR("Localizable"));

      break;
    default:
      return v16;
  }
  return v16;
}

+ (id)_accessoryViewForFeature:(unint64_t)a3
{
  UIImage *v3;
  id v4;
  UIColor *v5;
  id v6;
  UIColor *v7;
  UITraitCollection *v8;
  UIColor *v9;
  id v10;
  id v11;
  UIImage *v12;
  id v13;
  id v14;
  UIImageSymbolConfiguration *v15;
  UIColor *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSArray *v23;
  id v25;
  id v26;
  int v27;
  id v28;
  id location;
  id v30;
  unint64_t v31;
  SEL v32;
  id v33;
  id v34;
  _QWORD v35[2];

  v33 = a1;
  v32 = a2;
  v31 = a3;
  v30 = 0;
  location = 0;
  v28 = +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  switch(v31)
  {
    case 1uLL:
      objc_storeStrong(&location, CFSTR("location.fill"));
      goto LABEL_10;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      objc_storeStrong(&location, CFSTR("chart.bar.xaxis"));
      goto LABEL_10;
    case 5uLL:
      v3 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Siri"));
      v4 = v30;
      v30 = v3;

      goto LABEL_10;
    case 6uLL:
    case 8uLL:
      v34 = 0;
      v27 = 1;
      goto LABEL_13;
    case 7uLL:
      objc_storeStrong(&location, CFSTR("hourglass"));
      v5 = +[UIColor systemIndigoColor](UIColor, "systemIndigoColor");
      v6 = v28;
      v28 = v5;

      goto LABEL_10;
    case 9uLL:
      objc_storeStrong(&location, CFSTR("textformat.size"));
      goto LABEL_10;
    case 0xAuLL:
      objc_storeStrong(&location, CFSTR("applewatch.side.right"));
      v7 = +[UIColor systemGray4Color](UIColor, "systemGray4Color");
      v8 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2);
      v9 = -[UIColor resolvedColorWithTraitCollection:](v7, "resolvedColorWithTraitCollection:", v8);
      v10 = v28;
      v28 = v9;

      goto LABEL_10;
    case 0xCuLL:
      objc_storeStrong(&location, CFSTR("button.vertical.left.press"));
      goto LABEL_10;
    default:
LABEL_10:
      if (v30)
      {
        v11 = objc_alloc((Class)UIImageView);
        v34 = objc_msgSend(v11, "initWithImage:", v30);
        v27 = 1;
      }
      else
      {
        v12 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", location);
        v13 = v30;
        v30 = v12;

        v14 = objc_alloc((Class)UIImageView);
        v26 = objc_msgSend(v14, "initWithImage:", v30);
        objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v26, "setContentMode:", 4);
        v15 = +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 17.0);
        objc_msgSend(v26, "setPreferredSymbolConfiguration:", v15);

        v16 = +[UIColor whiteColor](UIColor, "whiteColor");
        objc_msgSend(v26, "setTintColor:", v16);

        v25 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v25, "setBackgroundColor:", v28);
        objc_msgSend(v25, "_setContinuousCornerRadius:", 8.0);
        objc_msgSend(v25, "addSubview:", v26);
        v17 = objc_msgSend(v26, "centerXAnchor");
        v18 = objc_msgSend(v25, "centerXAnchor");
        v19 = objc_msgSend(v17, "constraintEqualToAnchor:", v18);
        v35[0] = v19;
        v20 = objc_msgSend(v26, "centerYAnchor");
        v21 = objc_msgSend(v25, "centerYAnchor");
        v22 = objc_msgSend(v20, "constraintEqualToAnchor:", v21);
        v35[1] = v22;
        v23 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2);
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

        v34 = v25;
        v27 = 1;
        objc_storeStrong(&v25, 0);
        objc_storeStrong(&v26, 0);
      }
LABEL_13:
      objc_storeStrong(&v28, 0);
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v30, 0);
      return v34;
  }
}

+ (id)_stateForFeature:(unint64_t)a3 withDataSource:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSBundle *v9;
  NSBundle *v10;
  NSBundle *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  NSNumber *v21;
  id v22;
  NSBundle *v23;
  char v25;
  id v26;
  id v27;
  id location;
  unint64_t v29;
  SEL v30;
  id v31;
  NSString *v32;

  v31 = a1;
  v30 = a2;
  v29 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v27 = 0;
  switch(v29)
  {
    case 1uLL:
      v4 = objc_msgSend(location, "locationServicesOptIn");
      v5 = v27;
      v27 = v4;

      goto LABEL_23;
    case 2uLL:
    case 4uLL:
      v12 = objc_msgSend(location, "deviceAnalyticsOptIn");
      v13 = v27;
      v27 = v12;

      goto LABEL_23;
    case 3uLL:
      v14 = objc_msgSend(location, "appAnalyticsOptIn");
      v15 = v27;
      v27 = v14;

      goto LABEL_23;
    case 5uLL:
      v16 = objc_msgSend(location, "siriOptIn");
      v17 = v27;
      v27 = v16;

      goto LABEL_23;
    case 6uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      objc_storeStrong(&v27, 0);
      goto LABEL_23;
    case 7uLL:
      v6 = objc_msgSend(location, "screenTimeEnabled");
      v7 = v27;
      v27 = v6;

      goto LABEL_23;
    case 8uLL:
      v18 = objc_msgSend(location, "softwareUpdateAutoDownloadEnabled");
      v19 = objc_msgSend(v18, "BOOLValue");
      v25 = 0;
      v20 = 0;
      if ((v19 & 1) != 0)
      {
        v26 = objc_msgSend(location, "softwareUpdateAutoUpdateEnabled");
        v25 = 1;
        v20 = objc_msgSend(v26, "BOOLValue");
      }
      v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20 & 1);
      v22 = v27;
      v27 = v21;

      if ((v25 & 1) != 0)
      goto LABEL_23;
    case 9uLL:
      v8 = objc_msgSend(location, "userInterfaceStyleModeValue");
      if (!v8)
        goto LABEL_23;
      if (v8 == (id)1)
      {
        v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v32 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_STATE_LIGHT"), &stru_100284738, CFSTR("Localizable"));

      }
      else if (v8 == (id)2)
      {
        v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v32 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_STATE_DARK"), &stru_100284738, CFSTR("Localizable"));

      }
      else if (v8 == (id)100 || v8 == (id)102)
      {
        v11 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v32 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_STATE_AUTO"), &stru_100284738, CFSTR("Localizable"));

      }
      else
      {
LABEL_23:
        if (v27)
        {
          if ((objc_msgSend(v27, "BOOLValue") & 1) != 0)
          {
            v23 = +[NSBundle mainBundle](NSBundle, "mainBundle");
            v32 = -[NSBundle localizedStringForKey:value:table:](v23, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_STATE_ON"), &stru_100284738, CFSTR("Localizable"));
          }
          else
          {
            v23 = +[NSBundle mainBundle](NSBundle, "mainBundle");
            v32 = -[NSBundle localizedStringForKey:value:table:](v23, "localizedStringForKey:value:table:", CFSTR("EXPRESS_FEATURE_STATE_OFF"), &stru_100284738, CFSTR("Localizable"));
          }

        }
        else
        {
          v32 = 0;
        }
      }
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&location, 0);
      return v32;
    default:
      goto LABEL_23;
  }
}

- (void)_learnMoreTapped
{
  NSArray *v2;
  id location[2];
  BuddyExpressWelcomeController *v4;

  v4 = self;
  location[1] = (id)a2;
  v2 = -[BuddyExpressWelcomeController privacyIdentifiers](self, "privacyIdentifiers");
  location[0] = +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithIdentifiers:](OBPrivacyPresenter, "presenterForPrivacyUnifiedAboutWithIdentifiers:", v2);

  objc_msgSend(location[0], "setPresentingViewController:", v4);
  objc_msgSend(location[0], "present");
  objc_storeStrong(location, 0);
}

- (void)_recordAnalyticsEventForDataProvider:(id)a3 presented:(BOOL)a4 customized:(BOOL)a5
{
  BYAnalyticsManager *v7;
  NSNumber *v8;
  NSNumber *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSDictionary *v17;
  BOOL v18;
  id location[2];
  BuddyExpressWelcomeController *v20;
  _QWORD v21[5];
  _QWORD v22[5];

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a5;
  v7 = -[BuddyExpressWelcomeController analyticsManager](v20, "analyticsManager");
  v21[0] = CFSTR("presented");
  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a4);
  v22[0] = v8;
  v21[1] = CFSTR("customizedSettings");
  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v18);
  v22[1] = v9;
  v21[2] = CFSTR("resolvedFeatures");
  v10 = location[0];
  v11 = objc_msgSend(location[0], "resolvedDataSource");
  v12 = objc_msgSend(v10, "stringForDataSourceFeatures:", v11);
  v22[2] = v12;
  v21[3] = CFSTR("originalFeatures");
  v13 = location[0];
  v14 = objc_msgSend(location[0], "underlyingDataSource");
  v15 = objc_msgSend(v13, "stringForDataSourceFeatures:", v14);
  v22[3] = v15;
  v21[4] = CFSTR("dataSource");
  v16 = +[BYExpressSetupDataProvider stringForDataSourceType:](BYExpressSetupDataProvider, "stringForDataSourceType:", objc_msgSend(location[0], "dataSourceType"));
  v22[4] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  -[BYAnalyticsManager addEvent:withPayload:persist:](v7, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.expressSetup"), v17, 1);

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  BuddyMiscState *v2;
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BuddyPendingRestoreState *v7;
  RestorableBackupItem *v8;
  BuddyPendingRestoreState *v9;
  RestorableBackupItem *v10;
  uint64_t v11;
  uint64_t v12;
  char HasCompletedInitialRun;
  char v14;
  char v16;
  uint8_t buf[15];
  os_log_type_t v18;
  os_log_t oslog;
  id location;
  id v21[2];
  BuddyExpressWelcomeController *v22;
  char v23;

  v22 = self;
  v21[1] = (id)a2;
  v2 = -[BuddyExpressWelcomeController miscState](self, "miscState");
  v3 = -[BuddyMiscState userChoseExpress](v2, "userChoseExpress");

  if ((v3 & 1) != 0)
  {
    v23 = 0;
  }
  else
  {
    v21[0] = +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    location = objc_msgSend(v21[0], "primaryAuthKitAccount");
    if (location && (v4 = objc_msgSend(v21[0], "isBeneficiaryForAccount:", location), (v4 & 1) != 0))
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v4);
      v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v5 = oslog;
        v6 = v18;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Skipping express as the current account is a beneficiary", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v23 = 0;
    }
    else
    {
      v7 = -[BuddyExpressWelcomeController pendingRestoreState](v22, "pendingRestoreState");
      v8 = -[BuddyPendingRestoreState backupItem](v7, "backupItem");
      v9 = -[BuddyExpressWelcomeController pendingRestoreState](v22, "pendingRestoreState");
      v10 = -[BuddyPendingRestoreState attemptedBackupItem](v9, "attemptedBackupItem");
      v16 = -[RestorableBackupItem isEqual:](v8, "isEqual:", v10);

      HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun(v11, v12);
      v14 = 0;
      if ((HasCompletedInitialRun & 1) == 0)
        v14 = v16 ^ 1;
      v23 = v14 & 1;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(v21, 0);
  }
  return v23 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyExpressWelcomeController *v3;
  NSObject *v4;
  void *v5;
  void **block;
  int v7;
  int v8;
  void (*v9);
  void *v10;
  BuddyExpressWelcomeController *v11;
  id v12[3];
  void **v13;
  int v14;
  int v15;
  void (*v16)(id *, void *, void *);
  void *v17;
  id v18[2];
  id v19;
  void **v20;
  int v21;
  int v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25[2];
  dispatch_group_t group;
  _QWORD v27[2];
  int v28;
  int v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[2];
  int v34;
  int v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  id location[2];
  BuddyExpressWelcomeController *v40;

  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33[0] = 0;
  v33[1] = v33;
  v34 = 838860800;
  v35 = 48;
  v36 = sub_10009C6EC;
  v37 = sub_10009C71C;
  v38 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v28 = 838860800;
  v29 = 48;
  v30 = sub_10009C6EC;
  v31 = sub_10009C71C;
  v32 = 0;
  group = dispatch_group_create();
  dispatch_group_enter(group);
  v3 = v40;
  v20 = _NSConcreteStackBlock;
  v21 = -1073741824;
  v22 = 0;
  v23 = sub_10009C728;
  v24 = &unk_100281D10;
  v25[1] = v33;
  v25[0] = group;
  -[BuddyExpressWelcomeController createDataProvider:](v3, "createDataProvider:", &v20);
  v19 = objc_alloc_init((Class)AAUIProfilePictureStore);
  if (v19)
  {
    dispatch_group_enter(group);
    v13 = _NSConcreteStackBlock;
    v14 = -1073741824;
    v15 = 0;
    v16 = sub_10009C818;
    v17 = &unk_100281D60;
    v18[1] = v27;
    v18[0] = group;
    objc_msgSend(v19, "fetchProfilePictureForAccountOwner:", &v13);
    objc_storeStrong(v18, 0);
  }
  v4 = group;
  v5 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_10009C978;
  v10 = &unk_100281D88;
  v12[1] = v33;
  v11 = v40;
  v12[0] = location[0];
  v12[2] = v27;
  dispatch_group_notify(v4, (dispatch_queue_t)v5, &block);

  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(v25, 0);
  objc_storeStrong((id *)&group, 0);
  _Block_object_dispose(v27, 8);
  objc_storeStrong(&v32, 0);
  _Block_object_dispose(v33, 8);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (void)startOver
{
  BuddyMiscState *v2;
  BuddyMiscState *v3;
  BYPaneFeatureAnalyticsManager *v4;

  v2 = -[BuddyExpressWelcomeController miscState](self, "miscState", a2);
  -[BuddyMiscState setUserChoseExpress:](v2, "setUserChoseExpress:", 0);

  v3 = -[BuddyExpressWelcomeController miscState](self, "miscState");
  -[BuddyMiscState setWalletProvisioningContext:](v3, "setWalletProvisioningContext:", 0);

  v4 = -[BuddyExpressWelcomeController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager setExpressDataSource:features:](v4, "setExpressDataSource:features:", 0, 0);

}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestoreState, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_existingSettings, a3);
}

- (BFFBackupDeviceController)backupDeviceController
{
  return self->_backupDeviceController;
}

- (void)setBackupDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->_backupDeviceController, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BYChronicle)chronicle
{
  return self->_chronicle;
}

- (void)setChronicle:(id)a3
{
  objc_storeStrong((id *)&self->_chronicle, a3);
}

- (BuddyDisplayZoomExecutor)displayZoomExecutor
{
  return self->_displayZoomExecutor;
}

- (void)setDisplayZoomExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_displayZoomExecutor, a3);
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
  objc_storeStrong((id *)&self->_setupMethod, a3);
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

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProvider, a3);
}

- (BYExpressSetupDataProvider)expressSetupDataProvider
{
  return self->_expressSetupDataProvider;
}

- (void)setExpressSetupDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_expressSetupDataProvider, a3);
}

- (NSArray)privacyIdentifiers
{
  return self->_privacyIdentifiers;
}

- (void)setPrivacyIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_privacyIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyIdentifiers, 0);
  objc_storeStrong((id *)&self->_expressSetupDataProvider, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_setupMethod, 0);
  objc_storeStrong((id *)&self->_displayZoomExecutor, 0);
  objc_storeStrong((id *)&self->_chronicle, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_backupDeviceController, 0);
  objc_storeStrong((id *)&self->_existingSettings, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
}

@end
