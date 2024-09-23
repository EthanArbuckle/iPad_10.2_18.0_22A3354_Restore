@implementation BuddyMigrationTargetErrorController

- (BuddyMigrationTargetErrorController)initWithError:(id)a3
{
  id v3;
  BuddyMigrationTargetErrorController *v4;
  objc_super v6;
  id location[2];
  id v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyMigrationTargetErrorController;
  v8 = -[BuddyMigrationBaseErrorController initWithError:](&v6, "initWithError:", location[0]);
  objc_storeStrong(&v8, v8);
  if (v8)
    *((_BYTE *)v8 + 25) = 1;
  v4 = (BuddyMigrationTargetErrorController *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (id)initForInsufficientSpace
{
  id v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMigrationTargetErrorController;
  location = -[BuddyMigrationBaseErrorController initForInsufficientSpace](&v4, "initForInsufficientSpace");
  objc_storeStrong(&location, location);
  if (location)
    *((_BYTE *)location + 25) = 1;
  v2 = location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)loadView
{
  id v2;
  NSError *v3;
  id v4;
  id v5;
  NSError *v6;
  id v7;
  BuddyMigrationTargetErrorController *v8;
  NSBundle *v9;
  NSString *v10;
  BuddyMigrationTargetErrorController *v11;
  objc_super v12;
  SEL v13;
  BuddyMigrationTargetErrorController *v14;

  v14 = self;
  v13 = a2;
  v12.receiver = self;
  v12.super_class = (Class)BuddyMigrationTargetErrorController;
  -[BuddyMigrationTargetErrorController loadView](&v12, "loadView");
  v2 = -[BuddyMigrationTargetErrorController headerView](v14, "headerView");
  v3 = -[BuddyMigrationBaseErrorController error](v14, "error");
  v4 = +[BuddyMigrationError titleForError:](BuddyMigrationError, "titleForError:", v3);
  objc_msgSend(v2, "setTitle:", v4);

  v5 = -[BuddyMigrationTargetErrorController headerView](v14, "headerView");
  v6 = -[BuddyMigrationBaseErrorController error](v14, "error");
  v7 = +[BuddyMigrationError detailTextForErrorOnTarget:requiresErase:](BuddyMigrationError, "detailTextForErrorOnTarget:requiresErase:", v6, -[BuddyMigrationTargetErrorController forceErase](v14, "forceErase"));
  objc_msgSend(v5, "setDetailText:", v7);

  if (-[BuddyMigrationTargetErrorController allowInteraction](v14, "allowInteraction"))
  {
    if (-[BuddyMigrationTargetErrorController forceErase](v14, "forceErase"))
    {
      v8 = v14;
      v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("RESET"), &stru_100284738, CFSTR("Localizable"));
      -[BuddyWelcomeController addBoldButton:action:](v8, "addBoldButton:action:", v10, "resetTapped:");
    }
    else
    {
      v11 = v14;
      v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("MIGRATION_ERROR_SET_UP_MANUALLY"), &stru_100284738, CFSTR("Migration"));
      -[BuddyWelcomeController addBoldButton:action:](v11, "addBoldButton:action:", v10, "startOverTapped:");
    }

  }
}

- (void)resetTapped:(id)a3
{
  BuddyMiscState *v3;
  BuddyMigrationLockscreenController *v4;
  id v5;
  id v6;
  id v7;
  ProximitySetupController *v8;
  BYAnalyticsManager *v9;
  BuddyEraseAlertController *v10;
  id location[2];
  BuddyMigrationTargetErrorController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationTargetErrorController miscState](v12, "miscState");
  v4 = -[BuddyMiscState migrationLockscreenController](v3, "migrationLockscreenController");
  -[BuddyMigrationLockscreenController deactivate](v4, "deactivate");

  v5 = -[BuddyMigrationTargetErrorController view](v12, "view");
  v6 = objc_msgSend(v5, "window");
  v7 = -[BuddyMigrationTargetErrorController navigationController](v12, "navigationController");
  v8 = -[BuddyMigrationTargetErrorController proximitySetupController](v12, "proximitySetupController");
  v9 = -[BuddyMigrationTargetErrorController analyticsManager](v12, "analyticsManager");
  v10 = +[BuddyEraseAlertController alertControllerWithWindow:navigationController:proximitySetupController:analyticsManager:](BuddyEraseAlertController, "alertControllerWithWindow:navigationController:proximitySetupController:analyticsManager:", v6, v7, v8, v9);

  -[BuddyMigrationTargetErrorController presentViewController:animated:completion:](v12, "presentViewController:animated:completion:", v10, 1, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)startOverTapped:(id)a3
{
  BuddyMiscState *v3;
  BuddyMigrationLockscreenController *v4;
  BFFFlowItemDelegate *v5;
  id v6;
  id location[2];
  BuddyMigrationTargetErrorController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationTargetErrorController miscState](v8, "miscState");
  v4 = -[BuddyMiscState migrationLockscreenController](v3, "migrationLockscreenController");
  -[BuddyMigrationLockscreenController deactivate](v4, "deactivate");

  v5 = -[BuddyWelcomeController delegate](v8, "delegate");
  v6 = -[BFFFlowItemDelegate popToBuddyControllerWithClass:animated:](v5, "popToBuddyControllerWithClass:animated:", objc_opt_class(DeviceRestoreChoiceController), 1);

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

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BOOL)forceErase
{
  return self->_forceErase;
}

- (void)setForceErase:(BOOL)a3
{
  self->_forceErase = a3;
}

- (BOOL)allowInteraction
{
  return self->_allowInteraction;
}

- (void)setAllowInteraction:(BOOL)a3
{
  self->_allowInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
}

@end
