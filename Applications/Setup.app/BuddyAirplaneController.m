@implementation BuddyAirplaneController

- (BuddyAirplaneController)init
{
  NSBundle *v2;
  NSBundle *v3;
  id v4;
  id v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  BuddyAirplaneController *v9;
  objc_super v11;
  id v12;
  id v13[2];
  id location;

  location = self;
  v13[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v13[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_REQUIRED"), &stru_100284738, CFSTR("Localizable"));

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ACTIVATION_AIRPLANE"));
  v12 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));

  v5 = location;
  location = 0;
  v11.receiver = v5;
  v11.super_class = (Class)BuddyAirplaneController;
  location = -[BuddyAirplaneController initWithTitle:detailText:icon:](&v11, "initWithTitle:detailText:icon:", v13[0], v12, 0);
  objc_storeStrong(&location, location);
  if (location)
  {
    v6 = location;
    v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_AIRPLANE_MODE"), &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(v6, "addBoldButton:action:", v8, "_turnOffAirplaneModeTapped");

  }
  v9 = (BuddyAirplaneController *)location;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&location, 0);
  return v9;
}

- (void)_turnOffAirplaneModeTapped
{
  BFFFlowItemDelegate *v2;
  id location[2];
  BuddyAirplaneController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)RadiosPreferences);
  objc_msgSend(location[0], "setAirplaneMode:", 0);
  v2 = -[BuddyWelcomeController delegate](v4, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v2, "flowItemDone:", v4);

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

@end
