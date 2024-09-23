@implementation BuddyMandatoryUpdateController

- (BuddyMandatoryUpdateController)init
{
  NSBundle *v3;
  NSString *v4;
  BuddyMandatoryUpdateController *v5;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_TITLE"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyMandatoryUpdateController;
  location = -[BuddyMandatoryUpdateController initWithTitle:detailText:icon:](&v7, "initWithTitle:detailText:icon:", v4, 0, 0);
  objc_storeStrong(&location, location);

  v5 = (BuddyMandatoryUpdateController *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)loadView
{
  SUScanOptions *v2;
  SUDescriptor *v3;
  id v4;
  id v5;
  NSBundle *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSString *v11;
  NSString *v12;
  id v13;
  id v14;
  BuddyMandatoryUpdateController *v15;
  NSBundle *v16;
  NSString *v17;
  BuddyMandatoryUpdateController *v18;
  NSBundle *v19;
  NSString *v20;
  SUScanOptions *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;
  objc_super v27;
  SEL v28;
  BuddyMandatoryUpdateController *v29;

  v29 = self;
  v28 = a2;
  v27.receiver = self;
  v27.super_class = (Class)BuddyMandatoryUpdateController;
  -[BuddyMandatoryUpdateController loadView](&v27, "loadView");
  location = 0;
  v25 = -[BuddyMandatoryUpdateController _updateHumanReadableName](v29, "_updateHumanReadableName");
  if (-[BuddyMandatoryUpdateController _updateIsOptional](v29, "_updateIsOptional"))
  {
    objc_storeStrong(&location, CFSTR("MANDATORY_UPDATE_SUBTITLE_OPTIONAL_WITH_UPDATE"));
  }
  else
  {
    v2 = -[BuddyMandatoryUpdateController mdmUpdateOptions](v29, "mdmUpdateOptions");

    if (v2)
    {
      objc_storeStrong(&location, CFSTR("MANDATORY_UPDATE_SUBTITLE_MDM"));
    }
    else if (v25)
    {
      objc_storeStrong(&location, CFSTR("MANDATORY_UPDATE_SUBTITLE_MANDATORY_WITH_UPDATE"));
    }
    else
    {
      objc_storeStrong(&location, CFSTR("MANDATORY_UPDATE_SUBTITLE_MANDATORY"));
    }
  }
  v24 = 0;
  v3 = -[BuddyMandatoryUpdateController update](v29, "update");
  v4 = -[SUDescriptor documentation](v3, "documentation");
  v5 = objc_msgSend(v4, "mandatoryUpdateBodyString");

  if (v5)
  {
    v6 = -[BuddyMandatoryUpdateController update](v29, "update");
    v7 = -[NSBundle documentation](v6, "documentation");
    v8 = objc_msgSend(v7, "mandatoryUpdateBodyString");
    v9 = v24;
    v24 = v8;

  }
  else
  {
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
    v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", location);
    v11 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v10, &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v25);
    v13 = v24;
    v24 = v12;

  }
  v14 = -[BuddyMandatoryUpdateController headerView](v29, "headerView");
  objc_msgSend(v14, "setDetailText:", v24);

  v15 = v29;
  v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
  v17 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_INSTALL_NOW"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  -[BuddyWelcomeController addBoldButton:action:](v15, "addBoldButton:action:", v17, "_updateNowTapped:");

  if (-[BuddyMandatoryUpdateController _updateIsOptional](v29, "_updateIsOptional"))
  {
    v18 = v29;
    v19 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
    v20 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_INSTALL_LATER"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
    -[BuddyWelcomeController addLinkButton:action:](v18, "addLinkButton:action:", v20, "_updateLaterTapped:");

  }
  v21 = -[BuddyMandatoryUpdateController mdmUpdateOptions](v29, "mdmUpdateOptions");

  if (v21)
  {
    v22 = -[BuddyMandatoryUpdateController headerView](v29, "headerView");
    v23 = -[BuddyMandatoryUpdateController _makeLearnMoreButton](v29, "_makeLearnMoreButton");
    objc_msgSend(v22, "addAccessoryButton:", v23);

  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&location, 0);
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyMandatoryUpdateController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMandatoryUpdateController;
  -[BuddyMandatoryUpdateController viewDidLoad](&v3, "viewDidLoad");
  v2 = -[BuddyMandatoryUpdateController buddy_animationController:](v5, "buddy_animationController:", CFSTR("Update"));
  -[BuddyMandatoryUpdateController setAnimationController:](v5, "setAnimationController:", v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  OBAnimationController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyMandatoryUpdateController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMandatoryUpdateController;
  -[BuddyMandatoryUpdateController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyMandatoryUpdateController animationController](v7, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3;
  char v4;
  SUScanOptions *v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  BuddyMandatoryUpdateController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMandatoryUpdateController;
  -[BuddyMandatoryUpdateController viewDidAppear:](&v6, "viewDidAppear:", a3);
  if ((-[BuddyMandatoryUpdateController isMovingToParentViewController](v9, "isMovingToParentViewController") & 1) != 0)
  {
    v4 = 0;
    v3 = 0;
    if (-[BuddyMandatoryUpdateController _isDEP](v9, "_isDEP"))
    {
      v5 = -[BuddyMandatoryUpdateController mdmUpdateOptions](v9, "mdmUpdateOptions");
      v4 = 1;
      v3 = v5 == 0;
    }
    if ((v4 & 1) != 0)

    if (v3)
      -[BuddyMandatoryUpdateController _showAutoInstallAlert](v9, "_showAutoInstallAlert");
  }
}

- (void)_updateLaterTapped:(id)a3
{
  BFFFlowItemDelegate *v3;
  id location[2];
  BuddyMandatoryUpdateController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyWelcomeController delegate](v5, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", v5);

  objc_storeStrong(location, 0);
}

- (void)_updateNowTapped:(id)a3
{
  BuddyNetworkProvider *v3;
  unsigned __int8 v4;
  NSBundle *v5;
  id v6;
  NSString *v7;
  id v8;
  NSBundle *v9;
  id v10;
  NSString *v11;
  UIAlertAction *v12;
  id v13;
  NSBundle *v14;
  NSString *v15;
  UIAlertAction *v16;
  void **v17;
  int v18;
  int v19;
  void (*v20)(id *, void *);
  void *v21;
  BuddyMandatoryUpdateController *v22;
  id v23;
  id location[2];
  BuddyMandatoryUpdateController *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMandatoryUpdateController networkProvider](v25, "networkProvider");
  v4 = -[BuddyNetworkProvider networkReachable](v3, "networkReachable");

  if ((v4 & 1) != 0)
  {
    -[BuddyMandatoryUpdateController _beginInstall](v25, "_beginInstall");
  }
  else
  {
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
    v6 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("MANDATORY_UPDATE_WIFI_ALERT_TITLE"));
    v7 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
    v23 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, 0, 1);

    v8 = v23;
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
    v10 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("CHOOSE_NETWORK_WIFI"));
    v11 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", v10, &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
    v17 = _NSConcreteStackBlock;
    v18 = -1073741824;
    v19 = 0;
    v20 = sub_10014FC98;
    v21 = &unk_100280A28;
    v22 = v25;
    v12 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, &v17);
    objc_msgSend(v8, "addAction:", v12);

    v13 = v23;
    v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
    v15 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
    v16 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, 0);
    objc_msgSend(v13, "addAction:", v16);

    -[BuddyMandatoryUpdateController presentViewController:animated:completion:](v25, "presentViewController:animated:completion:", v23, 1, 0);
    objc_storeStrong((id *)&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_learnMoreTapped:(id)a3
{
  BuddyMandatoryUpdateAboutController *v3;
  SUScanOptions *v4;
  id v5;
  id v6;
  id location[2];
  BuddyMandatoryUpdateController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [BuddyMandatoryUpdateAboutController alloc];
  v4 = -[BuddyMandatoryUpdateController mdmUpdateOptions](v8, "mdmUpdateOptions");
  v6 = -[BuddyMandatoryUpdateAboutController initWithScanOptions:](v3, "initWithScanOptions:", v4);

  v5 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v6);
  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  -[BuddyMandatoryUpdateController presentViewController:animated:completion:](v8, "presentViewController:animated:completion:", v5, 1, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (id)_makeLearnMoreButton
{
  NSBundle *v2;
  NSString *v3;
  id v4;
  id location[2];
  BuddyMandatoryUpdateController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = +[OBHeaderAccessoryButton accessoryButton](OBHeaderAccessoryButton, "accessoryButton");
  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_LEARN_MORE"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  objc_msgSend(location[0], "setTitle:forState:", v3, 0);

  objc_msgSend(location[0], "addTarget:action:forControlEvents:", v7, "_learnMoreTapped:", 64);
  v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_updateHumanReadableName
{
  SUDescriptor *v2;
  SUScanOptions *v3;
  id location[2];
  BuddyMandatoryUpdateController *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  v2 = -[BuddyMandatoryUpdateController update](self, "update");
  location[0] = -[SUDescriptor humanReadableUpdateName](v2, "humanReadableUpdateName");

  if (location[0])
  {
    v7 = location[0];
  }
  else
  {
    v3 = -[BuddyMandatoryUpdateController mdmUpdateOptions](v6, "mdmUpdateOptions");
    v7 = +[BuddyMandatoryUpdateUtilities humanReadableOSVersionFromScanOptions:](BuddyMandatoryUpdateUtilities, "humanReadableOSVersionFromScanOptions:", v3);

  }
  objc_storeStrong(location, 0);
  return v7;
}

- (BOOL)_updateIsOptional
{
  SUDescriptor *v2;
  unsigned __int8 v3;
  BOOL v4;
  char v6;
  SUScanOptions *v7;
  BOOL v9;

  v2 = -[BuddyMandatoryUpdateController update](self, "update");
  v3 = -[SUDescriptor mandatoryUpdateOptional](v2, "mandatoryUpdateOptional");
  v6 = 0;
  v4 = 0;
  if ((v3 & 1) != 0)
  {
    v7 = -[BuddyMandatoryUpdateController mdmUpdateOptions](self, "mdmUpdateOptions");
    v6 = 1;
    v4 = v7 == 0;
  }
  v9 = v4;
  if ((v6 & 1) != 0)

  return v9;
}

- (void)_showAutoInstallAlert
{
  NSBundle *v2;
  NSString *v3;
  id v4;
  NSBundle *v5;
  NSString *v6;
  UIAlertAction *v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  UIAlertAction *v11;
  NSTimer *v12;
  void **v13;
  int v14;
  int v15;
  void (*v16)(id *, void *);
  void *v17;
  BuddyMandatoryUpdateController *v18;
  id v19;
  void **v20;
  int v21;
  int v22;
  void (*v23)(id *, void *);
  void *v24;
  BuddyMandatoryUpdateController *v25;
  id location;
  id v27[2];
  BuddyMandatoryUpdateController *v28;

  v28 = self;
  v27[1] = (id)a2;
  -[BuddyMandatoryUpdateController setAutoInstallTimeRemaining:](self, "setAutoInstallTimeRemaining:", 60);
  v27[0] = -[BuddyMandatoryUpdateController _autoInstallAlertMessageForTimeRemaining:](v28, "_autoInstallAlertMessageForTimeRemaining:", -[BuddyMandatoryUpdateController autoInstallTimeRemaining](v28, "autoInstallTimeRemaining"));
  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_AUTO_ALERT_TITLE"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  location = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, v27[0], 1);

  v4 = location;
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_AUTO_ALERT_BUTTON_INSTALL_NOW"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  v20 = _NSConcreteStackBlock;
  v21 = -1073741824;
  v22 = 0;
  v23 = sub_100150414;
  v24 = &unk_100280A28;
  v25 = v28;
  v7 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 0, &v20);
  objc_msgSend(v4, "addAction:", v7);

  v8 = location;
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
  v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_AUTO_ALERT_BUTTON_LATER"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  v11 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, &stru_100283790);
  objc_msgSend(v8, "addAction:", v11);

  -[BuddyMandatoryUpdateController presentViewController:animated:completion:](v28, "presentViewController:animated:completion:", location, 1, 0);
  v13 = _NSConcreteStackBlock;
  v14 = -1073741824;
  v15 = 0;
  v16 = sub_1001504A4;
  v17 = &unk_1002837B8;
  v18 = v28;
  v19 = location;
  v12 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v13, 1.0);
  -[BuddyMandatoryUpdateController setAutoInstallTimer:](v28, "setAutoInstallTimer:", v12);

  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong((id *)&v25, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v27, 0);
}

- (id)_autoInstallAlertMessageForTimeRemaining:(int64_t)a3
{
  NSBundle *v3;
  NSString *v4;
  id v5;
  id v6;
  NSString *v7;
  id location;
  int64_t v10;
  SEL v11;
  BuddyMandatoryUpdateController *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  location = objc_opt_new(NSDateComponentsFormatter);
  objc_msgSend(location, "setUnitsStyle:", 3);
  objc_msgSend(location, "setAllowedUnits:", 128);
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateController));
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_AUTO_ALERT_MESSAGE"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  v5 = -[BuddyMandatoryUpdateController _updateHumanReadableName](v12, "_updateHumanReadableName");
  v6 = objc_msgSend(location, "stringFromTimeInterval:", (double)v10);
  v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v5, v6);

  objc_storeStrong(&location, 0);
  return v7;
}

- (void)_beginInstall
{
  NSObject *v2;
  BuddyMandatoryUpdateProgressController *v3;
  char v4;
  SUScanOptions *v5;
  BYDeviceProvider *v6;
  BFFFlowItemDelegate *v7;
  id v8;
  id location;
  char v10;
  void **block;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16[2];
  BuddyMandatoryUpdateController *v17;

  v17 = self;
  v16[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1001508DC;
  v15 = &unk_100280730;
  v16[0] = v17;
  dispatch_async(v2, &block);

  v10 = -[BuddyMandatoryUpdateController _isDEP](v17, "_isDEP");
  v3 = [BuddyMandatoryUpdateProgressController alloc];
  v4 = !-[BuddyMandatoryUpdateController _updateIsOptional](v17, "_updateIsOptional");
  v5 = -[BuddyMandatoryUpdateController mdmUpdateOptions](v17, "mdmUpdateOptions");
  location = -[BuddyMandatoryUpdateProgressController initWithAllowCellularOverride:bypassTermsAndConditions:updateOptions:](v3, "initWithAllowCellularOverride:bypassTermsAndConditions:updateOptions:", v4 & 1, v10 & 1, v5);

  v6 = -[BuddyMandatoryUpdateController deviceProvider](v17, "deviceProvider");
  objc_msgSend(location, "setDeviceProvider:", v6);

  v7 = -[BuddyWelcomeController delegate](v17, "delegate");
  objc_msgSend(location, "setDelegate:", v7);

  v8 = -[BuddyMandatoryUpdateController navigationController](v17, "navigationController");
  objc_msgSend(v8, "pushViewController:animated:", location, 1);

  objc_storeStrong(&location, 0);
  objc_storeStrong(v16, 0);
}

- (BOOL)_isDEP
{
  MCProfileConnection *v2;
  unsigned __int8 v3;

  v2 = -[BuddyMandatoryUpdateController managedConfiguration](self, "managedConfiguration", a2, self);
  v3 = -[MCProfileConnection activationRecordIndicatesCloudConfigurationIsAvailable](v2, "activationRecordIndicatesCloudConfigurationIsAvailable");

  return v3 & 1;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSObject *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyMandatoryUpdateController *v9;
  id v10;
  int v11;
  id location[2];
  BuddyMandatoryUpdateController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = dispatch_get_global_queue(25, 0);
    v4 = _NSConcreteStackBlock;
    v5 = -1073741824;
    v6 = 0;
    v7 = sub_100150AD0;
    v8 = &unk_100281190;
    v10 = location[0];
    v9 = v13;
    dispatch_async(v3, &v4);

    objc_storeStrong((id *)&v9, 0);
    objc_storeStrong(&v10, 0);
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  objc_storeStrong(location, 0);
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProvider, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->_softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateCache, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (SUScanOptions)mdmUpdateOptions
{
  return self->_mdmUpdateOptions;
}

- (void)setMdmUpdateOptions:(id)a3
{
  objc_storeStrong((id *)&self->_mdmUpdateOptions, a3);
}

- (SUDescriptor)update
{
  return (SUDescriptor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (int64_t)autoInstallTimeRemaining
{
  return self->_autoInstallTimeRemaining;
}

- (void)setAutoInstallTimeRemaining:(int64_t)a3
{
  self->_autoInstallTimeRemaining = a3;
}

- (NSTimer)autoInstallTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAutoInstallTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
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
  objc_storeStrong((id *)&self->_autoInstallTimer, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_mdmUpdateOptions, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_softwareUpdateCache, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
}

@end
