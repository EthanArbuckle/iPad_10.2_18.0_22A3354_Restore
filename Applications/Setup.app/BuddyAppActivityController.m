@implementation BuddyAppActivityController

- (BuddyAppActivityController)init
{
  NSBundle *v2;
  NSBundle *v3;
  UIDevice *v4;
  unsigned __int8 v5;
  NSBundle *v6;
  NSString *v7;
  id v8;
  id v9;
  id v10;
  BuddyAppActivityController *v11;
  objc_super v13;
  id v14;
  id v15[2];
  id location;

  location = self;
  v15[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v15[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("APP_ANALYTICS"), &stru_100284738, CFSTR("Localizable"));

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v14 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("APP_ANALYTICS_DESCRIPTION"), &stru_100284738, CFSTR("Localizable"));

  v4 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = -[UIDevice sf_isChinaRegionCellularDevice](v4, "sf_isChinaRegionCellularDevice");

  if ((v5 & 1) != 0)
  {
    v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("ANALYTICS_CELLULAR_DATA_NOTICE"), &stru_100284738, CFSTR("Localizable"));
    v8 = objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("\n\n%@"), v7);
    v9 = v14;
    v14 = v8;

  }
  v10 = location;
  location = 0;
  v13.receiver = v10;
  v13.super_class = (Class)BuddyAppActivityController;
  location = -[BuddyAppActivityController initWithTitle:detailText:icon:](&v13, "initWithTitle:detailText:icon:", v15[0], v14, 0);
  objc_storeStrong(&location, location);
  v11 = (BuddyAppActivityController *)location;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);
  objc_storeStrong(&location, 0);
  return v11;
}

- (BYPreferencesController)buddyPreferences
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v5[3];
  char v6;
  os_log_t oslog[2];
  BuddyAppActivityController *v8;

  v8 = self;
  oslog[1] = (os_log_t)a2;
  if (!self->_buddyPreferences)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
    v6 = 17;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_FAULT))
    {
      v2 = oslog[0];
      v3 = v6;
      sub_100038C3C(v5);
      _os_log_fault_impl((void *)&_mh_execute_header, v2, v3, "Preferences controller is nil", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  return v8->_buddyPreferences;
}

- (void)viewDidLoad
{
  id v2;
  MCProfileConnection *v3;
  id v4;
  BuddyAppActivityController *v5;
  NSBundle *v6;
  NSString *v7;
  BuddyAppActivityController *v8;
  NSBundle *v9;
  NSString *v10;
  id v11;
  NSArray *v12;
  id v13;
  id v14;
  id v15;
  id location;
  objc_super v17;
  SEL v18;
  BuddyAppActivityController *v19;
  _QWORD v20[2];
  uint64_t v21;

  v19 = self;
  v18 = a2;
  v17.receiver = self;
  v17.super_class = (Class)BuddyAppActivityController;
  -[BuddyAppActivityController viewDidLoad](&v17, "viewDidLoad");
  v2 = -[BuddyAppActivityController headerView](v19, "headerView");
  objc_msgSend(v2, "setIconInheritsTint:", 1);

  v3 = -[BuddyAppActivityController managedConfiguration](v19, "managedConfiguration");
  v4 = -[MCProfileConnection userBoolValueForSetting:](v3, "userBoolValueForSetting:", MCFeatureAppAnalyticsAllowed);
  -[BuddyAppActivityController setInitialAppAnalyticsUserSetting:](v19, "setInitialAppAnalyticsUserSetting:", v4);

  v5 = v19;
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("ENABLE_SHARE_APP_ANALYTICS_WITH_DEVELOPERS"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v5, "addBoldButton:action:", v7, "_enableAppAnalytics:");

  v8 = v19;
  v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("DISABLE_SHARE_APP_ANALYTICS_WITH_DEVELOPERS"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addLinkButton:action:](v8, "addLinkButton:action:", v10, "_disableAppAnalytics:");

  v11 = -[BuddyAppActivityController buttonTray](v19, "buttonTray");
  v21 = BYPrivacyAnalyticsAppIdentifier;
  v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1);
  objc_msgSend(v11, "setPrivacyLinkForBundles:", v12);

  v13 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 1"), CFSTR("Dark 1"), 0.01, 1.0);
  v20[0] = v13;
  v14 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), CFSTR("Dark 2"), 1.0, 0.4);
  v20[1] = v14;
  location = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2);

  v15 = -[BuddyAppActivityController buddy_animationController:animatedStates:startAtFirstState:](v19, "buddy_animationController:animatedStates:startAtFirstState:", CFSTR("AppAnalytics"), location, 1);
  -[BuddyAppActivityController setAnimationController:](v19, "setAnimationController:", v15);

  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  BYPreferencesController *v3;
  BYPaneFeatureAnalyticsManager *v4;
  void *v5;
  BFFSettingsManager *v6;
  BYPreferencesController *v7;
  void *v8;
  BFFSettingsManager *v9;
  BYPreferencesController *v10;
  OBAnimationController *v11;
  objc_super v12;
  BOOL v13;
  SEL v14;
  BuddyAppActivityController *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BuddyAppActivityController;
  -[BuddyAppActivityController viewDidAppear:](&v12, "viewDidAppear:", a3);
  if ((-[BuddyAppActivityController isMovingToParentViewController](v15, "isMovingToParentViewController") & 1) == 0)
  {
    v3 = -[BuddyAppActivityController buddyPreferences](v15, "buddyPreferences");
    -[BYPreferencesController setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("PBAppActivity2Presented"));

    if (-[BuddyAppActivityController initialAppAnalyticsUserSetting](v15, "initialAppAnalyticsUserSetting"))
    {
      if (-[BuddyAppActivityController initialAppAnalyticsUserSetting](v15, "initialAppAnalyticsUserSetting") == 2)
      {
        v8 = (void *)objc_opt_class(v15);
        v9 = -[BuddyAppActivityController settingsManager](v15, "settingsManager");
        v10 = -[BuddyAppActivityController buddyPreferences](v15, "buddyPreferences");
        objc_msgSend(v8, "setAppActivityEnabled:presented:settingsManager:buddyPreferences:", 0, 0, v9, v10);

      }
    }
    else
    {
      v4 = -[BuddyAppActivityController paneFeatureAnalyticsManager](v15, "paneFeatureAnalyticsManager");
      -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v4, "clearActionForFeature:", 4);

      v5 = (void *)objc_opt_class(v15);
      v6 = -[BuddyAppActivityController settingsManager](v15, "settingsManager");
      v7 = -[BuddyAppActivityController buddyPreferences](v15, "buddyPreferences");
      objc_msgSend(v5, "clearAppActivitySettingWithSettingsManager:buddyPreferences:", v6, v7);

    }
  }
  v11 = -[BuddyAppActivityController animationController](v15, "animationController");
  -[OBAnimationController startAnimation](v11, "startAnimation");

}

- (BOOL)settingIsRestrictedOrAlreadyEnabledOrDiagnosticSubmissionNotAllowed
{
  BYCapabilities *v2;
  unsigned __int8 v3;
  BOOL v4;
  unsigned int v5;
  char v7;
  MCProfileConnection *v8;
  char v9;
  MCProfileConnection *v10;
  BOOL v12;

  v2 = -[BuddyAppActivityController capabilities](self, "capabilities");
  v3 = -[BYCapabilities isAppAnalyticsRestricted](v2, "isAppAnalyticsRestricted");
  v9 = 0;
  v7 = 0;
  v4 = 1;
  if ((v3 & 1) == 0)
  {
    v10 = -[BuddyAppActivityController managedConfiguration](self, "managedConfiguration");
    v9 = 1;
    v5 = -[MCProfileConnection effectiveBoolValueForSetting:](v10, "effectiveBoolValueForSetting:", MCFeatureDiagnosticsSubmissionAllowed);
    v4 = 1;
    if (v5 == 1)
    {
      v8 = -[BuddyAppActivityController managedConfiguration](self, "managedConfiguration");
      v7 = 1;
      v4 = -[MCProfileConnection effectiveBoolValueForSetting:](v8, "effectiveBoolValueForSetting:", MCFeatureAppAnalyticsAllowed) == 1;
    }
  }
  v12 = v4;
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  return v12;
}

+ (void)setAppActivityEnabled:(BOOL)a3 presented:(BOOL)a4 settingsManager:(id)a5 buddyPreferences:(id)a6
{
  id v7;
  NSNumber *v8;
  id v9;
  id location;
  BOOL v11;
  BOOL v12;
  SEL v13;
  id v14;

  v14 = a1;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v9 = 0;
  objc_storeStrong(&v9, a6);
  objc_msgSend(location, "setBool:forManagedConfigurationSetting:", v12, MCFeatureAppAnalyticsAllowed);
  v7 = v9;
  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11);
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("PBAppActivity2Presented"));

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

+ (void)clearAppActivitySettingWithSettingsManager:(id)a3 buddyPreferences:(id)a4
{
  id v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_msgSend(location[0], "removeBoolSettingForManagedConfigurationSetting:", MCFeatureAppAnalyticsAllowed);
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("PBAppActivity2Presented"));
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_enableAppAnalytics:(id)a3
{
  BFFSettingsManager *v3;
  BYPreferencesController *v4;
  BYPaneFeatureAnalyticsManager *v5;
  BFFFlowItemDelegate *v6;
  id location[2];
  BuddyAppActivityController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppActivityController settingsManager](v8, "settingsManager");
  v4 = -[BuddyAppActivityController buddyPreferences](v8, "buddyPreferences");
  +[BuddyAppActivityController setAppActivityEnabled:presented:settingsManager:buddyPreferences:](BuddyAppActivityController, "setAppActivityEnabled:presented:settingsManager:buddyPreferences:", 1, 1, v3, v4);

  v5 = -[BuddyAppActivityController paneFeatureAnalyticsManager](v8, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v5, "recordActionWithValue:forFeature:", &__kCFBooleanTrue, 4);

  v6 = -[BuddyWelcomeController delegate](v8, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v6, "flowItemDone:", v8);

  objc_storeStrong(location, 0);
}

- (void)_disableAppAnalytics:(id)a3
{
  BFFSettingsManager *v3;
  BYPreferencesController *v4;
  BYPaneFeatureAnalyticsManager *v5;
  BFFFlowItemDelegate *v6;
  id location[2];
  BuddyAppActivityController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppActivityController settingsManager](v8, "settingsManager");
  v4 = -[BuddyAppActivityController buddyPreferences](v8, "buddyPreferences");
  +[BuddyAppActivityController setAppActivityEnabled:presented:settingsManager:buddyPreferences:](BuddyAppActivityController, "setAppActivityEnabled:presented:settingsManager:buddyPreferences:", 0, 1, v3, v4);

  v5 = -[BuddyAppActivityController paneFeatureAnalyticsManager](v8, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v5, "recordActionWithValue:forFeature:", &__kCFBooleanFalse, 4);

  v6 = -[BuddyWelcomeController delegate](v8, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v6, "flowItemDone:", v8);

  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  BYPreferencesController *v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _WORD v11[3];
  os_log_type_t v12;
  os_log_t v13;
  uint8_t buf[15];
  os_log_type_t v15;
  os_log_t oslog[2];
  BuddyAppActivityController *v17;

  v17 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyAppActivityController settingIsRestrictedOrAlreadyEnabledOrDiagnosticSubmissionNotAllowed](self, "settingIsRestrictedOrAlreadyEnabledOrDiagnosticSubmissionNotAllowed");
  if (v2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v2);
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog[0];
      v4 = v15;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Skipping App Analytics because it is not allowed", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    return 0;
  }
  else
  {
    v5 = -[BuddyAppActivityController buddyPreferences](v17, "buddyPreferences");
    v6 = -[BYPreferencesController BOOLForKey:](v5, "BOOLForKey:", CFSTR("PBAppActivity2Presented"));

    if ((v6 & 1) != 0)
    {
      v13 = (os_log_t)(id)_BYLoggingFacility(v7);
      v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v13;
        v9 = v12;
        sub_100038C3C(v11);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Skipping App Analytics because it's already been offered", (uint8_t *)v11, 2u);
      }
      objc_storeStrong((id *)&v13, 0);
      return 0;
    }
    else
    {
      return 1;
    }
  }
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
  id location[2];
  id v7;

  v7 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v4 = objc_msgSend(location[0], "settingsManager");
  v5 = objc_msgSend(location[0], "buddyPreferences");
  objc_msgSend(v3, "setAppActivityEnabled:presented:settingsManager:buddyPreferences:", 0, 0, v4, v5);

  objc_storeStrong(location, 0);
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManager, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
}

@end
