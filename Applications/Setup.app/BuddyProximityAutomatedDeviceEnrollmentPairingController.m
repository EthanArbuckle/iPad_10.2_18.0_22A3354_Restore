@implementation BuddyProximityAutomatedDeviceEnrollmentPairingController

- (BuddyProximityAutomatedDeviceEnrollmentPairingController)initWithPairingCode:(id)a3
{
  id v3;
  BuddyProximityBackingViewController *v4;
  void *v5;
  NSLocale *v6;
  NSString *v7;
  BuddyProximityAutomatedDeviceEnrollmentPairingController *v8;
  BuddyProximityAutomatedDeviceEnrollmentStringProvider *v10;
  objc_super v11;
  id location[2];
  id v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v13;
  v13 = 0;
  v11.receiver = v3;
  v11.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentPairingController;
  v13 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController init](&v11, "init");
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    v10 = objc_alloc_init(BuddyProximityAutomatedDeviceEnrollmentStringProvider);
    v4 = -[BuddyProximityBackingViewController initWithStringProvider:]([BuddyProximityBackingViewController alloc], "initWithStringProvider:", v10);
    v5 = (void *)*((_QWORD *)v13 + 5);
    *((_QWORD *)v13 + 5) = v4;

    objc_msgSend(*((id *)v13 + 5), "setPairingCode:", location[0]);
    v6 = +[NSLocale currentLocale](NSLocale, "currentLocale");
    v7 = -[NSLocale localeIdentifier](v6, "localeIdentifier");
    objc_msgSend(*((id *)v13 + 5), "setLanguage:", v7);

    objc_storeStrong((id *)&v10, 0);
  }
  v8 = (BuddyProximityAutomatedDeviceEnrollmentPairingController *)v13;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v13, 0);
  return v8;
}

- (void)viewDidLoad
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
  id v14;
  NSArray *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  objc_super v29;
  SEL v30;
  BuddyProximityAutomatedDeviceEnrollmentPairingController *v31;
  _QWORD v32[4];

  v31 = self;
  v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentPairingController;
  -[BuddyProximityAutomatedDeviceEnrollmentPairingController viewDidLoad](&v29, "viewDidLoad");
  location = -[BuddyProximityAutomatedDeviceEnrollmentPairingController backingViewController](v31, "backingViewController");
  v2 = objc_msgSend(location, "view");
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BuddyProximityAutomatedDeviceEnrollmentPairingController addChildViewController:](v31, "addChildViewController:", location);
  v3 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController view](v31, "view");
  v4 = objc_msgSend(location, "view");
  objc_msgSend(v3, "addSubview:", v4);

  objc_msgSend(location, "didMoveToParentViewController:", v31);
  v5 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController view](v31, "view");
  objc_msgSend(v5, "layoutIfNeeded");

  v27 = objc_msgSend(location, "view");
  v25 = objc_msgSend(v27, "leadingAnchor");
  v26 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController view](v31, "view");
  v24 = objc_msgSend(v26, "leadingAnchor");
  v23 = objc_msgSend(v25, "constraintEqualToAnchor:");
  v32[0] = v23;
  v22 = objc_msgSend(location, "view");
  v20 = objc_msgSend(v22, "trailingAnchor");
  v21 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController view](v31, "view");
  v19 = objc_msgSend(v21, "trailingAnchor");
  v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
  v32[1] = v18;
  v17 = objc_msgSend(location, "view");
  v16 = objc_msgSend(v17, "topAnchor");
  v6 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController view](v31, "view");
  v7 = objc_msgSend(v6, "safeAreaLayoutGuide");
  v8 = objc_msgSend(v7, "topAnchor");
  v9 = objc_msgSend(v16, "constraintEqualToAnchor:", v8);
  v32[2] = v9;
  v10 = objc_msgSend(location, "view");
  v11 = objc_msgSend(v10, "bottomAnchor");
  v12 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController view](v31, "view");
  v13 = objc_msgSend(v12, "bottomAnchor");
  v14 = objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v32[3] = v14;
  v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  objc_storeStrong(&location, 0);
}

- (void)viewDidLayoutSubviews
{
  BuddyProximityBackingViewController *v2;
  id v3;
  objc_super v4;
  SEL v5;
  BuddyProximityAutomatedDeviceEnrollmentPairingController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentPairingController;
  -[BuddyProximityAutomatedDeviceEnrollmentPairingController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v2 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController backingViewController](v6, "backingViewController");
  v3 = -[BuddyProximityBackingViewController view](v2, "view");
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  objc_super v6;
  id v7;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentPairingController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6.receiver = v9;
  v6.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentPairingController;
  -[BuddyProximityAutomatedDeviceEnrollmentPairingController willTransitionToTraitCollection:withTransitionCoordinator:](&v6, "willTransitionToTraitCollection:withTransitionCoordinator:", location[0], v7);
  v5 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController view](v9, "view");
  objc_msgSend(v5, "setNeedsLayout");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  BuddyProximityBackingViewController *v4;
  objc_super v5;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentPairingController *v7;
  CGSize v8;

  v8 = a3;
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v5.receiver = v7;
  v5.super_class = (Class)BuddyProximityAutomatedDeviceEnrollmentPairingController;
  -[BuddyProximityAutomatedDeviceEnrollmentPairingController viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v8.width, v8.height);
  v4 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController backingViewController](v7, "backingViewController");
  -[BuddyProximityBackingViewController viewWillTransitionToSize:withTransitionCoordinator:](v4, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v8.width, v8.height);

  objc_storeStrong(location, 0);
}

- (BOOL)isLandscape
{
  id v2;
  id v3;
  id v4;
  id v5;
  BOOL v6;

  v2 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController navigationController](self, "navigationController", a2, self);
  v3 = objc_msgSend(v2, "view");
  v4 = objc_msgSend(v3, "window");
  v5 = objc_msgSend(v4, "windowScene");
  v6 = sub_1000FEE30((uint64_t)objc_msgSend(v5, "interfaceOrientation"));

  return v6;
}

- (NSString)pairingCode
{
  BuddyProximityBackingViewController *v2;
  NSString *v3;

  v2 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController backingViewController](self, "backingViewController", a2, self);
  v3 = -[BuddyProximityBackingViewController pairingCode](v2, "pairingCode");

  return v3;
}

- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3
{
  BuddyProximityAutomatedDeviceEnrollmentControllerDelegate *v3;
  BuddyProximityAutomatedDeviceEnrollmentController *proximityAutomatedDeviceEnrollmentController;
  BuddyProximityBackingViewController *v5;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentPairingController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_proximityAutomatedDeviceEnrollmentController, location[0]);
  v3 = -[BuddyProximityAutomatedDeviceEnrollmentController delegate](v7->_proximityAutomatedDeviceEnrollmentController, "delegate");
  -[BuddyProximityAutomatedDeviceEnrollmentPairingController setPriorDelegate:](v7, "setPriorDelegate:", v3);

  -[BuddyProximityAutomatedDeviceEnrollmentController setDelegate:](v7->_proximityAutomatedDeviceEnrollmentController, "setDelegate:", v7);
  proximityAutomatedDeviceEnrollmentController = v7->_proximityAutomatedDeviceEnrollmentController;
  v5 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController backingViewController](v7, "backingViewController");
  -[BuddyProximityBackingViewController setDelegate:](v5, "setDelegate:", proximityAutomatedDeviceEnrollmentController);

  objc_storeStrong(location, 0);
}

- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 wantsToDismissPairingWithError:(id)a4
{
  uint64_t v5;
  id v6;
  BuddyProximityAutomatedDeviceEnrollmentControllerDelegate *v7;
  BFFFlowItemDelegate *v8;
  id v9;
  os_log_type_t v10;
  os_log_t oslog;
  id v12;
  id location;
  SEL aSelector;
  BuddyProximityAutomatedDeviceEnrollmentPairingController *v15;
  uint8_t buf[24];

  v15 = self;
  aSelector = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  if (v12)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v10 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(aSelector);
      v6 = objc_msgSend(v12, "debugDescription");
      sub_10003A6BC((uint64_t)buf, (uint64_t)v9, (uint64_t)v6);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v10, "%{public}@ %{public}@", buf, 0x16u);

      objc_storeStrong(&v9, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v7 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController priorDelegate](v15, "priorDelegate");
    objc_msgSend(location, "setDelegate:", v7);

  }
  v8 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController delegate](v15, "delegate");
  -[BFFFlowItemDelegate presentWiFiPaneForFlowItem:](v8, "presentWiFiPaneForFlowItem:", v15);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 wantsToTransitionToEnrollmentWithInitialViewModel:(id)a4
{
  BFFFlowItemDelegate *v5;
  id v6;
  id location[2];
  BuddyProximityAutomatedDeviceEnrollmentPairingController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController delegate](v8, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v5, "flowItemDone:", v8);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 30;
}

- (BOOL)controllerNeedsToRun
{
  return 0;
}

- (BOOL)isEphemeral
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController
{
  return self->_proximityAutomatedDeviceEnrollmentController;
}

- (BuddyProximityAutomatedDeviceEnrollmentController)enrollmentController
{
  return self->_enrollmentController;
}

- (BuddyProximityAutomatedDeviceEnrollmentControllerDelegate)priorDelegate
{
  return (BuddyProximityAutomatedDeviceEnrollmentControllerDelegate *)objc_loadWeakRetained((id *)&self->_priorDelegate);
}

- (void)setPriorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_priorDelegate, a3);
}

- (BuddyProximityBackingViewController)backingViewController
{
  return self->_backingViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingViewController, 0);
  objc_destroyWeak((id *)&self->_priorDelegate);
  objc_storeStrong((id *)&self->_enrollmentController, 0);
  objc_storeStrong((id *)&self->_proximityAutomatedDeviceEnrollmentController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
