@implementation PasscodeBackOffView

- (PasscodeBackOffView)init
{
  PasscodeBackOffView *v2;
  PasscodeBackOffView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PasscodeBackOffView;
  v2 = -[PasscodeBackOffView init](&v5, "init");
  v3 = v2;
  if (v2)
    -[PasscodeBackOffView _setup](v2, "_setup");
  return v3;
}

- (PasscodeBackOffView)initWithFrame:(CGRect)a3
{
  PasscodeBackOffView *v3;
  PasscodeBackOffView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PasscodeBackOffView;
  v3 = -[PasscodeBackOffView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PasscodeBackOffView _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *subtitleLabel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIButton *v27;
  UIButton *button;
  UIButton *v29;
  uint64_t v30;
  NSBundle *v31;
  void *v32;
  void *v33;
  UIButton *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[PasscodeBackOffView addSubview:](self, "addSubview:", self->_titleLabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeBackOffView topAnchor](self, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 100.0));
  objc_msgSend(v8, "setActive:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeBackOffView leadingAnchor](self, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 20.0));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeBackOffView trailingAnchor](self, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -20.0));
  objc_msgSend(v14, "setActive:", 1);

  v15 = (UILabel *)objc_alloc_init((Class)UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v15;

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v17);

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[PasscodeBackOffView addSubview:](self, "addSubview:", self->_subtitleLabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_subtitleLabel, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 50.0));
  objc_msgSend(v20, "setActive:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeBackOffView leadingAnchor](self, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 20.0));
  objc_msgSend(v23, "setActive:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeBackOffView trailingAnchor](self, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -20.0));
  objc_msgSend(v26, "setActive:", 1);

  v27 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  button = self->_button;
  self->_button = v27;

  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, "buttonAction:", 1);
  v29 = self->_button;
  v31 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v30));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10007CCD0, CFSTR("MobileUI")));
  -[UIButton setTitle:forState:](v29, "setTitle:forState:", v33, 0);

  v34 = self->_button;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UIButton _setFont:](v34, "_setFont:", v35);

  -[PasscodeBackOffView addSubview:](self, "addSubview:", self->_button);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton rightAnchor](self->_button, "rightAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeBackOffView rightAnchor](self, "rightAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -65.0));
  objc_msgSend(v38, "setActive:", 1);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_button, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeBackOffView bottomAnchor](self, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -45.0));
  objc_msgSend(v41, "setActive:", 1);

  -[PasscodeBackOffView _updateColors](self, "_updateColors");
}

- (void)setHasWhiteBackground:(BOOL)a3
{
  self->_hasWhiteBackground = a3;
  -[PasscodeBackOffView _updateColors](self, "_updateColors");
}

- (void)setSubtitle:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)buttonAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeBackOffViewCanceled:", self);

}

- (void)_updateColors
{
  void *v3;
  void *v4;
  UIButton *button;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeBackOffView _textColor](self, "_textColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeBackOffView _textColor](self, "_textColor"));
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v4);

  button = self->_button;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PasscodeBackOffView _textColor](self, "_textColor"));
  -[UIButton setTitleColor:forState:](button, "setTitleColor:forState:", v6, 0);

}

- (id)_textColor
{
  void *v2;

  if (self->_hasWhiteBackground)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  return v2;
}

- (PasscodeBackOffViewDelegate)delegate
{
  return (PasscodeBackOffViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasWhiteBackground
{
  return self->_hasWhiteBackground;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
