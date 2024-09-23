@implementation BuddyProximityAutomatedDeviceEnrollmentInProgressController

- (BuddyProximityAutomatedDeviceEnrollmentInProgressController)init
{
  id v2;
  void *v3;
  BuddyProximityAutomatedDeviceEnrollmentInProgressController *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentInProgressController;
  location = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController initWithTitle:detailText:symbolName:](&v6, "initWithTitle:detailText:symbolName:", &stru_100284738, 0, 0);
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_msgSend(location, "buddy_animationController:", CFSTR("Update"));
    v3 = (void *)*((_QWORD *)location + 4);
    *((_QWORD *)location + 4) = v2;

  }
  v4 = (BuddyProximityAutomatedDeviceEnrollmentInProgressController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (void)viewDidLoad
{
  BuddyProximityAutomatedDeviceEnrollmentInProgressController *v2;
  BuddyProximityAutomatedDeviceEnrollmentController *v3;
  DMTEnrollmentStatusViewModel *v4;
  id v5;
  UILabel *v6;
  UILabel *spinnerStatusLabel;
  UIFont *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSArray *v19;
  id v20;
  id v21;
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
  id v32;
  id v33;
  id v34;
  id v35;
  id location;
  objc_super v37;
  SEL v38;
  BuddyProximityAutomatedDeviceEnrollmentInProgressController *v39;
  _QWORD v40[7];

  v39 = self;
  v38 = a2;
  v37.receiver = self;
  v37.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentInProgressController;
  -[BuddyProximityAutomatedDeviceEnrollmentInProgressController viewDidLoad](&v37, "viewDidLoad");
  v2 = v39;
  v3 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController proximityAutomatedDeviceEnrollmentController](v39, "proximityAutomatedDeviceEnrollmentController");
  v4 = -[BuddyProximityAutomatedDeviceEnrollmentController currentEnrollmentStatusViewModel](v3, "currentEnrollmentStatusViewModel");
  -[BuddyProximityAutomatedDeviceEnrollmentInProgressController configureFromViewModel:](v2, "configureFromViewModel:", v4);

  location = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(location, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(location, "startAnimating");
  v5 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController contentView](v39, "contentView");
  objc_msgSend(v5, "addSubview:", location);

  v6 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  spinnerStatusLabel = v39->_spinnerStatusLabel;
  v39->_spinnerStatusLabel = v6;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v39->_spinnerStatusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](v39->_spinnerStatusLabel, "setNumberOfLines:", 0);
  v8 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
  -[UILabel setFont:](v39->_spinnerStatusLabel, "setFont:", v8);

  -[UILabel setTextAlignment:](v39->_spinnerStatusLabel, "setTextAlignment:", 1);
  v9 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController contentView](v39, "contentView");
  objc_msgSend(v9, "addSubview:", v39->_spinnerStatusLabel);

  v34 = objc_msgSend(location, "centerXAnchor");
  v35 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController contentView](v39, "contentView");
  v33 = objc_msgSend(v35, "centerXAnchor");
  v32 = objc_msgSend(v34, "constraintEqualToAnchor:");
  v40[0] = v32;
  v30 = objc_msgSend(location, "topAnchor");
  v31 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController contentView](v39, "contentView");
  v29 = objc_msgSend(v31, "topAnchor");
  v28 = objc_msgSend(v30, "constraintEqualToAnchor:");
  v40[1] = v28;
  v27 = objc_msgSend(location, "widthAnchor");
  v26 = objc_msgSend(v27, "constraintEqualToConstant:", 50.0);
  v40[2] = v26;
  v25 = objc_msgSend(location, "heightAnchor");
  v24 = objc_msgSend(v25, "constraintEqualToConstant:", 50.0);
  v40[3] = v24;
  v21 = -[UILabel leadingAnchor](v39->_spinnerStatusLabel, "leadingAnchor");
  v23 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController contentView](v39, "contentView");
  v22 = objc_msgSend(v23, "layoutMarginsGuide");
  v20 = objc_msgSend(v22, "leadingAnchor");
  v10 = objc_msgSend(v21, "constraintEqualToAnchor:");
  v40[4] = v10;
  v11 = -[UILabel trailingAnchor](v39->_spinnerStatusLabel, "trailingAnchor");
  v12 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController contentView](v39, "contentView");
  v13 = objc_msgSend(v12, "layoutMarginsGuide");
  v14 = objc_msgSend(v13, "trailingAnchor");
  v15 = objc_msgSend(v11, "constraintEqualToAnchor:", v14);
  v40[5] = v15;
  v16 = -[UILabel topAnchor](v39->_spinnerStatusLabel, "topAnchor");
  v17 = objc_msgSend(location, "bottomAnchor");
  v18 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 20.0);
  v40[6] = v18;
  v19 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 7);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  OBAnimationController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyProximityAutomatedDeviceEnrollmentInProgressController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentInProgressController;
  -[BuddyProximityAutomatedDeviceEnrollmentInProgressController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController animationController](v7, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

}

- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3
{
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentInProgressController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_proximityAutomatedDeviceEnrollmentController, location[0]);
  -[BuddyProximityAutomatedDeviceEnrollmentController setDelegate:](v4->_proximityAutomatedDeviceEnrollmentController, "setDelegate:", v4);
  objc_storeStrong(location, 0);
}

- (void)proximityAutomatedDeviceEnrollmentControllerWantsToTransitionToCompletion:(id)a3
{
  BFFFlowItemDelegate *v3;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentInProgressController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyWelcomeController delegate](v5, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", v5);

  objc_storeStrong(location, 0);
}

- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 hasEnrollmentStatusViewModelUpdate:(id)a4
{
  id v5;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentInProgressController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BuddyProximityAutomatedDeviceEnrollmentInProgressController configureFromViewModel:](v7, "configureFromViewModel:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 30;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BOOL)controllerNeedsToRun
{
  BuddyProximityAutomatedDeviceEnrollmentController *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyProximityAutomatedDeviceEnrollmentController *v6;
  DMTEnrollmentCompletionViewModel *v7;
  _WORD v9[7];
  char v10;
  os_log_t oslog[2];
  BuddyProximityAutomatedDeviceEnrollmentInProgressController *v12;
  BOOL v13;

  v12 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController proximityAutomatedDeviceEnrollmentController](self, "proximityAutomatedDeviceEnrollmentController");

  if (v2)
  {
    v6 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController proximityAutomatedDeviceEnrollmentController](v12, "proximityAutomatedDeviceEnrollmentController");
    v7 = -[BuddyProximityAutomatedDeviceEnrollmentController completionViewModel](v6, "completionViewModel");
    v13 = v7 == 0;

  }
  else
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v3);
    v10 = 17;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_FAULT))
    {
      v4 = oslog[0];
      v5 = v10;
      sub_100038C3C(v9);
      _os_log_fault_impl((void *)&_mh_execute_header, v4, v5, "proximityAutomatedDeviceEnrollmentController not yet in place when asked -controllerNeedsToRun", (uint8_t *)v9, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    return 1;
  }
  return v13;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (void)configureFromViewModel:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  UILabel *v8;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentInProgressController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController headerView](v10, "headerView");
  v4 = objc_msgSend(location[0], "title");
  objc_msgSend(v3, "setTitle:", v4);

  v5 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController headerView](v10, "headerView");
  v6 = objc_msgSend(location[0], "detailText");
  objc_msgSend(v5, "setDetailText:", v6);

  v7 = objc_msgSend(location[0], "statusMessage");
  v8 = -[BuddyProximityAutomatedDeviceEnrollmentInProgressController spinnerStatusLabel](v10, "spinnerStatusLabel");
  -[UILabel setText:](v8, "setText:", v7);

  objc_storeStrong(location, 0);
}

- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController
{
  return self->_proximityAutomatedDeviceEnrollmentController;
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProvider, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (UILabel)spinnerStatusLabel
{
  return self->_spinnerStatusLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerStatusLabel, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
  objc_storeStrong((id *)&self->_proximityAutomatedDeviceEnrollmentController, 0);
}

@end
