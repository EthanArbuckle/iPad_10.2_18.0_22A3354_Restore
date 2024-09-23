@implementation BuddyAppStoreController

- (BuddyAppStoreController)init
{
  UIScreen *v2;
  id v3;
  NSBundle *v4;
  NSString *v5;
  NSBundle *v6;
  NSString *v7;
  BuddyAppStoreController *v8;
  objc_super v10;
  id v11[2];
  id location;

  location = self;
  v11[1] = (id)a2;
  v2 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen scale](v2, "scale");
  v11[0] = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.AppStore"), 2);

  v3 = location;
  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("APP_STORE_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("APP_STORE_DETAIL"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v10.receiver = v3;
  v10.super_class = (Class)BuddyAppStoreController;
  location = -[BuddyAppStoreController initWithTitle:detailText:icon:](&v10, "initWithTitle:detailText:icon:", v5, v7, v11[0]);
  objc_storeStrong(&location, location);

  v8 = (BuddyAppStoreController *)location;
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)viewDidLoad
{
  id v2;
  BuddySuspendTask *v3;
  NSString *v4;
  id v5;
  BuddySuspendTask *v6;
  NSString *v7;
  BuddyAppStoreController *v8;
  NSBundle *v9;
  NSString *v10;
  objc_super v11;
  SEL v12;
  BuddyAppStoreController *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyAppStoreController;
  -[BuddyAppStoreController viewDidLoad](&v11, "viewDidLoad");
  v2 = -[BuddyAppStoreController navigationItem](v13, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:", 1);

  v3 = -[BuddyAppStoreController suspendTask](v13, "suspendTask");
  v4 = -[BuddySuspendTask message](v3, "message");

  if (v4)
  {
    v5 = -[BuddyAppStoreController headerView](v13, "headerView");
    v6 = -[BuddyAppStoreController suspendTask](v13, "suspendTask");
    v7 = -[BuddySuspendTask message](v6, "message");
    objc_msgSend(v5, "setDetailText:", v7);

  }
  v8 = v13;
  v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v8, "addBoldButton:action:", v10, "_continuePressed:");

}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipAppStore;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (unint64_t)allowedTerminationSources
{
  return 2;
}

- (void)_continuePressed:(id)a3
{
  BYPreferencesController *v3;
  BFFFlowItemDelegate *v4;
  id location[2];
  BuddyAppStoreController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppStoreController buddyPreferencesExcludedFromBackup](v6, "buddyPreferencesExcludedFromBackup");
  -[BYPreferencesController setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("AppStorePresented"));

  v4 = -[BuddyWelcomeController delegate](v6, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v4, "flowItemDone:", v6);

  objc_storeStrong(location, 0);
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
  objc_storeStrong((id *)&self->_suspendTask, a3);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_suspendTask, 0);
}

@end
