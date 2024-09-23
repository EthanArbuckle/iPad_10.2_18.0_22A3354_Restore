@implementation ASCredentialRequestCABLEConsentViewController

- (ASCredentialRequestCABLEConsentViewController)initWithPresentationContext:(id)a3
{
  id v5;
  id *v6;
  ASCredentialRequestCABLEConsentViewController *v7;
  ASCredentialRequestCABLEConsentViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCredentialRequestCABLEConsentViewController;
  v6 = -[ASCredentialRequestPaneViewController initRequiringTableView:](&v10, sel_initRequiringTableView_, 1);
  v7 = (ASCredentialRequestCABLEConsentViewController *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 131, a3);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCredentialRequestCABLEConsentViewController;
  -[ASCredentialRequestPaneViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[ASCredentialRequestPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeparatorStyle:", 0);

  -[ASCredentialRequestPaneViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);

  -[ASCredentialRequestCABLEConsentViewController _addHeaderSpacerViewWithCustomSpacingAfter:](self, "_addHeaderSpacerViewWithCustomSpacingAfter:", 24.0);
  -[ASCredentialRequestCABLEConsentViewController _setUpIconView](self, "_setUpIconView");
  -[ASCredentialRequestCABLEConsentViewController _setUpTitleView](self, "_setUpTitleView");
  -[ASCredentialRequestCABLEConsentViewController _addHeaderSpacerViewWithCustomSpacingAfter:](self, "_addHeaderSpacerViewWithCustomSpacingAfter:", 0.0);
  -[ASCredentialRequestCABLEConsentViewController _setUpContinueButton](self, "_setUpContinueButton");
  -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
}

- (int64_t)numberOfTableRows
{
  return 0;
}

- (void)_setUpIconView
{
  ASCredentialRequestImageSubPane *v3;
  void *v4;
  id v5;

  +[ASCredentialRequestIconGenerator passwordManagerIcon](ASCredentialRequestIconGenerator, "passwordManagerIcon");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[ASCredentialRequestImageSubPane initWithImage:]([ASCredentialRequestImageSubPane alloc], "initWithImage:", v5);
  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubPane:withCustomSpacingAfter:", v3, 24.0);

}

- (void)_setUpTitleView
{
  ASCredentialRequestInfoLabelSubPane *v3;
  void *v4;
  void *v5;
  ASCredentialRequestInfoLabelSubPane *v6;

  v3 = [ASCredentialRequestInfoLabelSubPane alloc];
  -[ASCredentialRequestCABLEConsentViewController _titleText](self, "_titleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASCredentialRequestInfoLabelSubPane initWithString:labelType:](v3, "initWithString:labelType:", v4, 1);

  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubPane:withCustomSpacingAfter:", v6, 40.0);

}

- (void)_setUpContinueButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ASCredentialRequestButtonContinue *v7;

  v7 = objc_alloc_init(ASCredentialRequestButtonContinue);
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestButton setButtonText:](v7, "setButtonText:", v3);

  -[ASCredentialRequestButton addTarget:action:](v7, "addTarget:action:", self, sel__continueButtonPressed);
  -[ASCredentialRequestPaneViewController paneFooterStackView](self, "paneFooterStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArrangedSubview:", v7);

  -[ASCredentialRequestButtonContinue heightAnchor](v7, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASViewServiceInterfaceUtilities continueButtonHeight](ASViewServiceInterfaceUtilities, "continueButtonHeight");
  objc_msgSend(v5, "constraintEqualToConstant:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

}

- (void)_addHeaderSpacerViewWithCustomSpacingAfter:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addArrangedSubview:", v9);

  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCustomSpacing:afterView:", v9, a3);

  objc_msgSend(v9, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

}

- (void)_continueButtonPressed
{
  id v3;

  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestPaneViewControllerStartCABLEAuthentication:", self);

}

- (id)_titleText
{
  void *v2;

  -[ASCAuthorizationPresentationContext _passkeyURLType](self->_presentationContext, "_passkeyURLType");
  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");

  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ASCAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);
}

@end
