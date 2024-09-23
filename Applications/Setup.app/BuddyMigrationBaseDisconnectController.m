@implementation BuddyMigrationBaseDisconnectController

- (BuddyMigrationBaseDisconnectController)initWithConnectionType:(int64_t)a3
{
  NSBundle *v3;
  NSBundle *v4;
  NSString *v5;
  id v6;
  id v7;
  UIImage *v8;
  BuddyMigrationBaseDisconnectController *v9;
  objc_super v11;
  id v12;
  int64_t v13;
  SEL v14;
  id location;

  location = self;
  v14 = a2;
  v13 = a3;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v12 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MIGRATION_DISCONNECT_TITLE_WIRELESS"), &stru_100284738, CFSTR("Migration"));

  if (v13 == 1)
  {
    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("MIGRATION_DISCONNECT_TITLE_WIRED"), &stru_100284738, CFSTR("Migration"));
    v6 = v12;
    v12 = v5;

  }
  v7 = location;
  v8 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Alert Icon"));
  location = 0;
  v11.receiver = v7;
  v11.super_class = (Class)BuddyMigrationBaseDisconnectController;
  location = -[BuddyMigrationBaseDisconnectController initWithTitle:detailText:icon:](&v11, "initWithTitle:detailText:icon:", v12, 0, v8);
  objc_storeStrong(&location, location);

  v9 = (BuddyMigrationBaseDisconnectController *)location;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
  return v9;
}

- (void)viewDidLoad
{
  id v2;
  UIColor *v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  BuddyMigrationBaseDisconnectController *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMigrationBaseDisconnectController;
  -[BuddyMigrationBaseDisconnectController viewDidLoad](&v6, "viewDidLoad");
  v2 = -[BuddyMigrationBaseDisconnectController headerView](v8, "headerView");
  objc_msgSend(v2, "setIconInheritsTint:", 1);

  v3 = +[UIColor redColor](UIColor, "redColor");
  v4 = -[BuddyMigrationBaseDisconnectController headerView](v8, "headerView");
  objc_msgSend(v4, "setTintColor:", v3);

  v5 = -[BuddyMigrationBaseDisconnectController navigationItem](v8, "navigationItem");
  objc_msgSend(v5, "setHidesBackButton:", 1);

}

@end
