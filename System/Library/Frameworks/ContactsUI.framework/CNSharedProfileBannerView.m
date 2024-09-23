@implementation CNSharedProfileBannerView

- (CNSharedProfileBannerView)init
{
  CNSharedProfileBannerView *v2;
  uint64_t v3;
  CNSharedProfileBannerStyle *style;
  CNSharedProfileAnimationGenerator *v5;
  CNSharedProfileAnimationGenerator *animationGenerator;
  CNSharedProfileBannerView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNSharedProfileBannerView;
  v2 = -[CNSharedProfileBannerView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    +[CNSharedProfileBannerStyle defaultStyle](CNSharedProfileBannerStyle, "defaultStyle");
    v3 = objc_claimAutoreleasedReturnValue();
    style = v2->_style;
    v2->_style = (CNSharedProfileBannerStyle *)v3;

    v5 = objc_alloc_init(CNSharedProfileAnimationGenerator);
    animationGenerator = v2->_animationGenerator;
    v2->_animationGenerator = v5;

    -[CNSharedProfileBannerView setUpViews](v2, "setUpViews");
    -[CNSharedProfileBannerView startObservingAvatarCacheInvalidation](v2, "startObservingAvatarCacheInvalidation");
    v7 = v2;
  }

  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNSharedProfileBannerView;
  -[CNSharedProfileBannerView layoutSubviews](&v7, sel_layoutSubviews);
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 + 20.0;
  -[CNSharedProfileBannerView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredMaxLayoutWidth:", v5);

}

- (void)setUpViews
{
  -[CNSharedProfileBannerView setUpAvatarView](self, "setUpAvatarView");
  -[CNSharedProfileBannerView setUpLabels](self, "setUpLabels");
  -[CNSharedProfileBannerView setUpActionButton](self, "setUpActionButton");
  -[CNSharedProfileBannerView setUpDismissButton](self, "setUpDismissButton");
}

- (void)setUpAvatarView
{
  CNAvatarView *v3;

  v3 = objc_alloc_init(CNAvatarView);
  -[CNAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNSharedProfileBannerView addSubview:](self, "addSubview:", v3);
  -[CNSharedProfileBannerView setAvatarView:](self, "setAvatarView:", v3);

}

- (void)setUpLabels
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  -[CNSharedProfileBannerView style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  -[CNSharedProfileBannerView style](self, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v7);

  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  -[CNSharedProfileBannerView setTitleLabel:](self, "setTitleLabel:", v3);
  v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v8, "setLineBreakMode:", 1);
  -[CNSharedProfileBannerView style](self, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subtitleTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v10);

  -[CNSharedProfileBannerView style](self, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subtitleFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v12);

  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);
  -[CNSharedProfileBannerView setSubtitleLabel:](self, "setSubtitleLabel:", v8);
  v13 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  -[CNSharedProfileBannerView titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  -[CNSharedProfileBannerView subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithArrangedSubviews:", v16);

  objc_msgSend(v17, "setAxis:", 1);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "setAlignment:", 1);
  -[CNSharedProfileBannerView addSubview:](self, "addSubview:", v17);
  -[CNSharedProfileBannerView setLabelStackView:](self, "setLabelStackView:", v17);

}

- (void)setUpActionButton
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3518]);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNSharedProfileBannerView style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v4);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_didTapActionButton, 64);
  -[CNSharedProfileBannerView addSubview:](self, "addSubview:", v5);
  -[CNSharedProfileBannerView setActionButton:](self, "setActionButton:", v5);

}

- (void)setUpDismissButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xmarkButtonColorConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView xmarkImageWithColorConfiguration:](self, "xmarkImageWithColorConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v5);

  objc_msgSend(v7, "setButtonSize:", 2);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3518]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setConfiguration:", v7);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_didTapDismiss, 64);
  -[CNSharedProfileBannerView addSubview:](self, "addSubview:", v6);
  -[CNSharedProfileBannerView setDismissButton:](self, "setDismissButton:", v6);

}

- (id)xmarkImageWithColorConfiguration:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0DC3888];
  v4 = a3;
  objc_msgSend(v3, "configurationWithScale:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationByApplyingConfiguration:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "configurationByApplyingConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setStyle:(id)a3
{
  void *v3;
  CNSharedProfileBannerStyle *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CNSharedProfileBannerStyle *v22;

  v6 = (CNSharedProfileBannerStyle *)a3;
  if (self->_style != v6)
  {
    v22 = v6;
    objc_storeStrong((id *)&self->_style, a3);
    -[CNSharedProfileBannerStyle titleTextColor](v22, "titleTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    -[CNSharedProfileBannerStyle subtitleTextColor](v22, "subtitleTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView subtitleLabel](self, "subtitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

    -[CNSharedProfileBannerStyle titleFont](v22, "titleFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    v13 = -[CNSharedProfileBannerView hasTappedAction](self, "hasTappedAction");
    -[CNSharedProfileBannerStyle subtitleFont](v22, "subtitleFont");
    if (v13)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fontDescriptor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUIFontRepository boldFontWithFontDescriptor:](CNUIFontRepository, "boldFontWithFontDescriptor:", v3);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView subtitleLabel](self, "subtitleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v14);

    if (v13)
    {

      v14 = v12;
    }

    -[CNSharedProfileBannerStyle actionButtonConfiguration](v22, "actionButtonConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView actionButton](self, "actionButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConfiguration:", v16);

    -[CNSharedProfileBannerStyle xmarkButtonColorConfiguration](v22, "xmarkButtonColorConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView xmarkImageWithColorConfiguration:](self, "xmarkImageWithColorConfiguration:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:", v19);

    v6 = v22;
  }

}

- (void)updateConstraints
{
  void *v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  NSArray *constraints;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNSharedProfileBannerView;
  -[CNSharedProfileBannerView updateConstraints](&v10, sel_updateConstraints);
  if (self->_constraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    -[CNSharedProfileBannerView avatarView](self, "avatarView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isHidden") & 1) != 0)
      -[CNSharedProfileBannerView verticalConstraintsWithHiddenAvatarView](self, "verticalConstraintsWithHiddenAvatarView");
    else
      -[CNSharedProfileBannerView verticalConstraintsWithAvatarView](self, "verticalConstraintsWithAvatarView");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    constraints = self->_constraints;
    self->_constraints = v4;

    v6 = 1;
  }
  else
  {
    -[CNSharedProfileBannerView horizontalConstraints](self, "horizontalConstraints");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v3 = self->_constraints;
    self->_constraints = v5;
    v6 = 4;
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
  -[CNSharedProfileBannerView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextAlignment:", v6);

  -[CNSharedProfileBannerView subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextAlignment:", v6);

}

- (id)horizontalConstraints
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  id v21;
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
  _QWORD v63[15];

  v63[13] = *MEMORY[0x1E0C80C00];
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
  {
    -[CNSharedProfileBannerView leadingAnchor](self, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNSharedProfileBannerView avatarView](self, "avatarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v9, 1.0);
    v8 = objc_claimAutoreleasedReturnValue();

  }
  v38 = (void *)v8;

  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "centerYAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView centerYAnchor](self, "centerYAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v59;
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView leadingAnchor](self, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v55;
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "widthAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v50;
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToConstant:", 40.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v47;
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "centerYAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView centerYAnchor](self, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = v43;
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView topAnchor](self, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:constant:", v40, 8.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v39;
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView bottomAnchor](self, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v35, 8.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v63[6] = v34;
  v63[7] = v8;
  -[CNSharedProfileBannerView actionButton](self, "actionButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v30, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v63[8] = v29;
  -[CNSharedProfileBannerView actionButton](self, "actionButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView centerYAnchor](self, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v63[9] = v25;
  -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView actionButton](self, "actionButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63[10] = v11;
  -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView trailingAnchor](self, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63[11] = v15;
  -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView centerYAnchor](self, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v63[12] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 13);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)verticalConstraintsWithAvatarView
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
  id v14;
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
  _QWORD v56[14];

  v56[12] = *MEMORY[0x1E0C80C00];
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView centerXAnchor](self, "centerXAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v52;
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView topAnchor](self, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 8.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v48;
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v43;
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToConstant:", 60.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v40;
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v35;
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView leadingAnchor](self, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v31;
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView trailingAnchor](self, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v27;
  -[CNSharedProfileBannerView actionButton](self, "actionButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v22;
  -[CNSharedProfileBannerView actionButton](self, "actionButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v17;
  -[CNSharedProfileBannerView actionButton](self, "actionButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView bottomAnchor](self, "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v3, -8.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56[9] = v4;
  -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView trailingAnchor](self, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56[10] = v8;
  -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView topAnchor](self, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v56[11] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)verticalConstraintsWithHiddenAvatarView
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
  id v14;
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
  _QWORD v56[14];

  v56[12] = *MEMORY[0x1E0C80C00];
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView centerXAnchor](self, "centerXAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v52;
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView topAnchor](self, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 8.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v48;
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v43;
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToConstant:", 60.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v40;
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView topAnchor](self, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v36;
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView leadingAnchor](self, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v32;
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v27;
  -[CNSharedProfileBannerView actionButton](self, "actionButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v22;
  -[CNSharedProfileBannerView actionButton](self, "actionButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView labelStackView](self, "labelStackView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v17;
  -[CNSharedProfileBannerView actionButton](self, "actionButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView bottomAnchor](self, "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v3, -8.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56[9] = v4;
  -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView trailingAnchor](self, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56[10] = v8;
  -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView centerYAnchor](self, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v56[11] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)estimatedHeight
{
  double result;

  -[CNSharedProfileBannerView estimatedHeightForWidth:](self, "estimatedHeightForWidth:", 0.0);
  return result;
}

- (double)estimatedHeightForWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double result;

  -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeToFit");

  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[CNSharedProfileBannerView actionButton](self, "actionButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

  v8 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  -[CNSharedProfileBannerView avatarView](self, "avatarView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHidden");
  v11 = 0.0;
  if (v8)
  {
    if ((v10 & 1) == 0)
    {
      -[CNSharedProfileBannerView avatarView](self, "avatarView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v11 = v13;

    }
    -[CNSharedProfileBannerView actionButton](self, "actionButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;

    v17 = v11 + v16 + 16.0;
  }
  else
  {
    if ((v10 & 1) == 0)
    {
      -[CNSharedProfileBannerView avatarView](self, "avatarView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "frame");
      v11 = v19;

    }
    -[CNSharedProfileBannerView actionButton](self, "actionButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    -[CNSharedProfileBannerView dismissButton](self, "dismissButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v22 + v24;

    a3 = a3 - v11 - v25 + -40.0;
    v17 = 16.0;
  }
  -[CNSharedProfileBannerView titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeThatFits:", a3, 3.40282347e38);
  v28 = v27;

  -[CNSharedProfileBannerView subtitleLabel](self, "subtitleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sizeThatFits:", a3, 3.40282347e38);
  v31 = v30;

  result = v17 + v28 + v31;
  if (result < 60.0)
    return 60.0;
  return result;
}

- (void)startObservingAvatarCacheInvalidation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachingLikenessRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE082E38))
    v5 = v4;
  else
    v5 = 0;
  v7 = v5;

  v6 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addDelegate:", self);
    v6 = v7;
  }

}

- (void)setUpWithSharedProfileStateOracle:(id)a3 tappedAction:(unint64_t)a4 hasPerformedAnimation:(BOOL)a5
{
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
  self->_tappedAction = a4;
  -[CNSharedProfileBannerView updateUIForCurrentState](self, "updateUIForCurrentState");
  if (!a5)
    -[CNSharedProfileBannerView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_performAnimationIfNeeded, 0, 0.5);

}

- (void)updateUIForCurrentState
{
  uint64_t v3;
  unint64_t tappedAction;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  CNSharedProfileBannerView *v9;
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
  id v25;

  if (self->_sharedProfileStateOracle)
  {
    v3 = 512;
    tappedAction = self->_tappedAction;
    -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "bannerActionTypeForEffectiveState");

    -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetProfileForActionType:", v6);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (tappedAction)
    {
      v8 = self->_tappedAction;
      v9 = self;
    }
    else
    {
      v9 = self;
      v8 = v6;
    }
    -[CNSharedProfileBannerView titleForAction:](v9, "titleForAction:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    if (tappedAction)
    {
      -[CNSharedProfileBannerView subtitleForTappedAction:](self, "subtitleForTappedAction:", self->_tappedAction);
    }
    else
    {
      -[CNSharedProfileBannerView contactDisplayName](self, "contactDisplayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileBannerView subtitleForAction:contactName:](self, "subtitleForAction:contactName:", v6, v10);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView subtitleLabel](self, "subtitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    if (tappedAction)
    {
      -[CNSharedProfileBannerView subtitleTextColorForTappedAction:](self, "subtitleTextColorForTappedAction:", self->_tappedAction);
    }
    else
    {

      -[CNSharedProfileBannerView style](self, "style");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subtitleTextColor");
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView subtitleLabel](self, "subtitleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v14);

    if (tappedAction)
    {
      -[CNSharedProfileBannerView style](self, "style");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subtitleFont");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fontDescriptor");
      v3 = objc_claimAutoreleasedReturnValue();
      +[CNUIFontRepository boldFontWithFontDescriptor:](CNUIFontRepository, "boldFontWithFontDescriptor:", v3);
    }
    else
    {

      -[CNSharedProfileBannerView style](self, "style");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subtitleFont");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView subtitleLabel](self, "subtitleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v17);

    if (tappedAction)
    {

      v17 = v14;
    }

    -[CNSharedProfileBannerView actionButton](self, "actionButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView actionButtonTitleForAction:](self, "actionButtonTitleForAction:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:forState:", v20, 0);

    -[CNSharedProfileBannerView actionButton](self, "actionButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", tappedAction != 0);

    if (-[CNSharedProfileBannerView isRevertAction:](self, "isRevertAction:", v6))
    {
      -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "contact");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileBannerView avatarView](self, "avatarView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setContact:", v23);

    }
    else
    {
      if (tappedAction)
      {
LABEL_22:

        return;
      }
      objc_msgSend(v25, "contact");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileBannerView avatarView](self, "avatarView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setContact:", v22);
    }

    goto LABEL_22;
  }
}

- (void)setTappedAction:(unint64_t)a3
{
  if (self->_tappedAction != a3)
  {
    self->_tappedAction = a3;
    -[CNSharedProfileBannerView updateUIForCurrentState](self, "updateUIForCurrentState");
  }
}

- (id)titleForAction:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  if (a3 - 1 >= 2)
  {
    if (a3 != 3)
    {
      v6 = &stru_1E20507A8;
      return v6;
    }
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SNAP_UPDATE_PHOTO_BANNER_TITLE");
  }
  else
  {
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SNAP_REVERT_PHOTO_BANNER_TITLE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E20507A8, CFSTR("Localized"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)subtitleForAction:(unint64_t)a3 contactName:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a4;
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SNAP_PHOTO_BANNER_SUBTITLE_%@"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)subtitleForTappedAction:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  if (a3 - 1 >= 2)
  {
    if (a3 != 3)
    {
      v6 = &stru_1E20507A8;
      return v6;
    }
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SNAP_UPDATE_BANNER_ACCEPTED_SUBTITLE");
  }
  else
  {
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SNAP_REVERT_PHOTO_BANNER_ACCEPTED_SUBTITLE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E20507A8, CFSTR("Localized"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)subtitleTextColorForTappedAction:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (a3 - 1 >= 2)
  {
    if (a3 != 3)
    {
      -[CNSharedProfileBannerView style](self, "style");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subtitleTextColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
    +[CNUIColorRepository sharedProfileBannerSubtitleUpdatedColor](CNUIColorRepository, "sharedProfileBannerSubtitleUpdatedColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNUIColorRepository sharedProfileBannerSubtitleRevertedColor](CNUIColorRepository, "sharedProfileBannerSubtitleRevertedColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  return v4;
}

- (id)actionButtonTitleForAction:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  if (a3 - 1 >= 2)
  {
    if (a3 != 3)
    {
      v6 = &stru_1E20507A8;
      return v6;
    }
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SNAP_UPDATE_BANNER_BUTTON_TITLE");
  }
  else
  {
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SNAP_REVERT_BANNER_BUTTON_TITLE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E20507A8, CFSTR("Localized"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)performAnimationIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bannerActionTypeForEffectiveState");

  if (-[CNSharedProfileBannerView isRevertAction:](self, "isRevertAction:", v4))
  {
    -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetProfileForActionType:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[CNSharedProfileBannerView animationGenerator](self, "animationGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView avatarView](self, "avatarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNSharedProfileBannerView isRTL](self, "isRTL");
    -[CNSharedProfileBannerView avatarSize](self, "avatarSize");
    objc_msgSend(v6, "performCoinFlipAnimationForAnimatingAvatarView:toContact:rightToLeft:avatarSize:completionHandler:", v7, v8, v9, 0);

  }
}

- (void)didTapActionButton
{
  void *v3;
  uint64_t v4;

  -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bannerActionTypeForEffectiveState");

  -[CNSharedProfileBannerView setTappedAction:](self, "setTappedAction:", v4);
  -[CNSharedProfileBannerView updateContactForTappedAction](self, "updateContactForTappedAction");
}

- (void)updateContactForTappedAction
{
  void *v3;
  id v4;

  -[CNSharedProfileBannerView setShouldPerformActionUponCacheInvalidation:](self, "setShouldPerformActionUponCacheInvalidation:", 1);
  -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileBannerView invalidateAvatarCacheEntriesForContact:](self, "invalidateAvatarCacheEntriesForContact:", v3);

}

- (void)didTapDismiss
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bannerActionTypeForEffectiveState");

  -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "updateContactAndNicknamesForDeclinedActionType:error:", v4, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  if (v6)
  {
    -[CNSharedProfileBannerView setIsIgnored:](self, "setIsIgnored:", 1);
    -[CNSharedProfileBannerView delegate](self, "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject sharedProfileBannerView:didDismissWithUpdatedContact:forAction:](v8, "sharedProfileBannerView:didDismissWithUpdatedContact:forAction:", self, v6, v4);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Error updating contact for dismiss action: %@", buf, 0xCu);
    }
  }

}

- (void)invalidateAvatarCacheEntriesForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  if (v3)
  {
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachingLikenessRenderer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = &unk_1EE082E38;
    if (objc_msgSend(v5, "conformsToProtocol:", v6))
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      dispatch_get_global_queue(25, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__CNSharedProfileBannerView_invalidateAvatarCacheEntriesForContact___block_invoke;
      v10[3] = &unk_1E2050400;
      v11 = v8;
      v12 = v3;
      dispatch_async(v9, v10);

    }
  }

}

- (void)avatarCacheDidUpdateForIdentifiers:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  unint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[CNSharedProfileBannerView shouldPerformActionUponCacheInvalidation](self, "shouldPerformActionUponCacheInvalidation", a3))
  {
    -[CNSharedProfileBannerView setShouldPerformActionUponCacheInvalidation:](self, "setShouldPerformActionUponCacheInvalidation:", 0);
    v4 = -[CNSharedProfileBannerView tappedAction](self, "tappedAction");
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C973E0], "descriptionForActionType:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEFAULT, "Performing %@ action type on contact (%@) from banner view", buf, 0x16u);

    }
    -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v10, "updateContactAndNicknamesForActionType:error:", v4, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;

    if (v11)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __64__CNSharedProfileBannerView_avatarCacheDidUpdateForIdentifiers___block_invoke;
      v16[3] = &unk_1E204D910;
      v16[4] = self;
      v17 = v11;
      v18 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v16);

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(0, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C973E0], "descriptionForActionType:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        v24 = 2112;
        v25 = v12;
        _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "Error updating contact (%@) for action %@ with error %@", buf, 0x20u);

      }
    }

  }
}

- (BOOL)hasTappedAction
{
  return -[CNSharedProfileBannerView tappedAction](self, "tappedAction") != 0;
}

- (id)contactDisplayName
{
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  -[CNSharedProfileBannerView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = &stru_1E20507A8;
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97218]);
    objc_msgSend(v5, "setStyle:", 1000);
    objc_msgSend(v5, "setFallbackStyle:", -1);
    objc_msgSend(v5, "stringFromContact:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E20507A8;
    v4 = v8;

  }
  return v4;
}

- (BOOL)isRevertAction:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (BOOL)isRTL
{
  void *v2;
  BOOL v3;

  -[CNSharedProfileBannerView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutDirection") == 1;

  return v3;
}

- (CGSize)avatarSize
{
  int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  v3 = 60.0;
  if (v2)
    v3 = 40.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CNSharedProfileBannerViewDelegate)delegate
{
  return (CNSharedProfileBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNSharedProfileBannerStyle)style
{
  return self->_style;
}

- (BOOL)isIgnored
{
  return self->_isIgnored;
}

- (void)setIsIgnored:(BOOL)a3
{
  self->_isIgnored = a3;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
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

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)setSharedProfileStateOracle:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
}

- (CNSharedProfileAnimationGenerator)animationGenerator
{
  return self->_animationGenerator;
}

- (void)setAnimationGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_animationGenerator, a3);
}

- (unint64_t)tappedAction
{
  return self->_tappedAction;
}

- (BOOL)shouldPerformActionUponCacheInvalidation
{
  return self->_shouldPerformActionUponCacheInvalidation;
}

- (void)setShouldPerformActionUponCacheInvalidation:(BOOL)a3
{
  self->_shouldPerformActionUponCacheInvalidation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationGenerator, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __64__CNSharedProfileBannerView_avatarCacheDidUpdateForIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedProfileBannerView:didUpdateContact:forAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __68__CNSharedProfileBannerView_invalidateAvatarCacheEntriesForContact___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateContactsWithIdentifiers:", v3);

}

+ (id)log
{
  if (log_cn_once_token_1_35775 != -1)
    dispatch_once(&log_cn_once_token_1_35775, &__block_literal_global_35776);
  return (id)log_cn_once_object_1_35777;
}

void __32__CNSharedProfileBannerView_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNSharedProfileBannerView");
  v1 = (void *)log_cn_once_object_1_35777;
  log_cn_once_object_1_35777 = (uint64_t)v0;

}

@end
