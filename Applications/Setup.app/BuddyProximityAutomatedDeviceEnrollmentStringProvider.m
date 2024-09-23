@implementation BuddyProximityAutomatedDeviceEnrollmentStringProvider

- (id)visualTitleWithDeviceClass:(id)a3 language:(id)a4
{
  id v5;
  id v7;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentStringProvider *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = -[BuddyProximityAutomatedDeviceEnrollmentStringProvider _titleWithLocalDeviceClass:language:](v9, "_titleWithLocalDeviceClass:language:", location[0], v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)visualDescriptionWithDeviceClass:(id)a3 language:(id)a4
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
  v6 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("PROXIMITY_AUTOMATED_DEVICE_ENROLLMENT_VISUAL_MESSAGE"), CFSTR("Localizable"));

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)textualTitleWithDeviceClass:(id)a3 language:(id)a4
{
  id v5;
  id v7;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentStringProvider *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = -[BuddyProximityAutomatedDeviceEnrollmentStringProvider _titleWithLocalDeviceClass:language:](v9, "_titleWithLocalDeviceClass:language:", location[0], v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)textualDescriptionWithDeviceClass:(id)a3 language:(id)a4
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
  v6 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("PROXIMITY_AUTOMATED_DEVICE_ENROLLMENT_TEXTUAL_MESSAGE"), CFSTR("Localizable"));

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)visualPairingButtonTitleWithLanguage:(id)a3
{
  NSBundle *v3;
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("PROXIMITY_AUTOMATED_DEVICE_ENROLLMENT_VISUAL_PAIRING_BUTTON_TITLE"), CFSTR("Localizable"));

  objc_storeStrong(location, 0);
  return v4;
}

- (id)textualPairingButtonTitleWithLanguage:(id)a3
{
  NSBundle *v3;
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("PROXIMITY_AUTOMATED_DEVICE_ENROLLMENT_TEXTUAL_PAIRING_BUTTON_TITLE"), CFSTR("Localizable"));

  objc_storeStrong(location, 0);
  return v4;
}

- (id)_titleWithLocalDeviceClass:(id)a3 language:(id)a4
{
  id v5;
  NSBundle *v6;
  id v7;
  id v9;
  id v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = CFSTR("PROXIMITY_AUTOMATED_DEVICE_ENROLLMENT_PAIRING_TITLE");
  v5 = +[BuddyLocalizationUtilities modelSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "modelSpecificLocalizedStringKeyForKey:deviceClass:", v9, location[0]);
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = (id)SFLocalizedStringFromTableInBundleForLanguage(v5, CFSTR("Localizable"));

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

@end
