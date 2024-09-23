@implementation TSSIMUnlockEntryView

- (TSSIMUnlockEntryView)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4
{
  double y;
  double width;
  double height;
  TSSIMUnlockEntryView *v9;
  TSSIMUnlockEntryView *v10;
  UILabel *v11;
  UILabel *detailLabel;
  UILabel *v13;
  void *v14;
  UIView *v15;
  UIView *containerView;
  UITextField *v17;
  UITextField *entryField;
  UITextField *v19;
  uint64_t v20;
  uint64_t v21;
  UIButton *okButton;
  UIButton *v23;
  void *v24;
  void *v25;
  UIButton *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)TSSIMUnlockEntryView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = -[TSSIMUnlockEntryView initWithFrame:](&v30, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v9;
  if (v9)
  {
    v9->_actionType = a3;
    v9->_actionSubtype = a4;
    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    detailLabel = v10->_detailLabel;
    v10->_detailLabel = v11;

    -[UILabel setTextAlignment:](v10->_detailLabel, "setTextAlignment:", 1);
    v13 = v10->_detailLabel;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v13, "setFont:", v14);

    -[UILabel setNumberOfLines:](v10->_detailLabel, "setNumberOfLines:", 1);
    -[TSSIMUnlockEntryView _configureDetailLabelText](v10, "_configureDetailLabelText");
    -[TSSIMUnlockEntryView addSubview:](v10, "addSubview:", v10->_detailLabel);
    v15 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    containerView = v10->_containerView;
    v10->_containerView = v15;

    -[TSSIMUnlockEntryView addSubview:](v10, "addSubview:", v10->_containerView);
    v17 = (UITextField *)objc_msgSend(objc_alloc((Class)UITextField), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    entryField = v10->_entryField;
    v10->_entryField = v17;

    -[UITextField setDelegate:](v10->_entryField, "setDelegate:", v10);
    -[UITextField setBorderStyle:](v10->_entryField, "setBorderStyle:", 3);
    v19 = v10->_entryField;
    if (+[SSServiceUtilities isPad](SSServiceUtilities, "isPad"))
      v20 = 11;
    else
      v20 = 127;
    -[UITextField setKeyboardType:](v19, "setKeyboardType:", v20);
    -[UITextField setSecureTextEntry:](v10->_entryField, "setSecureTextEntry:", 1);
    -[UIView addSubview:](v10->_containerView, "addSubview:", v10->_entryField);
    v21 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    okButton = v10->_okButton;
    v10->_okButton = (UIButton *)v21;

    v23 = v10->_okButton;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10001CAA0, CFSTR("Localizable")));
    -[UIButton setTitle:forState:](v23, "setTitle:forState:", v25, 0);

    v26 = v10->_okButton;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 16.0));
    -[UIButton _setFont:](v26, "_setFont:", v27);

    -[UIButton setEnabled:](v10->_okButton, "setEnabled:", 0);
    -[UIButton sizeToFit](v10->_okButton, "sizeToFit");
    -[UIButton addTarget:action:forControlEvents:](v10->_okButton, "addTarget:action:forControlEvents:", v10, "_okButtonPressed:", 0x2000);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockEntryView enteredText](v10, "enteredText"));
    -[TSSIMUnlockEntryView _configureOKButtonWithEnteredText:](v10, "_configureOKButtonWithEnteredText:", v28);

    -[UIView addSubview:](v10->_containerView, "addSubview:", v10->_okButton);
  }
  return v10;
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat MaxX;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MaxY;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v18.receiver = self;
  v18.super_class = (Class)TSSIMUnlockEntryView;
  -[TSSIMUnlockEntryView layoutSubviews](&v18, "layoutSubviews");
  -[TSSIMUnlockEntryView bounds](self, "bounds");
  Width = CGRectGetWidth(v19);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = Width;
  v20.size.height = 60.0;
  MaxY = CGRectGetMaxY(v20);
  -[UIButton size](self->_okButton, "size");
  v5 = v4;
  v7 = v6;
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.height = 30.0;
  v21.size.width = 100.0;
  MaxX = CGRectGetMaxX(v21);
  v10 = UIRectCenteredYInRect(v9, MaxX + 5.0, 0.0, v5, v7, 0.0, 0.0, 100.0, 30.0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UILabel setFrame:](self->_detailLabel, "setFrame:", 0.0, 0.0, Width, 60.0);
  -[UITextField setFrame:](self->_entryField, "setFrame:", 0.0, 0.0, 100.0, 30.0);
  -[UIButton setFrame:](self->_okButton, "setFrame:", v10, v12, v14, v16);
  -[UIView setFrame:](self->_containerView, "setFrame:", Width * 0.5 + -50.0, MaxY, v5 + 100.0 + 5.0, 30.0);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 90.0;
  result.height = v3;
  return result;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  BOOL v5;
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  if (self->_unlocking)
    return 0;
  length = a4.length;
  location = a4.location;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "invertedSet"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", location, length, v10));

  v16 = objc_msgSend(v10, "length");
  v17 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v13);

  v18 = objc_msgSend(v15, "length");
  if (!v16 || (v5 = 0, v17 == (id)0x7FFFFFFFFFFFFFFFLL) && (unint64_t)v18 <= 8)
  {
    -[TSSIMUnlockEntryView _configureOKButtonWithEnteredText:](self, "_configureOKButtonWithEnteredText:", v15);
    v5 = 1;
  }

  return v5;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  id v5;
  id WeakRetained;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "entryView:didEnterText:", self, v4);

  }
  return v5 != 0;
}

- (BOOL)canBecomeFirstResponder
{
  return -[UITextField canBecomeFirstResponder](self->_entryField, "canBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return -[UITextField becomeFirstResponder](self->_entryField, "becomeFirstResponder");
}

- (BOOL)canResignFirstResponder
{
  return -[UITextField canResignFirstResponder](self->_entryField, "canResignFirstResponder");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSSIMUnlockEntryView;
  -[TSSIMUnlockEntryView resignFirstResponder](&v4, "resignFirstResponder");
  return -[UITextField resignFirstResponder](self->_entryField, "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[UITextField isFirstResponder](self->_entryField, "isFirstResponder");
}

- (void)resetEnteredTextWithShakeAnimation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _QWORD v27[2];

  v3 = a3;
  -[UITextField setText:](self->_entryField, "setText:", 0);
  -[TSSIMUnlockEntryView _configureOKButtonWithEnteredText:](self, "_configureOKButtonWithEnteredText:", 0);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("position")));
    objc_msgSend(v5, "setAdditive:", 1);
    objc_msgSend(v5, "setMass:", 1.2);
    objc_msgSend(v5, "setStiffness:", 1200.0);
    objc_msgSend(v5, "setDamping:", 12.0);
    LODWORD(v6) = 1028389654;
    LODWORD(v7) = 990057071;
    LODWORD(v8) = 1059712716;
    LODWORD(v9) = 1.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v6, v7, v8, v9));
    objc_msgSend(v5, "setTimingFunction:", v10);

    objc_msgSend(v5, "setInitialVelocity:", 0.0);
    objc_msgSend(v5, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v5, "durationForEpsilon:", 0.001);
    objc_msgSend(v5, "setDuration:");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.0, 0.0));
    objc_msgSend(v5, "setFromValue:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -75.0, 0.0));
    objc_msgSend(v5, "setToValue:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position")));
    objc_msgSend(v13, "setAdditive:", 1);
    LODWORD(v14) = 1054276898;
    LODWORD(v15) = 1058305108;
    LODWORD(v16) = 0;
    LODWORD(v17) = 1.0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v14, v16, v15, v17));
    objc_msgSend(v13, "setTimingFunction:", v18);

    objc_msgSend(v13, "setDuration:", 0.1);
    objc_msgSend(v13, "setFillMode:", kCAFillModeForwards);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.0, 0.0));
    objc_msgSend(v13, "setFromValue:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 75.0, 0.0));
    objc_msgSend(v13, "setToValue:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CAAnimationGroup animation](CAAnimationGroup, "animation"));
    v27[0] = v5;
    v27[1] = v13;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    objc_msgSend(v21, "setAnimations:", v22);

    objc_msgSend(v5, "duration");
    v24 = v23;
    objc_msgSend(v13, "duration");
    if (v24 >= v25)
      v25 = v24;
    objc_msgSend(v21, "setDuration:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_containerView, "layer"));
    objc_msgSend(v26, "addAnimation:forKey:", v21, 0);

  }
}

- (NSString)enteredText
{
  return -[UITextField text](self->_entryField, "text");
}

- (void)setUnlocking:(BOOL)a3
{
  id v4;

  if (self->_unlocking != a3)
  {
    self->_unlocking = a3;
    -[TSSIMUnlockEntryView _configureDetailLabelText](self, "_configureDetailLabelText");
    v4 = (id)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockEntryView enteredText](self, "enteredText"));
    -[TSSIMUnlockEntryView _configureOKButtonWithEnteredText:](self, "_configureOKButtonWithEnteredText:", v4);

  }
}

- (void)setAttemptsRemaining:(unint64_t)a3
{
  if (self->_attemptsRemaining != a3)
  {
    self->_attemptsRemaining = a3;
    -[TSSIMUnlockEntryView _configureDetailLabelText](self, "_configureDetailLabelText");
  }
}

- (void)setPinMismatch:(BOOL)a3
{
  if (self->_pinMismatch != a3)
  {
    self->_pinMismatch = a3;
    -[TSSIMUnlockEntryView _configureDetailLabelText](self, "_configureDetailLabelText");
  }
}

- (void)_okButtonPressed:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_entryField, "text"));
  objc_msgSend(WeakRetained, "entryView:didEnterText:", self, v4);

}

- (void)_configureOKButtonWithEnteredText:(id)a3
{
  UIButton *okButton;
  _BOOL8 v4;

  okButton = self->_okButton;
  v4 = !self->_unlocking && objc_msgSend(a3, "length") != 0;
  -[UIButton setEnabled:](okButton, "setEnabled:", v4);
}

- (void)_configureDetailLabelText
{
  id v3;
  unint64_t actionSubtype;
  _BOOL4 pinMismatch;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;

  if (self->_unlocking)
    goto LABEL_2;
  actionSubtype = self->_actionSubtype;
  if (actionSubtype < 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ATTEMPTS_REMAINING_FORMAT"), &stru_10001CAA0, CFSTR("Plurals")));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, self->_attemptsRemaining));

LABEL_12:
    v3 = v10;
    goto LABEL_13;
  }
  if (actionSubtype == 3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("ENTER_NEW_PIN_2_DETAIL");
LABEL_11:
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_10001CAA0, CFSTR("Localizable")));
    goto LABEL_12;
  }
  if (actionSubtype == 2)
  {
    pinMismatch = self->_pinMismatch;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (pinMismatch)
      v8 = CFSTR("ENTER_NEW_PIN_1_DETAIL_MISMATCH");
    else
      v8 = CFSTR("ENTER_NEW_PIN_1_DETAIL");
    goto LABEL_11;
  }
LABEL_2:
  v3 = 0;
LABEL_13:
  v11 = v3;
  -[UILabel setText:](self->_detailLabel, "setText:", v3);
  -[TSSIMUnlockEntryView setNeedsDisplay](self, "setNeedsDisplay");

}

- (BOOL)unlocking
{
  return self->_unlocking;
}

- (BOOL)pinMismatch
{
  return self->_pinMismatch;
}

- (unint64_t)attemptsRemaining
{
  return self->_attemptsRemaining;
}

- (TSSIMUnlockEntryViewDelegate)delegate
{
  return (TSSIMUnlockEntryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (int64_t)actionSubtype
{
  return self->_actionSubtype;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_entryField, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
