@implementation DeviceRestoreChoiceController

- (DeviceRestoreChoiceController)init
{
  NSBundle *v2;
  id v3;
  id v4;
  NSBundle *v5;
  NSString *v6;
  BuddyTableChoiceManager *v7;
  BuddyTableChoiceManager *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  DeviceRestoreChoiceController *v20;
  void **v22;
  uint64_t v23;
  id (*v24)(id *, void *, void *, void *);
  void *v25;
  id v26;
  objc_super v27;
  id v28[2];
  id location;

  location = self;
  v28[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("DEVICE_RESTORE_APPS_DATA"));
  v28[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));

  v4 = location;
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("DEVICE_RESTORE_DETAIL"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v27.receiver = v4;
  v27.super_class = (Class)DeviceRestoreChoiceController;
  location = -[DeviceRestoreChoiceController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v27, "initWithTitle:detailText:icon:adoptTableViewScrollView:", v28[0], v6, 0, 1);
  objc_storeStrong(&location, location);

  if (location)
  {
    v7 = [BuddyTableChoiceManager alloc];
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_1000C5F4C;
    v25 = &unk_100282470;
    v26 = location;
    v8 = -[BuddyTableChoiceManager initWithCellConstructor:allowManualRowHeight:](v7, "initWithCellConstructor:allowManualRowHeight:", &v22, 1);
    v9 = (void *)*((_QWORD *)location + 16);
    *((_QWORD *)location + 16) = v8;

    objc_msgSend(*((id *)location + 16), "setChooseableDelegate:");
    v10 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v11 = (void *)*((_QWORD *)location + 18);
    *((_QWORD *)location + 18) = v10;

    v12 = objc_msgSend(*((id *)location + 16), "tableViewDelegate");
    objc_msgSend(*((id *)location + 18), "setDelegate:", v12);

    v13 = objc_msgSend(*((id *)location + 16), "tableViewDataSource");
    objc_msgSend(*((id *)location + 18), "setDataSource:", v13);

    objc_msgSend(*((id *)location + 18), "setEstimatedRowHeight:", 0.0);
    v14 = sub_1000C6290();
    objc_msgSend(*((id *)location + 18), "setDirectionalLayoutMargins:", v14, v15, v16, v17, *(_QWORD *)&v14, *(_QWORD *)&v15, *(_QWORD *)&v16, *(_QWORD *)&v17, *(_QWORD *)&v14, *(_QWORD *)&v15, *(_QWORD *)&v16, *(_QWORD *)&v17, v22, v23, v24, v25);
    v18 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v19 = (void *)*((_QWORD *)location + 19);
    *((_QWORD *)location + 19) = v18;

    objc_storeStrong(&v26, 0);
  }
  v20 = (DeviceRestoreChoiceController *)location;
  objc_storeStrong(v28, 0);
  objc_storeStrong(&location, 0);
  return v20;
}

- (BOOL)controllerNeedsToRun
{
  BuddySuspendTask *v2;
  BYPreferencesController *v3;
  id v4;
  uint64_t v5;
  char v6;
  char HasCompletedInitialRun;
  char v9;
  BYPreferencesController *v10;
  char v12;

  v2 = -[DeviceRestoreChoiceController suspendTask](self, "suspendTask");
  -[BuddySuspendTask preheat](v2, "preheat");

  v3 = -[DeviceRestoreChoiceController buddyPreferences](self, "buddyPreferences");
  v4 = -[BYPreferencesController BOOLForKey:](v3, "BOOLForKey:", CFSTR("RestoreChoice"));
  v9 = 0;
  v6 = 0;
  if ((v4 & 1) == 0)
  {
    HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun(v4, v5);
    v6 = 0;
    if ((HasCompletedInitialRun & 1) == 0)
    {
      v10 = -[DeviceRestoreChoiceController buddyPreferences](self, "buddyPreferences");
      v9 = 1;
      v6 = -[BYPreferencesController BOOLForKey:](v10, "BOOLForKey:", BYBuddyDoneKey) ^ 1;
    }
  }
  v12 = v6 & 1;
  if ((v9 & 1) != 0)

  return v12 & 1;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupRestore;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (void)_populateRestoreChoices
{
  BuddyFlowItemDispositionProvider *v2;
  unint64_t v3;
  MCProfileConnection *v4;
  BuddyChoice *v5;
  NSBundle *v6;
  NSString *v7;
  BuddyChoice *v8;
  UIImage *v9;
  UIImage *v10;
  BuddyChoice *v11;
  BuddyChoice *v12;
  NSMutableDictionary *v13;
  BuddyNetworkProvider *v14;
  BuddyChoice *v15;
  id v16;
  id v17;
  BuddyChoice *v18;
  BuddyChoice *v19;
  NSBundle *v20;
  id v21;
  NSString *v22;
  BuddyChoice *v23;
  UIDevice *v24;
  id v25;
  BOOL v26;
  UIImage *v27;
  UIImage *v28;
  BuddyChoice *v29;
  BuddyChoice *v30;
  NSMutableDictionary *v31;
  id v32;
  BuddyChoice *v33;
  BuddyEnrollmentCoordinator *v34;
  BOOL v35;
  char v36;
  BuddyChoice *v37;
  NSBundle *v38;
  NSString *v39;
  BuddyChoice *v40;
  UIImage *v41;
  UIImage *v42;
  BuddyChoice *v43;
  BuddyChoice *v44;
  NSMutableDictionary *v45;
  NSBundle *v46;
  NSString *v47;
  NSBundle *v48;
  id v49;
  NSString *v50;
  BuddyChoice *v51;
  NSBundle *v52;
  NSString *v53;
  id v54;
  BuddyChoice *v55;
  NSBundle *v56;
  NSString *v57;
  id v58;
  BuddyChoice *v59;
  id v60;
  BuddyChoice *v61;
  BuddyChoice *v62;
  NSBundle *v63;
  NSString *v64;
  BuddyChoice *v65;
  UIImage *v66;
  UIImage *v67;
  BuddyChoice *v68;
  BuddyChoice *v69;
  NSMutableDictionary *v70;
  id v71;
  BuddyChoice *v72;
  BuddyChoice *v73;
  NSBundle *v74;
  NSString *v75;
  BuddyChoice *v76;
  UIDevice *v77;
  id v78;
  BOOL v79;
  UIImage *v80;
  UIImage *v81;
  BuddyChoice *v82;
  BuddyChoice *v83;
  NSMutableDictionary *v84;
  BuddyTableChoiceManager *v85;
  BuddyChoice *v86;
  NSArray *v87;
  NSArray *v88;
  id v89;
  void **v90;
  int v91;
  int v92;
  BOOL (*v93)(id *);
  void *v94;
  id v95;
  id v96;
  id v97;
  char v98;
  BOOL v99;
  id v100;
  void **v101;
  int v102;
  int v103;
  uint64_t (*v104)(id *);
  void *v105;
  id v106;
  void **v107;
  int v108;
  int v109;
  void (*v110)(id *);
  void *v111;
  id v112;
  id location;
  id v114;
  char v115;
  id v116;
  char v117;
  SEL v118;
  DeviceRestoreChoiceController *v119;
  id v120;
  id v121;
  BuddyChoice *v122;
  _QWORD v123[2];

  v119 = self;
  v118 = a2;
  v2 = -[DeviceRestoreChoiceController flowItemDispositionProvider](self, "flowItemDispositionProvider");
  v3 = (-[BuddyFlowItemDispositionProvider dispositions](v2, "dispositions") >> 4) & 1;

  v117 = v3 & 1;
  v116 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = -[DeviceRestoreChoiceController managedConfiguration](v119, "managedConfiguration");
  LOBYTE(v3) = -[MCProfileConnection effectiveBoolValueForSetting:](v4, "effectiveBoolValueForSetting:", MCFeatureAccountModificationAllowed) != 2;

  v115 = v3 & 1;
  if ((v3 & 1) != 0)
  {
    v5 = [BuddyChoice alloc];
    v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("RESTORE_FROM_OTA_BACKUP"), &stru_100284738, CFSTR("Localizable"));
    v8 = -[BuddyChoice initWithTitle:nextItemClass:](v5, "initWithTitle:nextItemClass:", v7, 0);
    -[DeviceRestoreChoiceController setCloudRestoreChoice:](v119, "setCloudRestoreChoice:", v8);

    v9 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Cloud"));
    v10 = -[UIImage imageWithRenderingMode:](v9, "imageWithRenderingMode:", 2);
    v11 = -[DeviceRestoreChoiceController cloudRestoreChoice](v119, "cloudRestoreChoice");
    -[BuddyChoice setIcon:](v11, "setIcon:", v10);

    v12 = -[DeviceRestoreChoiceController cloudRestoreChoice](v119, "cloudRestoreChoice");
    v13 = -[DeviceRestoreChoiceController choiceMap](v119, "choiceMap");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, CFSTR("restoreFromiCloudBackup"));

    v14 = -[DeviceRestoreChoiceController networkProvider](v119, "networkProvider");
    v114 = +[BuddyRestoreNetworkAlertController alertControllerForUnsupportedNetworkWithCellularRestoreSupport:](BuddyRestoreNetworkAlertController, "alertControllerForUnsupportedNetworkWithCellularRestoreSupport:", -[BuddyNetworkProvider deviceSupportsCellularRestore](v14, "deviceSupportsCellularRestore"));

    objc_initWeak(&location, v119);
    v107 = _NSConcreteStackBlock;
    v108 = -1073741824;
    v109 = 0;
    v110 = sub_1000C76AC;
    v111 = &unk_1002806B8;
    objc_copyWeak(&v112, &location);
    objc_msgSend(v114, "setPresentWiFiSettings:", &v107);
    v15 = -[DeviceRestoreChoiceController cloudRestoreChoice](v119, "cloudRestoreChoice");
    v16 = v114;
    v101 = _NSConcreteStackBlock;
    v102 = -1073741824;
    v103 = 0;
    v104 = sub_1000C774C;
    v105 = &unk_1002807A8;
    objc_copyWeak(&v106, &location);
    -[BuddyChoice setConfirmationAlert:condition:](v15, "setConfirmationAlert:condition:", v16, &v101);

    v17 = v116;
    v18 = -[DeviceRestoreChoiceController cloudRestoreChoice](v119, "cloudRestoreChoice");
    objc_msgSend(v17, "addObject:", v18);

    objc_destroyWeak(&v106);
    objc_destroyWeak(&v112);
    objc_destroyWeak(&location);
    objc_storeStrong(&v114, 0);
  }
  if (+[BuddyMigrationCapability currentDeviceShouldOfferMigration](BuddyMigrationCapability, "currentDeviceShouldOfferMigration")&& (v117 & 1) == 0)
  {
    v19 = [BuddyChoice alloc];
    v20 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v21 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("TRANSFER_DIRECTLY"));
    v22 = -[NSBundle localizedStringForKey:value:table:](v20, "localizedStringForKey:value:table:", v21, &stru_100284738, CFSTR("Localizable"));
    v23 = -[BuddyChoice initWithTitle:nextItemClass:](v19, "initWithTitle:nextItemClass:", v22, 0);
    -[DeviceRestoreChoiceController setMigrateFromiOSChoice:](v119, "setMigrateFromiOSChoice:", v23);

    v100 = CFSTR("iPhone");
    v121 = 0;
    v24 = +[UIDevice currentDevice](UIDevice, "currentDevice");
    v25 = -[UIDevice userInterfaceIdiom](v24, "userInterfaceIdiom");

    v121 = v25;
    v26 = 1;
    if (v25 != (id)1)
      v26 = v121 == (id)5;
    if (v26)
      objc_storeStrong(&v100, CFSTR("iPad"));
    v27 = +[UIImage imageNamed:](UIImage, "imageNamed:", v100);
    v28 = -[UIImage imageWithRenderingMode:](v27, "imageWithRenderingMode:", 2);
    v29 = -[DeviceRestoreChoiceController migrateFromiOSChoice](v119, "migrateFromiOSChoice");
    -[BuddyChoice setIcon:](v29, "setIcon:", v28);

    v30 = -[DeviceRestoreChoiceController migrateFromiOSChoice](v119, "migrateFromiOSChoice");
    v31 = -[DeviceRestoreChoiceController choiceMap](v119, "choiceMap");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v30, CFSTR("migrateFromiOS"));

    v32 = v116;
    v33 = -[DeviceRestoreChoiceController migrateFromiOSChoice](v119, "migrateFromiOSChoice");
    objc_msgSend(v32, "addObject:", v33);

    objc_storeStrong(&v100, 0);
  }
  v34 = -[DeviceRestoreChoiceController enrollmentCoordinator](v119, "enrollmentCoordinator");
  v35 = (id)-[BuddyEnrollmentCoordinator mdmEnrollmentChannel](v34, "mdmEnrollmentChannel") == (id)2;

  v99 = v35;
  v98 = 0;
  v36 = 0;
  if (!v35)
    v36 = v117 ^ 1;
  v98 = v36 & 1;
  if ((v36 & 1) != 0)
  {
    v37 = [BuddyChoice alloc];
    v38 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v39 = -[NSBundle localizedStringForKey:value:table:](v38, "localizedStringForKey:value:table:", CFSTR("RESTORE_FROM_MAC_OR_PC"), &stru_100284738, CFSTR("Localizable"));
    v40 = -[BuddyChoice initWithTitle:nextItemClass:](v37, "initWithTitle:nextItemClass:", v39, objc_opt_class(RestoreFromComputerController));
    -[DeviceRestoreChoiceController setITunesRestoreChoice:](v119, "setITunesRestoreChoice:", v40);

    v41 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Mac"));
    v42 = -[UIImage imageWithRenderingMode:](v41, "imageWithRenderingMode:", 2);
    v43 = -[DeviceRestoreChoiceController iTunesRestoreChoice](v119, "iTunesRestoreChoice");
    -[BuddyChoice setIcon:](v43, "setIcon:", v42);

    v44 = -[DeviceRestoreChoiceController iTunesRestoreChoice](v119, "iTunesRestoreChoice");
    v45 = -[DeviceRestoreChoiceController choiceMap](v119, "choiceMap");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v44, CFSTR("restoreFromiTunesBackup"));

    v46 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v47 = -[NSBundle localizedStringForKey:value:table:](v46, "localizedStringForKey:value:table:", CFSTR("RESTORE_FROM_ITUNES_VERSION_WARNING_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v48 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v49 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("RESTORE_FROM_ITUNES_VERSION_WARNING_MESSAGE"));
    v50 = -[NSBundle localizedStringForKey:value:table:](v48, "localizedStringForKey:value:table:", v49, &stru_100284738, CFSTR("Localizable"));
    v97 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v47, v50, 1);

    v51 = -[DeviceRestoreChoiceController iTunesRestoreChoice](v119, "iTunesRestoreChoice");
    v52 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v53 = -[NSBundle localizedStringForKey:value:table:](v52, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
    v54 = -[BuddyChoice confirmationAcceptActionWithTitle:style:action:](v51, "confirmationAcceptActionWithTitle:style:action:", v53, 0, 0);
    objc_msgSend(v97, "addAction:", v54);

    v55 = -[DeviceRestoreChoiceController iTunesRestoreChoice](v119, "iTunesRestoreChoice");
    v56 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v57 = -[NSBundle localizedStringForKey:value:table:](v56, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("Localizable"));
    v58 = -[BuddyChoice confirmationCancelActionWithTitle:style:action:](v55, "confirmationCancelActionWithTitle:style:action:", v57, 1, 0);
    objc_msgSend(v97, "addAction:", v58);

    v96 = -[DeviceRestoreChoiceController proximitySetupController](v119, "proximitySetupController");
    v59 = -[DeviceRestoreChoiceController iTunesRestoreChoice](v119, "iTunesRestoreChoice");
    v90 = _NSConcreteStackBlock;
    v91 = -1073741824;
    v92 = 0;
    v93 = sub_1000C77B8;
    v94 = &unk_100282498;
    v95 = v96;
    -[BuddyChoice setConfirmationAlert:condition:](v59, "setConfirmationAlert:condition:", v97, &v90);

    v60 = v116;
    v61 = -[DeviceRestoreChoiceController iTunesRestoreChoice](v119, "iTunesRestoreChoice");
    objc_msgSend(v60, "addObject:", v61);

    objc_storeStrong(&v95, 0);
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, 0);
  }
  if (+[BuddyMoveFromAndroidController showMoveFromAndroidRestoreChoice](BuddyMoveFromAndroidController, "showMoveFromAndroidRestoreChoice")&& !v99)
  {
    v62 = [BuddyChoice alloc];
    v63 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v64 = -[NSBundle localizedStringForKey:value:table:](v63, "localizedStringForKey:value:table:", CFSTR("MIGRATE_FROM_ANDROID_DEVICE"), &stru_100284738, CFSTR("Localizable"));
    v65 = -[BuddyChoice initWithTitle:nextItemClass:](v62, "initWithTitle:nextItemClass:", v64, objc_opt_class(BuddyMoveFromAndroidController));
    -[DeviceRestoreChoiceController setMigrateFromAndroidChoice:](v119, "setMigrateFromAndroidChoice:", v65);

    v66 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Android"));
    v67 = -[UIImage imageWithRenderingMode:](v66, "imageWithRenderingMode:", 2);
    v68 = -[DeviceRestoreChoiceController migrateFromAndroidChoice](v119, "migrateFromAndroidChoice");
    -[BuddyChoice setIcon:](v68, "setIcon:", v67);

    v69 = -[DeviceRestoreChoiceController migrateFromAndroidChoice](v119, "migrateFromAndroidChoice");
    v70 = -[DeviceRestoreChoiceController choiceMap](v119, "choiceMap");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v70, "setObject:forKeyedSubscript:", v69, CFSTR("migrateFromAndroid"));

    v71 = v116;
    v72 = -[DeviceRestoreChoiceController migrateFromAndroidChoice](v119, "migrateFromAndroidChoice");
    objc_msgSend(v71, "addObject:", v72);

  }
  v73 = [BuddyChoice alloc];
  v74 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v75 = -[NSBundle localizedStringForKey:value:table:](v74, "localizedStringForKey:value:table:", CFSTR("DONT_TRANSFER_APPS_DATA"), &stru_100284738, CFSTR("Localizable"));
  v76 = -[BuddyChoice initWithTitle:nextItemClass:](v73, "initWithTitle:nextItemClass:", v75, 0);
  -[DeviceRestoreChoiceController setSetUpAsNewChoice:](v119, "setSetUpAsNewChoice:", v76);

  v89 = CFSTR("Don_t_Transfer");
  v120 = 0;
  v77 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v78 = -[UIDevice userInterfaceIdiom](v77, "userInterfaceIdiom");

  v120 = v78;
  v79 = 1;
  if (v78 != (id)1)
    v79 = v120 == (id)5;
  if (v79)
    objc_storeStrong(&v89, CFSTR("Don_t_Transfer_iPad"));
  v80 = +[UIImage imageNamed:](UIImage, "imageNamed:", v89);
  v81 = -[UIImage imageWithRenderingMode:](v80, "imageWithRenderingMode:", 2);
  v82 = -[DeviceRestoreChoiceController setUpAsNewChoice](v119, "setUpAsNewChoice");
  -[BuddyChoice setIcon:](v82, "setIcon:", v81);

  v83 = -[DeviceRestoreChoiceController setUpAsNewChoice](v119, "setUpAsNewChoice");
  v84 = -[DeviceRestoreChoiceController choiceMap](v119, "choiceMap");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v84, "setObject:forKeyedSubscript:", v83, CFSTR("setUpAsNew"));

  v85 = -[DeviceRestoreChoiceController choiceManager](v119, "choiceManager");
  v123[0] = v116;
  v86 = -[DeviceRestoreChoiceController setUpAsNewChoice](v119, "setUpAsNewChoice");
  v122 = v86;
  v87 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v122, 1);
  v123[1] = v87;
  v88 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v123, 2);
  -[BuddyTableChoiceManager setChoices:](v85, "setChoices:", v88);

  objc_storeStrong(&v89, 0);
  objc_storeStrong(&v116, 0);
}

- (void)didSelectChoice:(id)a3
{
  BuddyChoice *v3;
  BuddyChoice *v4;
  BuddyChoice *v5;
  BuddyChoice *v6;
  BuddySetupMethod *v7;
  BuddyChoice *v8;
  BuddyChoice *v9;
  BuddySetupMethod *v10;
  BuddyPendingRestoreState *v11;
  BYPreferencesController *v12;
  BFFFlowItemDelegate *v13;
  id location[2];
  DeviceRestoreChoiceController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (BuddyChoice *)location[0];
  v4 = -[DeviceRestoreChoiceController migrateFromiOSChoice](v15, "migrateFromiOSChoice");

  if (v3 == v4)
  {
    -[DeviceRestoreChoiceController _migrateFromiOSSelected](v15, "_migrateFromiOSSelected");
  }
  else
  {
    v5 = (BuddyChoice *)location[0];
    v6 = -[DeviceRestoreChoiceController cloudRestoreChoice](v15, "cloudRestoreChoice");

    if (v5 == v6)
    {
      v7 = -[DeviceRestoreChoiceController setupMethod](v15, "setupMethod");
      -[BuddySetupMethod setIntendedDataTransferMethod:](v7, "setIntendedDataTransferMethod:", 1);

    }
    else
    {
      v8 = (BuddyChoice *)location[0];
      v9 = -[DeviceRestoreChoiceController setUpAsNewChoice](v15, "setUpAsNewChoice");

      if (v8 == v9)
      {
        v10 = -[DeviceRestoreChoiceController setupMethod](v15, "setupMethod");
        -[BuddySetupMethod setDataTransferMethod:](v10, "setDataTransferMethod:", 0);

      }
      v11 = -[DeviceRestoreChoiceController pendingRestoreState](v15, "pendingRestoreState");
      -[BuddyPendingRestoreState clearBackupItem](v11, "clearBackupItem");

    }
    v12 = -[DeviceRestoreChoiceController buddyPreferences](v15, "buddyPreferences");
    -[BYPreferencesController setObject:forKey:](v12, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("RestoreChoice"));

    v13 = -[DeviceRestoreChoiceController delegate](v15, "delegate");
    -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v13, "flowItemDone:nextItemClass:", v15, objc_msgSend(location[0], "nextControllerClass"));

  }
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  BuddyTableChoiceManager *v3;
  UITableView *v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  DeviceRestoreChoiceController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DeviceRestoreChoiceController;
  -[DeviceRestoreChoiceController viewWillAppear:](&v5, "viewWillAppear:", a3);
  if (-[DeviceRestoreChoiceController _useCompactMode](v8, "_useCompactMode"))
  {
    v3 = -[DeviceRestoreChoiceController choiceManager](v8, "choiceManager");
    -[BuddyTableChoiceManager setFixedRowHeight:](v3, "setFixedRowHeight:", 44.0);
  }
  else
  {
    v3 = -[DeviceRestoreChoiceController choiceManager](v8, "choiceManager");
    -[BuddyTableChoiceManager setFixedRowHeight:](v3, "setFixedRowHeight:", 52.0);
  }

  v4 = -[DeviceRestoreChoiceController choiceTable](v8, "choiceTable");
  -[UITableView reloadData](v4, "reloadData");

}

- (void)viewDidAppear:(BOOL)a3
{
  OBAnimationController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  DeviceRestoreChoiceController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)DeviceRestoreChoiceController;
  -[DeviceRestoreChoiceController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[DeviceRestoreChoiceController flowItemDidAppear:](v7, "flowItemDidAppear:", v5);
  v3 = -[DeviceRestoreChoiceController animationController](v7, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

}

- (void)viewDidLoad
{
  UITableView *v2;
  DeviceRestoreChoiceController *v3;
  UITableView *v4;
  UITableView *v5;
  UITableView *v6;
  UITableView *v7;
  id v8;
  UITableView *v9;
  void *v10;
  void *v11;
  id v12;
  NSLayoutConstraint *v13;
  id v14;
  id v15;
  UIDevice *v16;
  id v17;
  BOOL v18;
  id v19;
  __CFString *v20;
  id location[3];
  objc_super v22;
  SEL v23;
  DeviceRestoreChoiceController *v24;
  id v25;
  _QWORD v26[2];

  v24 = self;
  v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)DeviceRestoreChoiceController;
  -[DeviceRestoreChoiceController viewDidLoad](&v22, "viewDidLoad");
  -[DeviceRestoreChoiceController _populateRestoreChoices](v24, "_populateRestoreChoices");
  v2 = -[DeviceRestoreChoiceController choiceTable](v24, "choiceTable");
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v3 = v24;
  v4 = -[DeviceRestoreChoiceController choiceTable](v24, "choiceTable");
  -[DeviceRestoreChoiceController setTableView:](v3, "setTableView:", v4);

  v5 = -[DeviceRestoreChoiceController choiceTable](v24, "choiceTable");
  -[UITableView reloadData](v5, "reloadData");

  v6 = -[DeviceRestoreChoiceController choiceTable](v24, "choiceTable");
  -[UITableView layoutIfNeeded](v6, "layoutIfNeeded");

  v7 = -[DeviceRestoreChoiceController choiceTable](v24, "choiceTable");
  v8 = -[UITableView heightAnchor](v7, "heightAnchor");
  v9 = -[DeviceRestoreChoiceController choiceTable](v24, "choiceTable");
  -[UITableView contentSize](v9, "contentSize");
  location[1] = v10;
  location[2] = v11;
  v12 = objc_msgSend(v8, "constraintEqualToConstant:", *(double *)&v11);
  -[DeviceRestoreChoiceController setTableHeightAnchor:](v24, "setTableHeightAnchor:", v12);

  v13 = -[DeviceRestoreChoiceController tableHeightAnchor](v24, "tableHeightAnchor");
  -[NSLayoutConstraint setActive:](v13, "setActive:", 1);

  v14 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:transitionDuration:transitionSpeed:", CFSTR("Start"), 0.01, 1.0);
  v26[0] = v14;
  v15 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("Light"), CFSTR("Dark"), 1.0, 1.0);
  v26[1] = v15;
  location[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2);

  v20 = CFSTR("TransferAppsAndData");
  v25 = 0;
  v16 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v17 = -[UIDevice userInterfaceIdiom](v16, "userInterfaceIdiom");

  v25 = v17;
  v18 = 1;
  if (v17 != (id)1)
    v18 = v25 == (id)5;
  if (v18)
    objc_storeStrong((id *)&v20, CFSTR("TransferAppsandData-Pad"));
  v19 = -[DeviceRestoreChoiceController buddy_animationController:animatedStates:startAtFirstState:](v24, "buddy_animationController:animatedStates:startAtFirstState:", v20, location[0], 1);
  -[DeviceRestoreChoiceController setAnimationController:](v24, "setAnimationController:", v19);

  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidLayoutSubviews
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  NSLayoutConstraint *v8;
  objc_super v9;
  uint64_t v10;
  double v11;
  SEL v12;
  DeviceRestoreChoiceController *v13;

  v13 = self;
  v12 = a2;
  v2 = -[DeviceRestoreChoiceController tableView](self, "tableView");
  objc_msgSend(v2, "reloadData");

  v3 = -[DeviceRestoreChoiceController view](v13, "view");
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = -[DeviceRestoreChoiceController tableView](v13, "tableView");
  objc_msgSend(v4, "contentSize");
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = -[DeviceRestoreChoiceController tableHeightAnchor](v13, "tableHeightAnchor");
  -[NSLayoutConstraint setConstant:](v8, "setConstant:", v7);

  v9.receiver = v13;
  v9.super_class = (Class)DeviceRestoreChoiceController;
  -[DeviceRestoreChoiceController viewDidLayoutSubviews](&v9, "viewDidLayoutSubviews");
}

- (void)traitCollectionDidChange:(id)a3
{
  UITableView *v3;
  UITableView *v4;
  double v5;
  double v6;
  NSLayoutConstraint *v7;
  objc_super v8;
  id location[2];
  DeviceRestoreChoiceController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8.receiver = v10;
  v8.super_class = (Class)DeviceRestoreChoiceController;
  -[DeviceRestoreChoiceController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", location[0]);
  v3 = -[DeviceRestoreChoiceController choiceTable](v10, "choiceTable");
  -[UITableView layoutIfNeeded](v3, "layoutIfNeeded");

  v4 = -[DeviceRestoreChoiceController choiceTable](v10, "choiceTable");
  -[UITableView contentSize](v4, "contentSize");
  v6 = v5;
  v7 = -[DeviceRestoreChoiceController tableHeightAnchor](v10, "tableHeightAnchor");
  -[NSLayoutConstraint setConstant:](v7, "setConstant:", v6);

  objc_storeStrong(location, 0);
}

- (void)selectChoiceForIdentifier:(id)a3
{
  NSMutableDictionary *v3;
  id v4;
  uint64_t v5;
  DeviceRestoreChoiceController *v6;
  NSMutableDictionary *v7;
  id v8;
  os_log_t oslog;
  id location[2];
  DeviceRestoreChoiceController *v11;
  uint8_t buf[24];

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[DeviceRestoreChoiceController choiceMap](v11, "choiceMap");
  v4 = -[NSMutableDictionary objectForKey:](v3, "objectForKey:", location[0]);

  if (v4)
  {
    v6 = v11;
    v7 = -[DeviceRestoreChoiceController choiceMap](v11, "choiceMap");
    v8 = -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", location[0]);
    -[DeviceRestoreChoiceController didSelectChoice:](v6, "didSelectChoice:", v8);

  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10003EB04((uint64_t)buf, (uint64_t)v11, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ cannot finish with controller identifier choice %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_migrateFromiOSSelected
{
  id v2;
  id v3;
  id v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(NSObject *, char, id);
  void *v9;
  id v10[2];
  DeviceRestoreChoiceController *v11;

  v11 = self;
  v10[1] = (id)a2;
  v2 = -[DeviceRestoreChoiceController view](self, "view");
  v3 = objc_msgSend(v2, "window");
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v11, CFSTR("com.apple.buddy.migrateFromiOSChoice.spinner"));
  v4 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000C8388;
  v9 = &unk_100280FD8;
  v10[0] = v11;
  objc_msgSend(v4, "removeAccountsCreatedByProximityWithCompletion:", &v5);

  objc_storeStrong(v10, 0);
}

- (BOOL)_useCompactMode
{
  id v2;
  double v3;
  BOOL v4;

  v2 = -[DeviceRestoreChoiceController view](self, "view");
  objc_msgSend(v2, "bounds");
  v4 = v3 < 760.0;

  return v4;
}

- (void)flowItemDidAppear:(BOOL)a3
{
  BYPreferencesController *v3;

  v3 = -[DeviceRestoreChoiceController buddyPreferences](self, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("RestoreChoice"));

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  BuddyTableChoiceManager *v5;
  id v6;
  double v7;
  double v8;
  id v10;
  id location[2];
  DeviceRestoreChoiceController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v5 = -[DeviceRestoreChoiceController choiceManager](v12, "choiceManager");
  v6 = -[BuddyTableChoiceManager tableViewDelegate](v5, "tableViewDelegate");
  objc_msgSend(v6, "tableView:estimatedHeightForRowAtIndexPath:", location[0], v10);
  v8 = v7;

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  BuddyTableChoiceManager *v5;
  id v6;
  double v7;
  double v8;
  id v10;
  id location[2];
  DeviceRestoreChoiceController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v5 = -[DeviceRestoreChoiceController choiceManager](v12, "choiceManager");
  v6 = -[BuddyTableChoiceManager tableViewDelegate](v5, "tableViewDelegate");
  objc_msgSend(v6, "tableView:heightForRowAtIndexPath:", location[0], v10);
  v8 = v7;

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  BuddyTableChoiceManager *v5;
  id v6;
  id v7;
  id location[2];
  DeviceRestoreChoiceController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = -[DeviceRestoreChoiceController choiceManager](v9, "choiceManager");
  v6 = -[BuddyTableChoiceManager tableViewDelegate](v5, "tableViewDelegate");
  objc_msgSend(v6, "tableView:didSelectRowAtIndexPath:", location[0], v7);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id location[2];
  DeviceRestoreChoiceController *v6;
  double v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[DeviceRestoreChoiceController _useCompactMode](v6, "_useCompactMode"))
    v7 = 10.0;
  else
    v7 = UITableViewAutomaticDimension;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id location[2];
  DeviceRestoreChoiceController *v6;
  double v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[DeviceRestoreChoiceController _useCompactMode](v6, "_useCompactMode"))
    v7 = 0.0;
  else
    v7 = UITableViewAutomaticDimension;
  objc_storeStrong(location, 0);
  return v7;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
  objc_storeStrong((id *)&self->_suspendTask, a3);
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestoreState, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->_enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentCoordinator, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
  objc_storeStrong((id *)&self->_setupMethod, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, a3);
}

- (BuddyChoice)cloudRestoreChoice
{
  return self->_cloudRestoreChoice;
}

- (void)setCloudRestoreChoice:(id)a3
{
  objc_storeStrong((id *)&self->_cloudRestoreChoice, a3);
}

- (BuddyChoice)iTunesRestoreChoice
{
  return self->_iTunesRestoreChoice;
}

- (void)setITunesRestoreChoice:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesRestoreChoice, a3);
}

- (BuddyChoice)setUpAsNewChoice
{
  return self->_setUpAsNewChoice;
}

- (void)setSetUpAsNewChoice:(id)a3
{
  objc_storeStrong((id *)&self->_setUpAsNewChoice, a3);
}

- (BuddyChoice)migrateFromAndroidChoice
{
  return self->_migrateFromAndroidChoice;
}

- (void)setMigrateFromAndroidChoice:(id)a3
{
  objc_storeStrong((id *)&self->_migrateFromAndroidChoice, a3);
}

- (BuddyChoice)migrateFromiOSChoice
{
  return self->_migrateFromiOSChoice;
}

- (void)setMigrateFromiOSChoice:(id)a3
{
  objc_storeStrong((id *)&self->_migrateFromiOSChoice, a3);
}

- (BuddyTableChoiceManager)choiceManager
{
  return self->_choiceManager;
}

- (void)setChoiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_choiceManager, a3);
}

- (NSLayoutConstraint)tableHeightAnchor
{
  return self->_tableHeightAnchor;
}

- (void)setTableHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_tableHeightAnchor, a3);
}

- (UITableView)choiceTable
{
  return self->_choiceTable;
}

- (void)setChoiceTable:(id)a3
{
  objc_storeStrong((id *)&self->_choiceTable, a3);
}

- (NSMutableDictionary)choiceMap
{
  return self->_choiceMap;
}

- (void)setChoiceMap:(id)a3
{
  objc_storeStrong((id *)&self->_choiceMap, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_choiceMap, 0);
  objc_storeStrong((id *)&self->_choiceTable, 0);
  objc_storeStrong((id *)&self->_tableHeightAnchor, 0);
  objc_storeStrong((id *)&self->_choiceManager, 0);
  objc_storeStrong((id *)&self->_migrateFromiOSChoice, 0);
  objc_storeStrong((id *)&self->_migrateFromAndroidChoice, 0);
  objc_storeStrong((id *)&self->_setUpAsNewChoice, 0);
  objc_storeStrong((id *)&self->_iTunesRestoreChoice, 0);
  objc_storeStrong((id *)&self->_cloudRestoreChoice, 0);
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_setupMethod, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_enrollmentCoordinator, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
  objc_storeStrong((id *)&self->_suspendTask, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
