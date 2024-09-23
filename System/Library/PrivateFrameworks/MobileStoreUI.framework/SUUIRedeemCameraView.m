@implementation SUUIRedeemCameraView

- (SUUIRedeemCameraView)initWithClientContext:(id)a3
{
  id v5;
  SUUIRedeemCameraView *v6;
  SUUIRedeemCameraView *v7;
  SUUIRedeemCameraLandingView *v8;
  SUUIRedeemCameraLandingView *landingView;
  void *v10;
  void *v11;
  uint64_t v12;
  SUUIRedeemTextField *textField;
  void *v14;
  uint64_t v15;
  SUUIRedeemTextField *inputAccessoryTextField;
  id v17;
  UIView *v18;
  UIView *overlay;
  UIView *v20;
  void *v21;
  SUUILinkButton *v22;
  UIButton *termsButton;
  UIButton *v24;
  void *v25;
  void *v26;
  void *v27;
  UIButton *v28;
  void *v29;
  UIButton *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SUUIRedeemCameraView;
  v6 = -[SUUIRedeemCameraView init](&v34, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = -[SUUIRedeemCameraLandingView initWithClientContext:]([SUUIRedeemCameraLandingView alloc], "initWithClientContext:", v5);
    landingView = v7->_landingView;
    v7->_landingView = v8;

    -[SUUIRedeemCameraLandingView button](v7->_landingView, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", v7, sel__landingButtonAction_, 64);

    -[SUUIRedeemCameraView addSubview:](v7, "addSubview:", v7->_landingView);
    -[SUUIRedeemCameraView tintColor](v7, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SUUIRedeemCameraView _newTextFieldWithClientContext:placeholderColor:](v7, "_newTextFieldWithClientContext:placeholderColor:", v5, v11);
    textField = v7->_textField;
    v7->_textField = (SUUIRedeemTextField *)v12;

    -[SUUIRedeemTextField setDelegate:](v7->_textField, "setDelegate:", v7);
    -[SUUIRedeemCameraView addSubview:](v7, "addSubview:", v7->_textField);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SUUIRedeemCameraView _newTextFieldWithClientContext:placeholderColor:](v7, "_newTextFieldWithClientContext:placeholderColor:", v5, v14);
    inputAccessoryTextField = v7->_inputAccessoryTextField;
    v7->_inputAccessoryTextField = (SUUIRedeemTextField *)v15;

    -[SUUIRedeemTextField setDelegate:](v7->_inputAccessoryTextField, "setDelegate:", v7);
    -[SUUIRedeemTextField setEnablesReturnKeyAutomatically:](v7->_inputAccessoryTextField, "setEnablesReturnKeyAutomatically:", 1);
    -[SUUIRedeemTextField setBackdropBackground:](v7->_inputAccessoryTextField, "setBackdropBackground:", 1);
    -[SUUIRedeemTextField setInputAccessoryView:](v7->_textField, "setInputAccessoryView:", v7->_inputAccessoryTextField);
    v17 = objc_alloc_init(MEMORY[0x24BEBDA20]);
    objc_msgSend(v17, "addTarget:action:", v7, sel__tapGestureAction_);
    v18 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    overlay = v7->_overlay;
    v7->_overlay = v18;

    v20 = v7->_overlay;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    -[UIView setAlpha:](v7->_overlay, "setAlpha:", 0.0);
    -[UIView addGestureRecognizer:](v7->_overlay, "addGestureRecognizer:", v17);
    v22 = -[SUUILinkButton initWithArrowStyle:]([SUUILinkButton alloc], "initWithArrowStyle:", 0);
    termsButton = v7->_termsButton;
    v7->_termsButton = &v22->super;

    v24 = v7->_termsButton;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("REDEEM_TERMS_LINK"), CFSTR("Redeem"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_TERMS_LINK"), 0, CFSTR("Redeem"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v24, "setTitle:forState:", v25, 0);

    -[UIButton titleLabel](v7->_termsButton, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v27);

    v28 = v7->_termsButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v28, "setTitleColor:forState:", v29, 0);

    v30 = v7->_termsButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v30, "setTitleColor:forState:", v31, 1);

    -[UIButton addTarget:action:forControlEvents:](v7->_termsButton, "addTarget:action:forControlEvents:", v7, sel__termsButtonAction_, 64);
    -[SUUIRedeemCameraView addSubview:](v7, "addSubview:", v7->_termsButton);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, sel_keyboardWillShow_, *MEMORY[0x24BEBE580], 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, sel_keyboardDidShow_, *MEMORY[0x24BEBE448], 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, sel_keyboardWillHide_, *MEMORY[0x24BEBE578], 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, sel_keyboardDidHide_, *MEMORY[0x24BEBE440], 0);
    objc_msgSend(v32, "addObserver:selector:name:object:", v7, sel_textFieldTextDidChange_, *MEMORY[0x24BEBE868], v7->_inputAccessoryTextField);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE580], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE448], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE578], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE440], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE868], 0);
  -[SUUIRedeemTextField setDelegate:](self->_textField, "setDelegate:", 0);
  -[SUUIRedeemTextField setDelegate:](self->_inputAccessoryTextField, "setDelegate:", 0);
  -[SUUIRedeemITunesPassLockup removeTarget:action:forControlEvents:](self->_iTunesPassLockup, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v4.receiver = self;
  v4.super_class = (Class)SUUIRedeemCameraView;
  -[SUUIRedeemCameraView dealloc](&v4, sel_dealloc);
}

- (UIImage)image
{
  return -[SUUIRedeemCameraLandingView image](self->_landingView, "image");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  SUUIRedeemTextField *textField;
  void *v6;
  SUUIRedeemTextField *inputAccessoryTextField;
  void *v8;
  void *v9;

  v3 = a3;
  textField = self->_textField;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemTextField setTextColor:](textField, "setTextColor:", v6);

    inputAccessoryTextField = self->_inputAccessoryTextField;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.392156863, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemTextField setTextColor:](textField, "setTextColor:", v8);

    inputAccessoryTextField = self->_inputAccessoryTextField;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.392156863, 1.0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemTextField setTextColor:](inputAccessoryTextField, "setTextColor:", v9);

  -[SUUIRedeemTextField setEnabled:](self->_textField, "setEnabled:", v3);
  -[SUUIRedeemTextField setEnabled:](self->_inputAccessoryTextField, "setEnabled:", v3);
  -[SUUIRedeemCameraView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
}

- (void)setImage:(id)a3
{
  -[SUUIRedeemCameraLandingView setImage:](self->_landingView, "setImage:", a3);
}

- (void)setITunesPassConfiguration:(id)a3
{
  SUUIITunesPassConfiguration **p_iTunesPassConfiguration;
  SUUIRedeemITunesPassLockup *iTunesPassLockup;
  SUUIRedeemITunesPassLockup *v7;
  SUUIRedeemITunesPassLockup *v8;
  SUUIITunesPassConfiguration *v9;

  p_iTunesPassConfiguration = &self->_iTunesPassConfiguration;
  v9 = (SUUIITunesPassConfiguration *)a3;
  if (*p_iTunesPassConfiguration != v9)
  {
    -[SUUIRedeemITunesPassLockup removeTarget:action:forControlEvents:](self->_iTunesPassLockup, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
    -[SUUIRedeemITunesPassLockup removeFromSuperview](self->_iTunesPassLockup, "removeFromSuperview");
    iTunesPassLockup = self->_iTunesPassLockup;
    self->_iTunesPassLockup = 0;

    objc_storeStrong((id *)&self->_iTunesPassConfiguration, a3);
    if (*p_iTunesPassConfiguration)
    {
      v7 = -[SUUIRedeemITunesPassLockup initWithITunesPassConfiguration:clientContext:]([SUUIRedeemITunesPassLockup alloc], "initWithITunesPassConfiguration:clientContext:", *p_iTunesPassConfiguration, self->_clientContext);
      v8 = self->_iTunesPassLockup;
      self->_iTunesPassLockup = v7;

      -[SUUIRedeemITunesPassLockup addTarget:action:forControlEvents:](self->_iTunesPassLockup, "addTarget:action:forControlEvents:", self, sel__iTunesPassLearnMoreAction_, 64);
      -[SUUIRedeemCameraView addSubview:](self, "addSubview:", self->_iTunesPassLockup);
    }
  }

}

- (void)setText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  -[SUUIRedeemTextField text](self->_textField, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v9);

  if ((v5 & 1) == 0)
    -[SUUIRedeemTextField setText:](self->_textField, "setText:", v9);
  -[SUUIRedeemTextField text](self->_inputAccessoryTextField, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v9);

  if ((v7 & 1) == 0)
    -[SUUIRedeemTextField setText:](self->_inputAccessoryTextField, "setText:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "SUUIRedeemCameraView:textFieldDidChange:", self, v9);

}

- (void)showKeyboard
{
  -[SUUIRedeemTextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (NSString)text
{
  return (NSString *)-[SUUIRedeemTextField text](self->_inputAccessoryTextField, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id *p_textField;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  _BOOL8 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double MaxY;
  CGFloat v41;
  float v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  -[SUUIRedeemCameraView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_overlay, "setFrame:");
  p_textField = (id *)&self->_textField;
  -[SUUIRedeemTextField frame](self->_textField, "frame");
  v13 = v12;
  v15 = v14;
  if (-[SUUIRedeemCameraView _isShowingRedeemer](self, "_isShowingRedeemer"))
  {
    -[UIView setFrame:](self->_redeemerView, "setFrame:", v4, v6, v8, v10);
    v16 = v10 - v15;
  }
  else
  {
    v49 = v13;
    if (self->_iTunesPassLockup)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v19 = v18;

      v20 = v19 <= 480.0;
      v21 = 20.0;
      if (v19 <= 480.0)
        v21 = 10.0;
      v48 = v21;
      if (v19 > 480.0)
        v22 = 30.0;
      else
        v22 = 17.0;
      -[SUUIRedeemITunesPassLockup frame](self->_iTunesPassLockup, "frame");
      -[SUUIRedeemITunesPassLockup sizeThatFits:](self->_iTunesPassLockup, "sizeThatFits:", v8 + -60.0, 1.79769313e308);
      v44 = v23;
      v45 = v24;
      v25 = v15 + v22 + v24;
      v43 = v22;
    }
    else
    {
      v44 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v45 = *(double *)(MEMORY[0x24BDBF090] + 24);
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bounds");
      v28 = v27 > 480.0;

      v20 = 0;
      v48 = dbl_241EFBCB0[v28];
      v43 = 0.0;
      v22 = 30.0;
      v25 = v15;
    }
    -[SUUIRedeemCameraLandingView frame](self->_landingView, "frame");
    v30 = v29;
    -[SUUIRedeemCameraLandingView setSpacingStyle:](self->_landingView, "setSpacingStyle:", v20);
    -[SUUIRedeemCameraLandingView sizeThatFits:](self->_landingView, "sizeThatFits:", v8, v10);
    v32 = v31;
    v34 = v33;
    v35 = v25 + v48 + v33;
    -[UIButton frame](self->_termsButton, "frame");
    -[UIButton sizeThatFits:](self->_termsButton, "sizeThatFits:", v8, v10);
    v46 = v37;
    v47 = v36;
    v50 = v22;
    *(float *)&v36 = (v10 - (v35 + v22 + v37)) * 0.5;
    v38 = floorf(*(float *)&v36);
    -[SUUIRedeemCameraLandingView setFrame:](self->_landingView, "setFrame:", v30, v38, v32, v34);
    v51.origin.x = v30;
    v51.origin.y = v38;
    v51.size.width = v32;
    v51.size.height = v34;
    v39 = v48 + CGRectGetMaxY(v51);
    objc_msgSend(*p_textField, "setFrame:", v49, v39, v8, v15);
    v52.origin.x = v49;
    v52.origin.y = v39;
    v52.size.width = v8;
    v52.size.height = v15;
    MaxY = CGRectGetMaxY(v52);
    if (self->_iTunesPassLockup)
    {
      v53.origin.x = v49;
      v53.origin.y = v39;
      v53.size.width = v8;
      v53.size.height = v15;
      v41 = v43 + CGRectGetMaxY(v53);
      -[SUUIRedeemITunesPassLockup setFrame:](self->_iTunesPassLockup, "setFrame:", 30.0, v41, v44, v45);
      v54.origin.x = 30.0;
      v54.origin.y = v41;
      v54.size.width = v44;
      v54.size.height = v45;
      MaxY = CGRectGetMaxY(v54);
    }
    v15 = v46;
    v42 = (v8 - v47) * 0.5;
    v13 = roundf(v42);
    v16 = v50 + MaxY;
    p_textField = (id *)&self->_termsButton;
    v8 = v47;
  }
  objc_msgSend(*p_textField, "setFrame:", v13, v16, v8, v15);
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  UIView *overlay;
  void *v6;
  _QWORD v7[5];

  if (self->_displayRedeem)
  {
    -[SUUIRedeemTextField text](self->_textField, "text", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemCameraView setText:](self, "setText:", v4);

    -[SUUIRedeemCameraView _pauseRedeemer](self, "_pauseRedeemer");
    -[SUUIRedeemCameraView addSubview:](self, "addSubview:", self->_overlay);
    -[SUUIRedeemCameraView setNeedsLayout](self, "setNeedsLayout");
    overlay = self->_overlay;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](overlay, "setBackgroundColor:", v6);

    -[UIView setAlpha:](self->_overlay, "setAlpha:", 0.0);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __41__SUUIRedeemCameraView_keyboardWillShow___block_invoke;
    v7[3] = &unk_2511F47C0;
    v7[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v7, 0.2);
  }
}

uint64_t __41__SUUIRedeemCameraView_keyboardWillShow___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  int v3;
  double v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[58];
  v3 = objc_msgSend(v1, "_isShowingRedeemer");
  v4 = 0.7;
  if (v3)
    v4 = 0.4;
  return objc_msgSend(v2, "setAlpha:", v4);
}

- (void)keyboardDidShow:(id)a3
{
  if (self->_displayRedeem)
    -[SUUIRedeemTextField becomeFirstResponder](self->_inputAccessoryTextField, "becomeFirstResponder", a3);
}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (!self->_displayRedeem)
  {
    -[SUUIRedeemTextField text](self->_inputAccessoryTextField, "text", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemCameraView setText:](self, "setText:", v4);

    v5[4] = self;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41__SUUIRedeemCameraView_keyboardWillHide___block_invoke;
    v6[3] = &unk_2511F47C0;
    v6[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __41__SUUIRedeemCameraView_keyboardWillHide___block_invoke_2;
    v5[3] = &unk_2511F4908;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v6, v5, 0.2);
  }
}

uint64_t __41__SUUIRedeemCameraView_keyboardWillHide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
}

uint64_t __41__SUUIRedeemCameraView_keyboardWillHide___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 464), "removeFromSuperview");
  return result;
}

- (void)textFieldTextDidChange:(id)a3
{
  id v4;

  -[SUUIRedeemTextField text](self->_inputAccessoryTextField, "text", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemCameraView setText:](self, "setText:", v4);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  if (self->_textField == a3)
    self->_displayRedeem = 1;
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  SUUIRedeemCameraViewDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "SUUIRedeemCameraView:textFieldDidRedeem:", self, v7);
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  if (self->_textField == a3)
    self->_displayRedeem = 0;
  return 1;
}

- (void)_iTunesPassLearnMoreAction:(id)a3
{
  id v4;

  -[SUUIRedeemCameraView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "showITunesPassLearnMoreForSUUIRedeemCameraView:", self);

}

- (void)_landingButtonAction:(id)a3
{
  -[SUUIRedeemCameraView setText:](self, "setText:", &stru_2511FF0C8);
  -[SUUIRedeemCameraView _showRedeemer:](self, "_showRedeemer:", 1);
}

- (void)_tapGestureAction:(id)a3
{
  if (-[SUUIRedeemCameraView _isShowingRedeemer](self, "_isShowingRedeemer", a3))
  {
    -[SUUIRedeemCameraView setText:](self, "setText:", &stru_2511FF0C8);
    -[SUUIRedeemCameraView _hideKeyboard](self, "_hideKeyboard");
    -[SUUIRedeemCameraView _resumeRedeemer](self, "_resumeRedeemer");
  }
  else
  {
    -[SUUIRedeemCameraView _hideKeyboard](self, "_hideKeyboard");
  }
}

- (void)_termsButtonAction:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "termsAndConditionsURL", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SUUIMetricsOpenURL(v3);

}

- (void)_hideKeyboard
{
  -[SUUIRedeemTextField resignFirstResponder](self->_inputAccessoryTextField, "resignFirstResponder");
  -[SUUIRedeemTextField resignFirstResponder](self->_textField, "resignFirstResponder");
}

- (BOOL)_isShowingRedeemer
{
  return self->_landingView == 0;
}

- (id)_newTextFieldWithClientContext:(id)a3 placeholderColor:(id)a4
{
  id v5;
  id v6;
  SUUIRedeemTextField *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = -[SUUIRedeemTextField initWithFrame:]([SUUIRedeemTextField alloc], "initWithFrame:", 0.0, 0.0, 1.0, 44.0);
  -[SUUIRedeemTextField setAutocorrectionType:](v7, "setAutocorrectionType:", 1);
  -[SUUIRedeemTextField setAutocapitalizationType:](v7, "setAutocapitalizationType:", 3);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemTextField setFont:](v7, "setFont:", v8);
  v9 = *MEMORY[0x24BEBB360];
  v18[0] = v8;
  v10 = *MEMORY[0x24BEBB368];
  v17[0] = v9;
  v17[1] = v10;
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.7, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  v13 = objc_alloc(MEMORY[0x24BDD1458]);
  if (v5)
    objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_ENTER_CODE"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_ENTER_CODE"), 0, CFSTR("Redeem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v12);

  -[SUUIRedeemTextField setAttributedPlaceholder:](v7, "setAttributedPlaceholder:", v15);
  return v7;
}

- (void)_pauseRedeemer
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cancelRedeemerViewForSUUIRedeemCameraView:", self);

}

- (void)_resumeRedeemer
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startRedeemerViewForSUUIRedeemCameraView:", self);

}

- (void)_showRedeemer:(BOOL)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentFullScreenCameraViewForSUUIRedeemCameraView:", self);

}

- (SUUIRedeemCameraViewDelegate)delegate
{
  return (SUUIRedeemCameraViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUIITunesPassConfiguration)ITunesPassConfiguration
{
  return self->_iTunesPassConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_termsButton, 0);
  objc_storeStrong((id *)&self->_redeemerView, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_landingView, 0);
  objc_storeStrong((id *)&self->_iTunesPassLockup, 0);
  objc_storeStrong((id *)&self->_iTunesPassConfiguration, 0);
  objc_storeStrong((id *)&self->_inputAccessoryTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
