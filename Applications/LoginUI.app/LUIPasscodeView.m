@implementation LUIPasscodeView

- (LUIPasscodeView)initWithFrame:(CGRect)a3 withPasscodeLockViewForStyle:(int)a4
{
  uint64_t v4;
  LUIPasscodeView *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIColor *backdropColorWithAlpha;
  SBUIPasscodeLockView *passCodeView;
  void *v12;
  UIActivityIndicatorView *v13;
  UIActivityIndicatorView *spinner;
  UILabel *v15;
  UILabel *hintLabel;
  UILabel *v17;
  void *v18;
  objc_super v20;

  v4 = *(_QWORD *)&a4;
  v20.receiver = self;
  v20.super_class = (Class)LUIPasscodeView;
  v5 = -[LUIPasscodeView initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[LUIPasscodeView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SBUIPasscodeLockViewFactory passcodeLockViewForStyle:](SBUIPasscodeLockViewFactory, "passcodeLockViewForStyle:", v4));
    -[LUIPasscodeView setPassCodeView:](v5, "setPassCodeView:", v7);

    -[SBUIPasscodeLockView setDelegate:](v5->_passCodeView, "setDelegate:", 0);
    -[SBUIPasscodeLockView setShowsEmergencyCallButton:](v5->_passCodeView, "setShowsEmergencyCallButton:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", 2030));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "combinedTintColor"));
    backdropColorWithAlpha = v5->_backdropColorWithAlpha;
    v5->_backdropColorWithAlpha = (UIColor *)v9;

    v5->_backdropAlpha = 0.8;
    passCodeView = v5->_passCodeView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor colorWithAlphaComponent:](v5->_backdropColorWithAlpha, "colorWithAlphaComponent:", 1.0));
    -[SBUIPasscodeLockView setCustomBackgroundColor:](passCodeView, "setCustomBackgroundColor:", v12);

    -[SBUIPasscodeLockView setAutoresizingMask:](v5->_passCodeView, "setAutoresizingMask:", 18);
    -[SBUIPasscodeLockView setKeypadVisible:animated:](v5->_passCodeView, "setKeypadVisible:animated:", 0, 0);
    -[SBUIPasscodeLockView setAlpha:](v5->_passCodeView, "setAlpha:", v5->_backdropAlpha);
    v13 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = v13;

    -[UIActivityIndicatorView setHidesWhenStopped:](v5->_spinner, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView setAlpha:](v5->_spinner, "setAlpha:", 1.0);
    v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    hintLabel = v5->_hintLabel;
    v5->_hintLabel = v15;

    -[UILabel setNumberOfLines:](v5->_hintLabel, "setNumberOfLines:", 0);
    v17 = v5->_hintLabel;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[UILabel setHidden:](v5->_hintLabel, "setHidden:", 1);
    -[LUIPasscodeView addSubview:](v5, "addSubview:", v5->_passCodeView);
    -[LUIPasscodeView addSubview:](v5, "addSubview:", v5->_hintLabel);
    -[LUIPasscodeView addSubview:](v5, "addSubview:", v5->_spinner);
    -[LUIPasscodeView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("LUIPasscodeView"));
  }
  return v5;
}

- (SBUIPasscodeLockView)passcodeView
{
  return self->_passCodeView;
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
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)LUIPasscodeView;
  -[LUIPasscodeView layoutSubviews](&v32, "layoutSubviews");
  -[LUIPasscodeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SBUIPasscodeLockView setFrame:](self->_passCodeView, "setFrame:", 0.0, 0.0);
  -[UILabel setSize:](self->_hintLabel, "setSize:", v4, v6);
  -[UILabel sizeToFit](self->_hintLabel, "sizeToFit");
  -[UILabel frame](self->_hintLabel, "frame");
  v8 = v7;
  v10 = v9;
  if (v4 >= v6)
    v11 = v6;
  else
    v11 = v4;
  v12 = (double)(uint64_t)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v13, "sideInsetForHintLabel");
  v15 = v12 + v14 * -2.0;

  if (v8 > (double)(uint64_t)v15)
  {
    -[UILabel sizeThatFits:](self->_hintLabel, "sizeThatFits:");
    v8 = v16;
    v10 = v17;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v18, "baselineHintInsetForPasscodeStyle:", -[SBUIPasscodeLockView style](self->_passCodeView, "style"));
  v20 = v19;
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_hintLabel, "_firstLineBaselineOffsetFromBoundsTop");
  v22 = v6 - (v20 - v21);

  v23 = (v4 - v6) * 0.5;
  if (v6 >= v4)
    v23 = -0.0;
  v24 = v23 + v22;
  -[UILabel setFrame:](self->_hintLabel, "setFrame:", v4 * 0.5 - v8 * 0.5, v23 + v22, v8, v10);
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v26 = v25;
  v28 = v27;
  -[LUIPasscodeView bounds](self, "bounds");
  v30 = (v29 - v26) * 0.5;
  v31 = v24 + 40.0;
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", v26 * 0.5 + v30, v31 + v28 * 0.5);
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v30, v31, v26, v28);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIPasscodeView;
  -[LUIPasscodeView didMoveToWindow](&v3, "didMoveToWindow");
  -[SBUIPasscodeLockView setKeypadVisible:animated:](self->_passCodeView, "setKeypadVisible:animated:", 1, 1);
}

- (void)setHintLabelText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hintFont"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v5, NSFontAttributeName));
    v7 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v7, "setLineSpacing:", 4.0);
    objc_msgSend(v7, "setAlignment:", 1);
    objc_msgSend(v6, "setObject:forKey:", v7, NSParagraphStyleAttributeName);
    v8 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v9, v6);
    -[UILabel setAttributedText:](self->_hintLabel, "setAttributedText:", v8);
    -[UILabel setHidden:](self->_hintLabel, "setHidden:", 0);
    -[LUIPasscodeView setNeedsLayout](self, "setNeedsLayout");

  }
  else
  {
    -[UILabel setText:](self->_hintLabel, "setText:", 0);
    -[UILabel setHidden:](self->_hintLabel, "setHidden:", 1);
  }

}

- (void)setPasscodeDelegate:(id)a3
{
  -[SBUIPasscodeLockView setDelegate:](self->_passCodeView, "setDelegate:", a3);
}

- (BOOL)becomeFirstResponder
{
  return -[SBUIPasscodeLockView becomeFirstResponder](self->_passCodeView, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LUIPasscodeView;
  -[LUIPasscodeView resignFirstResponder](&v4, "resignFirstResponder");
  return -[SBUIPasscodeLockView resignFirstResponder](self->_passCodeView, "resignFirstResponder");
}

- (double)backdropAlpha
{
  return self->_backdropAlpha;
}

- (id)backdropColorWithAlpha
{
  return self->_backdropColorWithAlpha;
}

- (void)setAlpha:(double)a3
{
  -[SBUIPasscodeLockView setAlpha:](self->_passCodeView, "setAlpha:", a3);
}

- (void)startAnimatingSpinner
{
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void)stopAnimatingSpinner
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
}

- (SBUIPasscodeLockViewDelegate)passcodeDelegate
{
  return (SBUIPasscodeLockViewDelegate *)objc_loadWeakRetained((id *)&self->_passcodeDelegate);
}

- (SBUIPasscodeLockView)passCodeView
{
  return self->_passCodeView;
}

- (void)setPassCodeView:(id)a3
{
  objc_storeStrong((id *)&self->_passCodeView, a3);
}

- (UILabel)hintLabel
{
  return self->_hintLabel;
}

- (void)setHintLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hintLabel, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_hintLabel, 0);
  objc_storeStrong((id *)&self->_passCodeView, 0);
  objc_destroyWeak((id *)&self->_passcodeDelegate);
  objc_storeStrong((id *)&self->_backdropColorWithAlpha, 0);
}

@end
