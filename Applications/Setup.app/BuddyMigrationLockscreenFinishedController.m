@implementation BuddyMigrationLockscreenFinishedController

- (BuddyMigrationLockscreenFinishedController)init
{
  NSBundle *v2;
  NSBundle *v3;
  id v4;
  id v5;
  UIImage *v6;
  BuddyMigrationLockscreenFinishedController *v7;
  objc_super v9;
  id v10;
  id v11[2];
  id location;

  location = self;
  v11[1] = (id)a2;
  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v11[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("MIGRATION_SOURCE_TRANSFER_COMPLETE_TITLE"), &stru_100284738, CFSTR("Migration"));

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(location));
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MIGRATION_SOURCE_TRANSFER_COMPLETE_DETAIL"));
  v10 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Migration"));

  v5 = location;
  v6 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Checkmark"));
  location = 0;
  v9.receiver = v5;
  v9.super_class = (Class)BuddyMigrationLockscreenFinishedController;
  location = -[BuddyMigrationLockscreenFinishedController initWithTitle:detailText:icon:](&v9, "initWithTitle:detailText:icon:", v11[0], v10, v6);
  objc_storeStrong(&location, location);

  v7 = (BuddyMigrationLockscreenFinishedController *)location;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;
  SEL v5;
  BuddyMigrationLockscreenFinishedController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMigrationLockscreenFinishedController;
  -[BuddyMigrationLockscreenFinishedController viewDidLoad](&v4, "viewDidLoad");
  v2 = -[BuddyMigrationLockscreenFinishedController headerView](v6, "headerView");
  objc_msgSend(v2, "setIconInheritsTint:", 1);

  v3 = -[BuddyMigrationLockscreenFinishedController navigationItem](v6, "navigationItem");
  objc_msgSend(v3, "setHidesBackButton:", 1);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
