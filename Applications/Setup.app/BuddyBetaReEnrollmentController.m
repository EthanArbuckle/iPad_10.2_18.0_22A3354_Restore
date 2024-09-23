@implementation BuddyBetaReEnrollmentController

- (BuddyBetaReEnrollmentController)init
{
  NSBundle *v3;
  NSString *v4;
  id v5;
  NSBundle *v6;
  NSString *v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  id v11;
  NSBundle *v12;
  NSString *v13;
  id v14;
  BuddyBetaReEnrollmentController *v15;
  id v17;
  id v18;
  id v19;
  objc_super v20;
  SEL v21;
  id location;

  v21 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("TITLE"), &stru_100284738, CFSTR("BetaReEnrollment"));
  location = 0;
  v20.receiver = self;
  v20.super_class = (Class)BuddyBetaReEnrollmentController;
  location = -[BuddyBetaReEnrollmentController initWithTitle:detailText:icon:contentLayout:](&v20, "initWithTitle:detailText:icon:contentLayout:", v4, CFSTR(" "), 0, 2);
  objc_storeStrong(&location, location);

  if (location)
  {
    v5 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
    objc_msgSend(location, "setBuddyPreferencesInternal:", v5);

    objc_msgSend(location, "setRequiresBetaReEnrollment:", 0);
    v19 = +[OBHeaderAccessoryButton accessoryButton](OBHeaderAccessoryButton, "accessoryButton");
    v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_100284738, CFSTR("BetaReEnrollment"));
    objc_msgSend(v19, "setTitle:forState:", v7, 0);

    objc_msgSend(v19, "addTarget:action:forControlEvents:", location, "_learnMoreTapped:", 64);
    v8 = objc_msgSend(location, "headerView");
    objc_msgSend(v8, "addAccessoryButton:", v19);

    v18 = +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
    v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(v18, "setTitle:forState:", v10, 0);

    objc_msgSend(v18, "addTarget:action:forControlEvents:", location, "_enrollTapped:", 64);
    v11 = objc_msgSend(location, "buttonTray");
    objc_msgSend(v11, "addButton:", v18);

    v17 = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("DONT_CONTINUE_BETA_PROGRAM"), &stru_100284738, CFSTR("BetaReEnrollment"));
    objc_msgSend(v17, "setTitle:forState:", v13, 0);

    objc_msgSend(v17, "addTarget:action:forControlEvents:", location, "_dontEnrollTapped:", 64);
    v14 = objc_msgSend(location, "buttonTray");
    objc_msgSend(v14, "addButton:", v17);

    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  v15 = (BuddyBetaReEnrollmentController *)location;
  objc_storeStrong(&location, 0);
  return v15;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyBetaReEnrollmentController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyBetaReEnrollmentController;
  -[BuddyBetaReEnrollmentController viewDidLoad](&v3, "viewDidLoad");
  v2 = -[BuddyBetaReEnrollmentController buddy_animationController:](v5, "buddy_animationController:", CFSTR("Update"));
  -[BuddyBetaReEnrollmentController setAnimationController:](v5, "setAnimationController:", v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  OBAnimationController *v3;
  NSBundle *v4;
  id v5;
  NSBundle *v6;
  NSString *v7;
  id v8;
  id v9;
  NSString *v10;
  id v11;
  NSBundle *v12;
  id v13;
  NSString *v14;
  id location;
  id v16;
  objc_super v17;
  BOOL v18;
  SEL v19;
  BuddyBetaReEnrollmentController *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BuddyBetaReEnrollmentController;
  -[BuddyBetaReEnrollmentController viewWillAppear:](&v17, "viewWillAppear:", a3);
  v3 = -[BuddyBetaReEnrollmentController animationController](v20, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

  if (-[BuddyBetaReEnrollmentController requiresBetaReEnrollment](v20, "requiresBetaReEnrollment"))
  {
    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("DETAIL_START"));
    v16 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("BetaReEnrollment"));

    v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v7 = -[BuddyBetaReEnrollmentController sourceDeviceClass](v20, "sourceDeviceClass");
    v8 = +[BuddyLocalizationUtilities siblingPairDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingPairDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("DETAIL_END"), v7);
    location = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v8, &stru_100284738, CFSTR("BetaReEnrollment"));

    v9 = -[BuddyBetaReEnrollmentController headerView](v20, "headerView");
    v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@\n\n%@"), v16, location);
    objc_msgSend(v9, "setDetailText:", v10);

    objc_storeStrong(&location, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v11 = -[BuddyBetaReEnrollmentController headerView](v20, "headerView");
    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v13 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("DETAIL_START"));
    v14 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", v13, &stru_100284738, CFSTR("BetaReEnrollment"));
    objc_msgSend(v11, "setDetailText:", v14);

  }
}

- (void)_learnMoreTapped:(id)a3
{
  id v3;
  id v4;
  id location[2];
  BuddyBetaReEnrollmentController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = objc_alloc_init(BuddyBetaReEnrollmentLearnMoreController);
  v3 = objc_msgSend(objc_alloc((Class)BFFNavigationController), "initWithRootViewController:", v4);
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  -[BuddyBetaReEnrollmentController presentViewController:animated:completion:](v6, "presentViewController:animated:completion:", v3, 1, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)_enrollTapped:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  BYBackupMetadata *v7;
  BYBackupMetadata *v8;
  BYBackupMetadata *v9;
  BYSeedProgramManager *v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(id *, char);
  void *v15;
  BuddyBetaReEnrollmentController *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  BuddyBetaReEnrollmentController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyBetaReEnrollmentController view](v24, "view");
  v4 = objc_msgSend(v3, "window");
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  v5 = -[BuddyBetaReEnrollmentController navigationController](v24, "navigationController");
  v6 = objc_msgSend(v5, "topViewController");
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v6, CFSTR("beta re-enroll spinner"));

  -[BuddyBetaReEnrollmentController _recordAnalyticsEventForEnrollment:](v24, "_recordAnalyticsEventForEnrollment:", 1);
  v7 = -[BuddyBetaReEnrollmentController backupMetadata](v24, "backupMetadata");
  v22 = -[BYBackupMetadata seedEnrollmentProgram](v7, "seedEnrollmentProgram");

  v8 = -[BuddyBetaReEnrollmentController backupMetadata](v24, "backupMetadata");
  v21 = -[BYBackupMetadata seedEnrollmentAssetAudience](v8, "seedEnrollmentAssetAudience");

  v9 = -[BuddyBetaReEnrollmentController backupMetadata](v24, "backupMetadata");
  v20 = -[BYBackupMetadata seedEnrollmentCatalogID](v9, "seedEnrollmentCatalogID");

  v10 = -[BuddyBetaReEnrollmentController seedProgramManager](v24, "seedProgramManager");
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1001C686C;
  v15 = &unk_1002845F8;
  v16 = v24;
  v17 = v22;
  v18 = v21;
  v19 = v20;
  -[BYSeedProgramManager enrollInSeedProgramNamed:withAssetAudience:programID:completion:](v10, "enrollInSeedProgramNamed:withAssetAudience:programID:completion:", v22, v21, v20, &v11);

  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)_dontEnrollTapped:(id)a3
{
  NSBundle *v3;
  NSBundle *v4;
  id v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  UIAlertAction *v9;
  id v10;
  NSBundle *v11;
  NSString *v12;
  UIAlertAction *v13;
  NSBundle *v14;
  NSBundle *v15;
  NSString *v16;
  id v17;
  id v18;
  NSBundle *v19;
  NSString *v20;
  UIAlertAction *v21;
  id v22;
  NSBundle *v23;
  NSString *v24;
  UIAlertAction *v25;
  void **v26;
  int v27;
  int v28;
  void (*v29)(id *, void *);
  void *v30;
  BuddyBetaReEnrollmentController *v31;
  void **v32;
  int v33;
  int v34;
  void (*v35)(id *, void *);
  void *v36;
  BuddyBetaReEnrollmentController *v37;
  id v38;
  id v39;
  id v40;
  void **v41;
  int v42;
  int v43;
  void (*v44)(id *, void *);
  void *v45;
  BuddyBetaReEnrollmentController *v46;
  void **v47;
  int v48;
  int v49;
  void (*v50)(id *, void *);
  void *v51;
  BuddyBetaReEnrollmentController *v52;
  id v53;
  id v54;
  id v55;
  id location[2];
  BuddyBetaReEnrollmentController *v57;

  v57 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[BuddyBetaReEnrollmentController requiresBetaReEnrollment](v57, "requiresBetaReEnrollment"))
  {
    v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v40 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", CFSTR("DONT_CONTINUE_BETA_PROGRAM_REQUIRED_ALERT_TITLE"), &stru_100284738, CFSTR("BetaReEnrollment"));

    v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v16 = -[BuddyBetaReEnrollmentController sourceDeviceClass](v57, "sourceDeviceClass");
    v17 = +[BuddyLocalizationUtilities siblingPairDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingPairDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("DONT_CONTINUE_BETA_PROGRAM_REQUIRED_ALERT_MESSAGE"), v16);
    v39 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", v17, &stru_100284738, CFSTR("BetaReEnrollment"));

    v38 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v40, v39, 1);
    v18 = v38;
    v19 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v20 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BETA_PROGRAM"), &stru_100284738, CFSTR("BetaReEnrollment"));
    v32 = _NSConcreteStackBlock;
    v33 = -1073741824;
    v34 = 0;
    v35 = sub_1001C7330;
    v36 = &unk_100280A28;
    v37 = v57;
    v21 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 0, &v32);
    objc_msgSend(v18, "addAction:", v21);

    v22 = v38;
    v23 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v24 = -[NSBundle localizedStringForKey:value:table:](v23, "localizedStringForKey:value:table:", CFSTR("DONT_CONTINUE_BETA_PROGRAM"), &stru_100284738, CFSTR("BetaReEnrollment"));
    v26 = _NSConcreteStackBlock;
    v27 = -1073741824;
    v28 = 0;
    v29 = sub_1001C7380;
    v30 = &unk_100280A28;
    v31 = v57;
    v25 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 0, &v26);
    objc_msgSend(v22, "addAction:", v25);

    -[BuddyBetaReEnrollmentController presentViewController:animated:completion:](v57, "presentViewController:animated:completion:", v38, 1, 0);
    objc_storeStrong((id *)&v31, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v40, 0);
  }
  else
  {
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v55 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("DONT_CONTINUE_BETA_PROGRAM_OPTIONAL_ALERT_TITLE"), &stru_100284738, CFSTR("BetaReEnrollment"));

    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("DONT_CONTINUE_BETA_PROGRAM_OPTIONAL_ALERT_MESSAGE"));
    v54 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("BetaReEnrollment"));

    v53 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v55, v54, 1);
    v6 = v53;
    v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BETA_PROGRAM"), &stru_100284738, CFSTR("BetaReEnrollment"));
    v47 = _NSConcreteStackBlock;
    v48 = -1073741824;
    v49 = 0;
    v50 = sub_1001C7264;
    v51 = &unk_100280A28;
    v52 = v57;
    v9 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, &v47);
    objc_msgSend(v6, "addAction:", v9);

    v10 = v53;
    v11 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v12 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("DONT_CONTINUE_BETA_PROGRAM"), &stru_100284738, CFSTR("BetaReEnrollment"));
    v41 = _NSConcreteStackBlock;
    v42 = -1073741824;
    v43 = 0;
    v44 = sub_1001C72B4;
    v45 = &unk_100280A28;
    v46 = v57;
    v13 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, &v41);
    objc_msgSend(v10, "addAction:", v13);

    -[BuddyBetaReEnrollmentController presentViewController:animated:completion:](v57, "presentViewController:animated:completion:", v53, 1, 0);
    objc_storeStrong((id *)&v46, 0);
    objc_storeStrong((id *)&v52, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v55, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_presentReEnrollFailureAlert
{
  NSBundle *v2;
  NSString *v3;
  NSBundle *v4;
  NSString *v5;
  UIAlertAction *v6;
  id location[2];
  BuddyBetaReEnrollmentController *v8;

  v8 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("RE_ENROLL_FAILED_ALERT_TITLE"), &stru_100284738, CFSTR("BetaReEnrollment"));
  location[0] = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, 0, 1);

  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
  v6 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v5, 0, &stru_100284618);
  objc_msgSend(location[0], "addAction:", v6);

  -[BuddyBetaReEnrollmentController presentViewController:animated:completion:](v8, "presentViewController:animated:completion:", location[0], 1, 0);
  objc_storeStrong(location, 0);
}

- (void)_recordAnalyticsEventForEnrollment:(BOOL)a3
{
  BYAnalyticsManager *v3;
  NSNumber *v4;
  NSNumber *v5;
  NSDictionary *v6;
  _QWORD v9[2];
  _QWORD v10[2];

  v3 = -[BuddyBetaReEnrollmentController analyticsManager](self, "analyticsManager");
  v9[0] = CFSTR("didEnroll");
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3);
  v10[0] = v4;
  v9[1] = CFSTR("enrollmentRequired");
  v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BuddyBetaReEnrollmentController requiresBetaReEnrollment](self, "requiresBetaReEnrollment"));
  v10[1] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  -[BYAnalyticsManager addEvent:withPayload:persist:](v3, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.betaEnrollment"), v6, 1);

}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyBetaReEnrollmentController *v9;
  id v10;
  id location[2];
  BuddyBetaReEnrollmentController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001C78D4;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
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

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_existingSettings, a3);
}

- (BYSeedProgramManager)seedProgramManager
{
  return self->_seedProgramManager;
}

- (void)setSeedProgramManager:(id)a3
{
  objc_storeStrong((id *)&self->_seedProgramManager, a3);
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->_softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateCache, a3);
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManager, a3);
}

- (BYPreferencesController)buddyPreferencesInternal
{
  return self->_buddyPreferencesInternal;
}

- (void)setBuddyPreferencesInternal:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesInternal, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (NSString)sourceSystemVersion
{
  return self->_sourceSystemVersion;
}

- (void)setSourceSystemVersion:(id)a3
{
  objc_storeStrong((id *)&self->_sourceSystemVersion, a3);
}

- (NSString)sourceDeviceClass
{
  return self->_sourceDeviceClass;
}

- (void)setSourceDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDeviceClass, a3);
}

- (BOOL)requiresBetaReEnrollment
{
  return self->_requiresBetaReEnrollment;
}

- (void)setRequiresBetaReEnrollment:(BOOL)a3
{
  self->_requiresBetaReEnrollment = a3;
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (BOOL)fakeBetaReEnrollment
{
  return self->_fakeBetaReEnrollment;
}

- (void)setFakeBetaReEnrollment:(BOOL)a3
{
  self->_fakeBetaReEnrollment = a3;
}

- (BYBackupMetadata)backupMetadata
{
  return self->_backupMetadata;
}

- (void)setBackupMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_backupMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupMetadata, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_sourceDeviceClass, 0);
  objc_storeStrong((id *)&self->_sourceSystemVersion, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesInternal, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_softwareUpdateCache, 0);
  objc_storeStrong((id *)&self->_seedProgramManager, 0);
  objc_storeStrong((id *)&self->_existingSettings, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
}

@end
