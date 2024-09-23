@implementation AKModalSignInViewController

- (AKModalSignInViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKModalSignInViewController;
  return (AKModalSignInViewController *)-[AKBaseSignInViewController _initWithAuthController:](&v3, sel__initWithAuthController_, 0);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKModalSignInViewController;
  -[AKModalSignInViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[AKModalSignInViewController _setupViews](self, "_setupViews");
  -[AKModalSignInViewController _setupConstraints](self, "_setupConstraints");
  -[AKBaseSignInViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlertDelegate:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKModalSignInViewController;
  -[AKBaseSignInViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (!-[AKModalSignInViewController _shouldHidePasswordField](self, "_shouldHidePasswordField"))
  {
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKModalSignInViewController;
  -[AKModalSignInViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AKModalSignInViewController _beginObservingTextFieldDidChangeNotifications](self, "_beginObservingTextFieldDidChangeNotifications");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKModalSignInViewController;
  -[AKModalSignInViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (!-[AKModalSignInViewController _shouldHidePasswordField](self, "_shouldHidePasswordField"))
  {
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resignFirstResponder");

  }
  -[AKModalSignInViewController _endObservingTextFieldDidChangeNotifications](self, "_endObservingTextFieldDidChangeNotifications");
}

- (void)dealloc
{
  objc_super v3;

  -[AKModalSignInViewController _endObservingTextFieldDidChangeNotifications](self, "_endObservingTextFieldDidChangeNotifications");
  v3.receiver = self;
  v3.super_class = (Class)AKModalSignInViewController;
  -[AKBaseSignInViewController dealloc](&v3, sel_dealloc);
}

- (void)_setupViews
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
  id v14;

  -[AKModalSignInViewController _createViews](self, "_createViews");
  -[AKModalSignInViewController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[AKModalSignInViewController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[AKModalSignInViewController containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[AKModalSignInViewController containerView](self, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController signInButton](self, "signInButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[AKModalSignInViewController containerView](self, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController iForgotButton](self, "iForgotButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[AKModalSignInViewController view](self, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController containerView](self, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v13);

}

- (void)_createViews
{
  UIColor *backgroundColor;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 hideTitle;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _AKInsetTextField *v30;
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
  uint64_t v43;
  void *v44;
  _BOOL8 v45;
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
  _BOOL8 v65;
  void *v66;
  void *v67;
  id v68;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    -[AKModalSignInViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", backgroundColor);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
  v6 = objc_alloc(MEMORY[0x1E0CEA700]);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
  -[AKModalSignInViewController setTitleLabel:](self, "setTitleLabel:", v11);

  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextAlignment:", 1);

  -[AKBaseSignInViewController context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serviceType");
  AKSignInStringFromServiceType();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB538], 32770, 0);
  v68 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v68, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  hideTitle = self->_hideTitle;
  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", hideTitle);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v7, v8, v9, v10);
  -[AKModalSignInViewController setBodyLabel:](self, "setBodyLabel:", v21);

  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberOfLines:", 0);

  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextAlignment:", 1);

  v24 = *MEMORY[0x1E0CEB588];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "defaultFontForTextStyle:", *MEMORY[0x1E0CEB588]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFont:", v25);

  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAdjustsFontForContentSizeCategory:", 1);

  -[AKModalSignInViewController _bodyText](self, "_bodyText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v28);

  v30 = -[_AKInsetTextField initWithFrame:]([_AKInsetTextField alloc], "initWithFrame:", v7, v8, v9, v10);
  -[AKModalSignInViewController setPasswordField:](self, "setPasswordField:", v30);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0156862754, 0.0156862754, 0.0588235296, 0.150000006);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setBackgroundColor:", v31);

  -[AKModalSignInViewController passwordField](self, "passwordField");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDelegate:", self);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "defaultFontForTextStyle:", v24);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFont:", v34);

  -[AKModalSignInViewController passwordField](self, "passwordField");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setCornerRadius:", 12.0);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("CAPITALIZED_PASSWORD"), &stru_1E7679C68, CFSTR("Localizable"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setPlaceholder:", v39);

  -[AKModalSignInViewController passwordField](self, "passwordField");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setSecureTextEntry:", 1);

  -[AKModalSignInViewController passwordField](self, "passwordField");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setReturnKeyType:", 0);

  v43 = *MEMORY[0x1E0CEBCD0];
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setTextContentType:", v43);

  v45 = -[AKModalSignInViewController _shouldHidePasswordField](self, "_shouldHidePasswordField");
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setHidden:", v45);

  +[AKRoundedButton roundedButton](AKRoundedButton, "roundedButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController setSignInButton:](self, "setSignInButton:", v47);

  -[AKModalSignInViewController signInButton](self, "signInButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addTarget:action:forControlEvents:", self, sel__signInButtonTapped_, 64);

  -[AKModalSignInViewController signInButton](self, "signInButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController _buttonTitle](self, "_buttonTitle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setTitle:forState:", v50, 0);

  -[AKModalSignInViewController signInButton](self, "signInButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setEnabled:", 0);

  -[AKModalSignInViewController signInButton](self, "signInButton");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "ak_imageWithColor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setBackgroundImage:forState:", v55, 0);

  -[AKModalSignInViewController signInButton](self, "signInButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "ak_imageWithColor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setBackgroundImage:forState:", v59, 2);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController setIForgotButton:](self, "setIForgotButton:", v60);

  -[AKModalSignInViewController iForgotButton](self, "iForgotButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addTarget:action:forControlEvents:", self, sel__passwordRecoveryButtonWasTapped_, 64);

  -[AKModalSignInViewController iForgotButton](self, "iForgotButton");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD"), &stru_1E7679C68, CFSTR("Localizable"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setTitle:forState:", v64, 0);

  v65 = -[AKModalSignInViewController _shouldHidePasswordField](self, "_shouldHidePasswordField");
  -[AKModalSignInViewController iForgotButton](self, "iForgotButton");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setHidden:", v65);

  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v7, v8, v9, v10);
  -[AKModalSignInViewController setContainerView:](self, "setContainerView:", v67);

}

- (void)_beginObservingTextFieldDidChangeNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__textFieldDidChange_, *MEMORY[0x1E0CEBD20], 0);

}

- (void)_endObservingTextFieldDidChangeNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBD20], 0);

}

- (void)_textFieldDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v9;
  if (v9 == v4)
  {
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") != 0;

    -[AKModalSignInViewController _updateSignInButtonEnabled:](self, "_updateSignInButtonEnabled:", v8);
    v5 = v9;
  }

}

- (void)_updateSignInButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  -[AKModalSignInViewController signInButton](self, "signInButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");

  if (v6 != v3)
  {
    -[AKModalSignInViewController signInButton](self, "signInButton");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", v3);

  }
}

- (id)_bodyText
{
  NSString *customBodyText;
  NSString *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[16];

  customBodyText = self->_customBodyText;
  if (customBodyText)
  {
    v4 = customBodyText;
  }
  else
  {
    -[AKBaseSignInViewController context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_interpolatedReason");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  if (!-[NSString length](v4, "length"))
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Context interpolated reason was not providing, falling back to default strings...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isMultiUserMode");

    if (v8)
    {
      -[AKBaseSignInViewController context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serviceType");
      AKSharedDevicePasscodePromptAlertMessageWithServiceType();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[AKModalSignInViewController _isUsingPasscodeAuth](self, "_isUsingPasscodeAuth"))
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DEFAULT_PLACEHOLDER_AUTHENTICATION_REASON"), &stru_1E7679C68, CFSTR("Localizable"));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D002B8];
        -[AKBaseSignInViewController context](self, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "username");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "formattedUsernameFromUsername:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v13, v17);
        v11 = objc_claimAutoreleasedReturnValue();

        v4 = (NSString *)v13;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PASSCODE_AUTHENTICATION_REASON"), &stru_1E7679C68, CFSTR("Localizable"));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
LABEL_13:

    v4 = (NSString *)v11;
  }
  return v4;
}

- (id)_buttonTitle
{
  void *v3;
  void *v4;
  const __CFString *v5;
  NSString *customButtonTitle;
  NSString *v7;

  if (-[AKModalSignInViewController _isUsingPasscodeAuth](self, "_isUsingPasscodeAuth"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CONTINUE_WITH_PASSCODE");
LABEL_6:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E7679C68, CFSTR("Localizable"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  customButtonTitle = self->_customButtonTitle;
  if (!customButtonTitle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SIGN_IN");
    goto LABEL_6;
  }
  v7 = customButtonTitle;
  return v7;
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  uint64_t v22;
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
  uint64_t v94;
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
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  _QWORD v135[8];
  _QWORD v136[2];
  _QWORD v137[15];

  v137[13] = *MEMORY[0x1E0C80C00];
  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKModalSignInViewController passwordField](self, "passwordField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKModalSignInViewController signInButton](self, "signInButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKModalSignInViewController iForgotButton](self, "iForgotButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKModalSignInViewController containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v12 = (void *)MEMORY[0x1E0CB3718];
    -[AKModalSignInViewController containerView](self, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 10, 0, v14, 10, 1.0, 0.0);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AKModalSignInViewController containerView](self, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v17, 0.0);
    v15 = objc_claimAutoreleasedReturnValue();

  }
  v133 = (void *)v15;
  objc_msgSend(v9, "addObject:", v15);
  -[AKModalSignInViewController containerView](self, "containerView");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v18;
  -[AKModalSignInViewController view](self, "view");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "leadingAnchor");
  v19 = objc_claimAutoreleasedReturnValue();
  v123 = (void *)v19;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v125, "userInterfaceIdiom") == 1)
    v20 = 128.0;
  else
    v20 = 32.0;
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v20);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v121;
  -[AKModalSignInViewController containerView](self, "containerView");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v21;
  -[AKModalSignInViewController view](self, "view");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "trailingAnchor");
  v22 = objc_claimAutoreleasedReturnValue();
  v111 = (void *)v22;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v113, "userInterfaceIdiom") == 1)
    v23 = 128.0;
  else
    v23 = 32.0;
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -v23);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v109;
  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "firstBaselineAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController containerView](self, "containerView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "topAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:constant:", v101, 39.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v137[2] = v99;
  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "leadingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController containerView](self, "containerView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v91);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v137[3] = v89;
  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController containerView](self, "containerView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v81);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v137[4] = v79;
  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "heightAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintGreaterThanOrEqualToConstant:", 17.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v137[5] = v74;
  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "firstBaselineAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController titleLabel](self, "titleLabel");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "lastBaselineAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 24.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v137[6] = v69;
  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController containerView](self, "containerView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v137[7] = v64;
  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController containerView](self, "containerView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v137[8] = v59;
  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "heightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintGreaterThanOrEqualToConstant:", 56.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v137[9] = v56;
  -[AKModalSignInViewController signInButton](self, "signInButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "centerXAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController containerView](self, "containerView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "centerXAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v137[10] = v24;
  -[AKModalSignInViewController signInButton](self, "signInButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:", 44.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v137[11] = v27;
  -[AKModalSignInViewController containerView](self, "containerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintGreaterThanOrEqualToConstant:", 220.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v137[12] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v9;
  objc_msgSend(v9, "addObjectsFromArray:", v31);

  if (-[AKModalSignInViewController _shouldHidePasswordField](self, "_shouldHidePasswordField"))
  {
    -[AKModalSignInViewController signInButton](self, "signInButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastBaselineAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, 20.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v136[0] = v36;
    -[AKModalSignInViewController containerView](self, "containerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, -20.0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v136[1] = v132;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 2);
    v41 = v134;
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "addObjectsFromArray:");
  }
  else
  {
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "topAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "lastBaselineAnchor");
    v112 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:constant:", v112, 20.0);
    v120 = objc_claimAutoreleasedReturnValue();
    v135[0] = v120;
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "leadingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController containerView](self, "containerView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "leadingAnchor");
    v94 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:constant:", v94, 20.0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v135[1] = v132;
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "trailingAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController containerView](self, "containerView");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "trailingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintEqualToAnchor:constant:", v122, -20.0);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v135[2] = v116;
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "heightAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToConstant:", 44.0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v135[3] = v104;
    -[AKModalSignInViewController signInButton](self, "signInButton");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "topAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "bottomAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:constant:", v90, 20.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v135[4] = v88;
    -[AKModalSignInViewController iForgotButton](self, "iForgotButton");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController signInButton](self, "signInButton");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "bottomAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:constant:", v80, 16.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v135[5] = v78;
    -[AKModalSignInViewController iForgotButton](self, "iForgotButton");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController containerView](self, "containerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v135[6] = v45;
    -[AKModalSignInViewController iForgotButton](self, "iForgotButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController containerView](self, "containerView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, -17.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v135[7] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 8);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "addObjectsFromArray:", v51);

    v40 = (void *)v94;
    v34 = v110;

    v38 = v98;
    v39 = v102;

    v35 = (void *)v112;
    v37 = v108;

    v32 = v126;
    v33 = v118;

    v36 = (void *)v120;
    v41 = v134;
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v41);
}

- (void)_updateViewConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AKModalSignInViewController;
  -[AKModalSignInViewController updateViewConstraints](&v11, sel_updateViewConstraints);
  -[AKModalSignInViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");
  v8 = 256.0;
  if (v7 != 1)
    v8 = 24.0;
  v9 = v5 - v8;
  -[AKModalSignInViewController bodyLabel](self, "bodyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferredMaxLayoutWidth:", v9);

}

- (BOOL)_isUsingPasscodeAuth
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isChildPasscodeEnabled"))
  {
    -[AKBaseSignInViewController context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isContextEligibleForPasscodeAuth");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_passwordRecoveryButtonWasTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[AKBaseSignInViewController context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "Will take user to password-reset flow for %@...", (uint8_t *)&v11, 0xCu);

  }
  -[AKBaseSignInViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBaseSignInViewController _beginAuthenticationIfPossibleWithOption:withUsername:password:](self, "_beginAuthenticationIfPossibleWithOption:withUsername:password:", 2, v8, v10);

}

- (void)_signInButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if (-[AKModalSignInViewController _isUsingPasscodeAuth](self, "_isUsingPasscodeAuth", a3))
  {
    -[AKBaseSignInViewController context](self, "context");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "username");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBaseSignInViewController _beginAuthenticationIfPossibleWithOption:withUsername:password:](self, "_beginAuthenticationIfPossibleWithOption:withUsername:password:", 1, v4, 0);
  }
  else
  {
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (!v7)
      return;
    -[AKBaseSignInViewController context](self, "context");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "username");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBaseSignInViewController _beginAuthenticationIfPossibleWithOption:withUsername:password:](self, "_beginAuthenticationIfPossibleWithOption:withUsername:password:", 1, v4, v9);

  }
}

- (void)startAnimating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKModalSignInViewController;
  -[AKBaseSignInViewController startAnimating](&v8, sel_startAnimating);
  -[AKModalSignInViewController signInButton](self, "signInButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[AKModalSignInViewController signInButton](self, "signInButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[AKModalSignInViewController passwordField](self, "passwordField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "ak_addActivityIndicator");

}

- (void)stopAnimating
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKModalSignInViewController;
  -[AKBaseSignInViewController stopAnimating](&v6, sel_stopAnimating);
  -[AKModalSignInViewController signInButton](self, "signInButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[AKModalSignInViewController passwordField](self, "passwordField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ak_clearActivityIndicatorIfExist");

}

- (BOOL)_isSignInAllowed
{
  return 1;
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
  v9.super_class = (Class)AKModalSignInViewController;
  v7 = a4;
  -[AKModalSignInViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__AKModalSignInViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E7678C60;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __82__AKModalSignInViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateConstraints");

}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[AKModalSignInViewController passwordField](self, "passwordField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[AKModalSignInViewController passwordField](self, "passwordField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[AKModalSignInViewController passwordField](self, "passwordField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
    goto LABEL_4;
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[AKBaseSignInViewController context](self, "context");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKModalSignInViewController passwordField](self, "passwordField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBaseSignInViewController _beginAuthenticationIfPossibleWithOption:withUsername:password:](self, "_beginAuthenticationIfPossibleWithOption:withUsername:password:", 1, v8, v10);

LABEL_4:
  }

  return 1;
}

- (void)displayAlertForContext:(id)a3 error:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v7 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD26F8], "ak_jiggleAnimation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v10, CFSTR("ak_jiggleAnimation"));

  if (objc_msgSend(v15, "code") == -7006)
  {
    objc_msgSend(v15, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CFFF10]);

    if (v12)
    {
      -[AKModalSignInViewController passwordField](self, "passwordField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", 0);

      -[AKModalSignInViewController signInButton](self, "signInButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEnabled:", 0);

    }
  }
  if (v7)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, 0, v15);

}

- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[AKModalSignInViewController passwordField](self, "passwordField");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a4 + 2))(v6, v7, 0);

}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (void)setHideTitle:(BOOL)a3
{
  self->_hideTitle = a3;
}

- (NSString)customBodyText
{
  return self->_customBodyText;
}

- (void)setCustomBodyText:(id)a3
{
  objc_storeStrong((id *)&self->_customBodyText, a3);
}

- (NSString)customButtonTitle
{
  return self->_customButtonTitle;
}

- (void)setCustomButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_customButtonTitle, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (UITextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
  objc_storeStrong((id *)&self->_passwordField, a3);
}

- (AKRoundedButton)signInButton
{
  return self->_signInButton;
}

- (void)setSignInButton:(id)a3
{
  objc_storeStrong((id *)&self->_signInButton, a3);
}

- (UIButton)iForgotButton
{
  return self->_iForgotButton;
}

- (void)setIForgotButton:(id)a3
{
  objc_storeStrong((id *)&self->_iForgotButton, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_iForgotButton, 0);
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_customButtonTitle, 0);
  objc_storeStrong((id *)&self->_customBodyText, 0);
}

@end
