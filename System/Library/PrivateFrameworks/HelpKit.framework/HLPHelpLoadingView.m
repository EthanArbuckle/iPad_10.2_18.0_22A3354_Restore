@implementation HLPHelpLoadingView

- (HLPHelpLoadingView)initWithFrame:(CGRect)a3
{
  HLPHelpLoadingView *v3;
  HLPHelpLoadingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HLPHelpLoadingView;
  v3 = -[HLPHelpLoadingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HLPHelpLoadingView updateBackgroundColor](v3, "updateBackgroundColor");
    -[HLPHelpLoadingView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
  }
  return v4;
}

- (void)setSupportsDarkMode:(BOOL)a3
{
  if (self->_supportsDarkMode != a3)
  {
    self->_supportsDarkMode = a3;
    -[HLPHelpLoadingView updateBackgroundColor](self, "updateBackgroundColor");
  }
}

- (void)updateBackgroundColor
{
  uint64_t v3;
  id v4;

  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_supportsDarkMode)
      objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  -[HLPHelpLoadingView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)showActivityIndicator:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;
  void *v8;
  void *v9;
  UIActivityIndicatorView *v10;

  if (a3)
  {
    -[HLPHelpLoadingView setHidden:](self, "setHidden:", 0);
    -[HLPHelpLoadingView removeErrorView](self, "removeErrorView");
    activityIndicatorView = self->_activityIndicatorView;
    if (!activityIndicatorView)
    {
      v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
      v6 = self->_activityIndicatorView;
      self->_activityIndicatorView = v5;

      -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIActivityIndicatorView sizeToFit](self->_activityIndicatorView, "sizeToFit");
      -[HLPHelpLoadingView addSubview:](self, "addSubview:", self->_activityIndicatorView);
      v7 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_activityIndicatorView, 9, 0, self, 9, 1.0, 0.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_activityIndicatorView, 10, 0, self, 10, 1.0, 0.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      -[HLPHelpLoadingView addConstraints:](self, "addConstraints:", v7);
      activityIndicatorView = self->_activityIndicatorView;
    }
    -[UIActivityIndicatorView startAnimating](activityIndicatorView, "startAnimating");
  }
  else
  {
    -[HLPHelpLoadingView setHidden:](self, "setHidden:", 1);
    -[UIActivityIndicatorView removeFromSuperview](self->_activityIndicatorView, "removeFromSuperview");
    v10 = self->_activityIndicatorView;
    self->_activityIndicatorView = 0;

  }
}

- (void)removeErrorView
{
  -[HLPHelpLoadingView showErrorWithTitle:message:](self, "showErrorWithTitle:message:", 0, 0);
}

- (void)showNoConnectionErrorMessage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("No Internet connection."), &stru_24D32F538, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Try again later."), &stru_24D32F538, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpLoadingView showErrorWithTitle:message:](self, "showErrorWithTitle:message:", v3, v5);

}

- (void)showDefaultErrorMessage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Can’t Open Help."), &stru_24D32F538, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Try again later."), &stru_24D32F538, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpLoadingView showErrorWithTitle:message:](self, "showErrorWithTitle:message:", v3, v5);

}

- (void)showErrorWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  UIImageView *errorImageView;
  UILabel *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  UIImageView *v16;
  UIImageView *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UILabel *v24;
  UILabel *errorTitleLabel;
  UIImageView *v26;
  UILabel *v27;
  UILabel *v28;
  void *v29;
  void *v30;
  UILabel *v31;
  UILabel *errorMessageLabel;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
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
  double v53;
  void *v54;
  void *v55;
  void *v56;
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
  id v76;

  v76 = a3;
  v6 = a4;
  -[HLPHelpLoadingView showActivityIndicator:](self, "showActivityIndicator:", 0);
  -[HLPHelpLoadingView setHidden:](self, "setHidden:", 0);
  v7 = v76;
  errorImageView = self->_errorImageView;
  if (v76 && v6)
  {
    if (!errorImageView || (v9 = self->_errorTitleLabel) == 0 || !self->_errorMessageLabel)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDF6F90]);
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HLPHelpLoadingView addSubview:](self, "addSubview:", v10);
      v11 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("HLPHelpBook"), v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = +[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS");
      if (v14)
      {
        objc_msgSend(v13, "imageWithRenderingMode:", 2);
        v15 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v15;
      }
      v75 = v13;
      v16 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v13);
      v17 = self->_errorImageView;
      self->_errorImageView = v16;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_errorImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView sizeToFit](self->_errorImageView, "sizeToFit");
      -[UIImageView setUserInteractionEnabled:](self->_errorImageView, "setUserInteractionEnabled:", 1);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel_showHelpBookInfo);
      objc_msgSend(v18, "setNumberOfTouchesRequired:", 1);
      objc_msgSend(v18, "setMinimumPressDuration:", 5.0);
      objc_msgSend(v18, "setAllowableMovement:", 50.0);
      -[UIImageView addGestureRecognizer:](self->_errorImageView, "addGestureRecognizer:", v18);
      objc_msgSend(v10, "addSubview:", self->_errorImageView);
      v19 = objc_alloc(MEMORY[0x24BDF6B68]);
      v20 = *MEMORY[0x24BDBF090];
      v21 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v22 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v23 = *(double *)(MEMORY[0x24BDBF090] + 24);
      v24 = (UILabel *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x24BDBF090], v21, v22, v23);
      errorTitleLabel = self->_errorTitleLabel;
      self->_errorTitleLabel = v24;

      -[UILabel setTextAlignment:](self->_errorTitleLabel, "setTextAlignment:", 1);
      -[UILabel setNumberOfLines:](self->_errorTitleLabel, "setNumberOfLines:", 0);
      -[UILabel setLineBreakMode:](self->_errorTitleLabel, "setLineBreakMode:", 0);
      if (v14)
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      else
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.368627451, 1.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_errorTitleLabel, "setTextColor:", v29);

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_errorTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_errorTitleLabel, "setFont:", v30);

      -[UILabel setAdjustsFontForContentSizeCategory:](self->_errorTitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
      objc_msgSend(v10, "addSubview:", self->_errorTitleLabel);
      v31 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v20, v21, v22, v23);
      errorMessageLabel = self->_errorMessageLabel;
      self->_errorMessageLabel = v31;

      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_errorMessageLabel, "setFont:", v33);

      -[UILabel setTextAlignment:](self->_errorMessageLabel, "setTextAlignment:", 1);
      -[UILabel setNumberOfLines:](self->_errorMessageLabel, "setNumberOfLines:", 0);
      -[UILabel setLineBreakMode:](self->_errorMessageLabel, "setLineBreakMode:", 0);
      if (v14)
        objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      else
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.666666667, 1.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_errorMessageLabel, "setTextColor:", v34);

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_errorMessageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setAdjustsFontForContentSizeCategory:](self->_errorMessageLabel, "setAdjustsFontForContentSizeCategory:", 1);
      objc_msgSend(v10, "addSubview:", self->_errorMessageLabel);
      objc_msgSend(v10, "topAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView topAnchor](self->_errorImageView, "topAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setActive:", 1);

      objc_msgSend(v10, "bottomAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel bottomAnchor](self->_errorMessageLabel, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setActive:", 1);

      objc_msgSend(v10, "leadingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpLoadingView leadingAnchor](self, "leadingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setActive:", 1);

      objc_msgSend(v10, "trailingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpLoadingView trailingAnchor](self, "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setActive:", 1);

      objc_msgSend(v10, "centerYAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpLoadingView centerYAnchor](self, "centerYAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setActive:", 1);

      -[UIImageView centerXAnchor](self->_errorImageView, "centerXAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "centerXAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setActive:", 1);

      v53 = 20.0;
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setTintColor:](self->_errorImageView, "setTintColor:", v54);

        -[UIImageView widthAnchor](self->_errorImageView, "widthAnchor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "constraintEqualToConstant:", 100.0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setActive:", 1);

        -[UIImageView setContentMode:](self->_errorImageView, "setContentMode:", 1);
        v53 = 8.0;
      }
      -[UILabel topAnchor](self->_errorTitleLabel, "topAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView bottomAnchor](self->_errorImageView, "bottomAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, v53);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setActive:", 1);

      -[UILabel centerXAnchor](self->_errorTitleLabel, "centerXAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "centerXAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setActive:", 1);

      -[UILabel widthAnchor](self->_errorTitleLabel, "widthAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "widthAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "constraintEqualToAnchor:multiplier:", v64, 0.9);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setActive:", 1);

      -[UILabel topAnchor](self->_errorMessageLabel, "topAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel bottomAnchor](self->_errorTitleLabel, "bottomAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 6.0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setActive:", 1);

      -[UILabel centerXAnchor](self->_errorMessageLabel, "centerXAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "centerXAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setActive:", 1);

      -[UILabel widthAnchor](self->_errorMessageLabel, "widthAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel widthAnchor](self->_errorTitleLabel, "widthAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "constraintEqualToAnchor:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setActive:", 1);

      v9 = self->_errorTitleLabel;
      v7 = v76;
    }
    -[UILabel setText:](v9, "setText:", v7);
    -[UILabel setText:](self->_errorMessageLabel, "setText:", v6);
  }
  else
  {
    -[UIImageView removeFromSuperview](errorImageView, "removeFromSuperview");
    -[UILabel removeFromSuperview](self->_errorTitleLabel, "removeFromSuperview");
    -[UILabel removeFromSuperview](self->_errorMessageLabel, "removeFromSuperview");
    v26 = self->_errorImageView;
    self->_errorImageView = 0;

    v27 = self->_errorTitleLabel;
    self->_errorTitleLabel = 0;

    v28 = self->_errorMessageLabel;
    self->_errorMessageLabel = 0;

  }
}

- (void)showHelpBookInfo
{
  id v3;

  -[HLPHelpLoadingView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showHelpBookInfo:", self);

}

- (HLPHelpLoadingViewDelegate)delegate
{
  return (HLPHelpLoadingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)supportsDarkMode
{
  return self->_supportsDarkMode;
}

- (UILabel)errorTitleLabel
{
  return self->_errorTitleLabel;
}

- (void)setErrorTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorTitleLabel, a3);
}

- (UILabel)errorMessageLabel
{
  return self->_errorMessageLabel;
}

- (void)setErrorMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessageLabel, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessageLabel, 0);
  objc_storeStrong((id *)&self->_errorTitleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_errorImageView, 0);
}

@end
