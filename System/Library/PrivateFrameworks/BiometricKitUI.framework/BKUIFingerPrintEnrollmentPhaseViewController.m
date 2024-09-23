@implementation BKUIFingerPrintEnrollmentPhaseViewController

- (id)initInBuddy:(BOOL)a3 hideUnlockMessage:(BOOL)a4 headerTitle:(id)a5 firstEnrollView:(id)a6 secondEnrollView:(id)a7
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  BKUIFingerPrintEnrollmentPhaseViewController *v16;
  BKUIFingerPrintEnrollmentPhaseViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v11 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  v16 = -[BKUIFingerPrintEnrollmentPhaseViewController initWithTitle:detailText:icon:contentLayout:](&v23, sel_initWithTitle_detailText_icon_contentLayout_, v13, 0, 0, 2);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_mesaFirstEnrollView, a6);
    objc_storeStrong((id *)&v17->_mesaSecondEnrollView, a7);
    -[BKUICurvesView setAlpha:](v17->_mesaSecondEnrollView, "setAlpha:", 0.0);
    -[BKUIFingerPrintEnrollmentPhaseViewController headerView](v17, "headerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTintColor:", v19);

    -[BKUIFingerPrintEnrollmentPhaseViewController setInBuddy:](v17, "setInBuddy:", v11);
    -[BKUIFingerPrintEnrollmentPhaseViewController headerView](v17, "headerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollmentPhaseViewController _detailPhasesText](v17, "_detailPhasesText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDetailText:", v21);

    -[BKUIFingerPrintEnrollmentPhaseViewController setEnrollViewState:](v17, "setEnrollViewState:", 0);
    v17->_hideUnlockMessage = a4;
    objc_storeStrong((id *)&v17->_headerTitle, a5);
    v17->_buttonTraySize = (CGSize)*MEMORY[0x1E0C9D820];
  }

  return v17;
}

- (id)initInBuddy:(BOOL)a3 hideUnlockMessage:(BOOL)a4 showFollowUpSell:(BOOL)a5 headerTitle:(id)a6 firstEnrollView:(id)a7 secondEnrollView:(id)a8
{
  _BYTE *v9;
  void *v10;
  void *v11;
  void *v12;

  v9 = -[BKUIFingerPrintEnrollmentPhaseViewController initInBuddy:hideUnlockMessage:headerTitle:firstEnrollView:secondEnrollView:](self, "initInBuddy:hideUnlockMessage:headerTitle:firstEnrollView:secondEnrollView:", a3, a4, a6, a7, a8);
  v10 = v9;
  if (v9)
  {
    v9[1186] = a5;
    objc_msgSend(v9, "headerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_detailPhasesText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDetailText:", v12);

  }
  return v10;
}

- (void)_updateContentViewSizeToMatchConstraints
{
  void *v3;
  void *v4;
  double MaxY;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  id v19;
  CGRect v20;

  -[BKUIFingerPrintEnrollmentPhaseViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  MaxY = CGRectGetMaxY(v20);

  -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[BKUIFingerPrintEnrollmentPhaseViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;

  if (!self->_disableContentViewSizing || -[BKUIFingerPrintEnrollmentPhaseViewController rotating](self, "rotating"))
  {
    -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    -[BKUIFingerPrintEnrollmentPhaseViewController setAnchorPoint:](self, "setAnchorPoint:");

    v16 = v8 - MaxY - v11 - v14 + -10.0;
    v17 = fmaxf(v16, 241.2);
    -[BKUIFingerPrintEnrollmentPhaseViewController contentViewHeightConstraint](self, "contentViewHeightConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setConstant:", v17);

    -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutIfNeeded");

  }
}

- (void)viewDidLoad
{
  OS_os_log *v3;
  OS_os_log *bkui_fingerprint_enroll_view_controller_log;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  -[OBBaseWelcomeController viewDidLoad](&v34, sel_viewDidLoad);
  v3 = (OS_os_log *)os_log_create("com.apple.biometrickitui", "FingerprintEnrollViewController");
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  self->bkui_fingerprint_enroll_view_controller_log = v3;

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollmentPhaseViewController setContinueButton:](self, "setContinueButton:", v5);

  -[BKUIFingerPrintEnrollmentPhaseViewController continueButton](self, "continueButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BKUIFingerPrintEnrollmentPhaseViewController continueButton](self, "continueButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v9, 0);

  -[BKUIFingerPrintEnrollmentPhaseViewController continueButton](self, "continueButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__continuePressed_, 64);

  -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_mesaFirstEnrollView);

  -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_mesaSecondEnrollView);

  -[BKUIFingerPrintEnrollmentPhaseViewController contentViewHeightConstraint](self, "contentViewHeightConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 0);

  if (-[BKUIFingerPrintEnrollmentPhaseViewController inBuddy](self, "inBuddy"))
  {
    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollmentPhaseViewController setSkipButton:](self, "setSkipButton:", v14);

    -[BKUIFingerPrintEnrollmentPhaseViewController skipButton](self, "skipButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[BKUIFingerPrintEnrollmentPhaseViewController skipButton](self, "skipButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SKIP_ENROLL"), &stru_1EA281248, CFSTR("BiometricKitUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:forState:", v18, 0);

    -[BKUIFingerPrintEnrollmentPhaseViewController skipButton](self, "skipButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__enrollSkipped, 64);

    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollmentPhaseViewController setRetryButton:](self, "setRetryButton:", v20);

    -[BKUIFingerPrintEnrollmentPhaseViewController retryButton](self, "retryButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[BKUIFingerPrintEnrollmentPhaseViewController retryButton](self, "retryButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("RESTART_ENROLL"), &stru_1EA281248, CFSTR("BiometricKitUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitle:forState:", v24, 0);

    -[BKUIFingerPrintEnrollmentPhaseViewController retryButton](self, "retryButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__continuePressed_, 64);

  }
  -[BKUIFingerPrintEnrollmentPhaseViewController setEnrollViewState:](self, "setEnrollViewState:", 0);
  if (-[BKUIFingerPrintEnrollmentPhaseViewController _topTouchButtonIpad](self, "_topTouchButtonIpad"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0CEC390];
    v28 = MEMORY[0x1E0C80D38];
    v29 = MEMORY[0x1E0C80D38];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __59__BKUIFingerPrintEnrollmentPhaseViewController_viewDidLoad__block_invoke;
    v31[3] = &unk_1EA280330;
    objc_copyWeak(&v32, &location);
    v30 = (id)objc_msgSend(v26, "addObserverForName:object:queue:usingBlock:", v27, 0, v28, v31);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

void __59__BKUIFingerPrintEnrollmentPhaseViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    objc_msgSend(WeakRetained, "touchindicatorWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", objc_msgSend(v6, "_enhancedWindowingEnabled"));

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  -[BKUIFingerPrintEnrollmentPhaseViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[BKUIFingerPrintEnrollmentPhaseViewController _updateButtonTraySize](self, "_updateButtonTraySize");
  -[BKUIFingerPrintEnrollmentPhaseViewController _idealEnrollCurveViewSize](self, "_idealEnrollCurveViewSize");
  -[BKUIFingerPrintEnrollmentPhaseViewController _updateEnrollViewsForSize:](self, "_updateEnrollViewsForSize:");
  -[BKUIFingerPrintEnrollmentPhaseViewController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)viewDidAppear:(BOOL)a3
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v20, sel_viewDidAppear_, a3);
  -[BKUIFingerPrintEnrollmentPhaseViewController _idealEnrollCurveViewSize](self, "_idealEnrollCurveViewSize");
  -[BKUIFingerPrintEnrollmentPhaseViewController _updateEnrollViewsForSize:](self, "_updateEnrollViewsForSize:");
  if (-[BKUIFingerPrintEnrollmentPhaseViewController _topTouchButtonIpad](self, "_topTouchButtonIpad"))
  {
    -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[BKUIFingerPrintEnrollmentPhaseViewController setTouchindicatorWindow:](self, "setTouchindicatorWindow:", v10);
    }
    else
    {
      -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "windowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[BKUIIndicatorWindow instanceWithWindowScene:](BKUIIndicatorWindow, "instanceWithWindowScene:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollmentPhaseViewController setTouchindicatorWindow:](self, "setTouchindicatorWindow:", v14);

    }
    -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "windowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "_enhancedWindowingEnabled") ^ 1;

    -[BKUIFingerPrintEnrollmentPhaseViewController touchindicatorWindow](self, "touchindicatorWindow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", (double)v18);

  }
}

uint64_t __62__BKUIFingerPrintEnrollmentPhaseViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __99__BKUIFingerPrintEnrollmentPhaseViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1EA2802E8;
    v8[4] = self;
    objc_msgSend(v5, "animateAlongsideTransition:completion:", 0, v8);
  }

}

void __99__BKUIFingerPrintEnrollmentPhaseViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[BKUIFingerPrintEnrollmentPhaseViewController _updateContentViewSizeToMatchConstraints](self, "_updateContentViewSizeToMatchConstraints");
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)removeTouchIndicator
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__BKUIFingerPrintEnrollmentPhaseViewController_removeTouchIndicator__block_invoke;
  v3[3] = &unk_1EA27FB98;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__BKUIFingerPrintEnrollmentPhaseViewController_removeTouchIndicator__block_invoke_2;
  v2[3] = &unk_1EA27FC00;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v3, v2, 0.300000012);
}

void __68__BKUIFingerPrintEnrollmentPhaseViewController_removeTouchIndicator__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "touchindicatorWindow");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __68__BKUIFingerPrintEnrollmentPhaseViewController_removeTouchIndicator__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "touchindicatorWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignKeyWindow");

  return objc_msgSend(*(id *)(a1 + 32), "setTouchindicatorWindow:", 0);
}

- (void)setEnrollProgress:(float)a3 enrollView:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v6 = a4;
  -[BKUIFingerPrintEnrollmentPhaseViewController enrollProgress](self, "enrollProgress");
  v8 = v7;
  *(float *)&v7 = a3;
  objc_msgSend(v6, "setProgress:", v7);

  -[BKUIFingerPrintEnrollmentPhaseViewController setEnrollProgress:](self, "setEnrollProgress:", a3);
  if (-[BKUIFingerPrintEnrollmentPhaseViewController showFollowUpEnrollmentUpSellContent](self, "showFollowUpEnrollmentUpSellContent")&& a3 > 0.0&& v8 == 0.0)
  {
    if (-[BKUIFingerPrintEnrollmentPhaseViewController inBuddy](self, "inBuddy"))
    {
      -[BKUIFingerPrintEnrollmentPhaseViewController headerView](self, "headerView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollmentPhaseViewController _detailPhasesText](self, "_detailPhasesText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDetailText:", v9);

    }
  }
}

- (void)_updateEnrollViewsForSize:(CGSize)a3
{
  double height;
  NSObject *bkui_fingerprint_enroll_view_controller_log;
  double v6;
  double v7;
  NSObject *v8;
  double v9;
  double v10;
  void *v11;
  NSArray *v12;
  NSArray *mesaEnrollContainerConstraints;
  void *v14;
  double v15;
  float v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSArray *v37;
  NSArray *v38;
  void *v39;
  void *v40;
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
  _QWORD v55[8];
  uint8_t buf[4];
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  double v65;
  uint64_t v66;

  height = a3.height;
  v66 = *MEMORY[0x1E0C80C00];
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG))
    -[BKUIFingerPrintEnrollmentPhaseViewController _updateEnrollViewsForSize:].cold.1(bkui_fingerprint_enroll_view_controller_log);
  v6 = height * 0.00108695652 + 0.434782609;
  if (-[BKUIFingerPrintEnrollmentPhaseViewController _isIPad](self, "_isIPad"))
    -[BKUIFingerPrintEnrollmentPhaseViewController inBuddy](self, "inBuddy");
  v7 = v6 * 5.0;
  v8 = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    v57 = height * 0.00108695652 + 0.434782609;
    v58 = 2048;
    v59 = height;
    v60 = 2048;
    v61 = v6 * 5.0;
    v62 = 2048;
    v63 = 0;
    v64 = 2048;
    v65 = v6 * -40.0;
    _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: SVG multiplier: %f (size: %f), svgHOffset: %f, svgVOffset: %f, svgVOffset2: %f", buf, 0x34u);
  }
  v9 = v6 * 192.0;
  v10 = v6 * 268.0;
  if (self->_mesaEnrollContainerConstraints)
  {
    -[BKUIFingerPrintEnrollmentPhaseViewController enrollCurvesViewTopConstraint](self, "enrollCurvesViewTopConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 0);

    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_mesaEnrollContainerConstraints);
    v12 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  mesaEnrollContainerConstraints = self->_mesaEnrollContainerConstraints;
  self->_mesaEnrollContainerConstraints = v12;

  -[BKUIFingerPrintEnrollmentPhaseViewController setInnerAndOuterCurvesViewHeightDiff:](self, "setInnerAndOuterCurvesViewHeightDiff:", (v10 - v9) * 0.5);
  -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15 * 0.13;
  -[BKUIFingerPrintEnrollmentPhaseViewController innerAndOuterCurvesViewHeightDiff](self, "innerAndOuterCurvesViewHeightDiff");
  *(float *)&v17 = v17;
  v18 = fminf(v16, *(float *)&v17);

  -[BKUICurvesView topAnchor](self->_mesaSecondEnrollView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollmentPhaseViewController setEnrollCurvesViewTopConstraint:](self, "setEnrollCurvesViewTopConstraint:", v22);

  -[BKUIFingerPrintEnrollmentPhaseViewController enrollCurvesViewTopConstraint](self, "enrollCurvesViewTopConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[BKUIFingerPrintEnrollmentPhaseViewController buttonTray](self, "buttonTray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = objc_msgSend(v24, "isHidden");

  if ((_DWORD)v20)
    v25 = 25.0;
  else
    v25 = 0.0;
  if (-[BKUIFingerPrintEnrollmentPhaseViewController enrollViewState](self, "enrollViewState"))
  {
    v26 = -v25;
  }
  else
  {
    -[BKUIFingerPrintEnrollmentPhaseViewController innerAndOuterCurvesViewHeightDiff](self, "innerAndOuterCurvesViewHeightDiff");
    v26 = v27 - v25;
  }
  v28 = v6 * 180.0;
  v29 = v6 * 124.0;
  -[BKUICurvesView widthAnchor](self->_mesaSecondEnrollView, "widthAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToConstant:", v28);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v53;
  -[BKUICurvesView heightAnchor](self->_mesaSecondEnrollView, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToConstant:", v10);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v51;
  -[BKUICurvesView centerXAnchor](self->_mesaSecondEnrollView, "centerXAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "centerXAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, v7);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v47;
  -[BKUICurvesView bottomAnchor](self->_mesaSecondEnrollView, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, v26);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v43;
  -[BKUICurvesView widthAnchor](self->_mesaFirstEnrollView, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", v29);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v41;
  -[BKUICurvesView heightAnchor](self->_mesaFirstEnrollView, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToConstant:", v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v39;
  -[BKUICurvesView centerXAnchor](self->_mesaFirstEnrollView, "centerXAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v33;
  -[BKUICurvesView centerYAnchor](self->_mesaFirstEnrollView, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUICurvesView centerYAnchor](self->_mesaSecondEnrollView, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 8);
  v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v38 = self->_mesaEnrollContainerConstraints;
  self->_mesaEnrollContainerConstraints = v37;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_mesaEnrollContainerConstraints);
  -[BKUICurvesView setSublayersSize:](self->_mesaFirstEnrollView, "setSublayersSize:", v29, v9);
  -[BKUICurvesView setSublayersSize:](self->_mesaSecondEnrollView, "setSublayersSize:", v28, v10);
}

- (void)handleEnrollmentFailure
{
  void *v3;
  _QWORD v4[5];

  if (-[BKUIFingerPrintEnrollmentPhaseViewController inBuddy](self, "inBuddy"))
  {
    -[BKUIFingerPrintEnrollmentPhaseViewController buttonTray](self, "buttonTray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllButtons");

    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71__BKUIFingerPrintEnrollmentPhaseViewController_handleEnrollmentFailure__block_invoke;
    v4[3] = &unk_1EA27FB98;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, 0.3);
  }
}

void __71__BKUIFingerPrintEnrollmentPhaseViewController_handleEnrollmentFailure__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "retryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addButton:", v3);

  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "skipButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addButton:", v5);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)handleEnrollmentDone
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[BKUIFingerPrintEnrollmentPhaseViewController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllButtons");

  -[BKUIFingerPrintEnrollmentPhaseViewController mesaSecondEnrollView](self, "mesaSecondEnrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__BKUIFingerPrintEnrollmentPhaseViewController_handleEnrollmentDone__block_invoke;
  v5[3] = &unk_1EA27FB98;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v5, 0.01);
}

uint64_t __68__BKUIFingerPrintEnrollmentPhaseViewController_handleEnrollmentDone__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "continueButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addButton:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_forceLayout");
}

- (void)setEnrollViewState:(unint64_t)a3
{
  if (self->_enrollViewState != a3)
  {
    self->_enrollViewState = a3;
    -[BKUIFingerPrintEnrollmentPhaseViewController _handleViewState:](self, "_handleViewState:");
  }
}

- (void)_handleViewState:(unint64_t)a3
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;

  switch(a3)
  {
    case 0uLL:
      -[BKUIFingerPrintEnrollmentPhaseViewController _forceResetCurvesLayerToPercent:](self, "_forceResetCurvesLayerToPercent:", 0.0);
      -[BKUIFingerPrintEnrollmentPhaseViewController buttonTray](self, "buttonTray");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeAllButtons");

      -[BKUIFingerPrintEnrollmentPhaseViewController headerView](self, "headerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleTrailingSymbol:", &stru_1EA281248);

      -[BKUIFingerPrintEnrollmentPhaseViewController headerTitle](self, "headerTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollmentPhaseViewController setHeaderTitle:](self, "setHeaderTitle:", v6);

      -[BKUIFingerPrintEnrollmentPhaseViewController headerView](self, "headerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollmentPhaseViewController _detailPhasesText](self, "_detailPhasesText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDetailText:", v8);

      -[BKUIFingerPrintEnrollmentPhaseViewController mesaSecondEnrollView](self, "mesaSecondEnrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlpha:", 0.0);

      -[BKUIFingerPrintEnrollmentPhaseViewController _forceLayout](self, "_forceLayout");
      -[BKUIFingerPrintEnrollmentPhaseViewController _updateContentViewSizeToMatchConstraints](self, "_updateContentViewSizeToMatchConstraints");
      -[BKUIFingerPrintEnrollmentPhaseViewController touchindicatorWindow](self, "touchindicatorWindow");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setShouldShow:", 1);
      goto LABEL_5;
    case 1uLL:
      -[BKUIFingerPrintEnrollmentPhaseViewController _idealEnrollCurveViewSize](self, "_idealEnrollCurveViewSize");
      -[BKUIFingerPrintEnrollmentPhaseViewController _updateEnrollViewsForSize:](self, "_updateEnrollViewsForSize:");
      -[BKUIFingerPrintEnrollmentPhaseViewController headerTitle](self, "headerTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollmentPhaseViewController setHeaderTitle:](self, "setHeaderTitle:", v10);

      -[BKUIFingerPrintEnrollmentPhaseViewController headerView](self, "headerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollmentPhaseViewController _detailPhasesText](self, "_detailPhasesText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDetailText:", v12);

      -[BKUIFingerPrintEnrollmentPhaseViewController mesaSecondEnrollView](self, "mesaSecondEnrollView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlpha:", 1.0);

      -[BKUIFingerPrintEnrollmentPhaseViewController _forceLayout](self, "_forceLayout");
      -[BKUIFingerPrintEnrollmentPhaseViewController _updateContentViewSizeToMatchConstraints](self, "_updateContentViewSizeToMatchConstraints");
      -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "origin");
      -[BKUIFingerPrintEnrollmentPhaseViewController setAnchorPoint:](self, "setAnchorPoint:");
      goto LABEL_5;
    case 2uLL:
      -[BKUIFingerPrintEnrollmentPhaseViewController _detailTextDonePhase](self, "_detailTextDonePhase");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollmentPhaseViewController _forceLayout](self, "_forceLayout");
      -[BKUIFingerPrintEnrollmentPhaseViewController touchindicatorWindow](self, "touchindicatorWindow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setShouldShow:", 0);

      -[BKUIFingerPrintEnrollmentPhaseViewController handleEnrollmentDone](self, "handleEnrollmentDone");
LABEL_5:

      return;
    case 3uLL:
      -[BKUIFingerPrintEnrollmentPhaseViewController headerView](self, "headerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("ENROLL_FAILED_PROMPT");
      goto LABEL_8;
    case 4uLL:
      -[BKUIFingerPrintEnrollmentPhaseViewController headerView](self, "headerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("TRY_AGAIN");
LABEL_8:
      objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1EA281248, CFSTR("BiometricKitUI"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDetailText:", v19);

      -[BKUIFingerPrintEnrollmentPhaseViewController _forceLayout](self, "_forceLayout");
      -[BKUIFingerPrintEnrollmentPhaseViewController handleEnrollmentFailure](self, "handleEnrollmentFailure");
      -[BKUIFingerPrintEnrollmentPhaseViewController _forceResetCurvesLayerToPercent:](self, "_forceResetCurvesLayerToPercent:", 0.0);
      break;
    default:
      return;
  }
}

- (void)_forceLayout
{
  void *v3;
  id v4;

  -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (CGSize)_idealEnrollCurveViewSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[BKUIFingerPrintEnrollmentPhaseViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  if (-[BKUIFingerPrintEnrollmentPhaseViewController _isIPad](self, "_isIPad"))
  {
    -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;

    -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;

    if (v11 >= v14)
      v11 = v14;
    -[BKUIFingerPrintEnrollmentPhaseViewController headerView](self, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v11 - v16;

    v18 = MGGetProductType();
    if (v18 == 2903084588 || v18 == 1895344378)
    {
      -[BKUIFingerPrintEnrollmentPhaseViewController buttonTraySize](self, "buttonTraySize");
      v17 = v17 - v19;
    }
  }
  else
  {
    v17 = v5 - v8;
  }
  v20 = 0.0;
  v21 = v17;
  result.height = v21;
  result.width = v20;
  return result;
}

- (BOOL)shouldAnimateEntireView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *bkui_fingerprint_enroll_view_controller_log;

  -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[BKUICurvesView bounds](self->_mesaFirstEnrollView, "bounds");
  v7 = v5 + v6;
  -[BKUIFingerPrintEnrollmentPhaseViewController _enrollViewTopPadding](self, "_enrollViewTopPadding");
  v9 = v8 + v7;

  -[BKUIFingerPrintEnrollmentPhaseViewController buttonTray](self, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;

  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG))
    -[BKUIFingerPrintEnrollmentPhaseViewController shouldAnimateEntireView].cold.1(bkui_fingerprint_enroll_view_controller_log, v9, v12);
  return v9 > v12;
}

- (double)_enrollViewTopPadding
{
  void *v3;
  double v4;
  float v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  float v11;
  double v12;

  -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 * 0.13;
  -[BKUIFingerPrintEnrollmentPhaseViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  -[BKUIFingerPrintEnrollmentPhaseViewController mesaSecondEnrollView](self, "mesaSecondEnrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = (v8 - v10) * 0.5;
  v12 = fminf(v5, v11);

  return v12;
}

- (void)_continuePressed:(id)a3
{
  id v4;

  -[BKUIFingerPrintEnrollmentPhaseViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didSelectPrimaryButton:", self);

}

- (void)_enrollSkipped
{
  id v3;

  -[BKUIFingerPrintEnrollmentPhaseViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didSelectSecondaryButton:", self);

}

- (id)_subtitleFont
{
  -[BKUIFingerPrintEnrollmentPhaseViewController _isIPad](self, "_isIPad");
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 18.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isIPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (void)updateHeaderWithTitle:(id)a3 animated:(BOOL)a4 heightDifference:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  float v15;
  double v16;
  double v17;
  _QWORD v18[5];
  id v19[2];
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[BKUIFingerPrintEnrollmentPhaseViewController setHeaderTitle:](self, "setHeaderTitle:", v8);
  if (-[BKUIFingerPrintEnrollmentPhaseViewController enrollViewState](self, "enrollViewState") == 2)
  {
    -[BKUIFingerPrintEnrollmentPhaseViewController headerView](self, "headerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollmentPhaseViewController _detailTextDonePhase](self, "_detailTextDonePhase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDetailText:", v11);

  }
  -[BKUIFingerPrintEnrollmentPhaseViewController enrollCurvesViewCenterConstraint](self, "enrollCurvesViewCenterConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 0);

  -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14 * 0.13;
  -[BKUIFingerPrintEnrollmentPhaseViewController innerAndOuterCurvesViewHeightDiff](self, "innerAndOuterCurvesViewHeightDiff");
  *(float *)&v16 = v16;
  v17 = fminf(v15, *(float *)&v16);

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__BKUIFingerPrintEnrollmentPhaseViewController_updateHeaderWithTitle_animated_heightDifference___block_invoke;
  v18[3] = &unk_1EA2807D0;
  objc_copyWeak(v19, &location);
  v19[1] = *(id *)&v17;
  v18[4] = self;
  -[OBTouchIDEnrollmentWelcomeController startTitleTransitionAnimated:heightDifference:](self, "startTitleTransitionAnimated:heightDifference:", v6, v18);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __96__BKUIFingerPrintEnrollmentPhaseViewController_updateHeaderWithTitle_animated_heightDifference___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;
  void *v5;
  double v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  double v16;
  NSObject *v17;
  double v18;
  void *v19;
  void *v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "shouldAnimateEntireView") & 1) != 0)
    goto LABEL_14;
  objc_msgSend(WeakRetained, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = (unint64_t)v6;
  objc_msgSend(WeakRetained, "anchorPoint");
  v9 = (unint64_t)v8;

  if (v7 != v9)
  {
    v16 = *(double *)(a1 + 48);
    objc_msgSend(WeakRetained, "enrollCurvesViewTopConstraint");
    v17 = objc_claimAutoreleasedReturnValue();
    v15 = v17;
    v18 = v16;
LABEL_9:
    -[NSObject setConstant:](v17, "setConstant:", v18);
LABEL_10:

    goto LABEL_11;
  }
  v10 = *(double *)(a1 + 48) + a2;
  if (a2 >= 0.0)
  {
    objc_msgSend(WeakRetained, "enrollCurvesViewTopConstraint");
    v17 = objc_claimAutoreleasedReturnValue();
    v15 = v17;
    v18 = v10;
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "enrollCurvesViewTopConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", fmax(v10, -15.0));

  objc_msgSend(WeakRetained, "enrollCurvesViewTopConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constant");
  v14 = v13;

  if (v14 < 10.0)
  {
    _BKUILoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __96__BKUIFingerPrintEnrollmentPhaseViewController_updateHeaderWithTitle_animated_heightDifference___block_invoke_cold_1(v15);
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(WeakRetained, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layoutIfNeeded");

  if (objc_msgSend(*(id *)(a1 + 32), "enrollViewState") == 2
    && objc_msgSend(*(id *)(a1 + 32), "showFollowUpEnrollmentUpSellContent"))
  {
    objc_msgSend(*(id *)(a1 + 32), "headerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTitleTrailingSymbol:", CFSTR("checkmark"));

  }
LABEL_14:

}

- (void)setHeaderTitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_headerTitle, a3);
  v5 = a3;
  -[BKUIFingerPrintEnrollmentPhaseViewController headerView](self, "headerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (void)_forceResetCurvesLayerToPercent:(double)a3
{
  double v3;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  LODWORD(a3) = 0;
  -[BKUICurvesView setProgress:](self->_mesaFirstEnrollView, "setProgress:", a3);
  *(float *)&v3 = v3;
  LODWORD(v5) = LODWORD(v3);
  -[BKUICurvesView setProgress:](self->_mesaFirstEnrollView, "setProgress:", v5);
  LODWORD(v6) = 0;
  -[BKUICurvesView setProgress:](self->_mesaSecondEnrollView, "setProgress:", v6);
  LODWORD(v7) = LODWORD(v3);
  -[BKUICurvesView setProgress:](self->_mesaSecondEnrollView, "setProgress:", v7);
}

- (id)_detailPhasesText
{
  double v3;
  unint64_t v4;
  void *v5;
  const __CFString *v6;
  unint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  if (!-[BKUIFingerPrintEnrollmentPhaseViewController _topTouchButtonIpad](self, "_topTouchButtonIpad"))
  {
    v7 = -[BKUIFingerPrintEnrollmentPhaseViewController enrollViewState](self, "enrollViewState");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == 1)
      v6 = CFSTR("LIFT_AND_REST");
    else
      v6 = CFSTR("LIFT_AND_REST_LONGER");
    v9 = CFSTR("BiometricKitUI");
    goto LABEL_12;
  }
  -[BKUIFingerPrintEnrollmentPhaseViewController enrollProgress](self, "enrollProgress");
  if (v3 > 0.0)
  {
    v4 = -[BKUIFingerPrintEnrollmentPhaseViewController enrollViewState](self, "enrollViewState");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 == 1)
      v6 = CFSTR("LIFT_AND_REST_FOLLOW_UP");
    else
      v6 = CFSTR("LIFT_AND_REST_LONGER_FOLLOW_UP");
    v9 = CFSTR("Mesa-j307");
LABEL_12:
    v8 = v5;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = CFSTR("SCAN_FINGER_START_FOLLOW_UP");
  v9 = CFSTR("Mesa-j307");
LABEL_13:
  objc_msgSend(v8, "localizedStringForKey:value:table:", v6, &stru_1EA281248, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_detailTextDonePhase
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  if (-[BKUIFingerPrintEnrollmentPhaseViewController showFollowUpEnrollmentUpSellContent](self, "showFollowUpEnrollmentUpSellContent"))
  {
    v3 = -[BKUIFingerPrintEnrollmentPhaseViewController isSecondEnrollment](self, "isSecondEnrollment");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v5 = CFSTR("FINGER_CAN_BE_ADDED_DELETED_FOLLOW_UP");
    else
      v5 = CFSTR("FINGER_READY_FOLLOW_UP");
    v7 = CFSTR("Mesa-j307");
  }
  else
  {
    v6 = -[BKUIFingerPrintEnrollmentPhaseViewController hideUnlockMessage](self, "hideUnlockMessage");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FINGER_CAN_BE_USED"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", v9, &stru_1EA281248, CFSTR("BiometricKitUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    v5 = CFSTR("SENSOR_IS_READY");
    v7 = CFSTR("BiometricKitUI");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1EA281248, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v8;
}

- (BOOL)_topTouchButtonIpad
{
  return MGGetSInt32Answer() == 2;
}

- (void)_updateButtonTraySize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D651B8]), "initWithTitle:detailText:icon:", &stru_1EA281248, &stru_1EA281248, 0);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addButton:", v3);

  -[BKUIFingerPrintEnrollmentPhaseViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v19, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  objc_msgSend(v19, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

  objc_msgSend(v19, "buttonTray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  -[BKUIFingerPrintEnrollmentPhaseViewController setButtonTraySize:](self, "setButtonTraySize:", v17, v18);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  -[BKUIFingerPrintEnrollmentPhaseViewController dealloc](&v4, sel_dealloc);
}

- (BKUIEmbeddedEnrollmentSelectionType)delegate
{
  return (BKUIEmbeddedEnrollmentSelectionType *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)enrollViewState
{
  return self->_enrollViewState;
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (BOOL)shouldShowFollowupFingerEnrollmentUpSell
{
  return self->_shouldShowFollowupFingerEnrollmentUpSell;
}

- (void)setShouldShowFollowupFingerEnrollmentUpSell:(BOOL)a3
{
  self->_shouldShowFollowupFingerEnrollmentUpSell = a3;
}

- (BOOL)showFollowUpEnrollmentUpSellContent
{
  return self->_showFollowUpEnrollmentUpSellContent;
}

- (void)setShowFollowUpEnrollmentUpSellContent:(BOOL)a3
{
  self->_showFollowUpEnrollmentUpSellContent = a3;
}

- (BOOL)isSecondEnrollment
{
  return self->_isSecondEnrollment;
}

- (void)setIsSecondEnrollment:(BOOL)a3
{
  self->_isSecondEnrollment = a3;
}

- (int64_t)initialInterfaceOrientation
{
  return self->_initialInterfaceOrientation;
}

- (void)setInitialInterfaceOrientation:(int64_t)a3
{
  self->_initialInterfaceOrientation = a3;
}

- (BKUIAlertView)alertView
{
  return self->_alertView;
}

- (void)setAlertView:(id)a3
{
  objc_storeStrong((id *)&self->_alertView, a3);
}

- (UIView)mesaEnrollErrorButtonsContainer
{
  return self->_mesaEnrollErrorButtonsContainer;
}

- (void)setMesaEnrollErrorButtonsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_mesaEnrollErrorButtonsContainer, a3);
}

- (UIButton)mesaEnrollErrorButtonRestartEnroll
{
  return self->_mesaEnrollErrorButtonRestartEnroll;
}

- (void)setMesaEnrollErrorButtonRestartEnroll:(id)a3
{
  objc_storeStrong((id *)&self->_mesaEnrollErrorButtonRestartEnroll, a3);
}

- (BOOL)hideUnlockMessage
{
  return self->_hideUnlockMessage;
}

- (void)setHideUnlockMessage:(BOOL)a3
{
  self->_hideUnlockMessage = a3;
}

- (BKUICurvesView)mesaFirstEnrollView
{
  return self->_mesaFirstEnrollView;
}

- (void)setMesaFirstEnrollView:(id)a3
{
  objc_storeStrong((id *)&self->_mesaFirstEnrollView, a3);
}

- (BKUICurvesView)mesaSecondEnrollView
{
  return self->_mesaSecondEnrollView;
}

- (void)setMesaSecondEnrollView:(id)a3
{
  objc_storeStrong((id *)&self->_mesaSecondEnrollView, a3);
}

- (NSArray)mesaEnrollContainerConstraints
{
  return self->_mesaEnrollContainerConstraints;
}

- (void)setMesaEnrollContainerConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_mesaEnrollContainerConstraints, a3);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (OBTrayButton)retryButton
{
  return self->_retryButton;
}

- (void)setRetryButton:(id)a3
{
  objc_storeStrong((id *)&self->_retryButton, a3);
}

- (OBTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, a3);
}

- (BOOL)rotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (NSLayoutConstraint)enrollCurvesViewTopConstraint
{
  return self->_enrollCurvesViewTopConstraint;
}

- (void)setEnrollCurvesViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_enrollCurvesViewTopConstraint, a3);
}

- (NSLayoutConstraint)enrollCurvesViewCenterConstraint
{
  return self->_enrollCurvesViewCenterConstraint;
}

- (void)setEnrollCurvesViewCenterConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_enrollCurvesViewCenterConstraint, a3);
}

- (BOOL)disableContentViewSizing
{
  return self->_disableContentViewSizing;
}

- (void)setDisableContentViewSizing:(BOOL)a3
{
  self->_disableContentViewSizing = a3;
}

- (double)innerAndOuterCurvesViewHeightDiff
{
  return self->_innerAndOuterCurvesViewHeightDiff;
}

- (void)setInnerAndOuterCurvesViewHeightDiff:(double)a3
{
  self->_innerAndOuterCurvesViewHeightDiff = a3;
}

- (double)enrollProgress
{
  return self->_enrollProgress;
}

- (void)setEnrollProgress:(double)a3
{
  self->_enrollProgress = a3;
}

- (BKUIIndicatorWindow)touchindicatorWindow
{
  return self->_touchindicatorWindow;
}

- (void)setTouchindicatorWindow:(id)a3
{
  objc_storeStrong((id *)&self->_touchindicatorWindow, a3);
}

- (CGSize)buttonTraySize
{
  double width;
  double height;
  CGSize result;

  width = self->_buttonTraySize.width;
  height = self->_buttonTraySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setButtonTraySize:(CGSize)a3
{
  self->_buttonTraySize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchindicatorWindow, 0);
  objc_storeStrong((id *)&self->_enrollCurvesViewCenterConstraint, 0);
  objc_storeStrong((id *)&self->_enrollCurvesViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_mesaEnrollContainerConstraints, 0);
  objc_storeStrong((id *)&self->_mesaSecondEnrollView, 0);
  objc_storeStrong((id *)&self->_mesaFirstEnrollView, 0);
  objc_storeStrong((id *)&self->_mesaEnrollErrorButtonRestartEnroll, 0);
  objc_storeStrong((id *)&self->_mesaEnrollErrorButtonsContainer, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->bkui_fingerprint_enroll_view_controller_log, 0);
}

- (void)_updateEnrollViewsForSize:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB281000, log, OS_LOG_TYPE_DEBUG, "BiometricKitUI: Updating enroll views for new size.", v1, 2u);
}

- (void)shouldAnimateEntireView
{
  int v3;
  double v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_1DB281000, log, OS_LOG_TYPE_DEBUG, "Enroll Height: %f\tButton Height: %f", (uint8_t *)&v3, 0x16u);
}

void __96__BKUIFingerPrintEnrollmentPhaseViewController_updateHeaderWithTitle_animated_heightDifference___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DB281000, log, OS_LOG_TYPE_FAULT, "FingerPrintEnrollmentPhaseViewController: The translation content for the header view's title of enrollment is way too long!", v1, 2u);
}

@end
