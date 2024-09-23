@implementation MSDCodeEntryContentViewController

- (MSDCodeEntryContentViewController)initWithTitle:(id)a3 message:(id)a4 verificationCode:(id)a5 verificationErrorMesssage:(id)a6 andDelegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MSDCodeEntryContentViewController *v16;
  MSDCodeEntryContentViewController *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
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
  double v54;
  void *v55;
  MSDCodeEntryView *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  id v68;
  id v69;
  objc_super v70;

  v12 = a3;
  v69 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v70.receiver = self;
  v70.super_class = (Class)MSDCodeEntryContentViewController;
  v16 = -[MSDCodeEntryContentViewController initWithNibName:bundle:](&v70, sel_initWithNibName_bundle_, 0, 0);
  v17 = v16;
  if (v16)
  {
    -[MSDCodeEntryContentViewController setVerificationCode:](v16, "setVerificationCode:", v13);
    -[MSDCodeEntryContentViewController setDelegate:](v17, "setDelegate:", v15);
    -[MSDCodeEntryContentViewController setActiveConstraints:](v17, "setActiveConstraints:", 0);
    -[MSDCodeEntryContentViewController setErrorMessage:](v17, "setErrorMessage:", v14);
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("DDL_AUTHENTICATION_PROMPT"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77E8], 0, 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BDF6B68]);
    v19 = *MEMORY[0x24BDBF090];
    v20 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v21 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v22 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v23 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x24BDBF090], v20, v21, v22);
    -[MSDCodeEntryContentViewController setTitleLabel:](v17, "setTitleLabel:", v23);

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v67, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDCodeEntryContentViewController titleLabel](v17, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFont:", v24);

    -[MSDCodeEntryContentViewController titleLabel](v17, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNumberOfLines:", 0);

    -[MSDCodeEntryContentViewController titleLabel](v17, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTextAlignment:", 1);

    -[MSDCodeEntryContentViewController titleLabel](v17, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v12);

    -[MSDCodeEntryContentViewController titleLabel](v17, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MSDCodeEntryContentViewController titleLabel](v17, "titleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = 1055286886;
    objc_msgSend(v30, "_setHyphenationFactor:", v31);

    -[MSDCodeEntryContentViewController titleLabel](v17, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPreferredMaxLayoutWidth:", 238.0);

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v19, v20, v21, v22);
    -[MSDCodeEntryContentViewController setMessageLabel:](v17, "setMessageLabel:", v33);

    v34 = *MEMORY[0x24BDF77D0];
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77D0], 0x8000, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v35, 0.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDCodeEntryContentViewController messageLabel](v17, "messageLabel");
    v68 = v12;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFont:", v36);

    -[MSDCodeEntryContentViewController messageLabel](v17, "messageLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setNumberOfLines:", 0);

    -[MSDCodeEntryContentViewController messageLabel](v17, "messageLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTextAlignment:", 1);

    -[MSDCodeEntryContentViewController messageLabel](v17, "messageLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAttributedText:", v69);

    -[MSDCodeEntryContentViewController messageLabel](v17, "messageLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MSDCodeEntryContentViewController messageLabel](v17, "messageLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v43) = 1055286886;
    objc_msgSend(v42, "_setHyphenationFactor:", v43);

    -[MSDCodeEntryContentViewController messageLabel](v17, "messageLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setPreferredMaxLayoutWidth:", 238.0);

    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v19, v20, v21, v22);
    -[MSDCodeEntryContentViewController setPromptLabel:](v17, "setPromptLabel:", v45);

    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v34, 0x8000, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v46, 0.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDCodeEntryContentViewController promptLabel](v17, "promptLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFont:", v47);

    -[MSDCodeEntryContentViewController promptLabel](v17, "promptLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setNumberOfLines:", 0);

    -[MSDCodeEntryContentViewController promptLabel](v17, "promptLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTextAlignment:", 1);

    -[MSDCodeEntryContentViewController promptLabel](v17, "promptLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setText:", v66);

    -[MSDCodeEntryContentViewController promptLabel](v17, "promptLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MSDCodeEntryContentViewController promptLabel](v17, "promptLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v54) = 1055286886;
    objc_msgSend(v53, "_setHyphenationFactor:", v54);

    -[MSDCodeEntryContentViewController promptLabel](v17, "promptLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setPreferredMaxLayoutWidth:", 238.0);

    v56 = -[MSDCodeEntryView initWithDelegate:]([MSDCodeEntryView alloc], "initWithDelegate:", v17);
    -[MSDCodeEntryContentViewController setCodeEntryView:](v17, "setCodeEntryView:", v56);

    -[MSDCodeEntryContentViewController view](v17, "view");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDCodeEntryContentViewController titleLabel](v17, "titleLabel");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addSubview:", v58);

    -[MSDCodeEntryContentViewController view](v17, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDCodeEntryContentViewController messageLabel](v17, "messageLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addSubview:", v60);

    -[MSDCodeEntryContentViewController view](v17, "view");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDCodeEntryContentViewController promptLabel](v17, "promptLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSubview:", v62);

    -[MSDCodeEntryContentViewController view](v17, "view");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDCodeEntryContentViewController codeEntryView](v17, "codeEntryView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addSubview:", v64);

    v12 = v68;
  }

  return v17;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDCodeEntryContentViewController;
  -[MSDCodeEntryContentViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  -[MSDCodeEntryContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x24BDF7B90], *(double *)(MEMORY[0x24BDF7B90] + 8));
  v5 = v4;

  -[MSDCodeEntryContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v5);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDCodeEntryContentViewController;
  -[MSDCodeEntryContentViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[MSDCodeEntryContentViewController codeEntryView](self, "codeEntryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  uint64_t v32;
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
  double v46;
  void *v47;
  NSArray *v48;
  NSArray *activeConstraints;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)MSDCodeEntryContentViewController;
  -[MSDCodeEntryContentViewController updateViewConstraints](&v58, sel_updateViewConstraints);
  -[MSDCodeEntryContentViewController activeConstraints](self, "activeConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1628];
    -[MSDCodeEntryContentViewController activeConstraints](self, "activeConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v55 = objc_alloc_init(MEMORY[0x24BEBB4A8]);
  objc_msgSend(v55, "setWantsBaselineOffset:", 1);
  objc_msgSend(v55, "baselineOffset");
  v8 = v7;
  +[MSDCodeEntryView generatorFieldFont](MSDCodeEntryView, "generatorFieldFont");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "descender");
  v10 = v9;
  _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _messageLabel"), self->_titleLabel, self->_messageLabel, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77B0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD1628];
  -[MSDCodeEntryContentViewController titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDCodeEntryContentViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scaledValueForValue:", 36.0);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 12, 0, v15, 3, 1.0, v17);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDD1628];
  -[MSDCodeEntryContentViewController titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDCodeEntryContentViewController messageLabel](self, "messageLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scaledValueForValue:", -20.0);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 11, 0, v20, 12, 1.0, v22);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)v11;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(H_MARGIN)-[_titleLabel]-(H_MARGIN)-|"), 0, &unk_24F488838, v11);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(H_MARGIN)-[_messageLabel]-(H_MARGIN)-|"), 0, &unk_24F488838, v11);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x24BDD1628];
  -[MSDCodeEntryContentViewController promptLabel](self, "promptLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDCodeEntryContentViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 9, 0, v25, 9, 1.0, 0.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDD1628];
  -[MSDCodeEntryContentViewController messageLabel](self, "messageLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDCodeEntryContentViewController promptLabel](self, "promptLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v12;
  objc_msgSend(v12, "scaledValueForValue:", -30.0);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v26, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 11, 0, v28, 12, 1.0, v31);
  v32 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v57);
  objc_msgSend(v6, "addObject:", v56);
  objc_msgSend(v6, "addObjectsFromArray:", v52);
  objc_msgSend(v6, "addObjectsFromArray:", v51);
  objc_msgSend(v6, "addObject:", v50);
  v33 = (void *)v32;
  objc_msgSend(v6, "addObject:", v32);
  v34 = (void *)MEMORY[0x24BDD1628];
  -[MSDCodeEntryContentViewController codeEntryView](self, "codeEntryView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDCodeEntryContentViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 9, 0, v36, 9, 1.0, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x24BDD1628];
  -[MSDCodeEntryContentViewController codeEntryView](self, "codeEntryView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDCodeEntryContentViewController promptLabel](self, "promptLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "scaledValueForValue:", 12.0);
  objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 3, 0, v40, 11, 1.0, ceil(v41 - v8));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)MEMORY[0x24BDD1628];
  -[MSDCodeEntryContentViewController codeEntryView](self, "codeEntryView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDCodeEntryContentViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "scaledValueForValue:", -32.0);
  objc_msgSend(v43, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, 4, 0, v45, 4, 1.0, ceil(v46 - v10));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v37);
  objc_msgSend(v6, "addObject:", v42);
  objc_msgSend(v6, "addObject:", v47);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v6);
  v48 = (NSArray *)objc_msgSend(v6, "copy");
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v48;

}

- (void)didEnterCode:(id)a3 forEntry:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  MSDCodeEntryContentViewController *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_impl(&dword_22A6E6000, v8, OS_LOG_TYPE_DEFAULT, "User entered verification code: %{public}@", buf, 0xCu);
  }

  -[MSDCodeEntryContentViewController verificationCode](self, "verificationCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  defaultLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A6E6000, v11, OS_LOG_TYPE_DEFAULT, "Verification successful", buf, 2u);
    }
  }
  else
  {
    if (v12)
    {
      -[MSDCodeEntryContentViewController verificationCode](self, "verificationCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v6;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_22A6E6000, v11, OS_LOG_TYPE_DEFAULT, "Entered code: %{public}@ is not expected code: %{public}@", buf, 0x16u);

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __59__MSDCodeEntryContentViewController_didEnterCode_forEntry___block_invoke;
    v16[3] = &unk_24F47D350;
    v17 = v7;
    v18 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v16);
    v11 = v17;
  }

  -[MSDCodeEntryContentViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDCodeEntryContentViewController verificationCode](self, "verificationCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didCompleteVerification:forCode:", v10, v15);

}

void __59__MSDCodeEntryContentViewController_didEnterCode_forEntry___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clearEntry");
  objc_msgSend(*(id *)(a1 + 32), "jiggleAView");
  objc_msgSend(*(id *)(a1 + 40), "errorMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "promptLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v2);

  objc_msgSend(MEMORY[0x24BDF6950], "redColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "promptLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v5);

}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
  objc_storeStrong((id *)&self->_verificationCode, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (void)setPromptLabel:(id)a3
{
  objc_storeStrong((id *)&self->_promptLabel, a3);
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (MSDCodeEntryView)codeEntryView
{
  return self->_codeEntryView;
}

- (void)setCodeEntryView:(id)a3
{
  objc_storeStrong((id *)&self->_codeEntryView, a3);
}

- (MSDCodeEntryContentViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_codeEntryView, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
}

@end
