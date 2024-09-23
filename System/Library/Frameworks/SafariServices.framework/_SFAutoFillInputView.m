@implementation _SFAutoFillInputView

- (_SFAutoFillInputView)initWithHostString:(id)a3 credentialSource:(id)a4 suggestion:(id)a5 customTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _SFAutoFillInputView *v18;
  _SFAutoFillInputView *v19;
  uint64_t v20;
  NSString *hostString;
  uint64_t v22;
  NSString *credentialSource;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  NSMutableArray *dynamicConstraints;
  uint64_t v28;
  UILabel *explanationLabel;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  UIButton *v35;
  UIButton *keyboardButton;
  UIButton *v37;
  UIButton *otherPasswordsButton;
  uint64_t v39;
  UIButton *fillCredentialButton;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  _SFAutoFillInputView *v55;
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
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  objc_super v102;
  _QWORD v103[19];

  v103[17] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v102.receiver = self;
  v102.super_class = (Class)_SFAutoFillInputView;
  v14 = *MEMORY[0x1E0C9D648];
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v18 = -[UIInputView initWithFrame:inputViewStyle:](&v102, sel_initWithFrame_inputViewStyle_, 1, *MEMORY[0x1E0C9D648], v15, v16, v17);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_suggestion, a5);
    v20 = objc_msgSend(v10, "copy");
    hostString = v19->_hostString;
    v19->_hostString = (NSString *)v20;

    v22 = objc_msgSend(v11, "copy");
    credentialSource = v19->_credentialSource;
    v19->_credentialSource = (NSString *)v22;

    v24 = objc_msgSend(v13, "length");
    v99 = v13;
    if (v24)
      v25 = (void *)objc_msgSend(v13, "copy");
    else
      v25 = 0;
    v100 = v11;
    v101 = v10;
    objc_storeStrong((id *)&v19->_customTitle, v25);
    if (v24)

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dynamicConstraints = v19->_dynamicConstraints;
    v19->_dynamicConstraints = v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v14, v15, v16, v17);
    explanationLabel = v19->_explanationLabel;
    v19->_explanationLabel = (UILabel *)v28;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v19->_explanationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v19->_explanationLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v19->_explanationLabel, "setNumberOfLines:", 0);
    _SFAutoFillInputViewLabelFont();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19->_explanationLabel, "setFont:", v30);

    -[UILabel setAdjustsFontForContentSizeCategory:](v19->_explanationLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v19->_explanationLabel, "setTextColor:", v31);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_24);
    v32 = objc_claimAutoreleasedReturnValue();
    UIKeyboardGetKeyboardKeyImage();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = (void *)v32;
    objc_msgSend(v33, "imageWithTintColor:", v32);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "sf_imageNamed:", CFSTR("PasswordAutoFillKey"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "imageWithTintColor:", v32);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    keyboardButton = v19->_keyboardButton;
    v19->_keyboardButton = v35;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v19->_keyboardButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setImage:forState:](v19->_keyboardButton, "setImage:forState:", v97, 0);
    -[UIButton setImageEdgeInsets:](v19->_keyboardButton, "setImageEdgeInsets:", 13.0, 24.0, 25.0, 8.0);
    -[_SFAutoFillInputView addSubview:](v19, "addSubview:", v19->_keyboardButton);
    v37 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    otherPasswordsButton = v19->_otherPasswordsButton;
    v19->_otherPasswordsButton = v37;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v19->_otherPasswordsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setImageEdgeInsets:](v19->_otherPasswordsButton, "setImageEdgeInsets:", 13.0, 8.0, 25.0, 24.0);
    -[UIButton setImage:forState:](v19->_otherPasswordsButton, "setImage:forState:", v96, 0);
    -[_SFAutoFillInputView addSubview:](v19, "addSubview:", v19->_otherPasswordsButton);
    +[_SFAutoFillInputViewButton buttonWithType:](_SFAutoFillInputViewButton, "buttonWithType:", 1);
    v39 = objc_claimAutoreleasedReturnValue();
    fillCredentialButton = v19->_fillCredentialButton;
    v19->_fillCredentialButton = (UIButton *)v39;

    -[UIButton setAccessibilityIdentifier:](v19->_fillCredentialButton, "setAccessibilityIdentifier:", CFSTR("CredentialUsernameButton"));
    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setButtonSize:", 3);
    -[UIButton setConfiguration:](v19->_fillCredentialButton, "setConfiguration:", v95);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v19->_fillCredentialButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v41) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v19->_fillCredentialButton, "setContentHuggingPriority:forAxis:", 0, v41);
    -[_SFAutoFillInputView addSubview:](v19, "addSubview:", v19->_fillCredentialButton);
    -[_SFAutoFillInputView updateSuggestionIfNecessary:](v19, "updateSuggestionIfNecessary:", v12);
    -[_SFAutoFillInputView addSubview:](v19, "addSubview:", v19->_explanationLabel);
    -[UIInputView setAllowsSelfSizing:](v19, "setAllowsSelfSizing:", 1);
    -[_SFAutoFillInputView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton widthAnchor](v19->_fillCredentialButton, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView widthAnchor](v19, "widthAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v45) = 1144750080;
    v84 = v44;
    objc_msgSend(v44, "setPriority:", v45);
    v77 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v19->_explanationLabel, "topAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView topAnchor](v19, "topAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, 20.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v92;
    -[UILabel bottomAnchor](v19->_explanationLabel, "bottomAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v19->_fillCredentialButton, "topAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:constant:", v90, -20.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v89;
    -[UILabel centerXAnchor](v19->_explanationLabel, "centerXAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView centerXAnchor](v19, "centerXAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v87);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v86;
    -[UILabel leadingAnchor](v19->_explanationLabel, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView leadingAnchor](v19, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintGreaterThanOrEqualToAnchor:constant:", v83, 16.0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v103[3] = v82;
    -[UILabel trailingAnchor](v19->_explanationLabel, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView trailingAnchor](v19, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintGreaterThanOrEqualToAnchor:constant:", v80, -16.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v103[4] = v79;
    -[UILabel widthAnchor](v19->_explanationLabel, "widthAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintLessThanOrEqualToConstant:", 420.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v103[5] = v76;
    -[UIButton bottomAnchor](v19->_fillCredentialButton, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView bottomAnchor](v19, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:constant:", v74, -78.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v103[6] = v73;
    -[UIButton centerXAnchor](v19->_fillCredentialButton, "centerXAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView centerXAnchor](v19, "centerXAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v103[7] = v70;
    v103[8] = v44;
    -[UIButton bottomAnchor](v19->_keyboardButton, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView bottomAnchor](v19, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v103[9] = v67;
    -[UIButton leftAnchor](v19->_keyboardButton, "leftAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView leftAnchor](v19, "leftAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v103[10] = v64;
    -[UIButton widthAnchor](v19->_keyboardButton, "widthAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToConstant:", 60.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v103[11] = v62;
    -[UIButton heightAnchor](v19->_keyboardButton, "heightAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToConstant:", 66.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v103[12] = v60;
    -[UIButton bottomAnchor](v19->_otherPasswordsButton, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView bottomAnchor](v19, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v103[13] = v57;
    -[UIButton rightAnchor](v19->_otherPasswordsButton, "rightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAutoFillInputView rightAnchor](v19, "rightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v103[14] = v48;
    -[UIButton widthAnchor](v19->_otherPasswordsButton, "widthAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToConstant:", 60.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v103[15] = v50;
    -[UIButton heightAnchor](v19->_otherPasswordsButton, "heightAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToConstant:", 66.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v103[16] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 17);
    v53 = v12;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "activateConstraints:", v54);

    v12 = v53;
    -[_SFAutoFillInputView _commonInit](v19, "_commonInit");
    -[UIButton addTarget:action:forControlEvents:](v19->_fillCredentialButton, "addTarget:action:forControlEvents:", v19, sel__fillCredential_, 0x2000);
    -[UIButton addTarget:action:forControlEvents:](v19->_keyboardButton, "addTarget:action:forControlEvents:", v19, sel__showStandardKeyboard_, 0x2000);
    -[UIButton addTarget:action:forControlEvents:](v19->_otherPasswordsButton, "addTarget:action:forControlEvents:", v19, sel__showMorePasswords_, 0x2000);
    v55 = v19;

    v11 = v100;
    v10 = v101;
    v13 = v99;
  }

  return v19;
}

- (_SFAutoFillInputView)initWithIntroductionViewController:(id)a3
{
  id v5;
  id *v6;
  _SFAutoFillInputView *v7;
  _SFAutoFillInputView *v8;

  v5 = a3;
  v6 = -[_SFAutoFillInputView _initWithViewController:](self, "_initWithViewController:", v5);
  v7 = (_SFAutoFillInputView *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 94, a3);
    v8 = v7;
  }

  return v7;
}

- (_SFAutoFillInputView)initWithStreamlinedAutoFillViewController:(id)a3 suggestion:(id)a4
{
  id v7;
  id v8;
  _SFAutoFillInputView *v9;
  _SFAutoFillInputView *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[_SFAutoFillInputView _initWithViewController:](self, "_initWithViewController:", v7);
  if (v9)
  {
    objc_msgSend(v7, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_streamlinedAutoFillViewController, a3);
    objc_storeStrong((id *)&v9->_suggestion, a4);
    v10 = v9;
  }

  return v9;
}

- (_SFAutoFillInputView)initWithStreamlinedStrongPasswordViewController:(id)a3
{
  id v5;
  _SFAutoFillInputView *v6;
  _SFAutoFillInputView *v7;

  v5 = a3;
  v6 = -[_SFAutoFillInputView _initWithViewController:](self, "_initWithViewController:", v5);
  if (v6)
  {
    objc_msgSend(v5, "setDelegate:", v6);
    objc_storeStrong((id *)&v6->_streamlinedStrongPasswordViewController, a3);
    v7 = v6;
  }

  return v6;
}

- (id)_initWithViewController:(id)a3
{
  id v4;
  _SFAutoFillInputView *v5;
  _SFAutoFillInputView *v6;
  NSMutableArray *v7;
  NSMutableArray *dynamicConstraints;
  void *v9;
  void *v10;
  uint64_t v11;
  NSLayoutConstraint *heightConstraint;
  void *v13;
  void *v14;
  void *v15;
  _SFAutoFillInputView *v16;

  v4 = a3;
  v5 = -[UIInputView initWithFrame:inputViewStyle:](self, "initWithFrame:inputViewStyle:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[_SFAutoFillInputView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIInputView setAllowsSelfSizing:](v6, "setAllowsSelfSizing:", 1);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dynamicConstraints = v6->_dynamicConstraints;
    v6->_dynamicConstraints = v7;

    objc_msgSend(v4, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFAutoFillInputView addSubview:](v6, "addSubview:", v9);
    -[_SFAutoFillInputView heightAnchor](v6, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintLessThanOrEqualToConstant:", 100.0);
    v11 = objc_claimAutoreleasedReturnValue();
    heightConstraint = v6->_heightConstraint;
    v6->_heightConstraint = (NSLayoutConstraint *)v11;

    v13 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "safari_constraintsMatchingFrameOfView:withFrameOfView:", v9, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObject:", v6->_heightConstraint);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateConstraints:", v15);

    -[_SFAutoFillInputView _commonInit](v6, "_commonInit");
    v16 = v6;

  }
  return v6;
}

- (void)_commonInit
{
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_SFAutoFillInputView _updateDynamicConstraints](self, "_updateDynamicConstraints");
  -[_SFAutoFillInputView _updateKeyboardHeight](self, "_updateKeyboardHeight");
  -[_SFAutoFillInputView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("SFAutoFillInputView"));
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[_SFAutoFillInputView registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v3, self, sel__preferredContentSizeCategoryDidChange);

}

- (void)replaceContentsOfViewWithStreamlinedStrongPasswordViewController:(id)a3
{
  PMSafariStreamlinedStrongPasswordViewController *v4;
  PMSafariStreamlinedStrongPasswordViewController *streamlinedStrongPasswordViewController;
  PMSafariStreamlinedStrongPasswordViewController *v6;

  v4 = (PMSafariStreamlinedStrongPasswordViewController *)a3;
  -[_SFAutoFillInputView _replaceContentsOfViewWithViewController:](self, "_replaceContentsOfViewWithViewController:", v4);
  streamlinedStrongPasswordViewController = self->_streamlinedStrongPasswordViewController;
  self->_streamlinedStrongPasswordViewController = v4;
  v6 = v4;

  -[PMSafariStreamlinedStrongPasswordViewController setDelegate:](v6, "setDelegate:", self);
}

- (void)replaceContentsOfViewWithStrongPasswordIntroductionViewController:(id)a3
{
  PMSafariAutoFillStrongPasswordIntroductionViewController *v4;
  PMSafariAutoFillStrongPasswordIntroductionViewController *strongPasswordIntroductionViewController;
  PMSafariAutoFillStrongPasswordIntroductionViewController *v6;
  void *v7;
  id v8;

  v4 = (PMSafariAutoFillStrongPasswordIntroductionViewController *)a3;
  -[_SFAutoFillInputView _replaceContentsOfViewWithViewController:](self, "_replaceContentsOfViewWithViewController:", v4);
  strongPasswordIntroductionViewController = self->_strongPasswordIntroductionViewController;
  self->_strongPasswordIntroductionViewController = v4;
  v6 = v4;

  -[PMSafariAutoFillStrongPasswordIntroductionViewController view](v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsUpdateConstraints");

  -[PMSafariAutoFillStrongPasswordIntroductionViewController view](v6, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "layoutIfNeeded");
}

- (void)_replaceContentsOfViewWithViewController:(id)a3
{
  PMSafariStreamlinedAutoFillViewController *streamlinedAutoFillViewController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PMSafariStreamlinedAutoFillViewController *v9;
  PMSafariAutoFillStrongPasswordIntroductionViewController *strongPasswordIntroductionViewController;
  PMSafariStreamlinedStrongPasswordViewController *streamlinedStrongPasswordViewController;
  void *v12;
  void *v13;
  id v14;

  streamlinedAutoFillViewController = self->_streamlinedAutoFillViewController;
  v5 = a3;
  -[PMSafariStreamlinedAutoFillViewController view](streamlinedAutoFillViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[PMSafariAutoFillStrongPasswordIntroductionViewController view](self->_strongPasswordIntroductionViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[PMSafariStreamlinedStrongPasswordViewController view](self->_streamlinedStrongPasswordViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  v9 = self->_streamlinedAutoFillViewController;
  self->_streamlinedAutoFillViewController = 0;

  strongPasswordIntroductionViewController = self->_strongPasswordIntroductionViewController;
  self->_strongPasswordIntroductionViewController = 0;

  streamlinedStrongPasswordViewController = self->_streamlinedStrongPasswordViewController;
  self->_streamlinedStrongPasswordViewController = 0;

  objc_msgSend(v5, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_SFAutoFillInputView addSubview:](self, "addSubview:", v14);
  v12 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "safari_constraintsMatchingFrameOfView:withFrameOfView:", v14, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v13);

  -[_SFAutoFillInputView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[_SFAutoFillInputView setNeedsLayout](self, "setNeedsLayout");

}

- (void)updateConstraints
{
  objc_super v3;

  -[_SFAutoFillInputView _updateDynamicConstraints](self, "_updateDynamicConstraints");
  -[_SFAutoFillInputView _updateKeyboardHeight](self, "_updateKeyboardHeight");
  v3.receiver = self;
  v3.super_class = (Class)_SFAutoFillInputView;
  -[_SFAutoFillInputView updateConstraints](&v3, sel_updateConstraints);
}

- (void)updateSuggestionIfNecessary:(id)a3
{
  _SFTextSuggestion **p_suggestion;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;

  v38 = a3;
  p_suggestion = &self->_suggestion;
  -[_SFTextSuggestion savedAccountMatch](self->_suggestion, "savedAccountMatch");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v38, "savedAccountMatch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "savedAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFTextSuggestion savedAccountMatch](*p_suggestion, "savedAccountMatch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "savedAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  -[_SFTextSuggestion credentialIdentity](*p_suggestion, "credentialIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "type") != 2)
  {
LABEL_8:

    goto LABEL_9;
  }
  -[_SFTextSuggestion credentialIdentity](*p_suggestion, "credentialIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isExternal") & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v38, "savedAccountMatch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_9:
    objc_storeStrong((id *)&self->_suggestion, a3);
    objc_msgSend(v38, "savedAccountMatch");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "autoFillPasskey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithFormat:", v19, self->_hostString);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSString length](self->_customTitle, "length"))
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
LABEL_21:
        _WBSLocalizedString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringWithFormat:", v30, self->_hostString, self->_customTitle);
        v31 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v31;
LABEL_22:

        goto LABEL_23;
      }
      goto LABEL_23;
    }
    if (!self->_credentialSource
      || (objc_msgSend(v38, "credentialIdentity"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v22,
          !v22))
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringWithFormat:", v29, self->_hostString);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSString length](self->_customTitle, "length"))
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_21;
      }
LABEL_23:
      -[UILabel setText:](self->_explanationLabel, "setText:", v20);
      v32 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "displayText");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringWithFormat:", v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIButton configuration](self->_fillCredentialButton, "configuration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setTitle:", v35);
      -[UIButton setConfiguration:](self->_fillCredentialButton, "setConfiguration:", v36);

      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0DD9910], "keychainSyncEnabled");
    objc_msgSend(v38, "credentialIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "owningExtensionState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "credentialIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "type");

    switch(v26)
    {
      case 4:
        v27 = (void *)MEMORY[0x1E0CB3940];
        if (!v24)
          goto LABEL_30;
        break;
      case 2:
        v27 = (void *)MEMORY[0x1E0CB3940];
        if (!v24)
          goto LABEL_30;
        break;
      case 1:
        v27 = (void *)MEMORY[0x1E0CB3940];
        if (v24)
          break;
LABEL_30:
        _WBSLocalizedString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringWithFormat:", v30, self->_hostString, v37);
        goto LABEL_31;
      default:
        v20 = 0;
        goto LABEL_23;
    }
    _WBSLocalizedString();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringWithFormat:", v30, self->_hostString, self->_credentialSource);
LABEL_31:
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
LABEL_24:

}

- (void)_updateDynamicConstraints
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  _BOOL4 IsAccessibilityCategory;
  NSMutableArray *dynamicConstraints;
  void *v10;
  uint64_t v11;
  int IsPad;
  void *v13;
  uint64_t *v14;
  void *v15;
  int v16;
  NSMutableArray *v17;
  UIButton *fillCredentialButton;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  if (-[NSMutableArray count](self->_dynamicConstraints, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_dynamicConstraints);
    -[NSMutableArray removeAllObjects](self->_dynamicConstraints, "removeAllObjects");
  }
  v4 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "interfaceOrientation");
  if (self->_fillCredentialButton)
  {
    v5 = v4;
    -[_SFAutoFillInputView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    if (IsAccessibilityCategory)
    {
      dynamicConstraints = self->_dynamicConstraints;
      -[UIButton heightAnchor](self->_fillCredentialButton, "heightAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintGreaterThanOrEqualToConstant:", 50.0);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      IsPad = _SFDeviceIsPad();
      dynamicConstraints = self->_dynamicConstraints;
      -[UIButton heightAnchor](self->_fillCredentialButton, "heightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      if ((IsPad & 1) != 0 || (unint64_t)(v5 - 1) <= 1)
        v14 = &_SFAutoFillInputViewDefaultButonHeight;
      else
        v14 = &_SFAutoFillInputViewDefaultButonHeightLandscapePhone;
      objc_msgSend(v13, "constraintEqualToConstant:", *(double *)v14);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v11;
    -[NSMutableArray addObject:](dynamicConstraints, "addObject:", v11);

    v16 = _SFDeviceIsPad();
    v17 = self->_dynamicConstraints;
    fillCredentialButton = self->_fillCredentialButton;
    if (v16)
    {
      -[UIButton leadingAnchor](fillCredentialButton, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFAutoFillInputView leadingAnchor](self, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v20, 16.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v21;
      -[UIButton trailingAnchor](self->_fillCredentialButton, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFAutoFillInputView trailingAnchor](self, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:constant:", v23, -16.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v17, "addObjectsFromArray:", v25);

      v3 = 0x1E0CB3000;
    }
    else
    {
      -[UIButton widthAnchor](fillCredentialButton, "widthAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintLessThanOrEqualToConstant:", 343.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v17, "addObject:", v20);
    }

  }
  objc_msgSend(*(id *)(v3 + 1816), "activateConstraints:", self->_dynamicConstraints);
}

- (void)_updateFillCredentialButtonLabelMetrics
{
  void *v3;
  void *v4;
  NSString *v5;
  uint64_t v6;
  id v7;

  -[_SFAutoFillInputView traitCollection](self, "traitCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_fillCredentialButton, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);
  -[UIButton configuration](self->_fillCredentialButton, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v5))
    v6 = 1;
  else
    v6 = 5;
  objc_msgSend(v4, "setTitleLineBreakMode:", v6);

  -[UIButton setConfiguration:](self->_fillCredentialButton, "setConfiguration:", v4);
}

- (void)_preferredContentSizeCategoryDidChange
{
  -[_SFAutoFillInputView _updateFillCredentialButtonLabelMetrics](self, "_updateFillCredentialButtonLabelMetrics");
  -[_SFAutoFillInputView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_fillCredential:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "autoFillTextSuggestion:", self->_suggestion);

}

- (void)_showMorePasswords:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "autoFillInputViewDidSelectMorePasswords:", self);

}

- (void)_showStandardKeyboard:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "autoFillInputViewDidSelectUseKeyboard:", self);

}

- (void)_updateKeyboardHeight
{
  double v3;

  -[_SFAutoFillInputView _updateKeyboardMetricsAndInterfaceOrientationIfNeeded](self, "_updateKeyboardMetricsAndInterfaceOrientationIfNeeded");
  -[_SFAutoFillInputView _currentKeyboardSize](self, "_currentKeyboardSize");
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v3 * 1.5);
}

- (CGSize)_currentKeyboardSize
{
  int *v3;
  double *v4;
  double v5;
  double v6;
  CGSize result;

  if ((unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "interfaceOrientation") - 3) >= 2)
    v3 = &OBJC_IVAR____SFAutoFillInputView__portraitKeyboardSize;
  else
    v3 = &OBJC_IVAR____SFAutoFillInputView__landscapeKeyboardSize;
  v4 = (double *)((char *)self + *v3);
  v5 = *v4;
  v6 = v4[1];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_updateKeyboardMetricsAndInterfaceOrientationIfNeeded
{
  int64_t v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGSize *p_landscapeKeyboardSize;
  CGFloat v8;
  CGFloat v9;
  id v10;

  v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "interfaceOrientation");
  if (v3 != self->_currentInterfaceOrientation)
  {
    self->_currentInterfaceOrientation = v3;
    +[_SFKeyboardGeometry keyboardGeometryForInterfaceOrientation:](_SFKeyboardGeometry, "keyboardGeometryForInterfaceOrientation:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sizeWithBar");
    self->_portraitKeyboardSize.width = v5;
    self->_portraitKeyboardSize.height = v6;

    +[_SFKeyboardGeometry keyboardGeometryForInterfaceOrientation:](_SFKeyboardGeometry, "keyboardGeometryForInterfaceOrientation:", 4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    p_landscapeKeyboardSize = &self->_landscapeKeyboardSize;
    if (_SFDeviceIsPad())
      objc_msgSend(v10, "sizeWithoutBar");
    else
      objc_msgSend(v10, "sizeWithBar");
    p_landscapeKeyboardSize->width = v8;
    p_landscapeKeyboardSize->height = v9;

  }
}

- (void)streamlinedAutoFillViewControllerFillCredential:(id)a3
{
  -[_SFAutoFillInputView _fillCredential:](self, "_fillCredential:", self->_suggestion);
}

- (void)streamlinedAutoFillViewControllerShowKeyboard:(id)a3
{
  -[_SFAutoFillInputView _showStandardKeyboard:](self, "_showStandardKeyboard:", 0);
}

- (void)streamlinedAutoFillViewControllerShowOtherPasswords:(id)a3
{
  -[_SFAutoFillInputView _showMorePasswords:](self, "_showMorePasswords:", 0);
}

- (void)streamlinedStrongPasswordViewControllerShowKeyboard:(id)a3
{
  -[_SFAutoFillInputView _showStandardKeyboard:](self, "_showStandardKeyboard:", 0);
}

- (void)streamlinedStrongPasswordViewControllerShowOtherPasswords:(id)a3
{
  -[_SFAutoFillInputView _showMorePasswords:](self, "_showMorePasswords:", 0);
}

- (void)streamlinedStrongPasswordViewController:(id)a3 shouldFillStrongPasswordWithFormat:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "autoFillStrongPasswordWithFormat:", a4);

}

- (void)streamlinedStrongPasswordViewControllerDeclinedStrongPassword:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "autoFillInputViewShouldClose:", self);

}

- (_SFAutoFillInputViewDelegate)delegate
{
  return (_SFAutoFillInputViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamlinedStrongPasswordViewController, 0);
  objc_storeStrong((id *)&self->_streamlinedAutoFillViewController, 0);
  objc_storeStrong((id *)&self->_strongPasswordIntroductionViewController, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_fillCredentialButton, 0);
  objc_storeStrong((id *)&self->_otherPasswordsButton, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_credentialSource, 0);
  objc_storeStrong((id *)&self->_hostString, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
