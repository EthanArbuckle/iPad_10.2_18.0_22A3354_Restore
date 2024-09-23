@implementation BuddyMessagesContactsController

- (BuddyMessagesContactsController)init
{
  UIScreen *v2;
  id v3;
  NSBundle *v4;
  NSString *v5;
  NSBundle *v6;
  NSString *v7;
  BuddyMessagesContactsController *v8;
  objc_super v10;
  id v11[2];
  id location;

  location = self;
  v11[1] = (id)a2;
  v2 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen scale](v2, "scale");
  v11[0] = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.MobileSMS"), 2);

  v3 = location;
  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("MESSAGES_CONTACTS_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("MESSAGES_CONTACTS_DETAIL"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v10.receiver = v3;
  v10.super_class = (Class)BuddyMessagesContactsController;
  location = -[BuddyMessagesContactsController initWithTitle:detailText:icon:](&v10, "initWithTitle:detailText:icon:", v5, v7, v11[0]);
  objc_storeStrong(&location, location);

  v8 = (BuddyMessagesContactsController *)location;
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)viewDidLoad
{
  id v2;
  NSArray *v3;
  objc_super v4;
  SEL v5;
  BuddyMessagesContactsController *v6;
  uint64_t v7;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMessagesContactsController;
  -[BuddyDataUsageController viewDidLoad](&v4, "viewDidLoad");
  v2 = -[BuddyMessagesContactsController buttonTray](v6, "buttonTray");
  v7 = BYPrivacyMessagesIdentifier;
  v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1);
  objc_msgSend(v2, "setPrivacyLinkForBundles:", v3);

}

- (void)continueTapped:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  BuddyMessagesContactsController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BYPreferencesController buddyPreferences](BYPreferencesController, "buddyPreferences");
  objc_msgSend(v3, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("MessagesContactsPresented"));

  v4.receiver = v6;
  v4.super_class = (Class)BuddyMessagesContactsController;
  -[BuddyDataUsageController continueTapped:](&v4, "continueTapped:", v6);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  BuddyExistingSettings *v2;
  id v3;
  objc_super v5;
  SEL v6;
  BuddyMessagesContactsController *v7;
  char v8;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyMessagesContactsController;
  if (-[BuddyDataUsageController controllerNeedsToRun](&v5, "controllerNeedsToRun"))
  {
    v2 = -[BuddyDataUsageController existingSettings](v7, "existingSettings");
    v3 = -[BuddyExistingSettings backupMetadata](v2, "backupMetadata");
    v8 = (objc_msgSend(v3, "messagesContactsPresented") ^ 1) & 1;

  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

@end
