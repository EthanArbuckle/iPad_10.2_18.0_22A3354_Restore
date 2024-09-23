@implementation CPSLaunchContentViewController

- (void)loadView
{
  CPSProxCardAutoSizingView *v3;

  v3 = objc_alloc_init(CPSProxCardAutoSizingView);
  -[CPSLaunchContentViewController setView:](self, "setView:");

}

- (CPSLaunchContentViewController)initWithURL:(id)a3
{
  id v4;
  CPSSessionProxy *v5;
  CPSSessionProxy *sessionProxy;
  CPSLaunchContentViewController *v7;
  objc_super v9;

  v4 = a3;
  if (v4
    && (v9.receiver = self,
        v9.super_class = (Class)CPSLaunchContentViewController,
        (self = -[CPSLaunchContentViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0)) != 0))
  {
    v5 = (CPSSessionProxy *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10820]), "initWithURL:", v4);
    sessionProxy = self->_sessionProxy;
    self->_sessionProxy = v5;

    -[CPSSessionProxy setDelegate:](self->_sessionProxy, "setDelegate:", self);
    -[CPSSessionProxy connectToService](self->_sessionProxy, "connectToService");
    self->_shouldPlaySoundAndHaptic = 1;
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CPSLaunchContentViewController)initWithURL:(id)a3 displayMode:(unint64_t)a4
{
  CPSLaunchContentViewController *v5;
  CPSLaunchContentViewController *v6;
  CPSLaunchContentViewController *v7;

  v5 = -[CPSLaunchContentViewController initWithURL:](self, "initWithURL:", a3);
  v6 = v5;
  if (v5)
  {
    v5->_displayMode = a4;
    if (a4 == 1)
      v5->_shouldPlaySoundAndHaptic = 0;
    v7 = v5;
  }

  return v6;
}

- (CPSLaunchContentViewController)initWithMetadata:(id)a3
{
  id v5;
  void *v6;
  CPSLaunchContentViewController *v7;
  CPSLaunchContentViewController *v8;

  v5 = a3;
  objc_msgSend(v5, "clipURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CPSLaunchContentViewController initWithURL:](self, "initWithURL:", v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_clipMetadata, a3);
    -[CPSSessionProxy prewarmClip](v7->_sessionProxy, "prewarmClip");
    v8 = v7;
  }

  return v7;
}

- (CPSLaunchContentViewController)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-initWithCoder: is not supported."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (CPSLaunchContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-initWithNibName:bundle: is not supported."), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPSLaunchContentViewController;
  -[CPSLaunchContentViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[CPSLaunchContentViewController setUpCard](self, "setUpCard");
  -[CPSLaunchContentViewController setUpHeroSection](self, "setUpHeroSection");
  -[CPSLaunchContentViewController setUpInformationSection](self, "setUpInformationSection");
  -[CPSLaunchContentViewController _updateContent](self, "_updateContent");
  v3 = (void *)MEMORY[0x1E0CEAB40];
  -[CPSLaunchContentViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cps_invocationCardPreferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithPreferredContentSizeCategory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLaunchContentViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setLocalOverrideTraitCollection:", v6);

  -[CPSLaunchContentViewController createNetworkPathMonitor](self, "createNetworkPathMonitor");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSLaunchContentViewController;
  -[CPSLaunchContentViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (self->_shouldPlaySoundAndHaptic)
  {
    self->_shouldPlaySoundAndHaptic = 0;
    -[CPSLaunchContentViewController playSoundAndHaptic](self, "playSoundAndHaptic");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void (**delayedPermissionViewUnhideBlock)(void);
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPSLaunchContentViewController;
  -[CPSLaunchContentViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  delayedPermissionViewUnhideBlock = (void (**)(void))self->_delayedPermissionViewUnhideBlock;
  if (delayedPermissionViewUnhideBlock)
  {
    delayedPermissionViewUnhideBlock[2]();
    v5 = self->_delayedPermissionViewUnhideBlock;
    self->_delayedPermissionViewUnhideBlock = 0;

  }
}

- (void)playSoundAndHaptic
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1D0512000, log, OS_LOG_TYPE_ERROR, "Error creating system sound ID for audio URL: %@ status: (%d)", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_3();
}

uint64_t __52__CPSLaunchContentViewController_playSoundAndHaptic__block_invoke(uint64_t a1)
{
  return AudioServicesDisposeSystemSoundID(*(_DWORD *)(a1 + 32));
}

- (void)setUpCard
{
  -[CPSLaunchContentViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 6);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)CPSLaunchContentViewController;
  -[CPSLaunchContentViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[CPSLaunchContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[CPSLaunchContentViewController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", CGRectGetWidth(v6));

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__CPSLaunchContentViewController_viewDidLayoutSubviews__block_invoke;
  v4[3] = &unk_1E8E8B1A8;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v4);
}

uint64_t __55__CPSLaunchContentViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadiusForButtons");
}

- (void)_updateCornerRadiusForButtons
{
  UIButton *v3;

  -[CPSVibrantButton updateCornerRadius](self->_closeButton, "updateCornerRadius");
  -[CPSVibrantButton updateCornerRadius](self->_openVibrantButton, "updateCornerRadius");
  v3 = self->_openButton;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIButton updateCornerRadius](v3, "updateCornerRadius");

}

- (void)updateViewConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *heroContainerAspectRatioConstraint;
  objc_super v10;

  -[NSLayoutConstraint setActive:](self->_heroContainerAspectRatioConstraint, "setActive:", 0);
  -[CPSLaunchContentViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass");

  -[UIView widthAnchor](self->_heroContainerView, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_heroContainerView, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1.5;
  if (v4 == 1)
    v7 = 2.0;
  objc_msgSend(v5, "constraintEqualToAnchor:multiplier:", v6, v7);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heroContainerAspectRatioConstraint = self->_heroContainerAspectRatioConstraint;
  self->_heroContainerAspectRatioConstraint = v8;

  -[NSLayoutConstraint setActive:](self->_heroContainerAspectRatioConstraint, "setActive:", 1);
  v10.receiver = self;
  v10.super_class = (Class)CPSLaunchContentViewController;
  -[CPSLaunchContentViewController updateViewConstraints](&v10, sel_updateViewConstraints);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CPSLaunchContentViewController;
  -[CPSLaunchContentViewController traitCollectionDidChange:](&v25, sel_traitCollectionDidChange_, v4);
  -[CPSLaunchContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLaunchContentViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cps_invocationCardPreferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cps_invocationCardPreferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setLocalOverrideTraitCollection:", v10);

  }
  if (self->_displayMode == 1)
  {
    -[CPSLaunchContentViewController traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) == 0)
    {
      -[CPSLaunchContentViewController traitCollection](self, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preferredContentSizeCategory");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      inlineCardButtonFont(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSVibrantButton uiButton](self->_openVibrantButton, "uiButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "titleLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFont:", v17);

      -[CPSLaunchContentViewController traitCollection](self, "traitCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferredContentSizeCategory");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      inlineCardButtonFont(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSVibrantButton uiButton](self->_closeButton, "uiButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "titleLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFont:", v22);

    }
  }
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)setUpHeroSection
{
  UIView *v3;
  UIView *heroContainerView;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *heroImageView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CPSVibrantButton *v17;
  CPSVibrantButton *closeButton;
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
  _QWORD v44[2];
  _QWORD v45[9];

  v45[7] = *MEMORY[0x1E0C80C00];
  -[CPSLaunchContentViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  heroContainerView = self->_heroContainerView;
  self->_heroContainerView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v43, "addSubview:", self->_heroContainerView);
  v5 = (void *)MEMORY[0x1E0CEA658];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cps_imageViewWithImage:tintColor:backgroundColor:", 0, 0, v6);
  v7 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  heroImageView = self->_heroImageView;
  self->_heroImageView = v7;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_heroImageView, "setAccessibilityIgnoresInvertColors:", 1);
  -[UIView addSubview:](self->_heroContainerView, "addSubview:", self->_heroImageView);
  v9 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](self->_heroContainerView, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v36;
  -[UIView leadingAnchor](self->_heroContainerView, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v34;
  -[UIView trailingAnchor](self->_heroContainerView, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v32;
  -[UIImageView topAnchor](self->_heroImageView, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_heroContainerView, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v30;
  -[UIImageView bottomAnchor](self->_heroImageView, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_heroContainerView, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v28;
  -[UIImageView leadingAnchor](self->_heroImageView, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_heroContainerView, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v12;
  -[UIImageView trailingAnchor](self->_heroImageView, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_heroContainerView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConstraints:", v16);

  if (self->_displayMode != 1)
  {
    v17 = -[CPSVibrantButton initWithButtonType:]([CPSVibrantButton alloc], "initWithButtonType:", 7);
    closeButton = self->_closeButton;
    self->_closeButton = v17;

    -[CPSVibrantButton setTranslatesAutoresizingMaskIntoConstraints:](self->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSVibrantButton uiButton](self->_closeButton, "uiButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_dismiss_, 64);

    -[UIView addSubview:](self->_heroContainerView, "addSubview:", self->_closeButton);
    v20 = (void *)MEMORY[0x1E0CB3718];
    -[UIView trailingAnchor](self->_heroContainerView, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantButton trailingAnchor](self->_closeButton, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 16.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v23;
    -[CPSVibrantButton topAnchor](self->_closeButton, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_heroContainerView, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 16.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v27);

  }
}

- (void)setUpInformationSection
{
  UIView *v3;
  UIView *informationContainerView;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *heroMirrorImageView;
  void *v9;
  id v10;
  void *v11;
  CPSAppClipUnavailableView *v12;
  CPSAppClipUnavailableView *unavailableView;
  void *v14;
  UIStackView *v15;
  UIStackView *informationContentView;
  CPSPermissionView *v17;
  CPSPermissionView *permissionView;
  UIView *v19;
  UIView *separatorView;
  CPSAppMetadataView *v21;
  CPSAppMetadataView *appMetadataView;
  void *v23;
  void *v24;
  double v25;
  void *v26;
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
  id v107;
  CGAffineTransform v108;
  CGAffineTransform v109;
  _QWORD v110[28];

  v110[26] = *MEMORY[0x1E0C80C00];
  -[CPSLaunchContentViewController view](self, "view");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  informationContainerView = self->_informationContainerView;
  self->_informationContainerView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_informationContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v106, "addSubview:", self->_informationContainerView);
  v5 = (void *)MEMORY[0x1E0CEA658];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cps_imageViewWithImage:tintColor:backgroundColor:", 0, 0, v6);
  v7 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  heroMirrorImageView = self->_heroMirrorImageView;
  self->_heroMirrorImageView = v7;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroMirrorImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  CGAffineTransformMakeScale(&v109, 1.0, -1.0);
  -[UIImageView layer](self->_heroMirrorImageView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v109;
  objc_msgSend(v9, "setAffineTransform:", &v108);

  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_heroMirrorImageView, "setAccessibilityIgnoresInvertColors:", 1);
  -[UIView addSubview:](self->_informationContainerView, "addSubview:", self->_heroMirrorImageView);
  v10 = objc_alloc(MEMORY[0x1E0CEABE8]);
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)objc_msgSend(v10, "initWithEffect:", v11);

  objc_msgSend(v104, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_informationContainerView, "addSubview:", v104);
  objc_msgSend(v104, "contentView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_alloc_init(MEMORY[0x1E0CEA970]);
  objc_msgSend(v107, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v107, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v105, "addSubview:", v107);
  v12 = objc_alloc_init(CPSAppClipUnavailableView);
  unavailableView = self->_unavailableView;
  self->_unavailableView = v12;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppClipUnavailableView setBackgroundColor:](self->_unavailableView, "setBackgroundColor:", v14);

  -[CPSAppClipUnavailableView setTranslatesAutoresizingMaskIntoConstraints:](self->_unavailableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSAppClipUnavailableView setHidden:](self->_unavailableView, "setHidden:", 1);
  objc_msgSend(v105, "addSubview:", self->_unavailableView);
  v15 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0CEA9E0]);
  informationContentView = self->_informationContentView;
  self->_informationContentView = v15;

  -[UIStackView setAxis:](self->_informationContentView, "setAxis:", 1);
  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_informationContentView, "setLayoutMarginsRelativeArrangement:", 1);
  -[UIStackView setInsetsLayoutMarginsFromSafeArea:](self->_informationContentView, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[UIStackView setDirectionalLayoutMargins:](self->_informationContentView, "setDirectionalLayoutMargins:", 0.0, 24.0, 0.0, 24.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_informationContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v107, "addSubview:", self->_informationContentView);
  -[UIStackView cps_addArrangedSpacerWithHeight:](self->_informationContentView, "cps_addArrangedSpacerWithHeight:", 20.0);
  -[CPSLaunchContentViewController setUpClipInformationContainerView](self, "setUpClipInformationContainerView");
  -[UIStackView addArrangedSubview:](self->_informationContentView, "addArrangedSubview:", self->_clipInformationContainerView);
  -[UIStackView setCustomSpacing:afterView:](self->_informationContentView, "setCustomSpacing:afterView:", self->_clipInformationContainerView, 32.0);
  v17 = objc_alloc_init(CPSPermissionView);
  permissionView = self->_permissionView;
  self->_permissionView = v17;

  -[CPSPermissionView setTranslatesAutoresizingMaskIntoConstraints:](self->_permissionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSPermissionView setHidden:](self->_permissionView, "setHidden:", 1);
  -[UIStackView addArrangedSubview:](self->_informationContentView, "addArrangedSubview:", self->_permissionView);
  objc_msgSend(MEMORY[0x1E0CEABB0], "cps_vibrantSeparator");
  v19 = (UIView *)objc_claimAutoreleasedReturnValue();
  separatorView = self->_separatorView;
  self->_separatorView = v19;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_informationContentView, "addArrangedSubview:", self->_separatorView);
  -[UIStackView setCustomSpacing:afterView:](self->_informationContentView, "setCustomSpacing:afterView:", self->_separatorView, 11.0);
  v21 = objc_alloc_init(CPSAppMetadataView);
  appMetadataView = self->_appMetadataView;
  self->_appMetadataView = v21;

  -[CPSAppMetadataView setTranslatesAutoresizingMaskIntoConstraints:](self->_appMetadataView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSAppMetadataView addTarget:action:forControlEvents:](self->_appMetadataView, "addTarget:action:forControlEvents:", self, sel_openAppStore, 0x2000);
  -[CPSAppMetadataView setUserInteractionEnabled:](self->_appMetadataView, "setUserInteractionEnabled:", 0);
  -[UIStackView addArrangedSubview:](self->_informationContentView, "addArrangedSubview:", self->_appMetadataView);
  -[UIStackView cps_addArrangedSpacerWithHeight:](self->_informationContentView, "cps_addArrangedSpacerWithHeight:", 24.0);
  objc_msgSend(v107, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView heightAnchor](self->_informationContentView, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v25) = 1132068864;
  objc_msgSend(v103, "setPriority:", v25);
  v26 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](self->_informationContainerView, "topAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_heroContainerView, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v78;
  -[UIView leadingAnchor](self->_informationContainerView, "leadingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v76;
  -[UIView trailingAnchor](self->_informationContainerView, "trailingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v74;
  -[UIView bottomAnchor](self->_informationContainerView, "bottomAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v110[3] = v72;
  -[CPSAppClipUnavailableView topAnchor](self->_unavailableView, "topAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_heroContainerView, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v110[4] = v70;
  -[CPSAppClipUnavailableView leadingAnchor](self->_unavailableView, "leadingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v110[5] = v68;
  -[CPSAppClipUnavailableView trailingAnchor](self->_unavailableView, "trailingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v110[6] = v66;
  -[CPSAppClipUnavailableView bottomAnchor](self->_unavailableView, "bottomAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "bottomAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v110[7] = v64;
  -[UIImageView topAnchor](self->_heroMirrorImageView, "topAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_informationContainerView, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v110[8] = v62;
  -[UIImageView leadingAnchor](self->_heroMirrorImageView, "leadingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_heroImageView, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v110[9] = v60;
  -[UIImageView trailingAnchor](self->_heroMirrorImageView, "trailingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_heroImageView, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v110[10] = v58;
  -[UIImageView heightAnchor](self->_heroMirrorImageView, "heightAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView heightAnchor](self->_heroImageView, "heightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v110[11] = v56;
  objc_msgSend(v104, "topAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_informationContainerView, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v110[12] = v54;
  objc_msgSend(v104, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_informationContainerView, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v110[13] = v52;
  objc_msgSend(v104, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_informationContainerView, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v110[14] = v50;
  objc_msgSend(v104, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_informationContainerView, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v110[15] = v48;
  objc_msgSend(v107, "topAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v110[16] = v46;
  objc_msgSend(v107, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v110[17] = v44;
  objc_msgSend(v105, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v110[18] = v42;
  objc_msgSend(v105, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v110[19] = v40;
  -[UIStackView topAnchor](self->_informationContentView, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v110[20] = v38;
  -[UIStackView leadingAnchor](self->_informationContentView, "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v110[21] = v36;
  -[UIStackView trailingAnchor](self->_informationContentView, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v110[22] = v28;
  -[UIStackView bottomAnchor](self->_informationContentView, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v110[23] = v31;
  objc_msgSend(v107, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView widthAnchor](self->_informationContentView, "widthAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v110[24] = v34;
  v110[25] = v103;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 26);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v35);

}

- (id)_setUpOpenButtonIfNeeded
{
  void *openButton;
  id v4;
  void *v5;
  CPSVibrantButton *v6;
  CPSVibrantButton *openVibrantButton;
  UIButton *v8;
  UIButton *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  UIButton *v14;
  void *v15;
  CPSButton *v16;
  void *v17;
  void *v18;
  UIButton *v19;
  UIButton *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;

  openButton = self->_openButton;
  if (openButton)
  {
    if (self->_openVibrantButton)
      openButton = self->_openVibrantButton;
    v4 = openButton;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "cps_colorNamed:", CFSTR("disabledOpenButtonBackground"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_displayMode == 1)
    {
      v6 = -[CPSVibrantButton initWithButtonType:]([CPSVibrantButton alloc], "initWithButtonType:", 0);
      openVibrantButton = self->_openVibrantButton;
      self->_openVibrantButton = v6;

      -[CPSVibrantButton uiButton](self->_openVibrantButton, "uiButton");
      v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v9 = self->_openButton;
      self->_openButton = v8;

      -[CPSLaunchContentViewController traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredContentSizeCategory");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      inlineCardButtonFont(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton titleLabel](self->_openButton, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v12);

      v14 = self->_openButton;
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](v14, "setTitleColor:forState:", v15, 0);

      -[CPSVibrantButton setTranslatesAutoresizingMaskIntoConstraints:](self->_openVibrantButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CPSVibrantButton setAdjustFontSizeToFitWidth:](self->_openVibrantButton, "setAdjustFontSizeToFitWidth:", 1);
    }
    else
    {
      v16 = [CPSButton alloc];
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[CPSButton initWithTitle:enabledTitleColor:disabledTitleColor:backgroundColor:textStyle:cornerRadius:animatesAlphaWhenHighlighted:](v16, "initWithTitle:enabledTitleColor:disabledTitleColor:backgroundColor:textStyle:cornerRadius:animatesAlphaWhenHighlighted:", 0, v17, v18, v5, *MEMORY[0x1E0CEB568], 1, 0.0);
      v20 = self->_openButton;
      self->_openButton = v19;

      -[UIButton titleLabel](self->_openButton, "titleLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAdjustsFontForContentSizeCategory:", 1);

    }
    -[UIButton setContentEdgeInsets:](self->_openButton, "setContentEdgeInsets:", 12.0, 18.0, 12.0, 18.0);
    -[UIButton setEnabled:](self->_openButton, "setEnabled:", 0);
    -[UIButton setHidden:](self->_openButton, "setHidden:", 1);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_openButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v22) = 1144766464;
    -[UIButton setContentCompressionResistancePriority:forAxis:](self->_openButton, "setContentCompressionResistancePriority:forAxis:", 0, v22);
    LODWORD(v23) = 1132134400;
    -[UIButton setContentHuggingPriority:forAxis:](self->_openButton, "setContentHuggingPriority:forAxis:", 0, v23);
    v24 = self->_openVibrantButton;
    if (!v24)
      v24 = self->_openButton;
    v4 = v24;

  }
  return v4;
}

- (void)setUpClipInformationContainerView
{
  UIView *v3;
  UIView *clipInformationContainerView;
  CPSVibrantLabel *v5;
  CPSVibrantLabel *v6;
  CPSVibrantLabel *clipNameVibrantLabel;
  uint64_t v8;
  CPSVibrantLabel *v9;
  CPSVibrantLabel *v10;
  CPSVibrantLabel *clipDescriptionVibrantLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CPSVibrantButton *v21;
  CPSVibrantButton *closeButton;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
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
  double v41;
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
  id v86;
  _QWORD v87[9];
  _QWORD v88[6];
  _QWORD v89[12];

  v89[10] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  clipInformationContainerView = self->_clipInformationContainerView;
  self->_clipInformationContainerView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_clipInformationContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v86 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v86, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_clipInformationContainerView, "addSubview:", v86);
  v5 = [CPSVibrantLabel alloc];
  v6 = -[CPSVibrantLabel initWithTextStyle:textVariant:vibrancyEffectStyle:](v5, "initWithTextStyle:textVariant:vibrancyEffectStyle:", *MEMORY[0x1E0CEB5B8], 1280, 0);
  clipNameVibrantLabel = self->_clipNameVibrantLabel;
  self->_clipNameVibrantLabel = v6;

  v8 = *MEMORY[0x1E0D107C0];
  -[CPSVibrantLabel setText:](self->_clipNameVibrantLabel, "setText:", *MEMORY[0x1E0D107C0]);
  -[CPSVibrantLabel setNumberOfLines:](self->_clipNameVibrantLabel, "setNumberOfLines:", 2);
  -[CPSVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_clipNameVibrantLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v86, "addSubview:", self->_clipNameVibrantLabel);
  v9 = [CPSVibrantLabel alloc];
  v10 = -[CPSVibrantLabel initWithTextStyle:textVariant:vibrancyEffectStyle:](v9, "initWithTextStyle:textVariant:vibrancyEffectStyle:", *MEMORY[0x1E0CEB558], 256, 0);
  clipDescriptionVibrantLabel = self->_clipDescriptionVibrantLabel;
  self->_clipDescriptionVibrantLabel = v10;

  -[CPSVibrantLabel setText:](self->_clipDescriptionVibrantLabel, "setText:", v8);
  -[CPSVibrantLabel setNumberOfLines:](self->_clipDescriptionVibrantLabel, "setNumberOfLines:", 2);
  -[CPSVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_clipDescriptionVibrantLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v86, "addSubview:", self->_clipDescriptionVibrantLabel);
  -[CPSLaunchContentViewController _setUpOpenButtonIfNeeded](self, "_setUpOpenButtonIfNeeded");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self->_clipInformationContainerView, "addSubview:");
  v12 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v86, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_clipInformationContainerView, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintGreaterThanOrEqualToAnchor:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v51;
  objc_msgSend(v86, "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_clipInformationContainerView, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v49;
  -[CPSVibrantLabel topAnchor](self->_clipNameVibrantLabel, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v47;
  -[CPSVibrantLabel leadingAnchor](self->_clipNameVibrantLabel, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v89[3] = v45;
  -[CPSVibrantLabel trailingAnchor](self->_clipNameVibrantLabel, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v89[4] = v44;
  -[CPSVibrantLabel topAnchor](self->_clipDescriptionVibrantLabel, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSVibrantLabel bottomAnchor](self->_clipNameVibrantLabel, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", 2.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v89[5] = v43;
  -[CPSVibrantLabel leadingAnchor](self->_clipDescriptionVibrantLabel, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v89[6] = v42;
  -[CPSVibrantLabel trailingAnchor](self->_clipDescriptionVibrantLabel, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v89[7] = v13;
  -[CPSVibrantLabel bottomAnchor](self->_clipDescriptionVibrantLabel, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v89[8] = v16;
  -[UIView bottomAnchor](self->_clipInformationContainerView, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v89[9] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v20);

  if (self->_displayMode)
  {
    v21 = -[CPSVibrantButton initWithButtonType:]([CPSVibrantButton alloc], "initWithButtonType:", 0);
    closeButton = self->_closeButton;
    self->_closeButton = v21;

    -[CPSVibrantButton setAdjustFontSizeToFitWidth:](self->_closeButton, "setAdjustFontSizeToFitWidth:", 1);
    -[CPSVibrantButton uiButton](self->_closeButton, "uiButton");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSLaunchContentViewController traitCollection](self, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferredContentSizeCategory");
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    inlineCardButtonFont(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v25);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setTitleColor:forState:", v27, 0);

    _CPSLocalizedString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setTitle:forState:", v28, 0);

    -[CPSVibrantButton setTranslatesAutoresizingMaskIntoConstraints:](self->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v84, "setContentEdgeInsets:", 12.0, 18.0, 12.0, 18.0);
    objc_msgSend(v84, "addTarget:action:forControlEvents:", self, sel_dismiss_, 64);
    -[UIView addSubview:](self->_clipInformationContainerView, "addSubview:", self->_closeButton);
    v29 = (void *)MEMORY[0x1E0CB3718];
    -[CPSVibrantButton leadingAnchor](self->_closeButton, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_clipInformationContainerView, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v70;
    -[CPSVibrantButton topAnchor](self->_closeButton, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v68;
    -[CPSVibrantButton bottomAnchor](self->_closeButton, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v87[2] = v66;
    -[CPSVibrantButton widthAnchor](self->_closeButton, "widthAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_clipInformationContainerView, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:multiplier:constant:", 0.5, -8.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v87[3] = v54;
    objc_msgSend(v85, "widthAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_clipInformationContainerView, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:multiplier:constant:", 0.5, -8.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v87[4] = v64;
    objc_msgSend(v85, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintGreaterThanOrEqualToAnchor:constant:", 16.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v87[5] = v30;
    objc_msgSend(v85, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_clipInformationContainerView, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v87[6] = v31;
    -[UIView bottomAnchor](self->_clipInformationContainerView, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v87[7] = v34;
    objc_msgSend(v86, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_clipInformationContainerView, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v87[8] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v38);

  }
  else
  {
    v39 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v85, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_clipInformationContainerView, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintGreaterThanOrEqualToAnchor:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v62;
    objc_msgSend(v85, "centerYAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "centerYAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v60;
    objc_msgSend(v85, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", 16.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v88[2] = v58;
    objc_msgSend(v85, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_clipInformationContainerView, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v88[3] = v56;
    objc_msgSend(v85, "widthAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintGreaterThanOrEqualToConstant:", 100.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = 1144750080;
    v74 = v40;
    objc_msgSend(v40, "cps_setPriority:", v41);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v88[4] = v52;
    -[UIView bottomAnchor](self->_clipInformationContainerView, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v88[5] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v30);
  }

}

- (void)configurePermissionView
{
  CPSSessionProxy *sessionProxy;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  self->_willConfigurePermissionView = 1;
  sessionProxy = self->_sessionProxy;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__CPSLaunchContentViewController_configurePermissionView__block_invoke;
  v4[3] = &unk_1E8E8B220;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  -[CPSSessionProxy getLastLaunchOptionsWithCompletion:](sessionProxy, "getLastLaunchOptionsWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__CPSLaunchContentViewController_configurePermissionView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_2;
  block[3] = &unk_1E8E8B1F8;
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v7);

}

void __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_2(id *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CPSPermissionsViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void (**v19)(_QWORD);
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;

  v2 = objc_msgSend(a1[4], "shouldRequestLocationConfirmationPermission");
  v3 = a1[4];
  v4 = (void *)*((_QWORD *)v3 + 133);
  objc_msgSend(*((id *)v3 + 131), "fullAppName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureWithAppName:requestsNotificationPermission:requestsLocationConfirmationPermission:", v5, objc_msgSend(*((id *)a1[4] + 131), "clipRequestsNotificationPermission"), v2);

  if ((_DWORD)v2)
  {
    objc_msgSend(a1[5], "locationConfirmationGranted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "BOOLValue");
    else
      v8 = 1;
    objc_msgSend(*((id *)a1[4] + 133), "setLocationConfirmationPermissionEnabled:", v8);

  }
  if (objc_msgSend(*((id *)a1[4] + 131), "clipRequestsNotificationPermission"))
  {
    if (objc_msgSend(a1[4], "_userNotificationAuthorizationDenied"))
    {
      objc_msgSend(*((id *)a1[4] + 133), "setNotificationPermissionEnabled:", 0);
    }
    else
    {
      objc_msgSend(a1[5], "userNotificationGranted");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        v11 = objc_msgSend(v9, "BOOLValue");
      else
        v11 = 1;
      objc_msgSend(*((id *)a1[4] + 133), "setNotificationPermissionEnabled:", v11);

    }
  }
  v12 = [CPSPermissionsViewController alloc];
  objc_msgSend(*((id *)a1[4] + 131), "fullAppName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_heroImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CPSPermissionsViewController initWithAppName:backgroundImage:](v12, "initWithAppName:backgroundImage:", v13, v14);
  v16 = a1[4];
  v17 = (void *)v16[135];
  v16[135] = v15;

  objc_msgSend(*((id *)a1[4] + 135), "setDelegate:");
  v18 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_3;
  v24[3] = &unk_1E8E8B1D0;
  objc_copyWeak(&v25, a1 + 6);
  objc_msgSend(*((id *)a1[4] + 133), "setOptionsAction:", v24);
  objc_msgSend(*((id *)a1[4] + 135), "setLocationConfirmationPermissionEnabled:", objc_msgSend(*((id *)a1[4] + 133), "locationConfirmationPermissionEnabled"));
  objc_msgSend(*((id *)a1[4] + 135), "setNotificationPermissionEnabled:", objc_msgSend(*((id *)a1[4] + 133), "notificationPermissionEnabled"));
  objc_msgSend(*((id *)a1[4] + 126), "setCustomSpacing:afterView:", *((_QWORD *)a1[4] + 133), 12.0);
  objc_msgSend(*((id *)a1[4] + 133), "layoutIfNeeded");
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_4;
  v23[3] = &unk_1E8E8B1A8;
  v23[4] = a1[4];
  v19 = (void (**)(_QWORD))MEMORY[0x1D17E1B78](v23);
  if (objc_msgSend(a1[4], "_appearState") == 2)
  {
    v19[2](v19);
  }
  else if (objc_msgSend(a1[4], "_appearState"))
  {
    v20 = MEMORY[0x1D17E1B78](v19);
    v21 = a1[4];
    v22 = (void *)v21[145];
    v21[145] = v20;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v19);
  }

  objc_destroyWeak(&v25);
}

void __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pushViewController:animated:", v3[135], 1);

    WeakRetained = v3;
  }

}

uint64_t __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_4(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_5;
  v2[3] = &unk_1E8E8B1A8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v2, 0, 0.2);
}

void __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (BOOL)_userNotificationAuthorizationDenied
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v3 = (void *)getUNNotificationSettingsCenterClass(void)::softClass;
  v16 = getUNNotificationSettingsCenterClass(void)::softClass;
  if (!getUNNotificationSettingsCenterClass(void)::softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = ___ZL36getUNNotificationSettingsCenterClassv_block_invoke;
    v12[3] = &unk_1E8E8B388;
    v12[4] = &v13;
    ___ZL36getUNNotificationSettingsCenterClassv_block_invoke((uint64_t)v12);
    v3 = (void *)v14[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v4, "currentNotificationSettingsCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipBundleID](self->_clipMetadata, "clipBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSourceWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "authorizationStatus");

  return v10 == 1;
}

- (void)enableOpenButton
{
  id v3;

  -[UIButton setEnabled:](self->_openButton, "setEnabled:", 1);
  if (!self->_displayMode)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](self->_openButton, "setBackgroundColor:");

  }
}

- (void)disableOpenButton
{
  id v3;

  -[UIButton setEnabled:](self->_openButton, "setEnabled:", 0);
  if (!self->_displayMode)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "cps_colorNamed:", CFSTR("disabledOpenButtonBackground"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](self->_openButton, "setBackgroundColor:");

  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  _BOOL8 v4;
  CPSPermissionsViewController *permissionsViewController;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CPSPermissionView *permissionView;
  void *v11;

  v4 = -[CPSLaunchContentViewController shouldRequestLocationConfirmationPermission](self, "shouldRequestLocationConfirmationPermission", a3);
  permissionsViewController = self->_permissionsViewController;
  -[CPSLaunchContentViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(permissionsViewController) = -[CPSPermissionsViewController isEqual:](permissionsViewController, "isEqual:", v7);

  if (!(permissionsViewController ^ 1 | v4))
  {
    -[CPSLaunchContentViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 0);

  }
  permissionView = self->_permissionView;
  -[CPSClipMetadata fullAppName](self->_clipMetadata, "fullAppName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSPermissionView configureWithAppName:requestsNotificationPermission:requestsLocationConfirmationPermission:](permissionView, "configureWithAppName:requestsNotificationPermission:requestsLocationConfirmationPermission:", v11, -[CPSClipMetadata clipRequestsNotificationPermission](self->_clipMetadata, "clipRequestsNotificationPermission"), v4);

  if (!v4)
  {
    -[CPSPermissionView setLocationConfirmationPermissionEnabled:](self->_permissionView, "setLocationConfirmationPermissionEnabled:", 0);
    -[CPSPermissionsViewController setLocationConfirmationPermissionEnabled:](self->_permissionsViewController, "setLocationConfirmationPermissionEnabled:", 0);
  }
}

- (void)_sendAnalyticsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (!self->_didSendAnalytics)
  {
    -[CPSSessionProxy metadata](self->_sessionProxy, "metadata");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clipBundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      if (objc_msgSend(v4, "intValue"))
      {
        self->_didSendAnalytics = 1;
        objc_msgSend(MEMORY[0x1E0D107D0], "sharedLogger");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPSSessionProxy sourceBundleID](self->_sessionProxy, "sourceBundleID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPSSessionProxy referrerBundleID](self->_sessionProxy, "referrerBundleID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPSSessionProxy launchReason](self->_sessionProxy, "launchReason");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "clipRequestURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = self->_displayMode == 1;
        objc_msgSend(v5, "didPresentInvocationCardForClip:adamID:sourceBundleIdentifier:referrerBundleIdentifier:event:url:didShowCardInline:", v3, v4, v6, v7, v8, v9, v10);

      }
    }

  }
}

- (void)_updateContent
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  uint64_t v19;
  id v20;

  -[CPSLaunchContentViewController _updateHeroImageIfNeeded](self, "_updateHeroImageIfNeeded");
  -[CPSClipMetadata invocationPolicy](self->_clipMetadata, "invocationPolicy");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[CPSSessionProxy launchReason](self->_sessionProxy, "launchReason");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[CPSClipMetadata isPhysicalInvocationAllowed](self->_clipMetadata, "isPhysicalInvocationAllowed") & 1) != 0)
    {
      v4 = 0;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D107B8]) & 1) != 0
           || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D107A0]) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D107B0]);
    }
    if ((objc_msgSend(v20, "isEligible") & 1) != 0)
    {
      if (v4)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0D107D0], "sharedLogger");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPSClipMetadata clipBundleID](self->_clipMetadata, "clipBundleID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "recordDidShowErrorWithBundleID:place:errorCode:", v6, CFSTR("card"), objc_msgSend(v20, "reason"));

        if (v4)
          _CPSLocalizedString();
        else
          objc_msgSend(v20, "localizedMessageForClipMetadata:", self->_clipMetadata);
        v19 = objc_claimAutoreleasedReturnValue();
        -[CPSLaunchContentViewController showUnavailableViewWithReason:](self, "showUnavailableViewWithReason:", v19);
        v17 = (void *)v19;
        goto LABEL_32;
      }
    }
    else if (((objc_msgSend(v20, "isRecoverable") ^ 1 | v4) & 1) != 0)
    {
      goto LABEL_10;
    }
    -[CPSLaunchContentViewController setUnavailableViewHidden:](self, "setUnavailableViewHidden:", 1);

  }
  -[CPSClipMetadata fullAppIconURL](self->_clipMetadata, "fullAppIconURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "cps_isFileURL"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CEA638]);
    objc_msgSend(v3, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithContentsOfFile:", v8);
    -[CPSAppMetadataView setAppIcon:](self->_appMetadataView, "setAppIcon:", v9);

  }
  -[CPSClipMetadata clipName](self->_clipMetadata, "clipName");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = *MEMORY[0x1E0D107C0];
  if (v10)
    v13 = v10;
  else
    v13 = *MEMORY[0x1E0D107C0];
  -[CPSVibrantLabel setText:](self->_clipNameVibrantLabel, "setText:", v13);

  -[CPSVibrantLabel layoutIfNeeded](self->_clipNameVibrantLabel, "layoutIfNeeded");
  -[CPSClipMetadata clipCaption](self->_clipMetadata, "clipCaption");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = v14;
  else
    v16 = v12;
  -[CPSVibrantLabel setText:](self->_clipDescriptionVibrantLabel, "setText:", v16);

  -[CPSVibrantLabel layoutIfNeeded](self->_clipDescriptionVibrantLabel, "layoutIfNeeded");
  -[CPSLaunchContentViewController updateOpenButton](self, "updateOpenButton");
  if (!self->_willConfigurePermissionView
    && ((-[CPSClipMetadata clipRequestsNotificationPermission](self->_clipMetadata, "clipRequestsNotificationPermission") & 1) != 0|| -[CPSLaunchContentViewController shouldRequestLocationConfirmationPermission](self, "shouldRequestLocationConfirmationPermission")))
  {
    -[CPSLaunchContentViewController configurePermissionView](self, "configurePermissionView");
  }
  -[CPSAppMetadataView updateWithMetadata:](self->_appMetadataView, "updateWithMetadata:", self->_clipMetadata);
  if (-[CPSClipMetadata hasAppMetadata](self->_clipMetadata, "hasAppMetadata")
    && (-[CPSClipMetadata fullAppOnly](self->_clipMetadata, "fullAppOnly") & 1) == 0)
  {
    -[CPSAppMetadataView setUserInteractionEnabled:](self->_appMetadataView, "setUserInteractionEnabled:", 1);
  }
  -[CPSAppMetadataView layoutIfNeeded](self->_appMetadataView, "layoutIfNeeded");
  -[CPSLaunchContentViewController determineClipCompatibility](self, "determineClipCompatibility");
  -[CPSLaunchContentViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  -[CPSLaunchContentViewController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", v18);
LABEL_32:

}

- (void)updateOpenButton
{
  unint64_t displayMode;
  CPSClipMetadata *clipMetadata;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  char **v10;
  id v11;
  _QWORD v12[5];
  id v13;

  if (self->_openButton)
  {
    displayMode = self->_displayMode;
    clipMetadata = self->_clipMetadata;
    if (displayMode == 1)
    {
      v5 = (void *)-[CPSClipMetadata clipAction](clipMetadata, "clipAction");
      if ((unint64_t)v5 <= 2)
      {
        _CPSLocalizedString();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[CPSClipMetadata clipOpenButtonTitle](clipMetadata, "clipOpenButtonTitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)MEMORY[0x1E0CEABB0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__CPSLaunchContentViewController_updateOpenButton__block_invoke;
    v12[3] = &unk_1E8E8B248;
    v12[4] = self;
    v11 = v5;
    v13 = v11;
    objc_msgSend(v6, "performWithoutAnimation:", v12);
    v7 = self->_uiMock_openButtonEnabled;
    v8 = v7;
    if (v7)
    {
      if (-[NSNumber BOOLValue](v7, "BOOLValue"))
        -[CPSLaunchContentViewController enableOpenButton](self, "enableOpenButton");
      else
        -[CPSLaunchContentViewController disableOpenButton](self, "disableOpenButton");
    }

    -[CPSClipMetadata invocationPolicy](self->_clipMetadata, "invocationPolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_20;
    -[CPSLaunchContentViewController disableOpenButton](self, "disableOpenButton");
    -[UIButton removeTarget:action:forControlEvents:](self->_openButton, "removeTarget:action:forControlEvents:", self, 0, 0x2000);
    if (objc_msgSend(v9, "isEligible"))
    {
      if ((-[CPSClipMetadata hasFullAppInstalledOnSystem](self->_clipMetadata, "hasFullAppInstalledOnSystem") & 1) == 0
        && !self->_didInstallApplicationPlaceholder
        && !-[CPSClipMetadata fullAppOnly](self->_clipMetadata, "fullAppOnly"))
      {
        goto LABEL_20;
      }
      -[CPSLaunchContentViewController enableOpenButton](self, "enableOpenButton");
      v10 = &selRef__openAppClip_;
    }
    else
    {
      if (!objc_msgSend(v9, "isRecoverable"))
      {
LABEL_20:

        return;
      }
      -[CPSLaunchContentViewController enableOpenButton](self, "enableOpenButton");
      v10 = &selRef_handlePolicyRecovery;
    }
    -[UIButton addTarget:action:forControlEvents:](self->_openButton, "addTarget:action:forControlEvents:", self, *v10, 0x2000);
    goto LABEL_20;
  }
}

uint64_t __50__CPSLaunchContentViewController_updateOpenButton__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "setTitle:forState:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateCornerRadiusForButtons");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "setHidden:", objc_msgSend(*(id *)(a1 + 40), "length") == 0);
}

- (void)determineClipCompatibility
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if ((-[CPSClipMetadata clipIncompatibleWithCurrentDevice](self->_clipMetadata, "clipIncompatibleWithCurrentDevice") & 1) != 0
    || -[CPSClipMetadata deviceCapabilitiesDontMatch](self->_clipMetadata, "deviceCapabilitiesDontMatch"))
  {
    -[CPSClipMetadata fullAppName](self->_clipMetadata, "fullAppName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = -[CPSClipMetadata clipIncompatibleWithCurrentDevice](self->_clipMetadata, "clipIncompatibleWithCurrentDevice");
      v5 = (void *)MEMORY[0x1E0CB3940];
      if (v4)
      {
        _CPSLocalizedString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPSClipMetadata fullAppName](self->_clipMetadata, "fullAppName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D10828], "oppositeDeviceFamilyName");
      }
      else
      {
        _CPSLocalizedString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPSClipMetadata fullAppName](self->_clipMetadata, "fullAppName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D10828], "localizedDeviceName");
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D107D0], "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSClipMetadata clipBundleID](self->_clipMetadata, "clipBundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recordDidShowErrorWithBundleID:place:errorCode:", v10, CFSTR("card"), 1001);

      -[CPSLaunchContentViewController showUnavailableViewWithReason:](self, "showUnavailableViewWithReason:", v11);
    }
  }
}

- (void)signInToAppStore
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v3 = (void *)getAMSAuthenticateOptionsClass(void)::softClass;
  v17 = getAMSAuthenticateOptionsClass(void)::softClass;
  v4 = MEMORY[0x1E0C809B0];
  if (!getAMSAuthenticateOptionsClass(void)::softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = ___ZL30getAMSAuthenticateOptionsClassv_block_invoke;
    v13[3] = &unk_1E8E8B388;
    v13[4] = &v14;
    ___ZL30getAMSAuthenticateOptionsClassv_block_invoke((uint64_t)v13);
    v3 = (void *)v15[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v14, 8);
  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "setAllowServerDialogs:", 1);
  v7 = objc_alloc(MEMORY[0x1E0CFDDF0]);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_activeiTunesAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithAccount:presentingViewController:options:", v9, self, v6);

  -[CPSLaunchContentViewController disableOpenButton](self, "disableOpenButton");
  objc_msgSend(v10, "performAuthentication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __50__CPSLaunchContentViewController_signInToAppStore__block_invoke;
  v12[3] = &unk_1E8E8B270;
  v12[4] = self;
  objc_msgSend(v11, "addFinishBlock:", v12);

}

void __50__CPSLaunchContentViewController_signInToAppStore__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CPSLaunchContentViewController_signInToAppStore__block_invoke_2;
  v7[3] = &unk_1E8E8B248;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __50__CPSLaunchContentViewController_signInToAppStore__block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(id **)(a1 + 40);
  if (v3)
    return objc_msgSend(v2, "enableOpenButton");
  objc_msgSend(v2[141], "removeTarget:action:forControlEvents:", 0, 0, 0x2000);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "setInvocationPolicy:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1056), "prewarmClip");
}

- (void)handlePolicyRecovery
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[CPSClipMetadata invocationPolicy](self->_clipMetadata, "invocationPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedMessageForClipMetadata:", self->_clipMetadata);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "reason");
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEA2E0];
  _CPSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 1)
  {
    v11 = (void *)MEMORY[0x1E0CEA2E0];
    _CPSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke;
    v17[3] = &unk_1E8E8B2E8;
    v17[4] = self;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addAction:", v13);
    objc_msgSend(v7, "addAction:", v10);
    objc_msgSend(v7, "setPreferredAction:", v13);
  }
  else
  {
    objc_msgSend(v7, "addAction:", v10);
    v14 = (void *)MEMORY[0x1E0CEA2E0];
    _CPSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_4;
    v16[3] = &unk_1E8E8B2E8;
    v16[4] = self;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addAction:", v13);
    objc_msgSend(v7, "setPreferredAction:", v13);
  }

  -[CPSLaunchContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

void __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = objc_alloc_init(MEMORY[0x1E0DAAF00]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_2;
  v5[3] = &unk_1E8E8B2C0;
  v3 = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  objc_msgSend(v4, "requestPasscodeUnlockUIWithOptions:withCompletion:", 0, v5);

}

void __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_2(uint64_t a1, char a2)
{
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  char v9;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_3;
  block[3] = &unk_1E8E8B298;
  v4 = *(id *)(a1 + 32);
  v9 = a2;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 40), "signInToAppStore");
  return result;
}

uint64_t __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openAppStore");
}

- (void)setUnavailableViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  if (-[CPSAppClipUnavailableView isHidden](self->_unavailableView, "isHidden") != a3)
  {
    -[CPSAppClipUnavailableView setHidden:](self->_unavailableView, "setHidden:", v3);
    v5 = v3 ^ 1;
    -[UIStackView setHidden:](self->_informationContentView, "setHidden:", v5);
    if ((v5 & 1) == 0)
      -[CPSAppClipUnavailableView setReasonString:](self->_unavailableView, "setReasonString:", 0);
  }
}

- (void)showUnavailableViewWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  CPSAppClipUnavailableView *unavailableView;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  -[CPSLaunchContentViewController setUnavailableViewHidden:](self, "setUnavailableViewHidden:", 0);
  -[CPSAppClipUnavailableView setReasonString:](self->_unavailableView, "setReasonString:", v4);
  -[CPSClipMetadata invocationPolicy](self->_clipMetadata, "invocationPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "reason") == 14)
  {
    -[CPSSessionProxy launchReason](self->_sessionProxy, "launchReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D107A0]);

    if ((v7 & 1) == 0)
    {
      objc_initWeak(&location, self);
      unavailableView = self->_unavailableView;
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __64__CPSLaunchContentViewController_showUnavailableViewWithReason___block_invoke;
      v12 = &unk_1E8E8B1D0;
      objc_copyWeak(&v13, &location);
      -[CPSAppClipUnavailableView enableURLFallbackWithAction:](unavailableView, "enableURLFallbackWithAction:", &v9);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
  -[CPSAppClipUnavailableView layoutIfNeeded](self->_unavailableView, "layoutIfNeeded", v9, v10, v11, v12);

}

void __64__CPSLaunchContentViewController_showUnavailableViewWithReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[131], "clipLaunchURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_openNonAppClipURL:", v2);

    WeakRetained = v3;
  }

}

- (UIImage)_heroImage
{
  return -[UIImageView image](self->_heroImageView, "image");
}

- (void)_setHeroImage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIImageView setImage:](self->_heroImageView, "setImage:");
  -[UIImageView setImage:](self->_heroMirrorImageView, "setImage:", v5);
  if (v5)
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppClipUnavailableView setBackgroundColor:](self->_unavailableView, "setBackgroundColor:", v4);

  -[CPSPermissionsViewController setBackgroundImage:](self->_permissionsViewController, "setBackgroundImage:", v5);
}

- (void)_openAppClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
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
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];

  if (-[CPSClipMetadata fullAppOnly](self->_clipMetadata, "fullAppOnly", a3)
    && (-[CPSClipMetadata hasFullAppInstalledOnSystem](self->_clipMetadata, "hasFullAppInstalledOnSystem") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    _CPSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata fullAppName](self->_clipMetadata, "fullAppName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    _CPSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata fullAppName](self->_clipMetadata, "fullAppName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D10828], "localizedDeviceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v7, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CEA2E0];
    _CPSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __47__CPSLaunchContentViewController__openAppClip___block_invoke;
    v25[3] = &unk_1E8E8B2E8;
    v25[4] = self;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CEA2E0];
    _CPSLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "addAction:", v19);
    objc_msgSend(v16, "addAction:", v22);
    objc_msgSend(v16, "setPreferredAction:", v19);
    -[CPSLaunchContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D107E8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CPSPermissionView notificationPermissionEnabled](self->_permissionView, "notificationPermissionEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserNotificationGranted:", v5);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CPSPermissionView locationConfirmationPermissionEnabled](self->_permissionView, "locationConfirmationPermissionEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocationConfirmationGranted:", v6);

    objc_msgSend(v4, "setShowsAppAttributionBanner:", 1);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __47__CPSLaunchContentViewController__openAppClip___block_invoke_2;
    v23[3] = &unk_1E8E8B248;
    v23[4] = self;
    v7 = v4;
    v24 = v7;
    -[CPSLaunchContentViewController _dismissCardWithClipDidOpen:andPerformBlockToLaunchApp:](self, "_dismissCardWithClipDidOpen:andPerformBlockToLaunchApp:", 1, v23);

  }
}

uint64_t __47__CPSLaunchContentViewController__openAppClip___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openAppStore");
}

uint64_t __47__CPSLaunchContentViewController__openAppClip___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056);
    v10 = 134217984;
    v11 = v3;
    _os_log_impl(&dword_1D0512000, v2, OS_LOG_TYPE_DEFAULT, "CPSLaunchContentViewController: Opening clip for proxy (%p)", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0D107D0], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "clipBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 1048);
  objc_msgSend(*(id *)(v6 + 1056), "launchReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordDidTapOpenButtonInCardWithBundleID:metadata:launchReason:launchOptions:didShowCardInline:", v5, v7, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152) == 1);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "openClipWithLaunchOptions:completion:", *(_QWORD *)(a1 + 40), 0);
}

- (void)openAppStore
{
  id v3;

  -[CPSClipMetadata fullAppStoreURL](self->_clipMetadata, "fullAppStoreURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CPSLaunchContentViewController _openNonAppClipURL:](self, "_openNonAppClipURL:");

}

- (void)_openNonAppClipURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
  v26 = *MEMORY[0x1E0CEB2B0];
  -[CPSClipMetadata clipBundleID](self->_clipMetadata, "clipBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D22D70]);

  v8 = -[CPSSessionProxy originIsControlCenter](self->_sessionProxy, "originIsControlCenter");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v10 = (_QWORD *)getCCUIAppLaunchOriginControlCenterSymbolLoc(void)::ptr;
    v25 = getCCUIAppLaunchOriginControlCenterSymbolLoc(void)::ptr;
    if (!getCCUIAppLaunchOriginControlCenterSymbolLoc(void)::ptr)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = ___ZL44getCCUIAppLaunchOriginControlCenterSymbolLocv_block_invoke;
      v21[3] = &unk_1E8E8B388;
      v21[4] = &v22;
      ___ZL44getCCUIAppLaunchOriginControlCenterSymbolLocv_block_invoke(v21);
      v10 = (_QWORD *)v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCCUIAppLaunchOriginControlCenter()");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("CPSLaunchContentViewController.mm"), 42, CFSTR("%s"), dlerror());

      __break(1u);
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *v10, *MEMORY[0x1E0D22D58]);
  }
  objc_msgSend(MEMORY[0x1E0D107D0], "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSSessionProxy metadata](self->_sessionProxy, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clipBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didCancelInterstitialForClip:withEvent:didShowCardInline:", v13, 3, self->_displayMode == 1);

  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __53__CPSLaunchContentViewController__openNonAppClipURL___block_invoke;
  v18[3] = &unk_1E8E8B248;
  v14 = v4;
  v19 = v14;
  v15 = v5;
  v20 = v15;
  -[CPSLaunchContentViewController _dismissCardWithClipDidOpen:andPerformBlockToLaunchApp:](self, "_dismissCardWithClipDidOpen:andPerformBlockToLaunchApp:", 0, v18);

}

id __53__CPSLaunchContentViewController__openNonAppClipURL___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(MEMORY[0x1E0D10828], "openURL:withOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)shouldRequestLocationConfirmationPermission
{
  if (-[CPSClipMetadata clipRequestsLocationConfirmationPermission](self->_clipMetadata, "clipRequestsLocationConfirmationPermission")&& -[CPSSessionProxy canRequestLocationConfirmation](self->_sessionProxy, "canRequestLocationConfirmation"))
  {
    return objc_msgSend(MEMORY[0x1E0D10808], "locationServiceEnabled");
  }
  else
  {
    return 0;
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSLaunchContentViewController;
  -[CPSLaunchContentViewController touchesEnded:withEvent:](&v4, sel_touchesEnded_withEvent_, a3, a4);
}

- (void)dismiss:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  -[CPSVibrantButton uiButton](self->_closeButton, "uiButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    -[CPSLaunchContentViewController logDismissalFromCloseButton:](self, "logDismissalFromCloseButton:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "launchContentViewController:didTapCloseButton:", self, 1);

  }
  -[CPSLaunchContentViewController _dismissWithClipDidOpen:completion:](self, "_dismissWithClipDidOpen:completion:", 0, 0);

}

- (void)logDismissalFromCloseButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D107D0], "sharedLogger");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CPSSessionProxy metadata](self->_sessionProxy, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clipBundleID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E8E8B5E8;
  if (v3)
    v9 = 2;
  else
    v9 = 1;
  objc_msgSend(v10, "didCancelInterstitialForClip:withEvent:didShowCardInline:", v8, v9, self->_displayMode == 1);

}

- (void)_dismissWithClipDidOpen:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v4 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMainThread");

  if (v7)
  {
    -[CPSLaunchContentViewController _dismissCardWithClipDidOpen:completion:](self, "_dismissCardWithClipDidOpen:completion:", v4, v8);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__CPSLaunchContentViewController__dismissWithClipDidOpen_completion___block_invoke;
    block[3] = &unk_1E8E8B310;
    block[4] = self;
    v11 = v4;
    v10 = v8;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __69__CPSLaunchContentViewController__dismissWithClipDidOpen_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissCardWithClipDidOpen:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_dismissCardWithClipDidOpen:(BOOL)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v6 = a4;
  self->_dismissalInProgress = 1;
  if (!a3)
    -[CPSLaunchContentViewController cancelSession](self, "cancelSession");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__CPSLaunchContentViewController__dismissCardWithClipDidOpen_completion___block_invoke;
  v10[3] = &unk_1E8E8B310;
  v10[4] = self;
  v12 = a3;
  v7 = v6;
  v11 = v7;
  v8 = MEMORY[0x1D17E1B78](v10);
  v9 = (void *)v8;
  if (self->_displayMode == 1)
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  else
    -[CPSLaunchContentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

}

void __73__CPSLaunchContentViewController__dismissCardWithClipDidOpen_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1176));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "launchContentViewControllerDidDisappear:didOpenClip:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (BOOL)_canLaunchAppSimultaneouslyWithInvocationCardDismissal
{
  return -[CPSSessionProxy originIsControlCenter](self->_sessionProxy, "originIsControlCenter");
}

- (void)_dismissCardWithClipDidOpen:(BOOL)a3 andPerformBlockToLaunchApp:(id)a4
{
  _BOOL8 v4;
  void (**v6)(void);

  v4 = a3;
  v6 = (void (**)(void))a4;
  if (-[CPSLaunchContentViewController _canLaunchAppSimultaneouslyWithInvocationCardDismissal](self, "_canLaunchAppSimultaneouslyWithInvocationCardDismissal"))
  {
    -[CPSLaunchContentViewController _dismissCardWithClipDidOpen:completion:](self, "_dismissCardWithClipDidOpen:completion:", v4, 0);
    v6[2]();
  }
  else
  {
    -[CPSLaunchContentViewController _dismissCardWithClipDidOpen:completion:](self, "_dismissCardWithClipDidOpen:completion:", v4, v6);
  }

}

- (void)cancelSession
{
  -[CPSSessionProxy cancel](self->_sessionProxy, "cancel");
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateHeroImageIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  -[CPSLaunchContentViewController _heroImage](self, "_heroImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CPSClipMetadata invocationPolicy](self->_clipMetadata, "invocationPolicy");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v11, "canShowHeroImage");

    if (v4)
    {
      -[CPSSessionProxy heroImageFileURL](self->_sessionProxy, "heroImageFileURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)MEMORY[0x1E0CEA638];
        v12 = v5;
        objc_msgSend(v5, "path");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "imageWithContentsOfFile:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v12;
        if (v8)
        {
          -[CPSLaunchContentViewController _setHeroImage:](self, "_setHeroImage:", v8);
          goto LABEL_10;
        }
      }

    }
    -[CPSClipMetadata clipHeroImageURL](self->_clipMetadata, "clipHeroImageURL");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "cps_isFileURL")
      || (-[CPSClipMetadata isDeveloperOverride](self->_clipMetadata, "isDeveloperOverride") & 1) != 0)
    {
      goto LABEL_11;
    }
    v9 = objc_alloc(MEMORY[0x1E0CEA638]);
    objc_msgSend(v12, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "initWithContentsOfFile:", v8);
    -[CPSLaunchContentViewController _setHeroImage:](self, "_setHeroImage:", v10);

LABEL_10:
LABEL_11:

  }
}

- (id)_reasonStringForError:(id)a3
{
  id v4;
  nw_path_status_t status;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  status = nw_path_get_status((nw_path_t)self->_networkPath);
  v6 = (_QWORD *)MEMORY[0x1E0D10798];
  if (status == nw_path_status_unsatisfied)
  {
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *v6) & 1) != 0)
    {
      if (objc_msgSend(v4, "code") == 10)
      {

LABEL_14:
        cps_networkUnavailableErrorLocalizedDescription();
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      v12 = objc_msgSend(v4, "code");

      if (v12 == 2)
        goto LABEL_14;
    }
    else
    {

    }
  }
  objc_msgSend(v4, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *v6))
  {
    v9 = objc_msgSend(v4, "code");

    if (v9 == 10)
      goto LABEL_12;
  }
  else
  {

  }
  objc_msgSend(v4, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_12:
    _CPSLocalizedString();
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(v4, "localizedDescription");
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v13 = (void *)v11;

  return v13;
}

- (void)createNetworkPathMonitor
{
  OS_nw_path_monitor *v3;
  OS_nw_path_monitor *networkPathMonitor;
  NSObject *v5;
  _QWORD update_handler[5];

  v3 = (OS_nw_path_monitor *)nw_path_monitor_create();
  networkPathMonitor = self->_networkPathMonitor;
  self->_networkPathMonitor = v3;

  v5 = self->_networkPathMonitor;
  update_handler[0] = MEMORY[0x1E0C809B0];
  update_handler[1] = 3221225472;
  update_handler[2] = __58__CPSLaunchContentViewController_createNetworkPathMonitor__block_invoke;
  update_handler[3] = &unk_1E8E8B338;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v5, update_handler);
  nw_path_monitor_set_queue((nw_path_monitor_t)self->_networkPathMonitor, MEMORY[0x1E0C80D38]);
  nw_path_monitor_start((nw_path_monitor_t)self->_networkPathMonitor);
}

void __58__CPSLaunchContentViewController_createNetworkPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = a1 + 32;
  objc_storeStrong((id *)(v6 + 1112), a2);
  if (nw_path_get_status(*(nw_path_t *)(*(_QWORD *)v5 + 1112)) == nw_path_status_unsatisfied)
  {
    v7 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__CPSLaunchContentViewController_createNetworkPathMonitor__block_invoke_cold_1((uint64_t)v4, v5, v7);
    v8 = *(_QWORD **)v5;
    if (v8[140])
    {
      objc_msgSend(v8, "_reasonStringForError:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "showUnavailableViewWithReason:", v9);

    }
  }
  else
  {
    v10 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)v5 + 1120);
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1D0512000, v10, OS_LOG_TYPE_DEFAULT, "Network path: %@ _proxyError: %@", (uint8_t *)&v12, 0x16u);
    }
  }

}

- (void)permissionsViewControllerDidFinish:(id)a3
{
  CPSPermissionsViewController *v4;
  void *v5;
  CPSPermissionsViewController *v6;
  CPSPermissionsViewController *permissionsViewController;
  void *v8;
  id v9;
  CPSPermissionsViewController *v10;

  v4 = (CPSPermissionsViewController *)a3;
  if (self->_permissionsViewController == v4)
  {
    v10 = v4;
    -[CPSLaunchContentViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topViewController");
    v6 = (CPSPermissionsViewController *)objc_claimAutoreleasedReturnValue();
    permissionsViewController = self->_permissionsViewController;

    v4 = v10;
    if (v6 == permissionsViewController)
    {
      -[CPSPermissionView setNotificationPermissionEnabled:](self->_permissionView, "setNotificationPermissionEnabled:", -[CPSPermissionsViewController notificationPermissionEnabled](v10, "notificationPermissionEnabled"));
      -[CPSPermissionView setLocationConfirmationPermissionEnabled:](self->_permissionView, "setLocationConfirmationPermissionEnabled:", -[CPSPermissionsViewController locationConfirmationPermissionEnabled](v10, "locationConfirmationPermissionEnabled"));
      -[CPSLaunchContentViewController navigationController](self, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

      v4 = v10;
    }
  }

}

- (BOOL)allowsPullToDismiss
{
  return self->_displayMode == 0;
}

- (void)updatePreferredContentSizeForCardWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  id v8;

  -[CPSLaunchContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  v8 = v5;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v6, v7);
  -[CPSLaunchContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)proxyDidUpdateMetadata:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CPSLaunchContentViewController_proxyDidUpdateMetadata___block_invoke;
  v6[3] = &unk_1E8E8B248;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __57__CPSLaunchContentViewController_proxyDidUpdateMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048))
    objc_msgSend(*(id *)(a1 + 40), "prewarmClip");
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1048);
  *(_QWORD *)(v3 + 1048) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_updateContent");
}

- (void)proxyDidInstallApplicationPlaceholder:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = v4;
    _os_log_impl(&dword_1D0512000, v5, OS_LOG_TYPE_DEFAULT, "CPSLaunchContentViewController: Did install placeholder for proxy (%p)", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__CPSLaunchContentViewController_proxyDidInstallApplicationPlaceholder___block_invoke;
  v7[3] = &unk_1E8E8B248;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __72__CPSLaunchContentViewController_proxyDidInstallApplicationPlaceholder___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1097) = 1;
  objc_msgSend(*(id *)(a1 + 32), "updateOpenButton");
  if (objc_msgSend(*(id *)(a1 + 40), "usedByPPT"))
  {
    v2 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__CPSLaunchContentViewController_proxyDidInstallApplicationPlaceholder___block_invoke_2;
    block[3] = &unk_1E8E8B1A8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __72__CPSLaunchContentViewController_proxyDidInstallApplicationPlaceholder___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openAppClip:", 0);
}

- (void)proxy:(id)a3 didRetrieveApplicationIcon:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CPSLaunchContentViewController_proxy_didRetrieveApplicationIcon___block_invoke;
  v7[3] = &unk_1E8E8B248;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __67__CPSLaunchContentViewController_proxy_didRetrieveApplicationIcon___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(*(id *)(a1 + 40), "path");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithContentsOfFile:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setAppIcon:", v4);
  if (v2)
  {

  }
}

- (void)proxy:(id)a3 didRetrieveHeroImage:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CPSLaunchContentViewController_proxy_didRetrieveHeroImage___block_invoke;
  block[3] = &unk_1E8E8B1A8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __61__CPSLaunchContentViewController_proxy_didRetrieveHeroImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHeroImageIfNeeded");
}

- (void)proxyRemoteServiceDidCrash:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CPSLaunchContentViewController proxyRemoteServiceDidCrash:].cold.1((uint64_t)v3, v4);

}

- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (id)CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "cps_privacyPreservingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSLaunchContentViewController proxy:didFinishLoadingWithError:].cold.1((uint64_t)v6, v9, (uint64_t)v15, v8);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CPSLaunchContentViewController_proxy_didFinishLoadingWithError___block_invoke;
  block[3] = &unk_1E8E8B360;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66__CPSLaunchContentViewController_proxy_didFinishLoadingWithError___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_storeStrong((id *)a1[4] + 140, a1[5]);
  objc_msgSend(MEMORY[0x1E0D107D0], "sharedLogger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clipBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordDidShowErrorWithBundleID:place:errorCode:", v3, CFSTR("card"), 1000);

  objc_msgSend(a1[4], "loadViewIfNeeded");
  v4 = a1[4];
  objc_msgSend(v4, "_reasonStringForError:", a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showUnavailableViewWithReason:");

}

- (CPSLaunchContentViewControllerDelegate)delegate
{
  return (CPSLaunchContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)dismissalInProgress
{
  return self->_dismissalInProgress;
}

- (void)setDismissalInProgress:(BOOL)a3
{
  self->_dismissalInProgress = a3;
}

- (NSNumber)uiMock_openButtonEnabled
{
  return self->_uiMock_openButtonEnabled;
}

- (void)uiMock_setOpenButtonEnabled:(id)a3
{
  self->_uiMock_openButtonEnabled = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_delayedPermissionViewUnhideBlock, 0);
  objc_storeStrong((id *)&self->_openVibrantButton, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_openButton, 0);
  objc_storeStrong((id *)&self->_proxyLoadingError, 0);
  objc_storeStrong((id *)&self->_networkPath, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_heroContainerAspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->_permissionsViewController, 0);
  objc_storeStrong((id *)&self->_unavailableView, 0);
  objc_storeStrong((id *)&self->_permissionView, 0);
  objc_storeStrong((id *)&self->_sessionProxy, 0);
  objc_storeStrong((id *)&self->_clipMetadata, 0);
  objc_storeStrong((id *)&self->_appMetadataView, 0);
  objc_storeStrong((id *)&self->_clipDescriptionVibrantLabel, 0);
  objc_storeStrong((id *)&self->_clipNameVibrantLabel, 0);
  objc_storeStrong((id *)&self->_clipInformationContainerView, 0);
  objc_storeStrong((id *)&self->_informationContentView, 0);
  objc_storeStrong((id *)&self->_informationContainerView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_heroMirrorImageView, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);
  objc_storeStrong((id *)&self->_heroContainerView, 0);
}

void __58__CPSLaunchContentViewController_createNetworkPathMonitor__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 1120);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1D0512000, a3, (uint64_t)a3, "Network path: %@ _proxyError: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

- (void)proxyRemoteServiceDidCrash:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D0512000, a2, OS_LOG_TYPE_ERROR, "CPSLaunchContentViewController: Remote service did crash for proxy (%p)", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)proxy:(uint64_t)a3 didFinishLoadingWithError:(NSObject *)a4 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 134218242;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_0(&dword_1D0512000, a4, a3, "CPSLaunchContentViewController: -didFinishLoadingWithError: for proxy (%p), error: %{public}@", (uint8_t *)a3);

}

@end
