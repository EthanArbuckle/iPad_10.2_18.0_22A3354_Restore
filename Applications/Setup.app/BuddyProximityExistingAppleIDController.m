@implementation BuddyProximityExistingAppleIDController

- (BuddyProximityExistingAppleIDController)init
{
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  BuddyProximityExistingAppleIDController *v7;
  objc_super v9;
  SEL v10;
  id location;

  v10 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_EXISTING_APPLEID_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_EXISTING_APPLEID_DETAIL"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyProximityExistingAppleIDController;
  location = -[BuddyProximityExistingAppleIDController initWithTitle:detailText:symbolName:contentLayout:](&v9, "initWithTitle:detailText:symbolName:contentLayout:", v4, v6, CFSTR("exclamationmark.triangle"), 2);
  objc_storeStrong(&location, location);

  v7 = (BuddyProximityExistingAppleIDController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  BuddyProximityExistingAppleIDController *v2;
  NSBundle *v3;
  id v4;
  NSString *v5;
  id v6;
  objc_super v7;
  SEL v8;
  BuddyProximityExistingAppleIDController *v9;

  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyProximityExistingAppleIDController;
  -[BuddyProximityExistingAppleIDController viewDidLoad](&v7, "viewDidLoad");
  v2 = v9;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ERASE_DEVICE"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v2, "addBoldButton:action:", v5, "_resetTapped:");

  v6 = -[BuddyProximityExistingAppleIDController navigationItem](v9, "navigationItem");
  objc_msgSend(v6, "setHidesBackButton:", 1);

}

- (void)_resetTapped:(id)a3
{
  id v3;
  id v4;
  id v5;
  ProximitySetupController *v6;
  BYAnalyticsManager *v7;
  id location[2];
  BuddyProximityExistingAppleIDController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityExistingAppleIDController view](v9, "view");
  v4 = objc_msgSend(v3, "window");
  v5 = -[BuddyProximityExistingAppleIDController navigationController](v9, "navigationController");
  v6 = -[BuddyProximityExistingAppleIDController proximitySetupController](v9, "proximitySetupController");
  v7 = -[BuddyProximityExistingAppleIDController analyticsManager](v9, "analyticsManager");
  +[BuddyEraseAlertController eraseWithWindow:navigationController:proximitySetupController:analyticsManager:](BuddyEraseAlertController, "eraseWithWindow:navigationController:proximitySetupController:analyticsManager:", v4, v5, v6, v7);

  objc_storeStrong(location, 0);
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BOOL)controllerNeedsToRun
{
  ProximitySetupController *v2;
  SASProximityInformation *v3;
  char v4;
  id v5;
  id v6;
  char v7;
  char v9;
  id v10;
  char v11;
  SASProximityInformation *v12;
  char v13;
  ProximitySetupController *v14;
  id location;
  char v16;
  id v17;
  SEL v18;
  BuddyProximityExistingAppleIDController *v19;
  char v20;

  v19 = self;
  v18 = a2;
  v2 = -[BuddyProximityExistingAppleIDController proximitySetupController](self, "proximitySetupController");
  v3 = -[ProximitySetupController information](v2, "information");
  v16 = 0;
  v4 = 1;
  if (v3)
  {
    v17 = -[BuddyProximityExistingAppleIDController proximitySetupController](v19, "proximitySetupController");
    v16 = 1;
    v4 = objc_msgSend(v17, "hasConnection") ^ 1;
  }
  if ((v16 & 1) != 0)

  if ((v4 & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
    v5 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
    location = objc_msgSend(v6, "username");

    v13 = 0;
    v11 = 0;
    v9 = 0;
    v7 = 0;
    if (location)
    {
      v14 = -[BuddyProximityExistingAppleIDController proximitySetupController](v19, "proximitySetupController");
      v13 = 1;
      v12 = -[ProximitySetupController information](v14, "information");
      v11 = 1;
      v10 = -[SASProximityInformation appleID](v12, "appleID");
      v9 = 1;
      v7 = objc_msgSend(v10, "isEqualToString:", location) ^ 1;
    }
    v20 = v7 & 1;
    if ((v9 & 1) != 0)

    if ((v11 & 1) != 0)
    if ((v13 & 1) != 0)

    objc_storeStrong(&location, 0);
  }
  return v20 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSObject *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyProximityExistingAppleIDController *v9;
  id location[2];
  BuddyProximityExistingAppleIDController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(25, 0);
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10016E714;
  v8 = &unk_100280730;
  v9 = v11;
  dispatch_async(v3, &v4);

  if (location[0])
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

@end
