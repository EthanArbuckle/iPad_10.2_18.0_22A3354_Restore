@implementation BuddyUpdateFinishedController

- (BuddyUpdateFinishedController)init
{
  NSBundle *v2;
  id v3;
  NSString *v4;
  UIDevice *v5;
  NSString *v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;
  NSArray *v10;
  id v11;
  NSBundle *v12;
  NSString *v13;
  BuddyUpdateFinishedController *v14;
  objc_super v16;
  id location;
  id v18;
  id v19[2];
  id v20;
  _QWORD v21[2];

  v20 = self;
  v19[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("SOFTWARE_UPDATE_COMPLETE_DETAIL"));
  v4 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));
  v5 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = -[UIDevice systemVersion](v5, "systemVersion");
  v19[0] = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v6);

  v7 = +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  v8 = -[UIColor colorWithAlphaComponent:](v7, "colorWithAlphaComponent:", 0.4);
  v21[0] = v8;
  v9 = +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  v21[1] = v9;
  v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2);
  v18 = +[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v10);

  location = +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("gear.badge.checkmark"), v18);
  v11 = v20;
  v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE_COMPLETE_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v20 = 0;
  v16.receiver = v11;
  v16.super_class = (Class)BuddyUpdateFinishedController;
  v20 = -[BuddyUpdateFinishedController initWithTitle:detailText:icon:](&v16, "initWithTitle:detailText:icon:", v13, v19[0], location);
  v14 = (BuddyUpdateFinishedController *)v20;

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v20, 0);
  return v14;
}

- (void)viewDidLoad
{
  BuddyUpdateFinishedController *v2;
  NSBundle *v3;
  NSString *v4;
  objc_super v5;
  SEL v6;
  BuddyUpdateFinishedController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyUpdateFinishedController;
  -[BuddyUpdateFinishedController viewDidLoad](&v5, "viewDidLoad");
  v2 = v7;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v2, "addBoldButton:action:", v4, "_continuePressed:");

}

- (void)_continuePressed:(id)a3
{
  BFFFlowItemDelegate *v3;
  id location[2];
  BuddyUpdateFinishedController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyWelcomeController delegate](v5, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", v5);

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupUpdateCompleted;
}

+ (unint64_t)applicableDispositions
{
  return 0;
}

@end
