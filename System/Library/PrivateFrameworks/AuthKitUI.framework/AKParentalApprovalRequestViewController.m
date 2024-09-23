@implementation AKParentalApprovalRequestViewController

- (AKParentalApprovalRequestViewController)initWithPresentationContext:(id)a3
{
  id v5;
  AKParentalApprovalRequestViewController *v6;
  AKParentalApprovalRequestViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKParentalApprovalRequestViewController;
  v6 = -[AKAuthorizationPaneViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_presentationContext, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKParentalApprovalRequestViewController;
  -[AKAuthorizationPaneViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[AKParentalApprovalRequestViewController _setupIconView](self, "_setupIconView");
  -[AKParentalApprovalRequestViewController _setupTitleLabel](self, "_setupTitleLabel");
  -[AKParentalApprovalRequestViewController _setupMessageLabel](self, "_setupMessageLabel");
  -[AKAuthorizationPaneViewController footerPaneContext](self, "footerPaneContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKParentalApprovalRequestViewController _addSendButtonToContext:](self, "_addSendButtonToContext:", v3);

  v4 = (void *)MEMORY[0x1E0CB3718];
  -[AKAuthorizationPaneViewController mutableConstraints](self, "mutableConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateConstraints:", v5);

}

- (void)_setupIconView
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  +[AKIcon iconWithPresentationContext:](AKIcon, "iconWithPresentationContext:", self->_presentationContext);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "iconType") == 1)
  {
    +[AKAuthorizationPaneMetrics iconSize](AKAuthorizationPaneMetrics, "iconSize");
    +[AKIcon iconWithName:size:](AKIcon, "iconWithName:size:", CFSTR("AppleLogo"));
    v3 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v3;
  }
  else
  {
    v4 = v5;
  }
  v6 = v4;
  -[AKParentalApprovalRequestViewController _createIconViewWithIcon:](self, "_createIconViewWithIcon:", v4);

}

- (void)_setupTitleLabel
{
  AKAuthorizationSubPaneInfoLabel *v3;
  void *v4;
  void *v5;
  AKAuthorizationSubPaneInfoLabel *v6;

  v3 = [AKAuthorizationSubPaneInfoLabel alloc];
  -[AKParentalApprovalRequestViewController _localizedTitleString](self, "_localizedTitleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AKAuthorizationSubPaneInfoLabel initWithString:](v3, "initWithString:", v4);

  -[AKAuthorizationSubPaneInfoLabel setInfoLabelType:](v6, "setInfoLabelType:", 1);
  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubPane:", v6);

}

- (void)_setupMessageLabel
{
  AKAuthorizationSubPaneInfoLabel *v3;
  void *v4;
  AKAuthorizationSubPaneInfoLabel *v5;
  AKAuthorizationSubPaneInfoLabel *messageLabel;
  id v7;

  v3 = [AKAuthorizationSubPaneInfoLabel alloc];
  -[AKParentalApprovalRequestViewController _localizedDescriptionLabelString](self, "_localizedDescriptionLabelString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AKAuthorizationSubPaneInfoLabel initWithString:](v3, "initWithString:", v4);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v5;

  -[AKAuthorizationSubPaneInfoLabel setInfoLabelType:](self->_messageLabel, "setInfoLabelType:", 0);
  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubPane:", self->_messageLabel);

}

- (void)_addSendButtonToContext:(id)a3
{
  id v4;
  AKAuthorizationContinueButton *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AKAuthorizationContinueButton *v18;

  v4 = a3;
  v5 = [AKAuthorizationContinueButton alloc];
  v18 = -[AKAuthorizationContinueButton initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AKAuthorizationContinueButton setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AKParentalApprovalRequestViewController _localizedButtonTitleString](self, "_localizedButtonTitleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationButton setButtonText:](v18, "setButtonText:", v6);

  -[AKAuthorizationButton addTarget:action:](v18, "addTarget:action:", self, sel__sendButtonSelected_);
  objc_msgSend(v4, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics continueButtonTopSpacing](AKAuthorizationPaneMetrics, "continueButtonTopSpacing");
  v9 = v8;
  objc_msgSend(v4, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrangedSubviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomSpacing:afterView:", v12, v9);

  objc_msgSend(v4, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addArrangedSubview:", v18);

  objc_msgSend(v4, "stackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics continueButtonBottomSpacing](AKAuthorizationPaneMetrics, "continueButtonBottomSpacing");
  objc_msgSend(v14, "setCustomSpacing:afterView:", v18);

  objc_msgSend(v4, "mutableConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAuthorizationContinueButton heightAnchor](v18, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics continueButtonHeight](AKAuthorizationPaneMetrics, "continueButtonHeight");
  objc_msgSend(v16, "constraintEqualToConstant:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v17);

}

- (void)_createIconViewWithIcon:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AKAuthorizationSubPaneImage *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  AKParentalApprovalRequestViewController *v33;
  void *v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CEABB0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addArrangedSubview:", v6);

  v33 = self;
  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics iconTopSpacing](AKAuthorizationPaneMetrics, "iconTopSpacing");
  v34 = v6;
  objc_msgSend(v10, "setCustomSpacing:afterView:", v6);

  objc_msgSend(v5, "automaskedImage");
  v11 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v11;
  v12 = -[AKAuthorizationSubPaneImage initWithImage:]([AKAuthorizationSubPaneImage alloc], "initWithImage:", v11);
  -[AKAuthorizationSubPaneImage image](v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  if (v14 == 0.0)
  {
    v20 = 1.0;
  }
  else
  {
    -[AKAuthorizationSubPaneImage image](v12, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16;
    -[AKAuthorizationSubPaneImage image](v12, "image");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "size");
    v20 = v17 / v19;

  }
  -[AKAuthorizationSubPaneImage imageView](v12, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics iconSize](AKAuthorizationPaneMetrics, "iconSize");
  objc_msgSend(v22, "constraintEqualToConstant:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v24;
  -[AKAuthorizationSubPaneImage imageView](v12, "imageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneImage imageView](v12, "imageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:multiplier:", v28, v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneImage setImageViewConstraints:](v12, "setImageViewConstraints:", v30);

  -[AKAuthorizationPaneViewController headerPaneContext](v33, "headerPaneContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubPane:", v12);

  +[AKAuthorizationPaneMetrics iconBottomSpacing](AKAuthorizationPaneMetrics, "iconBottomSpacing");
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v12, "setCustomSpacingAfter:");

}

- (id)_localizedTitleString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("APPROVAL_REQUEST_TITLE_MESSAGE"), &stru_1E7679C68, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_localizedDescriptionLabelString
{
  void *v3;
  uint64_t v4;
  _BOOL4 requestStatusPending;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  -[AKAuthorizationPresentationContext localizedAppName](self->_presentationContext, "localizedAppName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  requestStatusPending = self->_requestStatusPending;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (requestStatusPending)
      v9 = CFSTR("APPROVAL_REQUEST_PENDING_MESSAGE_FORMAT");
    else
      v9 = CFSTR("APPROVAL_REQUEST_MESSAGE_FORMAT");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E7679C68, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v12, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (requestStatusPending)
      v11 = CFSTR("APPROVAL_REQUEST_PENDING_MESSAGE");
    else
      v11 = CFSTR("APPROVAL_REQUEST_MESSAGE");
    objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E7679C68, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_localizedButtonTitleString
{
  _BOOL4 requestStatusPending;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  requestStatusPending = self->_requestStatusPending;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (requestStatusPending)
    v5 = CFSTR("APPROVAL_REQUEST_OK_BUTTON");
  else
    v5 = CFSTR("APPROVAL_REQUEST_BUTTON");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E7679C68, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_sendButtonSelected:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];

  _AKLogSiwa();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AKParentalApprovalRequestViewController _sendButtonSelected:].cold.1(v4);

  -[AKParentalApprovalRequestViewController _userResponse](self, "_userResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke;
  v6[3] = &unk_1E7678D40;
  v6[4] = self;
  -[AKParentalApprovalRequestViewController _paneDelegate_didRequestAuthorizationWithUserProvidedInformation:completion:](self, "_paneDelegate_didRequestAuthorizationWithUserProvidedInformation:completion:", v5, v6);

}

void __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke_2;
    block[3] = &unk_1E7678D18;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke_3;
    v6[3] = &unk_1E76789A0;
    v6[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }

}

uint64_t __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthorizationError:", *(_QWORD *)(a1 + 40));
}

uint64_t __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", 0, 0);
}

- (void)_handleAuthorizationError:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "ak_isUserCancelError");
  -[AKParentalApprovalRequestViewController _paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:](self, "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", 0, v4);

}

- (id)_userResponse
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D00188]);
  objc_msgSend(v2, "setRequestParentalPermission:", 1);
  return v2;
}

- (void)_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[AKAuthorizationPaneViewController paneDelegate](self, "paneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "authorizationPaneViewController:dismissWithAuthorization:error:", self, v8, v6);

}

- (void)_paneDelegate_didRequestAuthorizationWithUserProvidedInformation:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[AKAuthorizationPaneViewController paneDelegate](self, "paneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "authorizationPaneViewController:didRequestAuthorizationWithUserProvidedInformation:completion:", self, v8, v6);

}

- (AKAuthorizationViewController)authorizationViewController
{
  return (AKAuthorizationViewController *)objc_loadWeakRetained((id *)&self->_authorizationViewController);
}

- (void)setAuthorizationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_authorizationViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_authorizationViewController);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
}

- (void)_sendButtonSelected:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD795000, log, OS_LOG_TYPE_DEBUG, "User requested parental permission", v1, 2u);
}

@end
