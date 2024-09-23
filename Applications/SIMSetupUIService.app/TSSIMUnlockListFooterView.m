@implementation TSSIMUnlockListFooterView

- (TSSIMUnlockListFooterView)initWithDelegate:(id)a3
{
  id v4;
  TSSIMUnlockListFooterView *v5;
  TSSIMUnlockListFooterView *v6;

  v4 = a3;
  v5 = -[TSSIMUnlockListFooterView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t mode;
  CGFloat Height;
  double v21;
  double v22;
  double v23;
  double MaxY;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v25.receiver = self;
  v25.super_class = (Class)TSSIMUnlockListFooterView;
  -[TSSIMUnlockListFooterView layoutSubviews](&v25, "layoutSubviews");
  -[TSSIMUnlockListFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIButton frame](self->_continueButton, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  mode = self->_mode;
  if (mode == 2)
  {
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    MaxY = CGRectGetMaxY(v27);
    v28.origin.x = v12;
    v28.origin.y = v14;
    v28.size.width = v16;
    v28.size.height = v18;
    Height = CGRectGetHeight(v28);
    v12 = UIRectCenteredXInRect(v12, MaxY - Height + -12.0, v16, v18, v4, v6, v8, v10);
    v14 = v21;
    v16 = v22;
    v18 = v23;
  }
  else if (mode == 1)
  {
    -[TSSIMUnlockListFooterView bounds](self, "bounds");
    v16 = CGRectGetWidth(v26) + -48.0;
    v12 = 24.0;
    v14 = 0.0;
    v18 = 50.0;
  }
  -[UIButton setFrame:](self->_continueButton, "setFrame:", v12, v14, v16, v18);
}

- (void)setMode:(int64_t)a3
{
  UIButton *v5;
  UIButton *v6;
  UIButton *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  void *v13;
  UIButton *v14;
  void *v15;
  UIButton *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIButton *v21;
  UIButton *v22;
  UIButton *continueButton;
  UIButton *v24;
  void *v25;
  UIButton *v26;
  void *v27;
  UIButton *v28;
  void *v29;
  void *v30;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[UIButton removeFromSuperview](self->_continueButton, "removeFromSuperview");
    if (a3)
    {
      if (a3 == 2)
      {
        v22 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
        continueButton = self->_continueButton;
        self->_continueButton = v22;

        v24 = self->_continueButton;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
        -[UIButton _setFont:](v24, "_setFont:", v25);

        v26 = self->_continueButton;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
        -[UIButton setTitleColor:forState:](v26, "setTitleColor:forState:", v27, 0);

        v28 = self->_continueButton;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("SKIP"), &stru_10001CAA0, CFSTR("Localizable")));
        -[UIButton setTitle:forState:](v28, "setTitle:forState:", v30, 0);

        -[UIButton sizeToFit](self->_continueButton, "sizeToFit");
      }
      else if (a3 == 1)
      {
        v5 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
        v6 = self->_continueButton;
        self->_continueButton = v5;

        v7 = self->_continueButton;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
        -[UIButton setBackgroundColor:](v7, "setBackgroundColor:", v8);

        v9 = self->_continueButton;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
        -[UIButton _setFont:](v9, "_setFont:", v10);

        v11 = self->_continueButton;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_10001CAA0, CFSTR("Localizable")));
        -[UIButton setTitle:forState:](v11, "setTitle:forState:", v13, 0);

        v14 = self->_continueButton;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        -[UIButton setTitleColor:forState:](v14, "setTitleColor:forState:", v15, 0);

        v16 = self->_continueButton;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "colorWithAlphaComponent:", 0.25));
        -[UIButton setTitleColor:forState:](v16, "setTitleColor:forState:", v18, 1);

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_continueButton, "titleLabel"));
        objc_msgSend(v19, "setAdjustsFontSizeToFitWidth:", 1);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_continueButton, "layer"));
        objc_msgSend(v20, "setCornerRadius:", 8.0);

      }
    }
    else
    {
      v21 = self->_continueButton;
      self->_continueButton = 0;

    }
    -[UIButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, "_continueButtonPressed:", 0x2000);
    -[TSSIMUnlockListFooterView addSubview:](self, "addSubview:", self->_continueButton);
    -[TSSIMUnlockListFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_continueButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "unlockListFooterViewContinueButtonWasPressed:", self);

}

- (int64_t)mode
{
  return self->_mode;
}

- (TSSIMUnlockListFooterViewDelegate)delegate
{
  return (TSSIMUnlockListFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

@end
