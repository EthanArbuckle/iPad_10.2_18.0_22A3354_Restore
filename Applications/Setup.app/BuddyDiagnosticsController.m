@implementation BuddyDiagnosticsController

- (BuddyDiagnosticsController)init
{
  NSBundle *v2;
  id v3;
  id v4;
  BuddyDiagnosticsController *v5;
  char v7;
  objc_super v8;
  id v9[2];
  id location;

  location = self;
  v9[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("ANALYTICS_TITLE_BOTH"), &stru_100284738, CFSTR("Localizable"));

  v3 = location;
  location = 0;
  v8.receiver = v3;
  v8.super_class = (Class)BuddyDiagnosticsController;
  location = -[BuddyDiagnosticsController initWithTitle:detailText:icon:](&v8, "initWithTitle:detailText:icon:", v9[0], 0, 0);
  objc_storeStrong(&location, location);
  if (location)
  {
    v4 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
    v7 = objc_msgSend(v4, "BOOLForKey:", CFSTR("ForceSeedDignostics")) & 1;

    *((_BYTE *)location + 17) = v7 & 1;
  }
  v5 = (BuddyDiagnosticsController *)location;
  objc_storeStrong(v9, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)loadView
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  os_log_t oslog;
  objc_super v9;
  SEL v10;
  BuddyDiagnosticsController *v11;
  uint8_t buf[24];

  v11 = self;
  v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)BuddyDiagnosticsController;
  -[BuddyDiagnosticsController loadView](&v9, "loadView");
  if ((id)-[BuddyDiagnosticsController mode](v11, "mode") == (id)4)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(4);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_1000342B4((uint64_t)buf, -[BuddyDiagnosticsController mode](v11, "mode"));
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Unsupported diagnostics display mode %ld", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v2 = -[BuddyDiagnosticsController headerView](v11, "headerView");
  v3 = -[BuddyDiagnosticsController _titleText](v11, "_titleText");
  objc_msgSend(v2, "setTitle:", v3);

  v4 = -[BuddyDiagnosticsController headerView](v11, "headerView");
  v5 = -[BuddyDiagnosticsController _detailText](v11, "_detailText");
  objc_msgSend(v4, "setDetailText:", v5);

  -[BuddyDiagnosticsController _addButtons](v11, "_addButtons");
  v6 = -[BuddyDiagnosticsController buttonTray](v11, "buttonTray");
  v7 = -[BuddyDiagnosticsController _privacyBundlesForDisplayMode:](v11, "_privacyBundlesForDisplayMode:", -[BuddyDiagnosticsController mode](v11, "mode"));
  objc_msgSend(v6, "setPrivacyLinkForBundles:", v7);

}

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  NSArray *v5;
  objc_super v6;
  SEL v7;
  BuddyDiagnosticsController *v8;
  _QWORD v9[2];

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyDiagnosticsController;
  -[BuddyDiagnosticsController viewDidLoad](&v6, "viewDidLoad");
  v2 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 1"), CFSTR("Dark 1"), 0.01, 1.0);
  v9[0] = v2;
  v3 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), CFSTR("Dark 2"), 1.0, 0.4);
  v9[1] = v3;
  v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2);

  v4 = -[BuddyDiagnosticsController buddy_animationController:animatedStates:startAtFirstState:](v8, "buddy_animationController:animatedStates:startAtFirstState:", CFSTR("AppAnalytics"), v5, 1);
  -[BuddyDiagnosticsController setAnimationController:](v8, "setAnimationController:", v4);

  objc_storeStrong((id *)&v5, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  BYPreferencesController *v4;
  void *v5;
  BFFSettingsManager *v6;
  BYPreferencesController *v7;
  BYPaneFeatureAnalyticsManager *v8;
  void *v9;
  BYChronicle *v10;
  BFFSettingsManager *v11;
  BYPreferencesController *v12;
  BYPaneFeatureAnalyticsManager *v13;
  BFFSettingsManager *v14;
  BYPreferencesController *v15;
  BFFSettingsManager *v16;
  BYPreferencesController *v17;
  OBAnimationController *v18;
  os_log_t oslog;
  objc_super v20;
  BOOL v21;
  SEL v22;
  BuddyDiagnosticsController *v23;
  uint8_t buf[24];

  v23 = self;
  v22 = a2;
  v21 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BuddyDiagnosticsController;
  v3 = -[BuddyDiagnosticsController viewDidAppear:](&v20, "viewDidAppear:", a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)buf, -[BuddyDiagnosticsController mode](v23, "mode"));
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Analytics showing mode %ld", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ((-[BuddyDiagnosticsController isMovingToParentViewController](v23, "isMovingToParentViewController") & 1) == 0)
  {
    v4 = -[BuddyDiagnosticsController buddyPreferences](v23, "buddyPreferences");
    -[BYPreferencesController setObject:forKey:](v4, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("PBDiagnostics4Presented"));

    if ((-[BuddyDiagnosticsController mode](v23, "mode") & 2) != 0)
    {
      if (-[BuddyDiagnosticsController initialDeviceAnalyticsUserSetting](v23, "initialDeviceAnalyticsUserSetting"))
      {
        if (-[BuddyDiagnosticsController initialDeviceAnalyticsUserSetting](v23, "initialDeviceAnalyticsUserSetting") == 2)
        {
          v9 = (void *)objc_opt_class(v23);
          v10 = -[BuddyDiagnosticsController chronicle](v23, "chronicle");
          v11 = -[BuddyDiagnosticsController settingsManager](v23, "settingsManager");
          v12 = -[BuddyDiagnosticsController buddyPreferences](v23, "buddyPreferences");
          objc_msgSend(v9, "setDeviceAnalyticsSubmissionEnabled:presented:chronicle:settingsManager:buddyPreferences:", 0, 0, v10, v11, v12);

        }
      }
      else
      {
        v5 = (void *)objc_opt_class(v23);
        v6 = -[BuddyDiagnosticsController settingsManager](v23, "settingsManager");
        v7 = -[BuddyDiagnosticsController buddyPreferences](v23, "buddyPreferences");
        objc_msgSend(v5, "clearDeviceAnalyticsSettingWithSettingsManager:buddyPreferences:", v6, v7);

        v8 = -[BuddyDiagnosticsController paneFeatureAnalyticsManager](v23, "paneFeatureAnalyticsManager");
        -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v8, "clearActionForFeature:", 5);

      }
    }
    if ((-[BuddyDiagnosticsController mode](v23, "mode") & 4) != 0)
    {
      if (-[BuddyDiagnosticsController initialAppAnalyticsUserSetting](v23, "initialAppAnalyticsUserSetting"))
      {
        if (-[BuddyDiagnosticsController initialAppAnalyticsUserSetting](v23, "initialAppAnalyticsUserSetting") == 2)
        {
          v16 = -[BuddyDiagnosticsController settingsManager](v23, "settingsManager");
          v17 = -[BuddyDiagnosticsController buddyPreferences](v23, "buddyPreferences");
          +[BuddyAppActivityController setAppActivityEnabled:presented:settingsManager:buddyPreferences:](BuddyAppActivityController, "setAppActivityEnabled:presented:settingsManager:buddyPreferences:", 0, 0, v16, v17);

        }
      }
      else
      {
        v13 = -[BuddyDiagnosticsController paneFeatureAnalyticsManager](v23, "paneFeatureAnalyticsManager");
        -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v13, "clearActionForFeature:", 4);

        v14 = -[BuddyDiagnosticsController settingsManager](v23, "settingsManager");
        v15 = -[BuddyDiagnosticsController buddyPreferences](v23, "buddyPreferences");
        +[BuddyAppActivityController clearAppActivitySettingWithSettingsManager:buddyPreferences:](BuddyAppActivityController, "clearAppActivitySettingWithSettingsManager:buddyPreferences:", v14, v15);

      }
    }
  }
  v18 = -[BuddyDiagnosticsController animationController](v23, "animationController");
  -[OBAnimationController startAnimation](v18, "startAnimation");

}

- (void)_addButtons
{
  NSBundle *v2;
  NSString *v3;
  unint64_t v4;
  NSBundle *v5;
  NSString *v6;
  NSBundle *v7;
  NSString *v8;
  NSBundle *v9;
  NSString *v10;

  if (-[BuddyDiagnosticsController imposeSeedPolicy](self, "imposeSeedPolicy", a2))
  {
    v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("ENABLE_DIAGNOSTICS_AUTO_OPT_IN"), &stru_100284738, CFSTR("Localizable"));
    -[BuddyWelcomeController addBoldButton:action:](self, "addBoldButton:action:", v3, "_enableAnalytics");

  }
  else
  {
    v4 = -[BuddyDiagnosticsController mode](self, "mode");
    if (v4)
    {
      if (v4 - 1 < 3)
      {
        v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("ENABLE_ANALYTICS"), &stru_100284738, CFSTR("Localizable"));
        -[BuddyWelcomeController addBoldButton:action:](self, "addBoldButton:action:", v6, "_enableAnalytics");

      }
      else if (v4 != 4 && v4 - 6 < 2)
      {
        v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("ENABLE_ANALYTICS_INCLUDING_APPS"), &stru_100284738, CFSTR("Localizable"));
        -[BuddyWelcomeController addBoldButton:action:](self, "addBoldButton:action:", v8, "_enableAnalytics");

      }
    }
    v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("DISABLE_ANALYTICS"), &stru_100284738, CFSTR("Localizable"));
    -[BuddyWelcomeController addLinkButton:action:](self, "addLinkButton:action:", v10, "_disableAnalytics");

  }
}

- (id)_titleText
{
  NSBundle *v2;
  id v3;
  NSBundle *v4;
  NSBundle *v5;
  NSString *v7;

  switch(-[BuddyDiagnosticsController mode](self, "mode"))
  {
    case 1uLL:
      v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v7 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("ANALYTICS_TITLE_ICLOUD"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 2uLL:
    case 6uLL:
      v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ANALYTICS_TITLE_DEVICE"));
      v7 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));

      break;
    case 3uLL:
    case 7uLL:
      v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v7 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("ANALYTICS_TITLE_BOTH"), &stru_100284738, CFSTR("Localizable"));

      break;
    default:
      return v7;
  }
  return v7;
}

- (id)_detailText
{
  BuddyFlowItemDispositionProvider *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSBundle *v8;
  id v9;
  NSString *v10;
  id v11;
  NSString *v12;
  id v13;
  UIDevice *v14;
  unsigned __int8 v15;
  id v16;
  NSBundle *v17;
  NSString *v18;
  id v19;
  id v20;
  id v21;
  os_log_t oslog;
  id v24;
  id v25;
  id v26;
  char v27;
  char v28;
  id location[2];
  BuddyDiagnosticsController *v30;
  uint8_t buf[24];

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v28 = 0;
  v27 = 0;
  switch(-[BuddyDiagnosticsController mode](self, "mode"))
  {
    case 1uLL:
      objc_storeStrong(location, CFSTR("ANALYTICS_DESCRIPTION_ICLOUD"));
      v27 = 1;
      break;
    case 2uLL:
      if (-[BuddyDiagnosticsController imposeSeedPolicy](v30, "imposeSeedPolicy"))
      {
        objc_storeStrong(location, CFSTR("DIAGNOSTICS_DESCRIPTION_AUTO_OPT_IN"));
      }
      else
      {
        objc_storeStrong(location, CFSTR("ANALYTICS_DESCRIPTION_DEVICE"));
        v28 = 1;
        v27 = 1;
      }
      break;
    case 3uLL:
      objc_storeStrong(location, CFSTR("ANALYTICS_DESCRIPTION_BOTH"));
      v28 = 1;
      v27 = 1;
      break;
    case 6uLL:
      if (-[BuddyDiagnosticsController imposeSeedPolicy](v30, "imposeSeedPolicy"))
      {
        objc_storeStrong(location, CFSTR("ANALYTICS_DESCRIPTION_AUTO_OPT_IN_DEVICE_AND_APPS"));
      }
      else
      {
        objc_storeStrong(location, CFSTR("ANALYTICS_DESCRIPTION_DEVICE_AND_APPS"));
        v28 = 1;
        v27 = 1;
      }
      break;
    case 7uLL:
      objc_storeStrong(location, CFSTR("ANALYTICS_DESCRIPTION_DEVICE_AND_APPS_AND_ICLOUD"));
      v28 = 1;
      v27 = 1;
      break;
    default:
      break;
  }
  v26 = 0;
  if ((v27 & 1) != 0)
  {
    v2 = -[BuddyDiagnosticsController flowItemDispositionProvider](v30, "flowItemDispositionProvider");
    v3 = -[BuddyFlowItemDispositionProvider dispositions](v2, "dispositions");

    v25 = v3;
    v4 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
    v24 = objc_msgSend(v4, "objectForKey:", CFSTR("PBAnalyticsForceDisposition"));

    if (v24)
    {
      v5 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v24, v5) & 1) != 0)
      {
        v25 = objc_msgSend(v24, "unsignedIntegerValue");
        oslog = (os_log_t)(id)_BYLoggingFacility(v25);
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          sub_1000342B4((uint64_t)buf, (uint64_t)v25);
          _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "Analytics forcing disposition %lu", buf, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
    }
    if (v25 && v25 != (id)4)
    {
      v6 = +[BuddyLocalizationUtilities dispositionSpecificLocalizedStringKeyForKey:disposition:](BuddyLocalizationUtilities, "dispositionSpecificLocalizedStringKeyForKey:disposition:", location[0], v25);
      v7 = location[0];
      location[0] = v6;

    }
    objc_storeStrong(&v24, 0);
  }
  if ((v28 & 1) != 0)
  {
    v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", location[0]);
    v10 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", v9, &stru_100284738, CFSTR("Localizable"));
    v11 = v26;
    v26 = v10;

  }
  else
  {
    v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v12 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", location[0], &stru_100284738, CFSTR("Localizable"));
    v13 = v26;
    v26 = v12;

  }
  v14 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v15 = -[UIDevice sf_isChinaRegionCellularDevice](v14, "sf_isChinaRegionCellularDevice");

  if ((v15 & 1) != 0)
  {
    v16 = v26;
    v17 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v18 = -[NSBundle localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", CFSTR("ANALYTICS_CELLULAR_DATA_NOTICE"), &stru_100284738, CFSTR("Localizable"));
    v19 = objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("\n\n%@"), v18);
    v20 = v26;
    v26 = v19;

  }
  v21 = v26;
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v21;
}

+ (void)setRequireiCloudAnalyticsOptIn:(BOOL)a3
{
  byte_1002EEBA0 = a3;
}

+ (void)setDeviceAnalyticsSubmissionEnabled:(BOOL)a3 presented:(BOOL)a4 chronicle:(id)a5 settingsManager:(id)a6 buddyPreferences:(id)a7
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v10;
  NSNumber *v11;
  id v12;
  id v13;
  id location;
  BOOL v15;
  BOOL v16;
  SEL v17;
  id v18;

  v18 = a1;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v12 = 0;
  objc_storeStrong(&v12, a7);
  objc_msgSend(v13, "setBool:forManagedConfigurationSetting:", v16, MCFeatureDiagnosticsSubmissionAllowed);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, DiagnosticsShouldSubmitNotification, 0, 0, 0);
  v10 = v12;
  v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15);
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("PBDiagnostics4Presented"));

  if (v15)
    objc_msgSend(location, "recordFeatureShown:", 2);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

+ (void)clearDeviceAnalyticsSettingWithSettingsManager:(id)a3 buddyPreferences:(id)a4
{
  id v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_msgSend(location[0], "removeBoolSettingForManagedConfigurationSetting:", MCFeatureDiagnosticsSubmissionAllowed);
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("PBDiagnostics4Presented"));
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

+ (void)setiCloudAnalyticsEnabled:(BOOL)a3
{
  __CFString *v3;
  NSDictionary *v4;
  id location;
  BOOL v6;
  SEL v7;
  id v8;
  const __CFString *v9;
  id v10;

  v8 = a1;
  v7 = a2;
  v6 = a3;
  if (a3)
    v3 = CFSTR("1");
  else
    v3 = CFSTR("0");
  location = v3;
  v9 = CFSTR("com.apple.idms.config.privacy.icloud.data");
  v10 = location;
  v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  objc_msgSend(v8, "_writeValuesForKeysToIdMS:", v4);

  CFPreferencesSetAppValue(CFSTR("AllowiCloudAnalytics"), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6), CFSTR("com.apple.Preferences"));
  objc_storeStrong(&location, 0);
}

- (id)_privacyBundlesForDisplayMode:(unint64_t)a3
{
  NSArray *v4;
  _QWORD v5[3];
  _QWORD v6[2];
  _QWORD v7[2];
  uint64_t v8;
  uint64_t v9;

  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      v4 = 0;
      break;
    case 1uLL:
      v8 = BYPrivacyAnalyticsiCloudIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1, a3, a2, self);
      break;
    case 2uLL:
      v9 = BYPrivacyAnalyticsDeviceIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1, a3, a2, self);
      break;
    case 3uLL:
      v7[0] = BYPrivacyAnalyticsDeviceIdentifier;
      v7[1] = BYPrivacyAnalyticsiCloudIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2, a3, a2, self);
      break;
    case 6uLL:
      v6[0] = BYPrivacyAnalyticsDeviceIdentifier;
      v6[1] = BYPrivacyAnalyticsAppIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2, a3, a2, self);
      break;
    case 7uLL:
      v5[0] = BYPrivacyAnalyticsDeviceIdentifier;
      v5[1] = BYPrivacyAnalyticsAppIdentifier;
      v5[2] = BYPrivacyAnalyticsiCloudIdentifier;
      v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a3, a2, self);
      break;
    default:
      return v4;
  }
  return v4;
}

- (void)_enableAnalytics
{
  -[BuddyDiagnosticsController _controllerDone:](self, "_controllerDone:", 1, a2, self);
}

- (void)_disableAnalytics
{
  -[BuddyDiagnosticsController _controllerDone:](self, "_controllerDone:", 0, a2, self);
}

- (void)_controllerDone:(BOOL)a3
{
  BOOL v3;
  BYChronicle *v4;
  BFFSettingsManager *v5;
  BYPreferencesController *v6;
  BYPreferencesController *v7;
  BYPaneFeatureAnalyticsManager *v8;
  NSNumber *v9;
  BYPreferencesController *v10;
  BOOL v11;
  BFFSettingsManager *v12;
  BYPreferencesController *v13;
  BYPaneFeatureAnalyticsManager *v14;
  NSNumber *v15;
  void *v16;
  BYPaneFeatureAnalyticsManager *v17;
  NSNumber *v18;
  BYAnalyticsManager *v19;
  BFFFlowItemDelegate *v20;
  os_log_t oslog;
  BOOL v22;
  SEL v23;
  BuddyDiagnosticsController *v24;
  uint8_t buf[24];

  v24 = self;
  v23 = a2;
  v22 = a3;
  oslog = (os_log_t)(id)_BYLoggingFacility(-[BuddyDiagnosticsController imposeSeedPolicy](self, "imposeSeedPolicy"));
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1001631FC((uint64_t)buf, -[BuddyDiagnosticsController mode](v24, "mode"), v22, -[BuddyDiagnosticsController imposeSeedPolicy](v24, "imposeSeedPolicy"));
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Analytics opt-in done, mode = %ld, choice = %d, automatic = %d", buf, 0x18u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ((-[BuddyDiagnosticsController mode](v24, "mode") & 2) != 0)
  {
    v3 = v22;
    v4 = -[BuddyDiagnosticsController chronicle](v24, "chronicle");
    v5 = -[BuddyDiagnosticsController settingsManager](v24, "settingsManager");
    v6 = -[BuddyDiagnosticsController buddyPreferences](v24, "buddyPreferences");
    +[BuddyDiagnosticsController setDeviceAnalyticsSubmissionEnabled:presented:chronicle:settingsManager:buddyPreferences:](BuddyDiagnosticsController, "setDeviceAnalyticsSubmissionEnabled:presented:chronicle:settingsManager:buddyPreferences:", v3, 1, v4, v5, v6);

    if (-[BuddyDiagnosticsController imposeSeedPolicy](v24, "imposeSeedPolicy"))
    {
      v7 = -[BuddyDiagnosticsController buddyPreferences](v24, "buddyPreferences");
      -[BYPreferencesController setObject:forKey:](v7, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("DiagnosticsAutoOptInSet"));

    }
    if (!-[BuddyDiagnosticsController imposeSeedPolicy](v24, "imposeSeedPolicy"))
    {
      v8 = -[BuddyDiagnosticsController paneFeatureAnalyticsManager](v24, "paneFeatureAnalyticsManager");
      v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v22);
      -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v8, "recordActionWithValue:forFeature:", v9, 5);

    }
  }
  else
  {
    v10 = -[BuddyDiagnosticsController buddyPreferences](v24, "buddyPreferences");
    -[BYPreferencesController setObject:forKey:](v10, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("PBDiagnostics4Presented"));

  }
  if ((-[BuddyDiagnosticsController mode](v24, "mode") & 4) != 0)
  {
    v11 = v22;
    v12 = -[BuddyDiagnosticsController settingsManager](v24, "settingsManager");
    v13 = -[BuddyDiagnosticsController buddyPreferences](v24, "buddyPreferences");
    +[BuddyAppActivityController setAppActivityEnabled:presented:settingsManager:buddyPreferences:](BuddyAppActivityController, "setAppActivityEnabled:presented:settingsManager:buddyPreferences:", v11, 1, v12, v13);

    v14 = -[BuddyDiagnosticsController paneFeatureAnalyticsManager](v24, "paneFeatureAnalyticsManager");
    v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v22);
    -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v14, "recordActionWithValue:forFeature:", v15, 4);

  }
  if ((-[BuddyDiagnosticsController mode](v24, "mode") & 1) != 0)
  {
    v16 = (void *)objc_opt_class(v24);
    objc_msgSend(v16, "setiCloudAnalyticsEnabled:", v22);
    v17 = -[BuddyDiagnosticsController paneFeatureAnalyticsManager](v24, "paneFeatureAnalyticsManager");
    v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v22);
    -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v17, "recordActionWithValue:forFeature:", v18, 3);

  }
  if (-[BuddyDiagnosticsController shouldReportCombinedAnalyticsChoice](v24, "shouldReportCombinedAnalyticsChoice"))
  {
    v19 = -[BuddyDiagnosticsController analyticsManager](v24, "analyticsManager");
    -[BYAnalyticsManager setCombinedAnalyticsRepromptChoice:](v19, "setCombinedAnalyticsRepromptChoice:", v22);

  }
  v20 = -[BuddyWelcomeController delegate](v24, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v20, "flowItemDone:", v24);

}

- (void)_determineDisplayMode:(id)a3
{
  BYPreferencesController *v3;
  unsigned __int8 v4;
  BYCapabilities *v5;
  unsigned __int8 v6;
  MCProfileConnection *v7;
  BOOL v8;
  BuddyMiscState *v9;
  unsigned __int8 v10;
  char v11;
  BYCapabilities *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  char v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  BuddyMiscState *v21;
  unsigned __int8 v22;
  os_log_t oslog;
  int v24;
  void **v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, char, id);
  void *v29;
  BuddyDiagnosticsController *v30;
  id v31[2];
  char v32;
  BOOL v33;
  char v34;
  char v35;
  BYCapabilities *v36;
  id v37;
  BOOL v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  int v42;
  int v43;
  uint64_t v44;
  char v45;
  BOOL v46;
  BOOL v47;
  char v48;
  char v49;
  id location[2];
  BuddyDiagnosticsController *v51;
  uint8_t buf[40];

  v51 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyDiagnosticsController buddyPreferences](v51, "buddyPreferences");
  v4 = -[BYPreferencesController BOOLForKey:](v3, "BOOLForKey:", CFSTR("PBDiagnostics4Presented"));

  v49 = v4 & 1;
  v5 = -[BuddyDiagnosticsController capabilities](v51, "capabilities");
  v6 = -[BYCapabilities isDeviceAnalyticsRestricted](v5, "isDeviceAnalyticsRestricted");

  v48 = v6 & 1;
  v7 = -[BuddyDiagnosticsController managedConfiguration](v51, "managedConfiguration");
  v8 = -[MCProfileConnection effectiveBoolValueForSetting:](v7, "effectiveBoolValueForSetting:", MCFeatureDiagnosticsSubmissionAllowed) == 1;

  v47 = v8;
  v46 = 0;
  v9 = -[BuddyDiagnosticsController miscState](v51, "miscState");
  v10 = -[BuddyMiscState launchedWithCombinedAnalyticsMismatch](v9, "launchedWithCombinedAnalyticsMismatch");

  v46 = (v10 & 1) == 0 && v47;
  v45 = 0;
  v11 = 1;
  if ((v48 & 1) == 0)
  {
    v11 = 1;
    if (!v46)
      v11 = v49;
  }
  v45 = (v11 ^ 1) & 1;
  v40 = 0;
  v41 = &v40;
  v42 = 0x20000000;
  v43 = 32;
  v44 = 0;
  if (v45)
  {
    v41[3] |= 2uLL;
    if (-[BuddyDiagnosticsController _determineDisplayModeShouldPotentiallyIncludeApps](v51, "_determineDisplayModeShouldPotentiallyIncludeApps"))
    {
      v12 = -[BuddyDiagnosticsController capabilities](v51, "capabilities");
      v13 = -[BYCapabilities isAppAnalyticsRestricted](v12, "isAppAnalyticsRestricted");

      v39 = v13 & 1;
      v38 = !(v13 & 1);
      if ((v13 & 1) == 0)
        v41[3] |= 4uLL;
    }
  }
  v14 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v37 = objc_msgSend(v14, "aa_primaryAppleAccount");

  v35 = 0;
  v15 = (id)-[BuddyDiagnosticsController imposeSeedPolicy](v51, "imposeSeedPolicy");
  v16 = 0;
  if ((v15 & 1) == 0)
  {
    v16 = 0;
    if ((v49 & 1) == 0)
    {
      v16 = 0;
      if (v37)
      {
        v36 = -[BuddyDiagnosticsController capabilities](v51, "capabilities");
        v35 = 1;
        v15 = -[BYCapabilities isCloudAnalyticsRestricted](v36, "isCloudAnalyticsRestricted");
        v16 = v15 ^ 1;
      }
    }
  }
  if ((v35 & 1) != 0)

  if ((v16 & 1) != 0)
  {
    v17 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
    v25 = _NSConcreteStackBlock;
    v26 = -1073741824;
    v27 = 0;
    v28 = sub_1001637F8;
    v29 = &unk_100283A20;
    v31[1] = &v40;
    v31[0] = location[0];
    v32 = v48 & 1;
    v33 = v47;
    v30 = v51;
    v34 = v49 & 1;
    objc_msgSend(v17, "primaryAccountIsChildAccount:", &v25);

    v24 = 1;
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong(v31, 0);
  }
  else
  {
    if (location[0])
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v15);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v41[3];
        v19 = v48 & 1;
        v20 = v47;
        v21 = -[BuddyDiagnosticsController miscState](v51, "miscState");
        v22 = -[BuddyMiscState launchedWithCombinedAnalyticsMismatch](v21, "launchedWithCombinedAnalyticsMismatch");
        sub_100163C8C((uint64_t)buf, v18, v19, v20, v22 & 1, v49 & 1);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Diagnostics display mode = %ld, factors: Restricted = %d, AlreadyYes = %d, Mismatch = %d, AlreadyPresented = %d", buf, 0x24u);

      }
      objc_storeStrong((id *)&oslog, 0);
      (*((void (**)(id, uint64_t))location[0] + 2))(location[0], v41[3]);
    }
    v24 = 0;
  }
  objc_storeStrong(&v37, 0);
  _Block_object_dispose(&v40, 8);
  objc_storeStrong(location, 0);
}

- (BOOL)_determineDisplayModeShouldPotentiallyIncludeApps
{
  BuddyMiscState *v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  BYRunState *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _WORD v13[3];
  os_log_type_t v14;
  os_log_t v15;
  char v16;
  id v17;
  uint8_t buf[15];
  os_log_type_t v19;
  os_log_t oslog[2];
  BuddyDiagnosticsController *v21;

  v21 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyDiagnosticsController miscState](self, "miscState");
  v3 = -[BuddyMiscState launchedWithCombinedAnalyticsMismatch](v2, "launchedWithCombinedAnalyticsMismatch");

  if ((v3 & 1) != 0)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v4);
    v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog[0];
      v6 = v19;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Diagnostics display mode potentially including apps (via mismatch)", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    return 1;
  }
  else
  {
    v7 = -[BuddyDiagnosticsController runState](v21, "runState");
    v16 = 0;
    v8 = 0;
    if ((-[BYRunState hasCompletedInitialRun](v7, "hasCompletedInitialRun") & 1) == 0)
    {
      v17 = -[BuddyDiagnosticsController capabilities](v21, "capabilities");
      v16 = 1;
      v8 = objc_msgSend(v17, "eligibleForChlorine");
    }
    if ((v16 & 1) != 0)

    if ((v8 & 1) != 0)
    {
      v15 = (os_log_t)(id)_BYLoggingFacility(v9);
      v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v15;
        v11 = v14;
        sub_100038C3C(v13);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Diagnostics display mode potentially including apps (via eligibility)", (uint8_t *)v13, 2u);
      }
      objc_storeStrong((id *)&v15, 0);
      return 1;
    }
    else
    {
      return 0;
    }
  }
}

+ (void)_writeValuesForKeysToIdMS:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t i;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, char, id);
  void *v18;
  id v19;
  os_log_type_t v20;
  os_log_t oslog;
  id v22;
  _QWORD __b[8];
  id v24;
  id v25;
  id v26;
  id v27;
  id location[3];
  uint8_t buf[32];
  _BYTE v30[128];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v27 = objc_msgSend(v3, "aa_primaryAppleAccount");

  if (v27)
  {
    v26 = objc_msgSend(v27, "aa_altDSID");
    v25 = (id)objc_opt_new(AKAppleIDAuthenticationController);
    memset(__b, 0, sizeof(__b));
    v4 = location[0];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
    if (v5)
    {
      v6 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v5; ++i)
        {
          if (*(_QWORD *)__b[2] != v6)
            objc_enumerationMutation(v4);
          v24 = *(id *)(__b[1] + 8 * i);
          v22 = objc_msgSend(location[0], "objectForKeyedSubscript:", v24);
          oslog = (os_log_t)(id)_BYLoggingFacility(v22);
          v20 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            v8 = oslog;
            v9 = v20;
            sub_10003EB04((uint64_t)buf, (uint64_t)v24, (uint64_t)v22);
            _os_log_impl((void *)&_mh_execute_header, v8, v9, "Writing value to IdMS '%@' = '%@'...", buf, 0x16u);
          }
          objc_storeStrong((id *)&oslog, 0);
          v10 = v25;
          v11 = v22;
          v12 = v24;
          v13 = v26;
          v14 = _NSConcreteStackBlock;
          v15 = -1073741824;
          v16 = 0;
          v17 = sub_100164174;
          v18 = &unk_100280FD8;
          v19 = v24;
          objc_msgSend(v10, "setConfigurationInfo:forIdentifier:forAltDSID:completion:", v11, v12, v13, &v14);
          objc_storeStrong(&v19, 0);
          objc_storeStrong(&v22, 0);
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
      }
      while (v5);
    }

    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)_prepareAnalyticsWithCompletion:(id)a3
{
  unsigned __int8 v3;
  BYAnalyticsManager *v4;
  BYAnalyticsManager *v5;
  id location[2];
  BuddyDiagnosticsController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyDiagnosticsController _shouldReportCombinedAnalyticsChoice](v7, "_shouldReportCombinedAnalyticsChoice");
  -[BuddyDiagnosticsController setShouldReportCombinedAnalyticsChoice:](v7, "setShouldReportCombinedAnalyticsChoice:", v3 & 1);
  if (-[BuddyDiagnosticsController shouldReportCombinedAnalyticsChoice](v7, "shouldReportCombinedAnalyticsChoice"))
  {
    v4 = -[BuddyDiagnosticsController analyticsManager](v7, "analyticsManager");

    if (!v4)
      objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("Missing analytics manager"), 0, 0));
    v5 = -[BuddyDiagnosticsController analyticsManager](v7, "analyticsManager");
    -[BYAnalyticsManager prepareForCombinedAnalyticsRepromptWithCompletion:](v5, "prepareForCombinedAnalyticsRepromptWithCompletion:", location[0]);

  }
  else
  {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_shouldReportCombinedAnalyticsChoice
{
  BYRunState *v2;
  char v3;
  BuddyMiscState *v4;
  char v5;

  v2 = -[BuddyDiagnosticsController runState](self, "runState");
  v3 = -[BYRunState hasCompletedInitialRun](v2, "hasCompletedInitialRun") ^ 1;

  if ((v3 & 1) != 0)
    return 0;
  v4 = -[BuddyDiagnosticsController miscState](self, "miscState");
  v5 = !-[BuddyMiscState launchedWithCombinedAnalyticsMismatch](v4, "launchedWithCombinedAnalyticsMismatch");

  return (v5 & 1) == 0 && (-[BuddyDiagnosticsController mode](self, "mode") & 6) == 6;
}

- (BOOL)controllerNeedsToRun
{
  BYCapabilities *v2;
  unsigned __int8 v3;
  MCProfileConnection *v4;
  BOOL v5;
  BYPreferencesController *v6;
  unsigned __int8 v7;
  uint64_t v8;
  os_log_t oslog;
  char v11;
  BOOL v12;
  char v13;
  SEL v14;
  BuddyDiagnosticsController *v15;
  uint8_t buf[24];

  v15 = self;
  v14 = a2;
  if (!-[BuddyDiagnosticsController imposeSeedPolicy](self, "imposeSeedPolicy"))
    return 1;
  if (!-[BuddyDiagnosticsController isSeedBuild](v15, "isSeedBuild"))
    return 0;
  v2 = -[BuddyDiagnosticsController capabilities](v15, "capabilities");
  v3 = -[BYCapabilities isDeviceAnalyticsRestricted](v2, "isDeviceAnalyticsRestricted");

  v13 = v3 & 1;
  v4 = -[BuddyDiagnosticsController managedConfiguration](v15, "managedConfiguration");
  v5 = -[MCProfileConnection effectiveBoolValueForSetting:](v4, "effectiveBoolValueForSetting:", MCFeatureDiagnosticsSubmissionAllowed) == 1;

  v12 = v5;
  v6 = -[BuddyDiagnosticsController buddyPreferences](v15, "buddyPreferences");
  v7 = -[BYPreferencesController BOOLForKey:](v6, "BOOLForKey:", CFSTR("PBDiagnostics4Presented"));

  v11 = v7 & 1;
  oslog = (os_log_t)(id)_BYLoggingFacility(v8);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100164768((uint64_t)buf, v13 & 1, v12, v11 & 1);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Seed diagnostics preemptors: Restricted = %d, IsAlreadyYes = %d, already presented = %d", buf, 0x14u);
  }
  objc_storeStrong((id *)&oslog, 0);
  return (v13 & 1) == 0 && !v12 && (v11 & 1) == 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  MCProfileConnection *v3;
  id v4;
  MCProfileConnection *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(id *);
  void *v15;
  BuddyDiagnosticsController *v16;
  id v17;
  int v18;
  void **v19;
  int v20;
  int v21;
  void (*v22)(uint64_t, char);
  void *v23;
  BuddyDiagnosticsController *v24;
  id v25;
  id v26;
  os_log_type_t v27;
  os_log_t oslog;
  id v29;
  id location[2];
  BuddyDiagnosticsController *v31;
  uint8_t buf[24];

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyDiagnosticsController managedConfiguration](v31, "managedConfiguration");
  v4 = -[MCProfileConnection userBoolValueForSetting:](v3, "userBoolValueForSetting:", MCFeatureDiagnosticsSubmissionAllowed);
  -[BuddyDiagnosticsController setInitialDeviceAnalyticsUserSetting:](v31, "setInitialDeviceAnalyticsUserSetting:", v4);

  v5 = -[BuddyDiagnosticsController managedConfiguration](v31, "managedConfiguration");
  v6 = -[MCProfileConnection userBoolValueForSetting:](v5, "userBoolValueForSetting:", MCFeatureAppAnalyticsAllowed);
  -[BuddyDiagnosticsController setInitialAppAnalyticsUserSetting:](v31, "setInitialAppAnalyticsUserSetting:", v6);

  v7 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v29 = objc_msgSend(v7, "objectForKey:", CFSTR("PBAnalyticsForceMode"));

  if (v29)
  {
    v8 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v29, v8) & 1) != 0)
    {
      v9 = objc_msgSend(v29, "unsignedIntegerValue");
      oslog = (os_log_t)(id)_BYLoggingFacility(-[BuddyDiagnosticsController setMode:](v31, "setMode:", v9));
      v27 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        sub_1000342B4((uint64_t)buf, -[BuddyDiagnosticsController mode](v31, "mode"));
        _os_log_debug_impl((void *)&_mh_execute_header, oslog, v27, "Analytics forcing mode %lu", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
  v19 = _NSConcreteStackBlock;
  v20 = -1073741824;
  v21 = 0;
  v22 = sub_100164AF8;
  v23 = &unk_100280708;
  v24 = v31;
  v25 = location[0];
  v26 = objc_retainBlock(&v19);
  if (-[BuddyDiagnosticsController mode](v31, "mode"))
  {
    (*((void (**)(id, uint64_t))v26 + 2))(v26, 1);
    v18 = 1;
  }
  else
  {
    v10 = dispatch_get_global_queue(2, 0);
    v11 = _NSConcreteStackBlock;
    v12 = -1073741824;
    v13 = 0;
    v14 = sub_100164C04;
    v15 = &unk_1002806E0;
    v16 = v31;
    v17 = v26;
    dispatch_async(v10, &v11);

    objc_storeStrong(&v17, 0);
    objc_storeStrong((id *)&v16, 0);
    v18 = 0;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupDiagnostics;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (void)skippedByCloudConfigWithEnvironment:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  id location[2];
  id v9;

  v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v4 = objc_msgSend(location[0], "chronicle");
  v5 = objc_msgSend(location[0], "settingsManager");
  v6 = objc_msgSend(location[0], "buddyPreferences");
  objc_msgSend(v3, "setDeviceAnalyticsSubmissionEnabled:presented:chronicle:settingsManager:buddyPreferences:", 0, 0, v4, v5, v6);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, DiagnosticsShouldSubmitNotification, 0, 0, 0);
  objc_storeStrong(location, 0);
}

- (BYChronicle)chronicle
{
  return self->_chronicle;
}

- (void)setChronicle:(id)a3
{
  objc_storeStrong((id *)&self->_chronicle, a3);
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BOOL)imposeSeedPolicy
{
  return self->_imposeSeedPolicy;
}

- (void)setImposeSeedPolicy:(BOOL)a3
{
  self->_imposeSeedPolicy = a3;
}

- (BOOL)isSeedBuild
{
  return self->_isSeedBuild;
}

- (void)setIsSeedBuild:(BOOL)a3
{
  self->_isSeedBuild = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (int)initialDeviceAnalyticsUserSetting
{
  return self->_initialDeviceAnalyticsUserSetting;
}

- (void)setInitialDeviceAnalyticsUserSetting:(int)a3
{
  self->_initialDeviceAnalyticsUserSetting = a3;
}

- (int)initialAppAnalyticsUserSetting
{
  return self->_initialAppAnalyticsUserSetting;
}

- (void)setInitialAppAnalyticsUserSetting:(int)a3
{
  self->_initialAppAnalyticsUserSetting = a3;
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (BOOL)shouldReportCombinedAnalyticsChoice
{
  return self->_shouldReportCombinedAnalyticsChoice;
}

- (void)setShouldReportCombinedAnalyticsChoice:(BOOL)a3
{
  self->_shouldReportCombinedAnalyticsChoice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_chronicle, 0);
}

@end
