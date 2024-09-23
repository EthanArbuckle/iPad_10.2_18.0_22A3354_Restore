@implementation CNFRegSigninLearnMoreView

- (CNFRegSigninLearnMoreView)initWithSpecifier:(id)a3
{
  id v5;
  CNFRegSigninLearnMoreView *v6;
  CNFRegSigninLearnMoreView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNFRegSigninLearnMoreView;
  v6 = -[CNFRegSigninLearnMoreView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_specifier, a3);
    v7->_serviceType = 0;
  }

  return v7;
}

- (id)_serviceTitle
{
  int64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  v2 = -[CNFRegSigninLearnMoreView serviceType](self, "serviceType");
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      CommunicationsSetupUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("IMESSAGE");
      goto LABEL_6;
    }
    if (v2)
    {
      v6 = &stru_24D077260;
      return v6;
    }
  }
  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("FACETIME");
LABEL_6:
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D077260, v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAuthKitSignInView:(id)a3
{
  UIView **p_authKitSignInView;
  void *v6;
  id v7;

  p_authKitSignInView = &self->_authKitSignInView;
  objc_storeStrong((id *)&self->_authKitSignInView, a3);
  v7 = a3;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](*p_authKitSignInView, "setBackgroundColor:", v6);

  -[CNFRegSigninLearnMoreView addSubview:](self, "addSubview:", *p_authKitSignInView);
}

- (void)setSigningIn:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "flush");
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.0);
  -[UIView setHidden:](self->_authKitSignInView, "setHidden:", v3);
  -[CNFRegSigninLearnMoreView signingInLabel](self, "signingInLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 ^ 1;
  objc_msgSend(v5, "setHidden:", v6);

  -[CNFRegSigninLearnMoreView signingInSpinner](self, "signingInSpinner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  -[CNFRegSigninLearnMoreView signingInSpinner](self, "signingInSpinner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) != 0)
    objc_msgSend(v8, "stopAnimating");
  else
    objc_msgSend(v8, "startAnimating");

  -[CNFRegSigninLearnMoreView setNeedsDisplay](self, "setNeedsDisplay");
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (id)_splashImage
{
  unint64_t serviceType;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  serviceType = self->_serviceType;
  if (serviceType > 2)
    v3 = 0;
  else
    v3 = off_24D076500[serviceType];
  v4 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v4, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIButton)learnMoreButton
{
  UIButton *learnMoreButton;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  UIButton *v10;
  void *v11;
  void *v12;

  learnMoreButton = self->_learnMoreButton;
  if (!learnMoreButton)
  {
    CommunicationsSetupUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FACETIME_SPLASH_LEARN_MORE"), &stru_24D077260, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegGlobalAppearanceController();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInteractionColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNFRegLearnMoreButton roundedButtonWithText:color:](CNFRegLearnMoreButton, "roundedButtonWithText:color:", v6, v8);
    v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v10 = self->_learnMoreButton;
    self->_learnMoreButton = v9;

    -[UIButton titleLabel](self->_learnMoreButton, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    -[UIButton setAutoresizingMask:](self->_learnMoreButton, "setAutoresizingMask:", 5);
    -[UIButton addTarget:action:forControlEvents:](self->_learnMoreButton, "addTarget:action:forControlEvents:", self, sel__learnMorePressed_, 64);
    -[CNFRegSigninLearnMoreView addSubview:](self, "addSubview:", self->_learnMoreButton);
    -[CNFRegSigninLearnMoreView setNeedsLayout](self, "setNeedsLayout");
    learnMoreButton = self->_learnMoreButton;
  }
  return learnMoreButton;
}

- (UIImageView)splashImageView
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  UIImageView *v7;
  UIImageView *splashImageView;

  if (!self->_splashImageView)
  {
    CNFRegGlobalAppearanceController();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "splashScreenShowsIcon");

    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x24BEBD668]);
      -[CNFRegSigninLearnMoreView _splashImage](self, "_splashImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (UIImageView *)objc_msgSend(v5, "initWithImage:", v6);
      splashImageView = self->_splashImageView;
      self->_splashImageView = v7;

      -[UIImageView sizeToFit](self->_splashImageView, "sizeToFit");
      -[CNFRegSigninLearnMoreView addSubview:](self, "addSubview:", self->_splashImageView);
      -[CNFRegSigninLearnMoreView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  return self->_splashImageView;
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD708]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_titleLabel;
    self->_titleLabel = v5;

    -[CNFRegSigninLearnMoreView _serviceTitle](self, "_serviceTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v7);

    objc_msgSend(MEMORY[0x24BEBB520], "_thinSystemFontOfSize:", 35.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v8);

    CNFRegGlobalAppearanceController();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "splashTitleLabelTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v10);

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v11);

    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[CNFRegSigninLearnMoreView addSubview:](self, "addSubview:", self->_titleLabel);
    -[CNFRegSigninLearnMoreView setNeedsLayout](self, "setNeedsLayout");
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UILabel)verbiageLabel
{
  UILabel *verbiageLabel;
  void *v4;
  id v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  verbiageLabel = self->_verbiageLabel;
  if (!verbiageLabel)
  {
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BEBD708]);
    v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v7 = self->_verbiageLabel;
    self->_verbiageLabel = v6;

    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supportsWLAN");
    v10 = _os_feature_enabled_impl();
    CNFRegStringTableName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CommunicationsSetupUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("FACETIME_SPLASH_SYNOPSIS_WLAN");
    if (v10)
      v13 = CFSTR("FACETIME_SPLASH_SYNOPSIS_WLAN_APPLEACCOUNT");
    v14 = CFSTR("FACETIME_SPLASH_SYNOPSIS_WIFI_APPLEACCOUNT");
    if (!v10)
      v14 = CFSTR("FACETIME_SPLASH_SYNOPSIS_WIFI");
    if (v9)
      v15 = (__CFString *)v13;
    else
      v15 = (__CFString *)v14;
    CNFLocalizedStringFromTableInBundleWithFallback(v15, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_verbiageLabel, "setText:", v16);

    objc_msgSend(v4, "tableFooterFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_verbiageLabel, "setFont:", v17);

    objc_msgSend(v4, "tableHeaderTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_verbiageLabel, "setTextColor:", v18);

    -[UILabel setNumberOfLines:](self->_verbiageLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_verbiageLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_verbiageLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_verbiageLabel, "setBackgroundColor:", v19);

    objc_msgSend(v4, "tableHeaderTextShadowColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](self->_verbiageLabel, "setShadowColor:", v20);

    objc_msgSend(v4, "tableHeaderTextShadowOffset");
    -[UILabel setShadowOffset:](self->_verbiageLabel, "setShadowOffset:");
    -[UILabel setAutoresizingMask:](self->_verbiageLabel, "setAutoresizingMask:", 18);
    -[CNFRegSigninLearnMoreView addSubview:](self, "addSubview:", self->_verbiageLabel);
    -[CNFRegSigninLearnMoreView setNeedsLayout](self, "setNeedsLayout");

    verbiageLabel = self->_verbiageLabel;
  }
  return verbiageLabel;
}

- (id)signingInLabel
{
  UILabel *signingInLabel;
  void *v4;
  id v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  signingInLabel = self->_signingInLabel;
  if (!signingInLabel)
  {
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BEBD708]);
    v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v7 = self->_signingInLabel;
    self->_signingInLabel = v6;

    CommunicationsSetupUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SIGNING_IN"), &stru_24D077260, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_signingInLabel, "setText:", v10);

    objc_msgSend(v4, "tableFooterFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_signingInLabel, "setFont:", v11);

    objc_msgSend(v4, "tableHeaderTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_signingInLabel, "setTextColor:", v12);

    -[UILabel setNumberOfLines:](self->_signingInLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_signingInLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_signingInLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_signingInLabel, "setBackgroundColor:", v13);

    objc_msgSend(v4, "tableHeaderTextShadowColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](self->_signingInLabel, "setShadowColor:", v14);

    objc_msgSend(v4, "tableHeaderTextShadowOffset");
    -[UILabel setShadowOffset:](self->_signingInLabel, "setShadowOffset:");
    -[UILabel setAutoresizingMask:](self->_signingInLabel, "setAutoresizingMask:", 18);
    -[UILabel setHidden:](self->_signingInLabel, "setHidden:", 1);
    -[CNFRegSigninLearnMoreView addSubview:](self, "addSubview:", self->_signingInLabel);
    -[CNFRegSigninLearnMoreView setNeedsLayout](self, "setNeedsLayout");

    signingInLabel = self->_signingInLabel;
  }
  return signingInLabel;
}

- (id)signingInSpinner
{
  UIActivityIndicatorView *signingInSpinner;
  void *v4;
  id v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *v7;
  void *v8;

  signingInSpinner = self->_signingInSpinner;
  if (!signingInSpinner)
  {
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BEBD398]);
    v6 = (UIActivityIndicatorView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v7 = self->_signingInSpinner;
    self->_signingInSpinner = v6;

    objc_msgSend(v4, "tableHeaderTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->_signingInSpinner, "setColor:", v8);

    -[UIActivityIndicatorView setHidden:](self->_signingInSpinner, "setHidden:", 1);
    -[CNFRegSigninLearnMoreView addSubview:](self, "addSubview:", self->_signingInSpinner);
    -[CNFRegSigninLearnMoreView setNeedsLayout](self, "setNeedsLayout");

    signingInSpinner = self->_signingInSpinner;
  }
  return signingInSpinner;
}

- (void)setServiceType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_serviceType != a3)
  {
    self->_serviceType = a3;
    -[CNFRegSigninLearnMoreView splashImageView](self, "splashImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSigninLearnMoreView _splashImage](self, "_splashImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v5);

    -[CNFRegSigninLearnMoreView _serviceTitle](self, "_serviceTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v6);

    -[CNFRegSigninLearnMoreView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MidX;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  CGFloat v30;
  double MaxY;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  CGFloat v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  CGFloat v62;
  void *v63;
  void *v64;
  double v65;
  CGFloat v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  CGFloat v90;
  CGFloat v91;
  id v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  -[CNFRegSigninLearnMoreView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v91 = v9;
  -[CNFRegSigninLearnMoreView splashImageView](self, "splashImageView");
  v92 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v93.origin.x = v4;
  v93.origin.y = v6;
  v93.size.width = v8;
  v93.size.height = v10;
  MidX = CGRectGetMidX(v93);
  v94.origin.x = v12;
  v94.origin.y = v14;
  v94.size.width = v16;
  v94.size.height = v18;
  v20 = floor(MidX - CGRectGetWidth(v94) * 0.5);
  objc_msgSend(v92, "setFrame:", v20, 48.0, v16, v18);
  v95.origin.x = v20;
  v95.origin.y = 48.0;
  v95.size.width = v16;
  v95.size.height = v18;
  v21 = CGRectGetMaxY(v95) + 44.0;
  -[CNFRegSigninLearnMoreView titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v24 = v23;
  v26 = v25;
  v96.origin.x = v4;
  v96.origin.y = v6;
  v96.size.width = v8;
  v96.size.height = v91;
  v27 = floor(CGRectGetMidX(v96) - v24 * 0.5);
  objc_msgSend(v22, "font");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "ascender");
  v30 = floor(v21 - v29);

  objc_msgSend(v22, "setFrame:", v27, v30, v24, v26);
  v97.origin.x = v27;
  v97.origin.y = v30;
  v97.size.width = v24;
  v97.size.height = v26;
  MaxY = CGRectGetMaxY(v97);
  objc_msgSend(v22, "font");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "descender");
  v34 = MaxY + v33 + 43.0;

  -[CNFRegSigninLearnMoreView verbiageLabel](self, "verbiageLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v98.origin.x = v4;
  v98.origin.y = v6;
  v98.size.width = v8;
  v98.size.height = v91;
  objc_msgSend(v35, "sizeThatFits:", CGRectGetWidth(v98) + -20.0, 1.79769313e308);
  v37 = v36;
  v39 = v38;
  v99.origin.x = v4;
  v99.origin.y = v6;
  v99.size.width = v8;
  v99.size.height = v91;
  v40 = floor(CGRectGetMidX(v99) - v37 * 0.5);
  objc_msgSend(v35, "numberOfLines");
  objc_msgSend(v35, "font");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "ascender");
  objc_msgSend(v35, "font");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "descender");
  objc_msgSend(v35, "font");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leading");

  objc_msgSend(v35, "font");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "ascender");
  v46 = floor(v34 - v45);

  objc_msgSend(v35, "setFrame:", v40, v46, v37, v39);
  v100.origin.x = v40;
  v100.origin.y = v46;
  v100.size.width = v37;
  v100.size.height = v39;
  v47 = CGRectGetMaxY(v100);
  objc_msgSend(v35, "font");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "descender");
  v50 = v49;

  -[CNFRegSigninLearnMoreView learnMoreButton](self, "learnMoreButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sizeToFit");
  objc_msgSend(v51, "bounds");
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v59 = v8;
  v90 = v8;
  if (v52 <= v8)
    v8 = v52;
  v60 = v47 + v50 + 24.0;
  v101.origin.x = v4;
  v101.origin.y = v6;
  v101.size.width = v59;
  v101.size.height = v91;
  v61 = CGRectGetMidX(v101);
  v102.origin.x = v54;
  v102.origin.y = v56;
  v102.size.width = v8;
  v102.size.height = v58;
  v62 = floor(v61 - CGRectGetWidth(v102) * 0.5);
  objc_msgSend(v51, "titleLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "font");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "ascender");
  v66 = floor(v60 - v65);

  objc_msgSend(v51, "setFrame:", v62, v66, v8, v58);
  v103.origin.x = v62;
  v103.origin.y = v66;
  v103.size.width = v8;
  v103.size.height = v58;
  v67 = CGRectGetMaxY(v103);
  objc_msgSend(v51, "titleLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "font");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "descender");
  v71 = ceil(v67 + v70 + 40.0);

  -[UIView sizeToFit](self->_authKitSignInView, "sizeToFit");
  -[CNFRegSigninLearnMoreView frame](self, "frame");
  v73 = v72;
  v104.origin.x = v4;
  v104.size.width = v90;
  v104.origin.y = v6;
  v104.size.height = v91;
  -[UIView setFrame:](self->_authKitSignInView, "setFrame:", 0.0, v71, v73, CGRectGetHeight(v104) - v71);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_authKitSignInView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[CNFRegSigninLearnMoreView signingInLabel](self, "signingInLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "sizeToFit");

  -[CNFRegSigninLearnMoreView signingInLabel](self, "signingInLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "frame");
  v77 = v76;
  v79 = v78;

  -[CNFRegSigninLearnMoreView frame](self, "frame");
  v81 = v80 * 0.5 - v77 * 0.5;
  -[CNFRegSigninLearnMoreView signingInLabel](self, "signingInLabel");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setFrame:", v81, v71, v77, v79);

  -[CNFRegSigninLearnMoreView signingInSpinner](self, "signingInSpinner");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "sizeToFit");

  -[CNFRegSigninLearnMoreView signingInSpinner](self, "signingInSpinner");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "frame");
  v86 = v85;
  v88 = v87;

  -[CNFRegSigninLearnMoreView signingInSpinner](self, "signingInSpinner");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setFrame:", v81 - v86 + -6.0, v71, v86, v88);

}

- (double)preferredHeightForWidth:(double)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;

  if (a3 == 0.0)
    a3 = 320.0;
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (a3 >= 20.0)
    v5 = a3 + -20.0;
  else
    v5 = 0.0;
  -[CNFRegSigninLearnMoreView splashImageView](self, "splashImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v4 + v7 + 92.0;
  -[CNFRegSigninLearnMoreView titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v9, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      objc_msgSend(v9, "sizeThatFits:", v5, 1.79769313e308);
      v8 = v8 + v14 + 43.0;
    }
  }
  -[CNFRegSigninLearnMoreView verbiageLabel](self, "verbiageLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v15, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      objc_msgSend(v15, "sizeThatFits:", v5, 1.79769313e308);
      v8 = v8 + v20 + 24.0;
    }
  }
  -[CNFRegSigninLearnMoreView learnMoreButton](self, "learnMoreButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v8 + v22 + 40.0;

  -[UIView frame](self->_authKitSignInView, "frame");
  v25 = v23 + v24;

  return v25;
}

- (void)_learnMorePressed:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)*MEMORY[0x24BEBDF78];
  CNFRegLocalizedSplashScreenURL();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v4, 0);

}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (CNFRegSplashSignInController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  self->_controller = (CNFRegSplashSignInController *)a3;
}

- (void)setSplashImageView:(id)a3
{
  objc_storeStrong((id *)&self->_splashImageView, a3);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setVerbiageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_verbiageLabel, a3);
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (UIView)authKitSignInView
{
  return self->_authKitSignInView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authKitSignInView, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_verbiageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_splashImageView, 0);
  objc_storeStrong((id *)&self->_signingInSpinner, 0);
  objc_storeStrong((id *)&self->_signingInLabel, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
