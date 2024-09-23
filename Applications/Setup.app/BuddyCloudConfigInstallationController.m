@implementation BuddyCloudConfigInstallationController

- (BOOL)controllerNeedsToRun
{
  MCProfileConnection *v2;
  unsigned __int8 v3;
  MCProfileConnection *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  char v8;
  MCProfileConnection *v9;
  char v10;
  MCProfileConnection *v11;
  BOOL v12;

  v2 = -[BuddyCloudConfigInstallationController managedConfiguration](self, "managedConfiguration");
  v3 = -[MCProfileConnection shouldInstallStoredProfileForPurpose:](v2, "shouldInstallStoredProfileForPurpose:", 1);

  if ((v3 & 1) == 0)
  {
    v4 = -[BuddyCloudConfigInstallationController managedConfiguration](self, "managedConfiguration");
    -[MCProfileConnection markStoredProfileForPurposeAsInstalled:](v4, "markStoredProfileForPurposeAsInstalled:", 1);

  }
  v10 = 0;
  v8 = 0;
  v5 = 1;
  if ((v3 & 1) == 0)
  {
    v11 = -[BuddyCloudConfigInstallationController managedConfiguration](self, "managedConfiguration");
    v10 = 1;
    v6 = -[MCProfileConnection wasCloudConfigurationApplied](v11, "wasCloudConfigurationApplied");
    v5 = 0;
    if ((v6 & 1) != 0)
    {
      v9 = -[BuddyCloudConfigInstallationController managedConfiguration](self, "managedConfiguration");
      v8 = 1;
      v5 = -[MCProfileConnection isAwaitingDeviceConfigured](v9, "isAwaitingDeviceConfigured");
    }
  }
  v12 = v5 & 1;
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  return v12;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BuddyCloudConfigInstallationController)init
{
  NSBundle *v3;
  id v4;
  NSString *v5;
  id v6;
  NSNotificationCenter *v7;
  BuddyCloudConfigInstallationController *v8;
  objc_super v10;
  SEL v11;
  id location;

  location = self;
  v11 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("CLOUD_CONFIG_CONFIGURING"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));
  v6 = objc_msgSend(location, "_clearImage");
  location = 0;
  v10.receiver = self;
  v10.super_class = (Class)BuddyCloudConfigInstallationController;
  location = -[BuddyCloudConfigInstallationController initWithTitle:detailText:icon:](&v10, "initWithTitle:detailText:icon:", v5, 0, v6);
  objc_storeStrong(&location, location);

  if (location)
  {
    v7 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v7, "addObserver:selector:name:object:", location, "cloudConfigDidChange:", MCCloudConfigurationDidChangeNotification, 0);

    objc_msgSend(location, "setState:", 0);
  }
  v8 = (BuddyCloudConfigInstallationController *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  BuddyCloudConfigInstallationController *v5;

  v5 = self;
  v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)BuddyCloudConfigInstallationController;
  -[BuddyCloudConfigInstallationController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  UILabel *v2;
  UILabel *activityLabel;
  id v4;
  UILabel *v5;
  UIFont *v6;
  id v7;
  UIActivityIndicatorView *v8;
  UIActivityIndicatorView *spinnerView;
  id v10;
  objc_super v11;
  SEL v12;
  BuddyCloudConfigInstallationController *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyCloudConfigInstallationController;
  -[BuddyCloudConfigInstallationController loadView](&v11, "loadView");
  v2 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  activityLabel = v13->_activityLabel;
  v13->_activityLabel = v2;

  v4 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  objc_msgSend(v4, "applyThemeToLabel:", v13->_activityLabel);

  -[UILabel setTextAlignment:](v13->_activityLabel, "setTextAlignment:", 1);
  v5 = v13->_activityLabel;
  v6 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
  -[UILabel setFont:](v5, "setFont:", v6);

  -[UILabel setLineBreakMode:](v13->_activityLabel, "setLineBreakMode:", 0);
  -[UILabel setNumberOfLines:](v13->_activityLabel, "setNumberOfLines:", 0);
  v7 = -[BuddyCloudConfigInstallationController contentView](v13, "contentView");
  objc_msgSend(v7, "addSubview:", v13->_activityLabel);

  v8 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  spinnerView = v13->_spinnerView;
  v13->_spinnerView = v8;

  v10 = -[BuddyCloudConfigInstallationController view](v13, "view");
  objc_msgSend(v10, "addSubview:", v13->_spinnerView);

}

- (void)viewWillAppear:(BOOL)a3
{
  MCProfileConnection *v3;
  id v4;
  NSBundle *v5;
  NSString *v6;
  NSString *v7;
  id location;
  id v9;
  objc_super v10;
  BOOL v11;
  SEL v12;
  BuddyCloudConfigInstallationController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BuddyCloudConfigInstallationController;
  -[BuddyCloudConfigInstallationController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v3 = -[BuddyCloudConfigInstallationController managedConfiguration](v13, "managedConfiguration");
  v9 = -[MCProfileConnection cloudConfigurationDetails](v3, "cloudConfigurationDetails");

  location = objc_msgSend(v9, "objectForKeyedSubscript:", kMCCCOrganizationNameKey);
  v4 = -[BuddyCloudConfigInstallationController headerView](v13, "headerView");
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("CLOUD_CONFIG_INSTALLING_DESCRIPTION_%@"), &stru_100284738, CFSTR("Localizable"));
  v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, location);
  objc_msgSend(v4, "setDetailText:", v7);

  if (!-[BuddyCloudConfigInstallationController state](v13, "state"))
  {
    -[BuddyCloudConfigInstallationController setState:](v13, "setState:", 1);
    -[BuddyCloudConfigInstallationController _setupForState](v13, "_setupForState");
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v9, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyCloudConfigInstallationController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  self->_controllerDoneCalled = 0;
  v3.receiver = v6;
  v3.super_class = (Class)BuddyCloudConfigInstallationController;
  -[BuddyCloudConfigInstallationController viewDidAppear:](&v3, "viewDidAppear:", v4);
  if (-[BuddyCloudConfigInstallationController state](v6, "state") == 1)
  {
    -[BuddyCloudConfigInstallationController setState:](v6, "setState:", 2);
    -[BuddyCloudConfigInstallationController _setupForState](v6, "_setupForState");
  }
}

- (void)controllerDone
{
  BFFFlowItemDelegate *v2;
  NSArray *v3;
  BFFFlowItemDelegate *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  os_log_t v9;
  id location;
  os_log_type_t v11;
  os_log_t v12;
  os_log_type_t v13;
  os_log_t oslog[2];
  BuddyCloudConfigInstallationController *v15;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];
  BuddyCloudConfigInstallationController *v19;

  v15 = self;
  oslog[1] = (os_log_t)a2;
  if (self->_controllerDoneCalled)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
    v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)v15);
      _os_log_impl((void *)&_mh_execute_header, oslog[0], v13, "CloudConfig controller %@ is sending buddyControllerDone multiple times", buf, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
    v12 = (os_log_t)(id)_BYLoggingFacility(v5);
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      location = +[NSThread callStackSymbols](NSThread, "callStackSymbols");
      sub_100038C28((uint64_t)v17, (uint64_t)location);
      _os_log_impl((void *)&_mh_execute_header, v12, v11, "Call stack: %@", v17, 0xCu);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)&v12, 0);
    v9 = (os_log_t)(id)_BYLoggingFacility(v6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[BuddyCloudConfigInstallationController navigationController](v15, "navigationController");
      v8 = objc_msgSend(v7, "viewControllers");
      sub_100038C28((uint64_t)v16, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "VC stack: %@", v16, 0xCu);

    }
    objc_storeStrong((id *)&v9, 0);
  }
  else
  {
    v15->_controllerDoneCalled = 1;
    -[BuddyCloudConfigInstallationController setState:](v15, "setState:", 6);
    v2 = -[BuddyWelcomeController delegate](v15, "delegate");
    v19 = v15;
    v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1);
    -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v2, "removeViewControllersOnNextPush:", v3);

    v4 = -[BuddyWelcomeController delegate](v15, "delegate");
    -[BFFFlowItemDelegate flowItemDone:](v4, "flowItemDone:", v15);

  }
}

- (void)viewDidLayoutSubviews
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  UILabel *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UILabel *v14;
  id v15;
  void *v16;
  objc_class *v17;
  UIActivityIndicatorView *v18;
  objc_super v19[2];
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  SEL v32;
  BuddyCloudConfigInstallationController *v33;

  v33 = self;
  v32 = a2;
  v2 = -[BuddyCloudConfigInstallationController contentView](self, "contentView");
  objc_msgSend(v2, "bounds");
  v30 = v3;
  v29 = v4;
  *((_QWORD *)&v31 + 1) = v5;
  *(_QWORD *)&v31 = v6;

  v7 = -[BuddyCloudConfigInstallationController activityLabel](v33, "activityLabel");
  -[UILabel sizeThatFits:](v7, "sizeThatFits:", v31);
  v27 = v8;
  v28 = v9;

  sub_1001AAD0C();
  *((_QWORD *)&v25 + 1) = v10;
  *(_QWORD *)&v25 = v11;
  *((_QWORD *)&v26 + 1) = v12;
  *(_QWORD *)&v26 = v13;
  v24 = v26;
  v23 = v25;
  v14 = -[BuddyCloudConfigInstallationController activityLabel](v33, "activityLabel");
  v22 = v26;
  v21 = v25;
  -[UILabel setFrame:](v14, "setFrame:", v25, v26);

  v15 = -[BuddyCloudConfigInstallationController view](v33, "view");
  objc_msgSend(v15, "center");
  v20.receiver = v16;
  v20.super_class = v17;
  v18 = -[BuddyCloudConfigInstallationController spinnerView](v33, "spinnerView");
  v19[1] = v20;
  -[UIActivityIndicatorView setCenter:](v18, "setCenter:", v20);

  v19[0].receiver = v33;
  v19[0].super_class = (Class)BuddyCloudConfigInstallationController;
  -[objc_super viewDidLayoutSubviews](v19, "viewDidLayoutSubviews");
}

- (BOOL)_isEscrowMissingError:(id)a3
{
  id v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  id v7;
  char v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  while (location[0])
  {
    v3 = objc_msgSend(location[0], "domain");
    v4 = objc_msgSend(v3, "isEqualToString:", MCInstallationErrorDomain);

    if ((v4 & 1) == 0)
      break;
    if (objc_msgSend(location[0], "code") == (id)4042)
    {
      v9 = 1;
      break;
    }
    v5 = objc_msgSend(location[0], "userInfo");
    v6 = objc_msgSend(v5, "objectForKeyedSubscript:", NSUnderlyingErrorKey);
    v7 = location[0];
    location[0] = v6;

  }
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (void)_createUnlockEscrowAndRetryProfileInstallationWithCompletion:(id)a3
{
  BYPasscodeCacheManager *v3;
  id v4;
  id devicePasscodeCompletion;
  void *v6;
  void **block;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  BuddyCloudConfigInstallationController *v12;
  int v13;
  id v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(id *, void *);
  void *v19;
  BuddyCloudConfigInstallationController *v20;
  id v21;
  id v22;
  id location[2];
  BuddyCloudConfigInstallationController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = _NSConcreteStackBlock;
  v16 = -1073741824;
  v17 = 0;
  v18 = sub_1001B51AC;
  v19 = &unk_100284390;
  v20 = v24;
  v21 = location[0];
  v22 = objc_retainBlock(&v15);
  v3 = -[BuddyCloudConfigInstallationController passcodeCacheManager](v24, "passcodeCacheManager");
  v14 = -[BYPasscodeCacheManager cachedPasscode](v3, "cachedPasscode");

  if (v14 && location[0])
  {
    (*((void (**)(id, id))v22 + 2))(v22, v14);
    v13 = 1;
  }
  else
  {
    v4 = objc_msgSend(v22, "copy");
    devicePasscodeCompletion = v24->_devicePasscodeCompletion;
    v24->_devicePasscodeCompletion = v4;

    v6 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_1001B547C;
    v11 = &unk_100280730;
    v12 = v24;
    dispatch_async((dispatch_queue_t)v6, &block);

    objc_storeStrong((id *)&v12, 0);
    v13 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)_tryToInstallStoredProfileShouldCreateEscrowIfNeeded:(BOOL)a3 completion:(id)a4
{
  id v4;
  id v5;
  NSDictionary *v6;
  id v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  BuddyCloudConfigInstallationController *v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  id location;
  BOOL v21;
  SEL v22;
  BuddyCloudConfigInstallationController *v23;
  uint64_t v24;
  id v25;

  v23 = self;
  v22 = a2;
  v21 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v19 = -[BuddyCloudConfigInstallationController managedConfiguration](v23, "managedConfiguration");
  v18 = 0;
  v4 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
  v5 = objc_msgSend(v4, "cloudConfigurationDetails");
  v17 = objc_msgSend(v5, "objectForKeyedSubscript:", kCCRemoteManagementAccountIdentifierKey);

  if (objc_msgSend(v17, "length"))
  {
    v24 = kMCInstallProfileOptionRMAccountIdentifier;
    v25 = v17;
    v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v7 = v18;
    v18 = v6;

  }
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_1001B58EC;
  v12 = &unk_1002843E0;
  v16 = v21;
  v13 = v23;
  v15 = location;
  v14 = v19;
  objc_msgSend(v19, "installProfileDataStoredForPurpose:extraOptions:completionBlock:", 1, v18, &v8);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
}

- (void)_setupForState
{
  id v2;
  id v3;
  UIActivityIndicatorView *v4;
  UILabel *v5;
  id v6;
  UIActivityIndicatorView *v7;
  id v8;
  id v9;
  UIActivityIndicatorView *v10;
  MCProfileConnection *v11;
  id v12;
  NSBundle *v13;
  NSString *v14;
  NSString *v15;
  id v16;
  UIActivityIndicatorView *v17;
  uint64_t v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  UILabel *v22;
  UILabel *v23;
  id v24;
  BuddyEnrollmentCoordinator *v25;
  id v26;
  os_log_t oslog;
  id v28;
  id v29;
  void **v30;
  int v31;
  int v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  BuddyCloudConfigInstallationController *v36;
  id v37;
  id v38;
  os_log_type_t v39;
  id location[2];
  BuddyCloudConfigInstallationController *v41;
  uint8_t v42[16];
  uint8_t buf[8];

  v41 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_100046FA0(buf, -[BuddyCloudConfigInstallationController state](v41, "state"));
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)location[0], v39, "Setting up for state %d", buf, 8u);
  }
  objc_storeStrong(location, 0);
  switch(-[BuddyCloudConfigInstallationController state](v41, "state"))
  {
    case 1:
      -[BuddyCloudConfigInstallationController setDeviceConfiguredCompletionBlock:](v41, "setDeviceConfiguredCompletionBlock:", 0);
      -[BuddyCloudConfigInstallationController setLastErrorDescription:](v41, "setLastErrorDescription:", 0);
      v2 = -[BuddyCloudConfigInstallationController navigationItem](v41, "navigationItem");
      v3 = objc_msgSend(v2, "leftBarButtonItem");
      objc_msgSend(v3, "setEnabled:", 0);

      v4 = -[BuddyCloudConfigInstallationController spinnerView](v41, "spinnerView");
      -[UIActivityIndicatorView startAnimating](v4, "startAnimating");

      v5 = -[BuddyCloudConfigInstallationController activityLabel](v41, "activityLabel");
      -[UILabel setHidden:](v5, "setHidden:", 1);

      break;
    case 2:
      -[BuddyCloudConfigInstallationController setState:](v41, "setState:", 3);
      -[BuddyCloudConfigInstallationController _setupForState](v41, "_setupForState");
      v38 = -[BuddyCloudConfigInstallationController managedConfiguration](v41, "managedConfiguration");
      v30 = _NSConcreteStackBlock;
      v31 = -1073741824;
      v32 = 0;
      v33 = sub_1001B6254;
      v34 = &unk_100280D00;
      v35 = v38;
      v36 = v41;
      v37 = objc_retainBlock(&v30);
      v6 = objc_msgSend(v38, "installedMDMProfileIdentifier");

      if (v6)
        (*((void (**)(void))v37 + 2))();
      else
        -[BuddyCloudConfigInstallationController _tryToInstallStoredProfileShouldCreateEscrowIfNeeded:completion:](v41, "_tryToInstallStoredProfileShouldCreateEscrowIfNeeded:completion:", 1, v37);
      objc_storeStrong(&v37, 0);
      objc_storeStrong((id *)&v36, 0);
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v38, 0);
      break;
    case 3:
      v7 = -[BuddyCloudConfigInstallationController spinnerView](v41, "spinnerView");
      -[UIActivityIndicatorView startAnimating](v7, "startAnimating");

      v8 = -[BuddyCloudConfigInstallationController navigationItem](v41, "navigationItem");
      objc_msgSend(v8, "setHidesBackButton:", 1);

      v9 = -[BuddyCloudConfigInstallationController view](v41, "view");
      objc_msgSend(v9, "setNeedsLayout");

      break;
    case 4:
      v10 = -[BuddyCloudConfigInstallationController spinnerView](v41, "spinnerView");
      -[UIActivityIndicatorView startAnimating](v10, "startAnimating");

      v11 = -[BuddyCloudConfigInstallationController managedConfiguration](v41, "managedConfiguration");
      v29 = -[MCProfileConnection cloudConfigurationDetails](v11, "cloudConfigurationDetails");

      v28 = objc_msgSend(v29, "objectForKeyedSubscript:", kMCCCOrganizationNameKey);
      v12 = -[BuddyCloudConfigInstallationController headerView](v41, "headerView");
      v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("CLOUD_CONFIG_GETTING_CONFIGURATION_DESCRIPTION_%@"), &stru_100284738, CFSTR("Localizable"));
      v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v28);
      objc_msgSend(v12, "setDetailText:", v15);

      v16 = -[BuddyCloudConfigInstallationController navigationItem](v41, "navigationItem");
      objc_msgSend(v16, "setHidesBackButton:", 1);

      objc_storeStrong(&v28, 0);
      objc_storeStrong(&v29, 0);
      break;
    case 5:
      v17 = -[BuddyCloudConfigInstallationController spinnerView](v41, "spinnerView");
      -[UIActivityIndicatorView stopAnimating](v17, "stopAnimating");

      oslog = (os_log_t)(id)_BYLoggingFacility(v18);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v19 = -[BuddyCloudConfigInstallationController lastErrorDescription](v41, "lastErrorDescription");
        sub_100038C28((uint64_t)v42, (uint64_t)v19);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Last error description: %@", v42, 0xCu);

      }
      objc_storeStrong((id *)&oslog, 0);
      v20 = -[BuddyCloudConfigInstallationController lastErrorDescription](v41, "lastErrorDescription");

      if (v20)
      {
        v21 = -[BuddyCloudConfigInstallationController lastErrorDescription](v41, "lastErrorDescription");
        v22 = -[BuddyCloudConfigInstallationController activityLabel](v41, "activityLabel");
        -[UILabel setText:](v22, "setText:", v21);

        v23 = -[BuddyCloudConfigInstallationController activityLabel](v41, "activityLabel");
        -[UILabel setHidden:](v23, "setHidden:", 0);

        v24 = -[BuddyCloudConfigInstallationController navigationItem](v41, "navigationItem");
        objc_msgSend(v24, "setHidesBackButton:", 0);

        v25 = (BuddyEnrollmentCoordinator *)-[BuddyCloudConfigInstallationController navigationItem](v41, "navigationItem");
        v26 = -[BuddyEnrollmentCoordinator rightBarButtonItem](v25, "rightBarButtonItem");
        objc_msgSend(v26, "setEnabled:", 0);

      }
      else
      {
        -[BuddyCloudConfigInstallationController controllerDone](v41, "controllerDone");
        v25 = -[BuddyCloudConfigInstallationController enrollmentCoordinator](v41, "enrollmentCoordinator");
        -[BuddyEnrollmentCoordinator profileInstallationDone](v25, "profileInstallationDone");
      }

      break;
    default:
      return;
  }
}

- (void)cloudConfigDidChange:(id)a3
{
  void *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7);
  void *v8;
  BuddyCloudConfigInstallationController *v9;
  id location[2];
  BuddyCloudConfigInstallationController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001B6694;
  v8 = &unk_100280730;
  v9 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)nextButtonPressed:(id)a3
{
  id location[2];
  BuddyCloudConfigInstallationController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyCloudConfigInstallationController controllerDone](v4, "controllerDone");
  objc_storeStrong(location, 0);
}

- (void)_cancelDevicePasscodePicker:(id)a3
{
  id devicePasscodeCompletion;
  id location[2];
  BuddyCloudConfigInstallationController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyCloudConfigInstallationController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);
  (*((void (**)(void))v5->_devicePasscodeCompletion + 2))();
  devicePasscodeCompletion = v5->_devicePasscodeCompletion;
  v5->_devicePasscodeCompletion = 0;

  objc_storeStrong(location, 0);
}

- (id)_clearImage
{
  UIColor *v2;
  id v3;
  id location;
  CGRect rect;
  CGSize size;
  SEL v8;
  BuddyCloudConfigInstallationController *v9;
  CGSize v10;
  CGRect v11;

  v9 = self;
  v8 = a2;
  sub_1001AACD8();
  size = v10;
  UIGraphicsBeginImageContextWithOptions(v10, 1, 0.0);
  v2 = +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  -[UIColor setFill](v2, "setFill");

  sub_1001AAD0C();
  rect = v11;
  UIRectFill(v11);
  location = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v3 = location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)passcodeEntryController:(id)a3 didEnterPasscode:(id)a4
{
  id devicePasscodeCompletion;
  id v6;
  id location[2];
  BuddyCloudConfigInstallationController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  if (objc_msgSend(v6, "length"))
  {
    -[BuddyCloudConfigInstallationController dismissViewControllerAnimated:completion:](v8, "dismissViewControllerAnimated:completion:", 1, 0);
    if (v8->_devicePasscodeCompletion)
    {
      (*((void (**)(void))v8->_devicePasscodeCompletion + 2))();
      devicePasscodeCompletion = v8->_devicePasscodeCompletion;
      v8->_devicePasscodeCompletion = 0;

    }
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  id devicePasscodeCompletion;
  _WORD v7[7];
  os_log_type_t v8;
  os_log_t oslog;
  id location[2];
  BuddyCloudConfigInstallationController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v8;
    sub_100038C3C(v7);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Passcode entry was dismissed with a swipe", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v11->_devicePasscodeCompletion)
  {
    (*((void (**)(void))v11->_devicePasscodeCompletion + 2))();
    devicePasscodeCompletion = v11->_devicePasscodeCompletion;
    v11->_devicePasscodeCompletion = 0;

  }
  objc_storeStrong(location, 0);
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->enrollmentCoordinator, a3);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (UILabel)activityLabel
{
  return self->_activityLabel;
}

- (void)setActivityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_activityLabel, a3);
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerView, a3);
}

- (NSString)lastErrorDescription
{
  return self->_lastErrorDescription;
}

- (void)setLastErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_lastErrorDescription, a3);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (id)deviceConfiguredCompletionBlock
{
  return self->_deviceConfiguredCompletionBlock;
}

- (void)setDeviceConfiguredCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)cloudConfigurationChangedDuringInstallation
{
  return self->_cloudConfigurationChangedDuringInstallation;
}

- (void)setCloudConfigurationChangedDuringInstallation:(BOOL)a3
{
  self->_cloudConfigurationChangedDuringInstallation = a3;
}

- (id)devicePasscodeCompletion
{
  return self->_devicePasscodeCompletion;
}

- (void)setDevicePasscodeCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_devicePasscodeCompletion, 0);
  objc_storeStrong(&self->_deviceConfiguredCompletionBlock, 0);
  objc_storeStrong((id *)&self->_lastErrorDescription, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_activityLabel, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->enrollmentCoordinator, 0);
}

@end
