@implementation SFSecurityRecommendationInfoCell

- (SFSecurityRecommendationInfoCell)initWithConfiguration:(unint64_t)a3 reuseIdentifier:(id)a4
{
  SFSecurityRecommendationInfoCell *v5;
  SFSecurityRecommendationInfoCell *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *iconView;
  void *v10;
  UILabel *v11;
  UILabel *titleLabel;
  void *v13;
  void *v14;
  double v15;
  double v16;
  UILabel *v17;
  UILabel *subtitleLabel;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *standardTitleTrailingConstraint;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIImageView *v38;
  UIImageView *completedUpgradeCheckmarkView;
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
  uint64_t v52;
  NSArray *completedUpgradeCheckmarkViewConstraints;
  SFAccountIconSharingBadgeImageCoordinator *v54;
  UIImageView *v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  SFAccountIconSharingBadgeImageCoordinator *badgeImageCoordinator;
  SFSecurityRecommendationInfoCell *v61;
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
  objc_super v93;
  _QWORD v94[5];
  _QWORD v95[14];

  v95[12] = *MEMORY[0x1E0C80C00];
  v93.receiver = self;
  v93.super_class = (Class)SFSecurityRecommendationInfoCell;
  v5 = -[SFSecurityRecommendationInfoCell initWithStyle:reuseIdentifier:](&v93, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v6 = v5;
  if (v5)
  {
    v5->_configuration = a3;
    -[SFSecurityRecommendationInfoCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconView = v6->_iconView;
    v6->_iconView = v8;

    if (v6->_configuration == 1)
      -[UIImageView _setContinuousCornerRadius:](v6->_iconView, "_setContinuousCornerRadius:", 12.0);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView layer](v6->_iconView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMasksToBounds:", 1);

    -[UIImageView setContentMode:](v6->_iconView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v6->_iconView, "setClipsToBounds:", 1);
    objc_msgSend(v7, "addSubview:", v6->_iconView);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = v11;

    +[_SFAccountManagerAppearanceValues titleFontForLargerCell](_SFAccountManagerAppearanceValues, "titleFontForLargerCell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->_titleLabel, "setFont:", v13);

    -[UILabel setNumberOfLines:](v6->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v6->_titleLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_titleLabel, "setTextColor:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v6->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v15) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v6->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v15);
    LODWORD(v16) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v6->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    objc_msgSend(v7, "addSubview:", v6->_titleLabel);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v6->_subtitleLabel;
    v6->_subtitleLabel = v17;

    +[_SFAccountManagerAppearanceValues subtitleFontForLargerCell](_SFAccountManagerAppearanceValues, "subtitleFontForLargerCell");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->_subtitleLabel, "setFont:", v19);

    -[UILabel setNumberOfLines:](v6->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v6->_subtitleLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v6->_subtitleLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_subtitleLabel, "setTextColor:", v20);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v6->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v21) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v6->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    objc_msgSend(v7, "addSubview:", v6->_subtitleLabel);
    if (a3)
      v22 = 0.0;
    else
      v22 = -1.5;
    -[SFSecurityRecommendationInfoCell contentView](v6, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel trailingAnchor](v6->_titleLabel, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    standardTitleTrailingConstraint = v6->_standardTitleTrailingConstraint;
    v6->_standardTitleTrailingConstraint = (NSLayoutConstraint *)v27;

    -[UIImageView widthAnchor](v6->_iconView, "widthAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSecurityRecommendationInfoCell _iconWidth](v6, "_iconWidth");
    objc_msgSend(v87, "constraintEqualToConstant:");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v85;
    -[UIImageView heightAnchor](v6->_iconView, "heightAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView widthAnchor](v6->_iconView, "widthAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v82);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v81;
    -[UIImageView leadingAnchor](v6->_iconView, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, v22);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2] = v78;
    -[UILabel leadingAnchor](v6->_titleLabel, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v6->_iconView, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v76, 1.5);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v95[3] = v75;
    -[UILabel leadingAnchor](v6->_subtitleLabel, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v6->_titleLabel, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v95[4] = v72;
    -[UILabel trailingAnchor](v6->_subtitleLabel, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v24;
    objc_msgSend(v24, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v95[5] = v69;
    v95[6] = v6->_standardTitleTrailingConstraint;
    -[UIImageView topAnchor](v6->_iconView, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v67, 1.5);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v95[7] = v66;
    objc_msgSend(v7, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v6->_iconView, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v64, 1.5);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v95[8] = v63;
    -[UILabel topAnchor](v6->_titleLabel, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView topAnchor](v6->_iconView, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v95[9] = v31;
    -[UILabel topAnchor](v6->_subtitleLabel, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v6->_titleLabel, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v33, 0.5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v95[10] = v34;
    objc_msgSend(v7, "bottomAnchor");
    v91 = v7;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v6->_subtitleLabel, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v36, 1.5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v95[11] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 12);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6->_configuration == 1)
    {
      v38 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      completedUpgradeCheckmarkView = v6->_completedUpgradeCheckmarkView;
      v6->_completedUpgradeCheckmarkView = v38;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_completedUpgradeCheckmarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "imageWithTintColor:renderingMode:", v41, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v6->_completedUpgradeCheckmarkView, "setImage:", v42);

      -[UIImageView setAlpha:](v6->_completedUpgradeCheckmarkView, "setAlpha:", 0.0);
      objc_msgSend(v91, "addSubview:", v6->_completedUpgradeCheckmarkView);
      -[UIImageView widthAnchor](v6->_completedUpgradeCheckmarkView, "widthAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintGreaterThanOrEqualToConstant:", 28.0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = v88;
      -[UIImageView heightAnchor](v6->_completedUpgradeCheckmarkView, "heightAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintEqualToConstant:", 28.0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v94[1] = v84;
      -[UIImageView trailingAnchor](v6->_completedUpgradeCheckmarkView, "trailingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "trailingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v94[2] = v45;
      -[UIImageView leadingAnchor](v6->_completedUpgradeCheckmarkView, "leadingAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel trailingAnchor](v6->_titleLabel, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v47, 1.0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v94[3] = v48;
      -[UIImageView topAnchor](v6->_completedUpgradeCheckmarkView, "topAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "topAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v50, 1.0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v94[4] = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 5);
      v52 = objc_claimAutoreleasedReturnValue();
      completedUpgradeCheckmarkViewConstraints = v6->_completedUpgradeCheckmarkViewConstraints;
      v6->_completedUpgradeCheckmarkViewConstraints = (NSArray *)v52;

    }
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v89);
    v54 = [SFAccountIconSharingBadgeImageCoordinator alloc];
    v55 = v6->_iconView;
    -[SFSecurityRecommendationInfoCell _iconWidth](v6, "_iconWidth");
    v57 = v56;
    -[SFSecurityRecommendationInfoCell contentView](v6, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[SFAccountIconSharingBadgeImageCoordinator initWithIconImageView:iconDiameter:parentView:](v54, "initWithIconImageView:iconDiameter:parentView:", v55, v58, v57);
    badgeImageCoordinator = v6->_badgeImageCoordinator;
    v6->_badgeImageCoordinator = (SFAccountIconSharingBadgeImageCoordinator *)v59;

    v61 = v6;
  }

  return v6;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFSecurityRecommendationInfoCell;
  -[SFSecurityRecommendationInfoCell layoutSubviews](&v3, sel_layoutSubviews);
  -[SFAccountIconSharingBadgeImageCoordinator containerDidLayoutSubviews](self->_badgeImageCoordinator, "containerDidLayoutSubviews");
}

- (UIImage)icon
{
  return -[UIImageView image](self->_iconView, "image");
}

- (void)setIcon:(id)a3
{
  UILabel *monogramLabel;
  id v5;

  monogramLabel = self->_monogramLabel;
  v5 = a3;
  -[UILabel setHidden:](monogramLabel, "setHidden:", 1);
  -[UIView setHidden:](self->_monogramBackgroundView, "setHidden:", 1);
  -[UIImageView setImage:](self->_iconView, "setImage:", v5);

  -[SFSecurityRecommendationInfoCell setNeedsLayout](self, "setNeedsLayout");
  -[SFSecurityRecommendationInfoCell _updateSharedAccountBadgeImageViewIfNecessary](self, "_updateSharedAccountBadgeImageViewIfNecessary");
}

- (void)showCheckmarkForDetailView
{
  void *v3;
  void *v4;
  void *v5;

  -[UILabel setHidden:](self->_monogramLabel, "setHidden:", 1);
  -[UIView setHidden:](self->_monogramBackgroundView, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:renderingMode:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_iconView, "setImage:", v5);

  -[SFSecurityRecommendationInfoCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowsUpgradeCompletionCheckmark:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  NSLayoutConstraint *standardTitleTrailingConstraint;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3718];
  if (a3)
  {
    v10[0] = self->_standardTitleTrailingConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_completedUpgradeCheckmarkViewConstraints);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__SFSecurityRecommendationInfoCell_setShowsUpgradeCompletionCheckmark___block_invoke;
    v8[3] = &unk_1E4ABFE00;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.25);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_completedUpgradeCheckmarkViewConstraints);
    v6 = (void *)MEMORY[0x1E0CB3718];
    standardTitleTrailingConstraint = self->_standardTitleTrailingConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &standardTitleTrailingConstraint, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateConstraints:", v7);

    -[UIImageView setAlpha:](self->_completedUpgradeCheckmarkView, "setAlpha:", 0.0);
  }
  -[SFSecurityRecommendationInfoCell setNeedsLayout](self, "setNeedsLayout");
}

uint64_t __71__SFSecurityRecommendationInfoCell_setShowsUpgradeCompletionCheckmark___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", 1.0);
}

- (void)setShowsHideButton:(BOOL)a3
{
  _BOOL4 v3;
  UIButton **p_hideButton;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *standardTitleTrailingConstraint;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    p_hideButton = &self->_hideButton;
    if (!self->_hideButton)
      -[SFSecurityRecommendationInfoCell _createHideButton](self, "_createHideButton");
    v6 = (void *)MEMORY[0x1E0CB3718];
    standardTitleTrailingConstraint = self->_standardTitleTrailingConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &standardTitleTrailingConstraint, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v7);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_hideButtonConstraints);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3718];
    v11[0] = self->_standardTitleTrailingConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateConstraints:", v9);

    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_hideButtonConstraints);
    p_hideButton = &self->_hideButton;
  }
  -[UIButton setHidden:](*p_hideButton, "setHidden:", !v3);
}

- (void)_createHideButton
{
  UIButton *v3;
  UIButton *hideButton;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *hideButtonConstraints;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[6];

  v32[5] = *MEMORY[0x1E0C80C00];
  v3 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  hideButton = self->_hideButton;
  self->_hideButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_hideButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_hideButton;
  v6 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemImageNamed:withConfiguration:", CFSTR("xmark"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:renderingMode:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](v5, "setImage:forState:", v10, 0);

  if (UIAccessibilityButtonShapesEnabled())
  {
    v11 = self->_hideButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UIButton _setContinuousCornerRadius:](self->_hideButton, "_setContinuousCornerRadius:", 5.0);
  }
  -[UIButton addTarget:action:forControlEvents:](self->_hideButton, "addTarget:action:forControlEvents:", self, sel__hideButtonPressed_, 0x2000);
  -[SFSecurityRecommendationInfoCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_hideButton);
  -[UIButton widthAnchor](self->_hideButton, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSecurityRecommendationInfoCell _hideButtonViewSize](self, "_hideButtonViewSize");
  objc_msgSend(v31, "constraintGreaterThanOrEqualToConstant:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v30;
  -[UIButton heightAnchor](self->_hideButton, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSecurityRecommendationInfoCell _hideButtonViewSize](self, "_hideButtonViewSize");
  objc_msgSend(v29, "constraintEqualToConstant:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v28;
  -[UIButton trailingAnchor](self->_hideButton, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMarginsGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 5.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v15;
  -[UIButton leadingAnchor](self->_hideButton, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v17, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v18;
  -[UIButton topAnchor](self->_hideButton, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMarginsGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
  hideButtonConstraints = self->_hideButtonConstraints;
  self->_hideButtonConstraints = v23;

}

- (void)_hideButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "securityRecommendationInfoCellHideButtonPressed:", self);

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[SFSecurityRecommendationInfoCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
  -[SFSecurityRecommendationInfoCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSavedAccount:(id)a3
{
  objc_storeStrong((id *)&self->_savedAccount, a3);
  -[SFSecurityRecommendationInfoCell _updateSharedAccountBadgeImageViewIfNecessary](self, "_updateSharedAccountBadgeImageViewIfNecessary");
}

- (void)showPlaceholderImageForDomain:(id)a3 backgroundColor:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  UIView *monogramBackgroundView;
  void *v13;
  UILabel *v14;
  UILabel *monogramLabel;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  if (!self->_monogramLabel)
  {
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[SFSecurityRecommendationInfoCell _iconWidth](self, "_iconWidth");
    v10 = v9;
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    monogramBackgroundView = self->_monogramBackgroundView;
    self->_monogramBackgroundView = v11;

    -[UIView setFrame:](self->_monogramBackgroundView, "setFrame:", v7, v8, v10, v10);
    -[UIView layer](self->_monogramBackgroundView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMasksToBounds:", 1);

    -[UIView _setContinuousCornerRadius:](self->_monogramBackgroundView, "_setContinuousCornerRadius:", 12.0);
    -[UIView _setAllowsHighContrastForBackgroundColor:](self->_monogramBackgroundView, "_setAllowsHighContrastForBackgroundColor:", 1);
    -[UIImageView addSubview:](self->_iconView, "addSubview:", self->_monogramBackgroundView);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    monogramLabel = self->_monogramLabel;
    self->_monogramLabel = v14;

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_monogramLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](self->_monogramLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_monogramLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_monogramLabel, "setTextColor:", v16);

    -[UILabel setFrame:](self->_monogramLabel, "setFrame:", v7, v8, v10, v10);
    objc_msgSend(MEMORY[0x1E0DC37E8], "_sf_roundedSystemFontOfSize:weight:", 34, *MEMORY[0x1E0DC4B90]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_monogramLabel, "setFont:", v17);

    -[UIImageView addSubview:](self->_iconView, "addSubview:", self->_monogramLabel);
  }
  if (blankImage_onceToken_0 != -1)
    dispatch_once(&blankImage_onceToken_0, &__block_literal_global_53);
  -[UIImageView setImage:](self->_iconView, "setImage:", blankImage_image_0);
  -[UIView setBackgroundColor:](self->_monogramBackgroundView, "setBackgroundColor:", v6);
  -[UIView setHidden:](self->_monogramBackgroundView, "setHidden:", 0);
  -[UILabel setHidden:](self->_monogramLabel, "setHidden:", 0);
  v18 = (void *)MEMORY[0x1E0D8AD28];
  -[WBSSavedAccount effectiveTitle](self->_savedAccount, "effectiveTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safari_bestURLForUserTypedString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "monogramStringForTitle:url:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_monogramLabel, "setText:", v21);

  -[SFSecurityRecommendationInfoCell _updateSharedAccountBadgeImageViewIfNecessary](self, "_updateSharedAccountBadgeImageViewIfNecessary");
  -[SFSecurityRecommendationInfoCell setNeedsLayout](self, "setNeedsLayout");

}

- (double)_iconWidth
{
  double result;

  result = 48.0;
  if (self->_configuration != 1)
    return 28.0;
  return result;
}

- (void)_updateSharedAccountBadgeImageViewIfNecessary
{
  uint64_t v3;

  if (self->_configuration == 1)
    v3 = -[WBSSavedAccount isSavedInPersonalKeychain](self->_savedAccount, "isSavedInPersonalKeychain") ^ 1;
  else
    v3 = 0;
  -[SFAccountIconSharingBadgeImageCoordinator setShowsBadge:](self->_badgeImageCoordinator, "setShowsBadge:", v3);
}

- (CGSize)_hideButtonViewSize
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGSize result;

  v2 = UIAccessibilityButtonShapesEnabled();
  v3 = 20.0;
  if (v2)
    v3 = 30.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (SFSecurityRecommendationInfoCellDelegate)delegate
{
  return (SFSecurityRecommendationInfoCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_savedAccount, 0);
  objc_storeStrong((id *)&self->_badgeImageCoordinator, 0);
  objc_storeStrong((id *)&self->_hideButtonConstraints, 0);
  objc_storeStrong((id *)&self->_hideButton, 0);
  objc_storeStrong((id *)&self->_standardTitleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_completedUpgradeCheckmarkViewConstraints, 0);
  objc_storeStrong((id *)&self->_monogramBackgroundView, 0);
  objc_storeStrong((id *)&self->_monogramLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_completedUpgradeCheckmarkView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
