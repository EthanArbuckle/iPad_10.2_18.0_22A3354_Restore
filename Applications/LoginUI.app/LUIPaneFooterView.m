@implementation LUIPaneFooterView

- (LUIPaneFooterView)initWithFrame:(CGRect)a3
{
  LUIPaneFooterView *v3;
  uint64_t v4;
  UIButton *signInButton;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  void *v14;
  UIButton *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  UIActivityIndicatorView *v21;
  UIActivityIndicatorView *spinner;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)LUIPaneFooterView;
  v3 = -[LUIPaneFooterView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    signInButton = v3->_signInButton;
    v3->_signInButton = (UIButton *)v4;

    v6 = v3->_signInButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIGN_IN"), &stru_100069EB8, 0));
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_signInButton, "titleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "footerButtonFont"));
    objc_msgSend(v9, "setFont:", v11);

    v12 = v3->_signInButton;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "overallTextColor"));
    -[UIButton setTitleColor:forState:](v12, "setTitleColor:forState:", v14, 0);

    v15 = v3->_signInButton;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "overallTextColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "colorWithAlphaComponent:", 0.6));
    -[UIButton setTitleColor:forState:](v15, "setTitleColor:forState:", v18, 2);

    -[UIButton addTarget:action:forControlEvents:](v3->_signInButton, "addTarget:action:forControlEvents:", v3, "signInButtonPressed", 64);
    v19 = objc_alloc((Class)UIActivityIndicatorView);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v21 = (UIActivityIndicatorView *)objc_msgSend(v19, "initWithActivityIndicatorStyle:", objc_msgSend(v20, "activityIndicatorViewStyle"));
    spinner = v3->_spinner;
    v3->_spinner = v21;

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_spinner, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView setAlpha:](v3->_spinner, "setAlpha:", 1.0);
    -[LUIPaneFooterView setSignInButtonEnabled:](v3, "setSignInButtonEnabled:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[LUIPaneFooterView setBackgroundColor:](v3, "setBackgroundColor:", v23);

    -[LUIPaneFooterView addSubview:](v3, "addSubview:", v3->_signInButton);
    -[LUIPaneFooterView addSubview:](v3, "addSubview:", v3->_spinner);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
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
  double v18;
  double v19;
  double v20;
  double v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v3, "baselineInsetForFooterButton");
  v5 = v4;

  -[UIButton sizeToFit](self->_signInButton, "sizeToFit");
  -[UIButton frame](self->_signInButton, "frame");
  v7 = v6;
  v9 = v8;
  -[LUIPaneFooterView bounds](self, "bounds");
  v11 = v10;
  -[UIButton frame](self->_signInButton, "frame");
  -[UIButton setFrame:](self->_signInButton, "setFrame:", (v11 - v12) * 0.5, v5, v7, v9);
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v13, "baselineInsetForSpinner");
  v15 = v14;

  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v17 = v16;
  v19 = v18;
  -[LUIPaneFooterView bounds](self, "bounds");
  v21 = (v20 - v17) * 0.5;
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", v17 * 0.5 + v21, v15 + v19 * 0.5);
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v21, v15, v17, v19);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[UIButton sizeToFit](self->_signInButton, "sizeToFit", a3.width, a3.height);
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v4, "baselineInsetForSpinner");
  v6 = v5;

  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPaneFooterView superview](self, "superview"));
  objc_msgSend(v9, "frame");
  v11 = v10;

  if (v11 <= 0.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v12, "bounds");
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPaneFooterView superview](self, "superview"));
    objc_msgSend(v12, "frame");
  }
  v14 = v13;

  v15 = v6 + v8 + 20.0;
  v16 = v14;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)signInButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "signInButtonPressed:", self->_signInButton);

}

- (void)setSignInButtonEnabled:(BOOL)a3
{
  if (self->_signInButtonEnabled != a3)
  {
    self->_signInButtonEnabled = a3;
    -[UIButton setEnabled:](self->_signInButton, "setEnabled:");
  }
}

- (void)startProgressAnimation
{
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void)stopProgressAnimation
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
}

- (LUIPaneFooterViewDelegate)delegate
{
  return (LUIPaneFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)signInButtonEnabled
{
  return self->_signInButtonEnabled;
}

- (UIButton)signInButton
{
  return self->_signInButton;
}

- (void)setSignInButton:(id)a3
{
  objc_storeStrong((id *)&self->_signInButton, a3);
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
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
