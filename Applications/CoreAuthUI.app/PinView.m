@implementation PinView

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (PinView)initWithPinLength:(id)a3 minLength:(id)a4 maxLength:(id)a5 charset:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PinView *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  unint64_t v21;
  UILabel *v22;
  UILabel *titleLabel;
  UILabel *v24;
  uint64_t v25;
  void *v26;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  PinField *v30;
  PinField *pinField;
  void *v32;
  unint64_t v33;
  id v34;
  UIView *v35;
  UIView *dividerLine;
  UIView *v37;
  void *v38;
  void *v39;
  id v41;
  objc_super v42;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v42.receiver = self;
  v42.super_class = (Class)PinView;
  v14 = -[PinView init](&v42, "init");
  if (v14)
  {
    v41 = v13;
    v15 = v12;
    v16 = v11;
    v17 = v10;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v18, "scale");
    v14->_scale = v19;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v21 = (unint64_t)objc_msgSend(v20, "userInterfaceIdiom");

    v14->_autoKeyboard = (v21 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    v22 = objc_opt_new(UILabel);
    titleLabel = v14->_titleLabel;
    v14->_titleLabel = v22;

    v24 = v14->_titleLabel;
    v25 = UISystemFontForSize(18);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    -[UILabel setFont:](v24, "setFont:", v26);

    -[UILabel setOpaque:](v14->_titleLabel, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v14->_titleLabel, "setBackgroundColor:", 0);
    -[UILabel setTextAlignment:](v14->_titleLabel, "setTextAlignment:", 1);
    v27 = v14->_titleLabel;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v29 = v27;
    v10 = v17;
    v11 = v16;
    v12 = v15;
    v13 = v41;
    -[UILabel setTextColor:](v29, "setTextColor:", v28);

    -[UILabel setNumberOfLines:](v14->_titleLabel, "setNumberOfLines:", 0);
    -[PinView addSubview:](v14, "addSubview:", v14->_titleLabel);
    v30 = -[PinField initWithPinLength:minLength:maxLength:charset:]([PinField alloc], "initWithPinLength:minLength:maxLength:charset:", v10, v11, v12, v41);
    pinField = v14->_pinField;
    v14->_pinField = v30;

    -[PinView addSubview:](v14, "addSubview:", v14->_pinField);
    -[PinField setDelegate:](v14->_pinField, "setDelegate:", v14);
    objc_storeStrong((id *)&v14->_pinMinLength, a4);
    objc_storeStrong((id *)&v14->_pinCharset, a6);
    if (!v14->_autoKeyboard
      || (v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice")),
          v33 = (unint64_t)objc_msgSend(v32, "userInterfaceIdiom"),
          v32,
          (v33 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      v35 = objc_opt_new(UIView);
      dividerLine = v14->_dividerLine;
      v14->_dividerLine = v35;

      v37 = v14->_dividerLine;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      -[UIView setBackgroundColor:](v37, "setBackgroundColor:", v38);

      -[UIView setHidden:](v14->_dividerLine, "setHidden:", 1);
      v34 = -[PinView addSubview:](v14, "addSubview:", v14->_dividerLine);
    }
    if (v14->_autoKeyboard)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v39, "addObserver:selector:name:object:", v14, "keyboardDidShow:", UIKeyboardDidShowNotification, 0);

    }
    else
    {
      if (UIKeyboardAutomaticIsOnScreen(v34))
        UIKeyboardOrderOutAutomaticSkippingAnimation();
      -[PinView _activateKeypadView](v14, "_activateKeypadView");
    }
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_autoKeyboard)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardDidShowNotification, 0);

  }
  else
  {
    -[PinView _dismissKeypad](self, "_dismissKeypad");
  }
  v4.receiver = self;
  v4.super_class = (Class)PinView;
  -[PinView dealloc](&v4, "dealloc");
}

- (void)keyboardDidShow:(id)a3
{
  void *v4;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  BOOL IsEmpty;
  void *v11;
  CGRect v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIKeyboardFrameEndUserInfoKey));

  v5 = v11;
  if (v11)
  {
    objc_msgSend(v11, "CGRectValue");
    x = v12.origin.x;
    y = v12.origin.y;
    width = v12.size.width;
    height = v12.size.height;
    IsEmpty = CGRectIsEmpty(v12);
    v5 = v11;
    if (!IsEmpty)
    {
      -[PinView _layoutSubviewsWithKeyboard:](self, "_layoutSubviewsWithKeyboard:", x, y, width, height);
      v5 = v11;
    }
  }

}

- (void)setCancelButton:(id)a3
{
  UIButton *v4;
  UIButton *v5;
  UIButton *cancelButton;
  UIButton *v7;

  v4 = (UIButton *)a3;
  v5 = v4;
  if (self->_cancelButton)
    -[UIButton removeFromSuperview](v4, "removeFromSuperview");
  cancelButton = self->_cancelButton;
  self->_cancelButton = v5;
  v7 = v5;

  -[PinView addSubview:](self, "addSubview:", self->_cancelButton);
}

- (void)layoutSubviews
{
  double height;
  double x;
  double width;
  double v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)PinView;
  -[PinView layoutSubviews](&v18, "layoutSubviews");
  -[PinView bounds](self, "bounds");
  height = v19.size.height;
  if (!CGRectIsEmpty(v19))
  {
    if (self->_keypad)
    {
      x = self->_keyboardDefaultFrame.origin.x;
      width = self->_keyboardDefaultFrame.size.width;
      v6 = self->_keyboardDefaultFrame.size.height;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v8 = (unint64_t)objc_msgSend(v7, "userInterfaceIdiom");

      if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v6 = 216.0;
        width = 320.0;
      }
      -[PinView _roundToPixel:](self, "_roundToPixel:", height - v6);
      v10 = v9;
      -[PinKeypad setFrame:](self->_keypad, "setFrame:", x, v9, width, v6);
      if (self->_dividerLine)
      {
        -[PinView _roundRectToPixel:](self, "_roundRectToPixel:", x, v10 + -0.5, width, 0.5);
        -[UIView setFrame:](self->_dividerLine, "setFrame:");
        -[UIView setHidden:](self->_dividerLine, "setHidden:", 0);
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PinView keyboardLayoutGuide](self, "keyboardLayoutGuide"));
      objc_msgSend(v11, "layoutFrame");
      x = v12;
      v10 = v13;
      width = v14;
      v16 = v15;

      v6 = 285.0;
      if (v16 >= 285.0)
      {
        v6 = v16;
      }
      else
      {
        -[PinView frame](self, "frame");
        width = v17;
        x = 0.0;
        v10 = 0.0;
      }
    }
    -[PinView _layoutSubviewsWithKeyboard:](self, "_layoutSubviewsWithKeyboard:", x, v10, width, v6);
  }
}

- (void)_layoutSubviewsWithKeyboard:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  UIButton *cancelButton;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PinView bounds](self, "bounds");
  v8 = v24.origin.x;
  v9 = v24.origin.y;
  v10 = v24.size.width;
  v11 = v24.size.height;
  if (!CGRectIsEmpty(v24))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PinView viewController](self, "viewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    objc_msgSend(v13, "safeAreaInsets");
    v23 = v14;

    cancelButton = self->_cancelButton;
    if (cancelButton)
    {
      -[UIButton frame](cancelButton, "frame");
      -[UIButton setFrame:](self->_cancelButton, "setFrame:", v10 - v16 + -15.0, v23 + 10.0);
    }
    v25.origin.x = v8;
    v25.origin.y = v9;
    v25.size.width = v10;
    v25.size.height = v11;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v26 = CGRectIntersection(v25, v27);
    CGRectIsNull(v26);
    -[PinField updateLayoutForWidth:](self->_pinField, "updateLayoutForWidth:", v10);
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v10 + -30.0, v11);
    v17 = UIRectCenteredXInRect(-[PinField frame](self->_pinField, "frame"));
    UIRectIntegralWithScale(v17);
    v19 = UIRectIntegralWithScale(v18);
    v21 = v20;
    v22 = UIRectCenteredXInRect(-[PinField setFrame:](self->_pinField, "setFrame:", v19));
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", UIRectIntegralWithScale(v22));
    -[UILabel _setLastLineBaselineFrameOriginY:](self->_titleLabel, "_setLastLineBaselineFrameOriginY:", v21 + -30.0);
  }
}

- (double)_roundToPixel:(double)a3
{
  return round(self->_scale * a3) / self->_scale;
}

- (CGRect)_roundRectToPixel:(CGRect)a3
{
  double height;
  double width;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  -[PinView _roundToPixel:](self, "_roundToPixel:", a3.origin.x);
  v8 = v7;
  -[PinView _roundToPixel:](self, "_roundToPixel:", y);
  v10 = v9;
  -[PinView _roundToPixel:](self, "_roundToPixel:", width);
  v12 = v11;
  -[PinView _roundToPixel:](self, "_roundToPixel:", height);
  v14 = v13;
  v15 = v8;
  v16 = v10;
  v17 = v12;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return self->_autoKeyboard || self->_keypadActive;
}

- (BOOL)becomeFirstResponder
{
  objc_super v4;
  objc_super v5;

  if (self->_autoKeyboard)
  {
    v5.receiver = self;
    v5.super_class = (Class)PinView;
    return -[PinView becomeFirstResponder](&v5, "becomeFirstResponder");
  }
  if (self->_keypadActive)
  {
    UIKeyboardDisableAutomaticAppearance();
    v4.receiver = self;
    v4.super_class = (Class)PinView;
    if (-[PinView becomeFirstResponder](&v4, "becomeFirstResponder"))
      return 1;
    UIKeyboardEnableAutomaticAppearance();
  }
  return 0;
}

- (BOOL)resignFirstResponder
{
  unsigned int v3;
  id WeakRetained;
  objc_super v6;

  v3 = -[PinView isFirstResponder](self, "isFirstResponder");
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PinView;
    v3 = -[PinView resignFirstResponder](&v6, "resignFirstResponder");
    if (v3)
    {
      if (self->_keypadActive)
        UIKeyboardEnableAutomaticAppearance();
      if (!self->_pinEntered)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "pinCancelled");

      }
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_activateKeypadView
{
  PinKeypad *keypad;
  PinKeypad *v4;
  PinKeypad *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;

  if (!self->_keypadActive)
  {
    keypad = self->_keypad;
    if (!keypad)
    {
      v4 = -[PinKeypad initWithDefaultSize]([PinKeypad alloc], "initWithDefaultSize");
      v5 = self->_keypad;
      self->_keypad = v4;

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PinKeypad layer](self->_keypad, "layer"));
      v7 = objc_msgSend(v6, "disableUpdateMask");

      v8 = v7 | 0x10;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PinKeypad layer](self->_keypad, "layer"));
      objc_msgSend(v9, "setDisableUpdateMask:", v8);

      -[PinKeypad frame](self->_keypad, "frame");
      self->_keyboardDefaultFrame.origin.x = v10;
      self->_keyboardDefaultFrame.origin.y = v11;
      self->_keyboardDefaultFrame.size.width = v12;
      self->_keyboardDefaultFrame.size.height = v13;
      keypad = self->_keypad;
    }
    -[PinKeypad activate](keypad, "activate");
    self->_keypadActive = 1;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PinKeypad superview](self->_keypad, "superview"));

    if (!v14)
      -[PinView addSubview:](self, "addSubview:", self->_keypad);
  }
}

- (void)_deactivateKeypadView
{
  if (self->_keypadActive)
  {
    -[PinKeypad deactivate](self->_keypad, "deactivate");
    self->_keypadActive = 0;
  }
}

- (void)_dismissKeypad
{
  PinKeypad *keypad;
  PinKeypad *v4;

  -[PinView _deactivateKeypadView](self, "_deactivateKeypadView");
  keypad = self->_keypad;
  if (keypad)
  {
    -[PinKeypad removeFromSuperview](keypad, "removeFromSuperview");
    v4 = self->_keypad;
    self->_keypad = 0;

  }
}

- (void)pinEntered:(id)a3
{
  PinViewDelegate **p_delegate;
  id v4;
  id WeakRetained;

  self->_pinEntered = 1;
  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "pinEntered:", v4);

}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (int64_t)keyboardType
{
  void *v3;
  unint64_t v4;

  if (!self->_autoKeyboard)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v4 = (unint64_t)objc_msgSend(v3, "userInterfaceIdiom");

    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      return 127;
  }
  if (-[NSNumber unsignedIntValue](self->_pinCharset, "unsignedIntValue"))
    return 1;
  return 4;
}

- (int64_t)keyboardAppearance
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PinView traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == (id)1000 || v3 == (id)2)
    return 1;
  else
    return 2;
}

- (int64_t)returnKeyType
{
  return 9;
}

- (int64_t)autocapitalizationType
{
  if (-[NSNumber unsignedIntValue](self->_pinCharset, "unsignedIntValue") == 2)
    return 3;
  else
    return 0;
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (BOOL)hasText
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PinField pinValue](self->_pinField, "pinValue"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)insertText:(id)a3
{
  -[PinField appendPinCharacter:](self->_pinField, "appendPinCharacter:", a3);
}

- (void)deleteBackward
{
  -[PinField deleteLastPinCharacter](self->_pinField, "deleteLastPinCharacter");
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  self->_viewController = (UIViewController *)a3;
}

- (PinViewDelegate)delegate
{
  return (PinViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinCharset, 0);
  objc_storeStrong((id *)&self->_pinMinLength, 0);
  objc_storeStrong((id *)&self->_keypad, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
  objc_storeStrong((id *)&self->_pinField, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
