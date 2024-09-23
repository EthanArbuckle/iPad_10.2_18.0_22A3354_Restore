@implementation MUPlaceAppLockupView

+ (CGSize)appIconSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 48.0;
  v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MUPlaceAppLockupView)initWithFrame:(CGRect)a3
{
  MUPlaceAppLockupView *v3;
  MUPlaceAppLockupView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceAppLockupView;
  v3 = -[MUPlaceAppLockupView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUPlaceAppLockupView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("PlaceAppLockup"));
    -[MUPlaceAppLockupView _setupSubviews](v4, "_setupSubviews");
    -[MUPlaceAppLockupView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupSubviews
{
  UILayoutGuide *v3;
  UILayoutGuide *titleSubtitleLayoutGuide;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIImageView *v10;
  UIImageView *appLockupImageView;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  UILabel *v24;
  UILabel *titleLabel;
  void *v26;
  void *v27;
  UILabel *v28;
  UILabel *subtitleLabel;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UIButton *v35;
  UIButton *punchoutButton;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  titleSubtitleLayoutGuide = self->_titleSubtitleLayoutGuide;
  self->_titleSubtitleLayoutGuide = v3;

  -[MUPlaceAppLockupView addLayoutGuide:](self, "addLayoutGuide:", self->_titleSubtitleLayoutGuide);
  v5 = objc_alloc(MEMORY[0x1E0DC3890]);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = (UIImageView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
  appLockupImageView = self->_appLockupImageView;
  self->_appLockupImageView = v10;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_appLockupImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView _setContinuousCornerRadius:](self->_appLockupImageView, "_setContinuousCornerRadius:", 10.0);
  +[MUInfoCardStyle tokenBackgroundColor](MUInfoCardStyle, "tokenBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_appLockupImageView, "setBackgroundColor:", v12);

  -[UIImageView setAccessibilityIdentifier:](self->_appLockupImageView, "setAccessibilityIdentifier:", CFSTR("PlaceAppLockupImage"));
  -[UIImageView layer](self->_appLockupImageView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorWithAlphaComponent:", 0.200000003);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "setBorderColor:", objc_msgSend(v15, "CGColor"));

  -[MUPlaceAppLockupView window](self, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "nativeScale");
    v20 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "nativeScale");
    v20 = v22;

  }
  -[UIImageView layer](self->_appLockupImageView, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBorderWidth:", 1.0 / v20);

  -[UIImageView setClipsToBounds:](self->_appLockupImageView, "setClipsToBounds:", 1);
  -[MUPlaceAppLockupView addSubview:](self, "addSubview:", self->_appLockupImageView);
  v24 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v24;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v27);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("PlaceAppLockupTitle"));
  -[MUPlaceAppLockupView addSubview:](self, "addSubview:", self->_titleLabel);
  v28 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v28;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v30);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v31);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("PlaceAppLockupSubtitle"));
  -[MUPlaceAppLockupView addSubview:](self, "addSubview:", self->_subtitleLabel);
  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle tokenBackgroundColor](MUInfoCardStyle, "tokenBackgroundColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "background");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBackgroundColor:", v33);

  objc_msgSend(v32, "setCornerStyle:", 4);
  objc_msgSend(v32, "setTitleTextAttributesTransformer:", &__block_literal_global_5);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v35 = (UIButton *)objc_claimAutoreleasedReturnValue();
  punchoutButton = self->_punchoutButton;
  self->_punchoutButton = v35;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_punchoutButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setConfiguration:](self->_punchoutButton, "setConfiguration:", v32);
  LODWORD(v37) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_punchoutButton, "setContentCompressionResistancePriority:forAxis:", 0, v37);
  LODWORD(v38) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_punchoutButton, "setContentCompressionResistancePriority:forAxis:", 1, v38);
  LODWORD(v39) = 1148846080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_punchoutButton, "setContentHuggingPriority:forAxis:", 0, v39);
  LODWORD(v40) = 1148846080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_punchoutButton, "setContentHuggingPriority:forAxis:", 1, v40);
  -[UIButton addTarget:action:forControlEvents:](self->_punchoutButton, "addTarget:action:forControlEvents:", self, sel__punchOutButtonSelected, 64);
  -[UIButton setAccessibilityIdentifier:](self->_punchoutButton, "setAccessibilityIdentifier:", CFSTR("PlaceAppLockupPunchoutButton"));
  -[MUPlaceAppLockupView addSubview:](self, "addSubview:", self->_punchoutButton);
  -[UIView _mapsui_addSelectGestureRecognizerWithTarget:action:](self, "_mapsui_addSelectGestureRecognizerWithTarget:action:", self, sel__punchOutButtonSelected);
  objc_opt_self();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (id)-[MUPlaceAppLockupView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v42, sel__updateHeightConstraint);

}

id __38__MUPlaceAppLockupView__setupSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1138]);

  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1140]);

  v6 = (void *)objc_msgSend(v2, "copy");
  return v6;
}

- (void)_setupConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *heightConstraint;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
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
  _QWORD v74[25];

  v74[23] = *MEMORY[0x1E0C80C00];
  -[MUPlaceAppLockupView heightAnchor](self, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView scaledHeight](self, "scaledHeight");
  objc_msgSend(v3, "constraintEqualToConstant:");
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v4;

  v49 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView heightAnchor](self->_appLockupImageView, "heightAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToConstant:", 48.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v72;
  -[UIImageView widthAnchor](self->_appLockupImageView, "widthAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView heightAnchor](self->_appLockupImageView, "heightAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v69;
  -[UIImageView leadingAnchor](self->_appLockupImageView, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView leadingAnchor](self, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 16.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v66;
  -[UIImageView trailingAnchor](self->_appLockupImageView, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_titleSubtitleLayoutGuide, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, -10.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v74[3] = v63;
  -[UIImageView topAnchor](self->_appLockupImageView, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView topAnchor](self, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:constant:", v61, 14.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v74[4] = v60;
  -[UIImageView bottomAnchor](self->_appLockupImageView, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView bottomAnchor](self, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:constant:", v58, -14.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v74[5] = v57;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_titleSubtitleLayoutGuide, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v74[6] = v54;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_titleSubtitleLayoutGuide, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v74[7] = v51;
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_titleSubtitleLayoutGuide, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v74[8] = v47;
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v74[9] = v44;
  -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_titleSubtitleLayoutGuide, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v74[10] = v41;
  -[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_titleSubtitleLayoutGuide, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v74[11] = v38;
  -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_titleSubtitleLayoutGuide, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v74[12] = v35;
  -[UILayoutGuide topAnchor](self->_titleSubtitleLayoutGuide, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView topAnchor](self, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:constant:", v33, 14.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v74[13] = v32;
  -[UILayoutGuide bottomAnchor](self->_titleSubtitleLayoutGuide, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView bottomAnchor](self, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:", v30, -14.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v74[14] = v29;
  -[UILayoutGuide trailingAnchor](self->_titleSubtitleLayoutGuide, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton leadingAnchor](self->_punchoutButton, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:constant:", v27, -16.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v74[15] = v26;
  -[UIButton trailingAnchor](self->_punchoutButton, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView trailingAnchor](self, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, -16.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v74[16] = v23;
  -[UIButton topAnchor](self->_punchoutButton, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView topAnchor](self, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:constant:", v21, 24.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v74[17] = v20;
  -[UIButton bottomAnchor](self->_punchoutButton, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView bottomAnchor](self, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:constant:", v18, -24.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v74[18] = v17;
  -[UIImageView centerYAnchor](self->_appLockupImageView, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView centerYAnchor](self, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v74[19] = v8;
  -[UILayoutGuide centerYAnchor](self->_titleSubtitleLayoutGuide, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView centerYAnchor](self, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v74[20] = v11;
  -[UIButton centerYAnchor](self->_punchoutButton, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceAppLockupView centerYAnchor](self, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_heightConstraint;
  v74[21] = v14;
  v74[22] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "activateConstraints:", v16);

}

- (void)setViewModel:(id)a3
{
  MUAppLockupViewModel *v5;
  MUAppLockupViewModel *v6;

  v5 = (MUAppLockupViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPlaceAppLockupView _updateAppearance](self, "_updateAppearance");
    v5 = v6;
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  UIButton *punchoutButton;
  void *v6;
  MUAppLockupViewModel *viewModel;
  _QWORD v8[5];
  id v9;
  id location;

  -[MUAppLockupViewModel titleText](self->_viewModel, "titleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  -[MUAppLockupViewModel subtitleText](self->_viewModel, "subtitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_subtitleLabel, "setText:", v4);

  punchoutButton = self->_punchoutButton;
  -[MUAppLockupViewModel actionButtonText](self->_viewModel, "actionButtonText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](punchoutButton, "setTitle:forState:", v6, 0);

  objc_initWeak(&location, self);
  viewModel = self->_viewModel;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__MUPlaceAppLockupView__updateAppearance__block_invoke;
  v8[3] = &unk_1E2E01758;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  -[MUAppLockupViewModel loadAppArtworkWithCompletion:](viewModel, "loadAppArtworkWithCompletion:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__MUPlaceAppLockupView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__MUPlaceAppLockupView__updateAppearance__block_invoke_2;
    v7[3] = &unk_1E2E01730;
    v7[4] = WeakRetained;
    v8 = v3;
    objc_msgSend(v6, "_mapsui_performImageLoadingTransitionWithAnimations:completion:", v7, 0);

  }
}

uint64_t __41__MUPlaceAppLockupView__updateAppearance__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setImage:", *(_QWORD *)(a1 + 40));
}

- (double)scaledHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 76.0);
  v5 = v4;

  return v5;
}

- (void)_punchOutButtonSelected
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "appLockupViewDidSelectPunchOutButton:", self);

}

- (void)_updateHeightConstraint
{
  -[MUPlaceAppLockupView scaledHeight](self, "scaledHeight");
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
}

- (MUPlaceAppLockupViewDelegate)delegate
{
  return (MUPlaceAppLockupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MUAppLockupViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_titleSubtitleLayoutGuide, 0);
  objc_storeStrong((id *)&self->_punchoutButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_appLockupImageView, 0);
}

@end
