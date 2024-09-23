@implementation BuddyProximityPairingController

- (BuddyProximityPairingController)init
{
  BuddyProximityBackingViewController *v2;
  void *v3;
  BuddyProximityPairingController *v4;
  id v6;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyProximityPairingController;
  location = -[BuddyProximityPairingController init](&v7, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v6 = objc_alloc_init(BuddyProximityPairingControllerStringProvider);
    v2 = -[BuddyProximityBackingViewController initWithStringProvider:]([BuddyProximityBackingViewController alloc], "initWithStringProvider:", v6);
    v3 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v2;

    objc_storeStrong(&v6, 0);
  }
  v4 = (BuddyProximityPairingController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (void)viewDidLoad
{
  BuddyProximityBackingViewController *v2;
  id v3;
  BuddyProximityPairingController *v4;
  BuddyProximityBackingViewController *v5;
  id v6;
  BuddyProximityBackingViewController *v7;
  id v8;
  BuddyProximityBackingViewController *v9;
  id v10;
  id v11;
  id v12;
  BuddyProximityBackingViewController *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSArray *v20;
  id v21;
  id v22;
  id v23;
  BuddyProximityBackingViewController *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BuddyProximityBackingViewController *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  BuddyProximityBackingViewController *v36;
  objc_super v37;
  SEL v38;
  BuddyProximityPairingController *v39;
  _QWORD v40[4];

  v39 = self;
  v38 = a2;
  v37.receiver = self;
  v37.super_class = (Class)BuddyProximityPairingController;
  -[BuddyProximityPairingController viewDidLoad](&v37, "viewDidLoad");
  v2 = -[BuddyProximityPairingController proxBackingController](v39, "proxBackingController");
  v3 = -[BuddyProximityBackingViewController view](v2, "view");
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = v39;
  v5 = -[BuddyProximityPairingController proxBackingController](v39, "proxBackingController");
  -[BuddyProximityPairingController addChildViewController:](v4, "addChildViewController:", v5);

  v6 = -[BuddyProximityPairingController view](v39, "view");
  v7 = -[BuddyProximityPairingController proxBackingController](v39, "proxBackingController");
  v8 = -[BuddyProximityBackingViewController view](v7, "view");
  objc_msgSend(v6, "addSubview:", v8);

  v9 = -[BuddyProximityPairingController proxBackingController](v39, "proxBackingController");
  -[BuddyProximityBackingViewController didMoveToParentViewController:](v9, "didMoveToParentViewController:", v39);

  v10 = -[BuddyProximityPairingController view](v39, "view");
  objc_msgSend(v10, "layoutIfNeeded");

  v36 = -[BuddyProximityPairingController proxBackingController](v39, "proxBackingController");
  v35 = -[BuddyProximityBackingViewController view](v36, "view");
  v33 = objc_msgSend(v35, "leadingAnchor");
  v34 = -[BuddyProximityPairingController view](v39, "view");
  v32 = objc_msgSend(v34, "leadingAnchor");
  v31 = objc_msgSend(v33, "constraintEqualToAnchor:");
  v40[0] = v31;
  v30 = -[BuddyProximityPairingController proxBackingController](v39, "proxBackingController");
  v29 = -[BuddyProximityBackingViewController view](v30, "view");
  v27 = objc_msgSend(v29, "trailingAnchor");
  v28 = -[BuddyProximityPairingController view](v39, "view");
  v26 = objc_msgSend(v28, "trailingAnchor");
  v25 = objc_msgSend(v27, "constraintEqualToAnchor:");
  v40[1] = v25;
  v24 = -[BuddyProximityPairingController proxBackingController](v39, "proxBackingController");
  v23 = -[BuddyProximityBackingViewController view](v24, "view");
  v21 = objc_msgSend(v23, "bottomAnchor");
  v22 = -[BuddyProximityPairingController view](v39, "view");
  v11 = objc_msgSend(v22, "bottomAnchor");
  v12 = objc_msgSend(v21, "constraintEqualToAnchor:", v11);
  v40[2] = v12;
  v13 = -[BuddyProximityPairingController proxBackingController](v39, "proxBackingController");
  v14 = -[BuddyProximityBackingViewController view](v13, "view");
  v15 = objc_msgSend(v14, "topAnchor");
  v16 = -[BuddyProximityPairingController view](v39, "view");
  v17 = objc_msgSend(v16, "safeAreaLayoutGuide");
  v18 = objc_msgSend(v17, "topAnchor");
  v19 = objc_msgSend(v15, "constraintEqualToAnchor:", v18);
  v40[3] = v19;
  v20 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 4);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

}

- (void)viewDidLayoutSubviews
{
  BuddyProximityBackingViewController *v2;
  id v3;
  objc_super v4;
  SEL v5;
  BuddyProximityPairingController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityPairingController;
  -[BuddyProximityPairingController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v2 = -[BuddyProximityPairingController proxBackingController](v6, "proxBackingController");
  v3 = -[BuddyProximityBackingViewController view](v2, "view");
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)showVisualPairing
{
  BuddyProximityBackingViewController *v2;

  v2 = -[BuddyProximityPairingController proxBackingController](self, "proxBackingController", a2, self);
  -[BuddyProximityBackingViewController showVisualPairing](v2, "showVisualPairing");

}

- (void)showPairingCode
{
  BuddyProximityBackingViewController *v2;

  v2 = -[BuddyProximityPairingController proxBackingController](self, "proxBackingController", a2, self);
  -[BuddyProximityBackingViewController showPairingCode](v2, "showPairingCode");

}

- (void)prepareForLanguageChange:(id)a3
{
  BuddyProximityBackingViewController *v3;
  id location[2];
  BuddyProximityPairingController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityPairingController proxBackingController](v5, "proxBackingController");
  -[BuddyProximityBackingViewController prepareForLanguageChange:](v3, "prepareForLanguageChange:", location[0]);

  objc_storeStrong(location, 0);
}

- (NSString)language
{
  BuddyProximityBackingViewController *v2;
  NSString *v3;

  v2 = -[BuddyProximityPairingController proxBackingController](self, "proxBackingController", a2, self);
  v3 = -[BuddyProximityBackingViewController language](v2, "language");

  return v3;
}

- (void)setLanguage:(id)a3
{
  BuddyProximityBackingViewController *v3;
  id location[2];
  BuddyProximityPairingController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityPairingController proxBackingController](v5, "proxBackingController");
  -[BuddyProximityBackingViewController setLanguage:](v3, "setLanguage:", location[0]);

  objc_storeStrong(location, 0);
}

- (NSString)pairingCode
{
  BuddyProximityBackingViewController *v2;
  NSString *v3;

  v2 = -[BuddyProximityPairingController proxBackingController](self, "proxBackingController", a2, self);
  v3 = -[BuddyProximityBackingViewController pairingCode](v2, "pairingCode");

  return v3;
}

- (void)setPairingCode:(id)a3
{
  BuddyProximityBackingViewController *v3;
  id location[2];
  BuddyProximityPairingController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityPairingController proxBackingController](v5, "proxBackingController");
  -[BuddyProximityBackingViewController setPairingCode:](v3, "setPairingCode:", location[0]);

  objc_storeStrong(location, 0);
}

- (BOOL)isShowingVisualPairing
{
  BuddyProximityBackingViewController *v2;
  unsigned __int8 v3;

  v2 = -[BuddyProximityPairingController proxBackingController](self, "proxBackingController", a2, self);
  v3 = -[BuddyProximityBackingViewController isShowingVisualPairing](v2, "isShowingVisualPairing");

  return v3 & 1;
}

- (BOOL)nonUserInitiatedDismissal
{
  BuddyProximityBackingViewController *v2;
  unsigned __int8 v3;

  v2 = -[BuddyProximityPairingController proxBackingController](self, "proxBackingController", a2, self);
  v3 = -[BuddyProximityBackingViewController nonUserInitiatedDismissal](v2, "nonUserInitiatedDismissal");

  return v3 & 1;
}

- (void)setNonUserInitiatedDismissal:(BOOL)a3
{
  BuddyProximityBackingViewController *v3;

  v3 = -[BuddyProximityPairingController proxBackingController](self, "proxBackingController");
  -[BuddyProximityBackingViewController setNonUserInitiatedDismissal:](v3, "setNonUserInitiatedDismissal:", a3);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  objc_super v6;
  id v7;
  id location[2];
  BuddyProximityPairingController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6.receiver = v9;
  v6.super_class = (Class)BuddyProximityPairingController;
  -[BuddyProximityPairingController willTransitionToTraitCollection:withTransitionCoordinator:](&v6, "willTransitionToTraitCollection:withTransitionCoordinator:", location[0], v7);
  v5 = -[BuddyProximityPairingController view](v9, "view");
  objc_msgSend(v5, "setNeedsLayout");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  BuddyProximityBackingViewController *v4;
  objc_super v5;
  id location[2];
  BuddyProximityPairingController *v7;
  CGSize v8;

  v8 = a3;
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v5.receiver = v7;
  v5.super_class = (Class)BuddyProximityPairingController;
  -[BuddyProximityPairingController viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v8.width, v8.height);
  v4 = -[BuddyProximityPairingController proxBackingController](v7, "proxBackingController");
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

  v2 = -[BuddyProximityPairingController navigationController](self, "navigationController", a2, self);
  v3 = objc_msgSend(v2, "view");
  v4 = objc_msgSend(v3, "window");
  v5 = objc_msgSend(v4, "windowScene");
  v6 = sub_1001881E4((uint64_t)objc_msgSend(v5, "interfaceOrientation"));

  return v6;
}

- (void)setProximitySetupController:(id)a3
{
  id location[2];
  BuddyProximityPairingController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_proximitySetupController, location[0]);
  -[BuddyProximityBackingViewController setDelegate:](v4->_proxBackingController, "setDelegate:", location[0]);
  objc_storeStrong(location, 0);
}

+ (BOOL)controllerNeedsToRun
{
  return 0;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)isEphemeral
{
  return 1;
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

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (BuddyProximityBackingViewController)proxBackingController
{
  return self->_proxBackingController;
}

- (void)setProxBackingController:(id)a3
{
  objc_storeStrong((id *)&self->_proxBackingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxBackingController, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
