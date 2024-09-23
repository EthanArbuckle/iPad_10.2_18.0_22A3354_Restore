@implementation ASPasswordAuthenticationPaneViewController

- (ASPasswordAuthenticationPaneViewController)initWithPersona:(unint64_t)a3 presentationContext:(id)a4
{
  id v7;
  ASPasswordAuthenticationPaneViewController *v8;
  ASPasswordAuthenticationPaneViewController *v9;
  ASPasswordAuthenticationPaneViewController *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASPasswordAuthenticationPaneViewController;
  v8 = -[ASCredentialRequestPaneViewController initRequiringTableView:](&v12, sel_initRequiringTableView_, 0);
  v9 = v8;
  if (v8)
  {
    v8->_persona = a3;
    objc_storeStrong((id *)&v8->_presentationContext, a4);
    v10 = v9;
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASPasswordAuthenticationPaneViewController;
  -[ASCredentialRequestPaneViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[ASPasswordAuthenticationPaneViewController _createViews](self, "_createViews");
  -[ASPasswordAuthenticationPaneViewController _setConstraints](self, "_setConstraints");
  -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x24BEBE580], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x24BEBE578], 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASPasswordAuthenticationPaneViewController;
  -[ASPasswordAuthenticationPaneViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (self->_didForceSoftwareKeyboardOn)
  {
    self->_didForceSoftwareKeyboardOn = 0;
    objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hardwareKeyboardAvailabilityChanged");

  }
}

- (void)_createViews
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  UILabel **p_titleLabel;
  unint64_t persona;
  _ASInsetTextField *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UITextField **p_secureTextField;
  ASCredentialRequestButtonContinue *v22;
  double v23;
  unint64_t v24;
  void *v25;
  void *v26;
  ASCredentialRequestButtonContinue **p_signInButton;
  void *v28;
  void *v29;
  unint64_t v30;
  double v31;
  int *v32;
  double v33;
  uint64_t v34;
  void *v35;
  id obj;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASPasswordAuthenticationPaneViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x24BEBD708]);
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  obj = (id)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
  objc_msgSend(obj, "setNumberOfLines:", 0);
  objc_msgSend(obj, "setTextAlignment:", 1);
  -[ASPasswordAuthenticationPaneViewController _titleLabelText](self, "_titleLabelText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setText:", v10);

  LODWORD(v11) = 1148846080;
  objc_msgSend(obj, "setContentCompressionResistancePriority:forAxis:", 1, v11);
  objc_msgSend(obj, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ASPasswordAuthenticationPaneViewController _titleLabelFont](self, "_titleLabelFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setFont:", v12);

  -[ASPasswordAuthenticationPaneViewController _titleLabelTextColor](self, "_titleLabelTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setTextColor:", v13);

  p_titleLabel = &self->_titleLabel;
  objc_storeStrong((id *)&self->_titleLabel, obj);
  persona = self->_persona;
  if (persona == 1)
  {
    -[ASPasswordAuthenticationPaneViewController _setUpUsernameLabel](self, "_setUpUsernameLabel");
  }
  else if (!persona)
  {
    -[ASPasswordAuthenticationPaneViewController _setUpSubtitleLabel](self, "_setUpSubtitleLabel");
  }
  v16 = -[_ASInsetTextField initWithFrame:]([_ASInsetTextField alloc], "initWithFrame:", v6, v7, v8, v9);
  -[_ASInsetTextField setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 0.15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASInsetTextField setBackgroundColor:](v16, "setBackgroundColor:", v17);

  -[_ASInsetTextField layer](v16, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", 8.0);

  -[ASPasswordAuthenticationPaneViewController _secureTextFieldPlaceholderText](self, "_secureTextFieldPlaceholderText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASInsetTextField setPlaceholder:](v16, "setPlaceholder:", v19);

  -[_ASInsetTextField setSecureTextEntry:](v16, "setSecureTextEntry:", 1);
  -[_ASInsetTextField setReturnKeyType:](v16, "setReturnKeyType:", 9);
  -[_ASInsetTextField setEnablesReturnKeyAutomatically:](v16, "setEnablesReturnKeyAutomatically:", 1);
  -[_ASInsetTextField setTextContentType:](v16, "setTextContentType:", *MEMORY[0x24BEBE810]);
  -[_ASInsetTextField setDelegate:](v16, "setDelegate:", self);
  +[ASViewServiceInterfaceUtilities headerMessageFont](ASViewServiceInterfaceUtilities, "headerMessageFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASInsetTextField setFont:](v16, "setFont:", v20);

  if (self->_persona == 1)
    -[_ASInsetTextField addTarget:action:forControlEvents:](v16, "addTarget:action:forControlEvents:", self, sel__textFieldChanged_, 0x20000);
  p_secureTextField = &self->_secureTextField;
  objc_storeStrong((id *)&self->_secureTextField, v16);
  v22 = -[ASCredentialRequestButtonContinue initWithFrame:]([ASCredentialRequestButtonContinue alloc], "initWithFrame:", v6, v7, v8, v9);
  -[ASCredentialRequestButtonContinue setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ASCredentialRequestButton addTarget:action:](v22, "addTarget:action:", self, sel__signInButtonTapped);
  v24 = self->_persona;
  if (v24 == 1)
  {
    _WBSLocalizedString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestButton setButtonText:](v22, "setButtonText:", v26);

    -[ASCredentialRequestButtonContinue setEnabled:](v22, "setEnabled:", 0);
  }
  else if (!v24)
  {
    _WBSLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestButton setButtonText:](v22, "setButtonText:", v25);

  }
  LODWORD(v23) = 1148846080;
  -[ASCredentialRequestButtonContinue setContentCompressionResistancePriority:forAxis:](v22, "setContentCompressionResistancePriority:forAxis:", 0, v23);
  p_signInButton = &self->_signInButton;
  objc_storeStrong((id *)&self->_signInButton, v22);
  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASPasswordAuthenticationPaneViewController _topViewMargin](self, "_topViewMargin");
  objc_msgSend(v29, "addEmptyViewWithSpacing:");

  -[ASPasswordAuthenticationPaneViewController _setUpAndAddIconImage](self, "_setUpAndAddIconImage");
  objc_msgSend(v28, "addArrangedSubview:", *p_titleLabel);
  v30 = self->_persona;
  if (!v30)
  {
    v31 = 19.0;
    v32 = &OBJC_IVAR___ASPasswordAuthenticationPaneViewController__subtitleLabel;
    v33 = 10.0;
    goto LABEL_15;
  }
  if (v30 == 1)
  {
    v31 = 8.0;
    v32 = &OBJC_IVAR___ASPasswordAuthenticationPaneViewController__usernameField;
    v33 = 19.0;
LABEL_15:
    objc_msgSend(v28, "setCustomSpacing:afterView:", *p_titleLabel, v33);
    v34 = *v32;
    objc_msgSend(v28, "addArrangedSubview:", *(Class *)((char *)&self->super.super.super.super.isa + v34));
    objc_msgSend(v28, "setCustomSpacing:afterView:", *(Class *)((char *)&self->super.super.super.super.isa + v34), v31);
  }
  objc_msgSend(v28, "addArrangedSubview:", *p_secureTextField);
  objc_msgSend(v28, "setCustomSpacing:afterView:", *p_secureTextField, 30.0);
  objc_msgSend(v28, "addArrangedSubview:", *p_signInButton);
  objc_msgSend(v28, "setCustomSpacing:afterView:", *p_signInButton, 32.0);
  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addEmptyViewWithSpacing:", 0.0);

}

- (void)_setConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *paneHeaderStackViewBottomKeyboardConstraint;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  void *v24;
  unint64_t persona;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
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
  _QWORD v42[2];
  _QWORD v43[6];

  v43[5] = *MEMORY[0x24BDAC8D0];
  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASPasswordAuthenticationPaneViewController _containerViewHorizontalMargin](self, "_containerViewHorizontalMargin");
  v5 = v4;
  -[ASPasswordAuthenticationPaneViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintGreaterThanOrEqualToAnchor:", v10);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  paneHeaderStackViewBottomKeyboardConstraint = self->_paneHeaderStackViewBottomKeyboardConstraint;
  self->_paneHeaderStackViewBottomKeyboardConstraint = v11;

  LODWORD(v13) = 1144766464;
  -[NSLayoutConstraint setPriority:](self->_paneHeaderStackViewBottomKeyboardConstraint, "setPriority:", v13);
  v37 = (void *)MEMORY[0x24BDD1628];
  -[UILabel widthAnchor](self->_titleLabel, "widthAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5 * -2.0;
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, v14);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v38;
  -[UITextField widthAnchor](self->_secureTextField, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v3;
  objc_msgSend(v3, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASPasswordAuthenticationPaneViewController _secureTextFieldInsetMargin](self, "_secureTextFieldInsetMargin");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, v17 * -2.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v18;
  -[UITextField heightAnchor](self->_secureTextField, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintGreaterThanOrEqualToConstant:", 32.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v20;
  -[ASCredentialRequestButtonContinue heightAnchor](self->_signInButton, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 36.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self->_paneHeaderStackViewBottomKeyboardConstraint;
  v43[3] = v22;
  v43[4] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v24);

  persona = self->_persona;
  if (!persona)
  {
    v35 = (void *)MEMORY[0x24BDD1628];
    -[UILabel widthAnchor](self->_subtitleLabel, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v36;
    objc_msgSend(v36, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v32);
    goto LABEL_5;
  }
  v26 = v36;
  if (persona == 1)
  {
    v27 = (void *)MEMORY[0x24BDD1628];
    -[UITextField widthAnchor](self->_usernameField, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASPasswordAuthenticationPaneViewController _secureTextFieldInsetMargin](self, "_secureTextFieldInsetMargin");
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v30 * -2.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v31;
    -[UITextField heightAnchor](self->_usernameField, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintGreaterThanOrEqualToConstant:", 32.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v34);

LABEL_5:
  }

}

- (void)_setUpAndAddIconImage
{
  void *v3;
  ASCredentialRequestImageSubPane *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  if (!self->_persona)
  {
    if (-[ASCAuthorizationPresentationContext useAlternativeSecurityKeysIcon](self->_presentationContext, "useAlternativeSecurityKeysIcon"))
    {
      +[ASCredentialRequestIconGenerator alternativeSecurityKeysIcon](ASCredentialRequestIconGenerator, "alternativeSecurityKeysIcon");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = 1;
    }
    else
    {
      +[ASCredentialRequestIconGenerator systemSecurityKeysIcon](ASCredentialRequestIconGenerator, "systemSecurityKeysIcon");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = 2;
    }
    v10 = (id)v5;
    v4 = -[ASCredentialRequestImageSubPane initWithImage:imageStyle:]([ASCredentialRequestImageSubPane alloc], "initWithImage:imageStyle:", v5, v6);
    -[ASCredentialRequestSubPane view](v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1148846080;
    objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v8);

    goto LABEL_8;
  }
  +[ASCredentialRequestIconGenerator headerIconForPresentationContext:](ASCredentialRequestIconGenerator, "headerIconForPresentationContext:", self->_presentationContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = v3;
    v4 = -[ASCredentialRequestImageSubPane initWithImage:]([ASCredentialRequestImageSubPane alloc], "initWithImage:", v3);
LABEL_8:
    -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubPane:withCustomSpacingAfter:", v4, 10.0);

    v3 = v10;
  }

}

- (void)_setUpSubtitleLabel
{
  id v3;
  UILabel *v4;
  double v5;
  void *v6;
  void *v7;
  UILabel *subtitleLabel;
  id v9;

  _WBSLocalizedString();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BEBD708]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
  -[UILabel setText:](v4, "setText:", v9);
  LODWORD(v5) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ASPasswordAuthenticationPaneViewController _subtitleLabelFont](self, "_subtitleLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v4, "setFont:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v4, "setTextColor:", v7);

  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v4;

}

- (void)_setUpUsernameLabel
{
  _ASInsetTextField *v3;
  UITextField *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UITextField *usernameField;

  v3 = [_ASInsetTextField alloc];
  v4 = -[_ASInsetTextField initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 0.15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setBackgroundColor:](v4, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD5E0], "defaultFontForTextStyle:", *MEMORY[0x24BEBE218]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](v4, "setFont:", v6);

  -[UITextField layer](v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 8.0);

  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](v4, "setPlaceholder:", v8);

  -[UITextField setReturnKeyType:](v4, "setReturnKeyType:", 4);
  -[UITextField setEnablesReturnKeyAutomatically:](v4, "setEnablesReturnKeyAutomatically:", 1);
  -[UITextField setTextContentType:](v4, "setTextContentType:", *MEMORY[0x24BEBE848]);
  -[UITextField setDelegate:](v4, "setDelegate:", self);
  -[UITextField addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__textFieldChanged_, 0x20000);
  usernameField = self->_usernameField;
  self->_usernameField = v4;

}

- (id)_titleLabelText
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t persona;

  -[ASCAuthorizationPresentationContext overrideTitle](self->_presentationContext, "overrideTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[ASCAuthorizationPresentationContext overrideTitle](self->_presentationContext, "overrideTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    persona = self->_persona;
    if (persona == 1)
    {
      -[ASPasswordAuthenticationPaneViewController _manualPasswordEntryTitleLabelText](self, "_manualPasswordEntryTitleLabelText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (!persona)
    {
      -[ASPasswordAuthenticationPaneViewController _securityKeyTitleLabelText](self, "_securityKeyTitleLabelText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (id)_securityKeyTitleLabelText
{
  return +[ASCredentialRequestSecurityKeyStringUtilities titleWithPresentationContext:](ASCredentialRequestSecurityKeyStringUtilities, "titleWithPresentationContext:", self->_presentationContext);
}

- (id)_manualPasswordEntryTitleLabelText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](self->_presentationContext, "proxiedOriginDeviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](self->_presentationContext, "proxiedOriginDeviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_secureTextFieldPlaceholderText
{
  if (self->_persona <= 1)
  {
    _WBSLocalizedString();
    self = (ASPasswordAuthenticationPaneViewController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (double)_topViewMargin
{
  return 10.0;
}

- (double)_containerViewHorizontalMargin
{
  int v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x24BE0B290], "isPad");
  result = 32.0;
  if (v2)
    return 128.0;
  return result;
}

- (double)_signInButtonInsetMargin
{
  double v2;

  -[ASPasswordAuthenticationPaneViewController _containerViewHorizontalMargin](self, "_containerViewHorizontalMargin");
  return v2 + 90.0;
}

- (double)_secureTextFieldInsetMargin
{
  double v2;

  -[ASPasswordAuthenticationPaneViewController _containerViewHorizontalMargin](self, "_containerViewHorizontalMargin");
  return v2 + 13.0;
}

- (id)_titleLabelFont
{
  unint64_t persona;

  persona = self->_persona;
  if (persona == 1)
  {
    +[ASViewServiceInterfaceUtilities headerTitleFont](ASViewServiceInterfaceUtilities, "headerTitleFont");
    self = (ASPasswordAuthenticationPaneViewController *)objc_claimAutoreleasedReturnValue();
  }
  else if (!persona)
  {
    objc_msgSend(MEMORY[0x24BEBD5E0], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE248], *MEMORY[0x24BEBE258]);
    self = (ASPasswordAuthenticationPaneViewController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_titleLabelTextColor
{
  unint64_t persona;

  persona = self->_persona;
  if (persona == 1)
  {
    +[ASViewServiceInterfaceUtilities headerTitleColor](ASViewServiceInterfaceUtilities, "headerTitleColor");
    self = (ASPasswordAuthenticationPaneViewController *)objc_claimAutoreleasedReturnValue();
  }
  else if (!persona)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    self = (ASPasswordAuthenticationPaneViewController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_subtitleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
}

- (void)_signInButtonTapped
{
  id WeakRetained;
  id v4;

  if (self->_persona == 1)
  {
    -[ASPasswordAuthenticationPaneViewController _completeManualPasswordCredentialEntry](self, "_completeManualPasswordCredentialEntry");
  }
  else
  {
    -[UITextField text](self->_secureTextField, "text");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationDelegate);
    objc_msgSend(WeakRetained, "passwordAuthenticationViewController:completedWithUserEnteredPIN:", self, v4);

  }
}

- (double)_intrinsicContentHeight
{
  void *v3;
  CGFloat Width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v10;

  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v10);
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1112014848;
  objc_msgSend(v3, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v5, v6);
  v8 = v7 + 0.0 + self->_keyboardHeight;

  return v8;
}

- (void)_textFieldChanged:(id)a3
{
  void *v4;
  id v5;

  -[UITextField text](self->_secureTextField, "text", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[UITextField text](self->_usernameField, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestButtonContinue setEnabled:](self->_signInButton, "setEnabled:", objc_msgSend(v4, "length") != 0);

  }
  else
  {
    -[ASCredentialRequestButtonContinue setEnabled:](self->_signInButton, "setEnabled:", 0);
  }

}

- (void)_completeManualPasswordCredentialEntry
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;

  -[UITextField setEnabled:](self->_usernameField, "setEnabled:", 0);
  -[UITextField setEnabled:](self->_secureTextField, "setEnabled:", 0);
  -[ASCAuthorizationPresentationContext proxiedAssociatedDomains](self->_presentationContext, "proxiedAssociatedDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_24C955390;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v8 = objc_alloc(MEMORY[0x24BE0B228]);
  -[UITextField text](self->_usernameField, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField text](self->_secureTextField, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v8, "initWithUser:password:site:creationDate:externalProviderBundleIdentifier:", v9, v10, v7, v11, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationDelegate);
  objc_msgSend(WeakRetained, "passwordAuthenticationViewController:completedWithManuallyEnteredPasswordCredential:", self, v13);

}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  id v5;
  CGRect v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBE468]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "CGRectValue");
  self->_keyboardHeight = CGRectGetHeight(v6);
  -[ASPasswordAuthenticationPaneViewController _keyboardHeightDidChange](self, "_keyboardHeightDidChange");

}

- (void)_keyboardWillHide:(id)a3
{
  self->_keyboardHeight = 0.0;
  -[ASPasswordAuthenticationPaneViewController _keyboardHeightDidChange](self, "_keyboardHeightDidChange", a3);
}

- (void)_keyboardHeightDidChange
{
  -[NSLayoutConstraint setConstant:](self->_paneHeaderStackViewBottomKeyboardConstraint, "setConstant:", self->_keyboardHeight);
  -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
}

- (BOOL)becomeFirstResponder
{
  char v2;
  unint64_t persona;
  void *v5;

  persona = self->_persona;
  if (persona == 1)
    return -[UITextField becomeFirstResponder](self->_usernameField, "becomeFirstResponder");
  if (!persona)
  {
    if (-[UITextField becomeFirstResponder](self->_secureTextField, "becomeFirstResponder"))
    {
      v2 = 1;
      if ((UIKeyboardAutomaticIsOnScreen() & 1) == 0)
      {
        self->_didForceSoftwareKeyboardOn = 1;
        objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ejectKeyDown");

      }
    }
    else
    {
      v2 = 0;
    }
  }
  return v2 & 1;
}

- (BOOL)resignFirstResponder
{
  unsigned __int8 v2;
  unint64_t persona;
  objc_super v5;

  v2 = 40;
  persona = self->_persona;
  if (persona == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)ASPasswordAuthenticationPaneViewController;
    v2 = -[ASPasswordAuthenticationPaneViewController resignFirstResponder](&v5, sel_resignFirstResponder);
  }
  else if (!persona)
  {
    return -[UITextField resignFirstResponder](self->_secureTextField, "resignFirstResponder");
  }
  return v2 & 1;
}

- (BOOL)canBecomeFirstResponder
{
  unint64_t persona;
  int *v3;

  persona = self->_persona;
  if (!persona)
  {
    v3 = &OBJC_IVAR___ASPasswordAuthenticationPaneViewController__secureTextField;
    return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v3), "canBecomeFirstResponder");
  }
  if (persona == 1)
  {
    v3 = &OBJC_IVAR___ASPasswordAuthenticationPaneViewController__usernameField;
    return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v3), "canBecomeFirstResponder");
  }
  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (self->_usernameField == a3)
    -[UITextField becomeFirstResponder](self->_secureTextField, "becomeFirstResponder");
  else
    -[ASPasswordAuthenticationPaneViewController _signInButtonTapped](self, "_signInButtonTapped");
  return 0;
}

- (ASPasswordAuthenticationPaneViewControllerDelegate)authenticationDelegate
{
  return (ASPasswordAuthenticationPaneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_authenticationDelegate);
}

- (void)setAuthenticationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_authenticationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_authenticationDelegate);
  objc_storeStrong((id *)&self->_paneHeaderStackViewBottomKeyboardConstraint, 0);
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_storeStrong((id *)&self->_secureTextField, 0);
  objc_storeStrong((id *)&self->_usernameField, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
}

@end
