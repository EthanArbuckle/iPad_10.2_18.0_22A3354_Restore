@implementation BuddyPasscodeBaseViewController

- (BuddyPasscodeBaseViewController)init
{
  BuddyPasscodeBaseViewController *v2;
  id location;

  location = -[BuddyPasscodeBaseViewController initWithTitle:detailText:icon:](self, "initWithTitle:detailText:icon:", &stru_100284738, CFSTR(" "), 0, a2, 0);
  objc_storeStrong(&location, location);
  if (location)
    *((_BYTE *)location + 8) = 1;
  v2 = (BuddyPasscodeBaseViewController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (BuddyPasscodeBaseViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v7;
  BuddyPasscodeBaseViewController *v8;
  objc_super v10;
  id v11;
  id v12;
  id location[2];
  id v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v7 = v14;
  v14 = 0;
  v10.receiver = v7;
  v10.super_class = (Class)BuddyPasscodeBaseViewController;
  v14 = -[BuddyPasscodeBaseViewController initWithTitle:detailText:icon:](&v10, "initWithTitle:detailText:icon:", &stru_100284738, CFSTR(" "), 0);
  objc_storeStrong(&v14, v14);
  if (v14)
    *((_BYTE *)v14 + 8) = 1;
  v8 = (BuddyPasscodeBaseViewController *)v14;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v8;
}

+ (BOOL)allowSkip
{
  id v2;
  BOOL v4;

  if ((PSHasStockholmPass() & 1) != 0)
    return 0;
  v2 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
  v4 = (objc_msgSend(v2, "isPasscodeRequired") ^ 1) & 1;

  return v4;
}

- (void)dealloc
{
  BFFPasscodeCreationManager *v2;
  objc_super v3;
  SEL v4;
  BuddyPasscodeBaseViewController *v5;

  v5 = self;
  v4 = a2;
  v2 = -[BuddyPasscodeBaseViewController passcodeManager](self, "passcodeManager");
  -[BFFPasscodeCreationManager setDelegate:](v2, "setDelegate:", 0);

  v3.receiver = v5;
  v3.super_class = (Class)BuddyPasscodeBaseViewController;
  -[BuddyPasscodeBaseViewController dealloc](&v3, "dealloc");
}

- (void)_setupFirstEntry
{
  id v3;
  BFFPasscodeCreationManager *v4;
  BFFPasscodeCreationManager *v5;
  id v6;
  char v7;
  char v8;
  char v9;
  BFFPasscodeCreationManager *v10;
  BFFPasscodeCreationManager *v11;
  unsigned int v12;
  BFFPasscodeCreationManager *v13;
  BFFPasscodeCreationManager *v14;
  BFFPasscodeCreationManager *v15;
  BFFPasscodeCreationManager *v16;
  id v17;
  id v18;
  id v19;
  id location;
  id v21;
  uint64_t v22;
  char v23;
  _BYTE v24[5];
  int v25;
  SEL v26;
  BuddyPasscodeBaseViewController *v27;

  v27 = self;
  v26 = a2;
  v3 = +[BFFPasscodeCreationManager sharedPasscodeManager](BFFPasscodeCreationManager, "sharedPasscodeManager");
  -[BuddyPasscodeBaseViewController setPasscodeManager:](self, "setPasscodeManager:", v3);

  v4 = -[BuddyPasscodeBaseViewController passcodeManager](v27, "passcodeManager");
  -[BFFPasscodeCreationManager reset](v4, "reset");

  v5 = -[BuddyPasscodeBaseViewController passcodeManager](v27, "passcodeManager");
  -[BFFPasscodeCreationManager setDelegate:](v5, "setDelegate:", v27);

  v25 = 0;
  v6 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
  LODWORD(v3) = objc_msgSend(v6, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v25);

  *(_DWORD *)&v24[1] = (_DWORD)v3;
  if ((_DWORD)v3)
  {
    v14 = -[BuddyPasscodeBaseViewController passcodeManager](v27, "passcodeManager");
    -[BFFPasscodeCreationManager setNumericPasscodeEntry:](v14, "setNumericPasscodeEntry:", 0);

    v15 = -[BuddyPasscodeBaseViewController passcodeManager](v27, "passcodeManager");
    -[BFFPasscodeCreationManager setSimplePasscodeEntryLength:](v15, "setSimplePasscodeEntryLength:", 0);

  }
  else
  {
    v7 = PSSupportsMesa();
    *(_DWORD *)v24 = v7 & 1;
    v8 = 1;
    if ((v7 & 1) == 0)
    {
      v23 = MGGetBoolAnswer(CFSTR("8olRm6C1xqr7AJGpLRnpSw")) & 1;
      v8 = v23;
    }
    v24[0] = v8 & 1;
    v22 = 0;
    v9 = 1;
    if (v25 != 1)
      v9 = v24[0];
    v22 = v9 & 1;
    v10 = -[BuddyPasscodeBaseViewController passcodeManager](v27, "passcodeManager");
    v11 = v10;
    if (v22)
      v12 = 6;
    else
      v12 = 4;
    -[BFFPasscodeCreationManager setSimplePasscodeEntryLength:](v10, "setSimplePasscodeEntryLength:", v12);

    v13 = -[BuddyPasscodeBaseViewController passcodeManager](v27, "passcodeManager");
    -[BFFPasscodeCreationManager setNumericPasscodeEntry:](v13, "setNumericPasscodeEntry:", 1);

  }
  -[BuddyPasscodeBaseViewController configurePasscodeTypeUsingAnimations:](v27, "configurePasscodeTypeUsingAnimations:", 0);
  v16 = -[BuddyPasscodeBaseViewController passcodeManager](v27, "passcodeManager");
  v17 = -[BFFPasscodeCreationManager passcodeState](v16, "passcodeState");

  v21 = v17;
  v18 = -[BuddyPasscodeBaseViewController headerView](v27, "headerView");
  v19 = -[BuddyPasscodeBaseViewController titleForState:](v27, "titleForState:", v17);
  objc_msgSend(v18, "setTitle:", v19);

  location = -[BuddyPasscodeBaseViewController _passcodeInputViewForState:updateDetailText:](v27, "_passcodeInputViewForState:updateDetailText:", v21, 1);
  -[BuddyPasscodeBaseViewController transitionToPasscodeInput:delegate:](v27, "transitionToPasscodeInput:delegate:", location, v27);
  objc_storeStrong(&location, 0);
}

- (void)transitionToPasscodeInput:(id)a3 delegate:(id)a4
{
  id v5;
  BOOL v6;
  id v7;
  void *v8;
  UIApplication *v9;
  double v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *v26;
  UIButton *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *v36;
  NSArray *v37;
  id v38;
  double v39;
  void **v40;
  int v41;
  int v42;
  id (*v43)(uint64_t);
  void *v44;
  id v45;
  id v46;
  int v47;
  id v48;
  id location[2];
  BuddyPasscodeBaseViewController *v50;
  _QWORD v51[3];

  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v48 = 0;
  objc_storeStrong(&v48, a4);
  v5 = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](v50, "_currentPasscodeInputView");
  v6 = 1;
  if ((objc_msgSend(v5, "isEqual:", location[0]) & 1) == 0)
    v6 = location[0] == 0;

  if (v6)
  {
    v47 = 1;
  }
  else
  {
    v46 = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](v50, "_currentPasscodeInputView");
    objc_msgSend(v46, "disable");
    objc_msgSend(v46, "setDelegate:", 0);
    objc_msgSend(location[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(location[0], "setDelegate:", v50);
    v7 = -[BuddyPasscodeBaseViewController contentView](v50, "contentView");
    objc_msgSend(v7, "addSubview:", location[0]);

    if ((objc_msgSend(v46, "isFirstResponder") & 1) != 0)
    {
      v40 = _NSConcreteStackBlock;
      v41 = -1073741824;
      v42 = 0;
      v43 = sub_1001B93AC;
      v44 = &unk_100280730;
      v45 = location[0];
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v40);
      objc_storeStrong(&v45, 0);
    }
    else
    {
      objc_msgSend(location[0], "becomeFirstResponder");
    }
    objc_msgSend(v46, "removeFromSuperview");
    v8 = (void *)objc_opt_class(v50);
    v9 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
    objc_msgSend(v8, "_passcodeInputVerticalPaddingForOrientation:", -[UIApplication activeInterfaceOrientation](v9, "activeInterfaceOrientation"));
    v11 = v10;

    v39 = v11;
    v12 = objc_msgSend(location[0], "topAnchor");
    v13 = -[BuddyPasscodeBaseViewController contentView](v50, "contentView");
    v14 = objc_msgSend(v13, "topAnchor");
    v38 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, v11);

    v15 = location[0];
    v16 = objc_opt_class(BuddyComplexPasscodeInputView);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    {
      v17 = objc_msgSend(location[0], "leadingAnchor");
      v18 = -[BuddyPasscodeBaseViewController contentView](v50, "contentView");
      v19 = objc_msgSend(v18, "leadingAnchor");
      v20 = objc_msgSend(v17, "constraintEqualToAnchor:", v19);
      objc_msgSend(v20, "setActive:", 1);

      v21 = objc_msgSend(location[0], "trailingAnchor");
      v22 = -[BuddyPasscodeBaseViewController contentView](v50, "contentView");
      v23 = objc_msgSend(v22, "trailingAnchor");
      v24 = objc_msgSend(v21, "constraintEqualToAnchor:", v23);
      objc_msgSend(v24, "setActive:", 1);

    }
    v25 = -[BuddyPasscodeBaseViewController contentViewTopConstraint](v50, "contentViewTopConstraint");

    if (v25)
    {
      v26 = -[BuddyPasscodeBaseViewController contentViewTopConstraint](v50, "contentViewTopConstraint");
      -[NSLayoutConstraint constant](v26, "constant");
      objc_msgSend(v38, "setConstant:");

    }
    -[BuddyPasscodeBaseViewController setContentViewTopConstraint:](v50, "setContentViewTopConstraint:", v38);
    v27 = -[BuddyPasscodeBaseViewController footerButton](v50, "footerButton");
    v28 = -[UIButton topAnchor](v27, "topAnchor");
    v29 = objc_msgSend(location[0], "bottomAnchor");
    v30 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v39);
    -[BuddyPasscodeBaseViewController setPasscodeInputViewBottomConstraint:](v50, "setPasscodeInputViewBottomConstraint:", v30);

    v31 = objc_msgSend(location[0], "centerXAnchor");
    v32 = -[BuddyPasscodeBaseViewController contentView](v50, "contentView");
    v33 = objc_msgSend(v32, "centerXAnchor");
    v34 = objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v51[0] = v34;
    v35 = -[BuddyPasscodeBaseViewController contentViewTopConstraint](v50, "contentViewTopConstraint");
    v51[1] = v35;
    v36 = -[BuddyPasscodeBaseViewController passcodeInputViewBottomConstraint](v50, "passcodeInputViewBottomConstraint");
    v51[2] = v36;
    v37 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 3);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v46, 0);
    v47 = 0;
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
}

+ (double)_passcodeInputVerticalPaddingForOrientation:(int64_t)a3
{
  id v3;
  id v4;
  id v5;
  char *v6;
  double v8;

  v8 = 0.0;
  v3 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v4 = objc_msgSend(v3, "type");

  if (v4 == (id)1)
    return 20.0;
  v5 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v6 = (char *)objc_msgSend(v5, "size");

  if ((unint64_t)v6 < 2)
    return 37.0;
  if (v6 == (char *)2)
    return 22.0;
  if (v6 == (char *)3 || v6 != (char *)4 && (unint64_t)(v6 - 5) <= 1)
    return 37.0;
  return v8;
}

- (void)viewDidLoad
{
  BuddyFlowItemDispositionProvider *v2;
  unint64_t v3;
  UIColor *v4;
  id v5;
  UIImage *v6;
  id v7;
  id v8;
  id v9;
  BuddyMultilineButton *v10;
  UIButton *v11;
  UIButton *v12;
  UILabel *v13;
  UIFont *v14;
  UIButton *v15;
  UILabel *v16;
  UIButton *v17;
  UILabel *v18;
  double v19;
  double v20;
  double v21;
  UIButton *v22;
  UIButton *v23;
  id v24;
  UIButton *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  UIButton *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSArray *v35;
  UIButton *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  id location;
  objc_super v43;
  SEL v44;
  BuddyPasscodeBaseViewController *v45;
  _QWORD v46[2];
  _QWORD v47[2];

  v45 = self;
  v44 = a2;
  v43.receiver = self;
  v43.super_class = (Class)BuddyPasscodeBaseViewController;
  -[BuddyPasscodeBaseViewController viewDidLoad](&v43, "viewDidLoad");
  v2 = -[BuddyPasscodeBaseViewController flowItemDispositionProvider](v45, "flowItemDispositionProvider");
  v3 = -[BuddyFlowItemDispositionProvider dispositions](v2, "dispositions") & 8;

  if (v3 == 8)
  {
    v4 = +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    location = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:](UIImageSymbolConfiguration, "configurationWithHierarchicalColor:", v4);

    v5 = -[BuddyPasscodeBaseViewController headerView](v45, "headerView");
    v6 = +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("figure.child.and.lock.fill"), location);
    objc_msgSend(v5, "setIcon:accessibilityLabel:", v6, 0);

    objc_storeStrong(&location, 0);
  }
  else if (-[BuddyPasscodeBaseViewController includeHeaderAnimation](v45, "includeHeaderAnimation"))
  {
    v7 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 1"), CFSTR("Dark 1"), 0.01, 1.0);
    v47[0] = v7;
    v8 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), CFSTR("Dark 2"), 1.0, 1.0);
    v47[1] = v8;
    v41 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 2);

    v9 = -[BuddyPasscodeBaseViewController buddy_animationController:animatedStates:startAtFirstState:](v45, "buddy_animationController:animatedStates:startAtFirstState:", CFSTR("Lock"), v41, 1);
    -[BuddyPasscodeBaseViewController setAnimationController:](v45, "setAnimationController:", v9);

    objc_storeStrong(&v41, 0);
  }
  v10 = +[BuddyMultilineButton buttonWithType:](BuddyMultilineButton, "buttonWithType:", 1);
  -[BuddyPasscodeBaseViewController setFooterButton:](v45, "setFooterButton:", v10);

  v11 = -[BuddyPasscodeBaseViewController footerButton](v45, "footerButton");
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = -[BuddyPasscodeBaseViewController footerButton](v45, "footerButton");
  v13 = -[UIButton titleLabel](v12, "titleLabel");
  v14 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
  -[UILabel setFont:](v13, "setFont:", v14);

  v15 = -[BuddyPasscodeBaseViewController footerButton](v45, "footerButton");
  v16 = -[UIButton titleLabel](v15, "titleLabel");
  -[UILabel setNumberOfLines:](v16, "setNumberOfLines:", 0);

  v17 = -[BuddyPasscodeBaseViewController footerButton](v45, "footerButton");
  v18 = -[UIButton titleLabel](v17, "titleLabel");
  -[UILabel setTextAlignment:](v18, "setTextAlignment:", 1);

  v37 = sub_1001B9AE4();
  v38 = v19;
  v39 = v20;
  v40 = v21;
  v22 = -[BuddyPasscodeBaseViewController footerButton](v45, "footerButton");
  -[UIButton setContentEdgeInsets:](v22, "setContentEdgeInsets:", v37, v38, v39, v40);

  v23 = -[BuddyPasscodeBaseViewController footerButton](v45, "footerButton");
  -[UIButton addTarget:action:forEvents:](v23, "addTarget:action:forEvents:", v45, "tappedFooterButton:", 64);

  v24 = -[BuddyPasscodeBaseViewController contentView](v45, "contentView");
  v25 = -[BuddyPasscodeBaseViewController footerButton](v45, "footerButton");
  objc_msgSend(v24, "addSubview:", v25);

  v36 = -[BuddyPasscodeBaseViewController footerButton](v45, "footerButton");
  v26 = -[UIButton widthAnchor](v36, "widthAnchor");
  v27 = -[BuddyPasscodeBaseViewController contentView](v45, "contentView");
  v28 = objc_msgSend(v27, "widthAnchor");
  v29 = objc_msgSend(v26, "constraintEqualToAnchor:multiplier:", v28, 1.0);
  v46[0] = v29;
  v30 = -[BuddyPasscodeBaseViewController footerButton](v45, "footerButton");
  v31 = -[UIButton bottomAnchor](v30, "bottomAnchor");
  v32 = -[BuddyPasscodeBaseViewController contentView](v45, "contentView");
  v33 = objc_msgSend(v32, "bottomAnchor");
  v34 = objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v46[1] = v34;
  v35 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

  -[BuddyPasscodeBaseViewController setExtendedLayoutIncludesOpaqueBars:](v45, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[BuddyPasscodeBaseViewController _setupFirstEntry](v45, "_setupFirstEntry");
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  BOOL v4;
  BuddyPasscodeBaseViewController *v5;
  id v6;
  id v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  BuddyPasscodeBaseViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BuddyPasscodeBaseViewController;
  -[BuddyPasscodeBaseViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v7 = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](v11, "_currentPasscodeInputView");
  v3 = -[BuddyPasscodeBaseViewController presentedViewController](v11, "presentedViewController");
  v4 = v3 == 0;

  if (v4)
    objc_msgSend(v7, "becomeFirstResponder");
  v5 = v11;
  v6 = objc_msgSend(v7, "passcode");
  -[BuddyPasscodeBaseViewController _updateNextButtonForPasscode:](v5, "_updateNextButtonForPasscode:", v6);

  objc_storeStrong(&v7, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  OBAnimationController *v3;
  id v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  id v10;
  objc_super v11;
  BOOL v12;
  SEL v13;
  BuddyPasscodeBaseViewController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BuddyPasscodeBaseViewController;
  -[BuddyPasscodeBaseViewController viewDidAppear:](&v11, "viewDidAppear:", a3);
  v3 = -[BuddyPasscodeBaseViewController animationController](v14, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

  v4 = -[BuddyPasscodeBaseViewController scrollView](v14, "scrollView");
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  v7 = -[BuddyPasscodeBaseViewController view](v14, "view");
  objc_msgSend(v7, "frame");
  v9 = v8;

  if (v6 > v9)
  {
    v10 = -[BuddyPasscodeBaseViewController scrollView](v14, "scrollView");
    objc_msgSend(v10, "flashScrollIndicators");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  id v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  BuddyPasscodeBaseViewController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BuddyPasscodeBaseViewController;
  -[BuddyPasscodeBaseViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v3 = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](v8, "_currentPasscodeInputView");
  objc_msgSend(v3, "resignFirstResponder", v3);
  objc_storeStrong(&v4, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;
  BOOL v8;
  SEL v9;
  BuddyPasscodeBaseViewController *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BuddyPasscodeBaseViewController;
  -[BuddyPasscodeBaseViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  if (-[BuddyPasscodeBaseViewController showingSpinner](v10, "showingSpinner"))
  {
    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("SETUP_PASSCODE_VIEW_CONTROLLER"));
    -[BuddyPasscodeBaseViewController setShowingSpinner:](v10, "setShowingSpinner:", 0);
  }
  v3 = +[BFFPasscodeCreationManager sharedPasscodeManager](BFFPasscodeCreationManager, "sharedPasscodeManager");
  v4 = objc_msgSend(v3, "passcodeState");

  if (v4 == (id)4)
  {
    -[BuddyPasscodeBaseViewController clear](v10, "clear");
  }
  else
  {
    v5 = +[BFFPasscodeCreationManager sharedPasscodeManager](BFFPasscodeCreationManager, "sharedPasscodeManager");
    objc_msgSend(v5, "reset");

  }
  v6 = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](v10, "_currentPasscodeInputView");
  objc_msgSend(v6, "resignFirstResponder");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, void *);
  void *v9;
  BuddyPasscodeBaseViewController *v10;
  objc_super v11;
  id location[2];
  BuddyPasscodeBaseViewController *v13;
  CGSize v14;

  v14 = a3;
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v11.receiver = v13;
  v11.super_class = (Class)BuddyPasscodeBaseViewController;
  -[BuddyPasscodeBaseViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v14.width, v14.height);
  v4 = location[0];
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001B9FC8;
  v9 = &unk_100282D20;
  v10 = v13;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", &v5, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)nextButtonPressed
{
  id v2;
  BFFPasscodeCreationManager *v3;
  id location[2];
  BuddyPasscodeBaseViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  v2 = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](self, "_currentPasscodeInputView");
  location[0] = objc_msgSend(v2, "passcode");

  v3 = -[BuddyPasscodeBaseViewController passcodeManager](v5, "passcodeManager");
  -[BFFPasscodeCreationManager transitionToNextPasscodeStateForInput:](v3, "transitionToNextPasscodeStateForInput:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)_updateNextButton
{
  id v2;
  id location[2];
  BuddyPasscodeBaseViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](self, "_currentPasscodeInputView");
  v2 = objc_msgSend(location[0], "passcode");
  -[BuddyPasscodeBaseViewController _updateNextButtonForPasscode:](v4, "_updateNextButtonForPasscode:", v2);

  objc_storeStrong(location, 0);
}

- (void)_updateNextButtonForPasscode:(id)a3
{
  unsigned __int8 v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id location[2];
  BuddyPasscodeBaseViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  v3 = 0;
  if (objc_msgSend(location[0], "length"))
  {
    v8 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v7 = 1;
    v3 = objc_msgSend(v8, "passcode:meetsCurrentConstraintsOutError:", location[0], 0);
  }
  if ((v7 & 1) != 0)

  v9 = v3 & 1;
  v4 = -[BuddyPasscodeBaseViewController navigationItem](v11, "navigationItem");
  v5 = objc_msgSend(v4, "rightBarButtonItem");
  objc_msgSend(v5, "setEnabled:", v9 & 1);

  v6 = +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  objc_msgSend(v6, "setReturnKeyEnabled:", v9 & 1);

  objc_storeStrong(location, 0);
}

- (BOOL)_allowSkip
{
  BuddyPasscodeBaseViewControllerDelegate *v2;
  char v3;
  BuddyPasscodeBaseViewControllerDelegate *v4;
  BOOL v6;

  v2 = -[BuddyPasscodeBaseViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
  v3 = objc_opt_respondsToSelector(v2, "passcodeViewControllerAllowSkip:");

  if ((v3 & 1) == 0)
    return +[BuddyPasscodeBaseViewController allowSkip](BuddyPasscodeBaseViewController, "allowSkip");
  v4 = -[BuddyPasscodeBaseViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
  v6 = -[BuddyPasscodeBaseViewControllerDelegate passcodeViewControllerAllowSkip:](v4, "passcodeViewControllerAllowSkip:", self) & 1;

  return v6;
}

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
  id v5;
  id location[2];
  BuddyPasscodeBaseViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BuddyPasscodeBaseViewController _updateNextButtonForPasscode:](v7, "_updateNextButtonForPasscode:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  id v5;
  void *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  BuddyPasscodeBaseViewController *v12;
  id v13;
  dispatch_time_t v14;
  uint64_t v15;
  id v16;
  id location[2];
  BuddyPasscodeBaseViewController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v5 = objc_msgSend(location[0], "passcodeField");
  objc_msgSend(v5, "forceDisplayIfNeeded");

  v15 = 0x3FB374BC6A7EF9DBLL;
  v14 = dispatch_time(0, (uint64_t)(0.076 * 1000000000.0));
  v6 = &_dispatch_main_q;
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_1001BA5C0;
  v11 = &unk_100280D00;
  v12 = v18;
  v13 = v16;
  dispatch_after(v14, (dispatch_queue_t)v6, &v7);

  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)passcodeInputView
{
  BFFPasscodeCreationManager *v2;
  unsigned __int8 v3;
  BuddySimplePasscodeInputView *v4;
  BFFPasscodeCreationManager *v5;
  BuddyComplexPasscodeInputView *v6;
  BFFPasscodeCreationManager *v7;
  BuddyComplexPasscodeInputView *v8;
  id v9;
  id v10;
  id obj;
  id location[2];
  BuddyPasscodeBaseViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v2 = -[BuddyPasscodeBaseViewController passcodeManager](self, "passcodeManager");
  v3 = -[BFFPasscodeCreationManager isSimplePasscodeEntry](v2, "isSimplePasscodeEntry");

  if ((v3 & 1) != 0)
  {
    v4 = [BuddySimplePasscodeInputView alloc];
    v5 = -[BuddyPasscodeBaseViewController passcodeManager](v14, "passcodeManager");
    obj = -[BuddySimplePasscodeInputView initWithFrame:numberOfEntryFields:](v4, "initWithFrame:numberOfEntryFields:", -[BFFPasscodeCreationManager simplePasscodeEntryLength](v5, "simplePasscodeEntryLength"), CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

    objc_msgSend(obj, "setLimitCharactersToNumbers:", 0);
    objc_storeStrong(location, obj);
    objc_storeStrong(&obj, 0);
  }
  else
  {
    v6 = [BuddyComplexPasscodeInputView alloc];
    v7 = -[BuddyPasscodeBaseViewController passcodeManager](v14, "passcodeManager");
    v8 = -[BuddyComplexPasscodeInputView initWithFrame:numericOnly:](v6, "initWithFrame:numericOnly:", (unint64_t)-[BFFPasscodeCreationManager isNumericPasscodeEntry](v7, "isNumericPasscodeEntry") & 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v9 = location[0];
    location[0] = v8;

  }
  v10 = location[0];
  objc_storeStrong(location, 0);
  return v10;
}

- (id)_passcodeInputViewForState:(unint64_t)a3 updateDetailText:(BOOL)a4
{
  id v4;
  BOOL v5;
  unsigned __int8 v6;
  UIButton *v7;
  NSBundle *v8;
  NSString *v9;
  UIButton *v10;
  NSBundle *v11;
  NSString *v12;
  id v13;
  id v14;
  id v15;
  id v17;
  id location;
  BOOL v19;
  unint64_t v20;
  SEL v21;
  BuddyPasscodeBaseViewController *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  location = -[BuddyPasscodeBaseViewController passcodeInputView](self, "passcodeInputView");
  if (!v20 || v20 == 3)
  {
    v4 = -[BuddyPasscodeBaseViewController passcodeOptionAlertController](v22, "passcodeOptionAlertController");
    v17 = objc_msgSend(v4, "actions");

    v5 = objc_msgSend(v17, "count") == (id)2;
    v6 = 0;
    if (v5)
      v6 = -[BuddyPasscodeBaseViewController _allowSkip](v22, "_allowSkip");
    v22->_footerButtonIsSkip = v6 & 1;
    if (v22->_footerButtonIsSkip)
    {
      v7 = -[BuddyPasscodeBaseViewController footerButton](v22, "footerButton");
      v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
      v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("DO_NOT_ADD_PASSCODE"), &stru_100284738, CFSTR("Localizable"));
      -[UIButton setTitle:forState:](v7, "setTitle:forState:", v9, 0);

    }
    else if ((unint64_t)objc_msgSend(v17, "count") > 1)
    {
      v10 = -[BuddyPasscodeBaseViewController footerButton](v22, "footerButton");
      v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
      v12 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("PASSCODE_OPTIONS"), &stru_100284738, CFSTR("Localizable"));
      -[UIButton setTitle:forState:](v10, "setTitle:forState:", v12, 0);

    }
    objc_storeStrong(&v17, 0);
  }
  if (v19)
  {
    v13 = -[BuddyPasscodeBaseViewController headerView](v22, "headerView");
    v14 = -[BuddyPasscodeBaseViewController instructionsForState:](v22, "instructionsForState:", v20);
    objc_msgSend(v13, "setDetailText:", v14);

  }
  v15 = location;
  objc_storeStrong(&location, 0);
  return v15;
}

- (void)_animatedPasscodeViewTransitionToState:(unint64_t)a3 animation:(unint64_t)a4
{
  UIButton *v4;
  UIButton *v5;
  id v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, double);
  void *v11;
  BuddyPasscodeBaseViewController *v12;
  id v13;
  id location;
  unint64_t v15;
  unint64_t v16;
  SEL v17;
  BuddyPasscodeBaseViewController *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  if (a3 && v16 != 3)
  {
    v5 = -[BuddyPasscodeBaseViewController footerButton](v18, "footerButton");
    -[UIButton setHidden:](v5, "setHidden:", 1);

  }
  else
  {
    v4 = -[BuddyPasscodeBaseViewController footerButton](v18, "footerButton");
    -[UIButton setHidden:](v4, "setHidden:", 0);

  }
  location = -[BuddyPasscodeBaseViewController _passcodeInputViewForState:updateDetailText:](v18, "_passcodeInputViewForState:updateDetailText:", v16, 0);
  -[BuddyPasscodeBaseViewController _prepareTransitionForPasscodeInput:](v18, "_prepareTransitionForPasscodeInput:", location);
  v13 = -[BuddyPasscodeBaseViewController _onboardingPasscodeAnimationForBFF:](v18, "_onboardingPasscodeAnimationForBFF:", v15);
  v6 = -[BuddyPasscodeBaseViewController instructionsForState:](v18, "instructionsForState:", v16);
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_1001BABA0;
  v11 = &unk_100284420;
  v12 = v18;
  -[BuddyPasscodeBaseViewController animateDetailText:animationType:heightDifference:](v18, "animateDetailText:animationType:heightDifference:", v6, v13, &v7);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&location, 0);
}

- (void)_prepareTransitionForPasscodeInput:(id)a3
{
  id v3;
  id location[2];
  BuddyPasscodeBaseViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyPasscodeBaseViewController transitionToPasscodeInput:delegate:](v5, "transitionToPasscodeInput:delegate:", location[0], v5);
  v3 = -[BuddyPasscodeBaseViewController contentView](v5, "contentView");
  objc_msgSend(v3, "layoutIfNeeded");

  objc_storeStrong(location, 0);
}

- (unint64_t)_onboardingPasscodeAnimationForBFF:(unint64_t)a3
{
  if (a3 == 1)
    return 0;
  if (a3 == 2)
    return 1;
  return 2;
}

- (void)passcodeManager:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  BuddyPasscodeBaseViewController *v11;
  BFFPasscodeCreationManager *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  id location[2];
  BuddyPasscodeBaseViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v14 = a5;
  v7 = -[BuddyPasscodeBaseViewController headerView](v17, "headerView");
  v8 = -[BuddyPasscodeBaseViewController titleForState:](v17, "titleForState:", v14);
  objc_msgSend(v7, "setTitle:", v8);

  if (v14)
  {
    switch(v14)
    {
      case 2uLL:
      case 3uLL:
        if (v14 == 2)
          v10 = 2;
        else
          v10 = 1;
        -[BuddyPasscodeBaseViewController _animatedPasscodeViewTransitionToState:animation:](v17, "_animatedPasscodeViewTransitionToState:animation:", v14, v10, v10);
        break;
      case 1uLL:
        -[BuddyPasscodeBaseViewController _showWeakWarningAlert](v17, "_showWeakWarningAlert");
        break;
      case 4uLL:
        v11 = v17;
        v12 = -[BuddyPasscodeBaseViewController passcodeManager](v17, "passcodeManager");
        v13 = -[BFFPasscodeCreationManager passcode](v12, "passcode");
        -[BuddyPasscodeBaseViewController _finishedWithPasscode:](v11, "_finishedWithPasscode:", v13);

        break;
    }
  }
  else
  {
    v9 = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](v17, "_currentPasscodeInputView");
    objc_msgSend(v9, "setPasscode:", &stru_100284738);

    if (v15 != 1)
      -[BuddyPasscodeBaseViewController _animatedPasscodeViewTransitionToState:animation:](v17, "_animatedPasscodeViewTransitionToState:animation:", 0, 3);
  }
  -[BuddyPasscodeBaseViewController _updateNextButton](v17, "_updateNextButton");
  objc_storeStrong(location, 0);
}

- (void)passcodeManagerWillSetPasscode:(id)a3
{
  BuddyPasscodeBaseViewControllerDelegate *v3;
  char v4;
  BuddyPasscodeBaseViewControllerDelegate *v5;
  id location[2];
  BuddyPasscodeBaseViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v7, CFSTR("SETUP_PASSCODE_VIEW_CONTROLLER"));
  -[BuddyPasscodeBaseViewController setShowingSpinner:](v7, "setShowingSpinner:", 1);
  v3 = -[BuddyPasscodeBaseViewController passcodeCreationDelegate](v7, "passcodeCreationDelegate");
  v4 = objc_opt_respondsToSelector(v3, "passcodeViewControllerWillSetPasscode:");

  if ((v4 & 1) != 0)
  {
    v5 = -[BuddyPasscodeBaseViewController passcodeCreationDelegate](v7, "passcodeCreationDelegate");
    -[BuddyPasscodeBaseViewControllerDelegate passcodeViewControllerWillSetPasscode:](v5, "passcodeViewControllerWillSetPasscode:", v7);

  }
  objc_storeStrong(location, 0);
}

- (void)passcodeManager:(id)a3 didSetPasscodeWithSuccess:(BOOL)a4 error:(id)a5
{
  BuddyPasscodeBaseViewControllerDelegate *v7;
  char v8;
  BuddyPasscodeBaseViewControllerDelegate *v9;
  BuddyPasscodeBaseViewController *v10;
  id v11;
  id v12;
  BOOL v13;
  id location[2];
  BuddyPasscodeBaseViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  v12 = 0;
  objc_storeStrong(&v12, a5);
  if (-[BuddyPasscodeBaseViewController showingSpinner](v15, "showingSpinner"))
  {
    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("SETUP_PASSCODE_VIEW_CONTROLLER"));
    -[BuddyPasscodeBaseViewController setShowingSpinner:](v15, "setShowingSpinner:", 0);
  }
  if (v13)
  {
    v7 = -[BuddyPasscodeBaseViewController passcodeCreationDelegate](v15, "passcodeCreationDelegate");
    v8 = objc_opt_respondsToSelector(v7, "passcodeViewController:didSetPasscode:");

    if ((v8 & 1) != 0)
    {
      v9 = -[BuddyPasscodeBaseViewController passcodeCreationDelegate](v15, "passcodeCreationDelegate");
      v10 = v15;
      v11 = objc_msgSend(location[0], "passcode");
      -[BuddyPasscodeBaseViewControllerDelegate passcodeViewController:didSetPasscode:](v9, "passcodeViewController:didSetPasscode:", v10, v11);

    }
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)tappedFooterButton:(id)a3
{
  id location[2];
  BuddyPasscodeBaseViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_footerButtonIsSkip)
    -[BuddyPasscodeBaseViewController _showSkipPasscodeAlert](v4, "_showSkipPasscodeAlert");
  else
    -[BuddyPasscodeBaseViewController _showPasscodeOptionsSheet](v4, "_showPasscodeOptionsSheet");
  objc_storeStrong(location, 0);
}

- (void)clear
{
  id v2;
  id v3;
  id v4;
  BFFPasscodeCreationManager *v5;

  v2 = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](self, "_currentPasscodeInputView", a2);
  objc_msgSend(v2, "disable");

  v3 = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](self, "_currentPasscodeInputView");
  objc_msgSend(v3, "setDelegate:", 0);

  v4 = -[BuddyPasscodeBaseViewController _currentPasscodeInputView](self, "_currentPasscodeInputView");
  objc_msgSend(v4, "removeFromSuperview");

  v5 = -[BuddyPasscodeBaseViewController passcodeManager](self, "passcodeManager");
  -[BFFPasscodeCreationManager setDelegate:](v5, "setDelegate:", 0);

  -[BuddyPasscodeBaseViewController setPasscodeManager:](self, "setPasscodeManager:", 0);
}

- (void)_finishedWithPasscode:(id)a3
{
  BuddyPasscodeBaseViewControllerDelegate *v3;
  id location[2];
  BuddyPasscodeBaseViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyPasscodeBaseViewController passcodeCreationDelegate](v5, "passcodeCreationDelegate");
  -[BuddyPasscodeBaseViewControllerDelegate passcodeViewController:didFinishWithPasscodeCreation:](v3, "passcodeViewController:didFinishWithPasscodeCreation:", v5, location[0]);

  objc_storeStrong(location, 0);
}

- (id)titleForState:(unint64_t)a3
{
  BuddyFlowItemDispositionProvider *v3;
  BOOL v4;
  NSBundle *v5;
  id v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  id v10;
  id v11;
  NSString *v12;
  id v13;
  id v14;
  char v16;
  NSString *v17;
  char v18;
  BuddyFlowItemDispositionProvider *v19;
  id location[3];
  BuddyPasscodeBaseViewController *v21;

  v21 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  v3 = -[BuddyPasscodeBaseViewController flowItemDispositionProvider](self, "flowItemDispositionProvider");
  v18 = 0;
  v16 = 0;
  v4 = 0;
  if (v3)
  {
    v19 = -[BuddyPasscodeBaseViewController flowItemDispositionProvider](v21, "flowItemDispositionProvider");
    v18 = 1;
    v4 = 0;
    if ((id)-[BuddyFlowItemDispositionProvider dispositions](v19, "dispositions") == (id)8)
    {
      v17 = -[BuddyPasscodeBaseViewController userFirstName](v21, "userFirstName");
      v16 = 1;
      v4 = v17 != 0;
    }
  }
  if ((v16 & 1) != 0)

  if ((v18 & 1) != 0)
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  if (v4)
  {
    v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("CREATE_PASSCODE_FOR_CHILD_WITH_NAME"));
    v7 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("Localizable"));
    v8 = -[BuddyPasscodeBaseViewController userFirstName](v21, "userFirstName");
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8);
    v10 = location[0];
    location[0] = v9;

  }
  else
  {
    v11 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("CREATE_PASSCODE"));
    v12 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v11, &stru_100284738, CFSTR("Localizable"));
    v13 = location[0];
    location[0] = v12;

  }
  v14 = location[0];
  objc_storeStrong(location, 0);
  return v14;
}

- (id)instructionsForState:(unint64_t)a3
{
  BFFPasscodeCreationManager *v3;
  id v4;
  id v5;
  NSBundle *v6;
  NSBundle *v7;
  id location[3];
  BuddyPasscodeBaseViewController *v10;
  __CFString *v11;

  v10 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  switch(a3)
  {
    case 0uLL:
      v3 = -[BuddyPasscodeBaseViewController passcodeManager](v10, "passcodeManager");
      v4 = -[BFFPasscodeCreationManager constraintInstructions](v3, "constraintInstructions");
      v5 = location[0];
      location[0] = v4;

      if (location[0] && objc_msgSend(location[0], "length"))
        v11 = (__CFString *)location[0];
      else
        v11 = (__CFString *)-[BuddyPasscodeBaseViewController _firstEntryInstructions](v10, "_firstEntryInstructions");
      break;
    case 1uLL:
    case 4uLL:
      v11 = &stru_100284738;
      break;
    case 2uLL:
      v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
      v11 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("RE_ENTER_PASSCODE"), &stru_100284738, CFSTR("Localizable"));

      break;
    case 3uLL:
      v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
      v11 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("PASSCODES_FAILED_TO_MATCH"), &stru_100284738, CFSTR("Localizable"));

      break;
    default:
      break;
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (id)_firstEntryInstructions
{
  BuddyPasscodeBaseViewControllerDelegate *v2;
  char v3;
  BuddyPasscodeBaseViewControllerDelegate *v4;
  id v5;
  id v6;
  BuddyFlowItemDispositionProvider *v7;
  BOOL v8;
  BuddyFlowItemDispositionProvider *v9;
  id v10;
  id v11;
  NSBundle *v12;
  id v13;
  NSString *v14;
  id v15;
  id v16;
  char v18;
  BuddyFlowItemDispositionProvider *v19;
  id location;
  id v21[2];
  BuddyPasscodeBaseViewController *v22;

  v22 = self;
  v21[1] = (id)a2;
  v21[0] = 0;
  v2 = -[BuddyPasscodeBaseViewController passcodeCreationDelegate](self, "passcodeCreationDelegate");
  v3 = objc_opt_respondsToSelector(v2, "passcodeViewControllerCustomFirstEntryInstructions:");

  if ((v3 & 1) != 0)
  {
    v4 = -[BuddyPasscodeBaseViewController passcodeCreationDelegate](v22, "passcodeCreationDelegate");
    v5 = -[BuddyPasscodeBaseViewControllerDelegate passcodeViewControllerCustomFirstEntryInstructions:](v4, "passcodeViewControllerCustomFirstEntryInstructions:", v22);
    v6 = v21[0];
    v21[0] = v5;

  }
  if (!v21[0])
  {
    location = CFSTR("PASSCODE_DESCRIPTION");
    v7 = -[BuddyPasscodeBaseViewController flowItemDispositionProvider](v22, "flowItemDispositionProvider");
    v18 = 0;
    v8 = 0;
    if (v7)
    {
      v19 = -[BuddyPasscodeBaseViewController flowItemDispositionProvider](v22, "flowItemDispositionProvider");
      v18 = 1;
      v8 = (id)-[BuddyFlowItemDispositionProvider dispositions](v19, "dispositions") == (id)8;
    }
    if ((v18 & 1) != 0)

    if (v8)
    {
      v9 = -[BuddyPasscodeBaseViewController flowItemDispositionProvider](v22, "flowItemDispositionProvider");
      v10 = +[BuddyLocalizationUtilities dispositionSpecificLocalizedStringKeyForKey:disposition:](BuddyLocalizationUtilities, "dispositionSpecificLocalizedStringKeyForKey:disposition:", location, -[BuddyFlowItemDispositionProvider dispositions](v9, "dispositions"));
      v11 = location;
      location = v10;

    }
    v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
    v13 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", location);
    v14 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", v13, &stru_100284738, CFSTR("Localizable"));
    v15 = v21[0];
    v21[0] = v14;

    objc_storeStrong(&location, 0);
  }
  v16 = v21[0];
  objc_storeStrong(v21, 0);
  return v16;
}

- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3
{
  BFFPasscodeCreationManager *v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  id v9;
  id v10;
  BOOL v11;
  SEL v12;
  BuddyPasscodeBaseViewController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v3 = -[BuddyPasscodeBaseViewController passcodeManager](self, "passcodeManager");
  v4 = -[BFFPasscodeCreationManager isSimplePasscodeEntry](v3, "isSimplePasscodeEntry");

  if ((v4 & 1) != 0)
  {
    v5 = -[BuddyPasscodeBaseViewController navigationItem](v13, "navigationItem");
    objc_msgSend(v5, "setRightBarButtonItem:animated:", 0, v11);

  }
  else
  {
    v6 = objc_alloc((Class)UIBarButtonItem);
    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
    v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_100284738, CFSTR("Localizable"));
    v10 = objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 2, v13, "nextButtonPressed");

    v9 = -[BuddyPasscodeBaseViewController navigationItem](v13, "navigationItem");
    objc_msgSend(v9, "setRightBarButtonItem:animated:", v10, v11);

    -[BuddyPasscodeBaseViewController _updateNextButton](v13, "_updateNextButton");
    objc_storeStrong(&v10, 0);
  }
}

- (void)_showWeakWarningAlert
{
  NSBundle *v2;
  id v3;
  NSBundle *v4;
  NSString *v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  UIAlertAction *v9;
  id v10;
  NSBundle *v11;
  NSString *v12;
  UIAlertAction *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(NSObject *, void *);
  void *v17;
  BuddyPasscodeBaseViewController *v18;
  void **v19;
  int v20;
  int v21;
  void (*v22)(id *, void *);
  void *v23;
  BuddyPasscodeBaseViewController *v24;
  id location;
  id v26[2];
  BuddyPasscodeBaseViewController *v27;

  v27 = self;
  v26[1] = (id)a2;
  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("WEAK_PASSCODE_DETAILS"));
  v26[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));

  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("WEAK_PASSCODE"), &stru_100284738, CFSTR("Localizable"));
  location = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v26[0], 1);

  v6 = location;
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("CHANGE_PASSCODE"), &stru_100284738, CFSTR("Localizable"));
  v19 = _NSConcreteStackBlock;
  v20 = -1073741824;
  v21 = 0;
  v22 = sub_1001BBF9C;
  v23 = &unk_100280A28;
  v24 = v27;
  v9 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 1, &v19);
  objc_msgSend(v6, "addAction:", v9);

  v10 = location;
  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  v12 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("USE_WEAK_PASSCODE_ANYWAY"), &stru_100284738, CFSTR("Localizable"));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1001BC008;
  v17 = &unk_100280A28;
  v18 = v27;
  v13 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, &v14);
  objc_msgSend(v10, "addAction:", v13, v14, v15, v16, v17);

  -[BuddyPasscodeBaseViewController presentViewController:animated:completion:](v27, "presentViewController:animated:completion:", location, 1, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v26, 0);
}

- (void)_showSkipPasscodeAlert
{
  NSBundle *v2;
  id v3;
  NSBundle *v4;
  NSString *v5;
  NSBundle *v6;
  NSString *v7;
  UIAlertAction *v8;
  id v9;
  NSBundle *v10;
  NSString *v11;
  UIAlertAction *v12;
  void **v13;
  int v14;
  int v15;
  void (*v16)(NSObject *, void *);
  void *v17;
  BuddyPasscodeBaseViewController *v18;
  id location;
  id v20[2];
  BuddyPasscodeBaseViewController *v21;

  v21 = self;
  v20[1] = (id)a2;
  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("SKIP_PASSCODE_DESCRIPTION"));
  v20[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));

  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("SKIP_PASSCODE"), &stru_100284738, CFSTR("Localizable"));
  location = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v20[0], 1);

  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("SKIP_OPTION_CREATE_PASSCODE"), &stru_100284738, CFSTR("Localizable"));
  v8 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 1, 0);
  objc_msgSend(location, "addAction:", v8);

  v9 = location;
  v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("SKIP_OPTION_DONT_USE_PASSCODE"), &stru_100284738, CFSTR("Localizable"));
  v13 = _NSConcreteStackBlock;
  v14 = -1073741824;
  v15 = 0;
  v16 = sub_1001BC440;
  v17 = &unk_100280A28;
  v18 = v21;
  v12 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, &v13);
  objc_msgSend(v9, "addAction:", v12);

  -[BuddyPasscodeBaseViewController presentViewController:animated:completion:](v21, "presentViewController:animated:completion:", location, 1, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v20, 0);
}

- (void)_commitPasscodeEntryTypeChange
{
  BFFPasscodeCreationManager *v2;

  -[BuddyPasscodeBaseViewController configurePasscodeTypeUsingAnimations:](self, "configurePasscodeTypeUsingAnimations:", 1, a2);
  v2 = -[BuddyPasscodeBaseViewController passcodeManager](self, "passcodeManager");
  -[BFFPasscodeCreationManager setPasscodeState:](v2, "setPasscodeState:", 0);

}

- (id)passcodeOptionAlertController
{
  id v2;
  unsigned int v3;
  BFFPasscodeCreationManager *v4;
  id v5;
  NSBundle *v6;
  NSString *v7;
  UIAlertAction *v8;
  BOOL v9;
  id v10;
  NSBundle *v11;
  NSString *v12;
  UIAlertAction *v13;
  BFFPasscodeCreationManager *v14;
  id v15;
  id v16;
  NSBundle *v17;
  NSString *v18;
  UIAlertAction *v19;
  BOOL v20;
  id v21;
  NSBundle *v22;
  NSString *v23;
  UIAlertAction *v24;
  id v25;
  NSBundle *v26;
  NSString *v27;
  UIAlertAction *v28;
  id v29;
  NSBundle *v30;
  NSString *v31;
  UIAlertAction *v32;
  id v33;
  void **v35;
  int v36;
  int v37;
  void (*v38)(id *, void *);
  void *v39;
  BuddyPasscodeBaseViewController *v40;
  void **v41;
  int v42;
  int v43;
  void (*v44)(id *, void *);
  void *v45;
  BuddyPasscodeBaseViewController *v46;
  char v47;
  id v48;
  void **v49;
  int v50;
  int v51;
  void (*v52)(id *, void *);
  void *v53;
  BuddyPasscodeBaseViewController *v54;
  void **v55;
  int v56;
  int v57;
  void (*v58)(id *, void *);
  void *v59;
  BuddyPasscodeBaseViewController *v60;
  char v61;
  BFFPasscodeCreationManager *v62;
  char v63;
  BFFPasscodeCreationManager *v64;
  void **v65;
  int v66;
  int v67;
  void (*v68)(id *, void *);
  void *v69;
  BuddyPasscodeBaseViewController *v70;
  id location;
  unsigned int v72;
  int v73;
  SEL v74;
  BuddyPasscodeBaseViewController *v75;

  v75 = self;
  v74 = a2;
  v73 = 0;
  v2 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
  v3 = objc_msgSend(v2, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v73);

  v72 = v3;
  location = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = -[BuddyPasscodeBaseViewController passcodeManager](v75, "passcodeManager");
  LOBYTE(v3) = -[BFFPasscodeCreationManager isNumericPasscodeEntry](v4, "isNumericPasscodeEntry");

  if ((v3 & 1) != 0)
  {
    v5 = location;
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
    v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("CUSTOM_ALPHANUMERIC_CODE"), &stru_100284738, CFSTR("Localizable"));
    v65 = _NSConcreteStackBlock;
    v66 = -1073741824;
    v67 = 0;
    v68 = sub_1001BCD84;
    v69 = &unk_100280A28;
    v70 = v75;
    v8 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, &v65);
    objc_msgSend(v5, "addAction:", v8);

    objc_storeStrong((id *)&v70, 0);
  }
  v63 = 0;
  v61 = 0;
  if (!v72 || (v9 = 0, v72 == 1))
  {
    v64 = -[BuddyPasscodeBaseViewController passcodeManager](v75, "passcodeManager");
    v63 = 1;
    v9 = 1;
    if ((-[BFFPasscodeCreationManager isNumericPasscodeEntry](v64, "isNumericPasscodeEntry") & 1) != 0)
    {
      v62 = -[BuddyPasscodeBaseViewController passcodeManager](v75, "passcodeManager");
      v61 = 1;
      v9 = (uint64_t)-[BFFPasscodeCreationManager simplePasscodeEntryLength](v62, "simplePasscodeEntryLength") > 0;
    }
  }
  if ((v61 & 1) != 0)

  if ((v63 & 1) != 0)
  if (v9)
  {
    v10 = location;
    v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
    v12 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("CUSTOM_NUMERIC_CODE"), &stru_100284738, CFSTR("Localizable"));
    v55 = _NSConcreteStackBlock;
    v56 = -1073741824;
    v57 = 0;
    v58 = sub_1001BCE20;
    v59 = &unk_100280A28;
    v60 = v75;
    v13 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, &v55);
    objc_msgSend(v10, "addAction:", v13);

    objc_storeStrong((id *)&v60, 0);
  }
  if (!v72)
  {
    v14 = -[BuddyPasscodeBaseViewController passcodeManager](v75, "passcodeManager");
    v15 = -[BFFPasscodeCreationManager simplePasscodeEntryLength](v14, "simplePasscodeEntryLength");

    if (v15 != (id)6)
    {
      v16 = location;
      v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
      v18 = -[NSBundle localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", CFSTR("6_DIGIT_CODE"), &stru_100284738, CFSTR("Localizable"));
      v49 = _NSConcreteStackBlock;
      v50 = -1073741824;
      v51 = 0;
      v52 = sub_1001BCEC0;
      v53 = &unk_100280A28;
      v54 = v75;
      v19 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, &v49);
      objc_msgSend(v16, "addAction:", v19);

      objc_storeStrong((id *)&v54, 0);
    }
    v47 = 0;
    v20 = 0;
    if (!v73)
    {
      v48 = -[BuddyPasscodeBaseViewController passcodeManager](v75, "passcodeManager");
      v47 = 1;
      v20 = objc_msgSend(v48, "simplePasscodeEntryLength") != (id)4;
    }
    if ((v47 & 1) != 0)

    if (v20)
    {
      v21 = location;
      v22 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
      v23 = -[NSBundle localizedStringForKey:value:table:](v22, "localizedStringForKey:value:table:", CFSTR("4_DIGIT_CODE"), &stru_100284738, CFSTR("Localizable"));
      v41 = _NSConcreteStackBlock;
      v42 = -1073741824;
      v43 = 0;
      v44 = sub_1001BCF60;
      v45 = &unk_100280A28;
      v46 = v75;
      v24 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v23, 0, &v41);
      objc_msgSend(v21, "addAction:", v24);

      objc_storeStrong((id *)&v46, 0);
    }
  }
  if (-[BuddyPasscodeBaseViewController _allowSkip](v75, "_allowSkip"))
  {
    v25 = location;
    v26 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
    v27 = -[NSBundle localizedStringForKey:value:table:](v26, "localizedStringForKey:value:table:", CFSTR("DO_NOT_ADD_PASSCODE"), &stru_100284738, CFSTR("Localizable"));
    v35 = _NSConcreteStackBlock;
    v36 = -1073741824;
    v37 = 0;
    v38 = sub_1001BD000;
    v39 = &unk_100280A28;
    v40 = v75;
    v28 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 0, &v35);
    objc_msgSend(v25, "addAction:", v28);

    objc_storeStrong((id *)&v40, 0);
  }
  v29 = location;
  v30 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  v31 = -[NSBundle localizedStringForKey:value:table:](v30, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("Localizable"));
  v32 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v31, 1, 0);
  objc_msgSend(v29, "addAction:", v32);

  v33 = location;
  objc_storeStrong(&location, 0);
  return v33;
}

- (void)_showPasscodeOptionsSheet
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id location;
  id v8;
  id v9[2];
  BuddyPasscodeBaseViewController *v10;

  v10 = self;
  v9[1] = (id)a2;
  v9[0] = -[BuddyPasscodeBaseViewController passcodeOptionAlertController](self, "passcodeOptionAlertController");
  if ((BFFIsiPad(v9[0], v2) & 1) != 0)
  {
    objc_msgSend(v9[0], "setModalPresentationStyle:", 7);
    v8 = objc_msgSend(v9[0], "popoverPresentationController");
    location = -[BuddyPasscodeBaseViewController footerButton](v10, "footerButton");
    objc_msgSend(v8, "setPermittedArrowDirections:", 2);
    objc_msgSend(v8, "setSourceView:", location);
    objc_msgSend(location, "bounds");
    objc_msgSend(v8, "setSourceRect:", v3, v4, v5, v6);
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v8, 0);
  }
  -[BuddyPasscodeBaseViewController presentViewController:animated:completion:](v10, "presentViewController:animated:completion:", v9[0], 1, 0);
  objc_storeStrong(v9, 0);
}

- (id)_currentPasscodeInputView
{
  id v2;
  id v3;
  NSPredicate *v4;
  id v5;
  id v6;

  v2 = -[BuddyPasscodeBaseViewController contentView](self, "contentView", a2, self);
  v3 = objc_msgSend(v2, "subviews");
  v4 = +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100284460);
  v5 = objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v6 = objc_msgSend(v5, "firstObject");

  return v6;
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, a3);
}

- (NSString)userFirstName
{
  return self->_userFirstName;
}

- (void)setUserFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_userFirstName, a3);
}

- (BOOL)includeHeaderAnimation
{
  return self->_includeHeaderAnimation;
}

- (void)setIncludeHeaderAnimation:(BOOL)a3
{
  self->_includeHeaderAnimation = a3;
}

- (BuddyPasscodeBaseViewControllerDelegate)passcodeCreationDelegate
{
  return (BuddyPasscodeBaseViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_passcodeCreationDelegate);
}

- (void)setPasscodeCreationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_passcodeCreationDelegate, a3);
}

- (BFFPasscodeCreationManager)passcodeManager
{
  return self->_passcodeManager;
}

- (void)setPasscodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeManager, a3);
}

- (UIButton)footerButton
{
  return self->_footerButton;
}

- (void)setFooterButton:(id)a3
{
  objc_storeStrong((id *)&self->_footerButton, a3);
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewTopConstraint, a3);
}

- (NSLayoutConstraint)passcodeInputViewBottomConstraint
{
  return self->_passcodeInputViewBottomConstraint;
}

- (void)setPasscodeInputViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeInputViewBottomConstraint, a3);
}

- (BOOL)footerButtonIsSkip
{
  return self->_footerButtonIsSkip;
}

- (void)setFooterButtonIsSkip:(BOOL)a3
{
  self->_footerButtonIsSkip = a3;
}

- (BOOL)showingSpinner
{
  return self->_showingSpinner;
}

- (void)setShowingSpinner:(BOOL)a3
{
  self->_showingSpinner = a3;
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
  objc_storeStrong((id *)&self->_passcodeInputViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_passcodeManager, 0);
  objc_destroyWeak((id *)&self->_passcodeCreationDelegate);
  objc_storeStrong((id *)&self->_userFirstName, 0);
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, 0);
}

@end
