@implementation BKUIFingerprintEnrollViewController

- (BKUIFingerprintEnrollViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BKUIFingerprintEnrollViewController *v4;
  os_log_t v5;
  OS_os_log *bkui_result_delegate_log;
  os_log_t v7;
  OS_os_log *bkui_biometric_kit_delegate_log;
  os_log_t v9;
  OS_os_log *bkui_fingerprint_enroll_view_controller_log;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKUIFingerprintEnrollViewController;
  v4 = -[BKUIFingerprintEnrollViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = os_log_create("com.apple.biometrickitui", "ResultDelegate");
    bkui_result_delegate_log = v4->bkui_result_delegate_log;
    v4->bkui_result_delegate_log = (OS_os_log *)v5;

    v7 = os_log_create("com.apple.biometrickitui", "BiometricKitDelegate");
    bkui_biometric_kit_delegate_log = v4->bkui_biometric_kit_delegate_log;
    v4->bkui_biometric_kit_delegate_log = (OS_os_log *)v7;

    v9 = os_log_create("com.apple.biometrickitui", "FingerprintEnrollViewController");
    bkui_fingerprint_enroll_view_controller_log = v4->bkui_fingerprint_enroll_view_controller_log;
    v4->bkui_fingerprint_enroll_view_controller_log = (OS_os_log *)v9;

  }
  return v4;
}

- (BOOL)isModalInPresentation
{
  float currentProgress;
  void *v3;

  currentProgress = self->_currentProgress;
  -[BKUIFingerprintEnrollViewController bkIdentity](self, "bkIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return currentProgress != 0.0 || v3 != 0;
}

- (void)dealloc
{
  objc_super v3;

  -[BKUIFingerprintEnrollViewController _stopMessageTimer](self, "_stopMessageTimer");
  -[BKEnrollTouchIDOperation cancel](self->_bkEnroll, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)BKUIFingerprintEnrollViewController;
  -[BKUIFingerprintEnrollViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIFingerprintEnrollViewController;
  -[BKUIFingerprintEnrollViewController loadView](&v5, sel_loadView);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerprintEnrollViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[BKUIFingerprintEnrollViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 15);
}

- (void)constructAlertView
{
  BKUIAlertView *v3;
  BKUIAlertView *alertView;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  float v11;
  double v12;
  UIView *v13;
  UIView *alertHudView;
  void *v15;
  double alertHudCorners;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *alertHudText;
  UILabel *v22;
  void *v23;
  UIView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIView *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UIView *v37;
  void *v38;
  void *v39;
  void *v40;
  UIView *v41;
  void *v42;
  UIView *v43;
  void *v44;
  void *v45;
  id v46;

  if (!self->_alertView)
  {
    v3 = objc_alloc_init(BKUIAlertView);
    alertView = self->_alertView;
    self->_alertView = v3;

    if (-[BKUIFingerprintEnrollViewController _useAlertHud](self, "_useAlertHud"))
    {
      +[BKUIBundleSettings floatForUserDefaultsKey:](BKUIBundleSettings, "floatForUserDefaultsKey:", CFSTR("fpEnrollAlertHudWhite"));
      if (v5 == 0.0)
        v5 = 0.9;
      self->_alertHudWhite = v5;
      +[BKUIBundleSettings floatForUserDefaultsKey:](BKUIBundleSettings, "floatForUserDefaultsKey:", CFSTR("fpEnrollAlertHudAlpha"));
      if (v6 == 0.0)
        v6 = 0.8;
      self->_alertHudAlpha = v6;
      +[BKUIBundleSettings floatForUserDefaultsKey:](BKUIBundleSettings, "floatForUserDefaultsKey:", CFSTR("fpEnrollAlertHudCorners"));
      if (v7 == 0.0)
        v7 = 10.0;
      self->_alertHudCorners = v7;
      +[BKUIBundleSettings floatForUserDefaultsKey:](BKUIBundleSettings, "floatForUserDefaultsKey:", CFSTR("fpEnrollAlertHudBorder"));
      if (v8 == 0.0)
        v8 = 30.0;
      self->_alertHudBorder = v8;
      +[BKUIBundleSettings floatForUserDefaultsKey:](BKUIBundleSettings, "floatForUserDefaultsKey:", CFSTR("fpEnrollAlertHudTimeout"));
      -[BKUIAlertView setAlertHudTimeout:](self->_alertView, "setAlertHudTimeout:", v9);
      -[BKUIAlertView alertHudTimeout](self->_alertView, "alertHudTimeout");
      if (v10 == 0.0)
        -[BKUIAlertView setAlertHudTimeout:](self->_alertView, "setAlertHudTimeout:", 3.0);
      +[BKUIBundleSettings floatForUserDefaultsKey:](BKUIBundleSettings, "floatForUserDefaultsKey:", CFSTR("fpEnrollAlertHudMinDisplayTime"));
      -[BKUIAlertView setAlertHudMinDisplayTime:](self->_alertView, "setAlertHudMinDisplayTime:", v11);
      -[BKUIAlertView alertHudMinDisplayTime](self->_alertView, "alertHudMinDisplayTime");
      if (v12 == 0.0)
        -[BKUIAlertView setAlertHudMinDisplayTime:](self->_alertView, "setAlertHudMinDisplayTime:", 1.0);
      v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      alertHudView = self->_alertHudView;
      self->_alertHudView = v13;

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_alertHudView, "setBackgroundColor:", v15);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_alertHudView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      alertHudCorners = self->_alertHudCorners;
      -[UIView layer](self->_alertHudView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCornerRadius:", alertHudCorners);

      -[UIView layer](self->_alertHudView, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMasksToBounds:", 1);

      -[BKUIFingerprintEnrollViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", self->_alertHudView);

      -[UIView setHidden:](self->_alertHudView, "setHidden:", 1);
      v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
      alertHudText = self->_alertHudText;
      self->_alertHudText = v20;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_alertHudText, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v22 = self->_alertHudText;
      -[BKUIFingerprintEnrollViewController _subtitleFont](self, "_subtitleFont");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v22, "setFont:", v23);

      -[UILabel setNumberOfLines:](self->_alertHudText, "setNumberOfLines:", 0);
      -[UILabel setTextAlignment:](self->_alertHudText, "setTextAlignment:", 1);
      -[UIView addSubview:](self->_alertHudView, "addSubview:", self->_alertHudText);
      -[BKUIAlertView setAlertHudView:](self->_alertView, "setAlertHudView:", self->_alertHudView);
      -[BKUIAlertView setAlertHudText:](self->_alertView, "setAlertHudText:", self->_alertHudText);
    }
    v24 = self->_alertHudView;
    if (v24)
    {
      -[UIView widthAnchor](v24, "widthAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "contentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "widthAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setActive:", 1);

      -[BKUIFingerprintEnrollViewController view](self, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0CB3718];
      v32 = self->_alertHudView;
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 9, 0, v33, 9, 1.0, 0.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addConstraint:", v34);

      -[BKUIFingerprintEnrollViewController view](self, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_alertHudView, 10, 0, self->_mesaFirstEnrollView, 10, 1.0, 0.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addConstraint:", v36);

      v37 = self->_alertHudView;
      v38 = (void *)MEMORY[0x1E0CB3718];
      _NSDictionaryOfVariableBindings(CFSTR("_alertHudText"), self->_alertHudText, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_alertHudText]-|"), 0, 0, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraints:](v37, "addConstraints:", v40);

      v41 = self->_alertHudView;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_alertHudText, 9, 0, v41, 9, 1.0, 0.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v41, "addConstraint:", v42);

      v43 = self->_alertHudView;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_alertHudText, 10, 0, v43, 10, 1.0, 0.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v43, "addConstraint:", v44);

      -[BKUIFingerprintEnrollViewController view](self, "view");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_alertHudView, 8, 0, self->_alertHudText, 8, 1.0, self->_alertHudBorder);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addConstraint:", v45);

    }
  }
}

- (void)createEnrollUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BKUIFingerPrintEnrollTutorialViewController *v7;
  _BOOL8 inBuddy;
  void *v9;
  void *v10;
  id v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BKUICurvesView *v25;
  BKUICurvesView *mesaFirstEnrollView;
  BKUICurvesView *v27;
  BKUICurvesView *mesaSecondEnrollView;
  uint64_t v29;
  BKUICurvesView *v30;
  void *v31;
  BKUICurvesView *v32;
  void *v33;
  BKUIFingerPrintEnrollmentPhaseViewController *v34;
  _BOOL8 v35;
  _BOOL8 v36;
  _BOOL8 v37;
  void *v38;
  id v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  _QWORD v108[10];

  v108[8] = *MEMORY[0x1E0C80C00];
  -[BKUIFingerprintEnrollViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BKUIFingerprintEnrollViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

  }
  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [BKUIFingerPrintEnrollTutorialViewController alloc];
      inBuddy = self->_inBuddy;
      -[BKUIFingerprintEnrollViewController parentViewController](self, "parentViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v11 = -[BKUIFingerPrintEnrollTutorialViewController initInBuddy:displayRect:](v7, "initInBuddy:displayRect:", inBuddy);
      -[BKUIFingerprintEnrollViewController setTutorialController:](self, "setTutorialController:", v11);

      v12 = -[BKUIFingerprintEnrollViewController followUPEnrollmentUpSell](self, "followUPEnrollmentUpSell");
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShowFollowUpEnrollmentUpSellContent:", v12);

      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController addChildViewController:](self, "addChildViewController:", v16);

      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      objc_msgSend(v18, "setFrame:");

      -[BKUIFingerprintEnrollViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", v22);

      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "didMoveToParentViewController:", self);

      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setDelegate:", self);

      v25 = objc_alloc_init(BKUICurvesView);
      mesaFirstEnrollView = self->_mesaFirstEnrollView;
      self->_mesaFirstEnrollView = v25;

      -[BKUICurvesView setTranslatesAutoresizingMaskIntoConstraints:](self->_mesaFirstEnrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v27 = objc_alloc_init(BKUICurvesView);
      mesaSecondEnrollView = self->_mesaSecondEnrollView;
      self->_mesaSecondEnrollView = v27;

      -[BKUICurvesView setTranslatesAutoresizingMaskIntoConstraints:](self->_mesaSecondEnrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = self->_mesaFirstEnrollView;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.8, 0.8, 0.8, 1.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUICurvesView loadDataFromXML:name:color:](v30, "loadDataFromXML:name:color:", v29, CFSTR("drawing"), v31);

      -[BKUICurvesView setSpeed:](self->_mesaFirstEnrollView, "setSpeed:", &unk_1EA298CB8);
      v32 = self->_mesaSecondEnrollView;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.8, 0.8, 0.8, 1.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = (void *)v29;
      -[BKUICurvesView loadDataFromXML:name:color:](v32, "loadDataFromXML:name:color:", v29, CFSTR("extended"), v33);

      -[BKUICurvesView setSpeed:](self->_mesaSecondEnrollView, "setSpeed:", &unk_1EA298CB8);
      v34 = [BKUIFingerPrintEnrollmentPhaseViewController alloc];
      v35 = self->_inBuddy;
      v36 = -[BKUIFingerprintEnrollViewController _shouldHideUnlockMessage](self, "_shouldHideUnlockMessage");
      v37 = -[BKUIFingerprintEnrollViewController followUPEnrollmentUpSell](self, "followUPEnrollmentUpSell");
      -[BKUIFingerprintEnrollViewController _placeFingerString](self, "_placeFingerString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[BKUIFingerPrintEnrollmentPhaseViewController initInBuddy:hideUnlockMessage:showFollowUpSell:headerTitle:firstEnrollView:secondEnrollView:](v34, "initInBuddy:hideUnlockMessage:showFollowUpSell:headerTitle:firstEnrollView:secondEnrollView:", v35, v36, v37, v38, self->_mesaFirstEnrollView, self->_mesaSecondEnrollView);
      -[BKUIFingerprintEnrollViewController setEnrollmentControlller:](self, "setEnrollmentControlller:", v39);

      v40 = -[BKUIFingerprintEnrollViewController followUPEnrollmentUpSell](self, "followUPEnrollmentUpSell");
      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setShouldShowFollowupFingerEnrollmentUpSell:", v40);

      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController addChildViewController:](self, "addChildViewController:", v44);

      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "view");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bounds");
      objc_msgSend(v46, "setFrame:");

      -[BKUIFingerprintEnrollViewController view](self, "view");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "view");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addSubview:", v50);

      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "didMoveToParentViewController:", self);

      -[BKUIFingerprintEnrollViewController view](self, "view");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "view");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "bringSubviewToFront:", v54);

      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setDelegate:", self);

      v86 = (void *)MEMORY[0x1E0CB3718];
      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "view");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "leadingAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "leadingAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "constraintEqualToAnchor:", v102);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v101;
      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "view");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "trailingAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "trailingAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintEqualToAnchor:", v96);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v108[1] = v95;
      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "view");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "topAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "topAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "constraintEqualToAnchor:", v90);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v108[2] = v89;
      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "view");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "bottomAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "bottomAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "constraintEqualToAnchor:", v83);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v108[3] = v82;
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "view");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "leadingAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "leadingAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "constraintEqualToAnchor:", v77);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v108[4] = v76;
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "view");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "trailingAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "trailingAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "constraintEqualToAnchor:", v71);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v108[5] = v70;
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "view");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "topAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "topAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v108[6] = v57;
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "view");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "bottomAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v108[7] = v63;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 8);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "activateConstraints:", v64);

      -[BKUIFingerprintEnrollViewController constructAlertView](self, "constructAlertView");
      if (self->_alertHudView)
      {
        -[BKUIFingerprintEnrollViewController view](self, "view");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "bringSubviewToFront:", self->_alertHudView);

      }
    }
  }
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BKDeviceTouchID *v11;
  id v12;
  BKDeviceTouchID *bkDevice;
  NSObject *bkui_biometric_kit_delegate_log;
  void *v15;
  void *v16;
  void *v17;
  BioStreamsEventHelper *v18;
  __int128 v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)BKUIFingerprintEnrollViewController;
  -[BKUIFingerprintEnrollViewController viewDidLoad](&v25, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D02800], "availableDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v5 = 138412290;
    v19 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", v19) == 1)
        {
          v20 = v7;
          objc_msgSend(MEMORY[0x1E0D027E8], "deviceWithDescriptor:error:", v10, &v20);
          v11 = (BKDeviceTouchID *)objc_claimAutoreleasedReturnValue();
          v12 = v20;

          bkDevice = self->_bkDevice;
          self->_bkDevice = v11;

          if (v12)
          {
            bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
            if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v19;
              v27 = v12;
              _os_log_fault_impl(&dword_1DB281000, bkui_biometric_kit_delegate_log, OS_LOG_TYPE_FAULT, "BKDevice failed to create. Error: %@", buf, 0xCu);
            }
            v7 = v12;
          }
          else
          {
            v7 = 0;
          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  +[BKUIBundleSettings setDefaultSettingsValues](BKUIBundleSettings, "setDefaultSettingsValues");
  -[BiometricKitUIEnrollViewController propertyForKey:](self, "propertyForKey:", CFSTR("IN_BUDDY"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_inBuddy = objc_msgSend(v15, "BOOLValue");

  if (!+[BKUIBundleSettings BOOLForUserDefaultsKey:](BKUIBundleSettings, "BOOLForUserDefaultsKey:", CFSTR("hideEnrollTapScreenMessage")))
  {
    -[BKUIFingerprintEnrollViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerprintEnrollViewController _setTapRecognizer:](self, "_setTapRecognizer:", v16);

  }
  -[BKUIFingerprintEnrollViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRightBarButtonItem:", 0);

  self->_mesaEnrollCompactContainer = 0;
  self->_displayingFirstTitle = 1;
  self->_cancelForRestart = 0;
  v18 = -[BioStreamsEventHelper initWithBKDeviceType:inBuddy:]([BioStreamsEventHelper alloc], "initWithBKDeviceType:inBuddy:", 1, self->_inBuddy);
  -[BKUIFingerprintEnrollViewController setBioStreamEventHelper:](self, "setBioStreamEventHelper:", v18);

}

- (void)respondToTapGesture:(id)a3
{
  void *v3;
  void *v4;
  _BOOL4 enrollmentPhaseTwo;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  BKUIAlertView *alertView;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if ((self->_enrollInProgress || self->_matchInProgress)
    && -[BKUIAlertView isAlertHidden](self->_alertView, "isAlertHidden"))
  {
    enrollmentPhaseTwo = self->_enrollmentPhaseTwo;
    if (self->_enrollmentPhaseTwo)
    {
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isHidden"))
        goto LABEL_10;
    }
    objc_msgSend(v17, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationInView:", v7);
    v9 = v8;
    -[BKUIFingerprintEnrollViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11 - (double)self->_ignoreTouchOffset;

    if (enrollmentPhaseTwo)
    {

    }
    if (v9 < v12)
    {
      alertView = self->_alertView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SET_UP_MESA"), &stru_1EA281248, CFSTR("BiometricKitUI"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController _deviceAwareLocalizedStringForKey:](self, "_deviceAwareLocalizedStringForKey:", CFSTR("TOUCH_AND_COVER"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA281248, CFSTR("BiometricKitUI"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIAlertView show:message:cancelButtonTitle:viewController:](alertView, "show:message:cancelButtonTitle:viewController:", v4, v14, v16, self);

LABEL_10:
    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  unsigned int userid;
  const char *v9;
  unsigned int v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  unsigned int v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  self->_didDisappear = 0;
  -[BKUIFingerprintEnrollViewController createEnrollUI](self, "createEnrollUI");
  -[BiometricKitUIEnrollViewController propertyForKey:](self, "propertyForKey:", CFSTR("userid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BiometricKitUIEnrollViewController propertyForKey:](self, "propertyForKey:", CFSTR("userid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_userid = objc_msgSend(v6, "unsignedIntegerValue");

    bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
    if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
    {
      userid = self->_userid;
      *(_DWORD *)buf = 67109120;
      v14 = userid;
      v9 = "BiometricKitUI: Custom userid is set to %d";
LABEL_6:
      _os_log_impl(&dword_1DB281000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, v9, buf, 8u);
    }
  }
  else
  {
    self->_userid = getuid();
    bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
    if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_userid;
      *(_DWORD *)buf = 67109120;
      v14 = v10;
      v9 = "BiometricKitUI: Default user is set to %d";
      goto LABEL_6;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)BKUIFingerprintEnrollViewController;
  -[BKUIFingerprintEnrollViewController viewWillAppear:](&v12, sel_viewWillAppear_, v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x1E0CEB358], 0);

  -[BKUIFingerprintEnrollViewController _resetUI](self, "_resetUI");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUIFingerprintEnrollViewController;
  -[BKUIBundleEnrollViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  if (!self->_enrollInProgress)
  {
    -[BKUIFingerprintEnrollViewController _startEnrollOperation](self, "_startEnrollOperation");
    -[BKUIFingerprintEnrollViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    -[BKUIFingerprintEnrollViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setReachabilitySupported:forReason:", 0, CFSTR("BKUI TouchID enrollment"));

  }
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0D651B8], "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)didSelectPrimaryButton:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[BKUIFingerprintEnrollViewController tutorialContinueButtonPressed:](self, "tutorialContinueButtonPressed:", self);
    return;
  }
  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "enrollViewState") == 3)
  {

LABEL_6:
    -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:](self, "_cancelEnrollmentAndRestart:", 1);
    -[BKUIFingerprintEnrollViewController _resetUI](self, "_resetUI");
    -[BKUIFingerprintEnrollViewController restartEnroll](self, "restartEnroll");
    self->_cancelForRestart = 1;
    return;
  }
  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "enrollViewState");

  if (v8 == 4)
    goto LABEL_6;
  if (-[BKUIFingerprintEnrollViewController followUPEnrollmentUpSell](self, "followUPEnrollmentUpSell")
    && (-[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "shouldShowFollowupFingerEnrollmentUpSell"),
        v9,
        v10))
  {
    -[BKUIFingerprintEnrollViewController showSecondFingerEnrollmentUpSell](self, "showSecondFingerEnrollmentUpSell");
    -[BKUIFingerprintEnrollViewController bkIdentity](self, "bkIdentity");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerprintEnrollViewController setFirstFollowUpIdentity:](self, "setFirstFollowUpIdentity:", v11);

  }
  else
  {
    -[BKUIFingerprintEnrollViewController enrollDoneContinueButtonPressed](self, "enrollDoneContinueButtonPressed");
  }
}

- (void)showSecondFingerEnrollmentUpSell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsSecondEnrollment:", 1);

  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowFollowupFingerEnrollmentUpSell:", 0);

  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsSecondEnrollment:", 1);

  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnrollViewState:", 0);

  -[BKUIFingerprintEnrollViewController _requestNewAuthToken](self, "_requestNewAuthToken");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__BKUIFingerprintEnrollViewController_showSecondFingerEnrollmentUpSell__block_invoke;
  v7[3] = &unk_1EA27FB98;
  v7[4] = self;
  -[BKUIFingerprintEnrollViewController transitionToTutorialView:completion:](self, "transitionToTutorialView:completion:", 1, v7);
}

void __71__BKUIFingerprintEnrollViewController_showSecondFingerEnrollmentUpSell__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;

  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 1240), OS_LOG_TYPE_DEBUG))
    __71__BKUIFingerprintEnrollViewController_showSecondFingerEnrollmentUpSell__block_invoke_cold_1();
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[1112] || v2[1019] || v2[1113])
  {
    v2[1080] = 1;
    objc_msgSend(*(id *)(a1 + 32), "_stopBiometricOperations");
    v2 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v2, "setFingerOn:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setWaitForFingerLift:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_resetUIWithTransitionToTutorial:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_startEnrollOperation");
  objc_msgSend(*(id *)(a1 + 32), "enrollmentControlller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnrollViewState:", 0);

}

- (void)didSelectSecondaryButton:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  if (-[BKUIFingerprintEnrollViewController followUPEnrollmentUpSell](self, "followUPEnrollmentUpSell", a3))
  {
    -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "showFollowUpEnrollmentUpSellContent") & 1) != 0)
    {
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isSecondEnrollment");

      if (v6)
      {
        -[BKUIFingerprintEnrollViewController enrollDoneContinueButtonPressed](self, "enrollDoneContinueButtonPressed");
        return;
      }
    }
    else
    {

    }
  }
  -[BKUIFingerprintEnrollViewController tutorialSkipButtonPressed:](self, "tutorialSkipButtonPressed:", self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUIFingerprintEnrollViewController;
  -[BKUIBundleEnrollViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[BKUIFingerprintEnrollViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setReachabilitySupported:forReason:", 1, CFSTR("BKUI TouchID enrollment done."));

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  self->_didDisappear = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB288], 0);

  if (self->_showLiftYourFingerMsg)
  {
    self->_showLiftYourFingerMsg = 0;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showLiftYourFinger, 0);
  }
  -[BKUIFingerprintEnrollViewController _stopBiometricOperations](self, "_stopBiometricOperations");
  v13.receiver = self;
  v13.super_class = (Class)BKUIFingerprintEnrollViewController;
  -[BKUIFingerprintEnrollViewController viewDidDisappear:](&v13, sel_viewDidDisappear_, v3);
  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeTouchIndicator");

  -[BKUIFingerprintEnrollViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)applicationWillResignActive:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BKIdentity *bkIdentity;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG))
    -[BKUIFingerprintEnrollViewController applicationWillResignActive:].cold.1();
  if (self->_showLiftYourFingerMsg)
  {
    self->_showLiftYourFingerMsg = 0;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showLiftYourFinger, 0);
  }
  -[BKUIFingerprintEnrollViewController _stopBiometricOperations](self, "_stopBiometricOperations");
  v5 = MEMORY[0x1E0C809B0];
  if (self->_bkIdentity)
  {
    -[BKUIFingerprintEnrollViewController bkDevice](self, "bkDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    bkIdentity = self->_bkIdentity;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke;
    v12[3] = &unk_1EA2801C0;
    v12[4] = self;
    objc_msgSend(v6, "removeIdentity:reply:", bkIdentity, v12);

  }
  -[BKUIFingerprintEnrollViewController firstFollowUpIdentity](self, "firstFollowUpIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BKUIFingerprintEnrollViewController bkDevice](self, "bkDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerprintEnrollViewController firstFollowUpIdentity](self, "firstFollowUpIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke_80;
    v11[3] = &unk_1EA2801C0;
    v11[4] = self;
    objc_msgSend(v9, "removeIdentity:reply:", v10, v11);

  }
}

void __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1240);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke_cold_1(v6);
  }

}

void __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke_80(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1240);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke_cold_1(v6);
  }

}

- (void)_stopBiometricOperations
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Stopping Biometric Operations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)enrollProgress:(id)a3
{
  id v4;
  NSObject *bkui_biometric_kit_delegate_log;
  void *v6;
  void *v7;
  BOOL v8;
  int v9;
  BKUIAlertView *alertView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
  if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_DEBUG))
    -[BKUIFingerprintEnrollViewController enrollProgress:].cold.1(bkui_biometric_kit_delegate_log, v4);
  if (self->_didDisappear || objc_msgSend(v4, "progress") > 254)
    goto LABEL_20;
  if (objc_msgSend(v4, "message") == 1)
  {
    objc_msgSend(v4, "messageDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D02840]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "integerValue"))
    {
      v8 = +[BKUIBundleSettings BOOLForUserDefaultsKey:](BKUIBundleSettings, "BOOLForUserDefaultsKey:", CFSTR("hideEnrollNewComponentMessage"));

      if (!v8)
      {
        v9 = self->_movedFingerCount + 1;
        self->_movedFingerCount = v9;
        if (v9 == self->_movedFingerThr)
        {
          self->_movedFingerCount = 0;
          if (!self->_movedFingerAlertShown)
          {
            if (-[BKUIAlertView isAlertHidden](self->_alertView, "isAlertHidden"))
            {
              self->_movedFingerAlertShown = 1;
              alertView = self->_alertView;
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FINGER_MOVED"), &stru_1EA281248, CFSTR("BiometricKitUI"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              v15 = CFSTR("DONT_MOVE_MUCH");
LABEL_18:
              objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1EA281248, CFSTR("BiometricKitUI"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA281248, CFSTR("BiometricKitUI"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[BKUIAlertView show:message:cancelButtonTitle:viewController:](alertView, "show:message:cancelButtonTitle:viewController:", v12, v17, v19, self);

              goto LABEL_19;
            }
          }
        }
        goto LABEL_20;
      }
    }
    else
    {

    }
  }
  self->_movedFingerCount = 0;
  objc_msgSend(v4, "messageDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D02848]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "integerValue") != 1)
  {
LABEL_19:

    goto LABEL_20;
  }
  v16 = +[BKUIBundleSettings BOOLForUserDefaultsKey:](BKUIBundleSettings, "BOOLForUserDefaultsKey:", CFSTR("hideEnrollStillFingerMessage"));

  if (!v16 && !self->_stillFingerAlertShown && -[BKUIAlertView isAlertHidden](self->_alertView, "isAlertHidden"))
  {
    self->_stillFingerAlertShown = 1;
    alertView = self->_alertView;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MOVE_FINGER_TITLE"), &stru_1EA281248, CFSTR("BiometricKitUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("MOVE_FINGER");
    goto LABEL_18;
  }
LABEL_20:
  -[BKUIFingerprintEnrollViewController _enrollHapticFeedback:](self, "_enrollHapticFeedback:", v4);

}

- (void)_enrollHapticFeedback:(id)a3
{
  unsigned int v3;
  id v4;

  v4 = a3;
  if (!+[BKUIBundleSettings isFpEnrollHapticFeedbackDisabled](BKUIBundleSettings, "isFpEnrollHapticFeedbackDisabled"))
  {
    v3 = objc_msgSend(v4, "message");
    if (v3 <= 3)
      +[BKUIUtils vibrateForBiometricEvent:](BKUIUtils, "vibrateForBiometricEvent:", (0xEu >> (v3 & 0xF)) & 1);
  }

}

- (void)_hapticFeedback:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!+[BKUIBundleSettings isFpEnrollHapticFeedbackDisabled](BKUIBundleSettings, "isFpEnrollHapticFeedbackDisabled"))+[BKUIUtils vibrateForBiometricEvent:](BKUIUtils, "vibrateForBiometricEvent:", v3);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  self->_displayingFirstTitle ^= 1u;
}

- (void)statusMessage:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  unint64_t v6;
  NSObject *bkui_biometric_kit_delegate_log;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  BKUIFingerprintEnrollViewController *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BKUIFingerprintEnrollViewController *v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;
  objc_super v30;
  objc_super v31;
  objc_super v32;
  objc_super v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v3 = *(_QWORD *)&a3;
  v38 = *MEMORY[0x1E0C80C00];
  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enrollViewState");

  if (v6 > 1)
    return;
  bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
  if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_INFO))
  {
    v8 = bkui_biometric_kit_delegate_log;
    +[BKUIUtils nameForMessage:](BKUIUtils, "nameForMessage:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v35 = v3;
    v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_INFO, "BiometricKitUI: statusMessage = %3d (%@)", buf, 0x12u);

  }
  if ((_DWORD)v3 == 64 && self->_showLiftYourFingerMsg)
  {
    self->_showLiftYourFingerMsg = 0;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showLiftYourFinger, 0);
LABEL_8:
    -[BKUIFingerprintEnrollViewController setFingerOn:](self, "setFingerOn:", 0);
    -[BKUIFingerprintEnrollViewController setWaitForFingerLift:](self, "setWaitForFingerLift:", 0);
    goto LABEL_9;
  }
  if ((_DWORD)v3 == 64)
    goto LABEL_8;
  if ((_DWORD)v3 == 63)
    -[BKUIFingerprintEnrollViewController setFingerOn:](self, "setFingerOn:", 1);
LABEL_9:
  +[BKUIUtils resetScreenDimming](BKUIUtils, "resetScreenDimming");
  if (self->_waitInProgress)
  {
    if ((_DWORD)v3 == 63)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", self->_enrollmentEndTime);
      v12 = v11;

      if (v12 > 1.5)
      {
        -[BKUIFingerprintEnrollViewController _cancelEnrollmentMatch](self, "_cancelEnrollmentMatch");
        -[BKUIFingerprintEnrollViewController _sendEnrollResult:identity:](self, "_sendEnrollResult:identity:", 4, 0);
      }
    }
    return;
  }
  if ((_DWORD)v3 == 90 && self->_cancelForRestart)
  {
    self->_cancelForRestart = 0;
    if (!self->_enrollmentPhaseTwo)
    {
      v31.receiver = self;
      v31.super_class = (Class)BKUIFingerprintEnrollViewController;
      -[BKUIBundleEnrollViewController statusMessage:](&v31, sel_statusMessage_, 90);
LABEL_17:
      -[BKUIBundleEnrollViewController afterStatusMessage:](&v30, sel_afterStatusMessage_, v3, self, BKUIFingerprintEnrollViewController);
      return;
    }
LABEL_21:
    -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isHidden");

    if (v15)
    {
      v33.receiver = self;
      v33.super_class = (Class)BKUIFingerprintEnrollViewController;
      -[BKUIBundleEnrollViewController statusMessage:](&v33, sel_statusMessage_, v3);
      if ((int)v3 <= 67)
      {
        switch((_DWORD)v3)
        {
          case '3':
            -[BKUIFingerprintEnrollViewController _cancelEnrollmentMatch](self, "_cancelEnrollmentMatch");
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            v20 = CFSTR("ENROLL_FAILED");
LABEL_47:
            objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1EA281248, CFSTR("BiometricKitUI"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = self;
            v23 = 2;
LABEL_48:
            -[BKUIFingerprintEnrollViewController _failEnrollment:withMessage:](v22, "_failEnrollment:withMessage:", v23, v21);

            break;
          case '?':
            *(float *)&v16 = 1.0 / (float)self->_mesaEnrollSecondPhaseSteps;
            -[BKUICurvesView estimateProgress:](self->_mesaSecondEnrollView, "estimateProgress:", v16);
            break;
          case '@':
            -[BKUIFingerprintEnrollViewController initPromptMessage](self, "initPromptMessage");
            break;
        }
      }
      else
      {
        switch((int)v3)
        {
          case 'J':
            -[BKUIFingerprintEnrollViewController _showLiftYourFingerWithDelay](self, "_showLiftYourFingerWithDelay");
            break;
          case 'K':
          case 'L':
          case 'M':
          case 'O':
          case 'Q':
          case 'R':
          case 'S':
          case 'T':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
            break;
          case 'N':
          case 'U':
          case 'V':
          case 'W':
          case 'X':
            goto LABEL_24;
          case 'P':
            if (self->_cancelForRestart)
            {
              self->_cancelForRestart = 0;
              break;
            }
            -[BKUIFingerprintEnrollViewController _cancelEnrollmentMatch](self, "_cancelEnrollmentMatch");
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCELED"), &stru_1EA281248, CFSTR("BiometricKitUI"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = self;
            v23 = 3;
            goto LABEL_48;
          case ']':
            -[BKUIFingerprintEnrollViewController _showDirtOnSensorAlertView](self, "_showDirtOnSensorAlertView");
            break;
          default:
            if ((_DWORD)v3 == 68)
            {
              -[BKUIFingerprintEnrollViewController _cancelEnrollmentMatch](self, "_cancelEnrollmentMatch");
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              v20 = CFSTR("TIMEOUT");
              goto LABEL_47;
            }
            if ((_DWORD)v3 == 98)
LABEL_24:
              -[BKUICurvesView estimateFailed](self->_mesaSecondEnrollView, "estimateFailed");
            break;
        }
      }
      v32.receiver = self;
      v32.super_class = (Class)BKUIFingerprintEnrollViewController;
      -[BKUIBundleEnrollViewController afterStatusMessage:](&v32, sel_afterStatusMessage_, v3, v30.receiver, v30.super_class);
    }
    return;
  }
  if (self->_enrollmentPhaseTwo)
    goto LABEL_21;
  if (v3 < 0x64)
  {
    v31.receiver = self;
    v31.super_class = (Class)BKUIFingerprintEnrollViewController;
    -[BKUIBundleEnrollViewController statusMessage:](&v31, sel_statusMessage_, v3);
    switch((int)v3)
    {
      case '?':
        if (!self->_cancelForRestart)
        {
          -[BKUIFingerprintEnrollViewController _stopTutorialTransitionToEnrollView](self, "_stopTutorialTransitionToEnrollView");
          LODWORD(v17) = 1039516303;
          -[BKUICurvesView estimateProgress:](self->_mesaFirstEnrollView, "estimateProgress:", v17);
        }
        goto LABEL_17;
      case '@':
        if (self->_smallCoverageMessage)
        {
          self->_smallCoverageMessage = 0;
          self->_smallCoverageInRowCount = 0;
        }
        -[BKUIFingerprintEnrollViewController initPromptMessage](self, "initPromptMessage");
        goto LABEL_17;
      case 'A':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'K':
      case 'L':
      case 'M':
        goto LABEL_17;
      case 'B':
        if (self->_cancelForRestart)
        {
          self->_cancelForRestart = 0;
        }
        else
        {
          -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:](self, "_cancelEnrollmentAndRestart:", 0);
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CANCELED"), &stru_1EA281248, CFSTR("BiometricKitUI"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = self;
          v27 = 3;
LABEL_67:
          -[BKUIFingerprintEnrollViewController _failEnrollment:withMessage:](v26, "_failEnrollment:withMessage:", v27, v25);

        }
        return;
      case 'C':
        -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:](self, "_cancelEnrollmentAndRestart:", 0);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("ENROLL_FAILED"), &stru_1EA281248, CFSTR("BiometricKitUI"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = self;
        v27 = 2;
        goto LABEL_67;
      case 'D':
        -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:](self, "_cancelEnrollmentAndRestart:", 0);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("TIMEOUT"), &stru_1EA281248, CFSTR("BiometricKitUI"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = self;
        v27 = 6;
        goto LABEL_67;
      case 'J':
        -[BKUIFingerprintEnrollViewController _showLiftYourFingerWithDelay](self, "_showLiftYourFingerWithDelay");
        goto LABEL_17;
      case 'N':
        goto LABEL_39;
      default:
        if ((v3 - 85) > 0xD)
          goto LABEL_17;
        if (((1 << (v3 - 85)) & 0x200D) != 0)
          goto LABEL_39;
        if ((_DWORD)v3 == 86)
        {
          if (self->_smallCoverageMessage)
          {
            v28 = self->_smallCoverageInRowCount + 1;
            self->_smallCoverageInRowCount = v28;
            if (v28 == 5)
            {
              self->_smallCoverageInRowCount = 0;
              self->_smallCoverageCount = 0;
              -[BKUIFingerprintEnrollViewController _showSmallCoverageAlertView](self, "_showSmallCoverageAlertView");
            }
          }
          else
          {
            self->_smallCoverageMessage = 1;
            self->_smallCoverageInRowCount = 1;
            v29 = self->_smallCoverageCount + 1;
            self->_smallCoverageCount = v29;
            if (v29 == self->_maxSmallCoverageCount)
            {
              self->_smallCoverageCount = 0;
              -[BKUIFingerprintEnrollViewController _showSmallCoverageAlertView](self, "_showSmallCoverageAlertView");
            }
LABEL_39:
            -[BKUICurvesView estimateFailed](self->_mesaFirstEnrollView, "estimateFailed");
          }
        }
        else if ((_DWORD)v3 == 93)
        {
          -[BKUIFingerprintEnrollViewController _showDirtOnSensorAlertView](self, "_showDirtOnSensorAlertView");
        }
        goto LABEL_17;
    }
  }
  -[BKUIFingerprintEnrollViewController handleProgress:](self, "handleProgress:", v3);
}

- (void)_showDirtOnSensorAlertView
{
  BKUIAlertView *alertView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!self->_didDisappear)
  {
    if (-[BKUIAlertView isAlertHidden](self->_alertView, "isAlertHidden"))
    {
      alertView = self->_alertView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DIRT_ON_SENSOR_TITLE"), &stru_1EA281248, CFSTR("BiometricKitUI"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController _deviceAwareLocalizedStringForKey:](self, "_deviceAwareLocalizedStringForKey:", CFSTR("DIRT_ON_SENSOR"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA281248, CFSTR("BiometricKitUI"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIAlertView show:message:cancelButtonTitle:viewController:](alertView, "show:message:cancelButtonTitle:viewController:", v4, v5, v7, self);

    }
  }
}

- (void)_showSmallCoverageAlertView
{
  BKUIAlertView *alertView;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_didDisappear)
  {
    if (-[BKUIAlertView isAlertHidden](self->_alertView, "isAlertHidden"))
    {
      alertView = self->_alertView;
      -[BKUIFingerprintEnrollViewController _deviceAwareLocalizedStringForKey:](self, "_deviceAwareLocalizedStringForKey:", CFSTR("COVER_SENSOR_TITLE"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController _deviceAwareLocalizedStringForKey:](self, "_deviceAwareLocalizedStringForKey:", CFSTR("COVER_SENSOR"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA281248, CFSTR("BiometricKitUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIAlertView show:message:cancelButtonTitle:viewController:](alertView, "show:message:cancelButtonTitle:viewController:", v7, v4, v6, self);

    }
  }
}

- (void)handleProgress:(unsigned int)a3
{
  float v4;
  float v5;
  double v6;
  id v7;

  v4 = (double)(a3 - 100) / 255.0;
  if (v4 == 1.0)
  {
    self->_currentProgress = 1.0;
  }
  else
  {
    v5 = (1.0 - self->_currentProgress) / (v4 * -8.0 + 10.0) + self->_currentProgress;
    self->_currentProgress = v5;
  }
  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = self->_currentProgress;
  objc_msgSend(v7, "setEnrollProgress:enrollView:", self->_mesaFirstEnrollView, v6);

}

- (void)_cancelEnrollmentAndRestart:(BOOL)a3
{
  NSObject *bkui_fingerprint_enroll_view_controller_log;

  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG))
    -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:].cold.1(a3, bkui_fingerprint_enroll_view_controller_log);
  -[BKUIFingerprintEnrollViewController _stopMessageTimer](self, "_stopMessageTimer");
  if (self->_enrollInProgress)
  {
    -[BKEnrollTouchIDOperation cancel](self->_bkEnroll, "cancel");
    self->_enrollInProgress = 0;
  }
  self->_restartRequest = a3;
}

- (void)_restartEnrollment
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Restarting enrollment", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setTapRecognizer:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CEAA88];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithTarget:action:", self, sel_respondToTapGesture_);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v5, "addGestureRecognizer:", v6);

}

- (void)_startTutorial:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 enrollmentPhaseTwo;
  void *v6;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)self->bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG))
    -[BKUIFingerprintEnrollViewController _startTutorial:].cold.1();
  enrollmentPhaseTwo = self->_enrollmentPhaseTwo;
  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnrollViewState:", enrollmentPhaseTwo);

  -[BKUIFingerprintEnrollViewController _transitionToTutorialView:](self, "_transitionToTutorialView:", v3);
}

- (void)enrollDoneContinueButtonPressed
{
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  uint8_t v4[16];

  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB281000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Continue Button Pressed", v4, 2u);
  }
  if (self->_waitInProgress)
    -[BKUIFingerprintEnrollViewController _cancelEnrollmentMatch](self, "_cancelEnrollmentMatch");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_restartEnroll, 0);
  -[BKUIFingerprintEnrollViewController _sendEnrollResult:identity:](self, "_sendEnrollResult:identity:", 4, 0);
}

- (void)skipEnrollmentPressed:(id)a3
{
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  uint8_t v5[16];

  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB281000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Skip enrollment pressed", v5, 2u);
  }
  -[BKUIFingerprintEnrollViewController _skipEnrollment](self, "_skipEnrollment");
}

- (void)_skipEnrollment
{
  id v3;

  -[BKUIFingerprintEnrollViewController _sendEnrollResult:identity:](self, "_sendEnrollResult:identity:", 3, self->_bkIdentity);
  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTouchIndicator");

}

- (void)restartEnrollPressed:(id)a3
{
  -[BKUIFingerprintEnrollViewController _sendEnrollResult:identity:](self, "_sendEnrollResult:identity:", 9, self->_bkIdentity);
  -[BKUIFingerprintEnrollViewController restartEnroll](self, "restartEnroll");
}

- (void)_cancelEnrollmentMatch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Canceling enroll match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)homeButtonPressed
{
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  _BOOL4 didDisappear;
  BKUIAlertView *alertView;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  void *v12;
  int v13;
  int v14;
  BKUIAlertView *v15;
  void (**v16)(void);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _DWORD v26[2];
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    didDisappear = self->_didDisappear;
    alertView = self->_alertView;
    v6 = bkui_fingerprint_enroll_view_controller_log;
    LODWORD(alertView) = -[BKUIAlertView isAlertHidden](alertView, "isAlertHidden");
    -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = 67109632;
    v26[1] = didDisappear;
    v27 = 1024;
    v28 = (int)alertView;
    v29 = 1024;
    v30 = objc_msgSend(v8, "isHidden");
    _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: WillDisappear %d, alerthidden %d, tutorialhidden %d", (uint8_t *)v26, 0x14u);

  }
  if (self->_inBuddy && -[BKUIFingerprintEnrollViewController _topTouchButtonIpad](self, "_topTouchButtonIpad"))
  {
    -[BKUIFingerprintEnrollViewController menuAction](self, "menuAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[BKUIFingerprintEnrollViewController menuAction](self, "menuAction");
      v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v10[2]();
LABEL_7:

    }
  }
  else if (!self->_didDisappear)
  {
    if (-[BKUIAlertView isAlertHidden](self->_alertView, "isAlertHidden"))
    {
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isHidden");

      if (v13)
      {
        v14 = MGGetBoolAnswer();
        v15 = self->_alertView;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v10 = v16;
        if (v14)
        {
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TOUCH_LIGHT"), &stru_1EA281248, CFSTR("BiometricKitUI-SSHB"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LESS_FORCE"), &stru_1EA281248, CFSTR("BiometricKitUI-SSHB"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA281248, CFSTR("BiometricKitUI"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKUIAlertView show:message:cancelButtonTitle:viewController:](v15, "show:message:cancelButtonTitle:viewController:", v17, v19, v21, self);

        }
        else
        {
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("YOU_CLICKED"), &stru_1EA281248, CFSTR("BiometricKitUI"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKUIFingerprintEnrollViewController _deviceAwareLocalizedStringForKey:](self, "_deviceAwareLocalizedStringForKey:", CFSTR("REST_NOT_CLICK"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA281248, CFSTR("BiometricKitUI"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKUIAlertView show:message:cancelButtonTitle:viewController:](v15, "show:message:cancelButtonTitle:viewController:", v22, v23, v25, self);

        }
        goto LABEL_7;
      }
    }
  }
}

- (void)_cancelActiveEnrollOperation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Canceling active enroll operation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)restartEnroll
{
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  uint8_t v4[16];

  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB281000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Restarting enroll", v4, 2u);
  }
  -[BKUIFingerprintEnrollViewController _restartEnrollment](self, "_restartEnrollment");
  if (self->_enrollInProgress)
    -[BKUIFingerprintEnrollViewController _startInitialTutorialAnimated:](self, "_startInitialTutorialAnimated:", 1);
}

- (void)cancelEnroll
{
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  uint8_t v4[16];

  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB281000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Canceling enroll", v4, 2u);
  }
  -[BKUIFingerprintEnrollViewController _cancelActiveEnrollOperation](self, "_cancelActiveEnrollOperation");
}

- (id)bundleAlertView
{
  return self->_alertView;
}

- (void)_showLiftYourFingerWithDelay
{
  self->_showLiftYourFingerMsg = 1;
  -[BKUIFingerprintEnrollViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__showLiftYourFinger, 0, self->_liftFingerMsgDelay);
}

- (void)_showLiftYourFinger
{
  id v3;

  if (self->_showLiftYourFingerMsg)
  {
    self->_showLiftYourFingerMsg = 0;
    -[BKUIFingerprintEnrollViewController _liftFingerString](self, "_liftFingerString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerprintEnrollViewController _animateHeaderTitle:](self, "_animateHeaderTitle:", v3);

  }
}

- (void)_startInitialTutorialAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)self->bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG))
    -[BKUIFingerprintEnrollViewController _startInitialTutorialAnimated:].cold.1();
  -[BKUIFingerprintEnrollViewController bkDevice](self, "bkDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[BKUIFingerprintEnrollViewController _bkDeviceIdentityCount](self, "_bkDeviceIdentityCount"))
    {
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isHidden");

      if ((v8 & 1) == 0)
        -[BKUIFingerprintEnrollViewController _transitionToEnrollView:](self, "_transitionToEnrollView:", v3);
    }
    else
    {
      -[BKUIFingerprintEnrollViewController _startTutorial:](self, "_startTutorial:", v3);
    }
  }
}

- (id)_subtitleFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v5 = (void *)MEMORY[0x1E0CEA5E8];
    goto LABEL_5;
  }
  v5 = (void *)MEMORY[0x1E0CEA5E8];
  if (!self->_inBuddy)
  {
LABEL_5:
    v6 = 18.0;
    goto LABEL_6;
  }
  v6 = 20.0;
LABEL_6:
  objc_msgSend(v5, "systemFontOfSize:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_showSkipEnrollmentAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];

  self->_cancelForRestart = 1;
  -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:](self, "_cancelEnrollmentAndRestart:", 0);
  v3 = (void *)MGCopyAnswer();
  v20 = (void *)MEMORY[0x1E0CEA2E8];
  v21 = v3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SKIP_ENROLLMENT_TITLE"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SKIP_ENROLLMENT_DESCRIPTION_"), "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA281248, CFSTR("BiometricKitUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "alertControllerWithTitle:message:preferredStyle:", v5, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DONT_USE"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __63__BKUIFingerprintEnrollViewController__showSkipEnrollmentAlert__block_invoke;
  v23[3] = &unk_1EA27FCF0;
  v23[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SET_UP_TOUCH_ID"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __63__BKUIFingerprintEnrollViewController__showSkipEnrollmentAlert__block_invoke_2;
  v22[3] = &unk_1EA27FCF0;
  v22[4] = self;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v15);
  objc_msgSend(v10, "addAction:", v19);
  objc_msgSend(v10, "setPreferredAction:", v19);
  -[BKUIFingerprintEnrollViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

uint64_t __63__BKUIFingerprintEnrollViewController__showSkipEnrollmentAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_skipEnrollment");
}

void __63__BKUIFingerprintEnrollViewController__showSkipEnrollmentAlert__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_requestNewAuthToken");
  objc_msgSend(*(id *)(a1 + 32), "_startEnrollOperation");
  objc_msgSend(*(id *)(a1 + 32), "enrollmentControlller");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnrollViewState:", 0);

}

- (void)_sendEnrollResult:(int)a3 identity:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *bkui_result_delegate_log;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  bkui_result_delegate_log = self->bkui_result_delegate_log;
  if (os_log_type_enabled(bkui_result_delegate_log, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1DB281000, bkui_result_delegate_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Sending Enroll Result Delegate: \"%i\" with identity: \"%@\", (uint8_t *)v13, 0x12u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[BiometricKitUIEnrollViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v4;
    v11 = v6;
LABEL_5:
    objc_msgSend(v8, "enrollResult:bkIdentity:", v10, v11);

    goto LABEL_7;
  }
  if (!v6)
  {
    -[BKUIFingerprintEnrollViewController bkDevice](self, "bkDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[BiometricKitUIEnrollViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = v4;
      v11 = 0;
      goto LABEL_5;
    }
  }
LABEL_7:

}

- (void)_requestNewAuthToken
{
  void *v3;
  char v4;
  id v5;

  -[BiometricKitUIEnrollViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[BiometricKitUIEnrollViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "generateAuthToken");

  }
}

- (void)_startEnrollOperation
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1DB281000, v0, v1, "Failed to create BKEnrollOperation Error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_startExtendEnrollOperation
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1DB281000, v0, v1, "BiometricKitUI: BiometricKit extend enroll failed. Error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)enrollOperation:(id)a3 progressedWithTouchIDInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *bkui_biometric_kit_delegate_log;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  BKUIAlertView *alertView;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
  if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = bkui_biometric_kit_delegate_log;
    *(_DWORD *)buf = 134218240;
    v25 = objc_msgSend(v7, "progress");
    v26 = 1024;
    v27 = objc_msgSend(v7, "message");
    _os_log_impl(&dword_1DB281000, v9, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Enroll progress: %li and message: %u", buf, 0x12u);

  }
  if (self->_didDisappear || objc_msgSend(v7, "progress") > 254)
    goto LABEL_20;
  if (objc_msgSend(v7, "message") == 1)
  {
    objc_msgSend(v7, "messageDetails");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D02840]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "integerValue"))
    {
      v12 = +[BKUIBundleSettings BOOLForUserDefaultsKey:](BKUIBundleSettings, "BOOLForUserDefaultsKey:", CFSTR("hideEnrollNewComponentMessage"));

      if (!v12)
      {
        v13 = self->_movedFingerCount + 1;
        self->_movedFingerCount = v13;
        if (v13 == self->_movedFingerThr)
        {
          self->_movedFingerCount = 0;
          if (!self->_movedFingerAlertShown)
          {
            if (-[BKUIAlertView isAlertHidden](self->_alertView, "isAlertHidden"))
            {
              self->_movedFingerAlertShown = 1;
              alertView = self->_alertView;
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FINGER_MOVED"), &stru_1EA281248, CFSTR("BiometricKitUI"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v16;
              v18 = CFSTR("DONT_MOVE_MUCH");
LABEL_18:
              objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1EA281248, CFSTR("BiometricKitUI"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA281248, CFSTR("BiometricKitUI"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[BKUIAlertView show:message:cancelButtonTitle:viewController:](alertView, "show:message:cancelButtonTitle:viewController:", v15, v20, v22, self);

              goto LABEL_19;
            }
          }
        }
        goto LABEL_20;
      }
    }
    else
    {

    }
  }
  self->_movedFingerCount = 0;
  objc_msgSend(v7, "messageDetails");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D02848]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "integerValue") != 1)
  {
LABEL_19:

    goto LABEL_20;
  }
  v19 = +[BKUIBundleSettings BOOLForUserDefaultsKey:](BKUIBundleSettings, "BOOLForUserDefaultsKey:", CFSTR("hideEnrollStillFingerMessage"));

  if (!v19 && !self->_stillFingerAlertShown && -[BKUIAlertView isAlertHidden](self->_alertView, "isAlertHidden"))
  {
    self->_stillFingerAlertShown = 1;
    alertView = self->_alertView;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MOVE_FINGER_TITLE"), &stru_1EA281248, CFSTR("BiometricKitUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("MOVE_FINGER");
    goto LABEL_18;
  }
LABEL_20:
  -[BKUIFingerprintEnrollViewController _enrollHapticFeedback:](self, "_enrollHapticFeedback:", v7);

}

- (void)enrollOperation:(id)a3 percentCompleted:(int64_t)a4
{
  double v5;
  id v6;

  self->_bkProgress = a4;
  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (double)self->_bkProgress / 100.0;
  *(float *)&v5 = v5;
  objc_msgSend(v6, "setEnrollProgress:enrollView:", self->_mesaFirstEnrollView, v5);

}

- (void)enrollOperation:(id)a3 finishedWithIdentity:(id)a4
{
  BKIdentity *v5;
  NSDate *v6;
  NSDate *enrollmentEndTime;
  BKIdentity *bkIdentity;
  BKIdentity *v9;
  void *v10;
  void *v11;

  v5 = (BKIdentity *)a4;
  self->_enrollInProgress = 0;
  -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:](self, "_cancelEnrollmentAndRestart:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  enrollmentEndTime = self->_enrollmentEndTime;
  self->_enrollmentEndTime = v6;

  self->_enrollmentPhaseTwo = 1;
  self->_currentProgress = 0.0;
  bkIdentity = self->_bkIdentity;
  self->_bkIdentity = v5;
  v9 = v5;

  -[BKUIAlertView hideAnimated:](self->_alertView, "hideAnimated:", 1);
  -[BKUIFingerprintEnrollViewController bioStreamEventHelper](self, "bioStreamEventHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendSuccessfulEnrollEvent");

  -[BKUIFingerprintEnrollViewController _sendEnrollResult:identity:](self, "_sendEnrollResult:identity:", 1, v9);
  -[BKUIFingerprintEnrollViewController _startTutorial:](self, "_startTutorial:", 1);
  -[BKUIFingerprintEnrollViewController bkDevice](self, "bkDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[BKUIFingerprintEnrollViewController _startExtendEnrollOperation](self, "_startExtendEnrollOperation");
}

- (void)enrollOperation:(id)a3 failedWithReason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  BKUIFingerprintEnrollViewController *v11;
  uint64_t v12;
  id v13;

  v6 = a3;
  switch(a4)
  {
    case 1:
      if (!self->_cancelForRestart)
      {
        v13 = v6;
        -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:](self, "_cancelEnrollmentAndRestart:", 0);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CANCELED"), &stru_1EA281248, CFSTR("BiometricKitUI"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = self;
        v12 = 3;
        goto LABEL_9;
      }
      self->_cancelForRestart = 0;
      break;
    case 2:
      v13 = v6;
      -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:](self, "_cancelEnrollmentAndRestart:", 0);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("FAILED");
      goto LABEL_8;
    case 3:
      v13 = v6;
      -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:](self, "_cancelEnrollmentAndRestart:", 0);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("TIMEOUT");
LABEL_8:
      objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1EA281248, CFSTR("BiometricKitUI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = 2;
LABEL_9:
      -[BKUIFingerprintEnrollViewController _failEnrollment:withMessage:](v11, "_failEnrollment:withMessage:", v12, v10);

      v6 = v13;
      break;
  }

}

- (void)fingerprintCaptureOperation:(id)a3 encounteredCaptureError:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  objc_super v12;

  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->bkui_biometric_kit_delegate_log, OS_LOG_TYPE_ERROR))
      -[BKUIFingerprintEnrollViewController fingerprintCaptureOperation:encounteredCaptureError:].cold.1();
    switch(a4)
    {
      case 1:
      case 3:
      case 4:
      case 5:
      case 6:
        if (self->_enrollmentPhaseTwo)
        {
          v9 = 1144;
          goto LABEL_7;
        }
        -[BKUICurvesView estimateFailed](self->_mesaFirstEnrollView, "estimateFailed");
        v12.receiver = self;
        v12.super_class = (Class)BKUIFingerprintEnrollViewController;
        -[BKUIBundleEnrollViewController statusMessage:](&v12, sel_statusMessage_, 78);
        break;
      case 2:
        if (self->_smallCoverageMessage)
        {
          v10 = self->_smallCoverageInRowCount + 1;
          self->_smallCoverageInRowCount = v10;
          if (v10 == 5)
          {
            self->_smallCoverageInRowCount = 0;
            self->_smallCoverageCount = 0;
            -[BKUIFingerprintEnrollViewController _showSmallCoverageAlertView](self, "_showSmallCoverageAlertView");
          }
        }
        else
        {
          self->_smallCoverageMessage = 1;
          self->_smallCoverageInRowCount = 1;
          v11 = self->_smallCoverageCount + 1;
          self->_smallCoverageCount = v11;
          if (v11 == self->_maxSmallCoverageCount)
          {
            self->_smallCoverageCount = 0;
            -[BKUIFingerprintEnrollViewController _showSmallCoverageAlertView](self, "_showSmallCoverageAlertView");
          }
          v9 = 1136;
LABEL_7:
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v9), "estimateFailed");
        }
        break;
      case 7:
        -[BKUIFingerprintEnrollViewController _showDirtOnSensorAlertView](self, "_showDirtOnSensorAlertView");
        break;
      default:
        return;
    }
  }
}

- (void)extendEnroll:(id)a3 hasUpdated:(BOOL)a4
{
  void *v6;
  void *v7;
  int v8;
  NSObject *bkui_biometric_kit_delegate_log;
  double currentProgress;
  float v11;
  void *v12;
  double v13;
  int v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  if (v8)
  {
    -[BKUIFingerprintEnrollViewController _hapticFeedback:](self, "_hapticFeedback:", 1);
    self->_currentProgress = self->_currentProgress + (float)(1.0 / (float)(self->_mesaEnrollSecondPhaseSteps << !a4));
    bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
    if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_INFO))
    {
      currentProgress = self->_currentProgress;
      v14 = 134217984;
      v15 = currentProgress;
      _os_log_impl(&dword_1DB281000, bkui_biometric_kit_delegate_log, OS_LOG_TYPE_INFO, "BiometricKitUI: Extende enroll result current progress: %f", (uint8_t *)&v14, 0xCu);
    }
    v11 = self->_currentProgress;
    if (v11 > 1.0)
      v11 = 1.0;
    self->_currentProgress = v11;
    -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v13 = self->_currentProgress;
    objc_msgSend(v12, "setEnrollProgress:enrollView:", self->_mesaSecondEnrollView, v13);

    if (self->_currentProgress == 1.0)
      -[BKUIFingerprintEnrollViewController _cancelEnrollmentMatch](self, "_cancelEnrollmentMatch");
  }
}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  BKUIFingerprintEnrollViewController *v9;
  uint64_t v10;
  id v11;

  v6 = a3;
  if (self->_enrollmentPhaseTwo)
  {
    v11 = v6;
    self->_showLiftYourFingerMsg = 0;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showLiftYourFinger, 0);
    if ((unint64_t)(a4 - 3) >= 2)
    {
      v6 = v11;
      if (a4 != 2)
        goto LABEL_10;
      if (self->_currentProgress >= 1.0)
      {
        -[BKUIFingerprintEnrollViewController _finishEnrollmentPhaseTwo](self, "_finishEnrollmentPhaseTwo");
        goto LABEL_5;
      }
      if (self->_cancelForRestart)
      {
        self->_cancelForRestart = 0;
        goto LABEL_10;
      }
      -[BKUIFingerprintEnrollViewController _cancelEnrollmentMatch](self, "_cancelEnrollmentMatch");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CANCELED"), &stru_1EA281248, CFSTR("BiometricKitUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = 3;
    }
    else
    {
      -[BKUIFingerprintEnrollViewController _cancelEnrollmentMatch](self, "_cancelEnrollmentMatch");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FAILED"), &stru_1EA281248, CFSTR("BiometricKitUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = 2;
    }
    -[BKUIFingerprintEnrollViewController _failEnrollment:withMessage:](v9, "_failEnrollment:withMessage:", v10, v8);

LABEL_5:
    v6 = v11;
  }
LABEL_10:

}

- (void)operation:(id)a3 stateChanged:(int64_t)a4
{
  if (a4 == 5)
  {
    -[BKUIFingerprintEnrollViewController _showLiftYourFingerWithDelay](self, "_showLiftYourFingerWithDelay", a3);
  }
  else if (a4 == 2 && self->_cancelForRestart)
  {
    self->_cancelForRestart = 0;
  }
}

- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  int v8;
  double v9;
  BKUICurvesView *mesaSecondEnrollView;
  void *v11;
  void *v12;
  int v13;
  objc_super v14;

  v4 = a4;
  +[BKUIUtils resetScreenDimming](BKUIUtils, "resetScreenDimming", a3);
  if (v4)
  {
    if (self->_enrollmentPhaseTwo)
    {
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isHidden");

      if (v8)
      {
        mesaSecondEnrollView = self->_mesaSecondEnrollView;
        *(float *)&v9 = 1.0 / (float)self->_mesaEnrollSecondPhaseSteps;
LABEL_13:
        -[BKUICurvesView estimateProgress:](mesaSecondEnrollView, "estimateProgress:", v9);
        return;
      }
      if (self->_enrollmentPhaseTwo)
        return;
    }
    if (self->_cancelForRestart)
      return;
    -[BKUIFingerprintEnrollViewController _stopTutorialTransitionToEnrollView](self, "_stopTutorialTransitionToEnrollView");
    mesaSecondEnrollView = self->_mesaFirstEnrollView;
    LODWORD(v9) = 1039516303;
    goto LABEL_13;
  }
  if (self->_showLiftYourFingerMsg)
  {
    self->_showLiftYourFingerMsg = 0;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showLiftYourFinger, 0);
  }
  if (!self->_enrollmentPhaseTwo)
    goto LABEL_20;
  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isHidden");

  if (v13)
  {
    -[BKUIFingerprintEnrollViewController initPromptMessage](self, "initPromptMessage");
    return;
  }
  if (!self->_enrollmentPhaseTwo)
  {
LABEL_20:
    if (self->_smallCoverageMessage)
    {
      self->_smallCoverageMessage = 0;
      self->_smallCoverageInRowCount = 0;
    }
    -[BKUIFingerprintEnrollViewController initPromptMessage](self, "initPromptMessage");
    v14.receiver = self;
    v14.super_class = (Class)BKUIFingerprintEnrollViewController;
    -[BKUIBundleEnrollViewController afterStatusMessage:](&v14, sel_afterStatusMessage_, 64);
  }
}

- (void)_resetUI
{
  -[BKUIFingerprintEnrollViewController _resetUIWithTransitionToTutorial:](self, "_resetUIWithTransitionToTutorial:", 1);
}

- (void)_resetUIWithTransitionToTutorial:(BOOL)a3
{
  _BOOL4 v3;
  float v5;
  double v6;
  float v7;
  double v8;
  BOOL v9;
  double v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  float v15;
  double v16;
  BOOL v17;
  double v18;
  int64_t v19;
  int64_t v20;
  int v21;
  int v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)self->bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG))
    -[BKUIFingerprintEnrollViewController _resetUIWithTransitionToTutorial:].cold.1();
  self->_currentProgress = 0.0;
  self->_showLiftYourFingerMsg = 0;
  self->_smallCoverageMessage = 0;
  self->_smallCoverageCount = 0;
  self->_smallCoverageInRowCount = 0;
  +[BKUIBundleSettings floatForUserDefaultsKey:](BKUIBundleSettings, "floatForUserDefaultsKey:", CFSTR("fpEnrollMsgTransLength"));
  self->_msgTransLength = v5;
  if (v5 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEAB98], "defaultDurationForTransition:", 1);
    self->_msgTransLength = v6;
  }
  +[BKUIBundleSettings floatForUserDefaultsKey:](BKUIBundleSettings, "floatForUserDefaultsKey:", CFSTR("fpEnrollMsgShowTimeout"));
  v8 = v7;
  v9 = v7 > 0.0;
  v10 = 0.5;
  if (v9)
    v10 = v8;
  self->_msgShowTimeout = v10;
  v11 = +[BKUIBundleSettings integerForUserDefaultsKey:](BKUIBundleSettings, "integerForUserDefaultsKey:", CFSTR("fpEnrollIgnoreTouchOffset"));
  v12 = 40;
  if (v11)
    v12 = v11;
  self->_ignoreTouchOffset = v12;
  v13 = +[BKUIBundleSettings integerForUserDefaultsKey:](BKUIBundleSettings, "integerForUserDefaultsKey:", CFSTR("fpEnrollSecondPhaseSteps"));
  v14 = 6;
  if (v13)
    v14 = v13;
  self->_mesaEnrollSecondPhaseSteps = v14;
  +[BKUIBundleSettings floatForUserDefaultsKey:](BKUIBundleSettings, "floatForUserDefaultsKey:", CFSTR("fpEnrollLiftFingerMsgDelay"));
  v16 = v15;
  v17 = v15 == 0.0;
  v18 = 1.5;
  if (!v17)
    v18 = v16;
  self->_liftFingerMsgDelay = v18;
  v19 = +[BKUIBundleSettings integerForUserDefaultsKey:](BKUIBundleSettings, "integerForUserDefaultsKey:", CFSTR("fpMaxSmallCoverageCount"));
  if (v19)
    v20 = v19;
  else
    v20 = 3;
  self->_maxSmallCoverageCount = v20;
  v21 = +[BKUIBundleSettings integerForUserDefaultsKey:](BKUIBundleSettings, "integerForUserDefaultsKey:", CFSTR("fpMovedFingerCount"));
  self->_movedFingerThr = v21;
  if (!v21)
  {
    if (MGGetSInt32Answer() == 2)
      v22 = 5;
    else
      v22 = 3;
    self->_movedFingerThr = v22;
  }
  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = 0;
  objc_msgSend(v23, "setEnrollProgress:enrollView:", self->_mesaSecondEnrollView, v24);

  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 0;
  objc_msgSend(v25, "setEnrollProgress:enrollView:", self->_mesaFirstEnrollView, v26);

  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setEnrollViewState:", 0);

  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setEnrollViewState:", 0);

  -[BKUIFingerprintEnrollViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bringSubviewToFront:", v31);

  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setHidden:", 1);

  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setNeedsLayout");

  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setHidden:", 0);

  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setNeedsLayout");

  if (v3)
    -[BKUIFingerprintEnrollViewController _startInitialTutorialAnimated:](self, "_startInitialTutorialAnimated:", 0);
  -[BKUIFingerprintEnrollViewController setTitle:](self, "setTitle:", &stru_1EA281248);
}

- (void)_finishEnrollmentPhaseTwo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Finishing enroll phase two", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_failEnrollment:(int)a3 withMessage:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1DB281000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Finger enroll failed with message: \"%@\", (uint8_t *)&v17, 0xCu);
  }
  if (!self->_cancelForRestart)
  {
    if (!self->_didDisappear)
    {
      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isHidden");

      if ((v10 & 1) == 0)
      {
        -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "enrollViewState");

        if (v12 != 3)
        {
          -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setEnrollViewState:", 3);

        }
        -[BKUIFingerprintEnrollViewController _transitionToEnrollView:](self, "_transitionToEnrollView:", 1);
      }
      -[BKUIAlertView hideAnimated:](self->_alertView, "hideAnimated:", 1);
      -[BKUIFingerprintEnrollViewController _animateHeaderTitle:](self, "_animateHeaderTitle:", v6);
      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((_DWORD)v4 == 2)
        v16 = 3;
      else
        v16 = 4;
      objc_msgSend(v14, "setEnrollViewState:", v16);

    }
    if (!self->_inBuddy)
      -[BKUIFingerprintEnrollViewController _sendEnrollResult:identity:](self, "_sendEnrollResult:identity:", v4, self->_bkIdentity);
  }

}

- (BOOL)_useAlertHud
{
  void *v2;
  BOOL v3;

  -[BiometricKitUIEnrollViewController propertyForKey:](self, "propertyForKey:", CFSTR("BMKUI_ALERT_HUD"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "BOOLValue") & 1) != 0
    || +[BKUIBundleSettings BOOLForUserDefaultsKey:](BKUIBundleSettings, "BOOLForUserDefaultsKey:", CFSTR("fpEnrollAlertHud"));

  return v3;
}

- (BOOL)_shouldHideUnlockMessage
{
  void *v2;
  char v3;

  -[BiometricKitUIEnrollViewController propertyForKey:](self, "propertyForKey:", CFSTR("BMKUI_HIDE_UNLOCK_MSG"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)_bkIdentityCount
{
  void *v3;
  uint64_t userid;
  void *v5;
  id v6;
  NSObject *bkui_biometric_kit_delegate_log;
  unint64_t v8;
  id v10;

  -[BKUIFingerprintEnrollViewController bkDevice](self, "bkDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  userid = self->_userid;
  v10 = 0;
  objc_msgSend(v3, "identitiesForUser:error:", userid, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
    if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_ERROR))
      -[BKUIFingerprintEnrollViewController _bkIdentityCount].cold.1(bkui_biometric_kit_delegate_log);
  }
  v8 = objc_msgSend(v5, "count");

  return v8;
}

- (unint64_t)_bkDeviceIdentityCount
{
  BKDeviceTouchID *bkDevice;
  uint64_t userid;
  void *v4;
  unint64_t v5;
  uint64_t v7;

  bkDevice = self->_bkDevice;
  userid = self->_userid;
  v7 = 0;
  -[BKDeviceTouchID identitiesForUser:error:](bkDevice, "identitiesForUser:error:", userid, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)_tutorialContinueButtonPressed
{
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  uint8_t v4[16];

  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB281000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Tutor button pressed", v4, 2u);
  }
  -[BKUIFingerprintEnrollViewController _stopTutorialTransitionToEnrollView](self, "_stopTutorialTransitionToEnrollView");
}

- (void)_stopTutorialTransitionToEnrollView
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Stopping tutorial", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)transitionToEnrollView:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[8];
  _BYTE v58[128];
  uint64_t v59;

  v3 = a3;
  v59 = *MEMORY[0x1E0C80C00];
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: transition To Enroll View", buf, 2u);
  }
  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  if ((v8 & 1) != 0 || !v3)
  {
    -[BKUIFingerprintEnrollViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bringSubviewToFront:", v11);

    -[BKUIFingerprintEnrollViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v21, "bkui_isRTL");

    -[BKUIFingerprintEnrollViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;

    v25 = -v24;
    if (!(_DWORD)v10)
      v25 = v24;
    v26 = v14 + v25;
    -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidden:", 0);

    -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v26, v16, v18, v20);

    -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAlpha:", 1.0);

    -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setNeedsLayout");

    -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutIfNeeded");

    if (v3)
    {
      v51[4] = self;
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __62__BKUIFingerprintEnrollViewController_transitionToEnrollView___block_invoke;
      v52[3] = &unk_1EA27FB98;
      v52[4] = self;
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __62__BKUIFingerprintEnrollViewController_transitionToEnrollView___block_invoke_2;
      v51[3] = &unk_1EA27FC00;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v52, v51, 0.3);
    }
    else
    {
      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bounds");
      objc_msgSend(v38, "setFrame:");

      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "layoutIfNeeded");

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "contentView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "subviews");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v54 != v47)
              objc_enumerationMutation(v44);
            objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "setHidden:", 0);
          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v46);
      }

      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "view");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setHidden:", 1);

    }
  }
}

void __62__BKUIFingerprintEnrollViewController_transitionToEnrollView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "enrollmentControlller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "enrollmentControlller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "enrollmentControlller");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

}

void __62__BKUIFingerprintEnrollViewController_transitionToEnrollView___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "tutorialController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "enrollmentControlller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)transitionToTutorialView:(BOOL)a3
{
  -[BKUIFingerprintEnrollViewController transitionToTutorialView:completion:](self, "transitionToTutorialView:completion:", a3, 0);
}

- (void)transitionToTutorialView:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: transition To Tutorail View", buf, 2u);
  }
  -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHidden");

  if ((v10 & 1) != 0 || !v4)
  {
    -[BKUIFingerprintEnrollViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bringSubviewToFront:", v13);

    -[BKUIFingerprintEnrollViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v23, "bkui_isRTL");

    -[BKUIFingerprintEnrollViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v26 = v25;

    v27 = -v26;
    if (!(_DWORD)v12)
      v27 = v26;
    v28 = v16 + v27;
    -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v28, v18, v20, v22);

    -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layoutIfNeeded");

    -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAlpha:", 1.0);

    -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setHidden:", 0);

    -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v4)
    {
      objc_msgSend(v37, "loadAVPlayer");

      v39 = (void *)MEMORY[0x1E0CEABB0];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __75__BKUIFingerprintEnrollViewController_transitionToTutorialView_completion___block_invoke;
      v48[3] = &unk_1EA27FB98;
      v48[4] = self;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __75__BKUIFingerprintEnrollViewController_transitionToTutorialView_completion___block_invoke_2;
      v46[3] = &unk_1EA2802C0;
      v46[4] = self;
      v47 = v6;
      objc_msgSend(v39, "animateWithDuration:animations:completion:", v48, v46, 0.3);

    }
    else
    {
      objc_msgSend(v37, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerprintEnrollViewController view](self, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "bounds");
      objc_msgSend(v40, "setFrame:");

      -[BKUIFingerprintEnrollViewController tutorialController](self, "tutorialController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "layoutIfNeeded");

      -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "view");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setHidden:", 1);

    }
  }

}

void __75__BKUIFingerprintEnrollViewController_transitionToTutorialView_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "tutorialController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "tutorialController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

uint64_t __75__BKUIFingerprintEnrollViewController_transitionToTutorialView_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "enrollmentControlller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "enrollmentControlller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "tutorialController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)initPromptMessage
{
  id v3;

  -[BKUIFingerprintEnrollViewController _placeFingerString](self, "_placeFingerString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerprintEnrollViewController _animateHeaderTitle:](self, "_animateHeaderTitle:", v3);

}

- (void)_animateHeaderTitle:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSString **p_lastPromptMessage;
  NSString *v8;
  void *v9;
  void *v10;
  char v11;
  double msgShowTimeout;
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[NSTimer isValid](self->_messageTimer, "isValid");
  p_lastPromptMessage = &self->_lastPromptMessage;
  if (v6)
  {
    objc_storeStrong((id *)p_lastPromptMessage, a3);
  }
  else
  {
    v8 = *p_lastPromptMessage;
    *p_lastPromptMessage = 0;

    -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "headerTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v5);

    if ((v11 & 1) != 0)
    {
      msgShowTimeout = self->_msgShowTimeout;
    }
    else
    {
      bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
      if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v5;
        _os_log_impl(&dword_1DB281000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Current title set to: \"%@\", (uint8_t *)&v14, 0xCu);
      }
      -[BKUIFingerprintEnrollViewController _transitionPromptMessage:](self, "_transitionPromptMessage:", v5);
      msgShowTimeout = self->_msgTransLength + self->_msgShowTimeout;
    }
    -[BKUIFingerprintEnrollViewController _startMessageTimer:](self, "_startMessageTimer:", msgShowTimeout);
  }

}

- (void)_startMessageTimer:(double)a3
{
  NSTimer *v5;
  NSTimer *messageTimer;

  -[BKUIFingerprintEnrollViewController _stopMessageTimer](self, "_stopMessageTimer");
  if (os_log_type_enabled((os_log_t)self->bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG))
    -[BKUIFingerprintEnrollViewController _startMessageTimer:].cold.1();
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__messageTimeout, 0, 0, a3);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  messageTimer = self->_messageTimer;
  self->_messageTimer = v5;

}

- (void)_stopMessageTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Stopping Message Timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_messageTimeout
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Message Timeout", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_transitionPromptMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHidden") ^ 1;

  -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateHeaderWithTitle:animated:heightDifference:", v4, v7, 0);

}

- (id)_liftFingerString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("LIFT_YOUR_FINGER"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_placeFingerString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PLACE_YOUR_FINGER"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BKUIFingerprintEnrollViewController followUPEnrollmentUpSell](self, "followUPEnrollmentUpSell"))
  {
    -[BKUIFingerprintEnrollViewController enrollmentControlller](self, "enrollmentControlller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "enrollViewState");

    if (v6 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PLACE_YOUR_FINGER_FOLLOW_UP"), &stru_1EA281248, CFSTR("Mesa-j307"));
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
  }
  return v4;
}

- (id)_readyString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MESA_IS_READY"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BKUIFingerprintEnrollViewController followUPEnrollmentUpSell](self, "followUPEnrollmentUpSell"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MESA_IS_READY_FOLLOW_UP"), &stru_1EA281248, CFSTR("Mesa-j307"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (BOOL)followUPEnrollmentUpSell
{
  void *v2;
  BOOL v3;

  if (!self->_inBuddy)
    return 0;
  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isIdiomPad"))
    v3 = MGGetSInt32Answer() == 2;
  else
    v3 = 0;

  return v3;
}

- (id)menuAction
{
  return -[BiometricKitUIEnrollViewController propertyForKey:](self, "propertyForKey:", CFSTR("MENU_ACTION"));
}

- (BOOL)_topTouchButtonIpad
{
  void *v2;

  if (MGGetBoolAnswer())
  {
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "isIdiomPad");

  }
  return MGGetSInt32Answer() == 2;
}

- (id)_deviceAwareLocalizedStringForKey:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = -[BKUIFingerprintEnrollViewController _topTouchButtonIpad](self, "_topTouchButtonIpad");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("_FOLLOW_UP"));
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_1EA281248, CFSTR("Mesa-j307"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v8;
  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", v4, &stru_1EA281248, CFSTR("BiometricKitUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BKDeviceTouchID)bkDevice
{
  return (BKDeviceTouchID *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setBkDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (BKEnrollTouchIDOperation)bkEnroll
{
  return (BKEnrollTouchIDOperation *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setBkEnroll:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (BKExtendEnrollTouchIDOperation)bkExtendEnroll
{
  return (BKExtendEnrollTouchIDOperation *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setBkExtendEnroll:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (BKIdentity)bkIdentity
{
  return (BKIdentity *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setBkIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1280);
}

- (int64_t)bkProgress
{
  return self->_bkProgress;
}

- (void)setBkProgress:(int64_t)a3
{
  self->_bkProgress = a3;
}

- (BOOL)waitForFingerLift
{
  return self->_waitForFingerLift;
}

- (void)setWaitForFingerLift:(BOOL)a3
{
  self->_waitForFingerLift = a3;
}

- (BOOL)fingerOn
{
  return self->_fingerOn;
}

- (void)setFingerOn:(BOOL)a3
{
  self->_fingerOn = a3;
}

- (BKUIFingerPrintEnrollTutorialViewController)tutorialController
{
  return self->_tutorialController;
}

- (void)setTutorialController:(id)a3
{
  objc_storeStrong((id *)&self->_tutorialController, a3);
}

- (BKUIFingerPrintEnrollmentPhaseViewController)enrollmentControlller
{
  return self->_enrollmentControlller;
}

- (void)setEnrollmentControlller:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentControlller, a3);
}

- (BioStreamsEventHelper)bioStreamEventHelper
{
  return self->_bioStreamEventHelper;
}

- (void)setBioStreamEventHelper:(id)a3
{
  objc_storeStrong((id *)&self->_bioStreamEventHelper, a3);
}

- (void)setFollowUPEnrollmentUpSell:(BOOL)a3
{
  self->_followUPEnrollmentUpSell = a3;
}

- (BKIdentity)firstFollowUpIdentity
{
  return self->_firstFollowUpIdentity;
}

- (void)setFirstFollowUpIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_firstFollowUpIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFollowUpIdentity, 0);
  objc_storeStrong((id *)&self->_bioStreamEventHelper, 0);
  objc_storeStrong((id *)&self->_enrollmentControlller, 0);
  objc_storeStrong((id *)&self->_tutorialController, 0);
  objc_storeStrong((id *)&self->_bkIdentity, 0);
  objc_storeStrong((id *)&self->_bkExtendEnroll, 0);
  objc_storeStrong((id *)&self->_bkEnroll, 0);
  objc_storeStrong((id *)&self->_bkDevice, 0);
  objc_storeStrong((id *)&self->bkui_fingerprint_enroll_view_controller_log, 0);
  objc_storeStrong((id *)&self->bkui_biometric_kit_delegate_log, 0);
  objc_storeStrong((id *)&self->bkui_result_delegate_log, 0);
  objc_storeStrong((id *)&self->_alertHudText, 0);
  objc_storeStrong((id *)&self->_alertHudView, 0);
  objc_storeStrong((id *)&self->_mesaSecondEnrollView, 0);
  objc_storeStrong((id *)&self->_mesaFirstEnrollView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_lastPromptMessage, 0);
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_enrollmentEndTime, 0);
}

void __71__BKUIFingerprintEnrollViewController_showSecondFingerEnrollmentUpSell__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "showSecondFingerEnrollmentUpSell: Restarting enrollment", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)applicationWillResignActive:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: App resigning active ... will remove unsaved identities", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1DB281000, v1, v3, "applicationWillResignActive failed to _bkIdentity identity failed. Err: %@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)enrollProgress:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v2;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;

  OUTLINED_FUNCTION_7(a1);
  v4 = 134218240;
  v5 = objc_msgSend((id)OUTLINED_FUNCTION_9(), "progress");
  v6 = 1024;
  v7 = objc_msgSend(a2, "message");
  _os_log_debug_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEBUG, "BiometricKitUI: Enroll progress: %li and message: %i", (uint8_t *)&v4, 0x12u);

}

- (void)_cancelEnrollmentAndRestart:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DB281000, a2, OS_LOG_TYPE_DEBUG, "BiometricKitUI: Canceling enroll and restart: %i", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)_startTutorial:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Starting tutorial", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_startInitialTutorialAnimated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Start intial tutorial", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fingerprintCaptureOperation:encounteredCaptureError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_1DB281000, v0, v1, "BiomtericKitUI: Fingerprint encountered capture error: %li", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_resetUIWithTransitionToTutorial:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Resetting UI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_bkIdentityCount
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_1DB281000, v1, v3, "BiomtericKitUI: _bkIdentityCount fetch error: %@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_startMessageTimer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_1DB281000, v0, v1, "BiometricKitUI: Starting Message Timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
