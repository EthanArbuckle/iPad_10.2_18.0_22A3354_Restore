@implementation BuddyProximitySetupController

- (BuddyProximitySetupController)init
{
  NSBundle *v2;
  id v3;
  BuddyProximitySetupController *v4;
  objc_super v6;
  id location[2];
  id v8;

  v8 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  location[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_SETUP_TITLE"), &stru_100284738, CFSTR("Localizable"));

  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyProximitySetupController;
  v8 = -[BuddyProximitySetupController initWithTitle:detailText:icon:contentLayout:](&v6, "initWithTitle:detailText:icon:contentLayout:", location[0], 0, 0, 4);
  v4 = (BuddyProximitySetupController *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (void)loadView
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSArray *v14;
  BuddyProximitySetupController *v15;
  NSBundle *v16;
  NSString *v17;
  id v18;
  id v19;
  id v20;
  NSNotificationCenter *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location;
  id v33;
  id v34;
  objc_super v35;
  SEL v36;
  BuddyProximitySetupController *v37;
  _QWORD v38[4];

  v37 = self;
  v36 = a2;
  v35.receiver = self;
  v35.super_class = (Class)BuddyProximitySetupController;
  -[BuddyProximitySetupController loadView](&v35, "loadView");
  v34 = (id)MGCopyAnswer(CFSTR("ProductType"), 0);
  v33 = -[BuddyPosedDeviceView initWithPairForProductType:]([BuddyPosedDeviceView alloc], "initWithPairForProductType:", v34);
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v2 = -[BuddyProximitySetupController contentView](v37, "contentView");
  objc_msgSend(v2, "addSubview:", v33);

  v3 = objc_msgSend(v33, "backgroundColor");
  v4 = -[BuddyProximitySetupController contentView](v37, "contentView");
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v30 = -[BuddyProximitySetupController contentView](v37, "contentView");
  v29 = objc_msgSend(v30, "leftAnchor");
  v28 = objc_msgSend(v33, "leftAnchor");
  v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
  v38[0] = v27;
  v26 = -[BuddyProximitySetupController contentView](v37, "contentView");
  v25 = objc_msgSend(v26, "topAnchor");
  v24 = objc_msgSend(v33, "topAnchor");
  v5 = objc_msgSend(v25, "constraintEqualToAnchor:");
  v38[1] = v5;
  v6 = -[BuddyProximitySetupController contentView](v37, "contentView");
  v7 = objc_msgSend(v6, "rightAnchor");
  v8 = objc_msgSend(v33, "rightAnchor");
  v9 = objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v38[2] = v9;
  v10 = -[BuddyProximitySetupController contentView](v37, "contentView");
  v11 = objc_msgSend(v10, "bottomAnchor");
  v12 = objc_msgSend(v33, "bottomAnchor");
  v13 = objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v38[3] = v13;
  v14 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 4);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  v15 = v37;
  v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v17 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_SETUP_MANUALLY"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addLinkButton:action:](v15, "addLinkButton:action:", v17, "_setupManuallyTapped:");

  v18 = +[BuddyAccessibilityUtilities accessibilityViewController](BuddyAccessibilityUtilities, "accessibilityViewController");
  if (v18)
  {
    location = +[BuddyAccessibilityUtilities navigationBarButton](BuddyAccessibilityUtilities, "navigationBarButton");
    objc_msgSend(location, "addTarget:action:forControlEvents:", v37, "_showAccessibilitySettings", 64);
    v19 = +[BuddyAccessibilityUtilities navigationBarButtonItemWithButton:](BuddyAccessibilityUtilities, "navigationBarButtonItemWithButton:", location);
    v20 = -[BuddyProximitySetupController navigationItem](v37, "navigationItem");
    objc_msgSend(v20, "setRightBarButtonItem:", v19);

    objc_storeStrong(&location, 0);
  }
  v21 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v21, "addObserver:selector:name:object:", v37, "_cloudConfigurationDidChange:", MCCloudConfigurationDidChangeNotification, 0);

  v31 = -[BuddyProximitySetupController _secondaryGetStartedContentView](v37, "_secondaryGetStartedContentView");
  v22 = -[BuddyProximitySetupController secondaryContentView](v37, "secondaryContentView");
  objc_msgSend(v22, "addSubview:", v31);

  v23 = -[BuddyProximitySetupController secondaryContentView](v37, "secondaryContentView");
  objc_msgSend(v31, "pinToEdges:", v23);

  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  ProximitySetupController *v3;
  ProximitySetupController *v4;
  ProximitySetupController *v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  BuddyProximitySetupController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyProximitySetupController;
  -[BuddyProximitySetupController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v3 = -[BuddyProximitySetupController proximitySetupController](v9, "proximitySetupController");
  -[ProximitySetupController setUserSkippedProximity:](v3, "setUserSkippedProximity:", 0);

  if ((-[BuddyProximitySetupController isMovingToParentViewController](v9, "isMovingToParentViewController") & 1) != 0)
  {
    v4 = -[BuddyProximitySetupController proximitySetupController](v9, "proximitySetupController");
    -[ProximitySetupController setIntentToMigrate:](v4, "setIntentToMigrate:", 0);

  }
  if ((-[BuddyProximitySetupController isMovingFromParentViewController](v9, "isMovingFromParentViewController") & 1) == 0)
  {
    v5 = -[BuddyProximitySetupController proximitySetupController](v9, "proximitySetupController");
    -[ProximitySetupController beginAdvertisingProximitySetup](v5, "beginAdvertisingProximitySetup");

  }
}

- (int64_t)preferredStatusBarStyle
{
  id v2;
  id v3;

  v2 = -[BuddyProximitySetupController traitCollection](self, "traitCollection");
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == (id)2)
    return 1;
  else
    return 3;
}

- (void)_showAccessibilitySettings
{
  id location[2];
  BuddyProximitySetupController *v3;

  v3 = self;
  location[1] = (id)a2;
  location[0] = +[BuddyAccessibilityUtilities accessibilityViewController](BuddyAccessibilityUtilities, "accessibilityViewController");
  if (location[0])
    -[BuddyProximitySetupController presentViewController:animated:completion:](v3, "presentViewController:animated:completion:", location[0], 1, 0);
  objc_storeStrong(location, 0);
}

- (void)_cloudConfigurationDidChange:(id)a3
{
  void *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyProximitySetupController *v9;
  id location[2];
  BuddyProximitySetupController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000C3E30;
  v8 = &unk_100280730;
  v9 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_setupManuallyTapped:(id)a3
{
  ProximitySetupController *v3;
  ProximitySetupController *v4;
  BFFFlowItemDelegate *v5;
  id location[2];
  BuddyProximitySetupController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximitySetupController proximitySetupController](v7, "proximitySetupController");
  -[ProximitySetupController setUserSkippedProximity:](v3, "setUserSkippedProximity:", 1);

  v4 = -[BuddyProximitySetupController proximitySetupController](v7, "proximitySetupController");
  -[ProximitySetupController setIntentToMigrate:](v4, "setIntentToMigrate:", 0);

  v5 = -[BuddyWelcomeController delegate](v7, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v5, "flowItemDone:", v7);

  objc_storeStrong(location, 0);
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupTapToSetup;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyProximitySetupController *v9;
  id v10;
  id location[2];
  BuddyProximitySetupController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000C41EC;
  v8 = &unk_100281190;
  v10 = location[0];
  v9 = v12;
  dispatch_async(v3, &block);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerAllowsNavigatingBack
{
  ProximitySetupController *v2;
  char v3;

  v2 = -[BuddyProximitySetupController proximitySetupController](self, "proximitySetupController", a2, self);
  v3 = !-[ProximitySetupController hasAppliedSettings](v2, "hasAppliedSettings");

  return v3 & 1;
}

- (void)startOver
{
  ProximitySetupController *v2;
  ProximitySetupController *v3;

  v2 = -[BuddyProximitySetupController proximitySetupController](self, "proximitySetupController", a2);
  -[ProximitySetupController setUserSkippedProximity:](v2, "setUserSkippedProximity:", 0);

  v3 = -[BuddyProximitySetupController proximitySetupController](self, "proximitySetupController");
  -[ProximitySetupController setIntentToMigrate:](v3, "setIntentToMigrate:", 0);

}

- (BOOL)isEphemeral
{
  return -[BuddyProximitySetupController skippedByCloudConfiguration](self, "skippedByCloudConfiguration", a2, self);
}

- (id)_secondaryGetStartedContentView
{
  id v2;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = -[BuddyGetStartedSecondaryContentView initWithFrame:]([BuddyGetStartedSecondaryContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(location[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v2 = location[0];
  objc_storeStrong(location, 0);
  return v2;
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

- (BOOL)skippedByCloudConfiguration
{
  return self->_skippedByCloudConfiguration;
}

- (void)setSkippedByCloudConfiguration:(BOOL)a3
{
  self->_skippedByCloudConfiguration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
}

@end
