@implementation BuddyPasscodeController

- (BOOL)controllerNeedsToRun
{
  MCProfileConnection *v2;
  unsigned int v3;
  MCProfileConnection *v4;
  unsigned __int8 v5;
  BYPreferencesController *v6;
  char v7;
  unsigned __int8 v8;
  char v9;
  char v11;
  BYPreferencesController *v12;
  char v13;
  char v14;
  BOOL v16;

  v2 = -[BuddyPasscodeController managedConfiguration](self, "managedConfiguration");
  v3 = -[MCProfileConnection effectiveBoolValueForSetting:](v2, "effectiveBoolValueForSetting:", MCFeaturePasscodeModificationAllowed);

  if (v3 == 2)
    return 0;
  v4 = -[BuddyPasscodeController managedConfiguration](self, "managedConfiguration");
  v5 = -[MCProfileConnection isPasscodeSet](v4, "isPasscodeSet");

  v14 = v5 & 1;
  v13 = 0;
  v6 = -[BuddyPasscodeController buddyPreferences](self, "buddyPreferences");
  v7 = 0;
  if ((-[BYPreferencesController BOOLForKey:](v6, "BOOLForKey:", CFSTR("Payment2Presented")) & 1) == 0)
    v7 = MGGetBoolAnswer(CFSTR("0dnM19zBqLw5ZPhIo4GEkg")) & 1;

  if ((v7 & 1) != 0)
    v13 = 1;
  v11 = 0;
  if ((v13 & 1) != 0
    || (v12 = -[BuddyPasscodeController buddyPreferences](self, "buddyPreferences"),
        v11 = 1,
        v8 = -[BYPreferencesController BOOLForKey:](v12, "BOOLForKey:", CFSTR("Passcode4Presented")),
        v9 = 0,
        (v8 & 1) == 0))
  {
    v9 = v14 ^ 1;
  }
  v16 = v9 & 1;
  if ((v11 & 1) != 0)

  return v16;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupPasscode;
}

+ (BOOL)hiddenFromStoreDemoMode
{
  return 1;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BuddyPasscodeController)init
{
  BuddyPasscodeController *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyPasscodeController;
  location = -[BuddyPasscodeBaseViewController init](&v4, "init");
  objc_storeStrong(&location, location);
  if (location)
    objc_msgSend(location, "setPasscodeCreationDelegate:", location);
  v2 = (BuddyPasscodeController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidLoad
{
  ProximitySetupController *v2;
  SASProximityInformation *v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;
  id location[2];
  BuddyPasscodeController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v2 = -[BuddyPasscodeController proximitySetupController](self, "proximitySetupController");
  v3 = -[ProximitySetupController information](v2, "information");
  v4 = -[SASProximityInformation appleID](v3, "appleID");

  if (v4)
    objc_storeStrong(location, BYPrivacyAppleIDIdentifier);
  -[BuddyPasscodeBaseViewController setIncludeHeaderAnimation:](v9, "setIncludeHeaderAnimation:", location[0] == 0);
  v7.receiver = v9;
  v7.super_class = (Class)BuddyPasscodeController;
  -[BuddyPasscodeBaseViewController viewDidLoad](&v7, "viewDidLoad");
  if (location[0])
  {
    v6 = +[OBPrivacyLinkController linkWithBundleIdentifier:](OBPrivacyLinkController, "linkWithBundleIdentifier:", location[0]);
    objc_msgSend(v6, "setDisplayCaptionText:", 0);
    v5 = -[BuddyPasscodeController buttonTray](v9, "buttonTray");
    objc_msgSend(v5, "setPrivacyLinkController:", v6);

    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  BuddyFlowItemDispositionProvider *v3;
  unint64_t v4;
  BuddyMiscState *v5;
  BYPaneFeatureAnalyticsManager *v6;
  objc_super v7;
  BOOL v8;
  SEL v9;
  BuddyPasscodeController *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BuddyPasscodeController;
  -[BuddyPasscodeBaseViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v3 = -[BuddyPasscodeBaseViewController flowItemDispositionProvider](v10, "flowItemDispositionProvider");
  v4 = -[BuddyFlowItemDispositionProvider dispositions](v3, "dispositions") & 8;

  if (v4 == 8)
  {
    v5 = -[BuddyPasscodeController miscState](v10, "miscState");
    -[BuddyMiscState setHasPresentedPasscodeFlow:](v5, "setHasPresentedPasscodeFlow:", 0);

  }
  v6 = -[BuddyPasscodeController paneFeatureAnalyticsManager](v10, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v6, "clearActionForFeature:", 11);

}

- (BOOL)allowsSkip
{
  return +[BuddyPasscodeBaseViewController allowSkip](BuddyPasscodeBaseViewController, "allowSkip", a2, self);
}

- (BOOL)isEphemeral
{
  return !-[BuddyPasscodeController allowsSkip](self, "allowsSkip", a2, self);
}

- (BOOL)controllerAllowsNavigatingBack
{
  MCProfileConnection *v2;
  char v3;

  v2 = -[BuddyPasscodeController managedConfiguration](self, "managedConfiguration", a2, self);
  v3 = -[MCProfileConnection isPasscodeSet](v2, "isPasscodeSet") ^ 1;

  return v3 & 1;
}

- (void)controllerWasPopped
{
  BYPreferencesController *v2;

  v2 = -[BuddyPasscodeController buddyPreferences](self, "buddyPreferences", a2, self);
  -[BYPreferencesController removeObjectForKey:](v2, "removeObjectForKey:", CFSTR("Passcode4Presented"));

}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  BuddyFlowItemDispositionProvider *v5;
  unint64_t v6;
  BuddyMiscState *v7;
  BYFlowSkipController *v8;
  BYPaneFeatureAnalyticsManager *v9;
  BYPaneFeatureAnalyticsManager *v10;
  BYPreferencesController *v11;
  BFFFlowItemDelegate *v12;
  id v13;
  id location[2];
  BuddyPasscodeController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  if (v13)
  {
    v10 = -[BuddyPasscodeController paneFeatureAnalyticsManager](v15, "paneFeatureAnalyticsManager");
    -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v10, "recordActionWithValue:forFeature:", &__kCFBooleanTrue, 11);

  }
  else
  {
    v5 = -[BuddyPasscodeBaseViewController flowItemDispositionProvider](v15, "flowItemDispositionProvider");
    v6 = -[BuddyFlowItemDispositionProvider dispositions](v5, "dispositions") & 8;

    if (v6 == 8)
    {
      v7 = -[BuddyPasscodeController miscState](v15, "miscState");
      -[BuddyMiscState setHasPresentedPasscodeFlow:](v7, "setHasPresentedPasscodeFlow:", 1);

    }
    v8 = -[BuddyPasscodeController flowSkipController](v15, "flowSkipController");
    -[BYFlowSkipController didSkipFlow:](v8, "didSkipFlow:", BYFlowSkipIdentifierPasscode);

    v9 = -[BuddyPasscodeController paneFeatureAnalyticsManager](v15, "paneFeatureAnalyticsManager");
    -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v9, "recordActionWithValue:forFeature:", &__kCFBooleanFalse, 11);

  }
  v11 = -[BuddyPasscodeController buddyPreferences](v15, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v11, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("Passcode4Presented"));

  v12 = -[BuddyPasscodeController delegate](v15, "delegate");
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v12, "flowItemDone:nextItemClass:", v15, 0);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeViewController:(id)a3 didSetPasscode:(id)a4
{
  BuddyFlowItemDispositionProvider *v5;
  unint64_t v6;
  BYPasscodeCacheManager *v7;
  id v8;
  id location[2];
  BuddyPasscodeController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v5 = -[BuddyPasscodeBaseViewController flowItemDispositionProvider](v10, "flowItemDispositionProvider");
  v6 = -[BuddyFlowItemDispositionProvider dispositions](v5, "dispositions") & 8;

  v7 = -[BuddyPasscodeController passcodeCacheManager](v10, "passcodeCacheManager");
  if (v6 == 8)
    -[BYPasscodeCacheManager cachePasscode:retrievable:](v7, "cachePasscode:retrievable:", v8, 1);
  else
    -[BYPasscodeCacheManager cachePasscode:](v7, "cachePasscode:", v8);

  BYSetupAssistantCreateAuthContext(v8);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
  objc_storeStrong((id *)&self->_flowSkipController, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasPrivacyLink
{
  return self->_hasPrivacyLink;
}

- (void)setHasPrivacyLink:(BOOL)a3
{
  self->_hasPrivacyLink = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
}

@end
