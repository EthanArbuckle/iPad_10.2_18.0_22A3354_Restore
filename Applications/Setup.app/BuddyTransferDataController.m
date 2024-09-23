@implementation BuddyTransferDataController

- (BuddyTransferDataController)init
{
  BuddyTransferDataController *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyTransferDataController;
  location = -[BuddyTransferDataController initWithTitle:detailText:icon:](&v4, "initWithTitle:detailText:icon:", &stru_100284738, 0, 0);
  v2 = (BuddyTransferDataController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidLoad
{
  id v2;
  unsigned __int8 v3;
  ProximitySetupController *v4;
  SASProximityInformation *v5;
  unsigned __int8 v6;
  BuddyMiscState *v7;
  BuddyTargetDeviceMigrationManager *v8;
  id v9;
  id v10;
  UIImage *v11;
  id v12;
  UIImage *v13;
  id v14;
  id v15;
  ProximitySetupController *v16;
  NSBundle *v17;
  NSString *v18;
  NSString *v19;
  id v20;
  NSBundle *v21;
  id v22;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  id v26;
  id location;
  unsigned __int8 v28;
  unsigned __int8 v29;
  id v30;
  objc_super v31;
  SEL v32;
  BuddyTransferDataController *v33;

  v33 = self;
  v32 = a2;
  v31.receiver = self;
  v31.super_class = (Class)BuddyTransferDataController;
  -[BuddyTransferDataController viewDidLoad](&v31, "viewDidLoad");
  v30 = 0;
  v2 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v3 = objc_msgSend(v2, "hasHomeButton");

  v29 = v3;
  v4 = -[BuddyTransferDataController proximitySetupController](v33, "proximitySetupController");
  v5 = -[ProximitySetupController information](v4, "information");
  v6 = -[SASProximityInformation hasHomeButton](v5, "hasHomeButton");

  v28 = v6;
  v7 = -[BuddyTransferDataController miscState](v33, "miscState");
  v8 = -[BuddyMiscState migrationManager](v7, "migrationManager");
  v9 = -[BuddyTargetDeviceMigrationManager connectionInfo](v8, "connectionInfo");
  v10 = objc_msgSend(v9, "connectionType");

  if (v10 == (id)1)
  {
    if ((v29 & 1) != 0)
    {
      if ((v28 & 1) != 0)
        v11 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Transfer Data Migration Wired Both with Home Button"));
      else
        v11 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Transfer Data Migration Wired with Home Button"));
    }
    else if ((v28 & 1) != 0)
    {
      v11 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Transfer Data Migration Wired without Home Button"));
    }
    else
    {
      v11 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Transfer Data Migration Wired Both without Home Button"));
    }
    v12 = v30;
    v30 = v11;

  }
  else
  {
    v13 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Transfer Options Migrate Wireless"));
    v14 = v30;
    v30 = v13;

  }
  v15 = -[BuddyTransferDataController headerView](v33, "headerView");
  objc_msgSend(v15, "setIcon:accessibilityLabel:", v30, 0);

  v16 = -[BuddyTransferDataController proximitySetupController](v33, "proximitySetupController");
  location = -[ProximitySetupController deviceName](v16, "deviceName");

  v17 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v18 = -[NSBundle localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", CFSTR("TRANSFER_DATA_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, location);
  v20 = -[BuddyTransferDataController headerView](v33, "headerView");
  objc_msgSend(v20, "setTitle:", v19);

  v21 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v22 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("TRANSFER_DATA_DESCRIPTION"));
  v23 = -[NSBundle localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", v22, &stru_100284738, CFSTR("Localizable"));
  v24 = -[BuddyTransferDataController estimatedMigrationDuration](v33, "estimatedMigrationDuration");
  v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, location, v24);
  v26 = -[BuddyTransferDataController headerView](v33, "headerView");
  objc_msgSend(v26, "setDetailText:", v25);

  -[BuddyTransferDataController _setupButtons](v33, "_setupButtons");
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v30, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (void)_setupButtons
{
  NSBundle *v2;
  NSString *v3;
  id v4;
  NSBundle *v5;
  NSString *v6;
  id v7;
  id v8;
  id location[2];
  BuddyTransferDataController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(location[0], "setTitle:forState:", v3, 0);

  objc_msgSend(location[0], "addTarget:action:forControlEvents:", v10, "_continueTapped:", 64);
  v4 = -[BuddyTransferDataController buttonTray](v10, "buttonTray");
  objc_msgSend(v4, "addButton:", location[0]);

  v8 = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("TRANSFER_OPTIONS_OTHER_OPTIONS"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v8, "setTitle:forState:", v6, 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", v10, "_otherOptionsTapped:", 64);
  v7 = -[BuddyTransferDataController buttonTray](v10, "buttonTray");
  objc_msgSend(v7, "addButton:", v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_continueTapped:(id)a3
{
  void (**v3)(_QWORD);
  BFFFlowItemDelegate *v4;
  id location[2];
  BuddyTransferDataController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(_QWORD))-[BuddyTransferDataController startDeviceMigrationBlock](v6, "startDeviceMigrationBlock");
  v3[2](v3);

  -[BuddyTransferDataController _updateAnalyticsWithChoice:](v6, "_updateAnalyticsWithChoice:", CFSTR("migration"));
  v4 = -[BuddyWelcomeController delegate](v6, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v4, "flowItemDone:", v6);

  objc_storeStrong(location, 0);
}

- (void)_otherOptionsTapped:(id)a3
{
  BuddyMiscState *v3;
  BuddyTargetDeviceMigrationManager *v4;
  BFFFlowItemDelegate *v5;
  id location[2];
  BuddyTransferDataController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTransferDataController miscState](v7, "miscState");
  v4 = -[BuddyMiscState migrationManager](v3, "migrationManager");
  -[BuddyTargetDeviceMigrationManager cancelWithCause:](v4, "cancelWithCause:", 3);

  -[BuddyTransferDataController _updateAnalyticsWithChoice:](v7, "_updateAnalyticsWithChoice:", CFSTR("other"));
  v5 = -[BuddyWelcomeController delegate](v7, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v5, "flowItemDone:", v7);

  objc_storeStrong(location, 0);
}

- (void)_updateAnalyticsWithChoice:(id)a3
{
  BYAnalyticsManager *v3;
  NSDictionary *v4;
  id v5[2];
  BuddyTransferDataController *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  v6 = self;
  v5[1] = (id)a2;
  v5[0] = 0;
  objc_storeStrong(v5, a3);
  v3 = -[BuddyTransferDataController analyticsManager](v6, "analyticsManager");
  v7[0] = CFSTR("choice");
  v8[0] = v5[0];
  v7[1] = CFSTR("type");
  v8[1] = CFSTR("heavy");
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
  objc_storeStrong((id *)&self->sourceDeviceClass, 0);
  objc_storeStrong((id *)&self->estimatedMigrationDuration, 0);
}

@end
