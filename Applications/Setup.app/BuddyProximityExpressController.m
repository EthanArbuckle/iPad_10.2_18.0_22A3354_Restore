@implementation BuddyProximityExpressController

- (void)viewDidLoad
{
  UIFont *v2;
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
  id v15;
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
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id location;
  id v37;
  id v38;
  id v39;
  objc_super v40;
  SEL v41;
  BuddyProximityExpressController *v42;
  _QWORD v43[6];

  v42 = self;
  v41 = a2;
  v40.receiver = self;
  v40.super_class = (Class)BuddyProximityExpressController;
  -[BuddyProximityExpressController viewDidLoad](&v40, "viewDidLoad");
  v39 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v39, "setText:", CFSTR("FPO"));
  objc_msgSend(v39, "setTextAlignment:", 1);
  v2 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle1);
  objc_msgSend(v39, "setFont:", v2);

  v38 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v38, "setText:", CFSTR("Bring other iPhone nearby"));
  objc_msgSend(v38, "setTextAlignment:", 1);
  v3 = -[BuddyProximityExpressController view](v42, "view");
  objc_msgSend(v3, "addSubview:", v39);

  v4 = -[BuddyProximityExpressController view](v42, "view");
  objc_msgSend(v4, "addSubview:", v38);

  v33 = objc_msgSend(v39, "centerYAnchor");
  v34 = -[BuddyProximityExpressController view](v42, "view");
  v32 = objc_msgSend(v34, "centerYAnchor");
  v31 = objc_msgSend(v33, "constraintEqualToAnchor:");
  v43[0] = v31;
  v29 = objc_msgSend(v39, "leadingAnchor");
  v30 = -[BuddyProximityExpressController view](v42, "view");
  v28 = objc_msgSend(v30, "leadingAnchor");
  v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
  v43[1] = v27;
  v25 = objc_msgSend(v39, "trailingAnchor");
  v26 = -[BuddyProximityExpressController view](v42, "view");
  v24 = objc_msgSend(v26, "trailingAnchor");
  v23 = objc_msgSend(v25, "constraintEqualToAnchor:");
  v43[2] = v23;
  v21 = objc_msgSend(v38, "leadingAnchor");
  v22 = -[BuddyProximityExpressController view](v42, "view");
  v20 = objc_msgSend(v22, "leadingAnchor");
  v5 = objc_msgSend(v21, "constraintEqualToAnchor:");
  v43[3] = v5;
  v6 = objc_msgSend(v38, "trailingAnchor");
  v7 = -[BuddyProximityExpressController view](v42, "view");
  v8 = objc_msgSend(v7, "trailingAnchor");
  v9 = objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v43[4] = v9;
  v10 = -[BuddyProximityExpressController view](v42, "view");
  v11 = objc_msgSend(v10, "bottomAnchor");
  v12 = objc_msgSend(v38, "bottomAnchor");
  v13 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 100.0);
  v43[5] = v13;
  v14 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 6);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  v15 = +[BuddyAccessibilityUtilities accessibilityViewController](BuddyAccessibilityUtilities, "accessibilityViewController");
  if (v15)
  {
    v37 = +[BuddyAccessibilityUtilities navigationBarButton](BuddyAccessibilityUtilities, "navigationBarButton");
    location = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v37);
    objc_msgSend(location, "setStyle:", 0);
    objc_msgSend(v37, "addTarget:action:forControlEvents:", v42, "_showAccessibilitySettings", 64);
    v16 = -[BuddyProximityExpressController navigationItem](v42, "navigationItem");
    objc_msgSend(v16, "setLeftBarButtonItem:", location);

    objc_storeStrong(&location, 0);
    objc_storeStrong(&v37, 0);
  }
  v35 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.right.circle"));
  v17 = objc_alloc((Class)UIBarButtonItem);
  v18 = objc_msgSend(v17, "initWithImage:style:target:action:", v35, 0, v42, "_nextTapped");
  v19 = -[BuddyProximityExpressController navigationItem](v42, "navigationItem");
  objc_msgSend(v19, "setRightBarButtonItem:", v18);

  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
}

- (void)_showAccessibilitySettings
{
  id location[2];
  BuddyProximityExpressController *v3;

  v3 = self;
  location[1] = (id)a2;
  location[0] = +[BuddyAccessibilityUtilities accessibilityViewController](BuddyAccessibilityUtilities, "accessibilityViewController");
  if (location[0])
    -[BuddyProximityExpressController presentViewController:animated:completion:](v3, "presentViewController:animated:completion:", location[0], 1, 0);
  objc_storeStrong(location, 0);
}

- (void)_nextTapped
{
  BFFFlowItemDelegate *v2;

  v2 = -[BuddyProximityExpressController delegate](self, "delegate", a2);
  -[BFFFlowItemDelegate flowItemDone:](v2, "flowItemDone:", self);

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
  BuddyProximityExpressController *v9;
  id v10;
  id location[2];
  BuddyProximityExpressController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001064C0;
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

  v2 = -[BuddyProximityExpressController proximitySetupController](self, "proximitySetupController", a2, self);
  v3 = !-[ProximitySetupController hasAppliedSettings](v2, "hasAppliedSettings");

  return v3 & 1;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
