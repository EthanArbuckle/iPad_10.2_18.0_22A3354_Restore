@implementation BuddyProximityPasscodeValidationController

- (BuddyProximityPasscodeValidationController)init
{
  BuddyProximityPasscodeValidationController *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityPasscodeValidationController;
  location = -[BuddyProximityPasscodeValidationController initWithTitle:detailText:icon:](&v4, "initWithTitle:detailText:icon:", &stru_100284738, 0, 0);
  v2 = (BuddyProximityPasscodeValidationController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidLoad
{
  id v2;
  double v3;
  ProximitySetupController *v4;
  id v5;
  NSBundle *v6;
  id v7;
  NSString *v8;
  NSBundle *v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSBundle *v16;
  id v17;
  NSString *v18;
  NSString *v19;
  id v20;
  id v21;
  NSBundle *v22;
  NSString *v23;
  ProximitySetupController *v24;
  NSString *v25;
  id v26;
  UIFont *v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  NSArray *v42;
  id v43;
  ProximitySetupController *v44;
  SASProximityHandshake *v45;
  ProximitySetupController *v46;
  SASProximityHandshake *v47;
  unsigned int v48;
  unsigned int v49;
  BuddySimplePasscodeInputView *v50;
  BuddyComplexPasscodeInputView *v51;
  BuddyPasscodeInputView *v52;
  BuddyProximityPasscodeValidationController *v53;
  BuddyPasscodeInputView *v54;
  id v55;
  BuddyPasscodeInputView *v56;
  BuddyPasscodeInputView *v57;
  uint64_t v58;
  BuddyPasscodeInputView *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  BuddyPasscodeInputView *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  UIApplication *v69;
  double v70;
  double v71;
  BuddyPasscodeInputView *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  BuddyPasscodeInputView *v78;
  id v79;
  id v80;
  BuddyPasscodeInputView *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  NSLayoutConstraint *v86;
  NSLayoutConstraint *v87;
  NSArray *v88;
  int v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  id v96[5];
  char v97;
  id v98;
  id v99;
  id location;
  id v101;
  objc_super v102;
  SEL v103;
  BuddyProximityPasscodeValidationController *v104;
  _QWORD v105[3];
  _QWORD v106[2];

  v104 = self;
  v103 = a2;
  v102.receiver = self;
  v102.super_class = (Class)BuddyProximityPasscodeValidationController;
  -[BuddyProximityPasscodeValidationController viewDidLoad](&v102, "viewDidLoad");
  v2 = -[BuddyProximityPasscodeValidationController headerView](v104, "headerView");
  LODWORD(v3) = 1045220557;
  objc_msgSend(v2, "setTitleHyphenationFactor:", v3);

  v4 = -[BuddyProximityPasscodeValidationController proximitySetupController](v104, "proximitySetupController");
  v101 = -[ProximitySetupController deviceClass](v4, "deviceClass");

  v5 = -[BuddyProximityPasscodeValidationController headerView](v104, "headerView");
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_TITLE"), v101);
  v8 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v7, &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v5, "setTitle:", v8);

  location = 0;
  if (-[BuddyProximityPasscodeValidationController _sourceHasAppleID](v104, "_sourceHasAppleID"))
    objc_storeStrong(&location, CFSTR("PROXIMITY_PASSCODE_VALIDATION_DESCRIPTION_START_APPLEID"));
  else
    objc_storeStrong(&location, CFSTR("PROXIMITY_PASSCODE_VALIDATION_DESCRIPTION_START"));
  v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", location, v101);
  v99 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", v10, &stru_100284738, CFSTR("Localizable"));

  v97 = 0;
  v11 = 0;
  if (-[BuddyProximityPasscodeValidationController _shouldSetPasscode](v104, "_shouldSetPasscode"))
  {
    v98 = +[UIScreen mainScreen](UIScreen, "mainScreen");
    v97 = 1;
    objc_msgSend(v98, "bounds");
    v96[2] = v12;
    v96[1] = v13;
    v96[4] = v14;
    v96[3] = v15;
    v11 = *(double *)&v14 > 568.01;
  }
  if ((v97 & 1) != 0)

  if (v11)
  {
    v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_DESCRIPTION_END"));
    v18 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", v17, &stru_100284738, CFSTR("Localizable"));
    v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@\n\n%@"), v99, v18);
    v20 = v99;
    v99 = v19;

  }
  v21 = -[BuddyProximityPasscodeValidationController headerView](v104, "headerView");
  objc_msgSend(v21, "setDetailText:", v99);

  v22 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v23 = -[NSBundle localizedStringForKey:value:table:](v22, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_FOOTER_BUTTON"), &stru_100284738, CFSTR("Localizable"));
  v24 = -[BuddyProximityPasscodeValidationController proximitySetupController](v104, "proximitySetupController");
  v25 = -[ProximitySetupController deviceName](v24, "deviceName");
  v96[0] = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, v25);

  v95 = +[BuddyMultilineButton buttonWithType:](BuddyMultilineButton, "buttonWithType:", 1);
  objc_msgSend(v95, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = objc_msgSend(v95, "titleLabel");
  v27 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v26, "setFont:", v27);

  v28 = objc_msgSend(v95, "titleLabel");
  objc_msgSend(v28, "setNumberOfLines:", 0);

  v29 = objc_msgSend(v95, "titleLabel");
  objc_msgSend(v29, "setTextAlignment:", 1);

  *(_QWORD *)&v93 = sub_1001A1D68();
  *((double *)&v93 + 1) = v30;
  *(double *)&v94 = v31;
  *((double *)&v94 + 1) = v32;
  v92 = v94;
  v91 = v93;
  objc_msgSend(v95, "setContentEdgeInsets:", *(double *)&v93, v30, v31, v32);
  objc_msgSend(v95, "setTitle:forState:", v96[0], 0);
  objc_msgSend(v95, "addTarget:action:forEvents:", v104, "_footerButtonTapped:", 64);
  v33 = -[BuddyProximityPasscodeValidationController contentView](v104, "contentView");
  objc_msgSend(v33, "addSubview:", v95);

  v34 = objc_msgSend(v95, "widthAnchor");
  v35 = -[BuddyProximityPasscodeValidationController contentView](v104, "contentView");
  v36 = objc_msgSend(v35, "widthAnchor");
  v37 = objc_msgSend(v34, "constraintEqualToAnchor:multiplier:", v36, 1.0);
  v106[0] = v37;
  v38 = objc_msgSend(v95, "bottomAnchor");
  v39 = -[BuddyProximityPasscodeValidationController contentView](v104, "contentView");
  v40 = objc_msgSend(v39, "bottomAnchor");
  v41 = objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v106[1] = v41;
  v42 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v106, 2);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

  v90 = +[OBPrivacyLinkController linkWithBundleIdentifier:](OBPrivacyLinkController, "linkWithBundleIdentifier:", BYPrivacyAppleIDIdentifier);
  objc_msgSend(v90, "setModalPresentationStyle:", 2);
  objc_msgSend(v90, "setDisplayCaptionText:", 0);
  objc_msgSend(v90, "setDisplayLargeIcon:", 0);
  v43 = -[BuddyProximityPasscodeValidationController buttonTray](v104, "buttonTray");
  objc_msgSend(v43, "setPrivacyLinkController:", v90);

  v44 = -[BuddyProximityPasscodeValidationController proximitySetupController](v104, "proximitySetupController");
  v45 = -[ProximitySetupController handshake](v44, "handshake");
  LODWORD(v23) = -[SASProximityHandshake unlockType](v45, "unlockType");

  v89 = (int)v23;
  v46 = -[BuddyProximityPasscodeValidationController proximitySetupController](v104, "proximitySetupController");
  v47 = -[ProximitySetupController handshake](v46, "handshake");
  v48 = -[SASProximityHandshake simplePasscodeType](v47, "simplePasscodeType");

  if (v89)
  {
    v51 = -[BuddyComplexPasscodeInputView initWithFrame:numericOnly:]([BuddyComplexPasscodeInputView alloc], "initWithFrame:numericOnly:", v89 == 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[BuddyProximityPasscodeValidationController setPasscodeInputView:](v104, "setPasscodeInputView:", v51);

  }
  else
  {
    if (v48)
      v49 = 6;
    else
      v49 = 4;
    v50 = -[BuddySimplePasscodeInputView initWithFrame:numberOfEntryFields:]([BuddySimplePasscodeInputView alloc], "initWithFrame:numberOfEntryFields:", v49, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[BuddyProximityPasscodeValidationController setPasscodeInputView:](v104, "setPasscodeInputView:", v50);

  }
  v52 = -[BuddyProximityPasscodeValidationController passcodeInputView](v104, "passcodeInputView");
  -[BuddyPasscodeInputView setTranslatesAutoresizingMaskIntoConstraints:](v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v53 = v104;
  v54 = -[BuddyProximityPasscodeValidationController passcodeInputView](v104, "passcodeInputView");
  -[BuddyPasscodeInputView setDelegate:](v54, "setDelegate:", v53);

  v55 = -[BuddyProximityPasscodeValidationController contentView](v104, "contentView");
  v56 = -[BuddyProximityPasscodeValidationController passcodeInputView](v104, "passcodeInputView");
  objc_msgSend(v55, "addSubview:", v56);

  v57 = -[BuddyProximityPasscodeValidationController passcodeInputView](v104, "passcodeInputView");
  v58 = objc_opt_class(BuddyComplexPasscodeInputView);
  LOBYTE(v56) = objc_opt_isKindOfClass(v57, v58);

  if ((v56 & 1) != 0)
  {
    v59 = -[BuddyProximityPasscodeValidationController passcodeInputView](v104, "passcodeInputView");
    v60 = -[BuddyPasscodeInputView leadingAnchor](v59, "leadingAnchor");
    v61 = -[BuddyProximityPasscodeValidationController contentView](v104, "contentView");
    v62 = objc_msgSend(v61, "leadingAnchor");
    v63 = objc_msgSend(v60, "constraintEqualToAnchor:", v62);
    objc_msgSend(v63, "setActive:", 1);

    v64 = -[BuddyProximityPasscodeValidationController passcodeInputView](v104, "passcodeInputView");
    v65 = -[BuddyPasscodeInputView trailingAnchor](v64, "trailingAnchor");
    v66 = -[BuddyProximityPasscodeValidationController contentView](v104, "contentView");
    v67 = objc_msgSend(v66, "trailingAnchor");
    v68 = objc_msgSend(v65, "constraintEqualToAnchor:", v67);
    objc_msgSend(v68, "setActive:", 1);

  }
  v69 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  +[BuddyPasscodeBaseViewController _passcodeInputVerticalPaddingForOrientation:](BuddyPasscodeBaseViewController, "_passcodeInputVerticalPaddingForOrientation:", -[UIApplication activeInterfaceOrientation](v69, "activeInterfaceOrientation"));
  v71 = v70;

  v72 = -[BuddyProximityPasscodeValidationController passcodeInputView](v104, "passcodeInputView");
  v73 = -[BuddyPasscodeInputView topAnchor](v72, "topAnchor");
  v74 = -[BuddyProximityPasscodeValidationController contentView](v104, "contentView");
  v75 = objc_msgSend(v74, "topAnchor");
  v76 = objc_msgSend(v73, "constraintEqualToAnchor:constant:", v75, v71);
  -[BuddyProximityPasscodeValidationController setContentViewTopConstraint:](v104, "setContentViewTopConstraint:", v76);

  v77 = objc_msgSend(v95, "topAnchor");
  v78 = -[BuddyProximityPasscodeValidationController passcodeInputView](v104, "passcodeInputView");
  v79 = -[BuddyPasscodeInputView bottomAnchor](v78, "bottomAnchor");
  v80 = objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, v71);
  -[BuddyProximityPasscodeValidationController setPasscodeInputViewBottomConstraint:](v104, "setPasscodeInputViewBottomConstraint:", v80);

  v81 = -[BuddyProximityPasscodeValidationController passcodeInputView](v104, "passcodeInputView");
  v82 = -[BuddyPasscodeInputView centerXAnchor](v81, "centerXAnchor");
  v83 = -[BuddyProximityPasscodeValidationController contentView](v104, "contentView");
  v84 = objc_msgSend(v83, "centerXAnchor");
  v85 = objc_msgSend(v82, "constraintEqualToAnchor:", v84);
  v105[0] = v85;
  v86 = -[BuddyProximityPasscodeValidationController contentViewTopConstraint](v104, "contentViewTopConstraint");
  v105[1] = v86;
  v87 = -[BuddyProximityPasscodeValidationController passcodeInputViewBottomConstraint](v104, "passcodeInputViewBottomConstraint");
  v105[2] = v87;
  v88 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v105, 3);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v88);

  objc_storeStrong(&v90, 0);
  objc_storeStrong(&v95, 0);
  objc_storeStrong(v96, 0);
  objc_storeStrong(&v99, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v101, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  BuddyPasscodeInputView *v3;
  ProximitySetupController *v4;
  SASProximityHandshake *v5;
  unsigned int v6;
  id v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  id v11;
  id v12;
  objc_super v13;
  BOOL v14;
  SEL v15;
  BuddyProximityPasscodeValidationController *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BuddyProximityPasscodeValidationController;
  -[BuddyProximityPasscodeValidationController viewWillAppear:](&v13, "viewWillAppear:", a3);
  v3 = -[BuddyProximityPasscodeValidationController passcodeInputView](v16, "passcodeInputView");
  -[BuddyPasscodeInputView becomeFirstResponder](v3, "becomeFirstResponder");

  v4 = -[BuddyProximityPasscodeValidationController proximitySetupController](v16, "proximitySetupController");
  v5 = -[ProximitySetupController handshake](v4, "handshake");
  v6 = -[SASProximityHandshake unlockType](v5, "unlockType");

  if (v6)
  {
    v8 = objc_alloc((Class)UIBarButtonItem);
    v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_100284738, CFSTR("Localizable"));
    v12 = objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 2, v16, "_nextButtonTapped");

    v11 = -[BuddyProximityPasscodeValidationController navigationItem](v16, "navigationItem");
    objc_msgSend(v11, "setRightBarButtonItem:animated:", v12, v14);

    objc_storeStrong(&v12, 0);
  }
  else
  {
    v7 = -[BuddyProximityPasscodeValidationController navigationItem](v16, "navigationItem");
    objc_msgSend(v7, "setRightBarButtonItem:animated:", 0, v14);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BuddyPasscodeInputView *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyProximityPasscodeValidationController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityPasscodeValidationController;
  -[BuddyProximityPasscodeValidationController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  v3 = -[BuddyProximityPasscodeValidationController passcodeInputView](v7, "passcodeInputView");
  -[BuddyPasscodeInputView resignFirstResponder](v3, "resignFirstResponder");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, void *);
  void *v9;
  BuddyProximityPasscodeValidationController *v10;
  objc_super v11;
  id location[2];
  BuddyProximityPasscodeValidationController *v13;
  CGSize v14;

  v14 = a3;
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v11.receiver = v13;
  v11.super_class = (Class)BuddyProximityPasscodeValidationController;
  -[BuddyProximityPasscodeValidationController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v14.width, v14.height);
  v4 = location[0];
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001A2110;
  v9 = &unk_100282D20;
  v10 = v13;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", &v5, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateActions
{
  BuddyPasscodeInputView *v2;
  id v3;
  BOOL v4;
  id v5;
  id v6;
  id v7;

  v2 = -[BuddyProximityPasscodeValidationController passcodeInputView](self, "passcodeInputView");
  v3 = -[BuddyPasscodeInputView passcode](v2, "passcode");
  v4 = objc_msgSend(v3, "length") != 0;

  v5 = -[BuddyProximityPasscodeValidationController navigationItem](self, "navigationItem");
  v6 = objc_msgSend(v5, "rightBarButtonItem");
  objc_msgSend(v6, "setEnabled:", v4);

  v7 = +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  objc_msgSend(v7, "setReturnKeyEnabled:", v4);

}

- (void)_nextButtonTapped
{
  BuddyPasscodeInputView *v3;
  id v4;

  v3 = -[BuddyProximityPasscodeValidationController passcodeInputView](self, "passcodeInputView", a2, self);
  v4 = -[BuddyPasscodeInputView passcode](v3, "passcode");
  -[BuddyProximityPasscodeValidationController _validatePasscode:](self, "_validatePasscode:", v4);

}

- (void)_validatePasscode:(id)a3
{
  ProximitySetupController *v3;
  int v4;
  ProximitySetupController *v5;
  NSBundle *v6;
  id v7;
  NSBundle *v8;
  NSString *v9;
  id v10;
  id v11;
  NSString *v12;
  id v13;
  id v14;
  NSBundle *v15;
  NSString *v16;
  UIAlertAction *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void **block;
  int v24;
  int v25;
  void (*v26)(uint64_t);
  void *v27;
  BuddyProximityPasscodeValidationController *v28;
  id v29;
  int v30;
  void **v31;
  int v32;
  int v33;
  void (*v34)(id *, void *);
  void *v35;
  BuddyProximityPasscodeValidationController *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id location[2];
  BuddyProximityPasscodeValidationController *v42;

  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityPasscodeValidationController proximitySetupController](v42, "proximitySetupController");
  v4 = -[ProximitySetupController hasConnection](v3, "hasConnection");

  if (v4)
  {
    v18 = -[BuddyProximityPasscodeValidationController view](v42, "view");
    v19 = objc_msgSend(v18, "window");
    objc_msgSend(v19, "setUserInteractionEnabled:", 0);

    v20 = -[BuddyProximityPasscodeValidationController navigationController](v42, "navigationController");
    v21 = objc_msgSend(v20, "topViewController");
    +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v21, CFSTR("BUDDY_PROXIMITY_PASSCODE_VALIDATION_CONTROLLER"));

    v22 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    v24 = -1073741824;
    v25 = 0;
    v26 = sub_1001A28FC;
    v27 = &unk_100280D00;
    v28 = v42;
    v29 = location[0];
    dispatch_async(v22, &block);

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v28, 0);
    v30 = 0;
  }
  else
  {
    v5 = -[BuddyProximityPasscodeValidationController proximitySetupController](v42, "proximitySetupController");
    v40 = -[ProximitySetupController deviceClass](v5, "deviceClass");

    v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v7 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_LOST_CONNECT_ALERT_TITLE"), v40);
    v39 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v7, &stru_100284738, CFSTR("Localizable"));

    v38 = 0;
    if (-[BuddyProximityPasscodeValidationController _sourceHasAppleID](v42, "_sourceHasAppleID"))
    {
      v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_LOST_CONNECT_ALERT_DESCRIPTION_APPLEID"), &stru_100284738, CFSTR("Localizable"));
      v10 = v38;
      v38 = v9;

    }
    else
    {
      v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v11 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_LOST_CONNECT_ALERT_DESCRIPTION"));
      v12 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", v11, &stru_100284738, CFSTR("Localizable"));
      v13 = v38;
      v38 = v12;

    }
    v37 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v39, v38, 1);
    v14 = v37;
    v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v16 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_LOST_CONNECT_ALERT_BUTTON_CONTINUE"), &stru_100284738, CFSTR("Localizable"));
    v31 = _NSConcreteStackBlock;
    v32 = -1073741824;
    v33 = 0;
    v34 = sub_1001A2890;
    v35 = &unk_100280A28;
    v36 = v42;
    v17 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, &v31);
    objc_msgSend(v14, "addAction:", v17);

    -[BuddyProximityPasscodeValidationController presentViewController:animated:completion:](v42, "presentViewController:animated:completion:", v37, 1, 0);
    v30 = 1;
    objc_storeStrong((id *)&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v40, 0);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_shouldSetPasscode
{
  MCProfileConnection *v2;
  unsigned __int8 v3;
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  char v8;

  v2 = -[BuddyProximityPasscodeValidationController managedConfiguration](self, "managedConfiguration");
  v3 = -[MCProfileConnection isPasscodeSet](v2, "isPasscodeSet");

  v8 = v3 & 1;
  v4 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
  v5 = objc_msgSend(v4, "hasCloudConfiguration");

  v6 = 0;
  if ((v8 & 1) == 0)
    return !(v5 & 1);
  return v6;
}

- (BOOL)_sourceHasAppleID
{
  ProximitySetupController *v2;
  SASProximityInformation *v3;
  id v4;
  BOOL v5;

  v2 = -[BuddyProximityPasscodeValidationController proximitySetupController](self, "proximitySetupController", a2, self);
  v3 = -[ProximitySetupController information](v2, "information");
  v4 = -[SASProximityInformation appleID](v3, "appleID");
  v5 = v4 != 0;

  return v5;
}

- (void)_footerButtonTapped:(id)a3
{
  ProximitySetupController *v3;
  NSBundle *v4;
  id v5;
  NSBundle *v6;
  id v7;
  NSString *v8;
  id v9;
  NSBundle *v10;
  NSString *v11;
  id v12;
  NSBundle *v13;
  id v14;
  id v15;
  NSString *v16;
  id v17;
  NSBundle *v18;
  id v19;
  NSString *v20;
  NSString *v21;
  id v22;
  NSBundle *v23;
  NSString *v24;
  UIAlertAction *v25;
  id v26;
  UIAlertAction *v27;
  void **v28;
  int v29;
  int v30;
  void (*v31)(id *, void *);
  void *v32;
  BuddyProximityPasscodeValidationController *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id location[2];
  BuddyProximityPasscodeValidationController *v40;

  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityPasscodeValidationController proximitySetupController](v40, "proximitySetupController");
  v38 = -[ProximitySetupController deviceClass](v3, "deviceClass");

  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v5 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_TITLE"), v38);
  v37 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("Localizable"));

  v36 = 0;
  v35 = 0;
  if (-[BuddyProximityPasscodeValidationController _sourceHasAppleID](v40, "_sourceHasAppleID"))
  {
    v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v7 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_DESCRIPTION_APPLEID"), v38);
    v8 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v7, &stru_100284738, CFSTR("Localizable"));
    v9 = v36;
    v36 = v8;

    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_BUTTON_SIGN_IN_MANUALLY"), &stru_100284738, CFSTR("Localizable"));
  }
  else
  {
    v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v14 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_DESCRIPTION_START_WIFI"));
    v15 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", v14, v38);
    v16 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", v15, &stru_100284738, CFSTR("Localizable"));
    v17 = v36;
    v36 = v16;

    v18 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v19 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_DESCRIPTION_END"));
    v20 = -[NSBundle localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", v19, &stru_100284738, CFSTR("Localizable"));
    v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@%@"), v36, v20);
    v22 = v36;
    v36 = v21;

    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_BUTTON_SET_UP_MANUALLY"), &stru_100284738, CFSTR("Localizable"));
  }
  v12 = v35;
  v35 = v11;

  v34 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v37, v36, 1);
  v23 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v24 = -[NSBundle localizedStringForKey:value:table:](v23, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_PASSCODE_VALIDATION_FORGOT_ALERT_BUTTON_TRY"), &stru_100284738, CFSTR("Localizable"));
  v25 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 1, 0);
  objc_msgSend(v34, "addAction:", v25);

  v26 = v34;
  v28 = _NSConcreteStackBlock;
  v29 = -1073741824;
  v30 = 0;
  v31 = sub_1001A355C;
  v32 = &unk_100280A28;
  v33 = v40;
  v27 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v35, 0, &v28);
  objc_msgSend(v26, "addAction:", v27);

  -[BuddyProximityPasscodeValidationController presentViewController:animated:completion:](v40, "presentViewController:animated:completion:", v34, 1, 0);
  objc_storeStrong((id *)&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  ProximitySetupController *v3;
  char v4;
  ProximitySetupController *v5;
  void **v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  BuddyProximityPasscodeValidationController *v11;
  id v12;
  int v13;
  id location[2];
  BuddyProximityPasscodeValidationController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityPasscodeValidationController proximitySetupController](v15, "proximitySetupController");
  v4 = !-[ProximitySetupController hasConnection](v3, "hasConnection");

  if ((v4 & 1) != 0)
  {
    if (location[0])
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v13 = 1;
  }
  else
  {
    v5 = -[BuddyProximityPasscodeValidationController proximitySetupController](v15, "proximitySetupController");
    v6 = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_1001A382C;
    v10 = &unk_100281078;
    v11 = v15;
    v12 = location[0];
    -[ProximitySetupController waitForIntent:](v5, "waitForIntent:", &v6);

    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
    v13 = 0;
  }
  objc_storeStrong(location, 0);
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

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
  id v5;
  id location[2];
  BuddyProximityPasscodeValidationController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BuddyProximityPasscodeValidationController _updateActions](v7, "_updateActions");
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  id v5;
  id v6;
  id location[2];
  BuddyProximityPasscodeValidationController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = objc_msgSend(location[0], "passcodeField");
  objc_msgSend(v5, "forceDisplayIfNeeded");

  -[BuddyProximityPasscodeValidationController _validatePasscode:](v8, "_validatePasscode:", v6);
  objc_storeStrong(&v6, 0);
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

- (BuddyPasscodeInputView)passcodeInputView
{
  return (BuddyPasscodeInputView *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPasscodeInputView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeInputViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_passcodeInputView, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
