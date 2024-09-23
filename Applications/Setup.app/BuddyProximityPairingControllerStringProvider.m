@implementation BuddyProximityPairingControllerStringProvider

- (id)visualTitleWithDeviceClass:(id)a3 language:(id)a4
{
  id v5;
  NSBundle *v6;
  id v7;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v5 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("PROXIMITY_SETUP_PAIR_VISUAL_TITLE"), location[0]);
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = (id)SFLocalizedStringFromTableInBundleForLanguage(v5, CFSTR("Localizable"));

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)visualDescriptionWithDeviceClass:(id)a3 language:(id)a4
{
  id v5;
  NSBundle *v6;
  id v7;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v5 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("PROXIMITY_SETUP_PAIR_VISUAL_MESSAGE"), location[0]);
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = (id)SFLocalizedStringFromTableInBundleForLanguage(v5, CFSTR("Localizable"));

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)textualTitleWithDeviceClass:(id)a3 language:(id)a4
{
  NSBundle *v5;
  id v6;
  id v8;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("PROXIMITY_SETUP_PAIR_MANUAL_TITLE"), CFSTR("Localizable"));

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)textualDescriptionWithDeviceClass:(id)a3 language:(id)a4
{
  id v5;
  NSBundle *v6;
  id v7;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v5 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("PROXIMITY_SETUP_PAIR_MANUAL_MESSAGE"), location[0]);
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = (id)SFLocalizedStringFromTableInBundleForLanguage(v5, CFSTR("Localizable"));

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

@end
