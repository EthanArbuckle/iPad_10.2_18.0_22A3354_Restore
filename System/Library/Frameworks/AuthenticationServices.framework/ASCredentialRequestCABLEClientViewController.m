@implementation ASCredentialRequestCABLEClientViewController

- (ASCredentialRequestCABLEClientViewController)initWithPresentationContext:(id)a3 loginChoice:(id)a4 activity:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  ASCredentialRequestCABLEClientViewController *v13;
  ASCredentialRequestCABLEClientViewController *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ASCredentialRequestCABLEClientViewController;
  v12 = -[ASCredentialRequestPaneViewController initRequiringTableView:](&v16, sel_initRequiringTableView_, 0);
  v13 = (ASCredentialRequestCABLEClientViewController *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 131, a3);
    objc_storeStrong((id *)&v13->_loginChoice, a4);
    objc_storeStrong((id *)&v13->_authorizationActivity, a5);
    v14 = v13;
  }

  return v13;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCredentialRequestCABLEClientViewController;
  -[ASCredentialRequestPaneViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[ASCredentialRequestCABLEClientViewController _setUpTitleView](self, "_setUpTitleView");
  -[ASCredentialRequestCABLEClientViewController _setUpQRCodeView](self, "_setUpQRCodeView");
  -[ASCredentialRequestCABLEClientViewController _setUpSecurityKeyButtonViewIfNeeded](self, "_setUpSecurityKeyButtonViewIfNeeded");
  -[ASCredentialRequestCABLEClientViewController _addBelowQRCodeSpacerView](self, "_addBelowQRCodeSpacerView");
  -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
}

- (void)_setUpTitleView
{
  ASCredentialRequestInfoLabelSubPane *v3;
  void *v4;
  void *v5;
  ASCredentialRequestInfoLabelSubPane *v6;

  v3 = [ASCredentialRequestInfoLabelSubPane alloc];
  -[ASCredentialRequestCABLEClientViewController _titleText](self, "_titleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASCredentialRequestInfoLabelSubPane initWithString:labelType:](v3, "initWithString:labelType:", v4, 1);

  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubPane:withCustomSpacingAfter:", v6, 24.0);

}

- (void)_setUpQRCodeView
{
  _ASCABLEQRCodeView *v3;
  void *v4;
  void *v5;
  void *v6;
  _ASCABLEQRCodeView *v7;

  v3 = [_ASCABLEQRCodeView alloc];
  -[ASCredentialRequestCABLEClientViewController _qrCodeMessage](self, "_qrCodeMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_ASCABLEQRCodeView initWithMessage:](v3, "initWithMessage:", v4);

  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addArrangedSubview:", v7);

  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestCABLEClientViewController _marginBelowQRCode](self, "_marginBelowQRCode");
  objc_msgSend(v6, "setCustomSpacing:afterView:", v7);

}

- (void)_setUpSecurityKeyButtonViewIfNeeded
{
  void *v3;
  double v4;
  ASCredentialRequestSubPane *v5;
  void *v6;
  id v7;

  if (-[ASCAuthorizationPresentationContext shouldAllowSecurityKeysFromCABLEView](self->_presentationContext, "shouldAllowSecurityKeysFromCABLEView"))
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCredentialRequestSecondaryButton buttonWithTitle:target:action:](ASCredentialRequestSecondaryButton, "buttonWithTitle:target:action:", v3, self, sel__useSecurityKeyButtonTapped);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    LODWORD(v4) = 1148846080;
    objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v4);
    v5 = -[ASCredentialRequestSubPane initWithView:]([ASCredentialRequestSubPane alloc], "initWithView:", v7);
    -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestCABLEClientViewController _marginBelowSecurityKeyButton](self, "_marginBelowSecurityKeyButton");
    objc_msgSend(v6, "addSubPane:withCustomSpacingAfter:", v5);

  }
}

- (id)_titleText
{
  void *v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  if (-[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest"))
  {
    if (-[ASCAuthorizationPresentationContext shouldUseFallbackPasskeyUI](self->_presentationContext, "shouldUseFallbackPasskeyUI"))
    {
      v4 = -[ASCAuthorizationPresentationContext cableAuthenticatorRequirement](self->_presentationContext, "cableAuthenticatorRequirement");
      switch(v4)
      {
        case 2:
          v5 = (void *)MEMORY[0x24BDD17C8];
          goto LABEL_29;
        case 1:
          v5 = (void *)MEMORY[0x24BDD17C8];
          goto LABEL_29;
        case 0:
          v5 = (void *)MEMORY[0x24BDD17C8];
LABEL_29:
          _WBSLocalizedString();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "localizedStringWithFormat:", v12, v13);
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
      }
    }
    v6 = -[ASCAuthorizationPresentationContext cableAuthenticatorRequirement](self->_presentationContext, "cableAuthenticatorRequirement");
    switch(v6)
    {
      case 2:
        v5 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_29;
      case 1:
        v5 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_29;
      case 0:
        v5 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_29;
    }
  }
  -[ASCAuthorizationPresentationContext destinationSiteForCrossSiteAssertion](self->_presentationContext, "destinationSiteForCrossSiteAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = -[ASCAuthorizationPresentationContext cableAuthenticatorRequirement](self->_presentationContext, "cableAuthenticatorRequirement");
    switch(v9)
    {
      case 2:
        v10 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_22;
      case 1:
        v10 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_22;
      case 0:
        v10 = (void *)MEMORY[0x24BDD17C8];
LABEL_22:
        _WBSLocalizedString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCAuthorizationPresentationContext destinationSiteForCrossSiteAssertion](self->_presentationContext, "destinationSiteForCrossSiteAssertion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v12, v13, v14);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
        return v2;
    }
  }
  v11 = -[ASCAuthorizationPresentationContext cableAuthenticatorRequirement](self->_presentationContext, "cableAuthenticatorRequirement");
  switch(v11)
  {
    case 2:
      v5 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_29;
    case 1:
      v5 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_29;
    case 0:
      v5 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_29;
  }
  return v2;
}

- (double)_marginBelowQRCode
{
  int v2;
  int v3;
  double result;
  double v5;

  v2 = -[ASCAuthorizationPresentationContext shouldAllowSecurityKeysFromCABLEView](self->_presentationContext, "shouldAllowSecurityKeysFromCABLEView");
  v3 = objc_msgSend(MEMORY[0x24BE0B290], "isPad");
  result = 12.0;
  if (v3)
    result = 8.0;
  v5 = 48.0;
  if (v3)
    v5 = 32.0;
  if (!v2)
    return v5;
  return result;
}

- (double)_marginBelowSecurityKeyButton
{
  return 10.0;
}

- (void)_addBelowQRCodeSpacerView
{
  id v2;

  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEmptyViewWithSpacing:", 0.0);

}

- (id)_qrCodeMessage
{
  void *v2;
  void *v3;

  -[ASCABLELoginChoice qrCodeURL](self->_loginChoice, "qrCodeURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_useSecurityKeyButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_37);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v6, "requestPaneViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, v4, 0, &__block_literal_global_42);
    }
    else
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_38);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0B1C8], 1, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "requestPaneViewController:dismissWithCredential:error:", self, 0, v5);

    }
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_23);
  }

}

void __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

BOOL __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_35(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loginChoiceKind") == 3;
}

void __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_loginChoice, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
}

void __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, a1, a3, "Use Security Key button from AutoFill tapped but no delegate.", a5, a6, a7, a8, 0);
}

void __75__ASCredentialRequestCABLEClientViewController__useSecurityKeyButtonTapped__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, a1, a3, "Use Security Key button from AutoFill tapped but no security key login choice is available. Failing request.", a5, a6, a7, a8, 0);
}

@end
