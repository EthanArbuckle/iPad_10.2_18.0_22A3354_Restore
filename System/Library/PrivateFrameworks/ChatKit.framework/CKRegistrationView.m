@implementation CKRegistrationView

- (void)setAuthKitSignInView:(id)a3
{
  UIView *v5;
  id *p_authKitSignInView;
  UIView *authKitSignInView;
  id v8;
  void *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_authKitSignInView = (id *)&self->_authKitSignInView;
  authKitSignInView = self->_authKitSignInView;
  if (authKitSignInView != v5)
  {
    v10 = v5;
    -[UIView removeFromSuperview](authKitSignInView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_authKitSignInView, a3);
    v8 = *p_authKitSignInView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    objc_msgSend(*p_authKitSignInView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[CKRegistrationView addSubview:](self, "addSubview:", *p_authKitSignInView);
    v5 = v10;
  }

}

- (void)setSigningIn:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  -[UIView setHidden:](self->_authKitSignInView, "setHidden:");
  -[CKRegistrationView signingInLabel](self, "signingInLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = !v3;
  objc_msgSend(v5, "setHidden:", v6);

  -[CKRegistrationView signingInSpinner](self, "signingInSpinner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  -[CKRegistrationView signingInSpinner](self, "signingInSpinner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "stopAnimating");
  else
    objc_msgSend(v8, "startAnimating");

  -[CKRegistrationView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setPrivacyLinkView:(id)a3
{
  UIView *v4;
  UIView *privacyLinkView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_privacyLinkView, "removeFromSuperview");
  privacyLinkView = self->_privacyLinkView;
  self->_privacyLinkView = v4;
  v6 = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_privacyLinkView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[CKRegistrationView addSubview:](self, "addSubview:", self->_privacyLinkView);

}

- (UIImageView)iconImageView
{
  UIImageView *iconImageView;
  id v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIImageView *v14;

  iconImageView = self->_iconImageView;
  if (!iconImageView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "signInAppIconImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v6);
    v8 = self->_iconImageView;
    self->_iconImageView = v7;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "signInSplashImageSize");
    v11 = v10;
    v13 = v12;

    v14 = self->_iconImageView;
    if (v11 == *MEMORY[0x1E0C9D820] && v13 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      -[UIImageView sizeToFit](v14, "sizeToFit");
    else
      -[UIImageView setFrame:](v14, "setFrame:", 0.0, 0.0, v11, v13);
    -[CKRegistrationView addSubview:](self, "addSubview:", self->_iconImageView);
    -[CKRegistrationView setNeedsLayout](self, "setNeedsLayout");
    iconImageView = self->_iconImageView;
  }
  return iconImageView;
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
  void *v12;
  void *v13;
  void *v14;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_titleLabel;
    self->_titleLabel = v5;

    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MADRID"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v8);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "signInTitleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v10);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v13);

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v14);

    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[CKRegistrationView addSubview:](self, "addSubview:", self->_titleLabel);
    -[CKRegistrationView setNeedsLayout](self, "setNeedsLayout");
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UILabel)verbiageLabel
{
  UILabel *verbiageLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  verbiageLabel = self->_verbiageLabel;
  if (!verbiageLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_verbiageLabel;
    self->_verbiageLabel = v5;

    v7 = MGGetBoolAnswer();
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      v10 = CFSTR("IMESSAGE_REGISTRATION_BLURB_GREENTEA");
    else
      v10 = CFSTR("IMESSAGE_REGISTRATION_BLURB");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_verbiageLabel, "setText:", v11);

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB538]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v12, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_verbiageLabel, "setFont:", v13);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "theme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "primaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_verbiageLabel, "setTextColor:", v16);

    -[UILabel setNumberOfLines:](self->_verbiageLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_verbiageLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_verbiageLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_verbiageLabel, "setBackgroundColor:", v17);

    -[UILabel setAutoresizingMask:](self->_verbiageLabel, "setAutoresizingMask:", 18);
    -[UILabel sizeToFit](self->_verbiageLabel, "sizeToFit");
    -[CKRegistrationView addSubview:](self, "addSubview:", self->_verbiageLabel);
    -[CKRegistrationView setNeedsLayout](self, "setNeedsLayout");

    verbiageLabel = self->_verbiageLabel;
  }
  return verbiageLabel;
}

- (UILabel)signingInLabel
{
  UILabel *signingInLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  signingInLabel = self->_signingInLabel;
  if (!signingInLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_signingInLabel;
    self->_signingInLabel = v5;

    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("IMESSAGE_REGISTRATION_SIGNING_IN"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_signingInLabel, "setText:", v8);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_signingInLabel, "setFont:", v9);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "theme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "primaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_signingInLabel, "setTextColor:", v12);

    -[UILabel setNumberOfLines:](self->_signingInLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_signingInLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_signingInLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_signingInLabel, "setBackgroundColor:", v13);

    -[UILabel setAutoresizingMask:](self->_signingInLabel, "setAutoresizingMask:", 18);
    -[UILabel setHidden:](self->_signingInLabel, "setHidden:", 1);
    -[CKRegistrationView addSubview:](self, "addSubview:", self->_signingInLabel);
    -[CKRegistrationView setNeedsLayout](self, "setNeedsLayout");
    signingInLabel = self->_signingInLabel;
  }
  return signingInLabel;
}

- (UIActivityIndicatorView)signingInSpinner
{
  UIActivityIndicatorView *signingInSpinner;
  id v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;
  void *v8;

  signingInSpinner = self->_signingInSpinner;
  if (!signingInSpinner)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA2C8]);
    v5 = (UIActivityIndicatorView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_signingInSpinner;
    self->_signingInSpinner = v5;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signInActivityIndicatorColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->_signingInSpinner, "setColor:", v8);

    -[UIActivityIndicatorView setHidden:](self->_signingInSpinner, "setHidden:", 1);
    -[CKRegistrationView addSubview:](self, "addSubview:", self->_signingInSpinner);
    -[CKRegistrationView setNeedsLayout](self, "setNeedsLayout");
    signingInSpinner = self->_signingInSpinner;
  }
  return signingInSpinner;
}

- (UIButton)learnMoreButton
{
  UIButton *learnMoreButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  learnMoreButton = self->_learnMoreButton;
  if (!learnMoreButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_learnMoreButton;
    self->_learnMoreButton = v4;

    v6 = self->_learnMoreButton;
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("IMESSAGE_REGISTRATION_LEARN_MORE"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB538]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](self->_learnMoreButton, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "signInTintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[UIButton setTitleColor:forState:](self->_learnMoreButton, "setTitleColor:forState:", v13, 0);
    -[UIButton setAutoresizingMask:](self->_learnMoreButton, "setAutoresizingMask:", 5);
    -[UIButton addTarget:action:forControlEvents:](self->_learnMoreButton, "addTarget:action:forControlEvents:", self, sel__learnMorePressed_, 64);
    -[CKRegistrationView addSubview:](self, "addSubview:", self->_learnMoreButton);
    -[CKRegistrationView setNeedsLayout](self, "setNeedsLayout");

    learnMoreButton = self->_learnMoreButton;
  }
  return learnMoreButton;
}

- (CGSize)manualSizeToFitForAuthKitSignInView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  double MaxX;
  double v12;
  double v13;
  double MaxY;
  double MinY;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGSize result;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UIView subviews](self->_authKitSignInView, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    v6 = 0.0;
    v7 = 2147483650.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "frame");
        MaxX = CGRectGetMaxX(v25);
        objc_msgSend(v10, "frame");
        v12 = MaxX - CGRectGetWidth(v26);
        objc_msgSend(v10, "frame");
        v13 = v12 + v12 + CGRectGetWidth(v27);
        objc_msgSend(v10, "frame");
        MaxY = CGRectGetMaxY(v28);
        objc_msgSend(v10, "frame");
        MinY = CGRectGetMinY(v29);
        if (v7 >= MinY)
          v7 = MinY;
        if (v8 <= v13)
          v8 = v13;
        if (v6 <= MaxY)
          v6 = MaxY;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
    v7 = 2147483650.0;
    v8 = 0.0;
  }

  v16 = v7 + v7 + v6;
  v17 = v8;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MidX;
  CGFloat v22;
  double MaxY;
  void *v24;
  double v25;
  CGFloat v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  void *v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  CGFloat v86;
  void *v87;
  void *v88;
  double v89;
  CGFloat v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  double v96;
  id v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat rect;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;

  -[CKRegistrationView bounds](self, "bounds");
  v4 = v3;
  v98 = v3;
  v99 = v5;
  v6 = v5;
  v96 = v7;
  v9 = v8;
  rect = v8;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "signInSplashImageTopPadding");
  v12 = v11;

  -[CKRegistrationView iconImageView](self, "iconImageView");
  v97 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v101.origin.x = v4;
  v101.origin.y = v6;
  v101.size.width = v96;
  v101.size.height = v9;
  MidX = CGRectGetMidX(v101);
  v102.origin.x = v14;
  v102.origin.y = v16;
  v102.size.width = v18;
  v102.size.height = v20;
  v22 = floor(MidX - CGRectGetWidth(v102) * 0.5);
  objc_msgSend(v97, "setFrame:", v22, v12, v18, v20);
  v103.origin.x = v22;
  v103.origin.y = v12;
  v103.size.width = v18;
  v103.size.height = v20;
  MaxY = CGRectGetMaxY(v103);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "signInSplashImageBottomPadding");
  v26 = MaxY + v25;

  -[CKRegistrationView titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v29 = v28;
  v31 = v30;
  v104.origin.x = v98;
  v104.origin.y = v99;
  v104.size.width = v96;
  v104.size.height = rect;
  v32 = floor(CGRectGetMidX(v104) - v29 * 0.5);
  objc_msgSend(v27, "setFrame:", v32, v26, v29, v31);
  v105.origin.x = v32;
  v105.origin.y = v26;
  v105.size.width = v29;
  v105.size.height = v31;
  v33 = CGRectGetMaxY(v105);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "signInTitleBottomPadding");
  v36 = v33 + v35;

  -[CKRegistrationView verbiageLabel](self, "verbiageLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v106.origin.x = v98;
  v106.origin.y = v99;
  v106.size.width = v96;
  v106.size.height = rect;
  objc_msgSend(v37, "sizeThatFits:", CGRectGetWidth(v106) + -20.0, 1.79769313e308);
  v39 = v38;
  v41 = v40;
  v107.origin.x = v98;
  v107.origin.y = v99;
  v107.size.width = v96;
  v107.size.height = rect;
  v42 = floor(CGRectGetMidX(v107) - v39 * 0.5);
  objc_msgSend(v37, "setFrame:", v42, v36, v39, v41);
  v108.origin.x = v42;
  v108.origin.y = v36;
  v108.size.width = v39;
  v108.size.height = v41;
  v43 = CGRectGetMaxY(v108) + 0.0;
  -[CKRegistrationView learnMoreButton](self, "learnMoreButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sizeToFit");
  objc_msgSend(v44, "bounds");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  if (v45 <= v96)
    v52 = v45;
  else
    v52 = v96;
  v109.origin.x = v98;
  v109.origin.y = v99;
  v109.size.width = v96;
  v109.size.height = rect;
  v53 = CGRectGetMidX(v109);
  v110.origin.x = v47;
  v110.origin.y = v49;
  v110.size.width = v52;
  v110.size.height = v51;
  v54 = floor(v53 - CGRectGetWidth(v110) * 0.5);
  objc_msgSend(v44, "setFrame:", v54, v43, v52, v51);
  v111.origin.x = v54;
  v111.origin.y = v43;
  v111.size.width = v52;
  v111.size.height = v51;
  v55 = ceil(CGRectGetMaxY(v111) + 5.0);
  -[UIView origin](self->_authKitSignInView, "origin");
  v57 = v56;
  v59 = v58;
  -[CKRegistrationView manualSizeToFitForAuthKitSignInView](self, "manualSizeToFitForAuthKitSignInView");
  v62 = v61;
  v63 = v96;
  if (v60 <= v96)
    v64 = v60;
  else
    v64 = v96;
  v65 = v98;
  v66 = v99;
  v67 = rect;
  v68 = CGRectGetMidX(*(CGRect *)(&v63 - 2));
  v112.origin.x = v57;
  v112.origin.y = v59;
  v112.size.width = v64;
  v112.size.height = v62;
  v69 = floor(v68 - CGRectGetWidth(v112) * 0.5);
  -[UIView setFrame:](self->_authKitSignInView, "setFrame:", v69, v55, v64, v62);
  -[CKRegistrationView signingInLabel](self, "signingInLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "sizeToFit");

  -[CKRegistrationView signingInLabel](self, "signingInLabel");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "frame");
  v73 = v72;
  v75 = v74;

  -[CKRegistrationView frame](self, "frame");
  v77 = v76 * 0.5 - v73 * 0.5;
  -[CKRegistrationView signingInLabel](self, "signingInLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setFrame:", v77, v55, v73, v75);

  -[CKRegistrationView signingInSpinner](self, "signingInSpinner");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "sizeToFit");

  -[CKRegistrationView signingInSpinner](self, "signingInSpinner");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "frame");
  v82 = v81;
  v84 = v83;

  -[CKRegistrationView signingInSpinner](self, "signingInSpinner");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setFrame:", v77 - v82 + -6.0, v55, v82, v84);

  v113.origin.x = v69;
  v113.origin.y = v55;
  v113.size.width = v64;
  v113.size.height = v62;
  v86 = ceil(CGRectGetMaxY(v113));
  -[CKRegistrationView privacyLinkView](self, "privacyLinkView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "signInPrivacyWidthMultiplier");
  v90 = v96 * v89;

  LODWORD(v91) = 1112014848;
  LODWORD(v92) = 1132068864;
  objc_msgSend(v87, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v90, 0.0, v91, v92);
  v94 = v93;
  v114.origin.x = v98;
  v114.origin.y = v99;
  v114.size.width = v96;
  v114.size.height = rect;
  v95 = floor(CGRectGetMidX(v114) - v90 * 0.5);
  objc_msgSend(v87, "setFrame:", v95, v86, v90, v94);
  v115.origin.x = v95;
  v115.origin.y = v86;
  v115.size.width = v90;
  v115.size.height = v94;
  -[CKRegistrationView setContentSize:](self, "setContentSize:", v96, ceil(CGRectGetMaxY(v115) + 20.0));

}

- (void)_learnMorePressed:(id)a3
{
  void (*v3)(uint64_t);
  void (*v4)(void);
  void *v5;
  id v6;

  v3 = (void (*)(uint64_t))MEMORY[0x193FF3C24]("CNFRegSetStringTableForServiceType", CFSTR("CommunicationsSetupUI"), a3);
  v3(1);
  v4 = (void (*)(void))MEMORY[0x193FF3C24]("CNFRegLocalizedSplashScreenURL", CFSTR("CommunicationsSetupUI"));
  v5 = (void *)*MEMORY[0x1E0CEB258];
  v4();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:", v6);

}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setVerbiageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_verbiageLabel, a3);
}

- (void)setSigningInLabel:(id)a3
{
  objc_storeStrong((id *)&self->_signingInLabel, a3);
}

- (void)setSigningInSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_signingInSpinner, a3);
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (UIView)authKitSignInView
{
  return self->_authKitSignInView;
}

- (UIView)privacyLinkView
{
  return self->_privacyLinkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLinkView, 0);
  objc_storeStrong((id *)&self->_authKitSignInView, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_signingInSpinner, 0);
  objc_storeStrong((id *)&self->_signingInLabel, 0);
  objc_storeStrong((id *)&self->_verbiageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
