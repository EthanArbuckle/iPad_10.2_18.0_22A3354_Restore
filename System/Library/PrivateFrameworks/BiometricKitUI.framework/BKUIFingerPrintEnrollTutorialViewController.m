@implementation BKUIFingerPrintEnrollTutorialViewController

- (id)initInBuddy:(BOOL)a3 displayRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL8 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BKUIFingerPrintEnrollTutorialViewController *v14;
  void *v15;
  void *v16;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SET_UP_MESA"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("INTRO_TEXT"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  v14 = -[BKUIFingerPrintEnrollTutorialViewController initWithTitle:detailText:icon:contentLayout:](&v18, sel_initWithTitle_detailText_icon_contentLayout_, v11, v13, 0, 1);

  if (v14)
  {
    -[BKUIFingerPrintEnrollTutorialViewController setInBuddy:](v14, "setInBuddy:", v8);
    v14->_enrollViewState = 0;
    v14->_displayRect.origin.x = x;
    v14->_displayRect.origin.y = y;
    v14->_displayRect.size.width = width;
    v14->_displayRect.size.height = height;
    -[BKUIFingerPrintEnrollTutorialViewController tutorialImage](v14, "tutorialImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController enrollTutorialImageView](v14, "enrollTutorialImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v15);

  }
  return v14;
}

- (void)viewDidLoad
{
  OS_os_log *v3;
  OS_os_log *bkui_animation_view_log;
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
  BKUIFingerPrintPosedVideoPlayerView *v24;
  void *v25;
  void *v26;
  BKUIFingerPrintPosedVideoPlayerView *v27;
  void *v28;
  id v29;
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
  _QWORD v75[4];
  id v76;
  id location;
  objc_super v78;
  uint64_t v79;
  _QWORD v80[4];
  _QWORD v81[6];

  v81[4] = *MEMORY[0x1E0C80C00];
  v78.receiver = self;
  v78.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  -[OBBaseWelcomeController viewDidLoad](&v78, sel_viewDidLoad);
  v3 = (OS_os_log *)os_log_create("com.apple.biometrickitui", "TouchID Tutorial Animation View");
  bkui_animation_view_log = self->bkui_animation_view_log;
  self->bkui_animation_view_log = v3;

  -[BKUIFingerPrintEnrollTutorialViewController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrivacyLinkForBundles:", &unk_1EA2989E0);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollTutorialViewController setContinueButton:](self, "setContinueButton:", v6);

  -[BKUIFingerPrintEnrollTutorialViewController continueButton](self, "continueButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BKUIFingerPrintEnrollTutorialViewController continueButton](self, "continueButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  -[BKUIFingerPrintEnrollTutorialViewController continueButton](self, "continueButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__continuePressed_, 64);

  -[BKUIFingerPrintEnrollTutorialViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollTutorialViewController continueButton](self, "continueButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  if (-[BKUIFingerPrintEnrollTutorialViewController inBuddy](self, "inBuddy"))
  {
    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController setSkipButton:](self, "setSkipButton:", v14);

    -[BKUIFingerPrintEnrollTutorialViewController skipButton](self, "skipButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[BKUIFingerPrintEnrollTutorialViewController skipButton](self, "skipButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SKIP_ENROLL"), &stru_1EA281248, CFSTR("BiometricKitUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:forState:", v18, 0);

    -[BKUIFingerPrintEnrollTutorialViewController skipButton](self, "skipButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__enrollSkipped_, 64);

    -[BKUIFingerPrintEnrollTutorialViewController buttonTray](self, "buttonTray");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController skipButton](self, "skipButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addButton:", v21);

  }
  -[BKUIFingerPrintEnrollTutorialViewController setEnrollViewState:](self, "setEnrollViewState:", 0);
  -[BKUIFingerPrintEnrollTutorialViewController scrollView](self, "scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setMasksToBounds:", 0);

  if (-[BKUIFingerPrintEnrollTutorialViewController _topTouchButtonIpad](self, "_topTouchButtonIpad"))
  {
    v24 = [BKUIFingerPrintPosedVideoPlayerView alloc];
    -[BKUIFingerPrintEnrollTutorialViewController _videoAssetName](self, "_videoAssetName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController _devicePrefix](self, "_devicePrefix");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[BKUIFingerPrintPosedVideoPlayerView initWithAssetName:subdirectory:](v24, "initWithAssetName:subdirectory:", v25, v26);
    -[BKUIFingerPrintEnrollTutorialViewController setPosedVideoPlayerView:](self, "setPosedVideoPlayerView:", v27);

    -[BKUIFingerPrintEnrollTutorialViewController posedVideoPlayerView](self, "posedVideoPlayerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v29 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v74 = (void *)objc_msgSend(v29, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v74, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMasksToBounds:", 1);

    -[BKUIFingerPrintEnrollTutorialViewController posedVideoPlayerView](self, "posedVideoPlayerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addSubview:", v31);

    v59 = (void *)MEMORY[0x1E0CB3718];
    -[BKUIFingerPrintEnrollTutorialViewController posedVideoPlayerView](self, "posedVideoPlayerView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v68);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v66;
    -[BKUIFingerPrintEnrollTutorialViewController posedVideoPlayerView](self, "posedVideoPlayerView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v60;
    -[BKUIFingerPrintEnrollTutorialViewController posedVideoPlayerView](self, "posedVideoPlayerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v81[2] = v35;
    -[BKUIFingerPrintEnrollTutorialViewController posedVideoPlayerView](self, "posedVideoPlayerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v81[3] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "activateConstraints:", v40);

  }
  else
  {
    -[BKUIFingerPrintEnrollTutorialViewController enrollTutorialImageView](self, "enrollTutorialImageView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BKUIFingerPrintEnrollTutorialViewController contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addSubview:", v74);

  -[BKUIFingerPrintEnrollTutorialViewController contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBackgroundColor:", v43);

  objc_msgSend(v74, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollTutorialViewController contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollTutorialViewController _contentViewTopOffset](self, "_contentViewTopOffset");
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollTutorialViewController setContentViewTopConstraint:](self, "setContentViewTopConstraint:", v47);

  v63 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIFingerPrintEnrollTutorialViewController contentViewTopConstraint](self, "contentViewTopConstraint");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v73;
  objc_msgSend(v74, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollTutorialViewController contentView](self, "contentView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "bottomAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v67);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v65;
  objc_msgSend(v74, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollTutorialViewController contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v51;
  objc_msgSend(v74, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollTutorialViewController contentView](self, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v80[3] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "activateConstraints:", v56);

  -[BKUIFingerPrintEnrollTutorialViewController _setupTouchIDAnimation](self, "_setupTouchIDAnimation");
  -[BKUIFingerPrintEnrollTutorialViewController loadAVPlayer](self, "loadAVPlayer");
  objc_initWeak(&location, self);
  v79 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __58__BKUIFingerPrintEnrollTutorialViewController_viewDidLoad__block_invoke;
  v75[3] = &unk_1EA27FB48;
  objc_copyWeak(&v76, &location);
  -[BKUIFingerPrintEnrollTutorialViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v57, v75);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollTutorialViewController setTraitChangeRegistration:](self, "setTraitChangeRegistration:", v58);

  objc_destroyWeak(&v76);
  objc_destroyWeak(&location);

}

void __58__BKUIFingerPrintEnrollTutorialViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tutorialImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "enrollTutorialImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[BKUIFingerPrintEnrollTutorialViewController _contentViewTopOffset](self, "_contentViewTopOffset");
  v4 = v3;
  -[BKUIFingerPrintEnrollTutorialViewController contentViewTopConstraint](self, "contentViewTopConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[BKUIFingerPrintEnrollTutorialViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performInitialAnimationSetup, 0, 0.5);
}

- (void)_performInitialAnimationSetup
{
  void *v3;
  void *v4;
  id v5;

  -[BKUIFingerPrintEnrollTutorialViewController animationTimer](self, "animationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[BKUIFingerPrintEnrollTutorialViewController animationController](self, "animationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startAnimation");

    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__restartAnimation, 0, 1, 5.0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController setAnimationTimer:](self, "setAnimationTimer:", v5);

  }
}

- (void)_restartAnimation
{
  void *v3;
  id v4;

  -[BKUIFingerPrintEnrollTutorialViewController animationController](self, "animationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimation");

  -[BKUIFingerPrintEnrollTutorialViewController animationController](self, "animationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimation");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  -[BKUIFingerPrintEnrollTutorialViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[BKUIFingerPrintEnrollTutorialViewController animationTimer](self, "animationTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[BKUIFingerPrintEnrollTutorialViewController setAnimationTimer:](self, "setAnimationTimer:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  v7 = a4;
  -[OBBaseWelcomeController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__BKUIFingerPrintEnrollTutorialViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1EA2802E8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __98__BKUIFingerPrintEnrollTutorialViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "posedVideoPlayerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionToOrientation:", objc_msgSend(v4, "interfaceOrientation"));

}

- (id)tutorialText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SCAN_FINGER_HOME"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BKUIFingerPrintEnrollTutorialViewController _topTouchButtonIpad](self, "_topTouchButtonIpad"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SCAN_FINGER_HOME_FOLLOW_UP"), &stru_1EA281248, CFSTR("Mesa-j307"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (id)combinedTutorialText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INTRO_TEXT"), &stru_1EA281248, CFSTR("BiometricKitUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintEnrollTutorialViewController tutorialText](self, "tutorialText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\n%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIImageView)enrollTutorialImageView
{
  UIImageView *enrollTutorialImageView;
  UIImageView *v4;
  UIImageView *v5;
  void *v6;

  enrollTutorialImageView = self->_enrollTutorialImageView;
  if (!enrollTutorialImageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    v5 = self->_enrollTutorialImageView;
    self->_enrollTutorialImageView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_enrollTutorialImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](self->_enrollTutorialImageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](self->_enrollTutorialImageView, "setClipsToBounds:", 0);
    -[UIImageView setAccessibilityIgnoresInvertColors:](self->_enrollTutorialImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[BKUIFingerPrintEnrollTutorialViewController tutorialImage](self, "tutorialImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_enrollTutorialImageView, "setImage:", v6);

    enrollTutorialImageView = self->_enrollTutorialImageView;
  }
  return enrollTutorialImageView;
}

- (id)tutorialImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceStyleSpecificImageInBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_continuePressed:(id)a3
{
  id v4;

  -[BKUIFingerPrintEnrollTutorialViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didSelectPrimaryButton:", self);

}

- (void)_enrollSkipped:(id)a3
{
  id v4;

  -[BKUIFingerPrintEnrollTutorialViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didSelectSecondaryButton:", self);

}

- (void)setEnrollViewState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  self->_enrollViewState = a3;
  if (a3 - 2 < 3)
  {
    -[BKUIFingerPrintEnrollTutorialViewController setEnrollViewState:](self, "setEnrollViewState:", 0);
    return;
  }
  if (a3 == 1)
  {
    -[BKUIFingerPrintEnrollTutorialViewController headerView](self, "headerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController _headerTitlePhase2](self, "_headerTitlePhase2");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v19);

    -[BKUIFingerPrintEnrollTutorialViewController headerView](self, "headerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("KEEP_GOING"), &stru_1EA281248, CFSTR("BiometricKitUI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDetailText:", v22);

    -[BKUIFingerPrintEnrollTutorialViewController headerView](self, "headerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutIfNeeded");

    -[BKUIFingerPrintEnrollTutorialViewController buttonTray](self, "buttonTray");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeAllButtons");

    -[BKUIFingerPrintEnrollTutorialViewController buttonTray](self, "buttonTray");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController continueButton](self, "continueButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addButton:", v26);

    -[BKUIFingerPrintEnrollTutorialViewController tutorialImage](self, "tutorialImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController enrollTutorialImageView](self, "enrollTutorialImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setImage:", v27);

    -[BKUIFingerPrintEnrollTutorialViewController view](self, "view");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutIfNeeded");
LABEL_14:

    return;
  }
  if (!a3)
  {
    -[BKUIFingerPrintEnrollTutorialViewController headerView](self, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController _headerTitlePhase1](self, "_headerTitlePhase1");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v5);

    -[BKUIFingerPrintEnrollTutorialViewController tutorialImage](self, "tutorialImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController enrollTutorialImageView](self, "enrollTutorialImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

    -[BKUIFingerPrintEnrollTutorialViewController headerView](self, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

    -[BKUIFingerPrintEnrollTutorialViewController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllButtons");

    if (-[BKUIFingerPrintEnrollTutorialViewController inBuddy](self, "inBuddy"))
    {
      -[BKUIFingerPrintEnrollTutorialViewController buttonTray](self, "buttonTray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollTutorialViewController continueButton](self, "continueButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addButton:", v11);

      v12 = -[BKUIFingerPrintEnrollTutorialViewController isSecondEnrollment](self, "isSecondEnrollment");
      -[BKUIFingerPrintEnrollTutorialViewController skipButton](self, "skipButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v12)
      {
        v16 = CFSTR("SKIP_ENROLL_FOLLOW_UP");
        v17 = CFSTR("Mesa-j307");
      }
      else
      {
        v16 = CFSTR("SKIP_ENROLL");
        v17 = CFSTR("BiometricKitUI");
      }
      objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1EA281248, v17);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitle:forState:", v31, 0);

      -[BKUIFingerPrintEnrollTutorialViewController buttonTray](self, "buttonTray");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollTutorialViewController skipButton](self, "skipButton");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addButton:", v33);

      -[BKUIFingerPrintEnrollTutorialViewController headerView](self, "headerView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollTutorialViewController _detailTextPhase1](self, "_detailTextPhase1");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BKUIFingerPrintEnrollTutorialViewController headerView](self, "headerView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFingerPrintEnrollTutorialViewController combinedTutorialText](self, "combinedTutorialText");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v34 = (void *)v30;
    objc_msgSend(v29, "setDetailText:", v30);

    -[BKUIFingerPrintEnrollTutorialViewController posedVideoPlayerView](self, "posedVideoPlayerView");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintEnrollTutorialViewController _videoAssetName](self, "_videoAssetName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAssetName:", v35);

    goto LABEL_14;
  }
}

- (double)_contentViewHeight
{
  _BOOL4 v3;
  double v4;
  float v5;
  float v6;

  v3 = -[BKUIFingerPrintEnrollTutorialViewController _topTouchButtonIpad](self, "_topTouchButtonIpad");
  -[BKUIFingerPrintEnrollTutorialViewController displayRect](self, "displayRect");
  v5 = v4 * 0.36;
  v6 = fmaxf(v5, 200.0);
  if (v3)
    return (float)(v6 + 30.0);
  return v6;
}

- (id)_headerTitlePhase1
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  if (-[BKUIFingerPrintEnrollTutorialViewController showFollowUpEnrollmentUpSellContent](self, "showFollowUpEnrollmentUpSellContent")&& -[BKUIFingerPrintEnrollTutorialViewController isSecondEnrollment](self, "isSecondEnrollment"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SET_UP_MESA_FOLLOW_UP");
    v6 = CFSTR("Mesa-j307");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SET_UP_MESA");
    v6 = CFSTR("BiometricKitUI");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA281248, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_detailTextPhase1
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  if (-[BKUIFingerPrintEnrollTutorialViewController showFollowUpEnrollmentUpSellContent](self, "showFollowUpEnrollmentUpSellContent")&& -[BKUIFingerPrintEnrollTutorialViewController isSecondEnrollment](self, "isSecondEnrollment"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("INTRO_TEXT_FOLLOW_UP_SECOND_FINGER_IPAD");
    v6 = CFSTR("Mesa-j307");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("INTRO_TEXT");
    v6 = CFSTR("BiometricKitUI");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA281248, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_headerTitlePhase2
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v2 = -[BKUIFingerPrintEnrollTutorialViewController _topTouchButtonIpad](self, "_topTouchButtonIpad");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v5 = CFSTR("ADJUST_GRIP_FOLLOW_UP");
    v6 = CFSTR("Mesa-j307");
  }
  else
  {
    v5 = CFSTR("ADJUST_GRIP");
    v6 = CFSTR("BiometricKitUI");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA281248, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_videoAssetName
{
  void *v3;
  int64_t v4;
  const __CFString *v5;
  int64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  -[BKUIFingerPrintEnrollTutorialViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[BKUIUtils activeInterfaceOrientationForView:](BKUIUtils, "activeInterfaceOrientationForView:", v3);

  v5 = CFSTR("_V");
  if (!-[BKUIFingerPrintEnrollTutorialViewController enrollViewState](self, "enrollViewState"))
  {
    if (-[BKUIFingerPrintEnrollTutorialViewController isSecondEnrollment](self, "isSecondEnrollment"))
    {
      v6 = -[BKUIFingerPrintEnrollTutorialViewController initialInterfaceOrientation](self, "initialInterfaceOrientation");
      v7 = CFSTR("_V");
      v8 = CFSTR("_H_rotate");
      if ((unint64_t)(v4 - 3) >= 2)
        v8 = CFSTR("_V");
      if ((unint64_t)(v6 - 3) <= 1)
        v9 = v8;
      else
        v9 = CFSTR("_V");
      if ((unint64_t)(v4 - 3) < 2)
        v7 = CFSTR("_H");
      if ((unint64_t)(v4 - 1) < 2)
        v7 = CFSTR("_V_rotate");
      if ((unint64_t)(v6 - 1) <= 1)
        v5 = v7;
      else
        v5 = v9;
    }
    else if ((unint64_t)(v4 - 3) < 2)
    {
      v5 = CFSTR("_H");
    }
  }
  -[BKUIFingerPrintEnrollTutorialViewController _devicePrefix](self, "_devicePrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)loadAVPlayer
{
  _BOOL4 IsReduceMotionEnabled;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  if (!-[BKUIFingerPrintEnrollTutorialViewController enrollViewState](self, "enrollViewState"))
  {
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    -[BKUIFingerPrintEnrollTutorialViewController posedVideoPlayerView](self, "posedVideoPlayerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (IsReduceMotionEnabled)
    {
      objc_msgSend(v4, "setAlpha:", 0.0);

      -[BKUIFingerPrintEnrollTutorialViewController posedVideoPlayerView](self, "posedVideoPlayerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "load");

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __59__BKUIFingerPrintEnrollTutorialViewController_loadAVPlayer__block_invoke;
      v7[3] = &unk_1EA27FB98;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v7, 1.0);
    }
    else
    {
      objc_msgSend(v4, "load");

    }
  }
}

void __59__BKUIFingerPrintEnrollTutorialViewController_loadAVPlayer__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "posedVideoPlayerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

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

- (id)_devicePrefix
{
  const __CFString *v2;
  uint64_t v3;

  v2 = CFSTR("iPadMini2021");
  v3 = MGGetProductType();
  if (v3 > 2903084587)
  {
    if (v3 == 2903084588)
      return (id)v2;
    if (v3 != 4242862982)
      return CFSTR("J307");
    return CFSTR("iPadEDU2022");
  }
  if (v3 == 1878257790)
    return CFSTR("iPadEDU2022");
  if (v3 != 1895344378)
    return CFSTR("J307");
  return (id)v2;
}

- (void)_setupTouchIDAnimation
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB281000, log, OS_LOG_TYPE_ERROR, "animation url not found in bundle", v1, 2u);
}

- (double)_contentViewTopOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;

  -[BKUIFingerPrintEnrollTutorialViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = -v5;
  -[BKUIFingerPrintEnrollTutorialViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statusBarManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "statusBarFrame");
  v13 = v6 - v12;

  -[BKUIFingerPrintEnrollTutorialViewController presentingViewController](self, "presentingViewController");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isIdiomPad");

    if (v17)
    {
      -[BKUIFingerPrintEnrollTutorialViewController navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "navigationBar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v13 = -v20;

    }
  }
  return v13;
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

- (OBTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (CGRect)displayRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_displayRect.origin.x;
  y = self->_displayRect.origin.y;
  width = self->_displayRect.size.width;
  height = self->_displayRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDisplayRect:(CGRect)a3
{
  self->_displayRect = a3;
}

- (void)setEnrollTutorialImageView:(id)a3
{
  objc_storeStrong((id *)&self->_enrollTutorialImageView, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (BKUIAnimationView)animationView
{
  return self->_animationView;
}

- (void)setAnimationView:(id)a3
{
  objc_storeStrong((id *)&self->_animationView, a3);
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewTopConstraint, a3);
}

- (BKUIFingerPrintPosedVideoPlayerView)posedVideoPlayerView
{
  return self->_posedVideoPlayerView;
}

- (void)setPosedVideoPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_posedVideoPlayerView, a3);
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void)setAnimationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_animationTimer, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_storeStrong((id *)&self->_posedVideoPlayerView, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_enrollTutorialImageView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->bkui_animation_view_log, 0);
}

@end
