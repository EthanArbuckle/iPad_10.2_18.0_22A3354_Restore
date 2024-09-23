@implementation BuddyTransferOptionsController

- (BuddyTransferOptionsController)init
{
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  BuddyTransferOptionsController *v7;
  objc_super v9;
  SEL v10;
  id location;

  v10 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("TRANSFER_OPTIONS_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("TRANSFER_OPTIONS_DESCRIPTION"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyTransferOptionsController;
  location = -[BuddyTransferOptionsController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v9, "initWithTitle:detailText:icon:adoptTableViewScrollView:", v4, v6, 0, 1);
  objc_storeStrong(&location, location);

  v7 = (BuddyTransferOptionsController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  id v2;
  NSBundle *v3;
  NSString *v4;
  id v5;
  NSString *v6;
  id v7;
  BuddyTransferOptionsController *v8;
  id v9;
  BuddyTransferOptionsController *v10;
  id v11;
  id v12;
  id v13;
  NSBundle *v14;
  NSString *v15;
  id v16;
  id location;
  objc_super v18;
  SEL v19;
  BuddyTransferOptionsController *v20;

  v20 = self;
  v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)BuddyTransferOptionsController;
  -[BuddyTransferOptionsController viewDidLoad](&v18, "viewDidLoad");
  if (-[BuddyTransferOptionsController hasMegaBackup](v20, "hasMegaBackup"))
  {
    v2 = -[BuddyTransferOptionsController headerView](v20, "headerView");
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v4 = -[BuddyTransferOptionsController sourceDeviceClass](v20, "sourceDeviceClass");
    v5 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("TRANSFER_OPTIONS_BACKUP_DESCRIPTION"), v4);
    v6 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(v2, "setDetailText:", v6);

  }
  v7 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddyTransferOptionsController setTableView:](v20, "setTableView:", v7);

  v8 = v20;
  v9 = -[BuddyTransferOptionsController tableView](v20, "tableView");
  objc_msgSend(v9, "setDelegate:", v8);

  v10 = v20;
  v11 = -[BuddyTransferOptionsController tableView](v20, "tableView");
  objc_msgSend(v11, "setDataSource:", v10);

  v12 = -[BuddyTransferOptionsController tableView](v20, "tableView");
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = -[BuddyTransferOptionsController tableView](v20, "tableView");
  objc_msgSend(v13, "setSeparatorStyle:", 0);

  location = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
  v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v15 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", CFSTR("TRANSFER_OPTIONS_OTHER_OPTIONS"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(location, "setTitle:forState:", v15, 0);

  objc_msgSend(location, "addTarget:action:forControlEvents:", v20, "_otherOptionsTapped:", 64);
  v16 = -[BuddyTransferOptionsController buttonTray](v20, "buttonTray");
  objc_msgSend(v16, "addButton:", location);

  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyTransferOptionsController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyTransferOptionsController;
  -[BuddyTransferOptionsController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyTransferOptionsController tableView](v7, "tableView");
  objc_msgSend(v3, "reloadData");

}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

- (void)startOver
{
  ProximitySetupController *v2;

  v2 = -[BuddyTransferOptionsController proximitySetupController](self, "proximitySetupController", a2, self);
  -[ProximitySetupController setSkipExpressRestore:](v2, "setSkipExpressRestore:", 0);

}

- (BOOL)isEphemeral
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  unsigned __int8 v6;
  ProximitySetupController *v7;
  SASProximityInformation *v8;
  unsigned __int8 v9;
  BuddyTransferOptionsTableViewCell *v10;
  id v11;
  NSBundle *v12;
  NSString *v13;
  id v14;
  NSBundle *v15;
  id v16;
  id v17;
  NSString *v18;
  id v19;
  NSBundle *v20;
  id v21;
  NSString *v22;
  id v23;
  NSBundle *v24;
  id v25;
  NSString *v26;
  id v27;
  NSBundle *v28;
  NSString *v29;
  NSString *v30;
  NSString *v31;
  id v32;
  BuddyMiscState *v33;
  BuddyTargetDeviceMigrationManager *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  ProximitySetupController *v41;
  NSString *v42;
  unsigned __int8 v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v56;
  id v57;
  char v58;
  void **v59;
  int v60;
  int v61;
  void (*v62)(uint64_t);
  void *v63;
  id v64[2];
  char v65;
  char v66;
  BOOL v67;
  uint64_t v68;
  id *v69;
  int v70;
  int v71;
  void (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  id v75;
  id v76;
  id location[2];
  BuddyTransferOptionsController *v78;

  v78 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v76 = 0;
  objc_storeStrong(&v76, a4);
  v75 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("cell"));
  v68 = 0;
  v69 = (id *)&v68;
  v70 = 838860800;
  v71 = 48;
  v72 = sub_10014B6FC;
  v73 = sub_10014B72C;
  v74 = 0;
  v67 = objc_msgSend(v76, "section") == 0;
  v5 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v6 = objc_msgSend(v5, "hasHomeButton");

  v66 = v6 & 1;
  v7 = -[BuddyTransferOptionsController proximitySetupController](v78, "proximitySetupController");
  v8 = -[ProximitySetupController information](v7, "information");
  v9 = -[SASProximityInformation hasHomeButton](v8, "hasHomeButton");

  v65 = v9 & 1;
  if (!v75)
  {
    v10 = -[BuddyTransferOptionsTableViewCell initWithStyle:reuseIdentifier:]([BuddyTransferOptionsTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("cell"));
    v11 = v75;
    v75 = v10;

  }
  if (v67)
  {
    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("TRANSFER_OPTIONS_RESTORE_OPTION_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v14 = objc_msgSend(v75, "nameLabel");
    objc_msgSend(v14, "setText:", v13);

    v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v16 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("TRANSFER_OPTIONS_RESTORE_OPTION_DETAIL_WIFI"));
    v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v16);
    v18 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", v17, &stru_100284738, CFSTR("Localizable"));
    v19 = objc_msgSend(v75, "descriptionLabel");
    objc_msgSend(v19, "setText:", v18);

    if ((v66 & 1) != 0)
      objc_storeStrong(v69 + 5, CFSTR("Transfer Option Cloud with Home Button"));
    else
      objc_storeStrong(v69 + 5, CFSTR("Transfer Option Cloud without Home Button"));
  }
  else
  {
    v20 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v21 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("TRANSFER_OPTIONS_MIGRATE_OPTION_TITLE"));
    v22 = -[NSBundle localizedStringForKey:value:table:](v20, "localizedStringForKey:value:table:", v21, &stru_100284738, CFSTR("Localizable"));
    v23 = objc_msgSend(v75, "nameLabel");
    objc_msgSend(v23, "setText:", v22);

    v24 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v25 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("TRANSFER_OPTIONS_MIGRATE_OPTION_DETAIL"));
    v26 = -[NSBundle localizedStringForKey:value:table:](v24, "localizedStringForKey:value:table:", v25, &stru_100284738, CFSTR("Localizable"));
    v27 = objc_msgSend(v75, "descriptionLabel");
    objc_msgSend(v27, "setText:", v26);

    v28 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v29 = -[NSBundle localizedStringForKey:value:table:](v28, "localizedStringForKey:value:table:", CFSTR("TRANSFER_OPTIONS_MIGRATE_OPTION_TIME_ESTIMATE_PREFIX"), &stru_100284738, CFSTR("Localizable"));
    v30 = -[BuddyTransferOptionsController estimatedMigrationDuration](v78, "estimatedMigrationDuration");
    v31 = -[NSString stringByAppendingString:](v29, "stringByAppendingString:", v30);
    v32 = objc_msgSend(v75, "footnoteLabel");
    objc_msgSend(v32, "setText:", v31);

    if ((v66 & 1) != 0)
    {
      if ((v65 & 1) != 0)
        objc_storeStrong(v69 + 5, CFSTR("Transfer Options Migration Wireless Both with Home Button"));
      else
        objc_storeStrong(v69 + 5, CFSTR("Transfer Options Migration Wireless with Home Button"));
    }
    else if ((v65 & 1) != 0)
    {
      objc_storeStrong(v69 + 5, CFSTR("Transfer Options Migration Wireless without Home Button"));
    }
    else
    {
      objc_storeStrong(v69 + 5, CFSTR("Transfer Options Migration Wireless Both without Home Button"));
    }
    v33 = -[BuddyTransferOptionsController miscState](v78, "miscState");
    v34 = -[BuddyMiscState migrationManager](v33, "migrationManager");
    v35 = -[BuddyTargetDeviceMigrationManager connectionInfo](v34, "connectionInfo");
    v36 = objc_msgSend(v35, "connectionType");

    if (v36 == (id)1)
    {
      v37 = objc_msgSend(v69[5], "stringByReplacingOccurrencesOfString:withString:", CFSTR("Wireless"), CFSTR("Wired"));
      v38 = v69[5];
      v69[5] = v37;

    }
  }
  v39 = -[BuddyTransferOptionsController view](v78, "view");
  v40 = objc_msgSend(v39, "traitCollection");
  v59 = _NSConcreteStackBlock;
  v60 = -1073741824;
  v61 = 0;
  v62 = sub_10014B738;
  v63 = &unk_100282378;
  v64[0] = v78;
  v64[1] = &v68;
  objc_msgSend(v40, "performAsCurrentTraitCollection:", &v59);

  v41 = -[BuddyTransferOptionsController proximitySetupController](v78, "proximitySetupController");
  v42 = -[ProximitySetupController productVersion](v41, "productVersion");
  v43 = -[NSString hasPrefix:](v42, "hasPrefix:", CFSTR("iPhone15,"));

  v58 = v43 & 1;
  if (v67)
  {
    if ((SBUIIsSystemApertureEnabled() & 1) != 0)
    {
      v44 = objc_msgSend(v69[5], "stringByAppendingString:", CFSTR(" D7X"));
      v45 = v69[5];
      v69[5] = v44;

    }
  }
  else if ((SBUIIsSystemApertureEnabled() & 1) != 0)
  {
    v57 = CFSTR(" D7X");
    if ((v65 & 1) == 0 && (v58 & 1) == 0)
      objc_storeStrong(&v57, CFSTR(" D3X-D7X"));
    v46 = objc_msgSend(v69[5], "stringByAppendingString:", v57);
    v47 = v69[5];
    v69[5] = v46;

    objc_storeStrong(&v57, 0);
  }
  else if ((v58 & 1) != 0 && (v66 & 1) == 0)
  {
    v48 = objc_msgSend(v69[5], "stringByAppendingString:", CFSTR(" D7X-D3X"));
    v49 = v69[5];
    v69[5] = v48;

  }
  v50 = objc_alloc((Class)NSDataAsset);
  v56 = objc_msgSend(v50, "initWithName:", v69[5]);
  v51 = v75;
  v52 = objc_msgSend(v56, "data");
  v53 = +[CALayer buddy_layerForPackageWithData:geometryFlipped:scale:](CALayer, "buddy_layerForPackageWithData:geometryFlipped:scale:", v52, 0, 3.0);
  objc_msgSend(v51, "setIconLayer:", v53);

  v54 = v75;
  objc_storeStrong(&v56, 0);
  objc_storeStrong(v64, 0);
  _Block_object_dispose(&v68, 8);
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(location, 0);
  return v54;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 2;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id location[3];
  double v7;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 == 1)
    v7 = 16.0;
  else
    v7 = 0.0;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a4);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  BuddyMiscState *v5;
  BuddyTargetDeviceMigrationManager *v6;
  BFFFlowItemDelegate *v7;
  id v8;
  id location[2];
  BuddyTransferOptionsController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  if (objc_msgSend(v8, "section"))
  {
    -[BuddyTransferOptionsController _updateAnalyticsWithChoice:](v10, "_updateAnalyticsWithChoice:", CFSTR("migration"));
    v5 = (BuddyMiscState *)-[BuddyTransferOptionsController startDeviceMigrationBlock](v10, "startDeviceMigrationBlock");
    (*(void (**)(BuddyMiscState *))&v5->_launchedWithCombinedAnalyticsMismatch)(v5);
  }
  else
  {
    -[BuddyTransferOptionsController _updateAnalyticsWithChoice:](v10, "_updateAnalyticsWithChoice:", CFSTR("cloud"));
    v5 = -[BuddyTransferOptionsController miscState](v10, "miscState");
    v6 = -[BuddyMiscState migrationManager](v5, "migrationManager");
    -[BuddyTargetDeviceMigrationManager cancelWithCause:](v6, "cancelWithCause:", 3);

  }
  objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v8, 1);
  v7 = -[BuddyTransferOptionsController delegate](v10, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v7, "flowItemDone:", v10);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  UIColor *v14;
  id v15;
  UIColor *v16;
  id v17;
  UIColor *v18;
  id v19;
  id v20;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v7 = objc_msgSend(v20, "contentView");
  objc_msgSend(v7, "_setContinuousCornerRadius:", 10.0);

  v8 = objc_msgSend(v20, "selectedBackgroundView");
  v9 = objc_msgSend(v8, "layer");
  objc_msgSend(v9, "setMasksToBounds:", 1);

  v10 = objc_msgSend(v20, "contentView");
  objc_msgSend(v10, "_continuousCornerRadius");
  v12 = v11;
  v13 = objc_msgSend(v20, "selectedBackgroundView");
  objc_msgSend(v13, "_setContinuousCornerRadius:", v12);

  v14 = +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
  v15 = objc_msgSend(v20, "contentView");
  objc_msgSend(v15, "setBackgroundColor:", v14);

  v16 = +[UIColor systemGray5Color](UIColor, "systemGray5Color");
  v17 = objc_msgSend(v20, "selectedBackgroundView");
  objc_msgSend(v17, "setBackgroundColor:", v16);

  v18 = +[UIColor clearColor](UIColor, "clearColor");
  objc_msgSend(v20, "setBackgroundColor:", v18);

  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)_otherOptionsTapped:(id)a3
{
  BuddyMiscState *v3;
  BuddyTargetDeviceMigrationManager *v4;
  ProximitySetupController *v5;
  BFFFlowItemDelegate *v6;
  id location[2];
  BuddyTransferOptionsController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTransferOptionsController miscState](v8, "miscState");
  v4 = -[BuddyMiscState migrationManager](v3, "migrationManager");
  -[BuddyTargetDeviceMigrationManager cancelWithCause:](v4, "cancelWithCause:", 3);

  v5 = -[BuddyTransferOptionsController proximitySetupController](v8, "proximitySetupController");
  -[ProximitySetupController setSkipExpressRestore:](v5, "setSkipExpressRestore:", 1);

  -[BuddyTransferOptionsController _updateAnalyticsWithChoice:](v8, "_updateAnalyticsWithChoice:", CFSTR("other"));
  v6 = -[BuddyTransferOptionsController delegate](v8, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v6, "flowItemDone:", v8);

  objc_storeStrong(location, 0);
}

- (void)_updateAnalyticsWithChoice:(id)a3
{
  BYAnalyticsManager *v3;
  NSDictionary *v4;
  id v5[2];
  BuddyTransferOptionsController *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  v6 = self;
  v5[1] = (id)a2;
  v5[0] = 0;
  objc_storeStrong(v5, a3);
  v3 = -[BuddyTransferOptionsController analyticsManager](v6, "analyticsManager");
  v7[0] = CFSTR("choice");
  v8[0] = v5[0];
  v7[1] = CFSTR("type");
  v8[1] = CFSTR("light");
  v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  -[BYAnalyticsManager addEvent:withPayload:persist:](v3, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.migrationUpsell"), v4, 1);

  objc_storeStrong(v5, 0);
}

- (NSString)estimatedMigrationDuration
{
  return self->estimatedMigrationDuration;
}

- (void)setEstimatedMigrationDuration:(id)a3
{
  objc_storeStrong((id *)&self->estimatedMigrationDuration, a3);
}

- (BOOL)hasMegaBackup
{
  return self->hasMegaBackup;
}

- (void)setHasMegaBackup:(BOOL)a3
{
  self->hasMegaBackup = a3;
}

- (NSString)sourceDeviceClass
{
  return self->sourceDeviceClass;
}

- (void)setSourceDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->sourceDeviceClass, a3);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (id)startDeviceMigrationBlock
{
  return self->_startDeviceMigrationBlock;
}

- (void)setStartDeviceMigrationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong(&self->_startDeviceMigrationBlock, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->sourceDeviceClass, 0);
  objc_storeStrong((id *)&self->estimatedMigrationDuration, 0);
}

@end
