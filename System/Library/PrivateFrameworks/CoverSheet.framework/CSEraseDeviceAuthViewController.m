@implementation CSEraseDeviceAuthViewController

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *cancelButton;
  UIView *v10;
  UIView *labelsContainerView;
  UIView *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *titleLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  UILabel *subtitleLabel;
  UILabel *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  UIView *v30;
  UIView *springView;
  AKInlineSignInViewController *v32;
  AKInlineSignInViewController *authenticationViewController;
  AKInlineSignInViewController *v34;
  void *v35;
  AKInlineSignInViewController *v36;
  void *v37;
  void *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)CSEraseDeviceAuthViewController;
  -[CSEraseDeviceAuthViewController loadView](&v39, sel_loadView);
  -[CSEraseDeviceAuthViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBaseForegroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DASHBOARD_BLOCK_CANCEL_BUTTON"), &stru_1E8E30B28, CFSTR("CoverSheet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v8;

  -[UIButton setConfiguration:](self->_cancelButton, "setConfiguration:", v4);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, sel__handleCancelButtonAction, 64);
  objc_msgSend(v3, "addSubview:", self->_cancelButton);
  v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  labelsContainerView = self->_labelsContainerView;
  self->_labelsContainerView = v10;

  v12 = self->_labelsContainerView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_labelsContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_labelsContainerView);
  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v15;

  v17 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v17, "setTextColor:", v18);

  v19 = self->_titleLabel;
  objc_msgSend(v14, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB5B0], 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v19, "setFont:", v20);

  v21 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("DASHBOARD_BLOCK_ERASE_AUTH_TITLE"), &stru_1E8E30B28, CFSTR("CoverSheet"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v21, "setText:", v23);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_labelsContainerView, "addSubview:", self->_titleLabel);
  v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v24;

  v26 = self->_subtitleLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v26, "setTextColor:", v27);

  v28 = self->_subtitleLabel;
  objc_msgSend(v14, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB538], 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v28, "setFont:", v29);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_labelsContainerView, "addSubview:", self->_subtitleLabel);
  v30 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  springView = self->_springView;
  self->_springView = v30;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_springView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_springView);
  v32 = (AKInlineSignInViewController *)objc_alloc_init(MEMORY[0x1E0D00340]);
  authenticationViewController = self->_authenticationViewController;
  self->_authenticationViewController = v32;

  -[AKInlineSignInViewController setDelegate:](self->_authenticationViewController, "setDelegate:", self);
  -[AKInlineSignInViewController setSecondaryButtonTitle:](self->_authenticationViewController, "setSecondaryButtonTitle:", 0);
  -[AKInlineSignInViewController setTertiaryButtonTitle:](self->_authenticationViewController, "setTertiaryButtonTitle:", 0);
  v34 = self->_authenticationViewController;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInlineSignInViewController setEntryDescriptionTextColor:](v34, "setEntryDescriptionTextColor:", v35);

  v36 = self->_authenticationViewController;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInlineSignInViewController setEntryFieldTextColor:](v36, "setEntryFieldTextColor:", v37);

  -[AKInlineSignInViewController setPrimaryButtonHidden:](self->_authenticationViewController, "setPrimaryButtonHidden:", 1);
  -[AKInlineSignInViewController setShouldPromptForPasswordOnly:](self->_authenticationViewController, "setShouldPromptForPasswordOnly:", 1);
  -[AKInlineSignInViewController setWantsAuthenticationProgress:](self->_authenticationViewController, "setWantsAuthenticationProgress:", 1);
  -[AKInlineSignInViewController view](self->_authenticationViewController, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self->_springView, "addSubview:", v38);
  -[CSEraseDeviceAuthViewController _activateConstraints](self, "_activateConstraints");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  AKInlineSignInViewController *authenticationViewController;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSEraseDeviceAuthViewController;
  -[CSEraseDeviceAuthViewController viewDidLoad](&v5, sel_viewDidLoad);
  authenticationViewController = self->_authenticationViewController;
  if (authenticationViewController)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__CSEraseDeviceAuthViewController_viewDidLoad__block_invoke;
    v4[3] = &unk_1E8E2DB60;
    v4[4] = self;
    -[CSEraseDeviceAuthViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", authenticationViewController, 0, v4);
  }
}

void __46__CSEraseDeviceAuthViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(void);
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0CB3718];
  v3 = *(void **)(a1 + 32);
  v20 = a2;
  objc_msgSend(v3, "_authenticationView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, -29.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(*(id *)(a1 + 32), "_authenticationView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  objc_msgSend(*(id *)(a1 + 32), "_authenticationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v13);

  v20[2]();
}

- (void)setAuthContext:(id)a3
{
  AKAppleIDAuthenticationInAppContext *v4;
  AKAppleIDAuthenticationInAppContext *v5;
  AKInlineSignInViewController *authenticationViewController;
  AKAppleIDAuthenticationInAppContext *v7;

  v4 = (AKAppleIDAuthenticationInAppContext *)a3;
  v5 = v4;
  if (self->_authContext != v4)
  {
    self->_authContext = v4;
    authenticationViewController = self->_authenticationViewController;
    if (authenticationViewController)
    {
      v7 = v5;
      -[AKInlineSignInViewController setContext:](authenticationViewController, "setContext:", v5);
      v5 = v7;
    }
  }

}

- (void)setSubtitleLabelText:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CSEraseDeviceAuthViewController *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__CSEraseDeviceAuthViewController_signInViewController_didAuthenticateWithResults_error___block_invoke;
  block[3] = &unk_1E8E2DB88;
  v12 = v8;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __89__CSEraseDeviceAuthViewController_signInViewController_didAuthenticateWithResults_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "_updateForFailedAppleIDAuthentication");
  else
    return objc_msgSend(v2, "_presentEraseConfirmationAlertWithAuthResults:", a1[6]);
}

- (void)_activateConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  double v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  double v27;
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
  int v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
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
  int v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v94[19];

  v94[17] = *MEMORY[0x1E0C80C00];
  -[CSEraseDeviceAuthViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)MEMORY[0x1E0CB3718];
  -[UIButton topAnchor](self->_cancelButton, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "topAnchor");
  v5 = objc_claimAutoreleasedReturnValue();
  v89 = __sb__runningInSpringBoard();
  if (v89)
  {
    v6 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v41, "userInterfaceIdiom") == 1;
  }
  v7 = 5.0;
  if (v6)
    v7 = 9.0;
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, v7);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v88;
  -[UIButton leadingAnchor](self->_cancelButton, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v9 = objc_claimAutoreleasedReturnValue();
  v85 = __sb__runningInSpringBoard();
  v92 = v4;
  v90 = (void *)v5;
  if (v85)
  {
    v10 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v40, "userInterfaceIdiom") == 1;
  }
  v11 = 15.0;
  if (v10)
    v11 = 8.0;
  v87 = v8;
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, v11);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v84;
  -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_labelsContainerView, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v12;
  objc_msgSend(v12, "constraintEqualToAnchor:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v94[2] = v81;
  -[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_labelsContainerView, "centerXAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v13;
  objc_msgSend(v13, "constraintEqualToAnchor:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v94[3] = v78;
  -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v14;
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", 8.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v94[4] = v75;
  -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_labelsContainerView, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v15;
  objc_msgSend(v15, "constraintEqualToAnchor:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v94[5] = v71;
  -[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_labelsContainerView, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v16;
  objc_msgSend(v16, "constraintEqualToAnchor:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v94[6] = v68;
  -[UIView bottomAnchor](self->_labelsContainerView, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v17;
  objc_msgSend(v17, "constraintEqualToAnchor:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v94[7] = v65;
  -[UIView widthAnchor](self->_labelsContainerView, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel widthAnchor](self->_titleLabel, "widthAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v18;
  objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v94[8] = v62;
  -[UIView widthAnchor](self->_labelsContainerView, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel widthAnchor](self->_subtitleLabel, "widthAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v19;
  objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v94[9] = v59;
  -[UIView leadingAnchor](self->_labelsContainerView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v21 = objc_claimAutoreleasedReturnValue();
  v56 = __sb__runningInSpringBoard();
  if (v56)
  {
    v22 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v39, "userInterfaceIdiom") == 1;
  }
  v23 = 130.0;
  if (!v22)
    v23 = 20.0;
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, v23);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v94[10] = v55;
  -[UIView trailingAnchor](self->_labelsContainerView, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v25 = objc_claimAutoreleasedReturnValue();
  v52 = __sb__runningInSpringBoard();
  v93 = v3;
  v86 = (void *)v9;
  v57 = (void *)v21;
  v58 = v20;
  if (v52)
  {
    v26 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v38, "userInterfaceIdiom") == 1;
  }
  v27 = -130.0;
  if (!v26)
    v27 = -20.0;
  v53 = (void *)v25;
  v54 = v24;
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, v27);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v94[11] = v51;
  -[UIView topAnchor](self->_labelsContainerView, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->_cancelButton, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 80.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v94[12] = v48;
  -[UIView topAnchor](self->_springView, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_labelsContainerView, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, -29.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v94[13] = v45;
  -[UIView leadingAnchor](self->_springView, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSEraseDeviceAuthViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v94[14] = v28;
  -[UIView trailingAnchor](self->_springView, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSEraseDeviceAuthViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v94[15] = v32;
  -[UIView heightAnchor](self->_springView, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSEraseDeviceAuthViewController _authenticationView](self, "_authenticationView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v94[16] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 17);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "activateConstraints:", v37);

  if ((v52 & 1) == 0)
  if ((v56 & 1) == 0)

  if ((v85 & 1) == 0)
  if ((v89 & 1) == 0)

}

- (void)_handleCancelButtonAction
{
  id v2;

  -[CSEraseDeviceAuthViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelButtonTapped");

}

- (id)_authenticationView
{
  return (id)-[AKInlineSignInViewController view](self->_authenticationViewController, "view");
}

- (void)_presentEraseConfirmationAlertWithAuthResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  CSEraseDeviceAuthViewController *v12;
  id v13;

  v4 = a3;
  -[CSEraseDeviceAuthViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D1D390];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__CSEraseDeviceAuthViewController__presentEraseConfirmationAlertWithAuthResults___block_invoke;
  v10[3] = &unk_1E8E2DBB0;
  v11 = v5;
  v12 = self;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "alertControllerWithCompletion:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSEraseDeviceAuthViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

uint64_t __81__CSEraseDeviceAuthViewController__presentEraseConfirmationAlertWithAuthResults___block_invoke(_QWORD *a1, int a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;

  v6 = (void *)a1[4];
  v7 = a1[5];
  if (a2)
    return objc_msgSend(v6, "authViewController:didConfirmEraseAfterAuthenticationWithResults:shouldEraseDataPlan:", v7, a1[6], a3);
  else
    return objc_msgSend(v6, "authViewControllerDidCancelToEraseDeviceAfterAuthentication:", v7, a4, a3);
}

- (void)_updateForFailedAppleIDAuthentication
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;

  -[AKInlineSignInViewController view](self->_authenticationViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", 1.20000005);
  objc_msgSend(v4, "setStiffness:", 1200.0);
  objc_msgSend(v4, "setDamping:", 12.0);
  LODWORD(v5) = 1028389654;
  LODWORD(v6) = 990057071;
  LODWORD(v7) = 1059712716;
  LODWORD(v8) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v9);

  objc_msgSend(v4, "setDuration:", 0.666999996);
  objc_msgSend(v4, "setVelocity:", 0.0);
  v10 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "position");
  v14 = v13 + 75.0;
  *(float *)&v14 = v14;
  objc_msgSend(v11, "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v15);

  objc_msgSend(v3, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v4, CFSTR("shake"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.x"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 1054276898;
  LODWORD(v19) = 1058305108;
  LODWORD(v20) = 0;
  LODWORD(v21) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v18, v20, v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunction:", v22);

  objc_msgSend(v17, "setDuration:", 0.100000001);
  objc_msgSend(v17, "setFillMode:", v10);
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[UIView layer](self->_springView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "position");
  v26 = v25 + -75.0;
  *(float *)&v26 = v26;
  objc_msgSend(v23, "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v27);

  -[UIView layer](self->_springView, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addAnimation:forKey:", v17, CFSTR("force-off-center"));

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E8E8A228, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc(MEMORY[0x1E0CEA7D0]);
  objc_msgSend(MEMORY[0x1E0CEAE28], "privateConfigurationForTypes:", v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithConfiguration:", v31);

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __72__CSEraseDeviceAuthViewController__updateForFailedAppleIDAuthentication__block_invoke;
  v34[3] = &unk_1E8E2DBD8;
  v35 = v32;
  v36 = 1001;
  v33 = v32;
  objc_msgSend(v33, "activateWithCompletionBlock:", v34);

}

uint64_t __72__CSEraseDeviceAuthViewController__updateForFailedAppleIDAuthentication__block_invoke(uint64_t a1, int a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_privateNotificationOccurred:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "deactivate");
}

- (CSEraseDeviceAuthViewControllerDelegate)delegate
{
  return (CSEraseDeviceAuthViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKAppleIDAuthenticationInAppContext)authContext
{
  return self->_authContext;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_springView, 0);
  objc_storeStrong((id *)&self->_authenticationViewController, 0);
  objc_storeStrong((id *)&self->_labelsContainerView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end
