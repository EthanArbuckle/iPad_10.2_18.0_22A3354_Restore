@implementation AKAuthorizationSubPaneConfirmButton

- (AKAuthorizationSubPaneConfirmButton)initWithPresentationContext:(id)a3
{
  id v5;
  void *v6;
  AKAuthorizationSubPaneConfirmButton *v7;
  AKAuthorizationSubPaneConfirmButton *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_createMainStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)AKAuthorizationSubPaneConfirmButton;
  v7 = -[AKAuthorizationSubPane initWithView:](&v13, sel_initWithView_, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_mainStackView, v6);
    objc_storeStrong((id *)&v8->_presentationContext, a3);
    objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationSubPaneConfirmButton setCanPerformBiometricValidation:](v8, "setCanPerformBiometricValidation:", objc_msgSend(v9, "isBiometricAuthCapable"));

    if (-[AKAuthorizationSubPaneConfirmButton canPerformBiometricValidation](v8, "canPerformBiometricValidation"))
    {
      objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationSubPaneConfirmButton setHasTouchIDOnly:](v8, "setHasTouchIDOnly:", objc_msgSend(v10, "isFaceIDCapable") ^ 1);

    }
    else
    {
      -[AKAuthorizationSubPaneConfirmButton setHasTouchIDOnly:](v8, "setHasTouchIDOnly:", 0);
    }
    -[AKAuthorizationSubPaneConfirmButton _initializeAuthorizationButton](v8, "_initializeAuthorizationButton");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__windowDidBecomeKey_, *MEMORY[0x1E0CEBDF8], 0);

  }
  return v8;
}

- (void)_initializeAuthorizationButton
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *authorizationButtonContainer;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL8 v15;
  AKAuthorizationContinueButton *v16;
  AKAuthorizationButton *authorizationButton;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[6];

  v42[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  authorizationButtonContainer = self->_authorizationButtonContainer;
  self->_authorizationButtonContainer = v8;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_authorizationButtonContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v39 = -[AKAuthorizationSubPaneConfirmButton _shouldUseSIWAButton](self, "_shouldUseSIWAButton");
  if (v39)
  {
    -[AKAuthorizationSubPaneConfirmButton presentationContext](self, "presentationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "credentialRequestContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "authorizationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "existingStatus");

    v14 = -[AKAuthorizationSubPaneConfirmButton _isSubscriptionFlow](self, "_isSubscriptionFlow");
    v15 = v13 != 1 && v14;
    +[AKAuthorizationAppleIDButton buttonWithType:style:](AKAuthorizationAppleIDButton, "buttonWithType:style:", v15, 3);
    v16 = (AKAuthorizationContinueButton *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = -[AKAuthorizationContinueButton initWithFrame:]([AKAuthorizationContinueButton alloc], "initWithFrame:", v4, v5, v6, v7);
  }
  authorizationButton = self->_authorizationButton;
  self->_authorizationButton = &v16->super;

  -[AKAuthorizationButton setAccessibilityIdentifier:](self->_authorizationButton, "setAccessibilityIdentifier:", CFSTR("SIWA_CONTINUE_BUTTON"));
  -[AKAuthorizationButton setTranslatesAutoresizingMaskIntoConstraints:](self->_authorizationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_authorizationButtonContainer, "addSubview:", self->_authorizationButton);
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", self->_authorizationButtonContainer);
  v33 = (void *)MEMORY[0x1E0CB3718];
  -[AKAuthorizationButton centerXAnchor](self->_authorizationButton, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_authorizationButtonContainer, "centerXAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v36;
  -[AKAuthorizationButton centerYAnchor](self->_authorizationButton, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_authorizationButtonContainer, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v18;
  -[UIView widthAnchor](self->_authorizationButtonContainer, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationButton widthAnchor](self->_authorizationButton, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v21;
  -[UIView heightAnchor](self->_authorizationButtonContainer, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationButton heightAnchor](self->_authorizationButton, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v25);

  v26 = (void *)MEMORY[0x1E0CB3718];
  -[AKAuthorizationButton heightAnchor](self->_authorizationButton, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v39)
  {
    objc_msgSend(v27, "constraintEqualToConstant:", 40.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v29;
    -[AKAuthorizationButton widthAnchor](self->_authorizationButton, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToConstant:", 180.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v32);

  }
  else
  {
    +[AKAuthorizationPaneMetrics continueButtonHeight](AKAuthorizationPaneMetrics, "continueButtonHeight");
    objc_msgSend(v28, "constraintEqualToConstant:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v30);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationSubPaneConfirmButton;
  -[AKAuthorizationSubPaneConfirmButton dealloc](&v4, sel_dealloc);
}

- (NSString)buttonText
{
  void *v2;
  void *v3;

  -[AKAuthorizationSubPaneConfirmButton authorizationButton](self, "authorizationButton");
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
  -[AKAuthorizationSubPaneConfirmButton authorizationButton](self, "authorizationButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonText:", v4);

}

- (BOOL)_shouldUseSIWAButton
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[AKAuthorizationSubPaneConfirmButton presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialRequestContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authorizationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEligibleForUpgradeFromPassword")
    && !-[AKAuthorizationSubPaneConfirmButton hasTouchIDOnly](self, "hasTouchIDOnly")
    || -[AKAuthorizationSubPaneConfirmButton _isSubscriptionFlow](self, "_isSubscriptionFlow");

  return v6;
}

- (BOOL)_isSubscriptionFlow
{
  void *v2;
  void *v3;
  char v4;

  -[AKAuthorizationSubPaneConfirmButton presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialRequestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_clientShouldAuthenticateExternally");

  return v4;
}

- (void)addToStackView:(id)a3 context:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationSubPaneConfirmButton;
  v6 = a4;
  -[AKAuthorizationSubPane addToStackView:context:](&v7, sel_addToStackView_context_, a3, v6);
  -[AKAuthorizationSubPaneConfirmButton setContext:](self, "setContext:", v6, v7.receiver, v7.super_class);

}

- (void)addToConstraints:(id)a3 context:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationSubPaneConfirmButton;
  -[AKAuthorizationSubPane addToConstraints:context:](&v4, sel_addToConstraints_context_, a3, a4);
}

- (void)setUpButtonToPaneContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t v31[16];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_BUTTON_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAuthorizationSubPaneConfirmButton presentationContext](self, "presentationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "credentialRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_shouldSkipBiometrics");

  if (v10)
  {
    _AKLogSiwa();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton - Skipping biometrics", v31, 2u);
    }

    v12 = sel__authorizationButtonSkipBioSelected_;
  }
  else
  {
    -[AKAuthorizationSubPaneConfirmButton presentationContext](self, "presentationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "credentialRequestContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_clientShouldAuthenticateExternally");

    if (v15)
    {
      _AKLogSiwa();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_1BD795000, v16, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton - Skipping biometrics and Authentication", v31, 2u);
      }

      v12 = sel__authorizationButtonExternalAuthenticationSelected_;
    }
    else
    {
      -[AKAuthorizationSubPaneConfirmButton presentationContext](self, "presentationContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "credentialRequestContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "_requirePassword");

      if (v19)
      {
        _AKLogSiwa();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_1BD795000, v20, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton - Request requires password or device is not protected with passcode.", v31, 2u);
        }

        -[AKAuthorizationSubPaneConfirmButton _passwordButtonTitle](self, "_passwordButtonTitle");
        v21 = objc_claimAutoreleasedReturnValue();

        v12 = sel__authorizationButtonWithAccountPasswordSelected_;
      }
      else
      {
        v22 = -[AKAuthorizationSubPaneConfirmButton canPerformBiometricValidation](self, "canPerformBiometricValidation");
        _AKLogSiwa();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            *(_WORD *)v31 = 0;
            _os_log_impl(&dword_1BD795000, v23, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton - Can perform biometric auth.", v31, 2u);
          }

          v12 = sel__authorizationButtonBioSelected_;
          -[AKAuthorizationSubPaneConfirmButton _bioButtonTitle](self, "_bioButtonTitle");
          v21 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (v24)
          {
            *(_WORD *)v31 = 0;
            _os_log_impl(&dword_1BD795000, v23, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton - Falling back to passcode.", v31, 2u);
          }

          -[AKAuthorizationSubPaneConfirmButton _passcodeButtonTitle](self, "_passcodeButtonTitle");
          v21 = objc_claimAutoreleasedReturnValue();

          v12 = sel__authorizationWithPasscodeButtonSelected_;
        }
      }
      v7 = (void *)v21;
    }
  }
  -[AKAuthorizationButton setButtonText:](self->_authorizationButton, "setButtonText:", v7);
  objc_msgSend(v5, "mutableConstraints");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView widthAnchor](self->_mainStackView, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stackView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObjectsFromArray:", v30);

  -[AKAuthorizationButton addTarget:action:](self->_authorizationButton, "addTarget:action:", self, v12);
}

- (BOOL)_delegate_validateReadyForAuthorization
{
  void *v2;
  char v3;

  -[AKAuthorizationSubPaneConfirmButton delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "validateReadyForAuthorization");
  else
    v3 = 1;

  return v3;
}

- (void)_authorizationButtonExternalAuthenticationSelected:(id)a3
{
  id v4;

  -[AKAuthorizationSubPaneConfirmButton delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AKAuthorizationSubPaneConfirmButton _delegate_validateReadyForAuthorization](self, "_delegate_validateReadyForAuthorization")&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "subPaneConfirmButtonPerformExternalAuthentication:", self);
  }

}

- (void)_authorizationButtonSkipBioSelected:(id)a3
{
  id v4;

  -[AKAuthorizationSubPaneConfirmButton delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AKAuthorizationSubPaneConfirmButton _delegate_validateReadyForAuthorization](self, "_delegate_validateReadyForAuthorization"))
  {
    objc_msgSend(v4, "performAuthorization");
  }

}

- (void)_authorizationButtonWithAccountPasswordSelected:(id)a3
{
  id v4;

  -[AKAuthorizationSubPaneConfirmButton delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AKAuthorizationSubPaneConfirmButton _delegate_validateReadyForAuthorization](self, "_delegate_validateReadyForAuthorization"))
  {
    objc_msgSend(v4, "performPasswordAuthentication");
  }

}

- (void)_authorizationButtonBioSelected:(id)a3
{
  if (-[AKAuthorizationSubPaneConfirmButton _delegate_validateReadyForAuthorization](self, "_delegate_validateReadyForAuthorization", a3))
  {
    -[AKAuthorizationSubPaneConfirmButton _switchToBioView:withEnabled:showAlert:alertString:](self, "_switchToBioView:withEnabled:showAlert:alertString:", 1, 1, 0, 0);
  }
}

- (void)_authorizationWithPasscodeButtonSelected:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  _QWORD v8[4];
  id v9;
  id buf[2];

  v4 = a3;
  v5 = -[AKAuthorizationSubPaneConfirmButton isPasscodeAuthorizationInProcess](self, "isPasscodeAuthorizationInProcess");
  _AKLogSiwa();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Passcode/Password authorization is already in progress, so ignoring this request.", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Starting Passcode/Password authorization", (uint8_t *)buf, 2u);
    }

    if (-[AKAuthorizationSubPaneConfirmButton _delegate_validateReadyForAuthorization](self, "_delegate_validateReadyForAuthorization"))
    {
      -[AKAuthorizationSubPaneConfirmButton setIsPasscodeAuthorizationInProcess:](self, "setIsPasscodeAuthorizationInProcess:", 1);
      objc_initWeak(buf, self);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __80__AKAuthorizationSubPaneConfirmButton__authorizationWithPasscodeButtonSelected___block_invoke;
      v8[3] = &unk_1E7679958;
      objc_copyWeak(&v9, buf);
      -[AKAuthorizationSubPaneConfirmButton _performPasscodeValidations:](self, "_performPasscodeValidations:", v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(buf);
    }
  }

}

void __80__AKAuthorizationSubPaneConfirmButton__authorizationWithPasscodeButtonSelected___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _AKLogSiwa();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("NO");
      if (a2)
        v5 = CFSTR("YES");
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "Passcode/Password completed with response: %@", (uint8_t *)&v7, 0xCu);
    }

    if (a2)
    {
      objc_msgSend(WeakRetained, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "performAuthorization");

    }
    objc_msgSend(WeakRetained, "setIsPasscodeAuthorizationInProcess:", 0);
  }

}

- (void)_disableBioView
{
  OUTLINED_FUNCTION_7(&dword_1BD795000, a2, a3, "error disabling biometrics UI: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)bioAuthFailWithAlertString:(id)a3
{
  -[AKAuthorizationSubPaneConfirmButton _switchToBioView:withEnabled:showAlert:alertString:](self, "_switchToBioView:withEnabled:showAlert:alertString:", 0, 0, 1, a3);
}

- (void)enableAuthorizationCapability:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  BOOL v7;
  AKAuthorizationSubPaneConfirmButton *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (-[AKAuthorizationSubPaneConfirmButton hasTouchIDOnly](self, "hasTouchIDOnly"))
  {
    -[AKAuthorizationSubPaneConfirmButton presentationContext](self, "presentationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "credentialRequestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "_requirePassword"))
    {

    }
    else
    {
      v7 = -[AKAuthorizationSubPaneConfirmButton _isSubscriptionFlow](self, "_isSubscriptionFlow");

      if (!v7)
      {
        v8 = self;
        v9 = 1;
        v10 = 1;
        goto LABEL_6;
      }
    }
  }
  v8 = self;
  v9 = 0;
  v10 = v3;
LABEL_6:
  -[AKAuthorizationSubPaneConfirmButton _switchToBioView:withEnabled:showAlert:alertString:](v8, "_switchToBioView:withEnabled:showAlert:alertString:", v9, v10, 0, 0);
}

- (void)showAlertAndContinueWithPassword:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  AKAuthorizationButton *authorizationButton;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[5];

  v3 = a3;
  -[AKAuthorizationSubPaneConfirmButton _switchToBioView:withEnabled:showAlert:alertString:](self, "_switchToBioView:withEnabled:showAlert:alertString:", 0, 1, 1, 0);
  if (v3)
  {
    -[AKAuthorizationSubPaneConfirmButton presentationContext](self, "presentationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "credentialRequestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "set_requirePassword:", 1);

    authorizationButton = self->_authorizationButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_BUTTON_TITLE_PASSWORD_MODERN"), &stru_1E7679C68, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationButton setButtonText:](authorizationButton, "setButtonText:", v9);

    -[AKAuthorizationButton addTarget:action:](self->_authorizationButton, "addTarget:action:", self, sel__authorizationButtonWithAccountPasswordSelected_);
  }
  v10 = dispatch_time(0, 1700000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AKAuthorizationSubPaneConfirmButton_showAlertAndContinueWithPassword___block_invoke;
  block[3] = &unk_1E76789A0;
  block[4] = self;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);
}

uint64_t __72__AKAuthorizationSubPaneConfirmButton_showAlertAndContinueWithPassword___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_switchToBioView:withEnabled:showAlert:alertString:", 0, 1, 0, 0);
}

- (void)_windowDidBecomeKey:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[AKAuthorizationSubPaneConfirmButton bioView](self, "bioView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMechanismEnabled:", -[AKAuthorizationSubPaneConfirmButton _authenticationMechanism](self, "_authenticationMechanism"));

  if (v5)
  {
    _AKLogSiwa();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AKAuthorizationSubPaneConfirmButton _windowDidBecomeKey:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    -[AKAuthorizationSubPaneConfirmButton _enableLAUIAuthMechanism](self, "_enableLAUIAuthMechanism");
  }
}

- (void)_switchToBioView:(BOOL)a3 withEnabled:(BOOL)a4 showAlert:(BOOL)a5 alertString:(id)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  AKAuthorizationSubPaneConfirmButton *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[8];
  _BYTE v41[128];
  uint64_t v42;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (!v8
    || !v7
    || (-[AKAuthorizationSubPaneConfirmButton bioView](self, "bioView"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[AKAuthorizationSubPaneConfirmButton mainStackView](self, "mainStackView", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subviews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v19++), "removeFromSuperview");
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v17);
    }

    if (v6)
    {
      _AKLogSiwa();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD795000, v20, OS_LOG_TYPE_DEFAULT, "Showing Authorization UI Alert", buf, 2u);
      }

      -[AKAuthorizationSubPaneConfirmButton _disableBioView](self, "_disableBioView");
      -[AKAuthorizationSubPaneConfirmButton _addArrangedSpaceToMainStackView:](self, "_addArrangedSpaceToMainStackView:", 12.0);
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[AKAuthorizationSubPaneConfirmButton _setupAlertImageWithConstraints:](self, "_setupAlertImageWithConstraints:", v21);
      if (v10)
      {
        -[AKAuthorizationSubPaneConfirmButton _setupLabelWithTitle:withConstraints:animated:](self, "_setupLabelWithTitle:withConstraints:animated:", v10, v21, 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("AUTH_ALERT_SIGN_UP_NOT_COMPLETED"), &stru_1E7679C68, CFSTR("Localizable"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAuthorizationSubPaneConfirmButton _setupLabelWithTitle:withConstraints:animated:](self, "_setupLabelWithTitle:withConstraints:animated:", v33, v21, 1);

      }
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v21);
      goto LABEL_31;
    }
    if (!v8)
    {
      -[AKAuthorizationSubPaneConfirmButton _disableBioView](self, "_disableBioView");
      -[AKAuthorizationSubPaneConfirmButton mainStackView](self, "mainStackView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationSubPaneConfirmButton authorizationButtonContainer](self, "authorizationButtonContainer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addArrangedSubview:", v30);

      -[AKAuthorizationSubPaneConfirmButton authorizationButton](self, "authorizationButton");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setEnabled:", v7);

      goto LABEL_32;
    }
    _AKLogSiwa();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v22, OS_LOG_TYPE_DEFAULT, "Switch to enabled bio view.", buf, 2u);
    }

    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[AKAuthorizationSubPaneConfirmButton _setupBioButtonWithConstraints:](self, "_setupBioButtonWithConstraints:", v21);
    if (-[AKAuthorizationSubPaneConfirmButton hasTouchIDOnly](self, "hasTouchIDOnly"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("BIO_BUTTON_CONTINUE_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = self;
      v26 = v24;
      v27 = v21;
      v28 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isFaceIDCapable");

      if (!v35)
      {
LABEL_30:
        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v21);
        -[AKAuthorizationSubPaneConfirmButton _enableLAUIAuthMechanism](self, "_enableLAUIAuthMechanism");
LABEL_31:

        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("BIO_BUTTON_PEARL_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = self;
      v26 = v24;
      v27 = v21;
      v28 = 1;
    }
    -[AKAuthorizationSubPaneConfirmButton _setupLabelWithTitle:withConstraints:animated:](v25, "_setupLabelWithTitle:withConstraints:animated:", v26, v27, v28);

    goto LABEL_30;
  }
  _AKLogSiwa();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v12, OS_LOG_TYPE_DEFAULT, "Already switched to bio view.", buf, 2u);
  }

  -[AKAuthorizationSubPaneConfirmButton _enableLAUIAuthMechanism](self, "_enableLAUIAuthMechanism");
LABEL_32:

}

- (void)_enableLAUIAuthMechanism
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke;
  block[3] = &unk_1E76789A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "bioView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "_authenticationMechanism");
  v21 = 0;
  v4 = objc_msgSend(v2, "enableMechanism:error:", v3, &v21);
  v5 = v21;

  _AKLogSiwa();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 || (v4 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke_cold_2((uint64_t)v5, v7, v15, v16, v17, v18, v19, v20);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (id)_spaceWithConstant:(double)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v4, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraint:", v6);

  return v4;
}

- (void)_addArrangedSpaceToMainStackView:(double)a3
{
  void *v4;
  id v5;

  -[AKAuthorizationSubPaneConfirmButton _spaceWithConstant:](self, "_spaceWithConstant:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneConfirmButton mainStackView](self, "mainStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArrangedSubview:", v5);

}

- (void)_setupLabelWithTitle:(id)a3 withConstraints:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;

  v5 = a5;
  v16 = (__CFString *)a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0CEB5F0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scaledFontForFont:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v10);

  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(v7, "setNumberOfLines:", 1);
  objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 0);
  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
  if (v5)
    v11 = &stru_1E7679C68;
  else
    v11 = v16;
  objc_msgSend(v7, "setText:", v11);
  -[AKAuthorizationSubPaneConfirmButton mainStackView](self, "mainStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addArrangedSubview:", v7);

  -[AKAuthorizationSubPaneConfirmButton bioView](self, "bioView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AKAuthorizationSubPaneConfirmButton mainStackView](self, "mainStackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationSubPaneConfirmButton bioView](self, "bioView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCustomSpacing:afterView:", v15, 12.0);

  }
  -[AKAuthorizationSubPaneConfirmButton setBioLabel:](self, "setBioLabel:", v7);
  if (v5)
    -[AKAuthorizationSubPaneConfirmButton _updateLabelWithTitle:](self, "_updateLabelWithTitle:", v16);

}

- (void)_setupBioButtonWithConstraints:(id)a3
{
  objc_class *v4;
  id v5;
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
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D44430];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFrame:mechanisms:", -[AKAuthorizationSubPaneConfirmButton _authenticationMechanism](self, "_authenticationMechanism"), 0.0, 0.0, 50.0, 50.0);
  -[AKAuthorizationSubPaneConfirmButton setBioView:](self, "setBioView:", v6);

  -[AKAuthorizationSubPaneConfirmButton bioView](self, "bioView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKAuthorizationSubPaneConfirmButton bioView](self, "bioView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[AKAuthorizationSubPaneConfirmButton mainStackView](self, "mainStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneConfirmButton bioView](self, "bioView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addArrangedSubview:", v10);

  -[AKAuthorizationSubPaneConfirmButton bioView](self, "bioView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 50.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  -[AKAuthorizationSubPaneConfirmButton bioView](self, "bioView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", 50.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v17);

}

- (void)_setupAlertImageWithConstraints:(id)a3
{
  objc_class *v4;
  id v5;
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
  id v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CEA658];
  v19 = a3;
  v5 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 3, 50.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSymbolConfiguration:", v7);

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("exclamationmark.circle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v8);

  objc_msgSend(v5, "setContentMode:", 1);
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 50.0, 50.0);
  -[AKAuthorizationSubPaneConfirmButton mainStackView](self, "mainStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addArrangedSubview:", v5);

  objc_msgSend(v5, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToConstant:", 50.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(v5, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", 50.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  objc_msgSend(v5, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPane view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v17);

}

- (void)_updateLabelWithTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CD28D0];
  v5 = a3;
  objc_msgSend(v4, "animation");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v6);

  v7 = *MEMORY[0x1E0CD3170];
  objc_msgSend(v11, "setType:", *MEMORY[0x1E0CD3170]);
  objc_msgSend(v11, "setDuration:", 0.15);
  -[AKAuthorizationSubPaneConfirmButton bioLabel](self, "bioLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v11, v7);

  -[AKAuthorizationSubPaneConfirmButton bioLabel](self, "bioLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v5);

}

+ (id)_createMainStackView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_BUTTON_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityIdentifier:", v4);

  objc_msgSend(v2, "setSpacing:", 0.0);
  objc_msgSend(v2, "setAlignment:", 3);
  objc_msgSend(v2, "setAxis:", 1);
  objc_msgSend(v2, "setDistribution:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v5);

  return v2;
}

- (BOOL)_hasTouchIDOnly
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesTouchID");

  return v3;
}

- (BOOL)_isUpgradeFromPassword
{
  void *v2;
  void *v3;
  char v4;

  -[AKAuthorizationSubPaneConfirmButton presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialRequestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isEligibleForUpgradeFromPassword");

  return v4;
}

- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AKLogSiwa();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEFAULT, "biometric authentication context: %@ result: %@", (uint8_t *)&v12, 0x16u);
  }

  if (v9)
    -[AKAuthorizationSubPaneConfirmButton _handleBiometricAuthFailureWithError:forContext:](self, "_handleBiometricAuthFailureWithError:forContext:", v9, v10);

}

- (void)processAuthenticationSuccessWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__AKAuthorizationSubPaneConfirmButton_processAuthenticationSuccessWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __89__AKAuthorizationSubPaneConfirmButton_processAuthenticationSuccessWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AUTH_PROCESSING_LOADING"), &stru_1E7679C68, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateLabelWithTitle:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_enterProcessingStateWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "_hasTouchIDOnly"))
    objc_msgSend(*(id *)(a1 + 32), "_waitForTimeInterval:withGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 2.2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subPaneConfirmButtonDidEnterProcessingState:", *(_QWORD *)(a1 + 32));

}

- (void)_checkIfPasscodeFallbackAllowedWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v9[0] = &unk_1E769AA28;
  v9[1] = &unk_1E769AA40;
  v10[0] = MEMORY[0x1E0C9AAB0];
  v10[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__AKAuthorizationSubPaneConfirmButton__checkIfPasscodeFallbackAllowedWithCompletion___block_invoke;
  v7[3] = &unk_1E7678F10;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "evaluatePolicy:options:reply:", 1025, v5, v7);

}

void __85__AKAuthorizationSubPaneConfirmButton__checkIfPasscodeFallbackAllowedWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSiwa();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Location based device policy preflight passcode validation returned with error %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, a2 != 0);

}

- (void)_handleBiometricAuthFailureWithError:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC1280]))
  {
    if (objc_msgSend(v6, "code") == -8)
    {

LABEL_9:
      _AKLogSiwa();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_1BD795000, v12, OS_LOG_TYPE_DEFAULT, "biometric lockedout: %@ error: %@", buf, 0x16u);
      }

      -[AKAuthorizationSubPaneConfirmButton presentationContext](self, "presentationContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "credentialRequestContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "_isFirstPartyLogin");

      if (v15)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __87__AKAuthorizationSubPaneConfirmButton__handleBiometricAuthFailureWithError_forContext___block_invoke;
        v16[3] = &unk_1E7678C38;
        v16[4] = self;
        -[AKAuthorizationSubPaneConfirmButton _checkIfPasscodeFallbackAllowedWithCompletion:](self, "_checkIfPasscodeFallbackAllowedWithCompletion:", v16);
      }
      else
      {
        -[AKAuthorizationSubPaneConfirmButton _switchToPasscode](self, "_switchToPasscode");
      }
      goto LABEL_14;
    }
    v9 = objc_msgSend(v6, "code");

    if (v9 == -1)
      goto LABEL_9;
  }
  else
  {

  }
  _AKLogSiwa();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1BD795000, v10, OS_LOG_TYPE_DEFAULT, "biometric authentication context: %@ error: %@", buf, 0x16u);
  }

  -[AKAuthorizationSubPaneConfirmButton delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subpaneConfirmButtonDidFailBiometry:", self);

LABEL_14:
}

uint64_t __87__AKAuthorizationSubPaneConfirmButton__handleBiometricAuthFailureWithError_forContext___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_switchToPasscode");
  return result;
}

- (void)_enterProcessingStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_group *v6;
  OS_dispatch_group *processingStateGroup;
  void *v8;
  id processingStateCompletionHandler;
  uint8_t v10[16];

  v4 = a3;
  if (*(_OWORD *)&self->_processingStateCompletionHandler == 0)
  {
    v6 = (OS_dispatch_group *)dispatch_group_create();
    processingStateGroup = self->_processingStateGroup;
    self->_processingStateGroup = v6;

    v8 = (void *)MEMORY[0x1C3B760D8](v4);
    processingStateCompletionHandler = self->_processingStateCompletionHandler;
    self->_processingStateCompletionHandler = v8;

    -[AKAuthorizationSubPaneConfirmButton _setGlyphViewGestureRecognizerEnabled:](self, "_setGlyphViewGestureRecognizerEnabled:", 0);
  }
  else
  {
    _AKLogSiwa();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "AKAuthorizationSubPaneConfirmButton already in processing state, ignoring attempt.", v10, 2u);
    }

  }
}

- (void)finishProcessingWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__AKAuthorizationSubPaneConfirmButton_finishProcessingWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __77__AKAuthorizationSubPaneConfirmButton_finishProcessingWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = MEMORY[0x1C3B760D8](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  if ((unint64_t)v2 | v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTH_PROCESSING_COMPLETE"), &stru_1E7679C68, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateLabelWithTitle:", v6);

    objc_msgSend(*(id *)(a1 + 32), "_waitForTimeInterval:withGroup:", v2, 1.0);
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    objc_initWeak(&location, *(id *)(a1 + 32));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__AKAuthorizationSubPaneConfirmButton_finishProcessingWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E7679658;
    objc_copyWeak(&v9, &location);
    v8 = *(id *)(a1 + 40);
    dispatch_group_notify(v2, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __77__AKAuthorizationSubPaneConfirmButton_finishProcessingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidateProcessingState");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidateProcessingState
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AKAuthorizationSubPaneConfirmButton_invalidateProcessingState__block_invoke;
  block[3] = &unk_1E76789A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __64__AKAuthorizationSubPaneConfirmButton_invalidateProcessingState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_setGlyphViewGestureRecognizerEnabled:", 1);
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AKAuthorizationSubPaneConfirmButton__waitForTimeInterval_withGroup___block_invoke;
  block[3] = &unk_1E76789A0;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

}

void __70__AKAuthorizationSubPaneConfirmButton__waitForTimeInterval_withGroup___block_invoke(uint64_t a1)
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
  void *v8;
  id v9;

  v3 = a3;
  -[AKAuthorizationSubPaneConfirmButton bioView](self, "bioView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v9)
  {
    objc_msgSend(v9, "gestureRecognizers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setEnabled:", v3);
    v6 = v9;
  }

}

- (unint64_t)_authenticationMechanism
{
  _os_feature_enabled_impl();
  return 4;
}

- (void)_switchToPasscode
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AKAuthorizationSubPaneConfirmButton__switchToPasscode__block_invoke;
  block[3] = &unk_1E76789A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __56__AKAuthorizationSubPaneConfirmButton__switchToPasscode__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[8];
  objc_msgSend(v2, "_passcodeButtonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonText:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addTarget:action:", *(_QWORD *)(a1 + 32), sel__authorizationWithPasscodeButtonSelected_);
  return objc_msgSend(*(id *)(a1 + 32), "_switchToBioView:withEnabled:showAlert:alertString:", 0, 1, 0, 0);
}

- (id)_passwordButtonTitle
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[AKAuthorizationPresentationContext isSignInFlow](self->_presentationContext, "isSignInFlow");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("AUTHORIZE_BUTTON_TITLE_SIGN_IN_PASSWORD");
  else
    v5 = CFSTR("AUTHORIZE_BUTTON_TITLE_CREATE_ACCOUNT_PASSWORD");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E7679C68, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_passcodeButtonTitle
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[AKAuthorizationPresentationContext isSignInFlow](self->_presentationContext, "isSignInFlow");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("AUTHORIZE_BUTTON_TITLE_SIGN_IN_PASSCODE");
  else
    v5 = CFSTR("AUTHORIZE_BUTTON_TITLE_CREATE_ACCOUNT_PASSCODE");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E7679C68, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_bioButtonTitle
{
  int v3;
  _BOOL4 hasTouchIDOnly;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = -[AKAuthorizationPresentationContext isSignInFlow](self->_presentationContext, "isSignInFlow");
  hasTouchIDOnly = self->_hasTouchIDOnly;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = CFSTR("AUTHORIZE_BUTTON_TITLE_SIGN_IN_TOUCH_ID");
  if (!hasTouchIDOnly)
    v7 = CFSTR("AUTHORIZE_BUTTON_TITLE_SIGN_IN_DEFAULT");
  v8 = CFSTR("AUTHORIZE_BUTTON_TITLE_CREATE_ACCOUNT_DEFAULT");
  if (hasTouchIDOnly)
    v8 = CFSTR("AUTHORIZE_BUTTON_TITLE_CREATE_ACCOUNT_TOUCH_ID");
  if (v3)
    v9 = v7;
  else
    v9 = v8;
  objc_msgSend(v5, "localizedStringForKey:value:table:", v9, &stru_1E7679C68, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_performPasscodeValidations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14[0] = &stru_1E7679C68;
  v13[0] = &unk_1E769AA58;
  v13[1] = &unk_1E769AA70;
  -[AKAuthorizationPresentationContext localizedAppName](self->_presentationContext, "localizedAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = &unk_1E769AA88;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_PASSCODE_VALIDATION_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__AKAuthorizationSubPaneConfirmButton__performPasscodeValidations___block_invoke;
  v11[3] = &unk_1E7678F10;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v5, "evaluatePolicy:options:reply:", 1007, v9, v11);

}

void __67__AKAuthorizationSubPaneConfirmButton__performPasscodeValidations___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  _AKLogSiwa();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __67__AKAuthorizationSubPaneConfirmButton__performPasscodeValidations___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

- (void)switchToAccountCreation
{
  AKAuthorizationButton *authorizationButton;
  void *v4;
  void *v5;

  authorizationButton = self->_authorizationButton;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_BUTTON_TITLE_LOGIN_OPTION_CREATE_NEW_ACCOUNT"), &stru_1E7679C68, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationButton setButtonText:](authorizationButton, "setButtonText:", v5);

  -[AKAuthorizationButton addTarget:action:](self->_authorizationButton, "addTarget:action:", self, sel__createAccountSelected);
  -[AKAuthorizationSubPaneConfirmButton _switchToBioView:withEnabled:showAlert:alertString:](self, "_switchToBioView:withEnabled:showAlert:alertString:", 0, 1, 0, 0);
}

- (void)_createAccountSelected
{
  id v3;

  -[AKAuthorizationSubPaneConfirmButton delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AKAuthorizationSubPaneConfirmButton _delegate_validateReadyForAuthorization](self, "_delegate_validateReadyForAuthorization")&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "subPaneConfirmButtonPerformAccountCreation:", self);
  }

}

- (void)resetToDefault
{
  id v3;

  -[AKAuthorizationSubPaneConfirmButton context](self, "context");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneConfirmButton setUpButtonToPaneContext:](self, "setUpButtonToPaneContext:", v3);

}

- (NSString)bioTextForInactiveState
{
  return self->_bioTextForInactiveState;
}

- (void)setBioTextForInactiveState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (AKAuthorizationButton)authorizationButton
{
  return self->_authorizationButton;
}

- (AKAuthorizationSubPaneConfirmButtonDelegate)delegate
{
  return (AKAuthorizationSubPaneConfirmButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKAuthorizationPaneContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (UIStackView)mainStackView
{
  return self->_mainStackView;
}

- (void)setMainStackView:(id)a3
{
  objc_storeStrong((id *)&self->_mainStackView, a3);
}

- (UIView)authorizationButtonContainer
{
  return self->_authorizationButtonContainer;
}

- (BOOL)hasTouchIDOnly
{
  return self->_hasTouchIDOnly;
}

- (void)setHasTouchIDOnly:(BOOL)a3
{
  self->_hasTouchIDOnly = a3;
}

- (BOOL)canPerformBiometricValidation
{
  return self->_canPerformBiometricValidation;
}

- (void)setCanPerformBiometricValidation:(BOOL)a3
{
  self->_canPerformBiometricValidation = a3;
}

- (UILabel)bioLabel
{
  return self->_bioLabel;
}

- (void)setBioLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bioLabel, a3);
}

- (LAUIAuthenticationView)bioView
{
  return self->_bioView;
}

- (void)setBioView:(id)a3
{
  objc_storeStrong((id *)&self->_bioView, a3);
}

- (BOOL)isPasscodeAuthorizationInProcess
{
  return self->_isPasscodeAuthorizationInProcess;
}

- (void)setIsPasscodeAuthorizationInProcess:(BOOL)a3
{
  self->_isPasscodeAuthorizationInProcess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bioView, 0);
  objc_storeStrong((id *)&self->_bioLabel, 0);
  objc_storeStrong((id *)&self->_authorizationButtonContainer, 0);
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authorizationButton, 0);
  objc_storeStrong((id *)&self->_bioTextForInactiveState, 0);
  objc_storeStrong((id *)&self->_processingStateGroup, 0);
  objc_storeStrong(&self->_processingStateCompletionHandler, 0);
}

- (void)_windowDidBecomeKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BD795000, a1, a3, "Window did become key and biometry is enabled, activating.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BD795000, a1, a3, "biometrics enabled", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __63__AKAuthorizationSubPaneConfirmButton__enableLAUIAuthMechanism__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1BD795000, a2, a3, "error enabling biometrics: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __67__AKAuthorizationSubPaneConfirmButton__performPasscodeValidations___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1BD795000, a2, a3, "Error during passcode validation %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
