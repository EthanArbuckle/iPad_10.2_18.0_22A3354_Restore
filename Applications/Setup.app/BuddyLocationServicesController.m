@implementation BuddyLocationServicesController

- (BuddyLocationServicesController)init
{
  NSBundle *v2;
  id v3;
  id v4;
  BuddyLocationServicesController *v5;
  objc_super v7;
  id v8[2];
  id location;

  location = self;
  v8[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("LOCATION_SERVICES"));
  v8[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));

  v4 = location;
  location = 0;
  v7.receiver = v4;
  v7.super_class = (Class)BuddyLocationServicesController;
  location = -[BuddyLocationServicesController initWithTitle:detailText:symbolName:](&v7, "initWithTitle:detailText:symbolName:", v8[0], 0, 0);
  objc_storeStrong(&location, location);
  v5 = (BuddyLocationServicesController *)location;
  objc_storeStrong(v8, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  BuddyFlowItemDispositionProvider *v2;
  unint64_t v3;
  BuddyFlowItemDispositionProvider *v4;
  BuddyFlowItemDispositionProvider *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSBundle *v10;
  NSString *v11;
  id v12;
  NSBundle *v13;
  NSString *v14;
  id v15;
  BuddyLocationServicesController *v16;
  NSBundle *v17;
  id v18;
  NSString *v19;
  BuddyLocationServicesController *v20;
  NSBundle *v21;
  id v22;
  NSString *v23;
  id v24;
  NSArray *v25;
  id v26;
  double v27;
  id v28;
  id v29;
  id v30;
  NSArray *v31;
  id location;
  objc_super v33;
  SEL v34;
  BuddyLocationServicesController *v35;
  _QWORD v36[2];
  uint64_t v37;

  v35 = self;
  v34 = a2;
  v33.receiver = self;
  v33.super_class = (Class)BuddyLocationServicesController;
  -[BuddyLocationServicesController viewDidLoad](&v33, "viewDidLoad");
  v2 = -[BuddyLocationServicesController flowItemDispositionProvider](v35, "flowItemDispositionProvider");
  v3 = -[BuddyFlowItemDispositionProvider dispositions](v2, "dispositions");

  if (v3)
  {
    v4 = -[BuddyLocationServicesController flowItemDispositionProvider](v35, "flowItemDispositionProvider");
    location = +[BuddyLocalizationUtilities dispositionSpecificLocalizedStringKeyForKey:disposition:](BuddyLocalizationUtilities, "dispositionSpecificLocalizedStringKeyForKey:disposition:", CFSTR("LOCATION_SERVICES_DESCRIPTION"), -[BuddyFlowItemDispositionProvider dispositions](v4, "dispositions"));

    v5 = -[BuddyLocationServicesController flowItemDispositionProvider](v35, "flowItemDispositionProvider");
    v6 = -[BuddyFlowItemDispositionProvider dispositions](v5, "dispositions");

    if (v6 == (id)8)
    {
      v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", location);
      v8 = location;
      location = v7;

    }
    v9 = -[BuddyLocationServicesController headerView](v35, "headerView");
    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", location, &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(v9, "setDetailText:", v11);

    objc_storeStrong(&location, 0);
  }
  else
  {
    v12 = -[BuddyLocationServicesController headerView](v35, "headerView");
    v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("LOCATION_SERVICES_DESCRIPTION"), &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(v12, "setDetailText:", v14);

  }
  v15 = -[BuddyLocationServicesController headerView](v35, "headerView");
  objc_msgSend(v15, "setIconInheritsTint:", 1);

  v16 = v35;
  v17 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v18 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ENABLE_LOCATION_SERVICES"));
  v19 = -[NSBundle localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", v18, &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v16, "addBoldButton:action:", v19, "_enableButtonTapped:");

  v20 = v35;
  v21 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v22 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("DISABLE_LOCATION_SERVICES"));
  v23 = -[NSBundle localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", v22, &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addLinkButton:action:](v20, "addLinkButton:action:", v23, "_disableButtonPressed:");

  v24 = -[BuddyLocationServicesController buttonTray](v35, "buttonTray");
  v37 = BYPrivacyLocationServicesIdentifier;
  v25 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1);
  objc_msgSend(v24, "setPrivacyLinkForBundles:", v25);

  v26 = -[BuddyLocationServicesController headerView](v35, "headerView");
  LODWORD(v27) = 1045220557;
  objc_msgSend(v26, "setTitleHyphenationFactor:", v27);

  v28 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 1"), CFSTR("Dark 1"), 0.01, 1.0);
  v36[0] = v28;
  v29 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), CFSTR("Dark 2"), 1.0, 0.7);
  v36[1] = v29;
  v31 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2);

  v30 = -[BuddyLocationServicesController buddy_animationController:animatedStates:startAtFirstState:](v35, "buddy_animationController:animatedStates:startAtFirstState:", CFSTR("Location"), v31, 1);
  -[BuddyLocationServicesController setAnimationController:](v35, "setAnimationController:", v30);

  objc_storeStrong((id *)&v31, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  BYPaneFeatureAnalyticsManager *v3;
  OBAnimationController *v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  BuddyLocationServicesController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BuddyLocationServicesController;
  -[BuddyLocationServicesController viewWillAppear:](&v5, "viewWillAppear:", a3);
  +[BuddyLocationServicesController _setPersistentPresentedKey:](BuddyLocationServicesController, "_setPersistentPresentedKey:", 0);
  v3 = -[BuddyLocationServicesController paneFeatureAnalyticsManager](v8, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v3, "clearActionForFeature:", 6);

  v4 = -[BuddyLocationServicesController animationController](v8, "animationController");
  -[OBAnimationController startAnimation](v4, "startAnimation");

}

+ (BOOL)controllerNeedsToRun
{
  char v2;
  char v4;
  id location[3];
  id v6;

  location[2] = a1;
  location[1] = (id)a2;
  v6 = (id)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  location[0] = v6;
  v4 = (objc_msgSend(location[0], "containsObject:", CFSTR("location")) ^ 1) & 1;
  v2 = 0;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("LocationServices5Presented"), BYBuddyNotBackedUpIdentifier, 0))
    v2 = v4;
  objc_storeStrong(location, 0);
  return v2 & 1;
}

+ (BOOL)hiddenFromStoreDemoMode
{
  return 1;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupLocation;
}

+ (void)skippedByCloudConfig
{
  if ((BYSetupAssistantHasCompletedInitialRun(a1, a2) & 1) == 0)
    +[CLLocationManager setLocationServicesEnabled:](CLLocationManager, "setLocationServicesEnabled:", 0, a2, a1);
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (void)startOver
{
  +[CLLocationManager setLocationServicesEnabled:](CLLocationManager, "setLocationServicesEnabled:", 0, a2, self);
  +[BuddyLocationServicesController _setPersistentPresentedKey:](BuddyLocationServicesController, "_setPersistentPresentedKey:", 0);
}

+ (void)_setPersistentPresentedKey:(BOOL)a3
{
  CFBooleanRef v3;

  if (a3)
    v3 = kCFBooleanTrue;
  else
    v3 = kCFBooleanFalse;
  CFPreferencesSetAppValue(CFSTR("LocationServices5Presented"), v3, BYBuddyNotBackedUpIdentifier);
  CFPreferencesAppSynchronize(BYBuddyNotBackedUpIdentifier);
}

+ (void)setSettingEnabled:(BOOL)a3 presented:(BOOL)a4 settingsManager:(id)a5
{
  id v5;
  BOOL v6;
  BOOL v7;
  SEL v8;
  id v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = a4;
  v5 = 0;
  objc_storeStrong(&v5, a5);
  +[CLLocationManager setLocationServicesEnabled:](CLLocationManager, "setLocationServicesEnabled:", v7);
  objc_msgSend(v5, "stashLocationServicesChoice:", v7);
  objc_msgSend(v9, "_setPersistentPresentedKey:", v6);
  objc_storeStrong(&v5, 0);
}

+ (void)setSettingsFromArchivedPreferences:(id)a3 settingsManager:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSString *v9;
  char v10;
  NSString *v11;
  char v12;
  id v13;
  os_log_t oslog;
  id v15;
  id v16;
  id location[2];
  id v18;
  uint8_t buf[24];

  v18 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  if (location[0])
  {
    v5 = +[CLLocationManager _applyArchivedAuthorizationDecisions:](CLLocationManager, "_applyArchivedAuthorizationDecisions:", location[0]);
    v6 = v15;
    v15 = v5;

  }
  else
  {
    v8 = +[CLLocationManager sharedManager](CLLocationManager, "sharedManager");
    objc_msgSend(v8, "resetApps");

  }
  if (v15)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v7);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v12 = 0;
      v10 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v9 = (NSString *)v15;
      }
      else
      {
        v13 = objc_msgSend(v15, "domain");
        v12 = 1;
        v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v13, objc_msgSend(v15, "code"));
        v11 = v9;
        v10 = 1;
      }
      sub_100038C28((uint64_t)buf, (uint64_t)v9);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to set location services settings: %@", buf, 0xCu);
      if ((v10 & 1) != 0)

      if ((v12 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    objc_msgSend(v16, "stashLocationServicesSettings:", location[0]);
    objc_msgSend(v18, "_setPersistentPresentedKey:", location[0] != 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)_enableButtonTapped:(id)a3
{
  void *v3;
  BFFSettingsManager *v4;
  BYPaneFeatureAnalyticsManager *v5;
  BFFFlowItemDelegate *v6;
  id location[2];
  BuddyLocationServicesController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)objc_opt_class(v8);
  v4 = -[BuddyLocationServicesController settingsManager](v8, "settingsManager");
  objc_msgSend(v3, "setSettingEnabled:presented:settingsManager:", 1, 1, v4);

  v5 = -[BuddyLocationServicesController paneFeatureAnalyticsManager](v8, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v5, "recordActionWithValue:forFeature:", &__kCFBooleanTrue, 6);

  v6 = -[BuddyWelcomeController delegate](v8, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v6, "flowItemDone:", v8);

  objc_storeStrong(location, 0);
}

- (void)_disableButtonPressed:(id)a3
{
  ProximitySetupController *v3;
  unsigned __int8 v4;
  BOOL v5;
  NSBundle *v6;
  id v7;
  NSString *v8;
  id v9;
  NSString *v10;
  id v11;
  NSBundle *v12;
  NSString *v13;
  id v14;
  NSBundle *v15;
  NSString *v16;
  UIAlertAction *v17;
  id v18;
  NSBundle *v19;
  NSString *v20;
  UIAlertAction *v21;
  void **v22;
  int v23;
  int v24;
  void (*v25)(id *, void *);
  void *v26;
  BuddyLocationServicesController *v27;
  id v28;
  id v29;
  char v30;
  id v31;
  char v32;
  id v33;
  char v34;
  BOOL v35;
  id location[2];
  BuddyLocationServicesController *v37;

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  v3 = -[BuddyLocationServicesController proximitySetupController](v37, "proximitySetupController");
  v4 = -[ProximitySetupController hasAppliedSettings](v3, "hasAppliedSettings");

  v34 = v4 & 1;
  v32 = 0;
  v30 = 0;
  v5 = 0;
  if ((v4 & 1) != 0)
  {
    v33 = -[BuddyLocationServicesController pendingRestoreState](v37, "pendingRestoreState");
    v32 = 1;
    v31 = objc_msgSend(v33, "backupItem");
    v30 = 1;
    v5 = v31 == 0;
  }
  v35 = v5;
  if ((v30 & 1) != 0)

  if ((v32 & 1) != 0)
  v29 = 0;
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  if (v35)
  {
    v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("LOCATION_SERVICES_DISABLED_MESSAGE_FMIP"));
    v8 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v7, &stru_100284738, CFSTR("Localizable"));
    v9 = v29;
    v29 = v8;

  }
  else
  {
    v10 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("LOCATION_SERVICES_DISABLED_MESSAGE"), &stru_100284738, CFSTR("Localizable"));
    v11 = v29;
    v29 = v10;

  }
  v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("LOCATION_SERVICES_DISABLED_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v28 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v29, 1);

  v14 = v28;
  v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v16 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
  v22 = _NSConcreteStackBlock;
  v23 = -1073741824;
  v24 = 0;
  v25 = sub_10012DEE0;
  v26 = &unk_100280A28;
  v27 = v37;
  v17 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, &v22);
  objc_msgSend(v14, "addAction:", v17);

  v18 = v28;
  v19 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v20 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("Localizable"));
  v21 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, 0);
  objc_msgSend(v18, "addAction:", v21);

  -[BuddyLocationServicesController presentViewController:animated:completion:](v37, "presentViewController:animated:completion:", v28, 1, 0);
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestoreState, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
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

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, a3);
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
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
}

@end
