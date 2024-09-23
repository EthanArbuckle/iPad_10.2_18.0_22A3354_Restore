@implementation AMUIInlineAuthenticationViewController

- (AMUIInlineAuthenticationViewController)initWithUnlockDestination:(id)a3
{
  id v5;
  AMUIInlineAuthenticationViewController *v6;
  AMUIInlineAuthenticationViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMUIInlineAuthenticationViewController;
  v6 = -[AMUIInlineAuthenticationViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_unlockDestination, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSTimer invalidate](self->_biometricAuthenticationTimer, "invalidate");
  -[AMUIInlineAuthenticationViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticationViewController:didSetBiometricAuthenticationDisabled:", self, 0);

  v4.receiver = self;
  v4.super_class = (Class)AMUIInlineAuthenticationViewController;
  -[AMUIInlineAuthenticationViewController dealloc](&v4, sel_dealloc);
}

- (void)setDateProvider:(id)a3
{
  AMUIDateProviding **p_dateProvider;
  id v6;

  p_dateProvider = &self->_dateProvider;
  objc_storeStrong((id *)&self->_dateProvider, a3);
  v6 = a3;
  -[AMUIDateTimeDataLayerViewController setDateProvider:](self->_dateTimeLayerViewController, "setDateProvider:", *p_dateProvider);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MTMaterialView *v11;
  MTMaterialView *materialView;
  SBUIPasscodeLockView *v13;
  SBUIPasscodeLockView *passcodeView;
  SBUIPasscodeLockView *v15;
  void *v16;
  SBUIPasscodeLockView *v17;
  void *v18;
  SBUIPasscodeLockView *v19;
  void *v20;
  AMUIPasscodeButton *v21;
  AMUIPasscodeButton *v22;
  AMUIPasscodeButton *passcodeButton;
  AMUIPasscodeButton *v24;
  void *v25;
  void *v26;
  void *v27;
  AMUIPasscodeButton *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  AMUIDateTimeDataLayerViewController *v41;
  AMUIDateTimeDataLayerViewController *dateTimeLayerViewController;
  void *v43;
  AMUIDateTimeDataLayerViewController *v44;
  id v45;
  id val;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50[5];
  id from;
  id location;
  objc_super v53;
  _QWORD v54[5];

  v54[3] = *MEMORY[0x24BDAC8D0];
  v53.receiver = self;
  v53.super_class = (Class)AMUIInlineAuthenticationViewController;
  -[AMUIInlineAuthenticationViewController viewDidLoad](&v53, sel_viewDidLoad);
  -[AMUIInlineAuthenticationViewController view](self, "view");
  val = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(val, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:", 53);
  v11 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  materialView = self->_materialView;
  self->_materialView = v11;

  -[MTMaterialView setOverrideUserInterfaceStyle:](self->_materialView, "setOverrideUserInterfaceStyle:", 2);
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", *(double *)&v4, *(double *)&v6, *(double *)&v8, *(double *)&v10);
  objc_msgSend(val, "addSubview:", self->_materialView);
  objc_msgSend(MEMORY[0x24BEB0F78], "passcodeLockViewForUsersCurrentStyle");
  v13 = (SBUIPasscodeLockView *)objc_claimAutoreleasedReturnValue();
  passcodeView = self->_passcodeView;
  self->_passcodeView = v13;

  -[SBUIPasscodeLockView setDelegate:](self->_passcodeView, "setDelegate:", self);
  -[SBUIPasscodeLockView setUnlockDestination:](self->_passcodeView, "setUnlockDestination:", self->_unlockDestination);
  -[SBUIPasscodeLockView setShowsCancelButton:](self->_passcodeView, "setShowsCancelButton:", 0);
  -[SBUIPasscodeLockView setShowsEmergencyCallButton:](self->_passcodeView, "setShowsEmergencyCallButton:", 0);
  -[SBUIPasscodeLockView setUsesBiometricPresentation:](self->_passcodeView, "setUsesBiometricPresentation:", -[AMUIInlineAuthenticationViewController _shouldSkipBiometricPresentation](self, "_shouldSkipBiometricPresentation") ^ 1);
  -[SBUIPasscodeLockView setShowsProudLock:](self->_passcodeView, "setShowsProudLock:", SBUIIsSystemApertureEnabled() ^ 1);
  -[SBUIPasscodeLockView setShowsLockIconForFaceID:](self->_passcodeView, "setShowsLockIconForFaceID:", 1);
  v15 = self->_passcodeView;
  -[AMUIInlineAuthenticationViewController _unlockReason](self, "_unlockReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockView setOverridePasscodeButtonTitle:](v15, "setOverridePasscodeButtonTitle:", v16);

  -[SBUIPasscodeLockView setAlwaysShowPasscodeButtonForFaceIDMatchFailure:](self->_passcodeView, "setAlwaysShowPasscodeButtonForFaceIDMatchFailure:", 1);
  v17 = self->_passcodeView;
  -[AMUIInlineAuthenticationViewController _unlockReason](self, "_unlockReason");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockView setOverrideFaceIDReason:](v17, "setOverrideFaceIDReason:", v18);

  v19 = self->_passcodeView;
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockView setCustomBackgroundColor:](v19, "setCustomBackgroundColor:", v20);

  objc_msgSend(val, "addSubview:", self->_passcodeView);
  if ((-[SBUIPasscodeLockView canPeformBiometricAuthentication](self->_passcodeView, "canPeformBiometricAuthentication") & 1) == 0)
  {
    -[SBUIPasscodeLockView setAlpha:](self->_passcodeView, "setAlpha:", 0.0);
    -[SBUIPasscodeLockView setPasscodeLockViewState:animated:](self->_passcodeView, "setPasscodeLockViewState:animated:", 0, 0);
    v21 = [AMUIPasscodeButton alloc];
    v22 = -[AMUIPasscodeButton initWithFrame:](v21, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    passcodeButton = self->_passcodeButton;
    self->_passcodeButton = v22;

    v24 = self->_passcodeButton;
    v25 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF6A78], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF7850], 0x8000, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fontWithDescriptor:size:", v26, 0.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIPasscodeButton setFont:](v24, "setFont:", v27);

    v28 = self->_passcodeButton;
    -[AMUIInlineAuthenticationViewController _unlockReason](self, "_unlockReason");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIPasscodeButton setTitle:](v28, "setTitle:", v29);

    -[AMUIPasscodeButton addTarget:action:forControlEvents:](self->_passcodeButton, "addTarget:action:forControlEvents:", self, sel__handlePasscodeButtonAction, 64);
    -[AMUIPasscodeButton setTranslatesAutoresizingMaskIntoConstraints:](self->_passcodeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(val, "addSubview:", self->_passcodeButton);
    -[AMUIPasscodeButton widthAnchor](self->_passcodeButton, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToConstant:", 225.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v32) = 1132068864;
    objc_msgSend(v31, "setPriority:", v32);
    v33 = (void *)MEMORY[0x24BDD1628];
    -[AMUIPasscodeButton centerYAnchor](self->_passcodeButton, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v36;
    -[AMUIPasscodeButton centerXAnchor](self->_passcodeButton, "centerXAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v39;
    v54[2] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v40);

  }
  v41 = objc_alloc_init(AMUIDateTimeDataLayerViewController);
  dateTimeLayerViewController = self->_dateTimeLayerViewController;
  self->_dateTimeLayerViewController = v41;

  -[AMUIDateTimeDataLayerViewController setChromeOrientationPolicy:](self->_dateTimeLayerViewController, "setChromeOrientationPolicy:", 2);
  -[AMUIDateTimeDataLayerViewController setDateProvider:](self->_dateTimeLayerViewController, "setDateProvider:", self->_dateProvider);
  -[AMUIDateTimeDataLayerViewController view](self->_dateTimeLayerViewController, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v43);

  objc_initWeak(&from, val);
  v44 = self->_dateTimeLayerViewController;
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __53__AMUIInlineAuthenticationViewController_viewDidLoad__block_invoke;
  v47[3] = &unk_250763C28;
  objc_copyWeak(&v49, &location);
  objc_copyWeak(v50, &from);
  v50[1] = v4;
  v50[2] = v6;
  v50[3] = v8;
  v50[4] = v10;
  v45 = val;
  v48 = v45;
  -[AMUIInlineAuthenticationViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v44, 0, v47);
  objc_msgSend(v45, "setNeedsUpdateConstraints");

  objc_destroyWeak(v50);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __53__AMUIInlineAuthenticationViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v2)
  {
    objc_msgSend(WeakRetained, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    objc_msgSend(WeakRetained, "setAutoresizingMask:", 18);
    objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", WeakRetained);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMUIInlineAuthenticationViewController;
  -[AMUIInlineAuthenticationViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AMUIInlineAuthenticationViewController _reset](self, "_reset");
  -[SBUIPasscodeLockView becomeFirstResponder](self->_passcodeView, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSTimer *biometricAuthenticationTimer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMUIInlineAuthenticationViewController;
  -[AMUIInlineAuthenticationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[AMUIInlineAuthenticationViewController _setBiometricAuthenticationDisabled:resettingTimeout:](self, "_setBiometricAuthenticationDisabled:resettingTimeout:", 0, 0);
  -[NSTimer invalidate](self->_biometricAuthenticationTimer, "invalidate");
  biometricAuthenticationTimer = self->_biometricAuthenticationTimer;
  self->_biometricAuthenticationTimer = 0;

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMUIInlineAuthenticationViewController;
  -[AMUIInlineAuthenticationViewController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  -[AMUIInlineAuthenticationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v5, v7, v9, v11);
  -[SBUIPasscodeLockView setFrame:](self->_passcodeView, "setFrame:", v5, v7, v9, v11);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  -[AMUIInlineAuthenticationViewController _attemptUnlockForBioUnlock:](self, "_attemptUnlockForBioUnlock:", 0);
}

- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3
{
  -[AMUIInlineAuthenticationViewController _attemptUnlockForBioUnlock:](self, "_attemptUnlockForBioUnlock:", 1);
}

- (void)passcodeLockViewStateChange:(id)a3
{
  _BOOL8 v4;
  void *v5;

  v4 = objc_msgSend(a3, "passcodeLockViewState") == 1;
  -[AMUIInlineAuthenticationViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticationViewController:setDidSetPasscodeVisible:", self, v4);

  -[SBUIPasscodeLockView setShowsCancelButton:](self->_passcodeView, "setShowsCancelButton:", v4);
  -[AMUIInlineAuthenticationViewController _setDateTimeLayerHidden:](self, "_setDateTimeLayerHidden:", 1);
}

- (id)passcode
{
  return (id)-[SBUIPasscodeLockView passcode](self->_passcodeView, "passcode");
}

- (void)resetForSuccess
{
  -[SBUIPasscodeLockView resetForSuccess](self->_passcodeView, "resetForSuccess");
}

- (void)resetForFailedPasscode
{
  -[SBUIPasscodeLockView resetForFailedPasscode](self->_passcodeView, "resetForFailedPasscode");
}

- (void)_attemptUnlockForBioUnlock:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  -[AMUIInlineAuthenticationViewController authenticationHandler](self, "authenticationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__AMUIInlineAuthenticationViewController__attemptUnlockForBioUnlock___block_invoke;
  v6[3] = &unk_2507637B0;
  v6[4] = self;
  objc_msgSend(v5, "attemptUnlockForSender:forBioUnlock:completion:", self, v3, v6);

}

void __69__AMUIInlineAuthenticationViewController__attemptUnlockForBioUnlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticationViewController:didAuthenticateWithSuccess:", *(_QWORD *)(a1 + 32), a2);

}

- (void)_handlePasscodeButtonAction
{
  -[AMUIInlineAuthenticationViewController _setPasscodeVisible:](self, "_setPasscodeVisible:", 1);
  -[SBUIPasscodeLockView setShowsCancelButton:](self->_passcodeView, "setShowsCancelButton:", 1);
  -[AMUIInlineAuthenticationViewController _setBiometricAuthenticationDisabled:](self, "_setBiometricAuthenticationDisabled:", 0);
}

- (void)_setPasscodeVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  v3 = a3;
  -[AMUIInlineAuthenticationViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticationViewController:setDidSetPasscodeVisible:", self, v3);

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BDF6F90];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__AMUIInlineAuthenticationViewController__setPasscodeVisible___block_invoke;
  v7[3] = &unk_2507634F8;
  objc_copyWeak(&v8, &location);
  v9 = v3;
  objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 0, v7, 0, 0.3, 0.0);
  -[AMUIInlineAuthenticationViewController _setDateTimeLayerHidden:](self, "_setDateTimeLayerHidden:", v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__AMUIInlineAuthenticationViewController__setPasscodeVisible___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  double v4;
  double v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = WeakRetained[123];
    if (*(_BYTE *)(a1 + 40))
      v4 = 0.0;
    else
      v4 = 1.0;
    objc_msgSend(v3, "setAlpha:", v4);
    if (*(_BYTE *)(a1 + 40))
      v5 = 1.0;
    else
      v5 = 0.0;
    objc_msgSend(v6[122], "setAlpha:", v5);
    WeakRetained = v6;
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v6[122], "setPasscodeLockViewState:animated:", 1, 1);
      WeakRetained = v6;
    }
  }

}

- (void)_setDateTimeLayerHidden:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  -[AMUIDateTimeDataLayerViewController view](self->_dateTimeLayerViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDF6F90];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__AMUIInlineAuthenticationViewController__setDateTimeLayerHidden___block_invoke;
  v7[3] = &unk_250763960;
  v8 = v4;
  v9 = a3;
  v6 = v4;
  objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 0, v7, 0, 0.3, 0.0);

}

uint64_t __66__AMUIInlineAuthenticationViewController__setDateTimeLayerHidden___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

- (void)_reset
{
  _BOOL8 v3;
  char v4;

  v3 = -[AMUIInlineAuthenticationViewController _wantsBioUnlockBlocked](self, "_wantsBioUnlockBlocked");
  v4 = -[SBUIPasscodeLockView canPeformBiometricAuthentication](self->_passcodeView, "canPeformBiometricAuthentication");
  -[AMUIInlineAuthenticationViewController _setBiometricAuthenticationDisabled:](self, "_setBiometricAuthenticationDisabled:", v3);
  -[SBUIPasscodeLockView setPasscodeLockViewState:animated:](self->_passcodeView, "setPasscodeLockViewState:animated:", 0, 1);
  -[SBUIPasscodeLockView setShowsProudLock:](self->_passcodeView, "setShowsProudLock:", 0);
  -[SBUIPasscodeLockView reset](self->_passcodeView, "reset");
  -[AMUIInlineAuthenticationViewController _setDateTimeLayerHidden:](self, "_setDateTimeLayerHidden:", 0);
  if ((v4 & 1) == 0)
    -[AMUIInlineAuthenticationViewController _setPasscodeVisible:](self, "_setPasscodeVisible:", 0);
}

- (id)_unlockReason
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  AMUIAmbientUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INLINE_AUTH_REASON"), &stru_250764378, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, self->_unlockDestination);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_shouldSkipBiometricPresentation
{
  int v3;
  int v4;
  BOOL v5;

  v3 = MGGetBoolAnswer();
  v4 = MGGetBoolAnswer();
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 0;
  return v5 || -[AMUIInlineAuthenticationViewController _wantsBioUnlockBlocked](self, "_wantsBioUnlockBlocked");
}

- (BOOL)_wantsBioUnlockBlocked
{
  AMUIInlineAuthenticationViewController *v2;
  void *v3;

  v2 = self;
  -[AMUIInlineAuthenticationViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "authenticationViewControllerWantsBiometricAuthenticationBlocked:", v2);

  return (char)v2;
}

- (void)_setUpBiometricAuthenticationTimeout
{
  NSTimer *biometricAuthenticationTimer;
  NSTimer *v4;
  NSTimer *v5;
  NSTimer *v6;
  _QWORD v7[5];

  biometricAuthenticationTimer = self->_biometricAuthenticationTimer;
  if (biometricAuthenticationTimer)
  {
    -[NSTimer invalidate](biometricAuthenticationTimer, "invalidate");
    v4 = self->_biometricAuthenticationTimer;
    self->_biometricAuthenticationTimer = 0;

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__AMUIInlineAuthenticationViewController__setUpBiometricAuthenticationTimeout__block_invoke;
  v7[3] = &unk_250763C50;
  v7[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 20.0);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v6 = self->_biometricAuthenticationTimer;
  self->_biometricAuthenticationTimer = v5;

}

uint64_t __78__AMUIInlineAuthenticationViewController__setUpBiometricAuthenticationTimeout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBiometricAuthenticationDisabled:", 1);
}

- (void)_setBiometricAuthenticationDisabled:(BOOL)a3
{
  -[AMUIInlineAuthenticationViewController _setBiometricAuthenticationDisabled:resettingTimeout:](self, "_setBiometricAuthenticationDisabled:resettingTimeout:", a3, 1);
}

- (void)_setBiometricAuthenticationDisabled:(BOOL)a3 resettingTimeout:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v4 = a4;
  v5 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  if (-[SBUIPasscodeLockView isBiometricAuthenticationAllowed](self->_passcodeView, "isBiometricAuthenticationAllowed") != a3)
  {
    if (!v4 || v5)
      return;
LABEL_10:
    -[AMUIInlineAuthenticationViewController _setUpBiometricAuthenticationTimeout](self, "_setUpBiometricAuthenticationTimeout");
    return;
  }
  AMUILogGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl(&dword_23600A000, v7, OS_LOG_TYPE_DEFAULT, "Inline authentication view controller setting biometric authentication disabled: %{BOOL}u", (uint8_t *)v9, 8u);
  }

  -[SBUIPasscodeLockView setBiometricAuthenticationAllowed:](self->_passcodeView, "setBiometricAuthenticationAllowed:", v5 ^ 1);
  -[AMUIInlineAuthenticationViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authenticationViewController:didSetBiometricAuthenticationDisabled:", self, v5);

  if (v5)
  {
    -[SBUIPasscodeLockView setPasscodeLockViewState:](self->_passcodeView, "setPasscodeLockViewState:", 1);
    return;
  }
  if (v4)
    goto LABEL_10;
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (AMUIInlineAuthenticationViewControllerDelegate)delegate
{
  return (AMUIInlineAuthenticationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMAuthenticationHandling)authenticationHandler
{
  return (AMAuthenticationHandling *)objc_loadWeakRetained((id *)&self->_authenticationHandler);
}

- (void)setAuthenticationHandler:(id)a3
{
  objc_storeWeak((id *)&self->_authenticationHandler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_authenticationHandler);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationTimer, 0);
  objc_storeStrong((id *)&self->_dateTimeLayerViewController, 0);
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_storeStrong((id *)&self->_passcodeButton, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
