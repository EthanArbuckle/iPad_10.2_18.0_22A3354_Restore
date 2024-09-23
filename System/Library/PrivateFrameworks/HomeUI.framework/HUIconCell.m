@implementation HUIconCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUIconCell *v4;
  uint64_t v5;
  HUIconCellContentMetrics *contentMetrics;
  uint64_t v7;
  UIColor *iconForegroundColor;
  UIView *v9;
  UIView *containerView;
  void *v11;
  UILayoutGuide *v12;
  UILayoutGuide *iconSpacingLayoutGuide;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HUIconCell;
  v4 = -[HUIconCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    +[HUIconCellContentMetrics defaultMetrics](HUIconCellContentMetrics, "defaultMetrics");
    v5 = objc_claimAutoreleasedReturnValue();
    contentMetrics = v4->_contentMetrics;
    v4->_contentMetrics = (HUIconCellContentMetrics *)v5;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v7 = objc_claimAutoreleasedReturnValue();
    iconForegroundColor = v4->_iconForegroundColor;
    v4->_iconForegroundColor = (UIColor *)v7;

    v4->_iconForegroundColorFollowsTintColor = 1;
    v4->_iconAlpha = 1.0;
    v4->_iconDisplayStyle = 3;
    v4->_iconTintColorFollowsDisabledState = 1;
    v4->_separatorInsetLinesUpWithText = 1;
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    containerView = v4->_containerView;
    v4->_containerView = v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUIconCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_containerView);

    v12 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    iconSpacingLayoutGuide = v4->_iconSpacingLayoutGuide;
    v4->_iconSpacingLayoutGuide = v12;

    -[UILayoutGuide setIdentifier:](v4->_iconSpacingLayoutGuide, "setIdentifier:", CFSTR("HUIconCellIconSpacingLayoutGuide"));
    -[HUIconCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addLayoutGuide:", v4->_iconSpacingLayoutGuide);

    -[HUIconCell _createIconView](v4, "_createIconView");
  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUIconCell;
  -[HUIconCell prepareForReuse](&v5, sel_prepareForReuse);
  -[HUIconCell setItem:](self, "setItem:", 0);
  -[HUIconCell setDisabled:](self, "setDisabled:", 0);
  -[HUIconCell setHideIcon:](self, "setHideIcon:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCell setIconForegroundColor:](self, "setIconForegroundColor:", v3);

  -[HUIconCell setIconForegroundColorFollowsTintColor:](self, "setIconForegroundColorFollowsTintColor:", 1);
  -[HUIconCell setIconAlpha:](self, "setIconAlpha:", 1.0);
  +[HUIconCellContentMetrics defaultMetrics](HUIconCellContentMetrics, "defaultMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCell setContentMetrics:](self, "setContentMetrics:", v4);

  -[HUIconCell setIconDisplayStyle:](self, "setIconDisplayStyle:", 3);
  -[HUIconCell setDisableContinuousIconAnimation:](self, "setDisableContinuousIconAnimation:", 0);
}

- (void)setHideIcon:(BOOL)a3
{
  void *v4;

  if (self->_hideIcon != a3)
  {
    self->_hideIcon = a3;
    if (a3)
    {
      -[HUIconCell iconView](self, "iconView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

      -[HUIconCell setIconView:](self, "setIconView:", 0);
    }
    else
    {
      -[HUIconCell _createIconView](self, "_createIconView");
    }
    -[HUIconCell _invalidateDynamicConstraints](self, "_invalidateDynamicConstraints");
  }
}

- (void)setContentMetrics:(id)a3
{
  id v5;
  HUIconCellContentMetrics *v6;
  HUIconCellContentMetrics *v7;
  char v8;
  HUIconCellContentMetrics *v9;

  v5 = a3;
  v6 = self->_contentMetrics;
  v7 = (HUIconCellContentMetrics *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v6)
    {
      v8 = -[HUIconCellContentMetrics isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_contentMetrics, a3);
    -[HUIconCell _invalidateDynamicConstraints](self, "_invalidateDynamicConstraints");
  }
LABEL_8:

}

- (void)setIconForegroundColor:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *iconForegroundColor;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (UIColor *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  iconForegroundColor = self->_iconForegroundColor;
  self->_iconForegroundColor = v5;

  -[HUIconCell _updateIcon](self, "_updateIcon");
}

- (void)setIconForegroundColorFollowsTintColor:(BOOL)a3
{
  self->_iconForegroundColorFollowsTintColor = a3;
  -[HUIconCell _updateIcon](self, "_updateIcon");
}

- (void)setIconAlpha:(double)a3
{
  self->_iconAlpha = a3;
  -[HUIconCell _updateIcon](self, "_updateIcon");
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  -[HUIconCell _updateIcon](self, "_updateIcon");
}

- (void)setIconDisplayStyle:(unint64_t)a3
{
  if (self->_iconDisplayStyle != a3)
  {
    self->_iconDisplayStyle = a3;
    -[HUIconCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
  }
}

- (void)setIconTintColorFollowsDisabledState:(BOOL)a3
{
  self->_iconTintColorFollowsDisabledState = a3;
  -[HUIconCell _updateIcon](self, "_updateIcon");
}

- (BOOL)disableContinuousIconAnimation
{
  void *v2;
  char v3;

  -[HUIconCell iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableContinuousAnimation");

  return v3;
}

- (void)setDisableContinuousIconAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUIconCell iconView](self, "iconView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableContinuousAnimation:", v3);

}

- (void)updateConstraints
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
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
  double v55;
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
  double v66;
  void *v67;
  void *v68;
  objc_super v69;

  -[HUIconCell staticConstraints](self, "staticConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUIconCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v8) = 1148829696;
    objc_msgSend(v7, "setPriority:", v8);
    objc_msgSend(v4, "addObject:", v7);
    -[HUIconCell containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

    -[HUIconCell setStaticConstraints:](self, "setStaticConstraints:", v4);
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[HUIconCell staticConstraints](self, "staticConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

  }
  -[HUIconCell dynamicConstraints](self, "dynamicConstraints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[HUIconCell iconSpacingConstraints](self, "iconSpacingConstraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deactivateConstraints:", v19);

    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUIconCell iconSpacingLayoutGuide](self, "iconSpacingLayoutGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v26);

    -[HUIconCell iconSpacingLayoutGuide](self, "iconSpacingLayoutGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell contentMetrics](self, "contentMetrics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "iconSize");
    objc_msgSend(v28, "constraintEqualToConstant:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v31);

    -[HUIconCell iconSpacingLayoutGuide](self, "iconSpacingLayoutGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell contentMetrics](self, "contentMetrics");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "iconSize");
    objc_msgSend(v33, "constraintEqualToConstant:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v35);

    -[HUIconCell setIconSpacingConstraints:](self, "setIconSpacingConstraints:", v20);
    v36 = (void *)MEMORY[0x1E0CB3718];
    -[HUIconCell iconSpacingConstraints](self, "iconSpacingConstraints");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v37);

    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUIconCell containerView](self, "containerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell _verticalConstraintsForContentSubview:](self, "_verticalConstraintsForContentSubview:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObjectsFromArray:", v40);

    -[HUIconCell iconView](self, "iconView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUIconCell containerView](self, "containerView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      -[HUIconCell iconSpacingLayoutGuide](self, "iconSpacingLayoutGuide");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, 12.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v46);

      -[HUIconCell iconView](self, "iconView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "centerXAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconCell iconSpacingLayoutGuide](self, "iconSpacingLayoutGuide");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "centerXAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v51);

      -[HUIconCell iconView](self, "iconView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "heightAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconCell contentMetrics](self, "contentMetrics");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "iconSize");
      objc_msgSend(v53, "constraintEqualToConstant:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v56);

      -[HUIconCell iconView](self, "iconView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "widthAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconCell contentMetrics](self, "contentMetrics");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "iconSize");
      objc_msgSend(v58, "constraintEqualToConstant:");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v60);

      -[HUIconCell iconView](self, "iconView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconCell _verticalConstraintsForContentSubview:](self, "_verticalConstraintsForContentSubview:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObjectsFromArray:", v43);
    }
    else
    {
      -[HUIconCell contentView](self, "contentView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "layoutMarginsGuide");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "leadingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v64);

    }
    -[HUIconCell iconView](self, "iconView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v66) = 1148846080;
    objc_msgSend(v65, "setContentHuggingPriority:forAxis:", 0, v66);

    -[HUIconCell setDynamicConstraints:](self, "setDynamicConstraints:", v38);
    v67 = (void *)MEMORY[0x1E0CB3718];
    -[HUIconCell dynamicConstraints](self, "dynamicConstraints");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "activateConstraints:", v68);

  }
  v69.receiver = self;
  v69.super_class = (Class)HUIconCell;
  -[HUIconCell updateConstraints](&v69, sel_updateConstraints);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  objc_super v9;

  -[HUIconCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUIconCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutMargins");
    v6 = v5;

    if (-[HUIconCell separatorInsetLinesUpWithText](self, "separatorInsetLinesUpWithText"))
    {
      -[HUIconCell contentMetrics](self, "contentMetrics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "iconSize");
      v6 = v6 + v8 + 12.0;

    }
    -[HUIconCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v6, 0.0, 0.0);
  }
  v9.receiver = self;
  v9.super_class = (Class)HUIconCell;
  -[HUIconCell layoutSubviews](&v9, sel_layoutSubviews);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[HUIconCell iconView](self, "iconView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HUIconCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithIconDescriptor:displayStyle:animated:", v7, -[HUIconCell iconDisplayStyle](self, "iconDisplayStyle"), v3);

}

- (id)_verticalConstraintsForContentSubview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
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
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
    NSLog(CFSTR("Not a contentView subview"));
  -[HUIconCell contentMetrics](self, "contentMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInset");
  v10 = v9;
  -[HUIconCell contentMetrics](self, "contentMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentInset");
  v13 = v10 + v12;

  objc_msgSend(v4, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCell contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v28;
  objc_msgSend(v4, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v15;
  objc_msgSend(v4, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v19;
  objc_msgSend(v4, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUIconCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:constant:", v22, -v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)_invalidateDynamicConstraints
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUIconCell dynamicConstraints](self, "dynamicConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[HUIconCell setDynamicConstraints:](self, "setDynamicConstraints:", 0);
  -[HUIconCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_createIconView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUIconCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Already have iconView: %@"), self);
  v4 = objc_alloc_init(MEMORY[0x1E0D33720]);
  -[HUIconCell setIconView:](self, "setIconView:", v4);

  -[HUIconCell iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUIconCell iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentMode:", 1);

  -[HUIconCell _updateIcon](self, "_updateIcon");
  -[HUIconCell contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HUIconCell iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

}

- (void)_updateIcon
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  if (-[HUIconCell isDisabled](self, "isDisabled")
    && -[HUIconCell iconTintColorFollowsDisabledState](self, "iconTintColorFollowsDisabledState"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell iconView](self, "iconView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v3);

LABEL_8:
    goto LABEL_9;
  }
  v5 = -[HUIconCell iconForegroundColorFollowsTintColor](self, "iconForegroundColorFollowsTintColor");
  if (v5)
  {
    v3 = 0;
  }
  else
  {
    -[HUIconCell iconForegroundColor](self, "iconForegroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUIconCell iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v3);

  if (!v5)
    goto LABEL_8;
LABEL_9:
  -[HUIconCell iconAlpha](self, "iconAlpha");
  if (v7 != 0.0)
  {
    -[HUIconCell iconAlpha](self, "iconAlpha");
    v9 = v8;
    -[HUIconCell iconView](self, "iconView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", v9);

  }
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)hideIcon
{
  return self->_hideIcon;
}

- (UIColor)iconForegroundColor
{
  return self->_iconForegroundColor;
}

- (BOOL)iconForegroundColorFollowsTintColor
{
  return self->_iconForegroundColorFollowsTintColor;
}

- (double)iconAlpha
{
  return self->_iconAlpha;
}

- (HUIconCellContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (unint64_t)iconDisplayStyle
{
  return self->_iconDisplayStyle;
}

- (BOOL)iconTintColorFollowsDisabledState
{
  return self->_iconTintColorFollowsDisabledState;
}

- (BOOL)separatorInsetLinesUpWithText
{
  return self->_separatorInsetLinesUpWithText;
}

- (void)setSeparatorInsetLinesUpWithText:(BOOL)a3
{
  self->_separatorInsetLinesUpWithText = a3;
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_staticConstraints, a3);
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicConstraints, a3);
}

- (NSArray)iconSpacingConstraints
{
  return self->_iconSpacingConstraints;
}

- (void)setIconSpacingConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_iconSpacingConstraints, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILayoutGuide)iconSpacingLayoutGuide
{
  return self->_iconSpacingLayoutGuide;
}

- (void)setIconSpacingLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_iconSpacingLayoutGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconSpacingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_iconSpacingConstraints, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_iconForegroundColor, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
