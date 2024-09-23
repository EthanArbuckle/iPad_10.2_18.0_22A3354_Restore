@implementation HUTitleValueIconCell

- (HUTitleValueIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUTitleValueIconCell;
  return -[HUTitleValueCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, a3, a4);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  HUIconCellContentMetrics *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUTitleValueIconCell;
  -[HUTitleValueCell updateUIWithAnimation:](&v15, sel_updateUIWithAnimation_, a3);
  -[HUIconCell item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUIconCell setHideIcon:](self, "setHideIcon:", 0);
    v7 = objc_alloc_init(HUIconCellContentMetrics);
    -[HUIconCell setContentMetrics:](self, "setContentMetrics:", v7);

    HUDefaultSizeForIconSize();
    v9 = v8;
    v11 = v10;
    -[HUIconCell contentMetrics](self, "contentMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIconSize:", v9, v11);

    -[HUIconCell contentMetrics](self, "contentMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentInset:", 8.0, 0.0, 8.0, 0.0);

    -[HUIconCell setIconForegroundColorFollowsTintColor:](self, "setIconForegroundColorFollowsTintColor:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell setIconForegroundColor:](self, "setIconForegroundColor:", v14);

  }
  else
  {
    -[HUIconCell setHideIcon:](self, "setHideIcon:", 1);
  }

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
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueIconCell contentView](self, "contentView");
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

  objc_msgSend(v4, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueIconCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  objc_msgSend(v4, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTitleValueIconCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:constant:", v20, -v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
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
  id v12;
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
  double v41;
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
  double v52;
  void *v53;
  void *v54;
  objc_super v55;

  -[HUIconCell staticConstraints](self, "staticConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUTitleValueIconCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v8) = 1148829696;
    objc_msgSend(v7, "setPriority:", v8);
    objc_msgSend(v4, "addObject:", v7);
    -[HUIconCell setStaticConstraints:](self, "setStaticConstraints:", v4);
    v9 = (void *)MEMORY[0x1E0CB3718];
    -[HUIconCell staticConstraints](self, "staticConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v10);

  }
  -[HUIconCell dynamicConstraints](self, "dynamicConstraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUIconCell containerView](self, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleValueIconCell _verticalConstraintsForContentSubview:](self, "_verticalConstraintsForContentSubview:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v14);

    -[HUIconCell iconView](self, "iconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUIconCell containerView](self, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleValueIconCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v21);

    -[HUIconCell containerView](self, "containerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[HUIconCell iconView](self, "iconView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v26);

      -[HUIconCell containerView](self, "containerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "trailingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconCell iconView](self, "iconView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, -8.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v31);

      -[HUIconCell iconView](self, "iconView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "trailingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleValueIconCell contentView](self, "contentView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "layoutMarginsGuide");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v37);

      -[HUIconCell iconView](self, "iconView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "heightAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconCell contentMetrics](self, "contentMetrics");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "iconSize");
      objc_msgSend(v39, "constraintEqualToConstant:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v42);

      -[HUIconCell iconView](self, "iconView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "widthAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconCell contentMetrics](self, "contentMetrics");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "iconSize");
      objc_msgSend(v44, "constraintEqualToConstant:");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v46);

      -[HUIconCell iconView](self, "iconView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleValueIconCell _verticalConstraintsForContentSubview:](self, "_verticalConstraintsForContentSubview:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v23);
    }
    else
    {
      -[HUTitleValueIconCell contentView](self, "contentView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "layoutMarginsGuide");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v50);

    }
    -[HUIconCell iconView](self, "iconView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v52) = 1148846080;
    objc_msgSend(v51, "setContentHuggingPriority:forAxis:", 0, v52);

    -[HUIconCell setDynamicConstraints:](self, "setDynamicConstraints:", v12);
    v53 = (void *)MEMORY[0x1E0CB3718];
    -[HUIconCell dynamicConstraints](self, "dynamicConstraints");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "activateConstraints:", v54);

  }
  v55.receiver = self;
  v55.super_class = (Class)HUTitleValueIconCell;
  -[HUTitleValueCell updateConstraints](&v55, sel_updateConstraints);
}

@end
