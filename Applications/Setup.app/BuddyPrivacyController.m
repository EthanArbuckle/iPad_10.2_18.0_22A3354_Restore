@implementation BuddyPrivacyController

+ (void)initialize
{
  id v2;
  id v3;

  v2 = +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities", a2, a1);
  objc_msgSend(v2, "setPreventURLDataDetection:", 1);

  v3 = +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities");
  objc_msgSend(v3, "setPreventOpeningSafari:", 1);

}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupPrivacy;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  BYPreferencesController *v2;
  char v3;

  v2 = -[BuddyPrivacyController buddyPreferences](self, "buddyPreferences", a2, self);
  v3 = -[BYPreferencesController BOOLForKey:](v2, "BOOLForKey:", CFSTR("PrivacyPresented")) ^ 1;

  return v3 & 1;
}

- (id)viewController
{
  BuddyPrivacySplashController *v2;
  BuddyPrivacySplashController *v3;
  OBPrivacySplashController *viewController;
  OBPrivacySplashController *v5;
  id v6;
  double v7;
  NSBundle *v8;
  NSString *v9;
  id v10;
  id v12;
  void **v13;
  int v14;
  int v15;
  void (*v16)(id *);
  void *v17;
  id v18;
  id location[2];
  BuddyPrivacyController *v20;

  v20 = self;
  location[1] = (id)a2;
  if (!self->_viewController)
  {
    v2 = [BuddyPrivacySplashController alloc];
    v3 = -[BuddyPrivacySplashController initWithPrivacyIdentifier:](v2, "initWithPrivacyIdentifier:", BYPrivacyPrivacyPaneIdentifier);
    viewController = v20->_viewController;
    v20->_viewController = (OBPrivacySplashController *)v3;

    objc_initWeak(location, v20);
    v5 = v20->_viewController;
    v13 = _NSConcreteStackBlock;
    v14 = -1073741824;
    v15 = 0;
    v16 = sub_100077ED8;
    v17 = &unk_1002806B8;
    objc_copyWeak(&v18, location);
    -[OBPrivacySplashController setDismissHandlerForDefaultButton:](v5, "setDismissHandlerForDefaultButton:", &v13);
    v6 = -[OBPrivacySplashController headerView](v20->_viewController, "headerView");
    LODWORD(v7) = 1045220557;
    objc_msgSend(v6, "setTitleHyphenationFactor:", v7);

    v12 = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(v12, "setTitle:forState:", v9, 0);

    objc_msgSend(v12, "addTarget:action:forControlEvents:", v20, "learnMorePressed:", 64);
    v10 = -[OBPrivacySplashController buttonTray](v20->_viewController, "buttonTray");
    objc_msgSend(v10, "addButton:", v12);

    objc_storeStrong(&v12, 0);
    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  return v20->_viewController;
}

- (void)_writeOutCurrentPrivacyVersion
{
  OBBundle *v2;
  id v3;
  id v4;
  BYPreferencesController *v5;
  BYPreferencesController *v6;
  NSNumber *v7;

  v2 = +[OBBundle bundleWithIdentifier:](OBBundle, "bundleWithIdentifier:", BYPrivacyPrivacyPaneIdentifier);
  v3 = -[OBBundle privacyFlow](v2, "privacyFlow");
  v4 = objc_msgSend(v3, "contentVersion");

  v5 = -[BuddyPrivacyController buddyPreferences](self, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("PrivacyPresented"));

  v6 = -[BuddyPrivacyController buddyPreferences](self, "buddyPreferences");
  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4);
  -[BYPreferencesController setObject:forKey:](v6, "setObject:forKey:", v7, CFSTR("PrivacyContentVersion"));

}

- (void)controllerDone
{
  BFFFlowItemDelegate *v2;

  -[BuddyPrivacyController _writeOutCurrentPrivacyVersion](self, "_writeOutCurrentPrivacyVersion", a2);
  v2 = -[BuddyPrivacyController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v2, "flowItemDone:", self);

}

- (void)viewDidAppear
{
  BYPreferencesController *v2;

  -[BuddyPrivacyController viewDidAppear](self, "viewDidAppear", a2);
  v2 = -[BuddyPrivacyController buddyPreferences](self, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("PrivacyPresented"));

}

- (void)learnMorePressed:(id)a3
{
  id v3;
  id v4;
  id v5;
  id location[2];
  BuddyPrivacyController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAbout](OBPrivacyPresenter, "presenterForPrivacyUnifiedAbout");
  v3 = -[BuddyPrivacyController viewController](v7, "viewController");
  objc_msgSend(v5, "setPresentingViewController:", v3);

  v4 = objc_msgSend(v5, "combinedController");
  objc_msgSend(v4, "setPresentedFromPrivacyPane:", 1);

  objc_msgSend(v5, "present");
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
