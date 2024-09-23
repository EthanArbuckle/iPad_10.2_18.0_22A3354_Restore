@implementation PasscodeEmbeddedViewController

- (void)loadView
{
  id v3;
  void *v4;
  id v5;
  UIStackView *v6;
  UIStackView *mainContainer;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIImpactFeedbackGenerator *v25;
  UIImpactFeedbackGenerator *hapticGenerator;
  UIView *v27;
  UIView *passcodeFieldContainer;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  UIStackView *v35;
  UIStackView *passcodeFieldBackground;
  unint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
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
  UITextField *v56;
  UITextField *passcodeField;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *i;
  void *v64;
  _BOOL4 IsBoldTextEnabled;
  double v66;
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
  double v80;
  double v81;
  void *v82;
  UIFontTextStyle v83;
  UITextField *v84;
  UITextField *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
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
  UILabel *v112;
  UILabel *backoffTitle;
  void *v114;
  void *v115;
  UILabel *v116;
  UILabel *backoffSubtitle;
  void *v118;
  void *v119;
  id obj;
  _QWORD v121[5];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint8_t buf[8];
  UITextField *v127;
  _BYTE v128[128];

  v3 = objc_alloc_init((Class)UIView);
  -[PasscodeEmbeddedViewController setView:](self, "setView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController view](self, "view"));
  v5 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_selectPasscodeField:");
  objc_msgSend(v4, "addGestureRecognizer:", v5);

  v6 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  mainContainer = self->_mainContainer;
  self->_mainContainer = v6;

  -[UIStackView setAxis:](self->_mainContainer, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_mainContainer, "setAlignment:", 3);
  -[UIStackView setSpacing:](self->_mainContainer, "setSpacing:", 8.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", self->_mainContainer);

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_mainContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_mainContainer, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_mainContainer, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  objc_msgSend(v16, "setActive:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_mainContainer, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
  objc_msgSend(v20, "setActive:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_mainContainer, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  objc_msgSend(v24, "setActive:", 1);

  v25 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc((Class)UIImpactFeedbackGenerator), "initWithStyle:", 2);
  hapticGenerator = self->_hapticGenerator;
  self->_hapticGenerator = v25;

  -[UIImpactFeedbackGenerator prepare](self->_hapticGenerator, "prepare");
  v27 = (UIView *)objc_alloc_init((Class)UIView);
  passcodeFieldContainer = self->_passcodeFieldContainer;
  self->_passcodeFieldContainer = v27;

  -[UIStackView addArrangedSubview:](self->_mainContainer, "addArrangedSubview:", self->_passcodeFieldContainer);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_passcodeFieldContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v22) = -[PasscodeEmbeddedViewController _useDotPattern](self, "_useDotPattern");
  v31 = LALogForCategory(0, v29, v30);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
  if ((_DWORD)v22)
  {
    if (v33)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Presenting fixed length passcode UI", buf, 2u);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController traitCollection](self, "traitCollection"));
    objc_msgSend(v34, "userInterfaceStyle");
    -[UIView setAlpha:](self->_passcodeFieldContainer, "setAlpha:", 1.0);

    v35 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    passcodeFieldBackground = self->_passcodeFieldBackground;
    self->_passcodeFieldBackground = v35;

    -[UIStackView setAxis:](self->_passcodeFieldBackground, "setAxis:", 0);
    -[UIStackView setSpacing:](self->_passcodeFieldBackground, "setSpacing:", 20.75);
    if (-[PasscodeEmbeddedViewController passcodeLength](self, "passcodeLength"))
    {
      v37 = 0;
      do
      {
        v38 = objc_alloc_init((Class)UIView);
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController traitCollection](self, "traitCollection"));
        if (objc_msgSend(v39, "userInterfaceStyle") == (id)2)
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
        else
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
        v41 = objc_retainAutorelease(v40);
        v42 = objc_msgSend(v41, "CGColor");
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layer"));
        objc_msgSend(v43, "setBorderColor:", v42);

        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layer"));
        objc_msgSend(v44, "setBorderWidth:", 1.7);

        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layer"));
        objc_msgSend(v45, "setCornerRadius:", 10.0);

        -[UIStackView addArrangedSubview:](self->_passcodeFieldBackground, "addArrangedSubview:", v38);
        objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "widthAnchor"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToConstant:", 20.0));
        objc_msgSend(v47, "setActive:", 1);

        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "heightAnchor"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", 20.0));
        objc_msgSend(v49, "setActive:", 1);

        ++v37;
      }
      while (v37 < -[PasscodeEmbeddedViewController passcodeLength](self, "passcodeLength"));
    }
    -[UIView addSubview:](self->_passcodeFieldContainer, "addSubview:", self->_passcodeFieldBackground);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_passcodeFieldBackground, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](self->_passcodeFieldBackground, "centerXAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_passcodeFieldContainer, "centerXAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, -1.25));
    objc_msgSend(v52, "setActive:", 1);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](self->_passcodeFieldBackground, "centerYAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_passcodeFieldContainer, "centerYAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v54));
    objc_msgSend(v55, "setActive:", 1);

    v56 = (UITextField *)objc_alloc_init((Class)UITextField);
    passcodeField = self->_passcodeField;
    self->_passcodeField = v56;

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextField setTintColor:](self->_passcodeField, "setTintColor:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UITextField setTextColor:](self->_passcodeField, "setTextColor:", v59);

    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v127 = self->_passcodeField;
    obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v127, 1));
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v128, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v123;
      do
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(_QWORD *)v123 != v62)
            objc_enumerationMutation(obj);
          v64 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v64, "setTextAlignment:", 0);
          objc_msgSend(v64, "setDelegate:", self);
          objc_msgSend(v64, "setSecureTextEntry:", 1);
          IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
          v66 = 50.0;
          if (IsBoldTextEnabled)
            v66 = 48.0;
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v66));
          objc_msgSend(v64, "setFont:", v67);

          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "defaultTextAttributes"));
          objc_msgSend(v68, "setValue:forKey:", &off_10007E618, NSKernAttributeName);

          objc_msgSend(v64, "setKeyboardType:", 4);
          -[UIView addSubview:](self->_passcodeFieldContainer, "addSubview:", v64);
          objc_msgSend(v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "topAnchor"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_passcodeFieldContainer, "topAnchor"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v70));
          objc_msgSend(v71, "setActive:", 1);

          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "bottomAnchor"));
          v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_passcodeFieldContainer, "bottomAnchor"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v73));
          objc_msgSend(v74, "setActive:", 1);

          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "centerXAnchor"));
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_passcodeFieldContainer, "centerXAnchor"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, 5.0));
          objc_msgSend(v77, "setActive:", 1);

          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "widthAnchor"));
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToConstant:", (double)(41 * -[PasscodeEmbeddedViewController passcodeLength](self, "passcodeLength"))));
          objc_msgSend(v79, "setActive:", 1);

          LODWORD(v80) = 1148846080;
          objc_msgSend(v64, "setContentCompressionResistancePriority:forAxis:", 0, v80);
          LODWORD(v81) = 1132068864;
          objc_msgSend(v64, "setContentHuggingPriority:forAxis:", 0, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
          objc_msgSend(v64, "setBackgroundColor:", v82);

        }
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v128, 16);
      }
      while (v61);
    }

    v83 = UIFontTextStyleTitle2;
  }
  else
  {
    if (v33)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Presenting variable length passcode UI", buf, 2u);
    }

    -[UIStackView setAxis:](self->_mainContainer, "setAxis:", 0);
    v84 = objc_opt_new(UITextField);
    v85 = self->_passcodeField;
    self->_passcodeField = v84;

    -[UITextField setDelegate:](self->_passcodeField, "setDelegate:", self);
    -[UITextField setDevicePasscodeEntry:](self->_passcodeField, "setDevicePasscodeEntry:", 1);
    -[UITextField setSecureTextEntry:](self->_passcodeField, "setSecureTextEntry:", 1);
    -[UITextField setTextContentType:](self->_passcodeField, "setTextContentType:", UITextContentTypeOneTimeCode);
    v83 = UIFontTextStyleTitle2;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
    -[UITextField setFont:](self->_passcodeField, "setFont:", v86);

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController alphanumericFieldPlaceholder](self, "alphanumericFieldPlaceholder"));
    -[UITextField setAttributedPlaceholder:](self->_passcodeField, "setAttributedPlaceholder:", v87);

    -[UITextField setTextAlignment:](self->_passcodeField, "setTextAlignment:", -[PasscodeEmbeddedViewController alphanumericFieldTextAlignment](self, "alphanumericFieldTextAlignment"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UITextField setTextColor:](self->_passcodeField, "setTextColor:", v88);

    -[UITextField setReturnKeyType:](self->_passcodeField, "setReturnKeyType:", 9);
    if (-[PasscodeEmbeddedViewController hasAlphaNumericPasscode](self, "hasAlphaNumericPasscode"))
      v89 = 1;
    else
      v89 = 4;
    -[UITextField setKeyboardType:](self->_passcodeField, "setKeyboardType:", v89);
    if (!-[PasscodeEmbeddedViewController hasAlphaNumericPasscode](self, "hasAlphaNumericPasscode"))
    {
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v91 = objc_msgSend(v90, "userInterfaceIdiom");

      if (v91 != (id)1)
      {
        v121[0] = _NSConcreteStackBlock;
        v121[1] = 3221225472;
        v121[2] = sub_100021270;
        v121[3] = &unk_10007A498;
        v121[4] = self;
        v92 = sub_100021270((uint64_t)v121);
        v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
        -[UITextField setInputAccessoryView:](self->_passcodeField, "setInputAccessoryView:", v93);

      }
    }
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController traitCollection](self, "traitCollection"));
    if (objc_msgSend(v94, "userInterfaceStyle") == (id)2)
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor"));
    else
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayTintColor](UIColor, "systemLightGrayTintColor"));
    v96 = objc_retainAutorelease(v95);
    v97 = objc_msgSend(v96, "CGColor");
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_passcodeFieldContainer, "layer"));
    objc_msgSend(v98, "setBackgroundColor:", v97);

    v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_passcodeFieldContainer, "layer"));
    objc_msgSend(v99, "setCornerRadius:", 10.0);

    -[UIView addSubview:](self->_passcodeFieldContainer, "addSubview:", self->_passcodeField);
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_passcodeField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField topAnchor](self->_passcodeField, "topAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_passcodeFieldContainer, "topAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:constant:", v101, 15.0));
    objc_msgSend(v102, "setActive:", 1);

    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField bottomAnchor](self->_passcodeField, "bottomAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_passcodeFieldContainer, "bottomAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:constant:", v104, -15.0));
    objc_msgSend(v105, "setActive:", 1);

    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_passcodeField, "leadingAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_passcodeFieldContainer, "leadingAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107, 15.0));
    objc_msgSend(v108, "setActive:", 1);

    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_passcodeField, "trailingAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_passcodeFieldContainer, "trailingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:constant:", v110, -15.0));
    objc_msgSend(v111, "setActive:", 1);

  }
  v112 = objc_opt_new(UILabel);
  backoffTitle = self->_backoffTitle;
  self->_backoffTitle = v112;

  v114 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", v83));
  -[UILabel setFont:](self->_backoffTitle, "setFont:", v114);

  v115 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_backoffTitle, "setTextColor:", v115);

  -[UILabel setHidden:](self->_backoffTitle, "setHidden:", 1);
  -[UIStackView addArrangedSubview:](self->_mainContainer, "addArrangedSubview:", self->_backoffTitle);
  v116 = objc_opt_new(UILabel);
  backoffSubtitle = self->_backoffSubtitle;
  self->_backoffSubtitle = v116;

  v118 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_backoffSubtitle, "setFont:", v118);

  v119 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_backoffSubtitle, "setTextColor:", v119);

  -[UILabel setHidden:](self->_backoffSubtitle, "setHidden:", 1);
  -[UIStackView addArrangedSubview:](self->_mainContainer, "addArrangedSubview:", self->_backoffSubtitle);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PasscodeEmbeddedViewController;
  -[PasscodeEmbeddedViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[UITextField setText:](self->_passcodeField, "setText:", &stru_10007CCD0);
  -[UITextField endEditing:](self->_passcodeField, "endEditing:", 1);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  if (-[PasscodeEmbeddedViewController _useDotPattern](self, "_useDotPattern"))
  {
    v23 = v4;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_passcodeFieldBackground, "arrangedSubviews"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController traitCollection](self, "traitCollection"));
          if (objc_msgSend(v11, "userInterfaceStyle") == (id)2)
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
          else
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
          v13 = objc_retainAutorelease(v12);
          v14 = objc_msgSend(v13, "CGColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
          objc_msgSend(v15, "setBorderColor:", v14);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v7);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UITextField setTextColor:](self->_passcodeField, "setTextColor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController traitCollection](self, "traitCollection"));
    objc_msgSend(v17, "userInterfaceStyle");
    -[UIView setAlpha:](self->_passcodeFieldContainer, "setAlpha:", 1.0);

    v4 = v23;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedViewController traitCollection](self, "traitCollection"));
    if (objc_msgSend(v18, "userInterfaceStyle") == (id)2)
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor"));
    else
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayTintColor](UIColor, "systemLightGrayTintColor"));
    v20 = objc_retainAutorelease(v19);
    v21 = objc_msgSend(v20, "CGColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_passcodeFieldContainer, "layer"));
    objc_msgSend(v22, "setBackgroundColor:", v21);

  }
}

- (void)setPasscodeFocused:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  UITextField *passcodeField;
  int v9;
  const __CFString *v10;

  v3 = a3;
  v5 = LALogForCategory(0, a2, a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("off");
    if (v3)
      v7 = CFSTR("on");
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting passcode field focus %@", (uint8_t *)&v9, 0xCu);
  }

  passcodeField = self->_passcodeField;
  if (v3)
  {
    -[UITextField becomeFirstResponder](passcodeField, "becomeFirstResponder");
  }
  else
  {
    -[UITextField setText:](passcodeField, "setText:", &stru_10007CCD0);
    -[UITextField setDelegate:](self->_passcodeField, "setDelegate:", 0);
    -[UITextField endEditing:](self->_passcodeField, "endEditing:", 1);
    -[UITextField setDelegate:](self->_passcodeField, "setDelegate:", self);
  }
}

- (BOOL)verifyPasscode:(id)a3
{
  return 0;
}

- (void)setBackoffTimeout:(double)a3
{
  -[PasscodeEmbeddedViewController setBackoffTimeout:showBackoffTitle:passcodeFocused:](self, "setBackoffTimeout:showBackoffTitle:passcodeFocused:", 1, 1, a3);
}

- (void)setBackoffTimeout:(double)a3 showBackoffTitle:(BOOL)a4 passcodeFocused:(BOOL)a5
{
  _BOOL4 v6;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSBundle *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  BOOL v24;
  BOOL v25;
  _QWORD v26[6];
  uint8_t buf[4];
  const __CFString *v28;

  v6 = a4;
  v9 = a3 == 0.0;
  v10 = LALogForCategory(0, a2, a4);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = CFSTR("on");
    if (a3 == 0.0)
      v12 = CFSTR("off");
    *(_DWORD *)buf = 138412290;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Turning backoff UI %@", buf, 0xCu);
  }

  if (a3 == 0.0)
    v13 = -[PasscodeEmbeddedViewController _useDotPattern](self, "_useDotPattern");
  else
    v13 = 1;
  -[UIStackView setAxis:](self->_mainContainer, "setAxis:", v13);
  v14 = a3 == 0.0 || !v6;
  -[UIView setHidden:](self->_passcodeFieldContainer, "setHidden:", a3 != 0.0);
  -[UILabel setHidden:](self->_backoffTitle, "setHidden:", v14);
  -[UILabel setHidden:](self->_backoffSubtitle, "setHidden:", a3 == 0.0);
  if (a3 == 0.0)
  {
    -[UILabel setText:](self->_backoffTitle, "setText:", &stru_10007CCD0);
    -[UILabel setText:](self->_backoffSubtitle, "setText:", &stru_10007CCD0);
  }
  else
  {
    v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DEVICE_BLOCKED"), &stru_10007CCD0, CFSTR("MobileUI")));
    -[UILabel setText:](self->_backoffTitle, "setText:", v18);

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100021A10;
    v26[3] = &unk_10007A4C0;
    *(double *)&v26[5] = a3;
    v26[4] = self;
    v20 = sub_100021A10((uint64_t)v26, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[UILabel setText:](self->_backoffSubtitle, "setText:", v21);

  }
  objc_initWeak((id *)buf, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100021AC0;
  v22[3] = &unk_100079C10;
  objc_copyWeak(&v23, (id *)buf);
  v24 = v9;
  v25 = a5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  UITextField *passcodeField;

  passcodeField = self->_passcodeField;
  if (passcodeField == a3)
    objc_msgSend(a3, "resignFirstResponder");
  else
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Received delegate message for invalid text field (%@)"), a3);
  return passcodeField == a3;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  UITextField *v4;
  UITextField *v5;
  BOOL v6;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  _QWORD v12[5];
  UITextField *v13;

  v4 = (UITextField *)a3;
  v5 = v4;
  if (self->_passcodeField == v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](v4, "text"));
    v9 = objc_msgSend(v8, "length");

    if (!v9)
    {
      v6 = 1;
      goto LABEL_4;
    }
    if (!self->_animating)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](v5, "text"));
      v11 = -[PasscodeEmbeddedViewController verifyPasscode:](self, "verifyPasscode:", v10);

      v6 = 1;
      if ((v11 & 1) != 0)
        goto LABEL_4;
      self->_animating = 1;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100021CC0;
      v12[3] = &unk_10007A2B8;
      v12[4] = self;
      v13 = v5;
      -[PasscodeEmbeddedViewController _shakePasscodeFieldWithCompletion:](self, "_shakePasscodeFieldWithCompletion:", v12);

    }
  }
  else
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Received delegate message for invalid text field (%@)"), v4);
  }
  v6 = 0;
LABEL_4:

  return v6;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  UITextField *v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;

  length = a4.length;
  location = a4.location;
  v9 = (UITextField *)a3;
  v10 = a5;
  if (self->_passcodeField != v9)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Received delegate message for invalid text field (%@)"), v9);
    goto LABEL_10;
  }
  if (self->_animating)
    goto LABEL_10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](v9, "text"));
  v12 = objc_msgSend(v11, "length");
  if (v12 >= (id)-[PasscodeEmbeddedViewController passcodeLength](self, "passcodeLength"))
  {
    v13 = -[PasscodeEmbeddedViewController passcodeLength](self, "passcodeLength");

    if (v13)
      goto LABEL_8;
  }
  else
  {

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](v9, "text"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", location, length, v10));
  -[UITextField setText:](v9, "setText:", v15);

LABEL_8:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](v9, "text"));
  v17 = objc_msgSend(v16, "length");
  v18 = -[PasscodeEmbeddedViewController passcodeLength](self, "passcodeLength");

  if ((unint64_t)v17 >= v18)
    -[UITextField endEditing:](v9, "endEditing:", 1);
LABEL_10:

  return 0;
}

- (void)_selectPasscodeField:(id)a3
{
  if (objc_msgSend(a3, "numberOfTouches") == (id)1
    && -[UILabel isHidden](self->_backoffTitle, "isHidden"))
  {
    if (-[UILabel isHidden](self->_backoffSubtitle, "isHidden"))
      -[PasscodeEmbeddedViewController setPasscodeFocused:](self, "setPasscodeFocused:", 1);
  }
}

- (void)_shakePasscodeFieldWithCompletion:(id)a3
{
  id v4;
  UIView *passcodeFieldContainer;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v4 = a3;
  CGAffineTransformMakeTranslation(&v13, 30.0, 0.0);
  passcodeFieldContainer = self->_passcodeFieldContainer;
  v12 = v13;
  -[UIView setTransform:](passcodeFieldContainer, "setTransform:", &v12);
  -[UIImpactFeedbackGenerator impactOccurred](self->_hapticGenerator, "impactOccurred");
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000220B4;
  v9[3] = &unk_100079B80;
  objc_copyWeak(&v10, &location);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022114;
  v7[3] = &unk_10007A4E8;
  v6 = v4;
  v8 = v6;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v9, v7, 0.4, 0.0, 0.03, 1.2);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_submitPasscode:(id)a3
{
  -[PasscodeEmbeddedViewController textFieldShouldEndEditing:](self, "textFieldShouldEndEditing:", self->_passcodeField);
}

- (BOOL)_useDotPattern
{
  return -[PasscodeEmbeddedViewController passcodeLength](self, "passcodeLength") != -1
      && -[PasscodeEmbeddedViewController passcodeLength](self, "passcodeLength") < 7;
}

- (unint64_t)passcodeLength
{
  void *v2;
  id v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LAPasscodeHelper sharedInstance](LAPasscodeHelper, "sharedInstance"));
  v3 = objc_msgSend(v2, "passcodeType");

  v4 = 6;
  if (v3 != (id)2)
    v4 = -1;
  if (v3 == (id)1)
    return 4;
  else
    return v4;
}

- (BOOL)hasAlphaNumericPasscode
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LAPasscodeHelper sharedInstance](LAPasscodeHelper, "sharedInstance"));
  v3 = objc_msgSend(v2, "passcodeType") == (id)4;

  return v3;
}

- (int64_t)alphanumericFieldTextAlignment
{
  return 4;
}

- (id)alphanumericFieldPlaceholder
{
  id v3;
  uint64_t v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc((Class)NSAttributedString);
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ENTER_PASSCODE"), &stru_10007CCD0, CFSTR("MobileUI")));
  v8 = objc_msgSend(v3, "initWithString:", v7);

  return v8;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (UITextField)passcodeField
{
  return self->_passcodeField;
}

- (void)setPasscodeField:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeField, 0);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_storeStrong((id *)&self->_backoffSubtitle, 0);
  objc_storeStrong((id *)&self->_backoffTitle, 0);
  objc_storeStrong((id *)&self->_passcodeFieldBackground, 0);
  objc_storeStrong((id *)&self->_passcodeFieldContainer, 0);
  objc_storeStrong((id *)&self->_mainContainer, 0);
}

@end
