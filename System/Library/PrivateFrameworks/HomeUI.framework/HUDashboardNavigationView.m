@implementation HUDashboardNavigationView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUDashboardNavigationView)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithStyle_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDashboardNavigationView.m"), 61, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUDashboardNavigationView initWithCoder:]",
    v6);

  return 0;
}

- (HUDashboardNavigationView)initWithFrame:(CGRect)a3
{
  HUDashboardNavigationView *v3;
  HUDashboardNavigationView *v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *headerTitleLabelEffectView;
  id v8;
  uint64_t v9;
  UILabel *headerTitleLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIVisualEffectView *titleButtonEffectView;
  uint64_t v17;
  UIButton *titleButton;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  UIButton *homeAppButton;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  UIView *separatorView;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)HUDashboardNavigationView;
  v3 = -[HUDashboardNavigationView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUDashboardNavigationView setTitle:](v3, "setTitle:", &stru_1E6F60E80);
    -[HUDashboardNavigationView setHeaderTitle:](v4, "setHeaderTitle:", 0);
    v4->_hasTitleAction = 1;
    objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterSecondaryVibrancyEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v5);
    headerTitleLabelEffectView = v4->_headerTitleLabelEffectView;
    v4->_headerTitleLabelEffectView = (UIVisualEffectView *)v6;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4->_headerTitleLabelEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUDashboardNavigationView addSubview:](v4, "addSubview:", v4->_headerTitleLabelEffectView);
    v8 = objc_alloc(MEMORY[0x1E0CEA700]);
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    headerTitleLabel = v4->_headerTitleLabel;
    v4->_headerTitleLabel = (UILabel *)v9;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_headerTitleLabel, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_headerTitleLabel, "setTextColor:", v12);

    -[UILabel setLineBreakMode:](v4->_headerTitleLabel, "setLineBreakMode:", 4);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_headerTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView contentView](v4->_headerTitleLabelEffectView, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_headerTitleLabel);

    objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterPrimaryVibrancyEffect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v14);
    titleButtonEffectView = v4->_titleButtonEffectView;
    v4->_titleButtonEffectView = (UIVisualEffectView *)v15;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleButtonEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUDashboardNavigationView addSubview:](v4, "addSubview:", v4->_titleButtonEffectView);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    titleButton = v4->_titleButton;
    v4->_titleButton = (UIButton *)v17;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton titleLabel](v4->_titleButton, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLineBreakMode:", 4);

    -[UIButton setContentEdgeInsets:](v4->_titleButton, "setContentEdgeInsets:", 0.0, 0.0, 0.0, 4.0);
    -[UIVisualEffectView contentView](v4->_titleButtonEffectView, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v4->_titleButton);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4->_titleButton, "setTintColor:", v21);

    if (-[HUDashboardNavigationView effectiveUserInterfaceLayoutDirection](v4, "effectiveUserInterfaceLayoutDirection") == 1)
      v22 = 2;
    else
      v22 = 1;
    -[UIButton setContentHorizontalAlignment:](v4->_titleButton, "setContentHorizontalAlignment:", v22);
    if (-[HUDashboardNavigationView effectiveUserInterfaceLayoutDirection](v4, "effectiveUserInterfaceLayoutDirection") == 1)
      v23 = 3;
    else
      v23 = 4;
    -[UIButton setSemanticContentAttribute:](v4->_titleButton, "setSemanticContentAttribute:", v23);
    -[HUDashboardNavigationView _updateTitleButton](v4, "_updateTitleButton");
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v24 = objc_claimAutoreleasedReturnValue();
    homeAppButton = v4->_homeAppButton;
    v4->_homeAppButton = (UIButton *)v24;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_homeAppButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4->_homeAppButton, "setTintColor:", v26);

    -[UIButton imageView](v4->_homeAppButton, "imageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContentMode:", 1);

    -[UIButton addTarget:action:forControlEvents:](v4->_homeAppButton, "addTarget:action:forControlEvents:", v4, sel__didTapHomeAppButton_, 64);
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 4, 48.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("homekit"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "imageWithConfiguration:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "imageWithRenderingMode:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](v4->_homeAppButton, "setImage:forState:", v31, 0);
    -[HUDashboardNavigationView addSubview:](v4, "addSubview:", v4->_homeAppButton);
    objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
    v32 = objc_claimAutoreleasedReturnValue();
    separatorView = v4->_separatorView;
    v4->_separatorView = (UIView *)v32;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUDashboardNavigationView addSubview:](v4, "addSubview:", v4->_separatorView);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUDashboardNavigationView;
  -[HUDashboardNavigationView layoutSubviews](&v18, sel_layoutSubviews);
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ascender");
  v7 = v6 + -22.0;
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageEdgeInsets");
  v10 = v9;
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageEdgeInsets");
  v13 = v12;
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageEdgeInsets");
  v16 = v15;
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImageEdgeInsets:", v7, v10, v13, v16);

}

- (void)rotateChevronUp
{
  -[HUDashboardNavigationView _rotateChevronButtonToAngle:](self, "_rotateChevronButtonToAngle:", 3.14159265);
}

- (void)rotateChevronDown
{
  -[HUDashboardNavigationView _rotateChevronButtonToAngle:](self, "_rotateChevronButtonToAngle:", -6.28318531);
}

- (void)_rotateChevronButtonToAngle:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v8[5];
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v12;

  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeRotation(&v12, a3);
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  t2 = v12;
  v7 = CGAffineTransformEqualToTransform(&t1, &t2);

  if (!v7)
  {
    v8[1] = 3221225472;
    v9 = v12;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[2] = __57__HUDashboardNavigationView__rotateChevronButtonToAngle___block_invoke;
    v8[3] = &unk_1E6F4D468;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v8, &__block_literal_global_53, 1.0, 0.0, 0.5, 0.0);
  }
}

void __57__HUDashboardNavigationView__rotateChevronButtonToAngle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  __int128 v3;

  objc_msgSend(*(id *)(a1 + 32), "titleButton", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransform:", &v3);

}

- (void)_didTapLargeTitleButton:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  HUDashboardNavigationView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@ User tapped large title button", (uint8_t *)&v9, 0xCu);
  }

  -[HUDashboardNavigationView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HUDashboardNavigationView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dashboardNavigationView:didTapLargeTitleButton:", self, v4);

  }
}

- (void)_didTapHomeAppButton:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  HUDashboardNavigationView *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@ User tapped Home app button", buf, 0xCu);
  }

  -[HUDashboardNavigationView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dashboardNavigationView:didTapHomeAppButton:", self, v4);

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-homeAppButton"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31170], "sendGeneralButtonTapEventWithButtonTitle:sourceViewController:", v10, 0);
}

- (NSString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAttributedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[HUDashboardNavigationView title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  v6 = v5;
  if (v6 == v19)
  {
    v7 = 1;
  }
  else if (v19)
  {
    v7 = objc_msgSend(v19, "isEqual:", v6);
  }
  else
  {
    v7 = 0;
  }

  v8 = v19;
  if (v19 && (v7 & 1) == 0)
  {
    -[HUDashboardNavigationView largeTitleTextAttributes](self, "largeTitleTextAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CEA7B0]);
      objc_msgSend(v10, "largeTitleTextAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardNavigationView setLargeTitleTextAttributes:](self, "setLargeTitleTextAttributes:", v11);

    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v19);
    -[HUDashboardNavigationView largeTitleTextAttributes](self, "largeTitleTextAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_attributedStringWithDefaultAttributes:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    v16 = -[HUDashboardNavigationView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    if (v16 == 1)
      objc_msgSend(v15, "insertAttributedString:atIndex:", v17, 0);
    else
      objc_msgSend(v15, "appendAttributedString:", v17);

    -[HUDashboardNavigationView titleButton](self, "titleButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAttributedTitle:forState:", v15, 0);

    v8 = v19;
  }

}

- (NSString)headerTitle
{
  void *v2;
  void *v3;

  -[HUDashboardNavigationView headerTitleLabel](self, "headerTitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setHeaderTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HUDashboardNavigationView headerTitle](self, "headerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v6 = v5;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10)
    {
      v7 = objc_msgSend(v10, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    -[HUDashboardNavigationView headerTitleLabel](self, "headerTitleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v10);

    -[HUDashboardNavigationView headerTitleLabel](self, "headerTitleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizeToFit");

    -[HUDashboardNavigationView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
LABEL_8:

}

- (void)setHasTitleAction:(BOOL)a3
{
  if (self->_hasTitleAction != a3)
  {
    self->_hasTitleAction = a3;
    -[HUDashboardNavigationView _updateTitleButton](self, "_updateTitleButton");
  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v53;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  objc_super v117;
  _QWORD v118[25];

  v118[23] = *MEMORY[0x1E0C80C00];
  v117.receiver = self;
  v117.super_class = (Class)HUDashboardNavigationView;
  -[HUDashboardNavigationView updateConstraints](&v117, sel_updateConstraints);
  -[HUDashboardNavigationView allConstraints](self, "allConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUDashboardNavigationView allConstraints](self, "allConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  -[HUDashboardNavigationView headerTitleLabelEffectView](self, "headerTitleLabelEffectView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "topAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView topAnchor](self, "topAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:", v114);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v113;
  -[HUDashboardNavigationView headerTitleLabel](self, "headerTitleLabel");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "topAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView headerTitleLabelEffectView](self, "headerTitleLabelEffectView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "topAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:", v109);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v108;
  -[HUDashboardNavigationView headerTitleLabel](self, "headerTitleLabel");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "bottomAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView headerTitleLabelEffectView](self, "headerTitleLabelEffectView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "bottomAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v104);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v103;
  -[HUDashboardNavigationView headerTitleLabelEffectView](self, "headerTitleLabelEffectView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "bottomAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView titleButtonEffectView](self, "titleButtonEffectView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:", v99);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v118[3] = v98;
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "topAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView titleButtonEffectView](self, "titleButtonEffectView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "topAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:", v94);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v118[4] = v93;
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "bottomAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView titleButtonEffectView](self, "titleButtonEffectView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v118[5] = v88;
  -[HUDashboardNavigationView homeAppButton](self, "homeAppButton");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "bottomAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v84);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v118[6] = v83;
  -[HUDashboardNavigationView separatorView](self, "separatorView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView titleButtonEffectView](self, "titleButtonEffectView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, 18.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v118[7] = v78;
  -[HUDashboardNavigationView separatorView](self, "separatorView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "bottomAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v74);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v118[8] = v73;
  -[HUDashboardNavigationView separatorView](self, "separatorView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "heightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToConstant:", 0.75);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v118[9] = v70;
  -[HUDashboardNavigationView headerTitleLabelEffectView](self, "headerTitleLabelEffectView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v118[10] = v65;
  -[HUDashboardNavigationView headerTitleLabelEffectView](self, "headerTitleLabelEffectView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v118[11] = v60;
  -[HUDashboardNavigationView headerTitleLabel](self, "headerTitleLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView headerTitleLabelEffectView](self, "headerTitleLabelEffectView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v118[12] = v55;
  -[HUDashboardNavigationView headerTitleLabel](self, "headerTitleLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView headerTitleLabelEffectView](self, "headerTitleLabelEffectView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v118[13] = v49;
  -[HUDashboardNavigationView titleButtonEffectView](self, "titleButtonEffectView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v118[14] = v44;
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView titleButtonEffectView](self, "titleButtonEffectView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v118[15] = v39;
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView titleButtonEffectView](self, "titleButtonEffectView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v118[16] = v34;
  -[HUDashboardNavigationView homeAppButton](self, "homeAppButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView titleButtonEffectView](self, "titleButtonEffectView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v118[17] = v29;
  -[HUDashboardNavigationView homeAppButton](self, "homeAppButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v118[18] = v24;
  -[HUDashboardNavigationView separatorView](self, "separatorView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v118[19] = v19;
  -[HUDashboardNavigationView separatorView](self, "separatorView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardNavigationView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v118[20] = v8;
  -[HUDashboardNavigationView homeAppButton](self, "homeAppButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 48.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v118[21] = v11;
  -[HUDashboardNavigationView homeAppButton](self, "homeAppButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", 48.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v118[22] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 23);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDashboardNavigationView setAllConstraints:](self, "setAllConstraints:", v53);
  v15 = (void *)MEMORY[0x1E0CB3718];
  -[HUDashboardNavigationView allConstraints](self, "allConstraints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v16);

}

- (void)_updateTitleButton
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[HUDashboardNavigationView hasTitleAction](self, "hasTitleAction");
  -[HUDashboardNavigationView titleButton](self, "titleButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

  if (-[HUDashboardNavigationView hasTitleAction](self, "hasTitleAction"))
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithWeight:", 6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.down"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithConfiguration:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUDashboardNavigationView titleButton](self, "titleButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:forState:", v7, 0);

    -[HUDashboardNavigationView titleButton](self, "titleButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__didTapLargeTitleButton_, 64);

  }
  else
  {
    -[HUDashboardNavigationView titleButton](self, "titleButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:forState:", 0, 0);

    -[HUDashboardNavigationView titleButton](self, "titleButton");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeTarget:action:forControlEvents:", self, sel__didTapLargeTitleButton_, 64);
  }

}

- (HUDashboardNavigationViewDelegate)delegate
{
  return (HUDashboardNavigationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIVisualEffectView)headerTitleLabelEffectView
{
  return self->_headerTitleLabelEffectView;
}

- (void)setHeaderTitleLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitleLabelEffectView, a3);
}

- (UIVisualEffectView)titleButtonEffectView
{
  return self->_titleButtonEffectView;
}

- (void)setTitleButtonEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_titleButtonEffectView, a3);
}

- (UIButton)homeAppButton
{
  return self->_homeAppButton;
}

- (void)setHomeAppButton:(id)a3
{
  objc_storeStrong((id *)&self->_homeAppButton, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (BOOL)hasTitleAction
{
  return self->_hasTitleAction;
}

- (UILabel)headerTitleLabel
{
  return self->_headerTitleLabel;
}

- (void)setHeaderTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitleLabel, a3);
}

- (UIButton)titleButton
{
  return self->_titleButton;
}

- (void)setTitleButton:(id)a3
{
  objc_storeStrong((id *)&self->_titleButton, a3);
}

- (NSDictionary)largeTitleTextAttributes
{
  return self->_largeTitleTextAttributes;
}

- (void)setLargeTitleTextAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_largeTitleTextAttributes, a3);
}

- (NSArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_allConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_largeTitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_headerTitleLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_homeAppButton, 0);
  objc_storeStrong((id *)&self->_titleButtonEffectView, 0);
  objc_storeStrong((id *)&self->_headerTitleLabelEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
