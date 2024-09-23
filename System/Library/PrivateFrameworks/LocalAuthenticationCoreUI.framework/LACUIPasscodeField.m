@implementation LACUIPasscodeField

- (LACUIPasscodeField)initWithStyle:(int64_t)a3
{
  LACUIPasscodeField *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LACUIPasscodeField;
  result = -[LACUIPasscodeField init](&v5, sel_init);
  if (result)
    result->_style = a3;
  return result;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[LACUIPasscodeField setView:](self, "setView:", v3);

  -[LACUIPasscodeField view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__selectPasscodeField_);
  objc_msgSend(v4, "addGestureRecognizer:", v5);

  -[LACUIPasscodeField _setup](self, "_setup");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LACUIPasscodeField;
  -[LACUIPasscodeField viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", &stru_2510F9FD8);

  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEditing:", 1);

}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[LACUIPasscodeField _setup](self, "_setup");
    -[LACUIPasscodeField _notifyPasscodeFieldLengthChange](self, "_notifyPasscodeFieldLengthChange");
  }
}

- (void)setAcceptInputs:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  id v6;

  -[LACUIPasscodeField setIgnoreInputs:](self, "setIgnoreInputs:", !a3);
  if (!-[LACUIPasscodeField _useDotPattern](self, "_useDotPattern"))
  {
    v4 = -[LACUIPasscodeField ignoreInputs](self, "ignoreInputs");
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    -[LACUIPasscodeField passcodeField](self, "passcodeField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v6);

    if (v4)
  }
}

- (void)shakeWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  id WeakRetained;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  _QWORD v10[4];
  id v11;
  id location;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v4 = (void (**)(_QWORD))a3;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v4[2](v4);
  }
  else
  {
    CGAffineTransformMakeTranslation(&v14, 30.0, 0.0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeFieldContainer);
    v13 = v14;
    objc_msgSend(WeakRetained, "setTransform:", &v13);

    -[UIImpactFeedbackGenerator impactOccurred](self->_hapticGenerator, "impactOccurred");
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x24BEBDB00];
    v7 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __42__LACUIPasscodeField_shakeWithCompletion___block_invoke;
    v10[3] = &unk_2510F8300;
    objc_copyWeak(&v11, &location);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __42__LACUIPasscodeField_shakeWithCompletion___block_invoke_2;
    v8[3] = &unk_2510F8328;
    v9 = v4;
    objc_msgSend(v6, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v10, v8, 0.4, 0.0, 0.03, 1.2);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __42__LACUIPasscodeField_shakeWithCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  __int128 v4;
  _OWORD v5[3];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 122);
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v5[0] = *MEMORY[0x24BDBD8B8];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v3, "setTransform:", v5);

  }
}

uint64_t __42__LACUIPasscodeField_shakeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)submit
{
  id v3;

  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[LACUIPasscodeField _verifyTextField:](self, "_verifyTextField:", v3);

}

- (void)clear
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[LACUIPasscodeField passcodeField](self, "passcodeField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", &stru_2510F9FD8);

    -[LACUIPasscodeField _notifyPasscodeFieldLengthChange](self, "_notifyPasscodeFieldLengthChange");
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return !-[LACUIPasscodeField ignoreInputs](self, "ignoreInputs", a3);
}

- (void)textFieldDidChange:(id)a3
{
  id v4;

  v4 = a3;
  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  if ((id)objc_claimAutoreleasedReturnValue() != v4)
    -[LACUIPasscodeField textFieldDidChange:].cold.1();

  -[LACUIPasscodeField _notifyPasscodeFieldLengthChange](self, "_notifyPasscodeFieldLengthChange");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;

  v4 = a3;
  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  if ((id)objc_claimAutoreleasedReturnValue() != v4)
    -[LACUIPasscodeField textFieldShouldReturn:].cold.1();

  if (!-[LACUIPasscodeField ignoreInputs](self, "ignoreInputs"))
    -[LACUIPasscodeField _verifyTextField:](self, "_verifyTextField:", v4);

  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  if ((id)objc_claimAutoreleasedReturnValue() != v9)
    -[LACUIPasscodeField textField:shouldChangeCharactersInRange:replacementString:].cold.1();

  if (!-[LACUIPasscodeField ignoreInputs](self, "ignoreInputs"))
  {
    if (-[LACUIPasscodeField _hasAlphanumericPasscode](self, "_hasAlphanumericPasscode")
      || (objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "length"),
          v12,
          v11,
          !v13))
    {
      objc_msgSend(v9, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");
      if (v15 >= -[LACUIPasscodeField _passcodeLength](self, "_passcodeLength"))
      {
        v16 = -[LACUIPasscodeField _passcodeLength](self, "_passcodeLength");

        if (v16)
          goto LABEL_9;
      }
      else
      {

      }
      objc_msgSend(v9, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByReplacingCharactersInRange:withString:", location, length, v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v18);

      -[LACUIPasscodeField _notifyPasscodeFieldLengthChange](self, "_notifyPasscodeFieldLengthChange");
LABEL_9:
      objc_msgSend(v9, "text");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");
      v21 = -[LACUIPasscodeField _passcodeLength](self, "_passcodeLength");

      if (v20 >= v21)
        -[LACUIPasscodeField _verifyTextField:](self, "_verifyTextField:", v9);
    }
  }

  return 0;
}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BEBD748];
  objc_msgSend(MEMORY[0x24BDBCE30], "array", a3, a4.location, a4.length, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuWithChildren:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "keyCode");

  if (v11 == 40 && !-[LACUIPasscodeField ignoreInputs](self, "ignoreInputs"))
  {
    -[LACUIPasscodeField submit](self, "submit");
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)LACUIPasscodeField;
    -[LACUIPasscodeField pressesEnded:withEvent:](&v12, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (void)_selectPasscodeField:(id)a3
{
  if (objc_msgSend(a3, "numberOfTouches") == 1 && !-[LACUIPasscodeField ignoreInputs](self, "ignoreInputs"))
    -[LACUIPasscodeField becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)_setup
{
  UIStackView **p_mainContainer;
  id WeakRetained;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIImpactFeedbackGenerator *v23;
  UIImpactFeedbackGenerator *hapticGenerator;
  id v25;
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
  LAUITextField *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
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
  _BOOL4 v62;
  double v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  unint64_t v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
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
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[4];
  id v100;
  id from;
  void *v102;
  _QWORD v103[6];

  v103[4] = *MEMORY[0x24BDAC8D0];
  p_mainContainer = &self->_mainContainer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainContainer);
  objc_msgSend(WeakRetained, "removeFromSuperview");

  v5 = objc_alloc_init(MEMORY[0x24BEBD978]);
  objc_storeWeak((id *)p_mainContainer, v5);
  objc_msgSend(v5, "setAxis:", 0);
  objc_msgSend(v5, "setAlignment:", 3);
  v96 = v5;
  objc_msgSend(v5, "setSpacing:", 8.0);
  -[LACUIPasscodeField view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIPasscodeField view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  objc_msgSend(v96, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIPasscodeField view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  objc_msgSend(v96, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIPasscodeField view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  objc_msgSend(v96, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIPasscodeField view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  v23 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD670]), "initWithStyle:", 2);
  hapticGenerator = self->_hapticGenerator;
  self->_hapticGenerator = v23;

  -[UIImpactFeedbackGenerator prepare](self->_hapticGenerator, "prepare");
  v25 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_storeWeak((id *)&self->_passcodeFieldContainer, v25);
  objc_msgSend(v96, "addArrangedSubview:", v25);
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v98 = v25;
  objc_msgSend(v25, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:", 60.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("arrow.forward.circle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setImage:forState:", v28, 0);

  objc_msgSend(v97, "addTarget:action:forControlEvents:", self, sel_submit, 64);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setTintColor:", v29);

  objc_msgSend(v98, "addSubview:", v97);
  objc_msgSend(v97, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v92 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v97, "widthAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToConstant:", 40.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v94;
  objc_msgSend(v97, "heightAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v31;
  objc_msgSend(v97, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v34;
  objc_msgSend(v97, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v103[3] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "activateConstraints:", v38);

  objc_msgSend(v97, "_setCornerRadius:", 20.0);
  objc_msgSend(v97, "setHidden:", -[LACUIPasscodeField _shouldShowSubmitButton](self, "_shouldShowSubmitButton") ^ 1);
  v39 = objc_alloc_init(LAUITextField);
  objc_storeWeak((id *)&self->_passcodeField, v39);
  -[LAUITextField setShouldHideEditMenu:](v39, "setShouldHideEditMenu:", -[LACUIPasscodeField _hasAlphanumericPasscode](self, "_hasAlphanumericPasscode") ^ 1);
  -[LAUITextField disablePrediction](v39, "disablePrediction");
  -[LAUITextField setDelegate:](v39, "setDelegate:", self);
  -[LAUITextField setDevicePasscodeEntry:](v39, "setDevicePasscodeEntry:", 1);
  -[LAUITextField setSecureTextEntry:](v39, "setSecureTextEntry:", 1);
  -[LAUITextField setTextContentType:](v39, "setTextContentType:", *MEMORY[0x24BEBE800]);
  -[LAUITextField setAutocapitalizationType:](v39, "setAutocapitalizationType:", 0);
  -[LAUITextField setAutocorrectionType:](v39, "setAutocorrectionType:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE248]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAUITextField setFont:](v39, "setFont:", v40);

  -[LACUIPasscodeField _alphanumericFieldPlaceholder](self, "_alphanumericFieldPlaceholder");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAUITextField setAttributedPlaceholder:](v39, "setAttributedPlaceholder:", v41);

  -[LAUITextField setTextAlignment:](v39, "setTextAlignment:", -[LACUIPasscodeField _alphanumericFieldTextAlignment](self, "_alphanumericFieldTextAlignment"));
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAUITextField setTextColor:](v39, "setTextColor:", v42);

  -[LAUITextField setReturnKeyType:](v39, "setReturnKeyType:", 9);
  if (-[LACUIPasscodeField _hasAlphanumericPasscode](self, "_hasAlphanumericPasscode"))
  {
    v43 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "userInterfaceIdiom");

    if ((v45 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v43 = 4;
    else
      v43 = 127;
  }
  -[LAUITextField setKeyboardType:](v39, "setKeyboardType:", v43);
  -[LACUIPasscodeField traitCollection](self, "traitCollection");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v46, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "quaternaryLabelColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayTintColor");
  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v48 = objc_msgSend(v47, "CGColor");
  objc_msgSend(v98, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setBackgroundColor:", v48);

  objc_msgSend(v98, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setCornerRadius:", 10.0);

  -[LAUITextField addTarget:action:forControlEvents:](v39, "addTarget:action:forControlEvents:", self, sel_textFieldDidChange_, 0x20000);
  objc_msgSend(v98, "addSubview:", v39);
  -[LAUITextField setTranslatesAutoresizingMaskIntoConstraints:](v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[LAUITextField topAnchor](v39, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, 15.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setActive:", 1);

  -[LAUITextField bottomAnchor](v39, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, -15.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 1);

  -[LAUITextField leadingAnchor](v39, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, 15.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setActive:", 1);

  -[LAUITextField trailingAnchor](v39, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[LACUIPasscodeField _shouldShowSubmitButton](self, "_shouldShowSubmitButton");
  v63 = -40.0;
  if (!v62)
    v63 = -15.0;
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setActive:", 1);

  if (-[LACUIPasscodeField _useDotPattern](self, "_useDotPattern"))
  {
    v65 = objc_loadWeakRetained((id *)&self->_passcodeFieldContainer);
    objc_msgSend(v65, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v66, "setBackgroundColor:", objc_msgSend(v67, "CGColor"));

    v68 = objc_alloc_init(MEMORY[0x24BEBD978]);
    objc_storeWeak((id *)&self->_passcodeFieldBackground, v68);
    objc_msgSend(v68, "setAxis:", 0);
    objc_msgSend(v68, "setSpacing:", 21.0);
    objc_msgSend(v68, "setSemanticContentAttribute:", 3);
    if (-[LACUIPasscodeField _passcodeLength](self, "_passcodeLength"))
    {
      v69 = 0;
      do
      {
        v70 = objc_alloc_init(MEMORY[0x24BEBDB00]);
        -[LACUIPasscodeField traitCollection](self, "traitCollection");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v71, "userInterfaceStyle") == 2)
          objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
        else
          objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
        v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v73 = objc_msgSend(v72, "CGColor");
        objc_msgSend(v70, "layer");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setBorderColor:", v73);

        objc_msgSend(v70, "layer");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setBorderWidth:", 1.25);

        objc_msgSend(v70, "layer");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setCornerRadius:", 10.0);

        objc_msgSend(v68, "addArrangedSubview:", v70);
        objc_msgSend(v70, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v70, "widthAnchor");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "constraintEqualToConstant:", 20.0);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setActive:", 1);

        objc_msgSend(v70, "heightAnchor");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "constraintEqualToConstant:", 20.0);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "setActive:", 1);

        ++v69;
      }
      while (v69 < -[LACUIPasscodeField _passcodeLength](self, "_passcodeLength"));
    }
    objc_msgSend(v98, "addSubview:", v68);
    objc_msgSend(v68, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v68, "centerXAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "centerXAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setActive:", 1);

    objc_msgSend(v68, "centerYAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "centerYAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setActive:", 1);

    -[LAUITextField setShouldHideSelectionRects:](v39, "setShouldHideSelectionRects:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAUITextField setTintColor:](v39, "setTintColor:", v87);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAUITextField setTextColor:](v39, "setTextColor:", v88);

  }
  objc_initWeak(&from, self);
  objc_opt_self();
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v89;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v102, 1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = MEMORY[0x24BDAC760];
  v99[1] = 3221225472;
  v99[2] = __28__LACUIPasscodeField__setup__block_invoke;
  v99[3] = &unk_2510F8350;
  objc_copyWeak(&v100, &from);
  v91 = (id)-[LACUIPasscodeField registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v90, v99);

  objc_destroyWeak(&v100);
  objc_destroyWeak(&from);

}

void __28__LACUIPasscodeField__setup__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTraitChanges");

}

- (BOOL)_useDotPattern
{
  return -[LACUIPasscodeField _passcodeLength](self, "_passcodeLength") != -1
      && -[LACUIPasscodeField _passcodeLength](self, "_passcodeLength") < 7;
}

- (void)_updateDotPattern
{
  void *v3;
  _QWORD v4[5];

  if (-[LACUIPasscodeField _useDotPattern](self, "_useDotPattern"))
  {
    -[LACUIPasscodeField traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __39__LACUIPasscodeField__updateDotPattern__block_invoke;
    v4[3] = &unk_2510F8298;
    v4[4] = self;
    objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

  }
}

unint64_t __39__LACUIPasscodeField__updateDotPattern__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t result;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  result = objc_msgSend(*(id *)(a1 + 32), "_passcodeLength");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      if (i >= v4)
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      else
        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "userInterfaceStyle") == 2)
        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      else
        objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 984));
      objc_msgSend(WeakRetained, "arrangedSubviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_retainAutorelease(v7);
      objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

      objc_msgSend(v12, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_retainAutorelease(v9);
      objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

      result = objc_msgSend(*(id *)(a1 + 32), "_passcodeLength");
    }
  }
  return result;
}

- (BOOL)_shouldShowSubmitButton
{
  -[LACUIPasscodeField _useDotPattern](self, "_useDotPattern");
  return 0;
}

- (unint64_t)_passcodeLength
{
  int64_t style;
  unint64_t v3;

  style = self->_style;
  v3 = 4;
  if (style != 1)
    v3 = -1;
  if (style == 2)
    return 6;
  else
    return v3;
}

- (BOOL)_hasAlphanumericPasscode
{
  return self->_style == 0;
}

- (int64_t)_alphanumericFieldTextAlignment
{
  return 1;
}

- (id)_alphanumericFieldPlaceholder
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD1458]);
  -[LACUIPasscodeField placeholderText](self, "placeholderText");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_2510F9FD8;
  v7 = *MEMORY[0x24BEBB3A8];
  v13[4] = self;
  v14[0] = v7;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__LACUIPasscodeField__alphanumericFieldPlaceholder__block_invoke;
  v13[3] = &unk_2510F8378;
  __51__LACUIPasscodeField__alphanumericFieldPlaceholder__block_invoke((uint64_t)v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v14[1] = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithString:attributes:", v6, v10);

  return v11;
}

id __51__LACUIPasscodeField__alphanumericFieldPlaceholder__block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v2, "setAlignment:", objc_msgSend(*(id *)(a1 + 32), "_alphanumericFieldTextAlignment"));
  return v2;
}

- (void)_verifyTextField:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LACUIPasscodeField delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "passcodeField:didSubmitPasscode:", self, v5);
}

- (void)_notifyPasscodeFieldLengthChange
{
  void *v3;
  void *v4;
  void *v5;

  -[LACUIPasscodeField delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIPasscodeField passcodeField](self, "passcodeField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodeField:didChangePasscodeLength:", self, objc_msgSend(v5, "length"));

  -[LACUIPasscodeField _updateDotPattern](self, "_updateDotPattern");
}

- (void)_handleTraitChanges
{
  void *v3;
  id v4;
  id v5;
  id WeakRetained;

  if (-[LACUIPasscodeField _useDotPattern](self, "_useDotPattern"))
  {
    -[LACUIPasscodeField _updateDotPattern](self, "_updateDotPattern");
    WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeFieldContainer);
    objc_msgSend(WeakRetained, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeFieldContainer);
    objc_msgSend(WeakRetained, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUIPasscodeField traitCollection](self, "traitCollection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x24BEBD4B8], "quaternaryLabelColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayTintColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  }
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderText, a3);
}

- (LACUIPasscodeFieldDelegate)delegate
{
  return (LACUIPasscodeFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)canShowInLockScreen
{
  return self->_canShowInLockScreen;
}

- (void)setCanShowInLockScreen:(BOOL)a3
{
  self->_canShowInLockScreen = a3;
}

- (BOOL)ignoreInputs
{
  return self->_ignoreInputs;
}

- (void)setIgnoreInputs:(BOOL)a3
{
  self->_ignoreInputs = a3;
}

- (LAUITextField)passcodeField
{
  return (LAUITextField *)objc_loadWeakRetained((id *)&self->_passcodeField);
}

- (void)setPasscodeField:(id)a3
{
  objc_storeWeak((id *)&self->_passcodeField, a3);
}

- (unint64_t)passcodeLength
{
  return self->_passcodeLength;
}

- (BOOL)hasAlphanumericPasscode
{
  return self->_hasAlphanumericPasscode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passcodeField);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_destroyWeak((id *)&self->_passcodeFieldBackground);
  objc_destroyWeak((id *)&self->_passcodeFieldContainer);
  objc_destroyWeak((id *)&self->_mainContainer);
}

- (void)textFieldDidChange:.cold.1()
{
  __assert_rtn("-[LACUIPasscodeField textFieldDidChange:]", "LACUIPasscodeField.m", 176, "textField == self.passcodeField");
}

- (void)textFieldShouldReturn:.cold.1()
{
  __assert_rtn("-[LACUIPasscodeField textFieldShouldReturn:]", "LACUIPasscodeField.m", 182, "textField == self.passcodeField");
}

- (void)textField:shouldChangeCharactersInRange:replacementString:.cold.1()
{
  __assert_rtn("-[LACUIPasscodeField textField:shouldChangeCharactersInRange:replacementString:]", "LACUIPasscodeField.m", 192, "textField == self.passcodeField");
}

@end
