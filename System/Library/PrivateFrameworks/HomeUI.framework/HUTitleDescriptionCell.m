@implementation HUTitleDescriptionCell

- (HUTitleDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTitleDescriptionCell *v4;
  uint64_t v5;
  UIFont *titleFont;
  uint64_t v7;
  UIFont *descriptionFont;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUTitleDescriptionCell;
  v4 = -[HUIconCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v5 = objc_claimAutoreleasedReturnValue();
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v5;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
    v7 = objc_claimAutoreleasedReturnValue();
    descriptionFont = v4->_descriptionFont;
    v4->_descriptionFont = (UIFont *)v7;

    v4->_textAlpha = 1.0;
    v4->_hideDescriptionIcon = 1;
    v4->_adjustsTextColorWhenDisabled = 1;
    v4->_maxNumberOfTitleLines = 2;
    v4->_maxNumberOfDescriptionLines = 2;
    -[HUTitleDescriptionCell _addTitleLabel](v4, "_addTitleLabel");
    -[HUTitleDescriptionCell _addDescriptionLabel](v4, "_addDescriptionLabel");
  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUTitleDescriptionCell;
  -[HUIconCell prepareForReuse](&v5, sel_prepareForReuse);
  -[HUTitleDescriptionCell setHideTitle:](self, "setHideTitle:", 0);
  -[HUTitleDescriptionCell setTitleText:](self, "setTitleText:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionCell setTitleFont:](self, "setTitleFont:", v3);

  -[HUTitleDescriptionCell updateTitle](self, "updateTitle");
  -[HUTitleDescriptionCell setHideDescription:](self, "setHideDescription:", 0);
  -[HUTitleDescriptionCell setDescriptionText:](self, "setDescriptionText:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionCell setDescriptionFont:](self, "setDescriptionFont:", v4);

  -[HUTitleDescriptionCell setHideDescriptionIcon:](self, "setHideDescriptionIcon:", 1);
  -[HUTitleDescriptionCell setDescriptionIcon:](self, "setDescriptionIcon:", 0);
  -[HUIconCell setIconAlpha:](self, "setIconAlpha:", 1.0);
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    -[HUTitleDescriptionCell _addTitleLabel](self, "_addTitleLabel");
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (void)setTitleText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_titleText, a3);
  v5 = a3;
  -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setTitleFont:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_titleFont, a3);
  v5 = a3;
  -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

}

- (void)setHideTitle:(BOOL)a3
{
  if (self->_hideTitle != a3)
  {
    self->_hideTitle = a3;
    if (a3)
      -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    else
      -[HUTitleDescriptionCell _addTitleLabel](self, "_addTitleLabel");
    -[HUTitleDescriptionCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (UILabel)descriptionLabel
{
  UILabel *descriptionLabel;

  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    -[HUTitleDescriptionCell _addDescriptionLabel](self, "_addDescriptionLabel");
    descriptionLabel = self->_descriptionLabel;
  }
  return descriptionLabel;
}

- (void)setDescriptionText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_descriptionText, a3);
  v5 = a3;
  -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setDescriptionFont:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_descriptionFont, a3);
  v5 = a3;
  -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

}

- (void)setHideDescription:(BOOL)a3
{
  if (self->_hideDescription != a3)
  {
    self->_hideDescription = a3;
    if (a3)
    {
      -[UILabel removeFromSuperview](self->_descriptionLabel, "removeFromSuperview");
      -[HUTitleDescriptionCell setHideDescriptionIcon:](self, "setHideDescriptionIcon:", 1);
    }
    else
    {
      -[HUTitleDescriptionCell _addDescriptionLabel](self, "_addDescriptionLabel");
    }
    -[HUTitleDescriptionCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setDescriptionIcon:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_descriptionIcon, a3);
  v5 = v8;
  if (!self->_hideDescriptionIcon)
  {
    if (v8)
    {
      objc_msgSend(v8, "imageWithRenderingMode:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    -[HUTitleDescriptionCell descriptionIconView](self, "descriptionIconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

    v5 = v8;
  }

}

- (void)setHideDescriptionIcon:(BOOL)a3
{
  if (self->_hideDescriptionIcon != a3)
  {
    self->_hideDescriptionIcon = a3;
    if (a3)
      -[UIImageView removeFromSuperview](self->_descriptionIconView, "removeFromSuperview");
    else
      -[HUTitleDescriptionCell _addDescriptionIconView](self, "_addDescriptionIconView");
    -[HUTitleDescriptionCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HUTitleDescriptionCell;
  -[HUIconCell setDisabled:](&v5, sel_setDisabled_);
  -[HUTitleDescriptionCell updateTitle](self, "updateTitle");
  -[HUTitleDescriptionCell setAdjustsTextColorWhenDisabled:](self, "setAdjustsTextColorWhenDisabled:", 1);
  -[HUTitleDescriptionCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", !v3);
}

- (void)setTextAlpha:(double)a3
{
  self->_textAlpha = a3;
  -[HUTitleDescriptionCell updateTitle](self, "updateTitle");
}

- (void)updateConstraints
{
  void *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v14;
  objc_super v15;

  -[UILabel traitCollection](self->_titleLabel, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
    v5 = 0;
  else
    v5 = 2;
  -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", v5);

  -[UILabel traitCollection](self->_descriptionLabel, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v8))
    v9 = 0;
  else
    v9 = 2;
  -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", v9);

  -[HUTitleDescriptionCell updateVerticalLabelConstraints](self, "updateVerticalLabelConstraints");
  -[HUTitleDescriptionCell updateHorizontalLabelConstraints](self, "updateHorizontalLabelConstraints");
  -[HUTitleDescriptionCell traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory)
    v14 = 0;
  else
    v14 = 2;
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v14);
  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", v14);
  if (-[HUTitleDescriptionCell maxNumberOfTitleLines](self, "maxNumberOfTitleLines") != 2)
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", -[HUTitleDescriptionCell maxNumberOfTitleLines](self, "maxNumberOfTitleLines"));
  if (-[HUTitleDescriptionCell maxNumberOfDescriptionLines](self, "maxNumberOfDescriptionLines") != 2)
    -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", -[HUTitleDescriptionCell maxNumberOfDescriptionLines](self, "maxNumberOfDescriptionLines"));
  v15.receiver = self;
  v15.super_class = (Class)HUTitleDescriptionCell;
  -[HUIconCell updateConstraints](&v15, sel_updateConstraints);
}

- (void)updateVerticalLabelConstraints
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
  id v42;

  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUTitleDescriptionCell verticalLabelConstraints](self, "verticalLabelConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel superview](self->_titleLabel, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v10);

    -[UILabel superview](self->_descriptionLabel, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconCell containerView](self, "containerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v16);

    }
  }
  -[UILabel superview](self->_descriptionLabel, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[UILabel superview](self->_titleLabel, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 3.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v22);
    }
    else
    {
      -[HUIconCell containerView](self, "containerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v23);

    }
    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell containerView](self, "containerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v28);

    -[UIImageView superview](self->_descriptionIconView, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[HUTitleDescriptionCell descriptionIconView](self, "descriptionIconView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "topAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v34);

      -[HUTitleDescriptionCell descriptionIconView](self, "descriptionIconView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bottomAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v39);

    }
  }
  -[HUTitleDescriptionCell setVerticalLabelConstraints:](self, "setVerticalLabelConstraints:", v42);
  v40 = (void *)MEMORY[0x1E0CB3718];
  -[HUTitleDescriptionCell verticalLabelConstraints](self, "verticalLabelConstraints");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activateConstraints:", v41);

}

- (void)updateHorizontalLabelConstraints
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
  NSLayoutConstraint *v15;
  NSLayoutConstraint *titleTrailingConstraint;
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
  NSLayoutConstraint *v38;
  NSLayoutConstraint *descriptionTrailingConstraint;
  void *v40;
  void *v41;
  id v42;

  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUTitleDescriptionCell horizontalLabelConstraints](self, "horizontalLabelConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel superview](self->_titleLabel, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v10);

    -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell containerView](self, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleTrailingConstraint = self->_titleTrailingConstraint;
    self->_titleTrailingConstraint = v15;

    objc_msgSend(v42, "addObject:", self->_titleTrailingConstraint);
  }
  -[UILabel superview](self->_descriptionLabel, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[UIImageView superview](self->_descriptionIconView, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[HUTitleDescriptionCell descriptionIconView](self, "descriptionIconView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconCell containerView](self, "containerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v23);

      -[HUTitleDescriptionCell descriptionIconView](self, "descriptionIconView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "widthAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleDescriptionCell descriptionIconView](self, "descriptionIconView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "heightAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v28);

      -[HUTitleDescriptionCell descriptionIconView](self, "descriptionIconView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, -5.0);
    }
    else
    {
      -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconCell containerView](self, "containerView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v33);

    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconCell containerView](self, "containerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v37);
    v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    descriptionTrailingConstraint = self->_descriptionTrailingConstraint;
    self->_descriptionTrailingConstraint = v38;

    objc_msgSend(v42, "addObject:", self->_descriptionTrailingConstraint);
  }
  -[HUTitleDescriptionCell setHorizontalLabelConstraints:](self, "setHorizontalLabelConstraints:", v42);
  v40 = (void *)MEMORY[0x1E0CB3718];
  -[HUTitleDescriptionCell horizontalLabelConstraints](self, "horizontalLabelConstraints");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activateConstraints:", v41);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
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
  double v17;
  double v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v3 = a3;
  v23[2] = *MEMORY[0x1E0C80C00];
  -[HUIconCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21.receiver = self;
  v21.super_class = (Class)HUTitleDescriptionCell;
  -[HUIconCell updateUIWithAnimation:](&v21, sel_updateUIWithAnimation_, v3);
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionCell setTitleText:](self, "setTitleText:", v7);

  -[HUTitleDescriptionCell updateTitle](self, "updateTitle");
  v8 = *MEMORY[0x1E0D30BF8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v22[0] = *MEMORY[0x1E0CEA098];
    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    v22[1] = *MEMORY[0x1E0CEA0A0];
    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "prefersDynamicString"))
    {
      -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      objc_msgSend(v15, "dynamicStringForSize:attributes:", v14, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAttributedText:", v19);

    }
    else
    {
      objc_msgSend(v15, "stringWithAttributes:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAttributedText:", v16);
    }

  }
  else
  {
    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributedText:", 0);
  }

  -[HUTitleDescriptionCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_addTitleLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *v7;
  UILabel *titleLabel;
  double v9;
  double v10;
  void *v11;

  -[UILabel superview](self->_titleLabel, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Title label already added: %@"), self);
  if (!self->_titleLabel)
  {
    v4 = (void *)MEMORY[0x1E0CEA700];
    -[HUTitleDescriptionCell titleText](self, "titleText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleDescriptionCell titleFont](self, "titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labelWithText:font:", v5, v6);
    v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v7;

    LODWORD(v9) = 1144766464;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v9);
    LODWORD(v10) = 1132134400;
    -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v10);
  }
  -[HUIconCell containerView](self, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_titleLabel);

  -[HUTitleDescriptionCell updateTitle](self, "updateTitle");
}

- (void)_addDescriptionLabel
{
  void *v3;
  double v4;
  UILabel *descriptionLabel;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  id v12;

  -[UILabel superview](self->_descriptionLabel, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Description label already added: %@"), self);
  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    v6 = (void *)MEMORY[0x1E0CEA700];
    -[HUTitleDescriptionCell descriptionText](self, "descriptionText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleDescriptionCell descriptionFont](self, "descriptionFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "labelWithText:font:", v7, v8);
    v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v10 = self->_descriptionLabel;
    self->_descriptionLabel = v9;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_descriptionLabel, "setTextColor:", v11);

    descriptionLabel = self->_descriptionLabel;
  }
  LODWORD(v4) = 1144766464;
  -[UILabel setContentHuggingPriority:forAxis:](descriptionLabel, "setContentHuggingPriority:forAxis:", 1, v4);
  -[HUIconCell containerView](self, "containerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_descriptionLabel);

}

- (void)_addDescriptionIconView
{
  void *v3;
  id v4;
  UIImageView *v5;
  UIImageView *descriptionIconView;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  -[UIImageView superview](self->_descriptionIconView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Description icon view already added: %@"), self);
  if (!self->_descriptionIconView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    descriptionIconView = self->_descriptionIconView;
    self->_descriptionIconView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_descriptionIconView, "setTintColor:", v7);

    -[UIImageView setContentMode:](self->_descriptionIconView, "setContentMode:", 1);
    -[HUTitleDescriptionCell descriptionIcon](self, "descriptionIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HUTitleDescriptionCell descriptionIcon](self, "descriptionIcon");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageWithRenderingMode:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_descriptionIconView, "setImage:", v11);

    }
    LODWORD(v9) = 1132003328;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_descriptionIconView, "setContentCompressionResistancePriority:forAxis:", 1, v9);
  }
  -[HUIconCell containerView](self, "containerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_descriptionIconView);

}

- (void)updateTitle
{
  uint64_t v3;
  double v4;
  id v5;

  if (-[HUIconCell isDisabled](self, "isDisabled")
    && -[HUTitleDescriptionCell adjustsTextColorWhenDisabled](self, "adjustsTextColorWhenDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v3;
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v3);
  -[HUTitleDescriptionCell setTextColor:](self, "setTextColor:", v5);
  -[HUTitleDescriptionCell textAlpha](self, "textAlpha");
  if (v4 != 0.0)
  {
    -[HUTitleDescriptionCell textAlpha](self, "textAlpha");
    -[UILabel setAlpha:](self->_titleLabel, "setAlpha:");
    -[HUTitleDescriptionCell textAlpha](self, "textAlpha");
    -[UILabel setAlpha:](self->_descriptionLabel, "setAlpha:");
    -[HUTitleDescriptionCell textAlpha](self, "textAlpha");
    -[UIImageView setAlpha:](self->_descriptionIconView, "setAlpha:");
  }

}

- (NSLayoutConstraint)titleTrailingConstraint
{
  return self->_titleTrailingConstraint;
}

- (NSLayoutConstraint)descriptionTrailingConstraint
{
  return self->_descriptionTrailingConstraint;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (unint64_t)maxNumberOfTitleLines
{
  return self->_maxNumberOfTitleLines;
}

- (void)setMaxNumberOfTitleLines:(unint64_t)a3
{
  self->_maxNumberOfTitleLines = a3;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

- (BOOL)hideDescription
{
  return self->_hideDescription;
}

- (unint64_t)maxNumberOfDescriptionLines
{
  return self->_maxNumberOfDescriptionLines;
}

- (void)setMaxNumberOfDescriptionLines:(unint64_t)a3
{
  self->_maxNumberOfDescriptionLines = a3;
}

- (UIImage)descriptionIcon
{
  return self->_descriptionIcon;
}

- (BOOL)hideDescriptionIcon
{
  return self->_hideDescriptionIcon;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (BOOL)adjustsTextColorWhenDisabled
{
  return self->_adjustsTextColorWhenDisabled;
}

- (void)setAdjustsTextColorWhenDisabled:(BOOL)a3
{
  self->_adjustsTextColorWhenDisabled = a3;
}

- (NSArray)verticalLabelConstraints
{
  return self->_verticalLabelConstraints;
}

- (void)setVerticalLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_verticalLabelConstraints, a3);
}

- (NSArray)horizontalLabelConstraints
{
  return self->_horizontalLabelConstraints;
}

- (void)setHorizontalLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalLabelConstraints, a3);
}

- (UIImageView)descriptionIconView
{
  return self->_descriptionIconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionIconView, 0);
  objc_storeStrong((id *)&self->_horizontalLabelConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLabelConstraints, 0);
  objc_storeStrong((id *)&self->_descriptionIcon, 0);
  objc_storeStrong((id *)&self->_descriptionFont, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_descriptionTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
