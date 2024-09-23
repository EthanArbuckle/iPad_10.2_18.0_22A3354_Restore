@implementation BuddySettingsDataUsageController

- (BuddySettingsDataUsageController)init
{
  UIScreen *v2;
  id v3;
  NSBundle *v4;
  NSString *v5;
  NSBundle *v6;
  id v7;
  NSString *v8;
  id v9;
  NSBundle *v10;
  NSString *v11;
  NSBundle *v12;
  NSString *v13;
  BuddySettingsDataUsageController *v14;
  objc_super v16;
  objc_super v17;
  id v18[2];
  id location;

  location = self;
  v18[1] = (id)a2;
  v2 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen scale](v2, "scale");
  v18[0] = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.Preferences"), 2);

  if ((+[PDCPreflightManager isPreflightFeatureEnabled](PDCPreflightManager, "isPreflightFeatureEnabled") & 1) != 0)
  {
    v3 = location;
    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("SETTINGS_DATA_USAGE_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("SETTINGS_DATA_USAGE_DETAIL"));
    v8 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v7, &stru_100284738, CFSTR("Localizable"));
    location = 0;
    v17.receiver = v3;
    v17.super_class = (Class)BuddySettingsDataUsageController;
    location = -[BuddySettingsDataUsageController initWithTitle:detailText:icon:](&v17, "initWithTitle:detailText:icon:", v5, v8, v18[0]);
    objc_storeStrong(&location, location);

  }
  else
  {
    v9 = location;
    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("SETTINGS_CONTACTS_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("SETTINGS_CONTACTS_DETAIL"), &stru_100284738, CFSTR("Localizable"));
    location = 0;
    v16.receiver = v9;
    v16.super_class = (Class)BuddySettingsDataUsageController;
    location = -[BuddySettingsDataUsageController initWithTitle:detailText:icon:](&v16, "initWithTitle:detailText:icon:", v11, v13, v18[0]);
    objc_storeStrong(&location, location);

  }
  v14 = (BuddySettingsDataUsageController *)location;
  objc_storeStrong(v18, 0);
  objc_storeStrong(&location, 0);
  return v14;
}

- (void)viewDidLoad
{
  BuddySettingsDataUsageController *v2;
  NSBundle *v3;
  NSString *v4;
  objc_super v5;
  SEL v6;
  BuddySettingsDataUsageController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddySettingsDataUsageController;
  -[BuddyDataUsageController viewDidLoad](&v5, "viewDidLoad");
  if ((+[PDCPreflightManager isPreflightFeatureEnabled](PDCPreflightManager, "isPreflightFeatureEnabled") & 1) != 0)
  {
    v2 = v7;
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_100284738, CFSTR("Localizable"));
    -[BuddyWelcomeController addLinkButton:action:](v2, "addLinkButton:action:", v4, "_learnMoreTapped:");

  }
}

- (void)continueTapped:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  BuddySettingsDataUsageController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((+[PDCPreflightManager isPreflightFeatureEnabled](PDCPreflightManager, "isPreflightFeatureEnabled") & 1) != 0)
  {
    v3 = +[BYPreferencesController buddyPreferences](BYPreferencesController, "buddyPreferences");
    objc_msgSend(v3, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SettingsDataUsagePresented"));
  }
  else
  {
    v3 = +[BYPreferencesController buddyPreferences](BYPreferencesController, "buddyPreferences");
    objc_msgSend(v3, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SettingsContactsPresented"));
  }

  v4.receiver = v6;
  v4.super_class = (Class)BuddySettingsDataUsageController;
  -[BuddyDataUsageController continueTapped:](&v4, "continueTapped:", v6);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  BuddyExistingSettings *v2;
  id v3;
  objc_super v5;
  SEL v6;
  BuddySettingsDataUsageController *v7;
  char v8;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddySettingsDataUsageController;
  if (-[BuddyDataUsageController controllerNeedsToRun](&v5, "controllerNeedsToRun"))
  {
    if ((+[PDCPreflightManager isPreflightFeatureEnabled](PDCPreflightManager, "isPreflightFeatureEnabled") & 1) != 0)
    {
      v2 = -[BuddyDataUsageController existingSettings](v7, "existingSettings");
      v3 = -[BuddyExistingSettings backupMetadata](v2, "backupMetadata");
      v8 = (objc_msgSend(v3, "settingsDataUsagePresented") ^ 1) & 1;
    }
    else
    {
      v2 = -[BuddyDataUsageController existingSettings](v7, "existingSettings");
      v3 = -[BuddyExistingSettings backupMetadata](v2, "backupMetadata");
      v8 = (objc_msgSend(v3, "settingsContactsPresented") ^ 1) & 1;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

- (void)_learnMoreTapped:(id)a3
{
  id v3;
  uint64_t v4;
  NSString *v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  os_log_type_t v13;
  os_log_t oslog;
  id obj;
  id v16;
  id v17;
  id location[2];
  BuddySettingsDataUsageController *v19;
  uint8_t buf[24];

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  obj = 0;
  v3 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Preferences"), 0, &obj);
  objc_storeStrong(&v17, obj);
  v16 = v3;
  if (v17)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    v13 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v11 = 0;
      v9 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v5 = (NSString *)v17;
      }
      else if (v17)
      {
        v12 = objc_msgSend(v17, "domain");
        v11 = 1;
        v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v12, objc_msgSend(v17, "code"));
        v10 = v5;
        v9 = 1;
      }
      else
      {
        v5 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v5);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v13, "Failed to retrieve application record: %{public}@", buf, 0xCu);
      if ((v9 & 1) != 0)

      if ((v11 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v6 = objc_msgSend(v16, "identities");
  v8 = objc_msgSend(v6, "firstObject");

  v7 = (id)PDUDisclosureReviewViewControllerForApplicationWithVariant(v8, 1);
  -[BuddySettingsDataUsageController presentViewController:animated:completion:](v19, "presentViewController:animated:completion:", v7, 1, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

@end
