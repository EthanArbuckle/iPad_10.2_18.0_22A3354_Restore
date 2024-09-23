@implementation ASCredentialRequestConfirmButtonSubPane

- (ASCredentialRequestConfirmButtonSubPane)initWithActivity:(id)a3
{
  return -[ASCredentialRequestConfirmButtonSubPane initWithActivity:auditTokenData:](self, "initWithActivity:auditTokenData:", a3, 0);
}

- (ASCredentialRequestConfirmButtonSubPane)initWithActivity:(id)a3 auditTokenData:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ASCredentialRequestConfirmButtonSubPane *v10;
  ASCredentialRequestConfirmButtonSubPane *v11;
  double v12;
  void *v13;
  uint64_t v14;
  NSData *auditTokenData;
  ASCredentialRequestConfirmButtonSubPane *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_createMainStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)ASCredentialRequestConfirmButtonSubPane;
  v10 = -[ASCredentialRequestSubPane initWithView:](&v18, sel_initWithView_, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_authorizationActivity, a3);
    objc_storeStrong((id *)&v11->_mainStackView, v9);
    LODWORD(v12) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v11->_mainStackView, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    v11->_canPerformBiometricAuthentication = objc_msgSend(MEMORY[0x24BE0B290], "isBiometricAuthenticationAvailable");
    v11->_canPerformCompanionAuthentication = objc_msgSend(MEMORY[0x24BE0B290], "isCompanionAuthenticationAvailable");
    -[ASCredentialRequestConfirmButtonSubPane _initializeAuthorizationButton](v11, "_initializeAuthorizationButton");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v11, sel__windowDidBecomeKey_, *MEMORY[0x24BEBE9D8], 0);

    v14 = objc_msgSend(v8, "copy");
    auditTokenData = v11->_auditTokenData;
    v11->_auditTokenData = (NSData *)v14;

    v16 = v11;
  }

  return v11;
}

- (NSString)buttonText
{
  void *v2;
  void *v3;

  -[ASCredentialRequestConfirmButtonSubPane authorizationButton](self, "authorizationButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setButtonText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCredentialRequestConfirmButtonSubPane authorizationButton](self, "authorizationButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonText:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestConfirmButtonSubPane;
  -[ASCredentialRequestConfirmButtonSubPane dealloc](&v4, sel_dealloc);
}

+ (id)_createMainStackView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BEBD978]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("ASAuthorizationControllerContinueButton"));
  objc_msgSend(v2, "setSpacing:", 0.0);
  objc_msgSend(v2, "setAlignment:", 3);
  objc_msgSend(v2, "setAxis:", 1);
  objc_msgSend(v2, "setDistribution:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (void)_initializeAuthorizationButton
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *authorizationButtonContainerView;
  ASCredentialRequestButtonContinue *v10;
  ASCredentialRequestButton *authorizationButton;
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
  void *v27;
  _QWORD v28[6];

  v28[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  authorizationButtonContainerView = self->_authorizationButtonContainerView;
  self->_authorizationButtonContainerView = v8;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_authorizationButtonContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = -[ASCredentialRequestButtonContinue initWithFrame:]([ASCredentialRequestButtonContinue alloc], "initWithFrame:", v4, v5, v6, v7);
  authorizationButton = self->_authorizationButton;
  self->_authorizationButton = &v10->super;

  -[ASCredentialRequestButton setTranslatesAutoresizingMaskIntoConstraints:](self->_authorizationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_authorizationButtonContainerView, "addSubview:", self->_authorizationButton);
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", self->_authorizationButtonContainerView);
  v22 = (void *)MEMORY[0x24BDD1628];
  -[ASCredentialRequestButton centerXAnchor](self->_authorizationButton, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_authorizationButtonContainerView, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v25;
  -[ASCredentialRequestButton centerYAnchor](self->_authorizationButton, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_authorizationButtonContainerView, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v12;
  -[UIView widthAnchor](self->_authorizationButtonContainerView, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButton widthAnchor](self->_authorizationButton, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v15;
  -[UIView heightAnchor](self->_authorizationButtonContainerView, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButton heightAnchor](self->_authorizationButton, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v18;
  -[ASCredentialRequestButton heightAnchor](self->_authorizationButton, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASViewServiceInterfaceUtilities continueButtonHeight](ASViewServiceInterfaceUtilities, "continueButtonHeight");
  objc_msgSend(v19, "constraintEqualToConstant:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v21);

}

- (void)_windowDidBecomeKey:(id)a3
{
  if (-[LAUIAuthenticationView isMechanismEnabled:](self->_biometricsView, "isMechanismEnabled:", 4))
    -[ASCredentialRequestConfirmButtonSubPane _enableLAUIAuthenticationMechanism](self, "_enableLAUIAuthenticationMechanism");
}

- (void)_enableLAUIAuthenticationMechanism
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke;
  block[3] = &unk_24C94F558;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[7];
  v10 = 0;
  v4 = objc_msgSend(v3, "enableMechanism:error:", objc_msgSend(v2, "_authenticationMechanism"), &v10);
  v5 = v10;
  v6 = v5;
  if (v5 || (v4 & 1) == 0)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke_2;
    v8[3] = &unk_24C94F558;
    v9 = v5;
    os_activity_apply(v7, v8);

  }
}

void __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke_2_cold_1(a1, v2);
}

- (unint64_t)_authenticationMechanism
{
  _os_feature_enabled_impl();
  return 4;
}

- (void)setAuthorizationCapabilityEnabled:(BOOL)a3
{
  _BOOL8 v3;
  ASCredentialRequestConfirmButtonSubPane *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BE0B290], "biometryType") == 1 && self->_canPerformBiometricAuthentication)
  {
    v5 = self;
    v6 = 1;
    v7 = 1;
  }
  else
  {
    v5 = self;
    v6 = 0;
    v7 = v3;
  }
  -[ASCredentialRequestConfirmButtonSubPane _switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:](v5, "_switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:", v6, v7, 0, 0);
}

- (BOOL)authorizationCapabilityEnabled
{
  void *v2;
  char v3;

  -[ASCredentialRequestConfirmButtonSubPane authorizationButton](self, "authorizationButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)showAlertContinuingWithPassword:(BOOL)a3
{
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD block[5];

  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__ASCredentialRequestConfirmButtonSubPane_showAlertContinuingWithPassword___block_invoke;
  block[3] = &unk_24C94F558;
  block[4] = self;
  v6 = MEMORY[0x24BDAC9B8];
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v7 = dispatch_time(0, 1700000000);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __75__ASCredentialRequestConfirmButtonSubPane_showAlertContinuingWithPassword___block_invoke_2;
  v8[3] = &unk_24C951548;
  v9 = a3;
  v8[4] = self;
  dispatch_after(v7, v6, v8);

}

void __75__ASCredentialRequestConfirmButtonSubPane_showAlertContinuingWithPassword___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  _WBSLocalizedString();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:", 0, 0, 1, v2);

}

uint64_t __75__ASCredentialRequestConfirmButtonSubPane_showAlertContinuingWithPassword___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_passcodeOrPasswordButtonTitle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setButtonText:", v2);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addTarget:action:", *(_QWORD *)(a1 + 32), sel__authorizeAppleAccountWithPasswordButtonSelected_);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:", 0, 1, 0, 0);
}

- (void)setUpButtonInPaneContext:(id)a3
{
  -[ASCredentialRequestConfirmButtonSubPane setUpButtonInPaneContext:buttonTitle:](self, "setUpButtonInPaneContext:buttonTitle:", a3, 0);
}

- (void)setUpButtonInPaneContext:(id)a3 buttonTitle:(id)a4
{
  id v6;
  id v7;
  char **v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_canPerformBiometricAuthentication)
  {
    v8 = &selRef__authorizationButtonBioSelected_;
  }
  else if (self->_canPerformCompanionAuthentication)
  {
    v8 = &selRef__authorizationButtonCompanionSelected_;
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_24);
    v8 = &selRef__authorizationWithPasscodeOrPasswordButtonSelected_;
  }
  v9 = *v8;
  if (!v7)
  {
    _WBSLocalizedString();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x24BDD1628];
  -[UIStackView widthAnchor](self->_mainStackView, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v15);

  -[ASCredentialRequestButton setButtonText:](self->_authorizationButton, "setButtonText:", v7);
  -[ASCredentialRequestButton addTarget:action:](self->_authorizationButton, "addTarget:action:", self, v9);

}

void __80__ASCredentialRequestConfirmButtonSubPane_setUpButtonInPaneContext_buttonTitle___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_INFO, "Biometric authentication not available. Falling back to passcode.", v1, 2u);
  }
}

- (void)showContinueButton
{
  id v3;

  _WBSLocalizedString();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestConfirmButtonSubPane showContinueButtonWithTitle:](self, "showContinueButtonWithTitle:", v3);

}

- (void)showContinueButtonWithTitle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__ASCredentialRequestConfirmButtonSubPane_showContinueButtonWithTitle___block_invoke;
  v6[3] = &unk_24C94F5F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __71__ASCredentialRequestConfirmButtonSubPane_showContinueButtonWithTitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setButtonText:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addTarget:action:", *(_QWORD *)(a1 + 32), sel__continueButtonTapped);
  return objc_msgSend(*(id *)(a1 + 32), "_switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:", 0, 1, 0, 0);
}

- (void)showAuthenticationMechanismForExternalPasswordCredential
{
  id WeakRetained;
  _QWORD v4[5];

  if (self->_canPerformBiometricAuthentication)
  {
    -[ASCredentialRequestConfirmButtonSubPane _switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:](self, "_switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:", 1, 1, 0, 0);
  }
  else if (-[ASCredentialRequestConfirmButtonSubPane _shouldAllowFallbackToPasscodeAuthentication](self, "_shouldAllowFallbackToPasscodeAuthentication"))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __99__ASCredentialRequestConfirmButtonSubPane_showAuthenticationMechanismForExternalPasswordCredential__block_invoke;
    v4[3] = &unk_24C951590;
    v4[4] = self;
    -[ASCredentialRequestConfirmButtonSubPane _performPasscodeOrPasswordValidation:](self, "_performPasscodeOrPasswordValidation:", v4);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "confirmButtonSubPaneDidFailBiometry:allowingPasscodeFallback:", self, 0);

  }
}

void __99__ASCredentialRequestConfirmButtonSubPane_showAuthenticationMechanismForExternalPasswordCredential__block_invoke(uint64_t a1, int a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  if (a2)
  {
    v4 = (id *)(*(_QWORD *)(a1 + 32) + 120);
    v5 = a3;
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "performAuthorization:withAuthenticatedLAContext:", *(_QWORD *)(a1 + 32), v5);

  }
}

- (void)_authorizationButtonBioSelected:(id)a3
{
  if (-[ASCredentialRequestConfirmButtonSubPane _isDelegateReadyForAuthorization](self, "_isDelegateReadyForAuthorization", a3))
  {
    -[ASCredentialRequestConfirmButtonSubPane _switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:](self, "_switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:", 1, 1, 0, 0);
  }
}

- (void)_authorizationButtonCompanionSelected:(id)a3
{
  _QWORD v4[5];

  if (-[ASCredentialRequestConfirmButtonSubPane _isDelegateReadyForAuthorization](self, "_isDelegateReadyForAuthorization", a3))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __81__ASCredentialRequestConfirmButtonSubPane__authorizationButtonCompanionSelected___block_invoke;
    v4[3] = &unk_24C951590;
    v4[4] = self;
    -[ASCredentialRequestConfirmButtonSubPane _performCompanionValidation:](self, "_performCompanionValidation:", v4);
  }
}

void __81__ASCredentialRequestConfirmButtonSubPane__authorizationButtonCompanionSelected___block_invoke(uint64_t a1, int a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  if (a2)
  {
    v4 = (id *)(*(_QWORD *)(a1 + 32) + 120);
    v5 = a3;
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "performAuthorization:withAuthenticatedLAContext:", *(_QWORD *)(a1 + 32), v5);

  }
}

- (void)_authorizationWithPasscodeOrPasswordButtonSelected:(id)a3
{
  _QWORD v4[5];

  if (-[ASCredentialRequestConfirmButtonSubPane _isDelegateReadyForAuthorization](self, "_isDelegateReadyForAuthorization", a3))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __94__ASCredentialRequestConfirmButtonSubPane__authorizationWithPasscodeOrPasswordButtonSelected___block_invoke;
    v4[3] = &unk_24C951590;
    v4[4] = self;
    -[ASCredentialRequestConfirmButtonSubPane _performPasscodeOrPasswordValidation:](self, "_performPasscodeOrPasswordValidation:", v4);
  }
}

void __94__ASCredentialRequestConfirmButtonSubPane__authorizationWithPasscodeOrPasswordButtonSelected___block_invoke(uint64_t a1, int a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  if (a2)
  {
    v4 = (id *)(*(_QWORD *)(a1 + 32) + 120);
    v5 = a3;
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "performAuthorization:withAuthenticatedLAContext:", *(_QWORD *)(a1 + 32), v5);

  }
}

- (void)_authorizeAppleAccountWithPasswordButtonSelected:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "performPasswordAuthentication:", self);

}

- (void)_continueButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userTappedContinueButton");

}

- (void)_performCompanionValidation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSData *auditTokenData;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDDA938]);
  -[ASCredentialRequestConfirmButtonSubPane _passcodeOrPasswordButtonTitle](self, "_passcodeOrPasswordButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCED8];
  v16[0] = &unk_24C96E038;
  v16[1] = &unk_24C96E050;
  v17[0] = v6;
  v17[1] = &stru_24C955390;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  auditTokenData = self->_auditTokenData;
  if (auditTokenData)
    objc_msgSend(v9, "setObject:forKey:", auditTokenData, &unk_24C96E068);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke;
  v13[3] = &unk_24C9515B8;
  v14 = v5;
  v15 = v4;
  v13[4] = self;
  v11 = v5;
  v12 = v4;
  objc_msgSend(v11, "evaluatePolicy:options:reply:", 3, v9, v13);

}

void __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke_2;
    block[3] = &unk_24C94F558;
    v7 = v5;
    os_activity_apply(v4, block);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke_2_cold_1(a1, v2);
}

- (void)_performPasscodeOrPasswordValidation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDDA938]);
  -[ASCredentialRequestConfirmButtonSubPane _passcodeOrPasswordButtonTitle](self, "_passcodeOrPasswordButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = &unk_24C96E038;
  v13[1] = &unk_24C96E050;
  v14[0] = v6;
  v14[1] = &stru_24C955390;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke;
  v10[3] = &unk_24C9515B8;
  v11 = v5;
  v12 = v4;
  v10[4] = self;
  v8 = v5;
  v9 = v4;
  objc_msgSend(v8, "evaluatePolicy:options:reply:", 1007, v7, v10);

}

void __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke_2;
    block[3] = &unk_24C94F558;
    v7 = v5;
    os_activity_apply(v4, block);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke_2_cold_1(a1, v2);
}

- (BOOL)_isDelegateReadyForAuthorization
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "validateReadyForAuthorization:", self);
  else
    v4 = 1;

  return v4;
}

- (void)_switchToBiometricsView:(BOOL)a3 withAuthenticationMechanismEnabled:(BOOL)a4 showAlert:(BOOL)a5 alertString:(id)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  ASCredentialRequestConfirmButtonSubPane *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  if (!v8 || !v7 || !self->_biometricsView)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[UIStackView subviews](self->_mainStackView, "subviews", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v16++), "removeFromSuperview");
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

    if (v6)
    {
      -[ASCredentialRequestConfirmButtonSubPane disableBiometricView](self, "disableBiometricView");
      -[ASCredentialRequestConfirmButtonSubPane _addArrangedSpaceToMainStackView:](self, "_addArrangedSpaceToMainStackView:", 12.0);
      -[ASCredentialRequestConfirmButtonSubPane _setUpAlertImageWithConstraints](self, "_setUpAlertImageWithConstraints");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestConfirmButtonSubPane _setupLabelWithTitle:animated:](self, "_setupLabelWithTitle:animated:", v10, 1);
LABEL_22:
      objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v17);

      goto LABEL_23;
    }
    if (!v8)
    {
      -[ASCredentialRequestConfirmButtonSubPane disableBiometricView](self, "disableBiometricView");
      -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", self->_authorizationButtonContainerView);
      -[ASCredentialRequestConfirmButtonSubPane authorizationButton](self, "authorizationButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setEnabled:", v7);

      goto LABEL_23;
    }
    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ASCredentialRequestConfirmButtonSubPane _setupBiometricButtonWithConstraints:](self, "_setupBiometricButtonWithConstraints:", v17);
    v18 = objc_msgSend(MEMORY[0x24BE0B290], "biometryType");
    if (v18 == 2)
    {
      _WBSLocalizedString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self;
      v22 = v20;
      v23 = 1;
    }
    else
    {
      if (!v18)
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_43);
        goto LABEL_22;
      }
      _WBSLocalizedString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self;
      v22 = v20;
      v23 = 0;
    }
    -[ASCredentialRequestConfirmButtonSubPane _setupLabelWithTitle:animated:](v21, "_setupLabelWithTitle:animated:", v22, v23);

    goto LABEL_22;
  }
  -[ASCredentialRequestConfirmButtonSubPane _enableLAUIAuthenticationMechanism](self, "_enableLAUIAuthenticationMechanism");
LABEL_23:

}

void __124__ASCredentialRequestConfirmButtonSubPane__switchToBiometricsView_withAuthenticationMechanismEnabled_showAlert_alertString___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __124__ASCredentialRequestConfirmButtonSubPane__switchToBiometricsView_withAuthenticationMechanismEnabled_showAlert_alertString___block_invoke_cold_1(v0);
}

- (void)disableBiometricView
{
  LAUIAuthenticationView *biometricsView;
  LAUIAuthenticationView *v4;
  char v5;
  id v6;
  void *v7;
  NSObject *authorizationActivity;
  LAUIAuthenticationView *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  biometricsView = self->_biometricsView;
  if (biometricsView)
  {
    -[LAUIAuthenticationView setDelegate:](biometricsView, "setDelegate:", 0);
    v4 = self->_biometricsView;
    v12 = 0;
    v5 = -[LAUIAuthenticationView disableMechanism:error:](v4, "disableMechanism:error:", 4, &v12);
    v6 = v12;
    v7 = v6;
    if (v6 || (v5 & 1) == 0)
    {
      authorizationActivity = self->_authorizationActivity;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __63__ASCredentialRequestConfirmButtonSubPane_disableBiometricView__block_invoke;
      v10[3] = &unk_24C94F558;
      v11 = v6;
      os_activity_apply(authorizationActivity, v10);

    }
    v9 = self->_biometricsView;
    self->_biometricsView = 0;

  }
}

void __63__ASCredentialRequestConfirmButtonSubPane_disableBiometricView__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __63__ASCredentialRequestConfirmButtonSubPane_disableBiometricView__block_invoke_cold_1(a1, v2);
}

- (void)_addArrangedSpaceToMainStackView:(double)a3
{
  id v4;

  -[ASCredentialRequestConfirmButtonSubPane _verticalSpacerWithConstant:](self, "_verticalSpacerWithConstant:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", v4);

}

- (id)_verticalSpacerWithConstant:(double)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v4, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraint:", v6);

  return v4;
}

- (id)_setUpAlertImageWithConstraints
{
  id v3;
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
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBD668]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 3, 50.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredSymbolConfiguration:", v5);

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.circle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

  objc_msgSend(v3, "setContentMode:", 1);
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, 50.0, 50.0);
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", v3);
  objc_msgSend(v3, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 50.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 50.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(v3, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestSubPane view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_setupLabelWithTitle:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  double v11;
  UILabel *biometricLabel;
  __CFString *v13;

  v4 = a4;
  v13 = (__CFString *)a3;
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:weight:", 15.0, *MEMORY[0x24BEBE268]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledFontForFont:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v6, "setFont:", v9);

  -[UILabel setTextAlignment:](v6, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v6, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontForContentSizeCategory:](v6, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](v6, "setAdjustsFontSizeToFitWidth:", 1);
  if (v4)
    v10 = &stru_24C955390;
  else
    v10 = v13;
  -[UILabel setText:](v6, "setText:", v10);
  LODWORD(v11) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v6, "setContentCompressionResistancePriority:forAxis:", 1, v11);
  -[UILabel setMaximumContentSizeCategory:](v6, "setMaximumContentSizeCategory:", *MEMORY[0x24BEBE070]);
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", v6);
  if (self->_biometricsView)
    -[UIStackView setCustomSpacing:afterView:](self->_mainStackView, "setCustomSpacing:afterView:", 12.0);
  biometricLabel = self->_biometricLabel;
  self->_biometricLabel = v6;

  if (v4)
    -[ASCredentialRequestConfirmButtonSubPane _updateLabelAnimatedWithTitle:](self, "_updateLabelAnimatedWithTitle:", v13);

}

- (void)_updateLabelAnimatedWithTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDE57E8];
  v5 = a3;
  objc_msgSend(v4, "animation");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimingFunction:", v6);

  v7 = *MEMORY[0x24BDE5E00];
  objc_msgSend(v9, "setType:", *MEMORY[0x24BDE5E00]);
  objc_msgSend(v9, "setDuration:", 0.15);
  -[UILabel layer](self->_biometricLabel, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAnimation:forKey:", v9, v7);

  -[UILabel setText:](self->_biometricLabel, "setText:", v5);
}

- (void)_setupBiometricButtonWithConstraints:(id)a3
{
  objc_class *v4;
  id v5;
  LAUIAuthenticationView *v6;
  LAUIAuthenticationView *biometricsView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BE60858];
  v5 = a3;
  v6 = (LAUIAuthenticationView *)objc_msgSend([v4 alloc], "initWithFrame:mechanisms:", 4, 0.0, 0.0, 50.0, 50.0);
  biometricsView = self->_biometricsView;
  self->_biometricsView = v6;

  -[LAUIAuthenticationView setTranslatesAutoresizingMaskIntoConstraints:](self->_biometricsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[LAUIAuthenticationView setDelegate:](self->_biometricsView, "setDelegate:", self);
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", self->_biometricsView);
  -[LAUIAuthenticationView widthAnchor](self->_biometricsView, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", 50.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  -[LAUIAuthenticationView heightAnchor](self->_biometricsView, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 50.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v12);

}

- (void)_switchToPasscodeOrPassword
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__ASCredentialRequestConfirmButtonSubPane__switchToPasscodeOrPassword__block_invoke;
  block[3] = &unk_24C94F558;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __70__ASCredentialRequestConfirmButtonSubPane__switchToPasscodeOrPassword__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_passcodeOrPasswordButtonTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setButtonText:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addTarget:action:", *(_QWORD *)(a1 + 32), sel__authorizationWithPasscodeOrPasswordButtonSelected_);
  return objc_msgSend(*(id *)(a1 + 32), "_switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:", 0, 1, 0, 0);
}

- (void)_switchToAppleAccountPassword
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ASCredentialRequestConfirmButtonSubPane__switchToAppleAccountPassword__block_invoke;
  block[3] = &unk_24C94F558;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __72__ASCredentialRequestConfirmButtonSubPane__switchToAppleAccountPassword__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_passwordAuthenticationButtonTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setButtonText:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addTarget:action:", *(_QWORD *)(a1 + 32), sel__authorizeAppleAccountWithPasswordButtonSelected_);
  return objc_msgSend(*(id *)(a1 + 32), "_switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:", 0, 1, 0, 0);
}

- (id)_passcodeOrPasswordButtonTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_passwordAuthenticationButtonTitle
{
  return (id)_WBSLocalizedString();
}

- (void)_enterProcessingStateWithCompletionHandler:(id)a3
{
  OS_dispatch_group *v4;
  OS_dispatch_group *processingStateGroup;
  void *v6;
  id processingStateCompletionHandler;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  if (*(_OWORD *)&self->_processingStateCompletionHandler == 0)
  {
    v4 = (OS_dispatch_group *)dispatch_group_create();
    processingStateGroup = self->_processingStateGroup;
    self->_processingStateGroup = v4;

    v6 = (void *)MEMORY[0x212BBEFEC](v8);
    processingStateCompletionHandler = self->_processingStateCompletionHandler;
    self->_processingStateCompletionHandler = v6;

    -[ASCredentialRequestConfirmButtonSubPane _setGlyphViewGestureRecognizerEnabled:](self, "_setGlyphViewGestureRecognizerEnabled:", 0);
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_63);
    v8[2]();
  }

}

void __86__ASCredentialRequestConfirmButtonSubPane__enterProcessingStateWithCompletionHandler___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_INFO, "ASCredentialRequestConfirmButtonSubPane already in processing state, ignoring attempt.", v1, 2u);
  }
}

- (void)_waitForTimeInterval:(double)a3 withGroup:(id)a4
{
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;

  v5 = a4;
  v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_group_enter(v5);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ASCredentialRequestConfirmButtonSubPane__waitForTimeInterval_withGroup___block_invoke;
  block[3] = &unk_24C94F558;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

void __74__ASCredentialRequestConfirmButtonSubPane__waitForTimeInterval_withGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_setGlyphViewGestureRecognizerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[LAUIAuthenticationView subviews](self->_biometricsView, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v8)
  {
    objc_msgSend(v8, "gestureRecognizers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setEnabled:", v3);
    v5 = v8;
  }

}

- (void)biometricAuthenticationFailureWithAlertString:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  -[ASCredentialRequestConfirmButtonSubPane _switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:](self, "_switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:", 0, 0, 1, a3);
  v4 = dispatch_time(0, 1700000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__ASCredentialRequestConfirmButtonSubPane_biometricAuthenticationFailureWithAlertString___block_invoke;
  block[3] = &unk_24C94F558;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

uint64_t __89__ASCredentialRequestConfirmButtonSubPane_biometricAuthenticationFailureWithAlertString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_switchToBiometricsView:withAuthenticationMechanismEnabled:showAlert:alertString:", 0, 1, 0, 0);
}

- (void)finishProcessingWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__ASCredentialRequestConfirmButtonSubPane_finishProcessingWithCompletionHandler___block_invoke;
  v6[3] = &unk_24C950080;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __81__ASCredentialRequestConfirmButtonSubPane_finishProcessingWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v3 = MEMORY[0x212BBEFEC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  if (!((unint64_t)v2 | v3))
    goto LABEL_6;
  v4 = *(void **)(a1 + 32);
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateLabelAnimatedWithTitle:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_waitForTimeInterval:withGroup:", v2, 1.0);
  if (v3)
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  if (v2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__ASCredentialRequestConfirmButtonSubPane_finishProcessingWithCompletionHandler___block_invoke_2;
    block[3] = &unk_24C951620;
    objc_copyWeak(&v8, &location);
    v7 = *(id *)(a1 + 40);
    dispatch_group_notify(v2, MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __81__ASCredentialRequestConfirmButtonSubPane_finishProcessingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidateProcessingState");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)invalidateProcessingState
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __68__ASCredentialRequestConfirmButtonSubPane_invalidateProcessingState__block_invoke;
  v2[3] = &unk_24C94F530;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __68__ASCredentialRequestConfirmButtonSubPane_invalidateProcessingState__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[12];
    WeakRetained[12] = 0;
    v4 = WeakRetained;

    v3 = (void *)v4[11];
    v4[11] = 0;

    objc_msgSend(v4, "_setGlyphViewGestureRecognizerEnabled:", 1);
    WeakRetained = v4;
  }

}

- (BOOL)_shouldAllowFallbackToPasscodeAuthentication
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v6[0] = &unk_24C96E080;
  v6[1] = &unk_24C96E098;
  v7[0] = MEMORY[0x24BDBD1C8];
  v7[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evaluatePolicy:options:error:", 1025, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

- (void)showActivityIndicator
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  -[ASCredentialRequestButton setHidden:](self->_authorizationButton, "setHidden:", 1);
  v3 = objc_alloc_init(MEMORY[0x24BEBD398]);
  objc_msgSend(v3, "setHidden:", 0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_authorizationButtonContainerView, "addSubview:", v3);
  v15 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v3, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_authorizationButtonContainerView, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  objc_msgSend(v3, "centerYAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_authorizationButtonContainerView, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  objc_msgSend(v3, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASViewServiceInterfaceUtilities continueButtonHeight](ASViewServiceInterfaceUtilities, "continueButtonHeight");
  objc_msgSend(v8, "constraintEqualToConstant:", v9 * 0.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  objc_msgSend(v3, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASViewServiceInterfaceUtilities continueButtonHeight](ASViewServiceInterfaceUtilities, "continueButtonHeight");
  objc_msgSend(v11, "constraintEqualToConstant:", v12 * 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

  objc_msgSend(v3, "startAnimating");
}

- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  _BOOL8 v14;
  NSObject *authorizationActivity;
  BOOL v16;
  _BOOL8 v17;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD block[5];
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke;
    block[3] = &unk_24C94F5F8;
    block[4] = self;
    v26 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v19 = v26;
    goto LABEL_9;
  }
  v27 = *MEMORY[0x24BDDA908];
  v28[0] = &unk_24C96DF78;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "safari_matchesErrorDomainsAndCodes:", v12);

  v14 = -[ASCredentialRequestConfirmButtonSubPane _shouldAllowFallbackToPasscodeAuthentication](self, "_shouldAllowFallbackToPasscodeAuthentication");
  authorizationActivity = self->_authorizationActivity;
  if (v13)
    v16 = !v14;
  else
    v16 = 1;
  if (v16)
  {
    v17 = v14;
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke_73;
    v23 = &unk_24C94F558;
    v24 = v9;
    os_activity_apply(authorizationActivity, &v20);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "confirmButtonSubPaneDidFailBiometry:allowingPasscodeFallback:", self, v17, v20, v21, v22, v23);

    v19 = v24;
LABEL_9:

    goto LABEL_10;
  }
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_72);
  -[ASCredentialRequestConfirmButtonSubPane _switchToPasscodeOrPassword](self, "_switchToPasscodeOrPassword");
LABEL_10:

}

void __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  objc_msgSend(WeakRetained, "confirmButtonSubPaneDidEnterProcessingState:withAuthenticatedContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke_71()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_INFO, "Biometric auth failed or locked out. Switching to passcode authentication.", v1, 2u);
  }
}

void __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke_73(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke_73_cold_1(a1, v2);
}

- (void)processBiometricMatchWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__ASCredentialRequestConfirmButtonSubPane_processBiometricMatchWithCompletionHandler___block_invoke;
  v6[3] = &unk_24C950080;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __86__ASCredentialRequestConfirmButtonSubPane_processBiometricMatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateLabelAnimatedWithTitle:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_enterProcessingStateWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(MEMORY[0x24BE0B290], "biometryType");
  if (result == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_waitForTimeInterval:withGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), 2.2);
  return result;
}

- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5
{
  ASCredentialRequestPaneContext *v8;
  ASCredentialRequestPaneContext *paneContext;
  objc_super v10;

  v8 = (ASCredentialRequestPaneContext *)a5;
  v10.receiver = self;
  v10.super_class = (Class)ASCredentialRequestConfirmButtonSubPane;
  -[ASCredentialRequestSubPane addToStackView:withCustomSpacingAfter:context:](&v10, sel_addToStackView_withCustomSpacingAfter_context_, a3, v8, a4);
  paneContext = self->_paneContext;
  self->_paneContext = v8;

}

- (ASCredentialRequestButton)authorizationButton
{
  return self->_authorizationButton;
}

- (ASCredentialRequestSubPaneConfirmButtonDelegate)delegate
{
  return (ASCredentialRequestSubPaneConfirmButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authorizationButton, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_processingStateGroup, 0);
  objc_storeStrong(&self->_processingStateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_biometricLabel, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_paneContext, 0);
  objc_storeStrong((id *)&self->_biometricsView, 0);
  objc_storeStrong((id *)&self->_authorizationButtonContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_mainStackView, 0);
}

void __77__ASCredentialRequestConfirmButtonSubPane__enableLAUIAuthenticationMechanism__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Error enabling biometrics in credential picker: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __71__ASCredentialRequestConfirmButtonSubPane__performCompanionValidation___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Companion authentication in ASAuthorizationController credential picker failed with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __80__ASCredentialRequestConfirmButtonSubPane__performPasscodeOrPasswordValidation___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Passcode authentication in ASAuthorizationController credential picker failed with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __124__ASCredentialRequestConfirmButtonSubPane__switchToBiometricsView_withAuthenticationMechanismEnabled_showAlert_alertString___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E4D9000, log, OS_LOG_TYPE_ERROR, "Asked to show biometric view without any biometrics available.", v1, 2u);
}

void __63__ASCredentialRequestConfirmButtonSubPane_disableBiometricView__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Error disabling biometrics UI: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __78__ASCredentialRequestConfirmButtonSubPane_authenticationResult_error_context___block_invoke_73_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Biometric auth failed with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

@end
