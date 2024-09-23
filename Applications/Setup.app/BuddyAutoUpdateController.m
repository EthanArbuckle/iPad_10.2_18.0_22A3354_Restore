@implementation BuddyAutoUpdateController

- (BuddyAutoUpdateController)init
{
  NSBundle *v2;
  id v3;
  NSBundle *v4;
  id v5;
  BuddyAutoUpdateController *v6;
  objc_super v8;
  id v9;
  id v10[2];
  id location;

  location = self;
  v10[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("AUTO_UPDATE_TITLE"));
  v10[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));

  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("AUTO_UPDATE_DESCRIPTION"), &stru_100284738, CFSTR("Localizable"));

  v5 = location;
  location = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyAutoUpdateController;
  location = -[BuddyAutoUpdateController initWithTitle:detailText:symbolName:contentLayout:](&v8, "initWithTitle:detailText:symbolName:contentLayout:", v10[0], v9, 0, 2);
  objc_storeStrong(&location, location);
  v6 = (BuddyAutoUpdateController *)location;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)viewDidLoad
{
  NSBundle *v2;
  id v3;
  NSString *v4;
  id v5;
  id v6;
  objc_super v7;
  SEL v8;
  BuddyAutoUpdateController *v9;

  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyAutoUpdateController;
  -[BuddyAutoUpdateController viewDidLoad](&v7, "viewDidLoad");
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("AUTO_UPDATE_BACK_TITLE"));
  v4 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));
  v5 = -[BuddyAutoUpdateController navigationItem](v9, "navigationItem");
  objc_msgSend(v5, "setBackButtonTitle:", v4);

  v6 = -[BuddyAutoUpdateController buddy_animationController:](v9, "buddy_animationController:", CFSTR("Update"));
  -[BuddyAutoUpdateController setAnimationController:](v9, "setAnimationController:", v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  OBAnimationController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyAutoUpdateController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyAutoUpdateController;
  -[BuddyAutoUpdateController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyAutoUpdateController animationController](v7, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

}

+ (void)setAutoDownloadWithUpdateEnabled:(BOOL)a3 presented:(BOOL)a4 buddyPreferences:(id)a5
{
  id v5;
  NSNumber *v6;
  id v7;
  id location;
  BOOL v9;
  BOOL v10;
  SEL v11;
  id v12;

  v12 = a1;
  v11 = a2;
  v10 = a3;
  v9 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v5 = location;
  v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9);
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("AutoUpdatePresented"));

  v7 = objc_msgSend(objc_alloc((Class)SUManagerClient), "initWithDelegate:clientType:", 0, 1);
  objc_msgSend(v7, "enableAutomaticDownload:", v10);
  objc_msgSend(v7, "enableAutomaticUpdateV2:", v10);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

+ (void)clearAutoDownloadWithUpdateSetting:(id)a3
{
  void *v3;
  id location[2];
  id v5;

  v5 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)objc_opt_class(v5);
  objc_msgSend(v3, "setAutoDownloadWithUpdateEnabled:presented:buddyPreferences:", 0, 0, location[0]);
  objc_storeStrong(location, 0);
}

- (void)_enableAutomaticDownload:(BOOL)a3 enableAutomaticUpdate:(BOOL)a4
{
  BFFSettingsManager *v4;
  BFFSettingsManager *v5;
  BYPaneFeatureAnalyticsManager *v6;
  NSNumber *v7;
  BYPaneFeatureAnalyticsManager *v8;
  NSNumber *v9;
  id v10;
  BOOL v11;
  BOOL v12;
  SEL v13;
  BuddyAutoUpdateController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  v10 = objc_msgSend(objc_alloc((Class)SUManagerClient), "initWithDelegate:clientType:", 0, 1);
  objc_msgSend(v10, "enableAutomaticDownload:", v12);
  objc_msgSend(v10, "enableAutomaticUpdateV2:", v11);
  v4 = -[BuddyAutoUpdateController settingsManager](v14, "settingsManager");
  -[BFFSettingsManager setAutoDownloadEnabled:](v4, "setAutoDownloadEnabled:", v12);

  v5 = -[BuddyAutoUpdateController settingsManager](v14, "settingsManager");
  -[BFFSettingsManager setAutoUpdateEnabled:](v5, "setAutoUpdateEnabled:", v11);

  v6 = -[BuddyAutoUpdateController paneFeatureAnalyticsManager](v14, "paneFeatureAnalyticsManager");
  v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12);
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v6, "recordActionWithValue:forFeature:", v7, 2);

  v8 = -[BuddyAutoUpdateController paneFeatureAnalyticsManager](v14, "paneFeatureAnalyticsManager");
  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11);
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v8, "recordActionWithValue:forFeature:", v9, 1);

  objc_storeStrong(&v10, 0);
}

- (void)_updateAutomaticallyPressed:(id)a3
{
  BYPreferencesController *v3;
  BFFFlowItemDelegate *v4;
  id location[2];
  BuddyAutoUpdateController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAutoUpdateController _enableAutomaticDownload:enableAutomaticUpdate:](v6, "_enableAutomaticDownload:enableAutomaticUpdate:", 1, 1);
  v3 = -[BuddyAutoUpdateController buddyPreferences](v6, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("AutoUpdatePresented"));

  v4 = -[BuddyWelcomeController delegate](v6, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v4, "flowItemDone:", v6);

  objc_storeStrong(location, 0);
}

- (void)_updateManuallyPressed:(id)a3
{
  BYPreferencesController *v3;
  BFFFlowItemDelegate *v4;
  id location[2];
  BuddyAutoUpdateController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAutoUpdateController _enableAutomaticDownload:enableAutomaticUpdate:](v6, "_enableAutomaticDownload:enableAutomaticUpdate:", 1, 0);
  v3 = -[BuddyAutoUpdateController buddyPreferences](v6, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("AutoUpdatePresented"));

  v4 = -[BuddyWelcomeController delegate](v6, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v4, "flowItemDone:", v6);

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSoftwareUpdate;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  BYPreferencesController *v2;
  char v3;

  v2 = -[BuddyAutoUpdateController buddyPreferences](self, "buddyPreferences", a2, self);
  v3 = -[BYPreferencesController BOOLForKey:](v2, "BOOLForKey:", CFSTR("AutoUpdatePresented")) ^ 1;

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BYCapabilities *v3;
  unsigned __int8 v4;
  BuddyAutoUpdateController *v5;
  NSBundle *v6;
  id v7;
  NSString *v8;
  BuddyAutoUpdateController *v9;
  NSBundle *v10;
  NSString *v11;
  NSString *v12;
  NSBundle *v13;
  NSString *v14;
  BuddyAutoUpdateController *v15;
  id location[2];
  BuddyAutoUpdateController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAutoUpdateController capabilities](v17, "capabilities");
  v4 = -[BYCapabilities mgHasGreenTea](v3, "mgHasGreenTea");

  v5 = v17;
  if ((v4 & 1) != 0)
  {
    v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("AUTO_UPDATE_INSTALL_UPDATES_AUTOMATICALLY"));
    v8 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v7, &stru_100284738, CFSTR("Localizable"));
    -[BuddyWelcomeController addBoldButton:action:](v5, "addBoldButton:action:", v8, "_updateAutomaticallyPressed:");

    v9 = v17;
    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = (NSString *)+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("AUTO_UPDATE_DOWNLOAD_IOS_UPDATES_AUTOMATICALLY"));
    v12 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", v11, &stru_100284738, CFSTR("Localizable"));
    -[BuddyWelcomeController addLinkButton:action:](v9, "addLinkButton:action:", v12, "_updateManuallyPressed:");

  }
  else
  {
    v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
    -[BuddyWelcomeController addBoldButton:action:](v5, "addBoldButton:action:", v14, "_updateAutomaticallyPressed:");

    v15 = v17;
    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("AUTO_UPDATE_DOWNLOAD_UPDATES_AUTOMATICALLY"), &stru_100284738, CFSTR("Localizable"));
    -[BuddyWelcomeController addLinkButton:action:](v15, "addLinkButton:action:", v11, "_updateManuallyPressed:");
  }

  if (location[0])
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  objc_storeStrong(location, 0);
}

- (void)controllerWasPopped
{
  BYPreferencesController *v2;
  BYPaneFeatureAnalyticsManager *v3;
  BYPaneFeatureAnalyticsManager *v4;

  v2 = -[BuddyAutoUpdateController buddyPreferences](self, "buddyPreferences", a2);
  -[BYPreferencesController removeObjectForKey:](v2, "removeObjectForKey:", CFSTR("AutoUpdatePresented"));

  v3 = -[BuddyAutoUpdateController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v3, "clearActionForFeature:", 1);

  v4 = -[BuddyAutoUpdateController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v4, "clearActionForFeature:", 2);

}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestoreState, a3);
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

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
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
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
}

@end
