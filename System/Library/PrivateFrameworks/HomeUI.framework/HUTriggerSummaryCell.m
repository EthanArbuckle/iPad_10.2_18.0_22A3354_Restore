@implementation HUTriggerSummaryCell

- (HUTriggerSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTriggerSummaryCell *v4;
  uint64_t v5;
  UIFont *titleFont;
  uint64_t v7;
  UIFont *descriptionFont;
  HUIconListView *v9;
  HUIconListView *iconContainerView;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *textContainerView;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUTriggerSummaryCell;
  v4 = -[HUTriggerSummaryCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
    v5 = objc_claimAutoreleasedReturnValue();
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v5;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v7 = objc_claimAutoreleasedReturnValue();
    descriptionFont = v4->_descriptionFont;
    v4->_descriptionFont = (UIFont *)v7;

    v4->_textAlpha = 1.0;
    v4->_hideDescriptionIcon = 1;
    v9 = objc_alloc_init(HUIconListView);
    iconContainerView = v4->_iconContainerView;
    v4->_iconContainerView = v9;

    -[HUIconListView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconListView setBackgroundColor:](v4->_iconContainerView, "setBackgroundColor:", v11);

    -[HUTriggerSummaryCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_iconContainerView);

    -[HUTriggerSummaryCell setUpIconContainerViewConstraints](v4, "setUpIconContainerViewConstraints");
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    textContainerView = v4->_textContainerView;
    v4->_textContainerView = v13;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUTriggerSummaryCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v4->_textContainerView);

    -[HUTriggerSummaryCell setUpTextContainerViewConstraints](v4, "setUpTextContainerViewConstraints");
    -[HUTriggerSummaryCell _addTitleLabel](v4, "_addTitleLabel");
    -[HUTriggerSummaryCell _addDescriptionLabel](v4, "_addDescriptionLabel");
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryCell setCellColor:](v4, "setCellColor:", v16);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUTriggerSummaryCell;
  -[HUTriggerSummaryCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUTriggerSummaryCell setHideTitle:](self, "setHideTitle:", 0);
  -[HUTriggerSummaryCell setTitleText:](self, "setTitleText:", 0);
  -[HUTriggerSummaryCell setDisabled:](self, "setDisabled:", 0);
  -[HUTriggerSummaryCell setCanBeSelected:](self, "setCanBeSelected:", 1);
  -[HUTriggerSummaryCell setHideDescription:](self, "setHideDescription:", 0);
  -[HUTriggerSummaryCell setDescriptionText:](self, "setDescriptionText:", 0);
}

- (void)setIconDescriptors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUTriggerSummaryCell iconContainerView](self, "iconContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconDescriptors:", v4);

}

- (UILabel)titleLabel
{
  UILabel *titleLabel;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    -[HUTriggerSummaryCell _addTitleLabel](self, "_addTitleLabel");
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
  -[HUTriggerSummaryCell titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setHideTitle:(BOOL)a3
{
  if (self->_hideTitle != a3)
  {
    self->_hideTitle = a3;
    if (a3)
      -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    else
      -[HUTriggerSummaryCell _addTitleLabel](self, "_addTitleLabel");
    -[HUTriggerSummaryCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (UILabel)descriptionLabel
{
  UILabel *descriptionLabel;

  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    -[HUTriggerSummaryCell _addDescriptionLabel](self, "_addDescriptionLabel");
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
  -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setHideDescription:(BOOL)a3
{
  if (self->_hideDescription != a3)
  {
    self->_hideDescription = a3;
    if (a3)
      -[UILabel removeFromSuperview](self->_descriptionLabel, "removeFromSuperview");
    else
      -[HUTriggerSummaryCell _addDescriptionLabel](self, "_addDescriptionLabel");
    -[HUTriggerSummaryCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
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
    -[HUTriggerSummaryCell descriptionIconView](self, "descriptionIconView");
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
      -[HUTriggerSummaryCell _addDescriptionIconView](self, "_addDescriptionIconView");
    -[HUTriggerSummaryCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = a3;
  self->_disabled = a3;
  -[HUTriggerSummaryCell updateTitle](self, "updateTitle");
  -[HUTriggerSummaryCell updateSelectionUI](self, "updateSelectionUI");
  v5 = 0.200000003;
  if (!v3)
    v5 = 1.0;
  -[HUTriggerSummaryCell setTextAlpha:](self, "setTextAlpha:", v5);
}

- (BOOL)canBeSelected
{
  return !-[HUTriggerSummaryCell isDisabled](self, "isDisabled") && self->_canBeSelected;
}

- (void)setCanBeSelected:(BOOL)a3
{
  self->_canBeSelected = a3;
  -[HUTriggerSummaryCell updateSelectionUI](self, "updateSelectionUI");
}

- (void)setTextAlpha:(double)a3
{
  self->_textAlpha = a3;
  -[HUTriggerSummaryCell updateTitle](self, "updateTitle");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HUTriggerSummaryCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfLines:", 0);

  -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);

  -[HUTriggerSummaryCell updateVerticalLabelConstraints](self, "updateVerticalLabelConstraints");
  -[HUTriggerSummaryCell updateHorizontalLabelConstraints](self, "updateHorizontalLabelConstraints");
  v5.receiver = self;
  v5.super_class = (Class)HUTriggerSummaryCell;
  -[HUTriggerSummaryCell updateConstraints](&v5, sel_updateConstraints);
}

- (void)setUpIconContainerViewConstraints
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
  id v22;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryCell iconContainerView](self, "iconContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 16.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v7);

  -[HUTriggerSummaryCell iconContainerView](self, "iconContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 16.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v12);

  -[HUTriggerSummaryCell iconContainerView](self, "iconContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 16.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v17);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[HUTriggerSummaryCell iconContainerView](self, "iconContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 8, 0, 0, 0, 1.0, 32.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTriggerSummaryCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addConstraint:", v20);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v22);
}

- (void)setUpTextContainerViewConstraints
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
  id v27;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryCell iconContainerView](self, "iconContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 8.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v7);

  -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 16.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v12);

  -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -16.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v17);

  -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, -16.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v22);

  v23 = (void *)MEMORY[0x1E0CB3718];
  -[HUTriggerSummaryCell iconContainerView](self, "iconContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 8, 0, 0, 0, 1.0, 32.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTriggerSummaryCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addConstraint:", v25);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v27);
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
  -[HUTriggerSummaryCell verticalLabelConstraints](self, "verticalLabelConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel superview](self->_titleLabel, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUTriggerSummaryCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
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
      -[HUTriggerSummaryCell titleLabel](self, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
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

    -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
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
      -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v23);

    }
    -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
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
      -[HUTriggerSummaryCell descriptionIconView](self, "descriptionIconView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "topAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v34);

      -[HUTriggerSummaryCell descriptionIconView](self, "descriptionIconView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bottomAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v39);

    }
  }
  -[HUTriggerSummaryCell setVerticalLabelConstraints:](self, "setVerticalLabelConstraints:", v42);
  v40 = (void *)MEMORY[0x1E0CB3718];
  -[HUTriggerSummaryCell verticalLabelConstraints](self, "verticalLabelConstraints");
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
  id v40;

  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUTriggerSummaryCell horizontalLabelConstraints](self, "horizontalLabelConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel superview](self->_titleLabel, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUTriggerSummaryCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v10);

    -[HUTriggerSummaryCell titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v15);

  }
  -[UILabel superview](self->_descriptionLabel, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UIImageView superview](self->_descriptionIconView, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[HUTriggerSummaryCell descriptionIconView](self, "descriptionIconView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v22);

      -[HUTriggerSummaryCell descriptionIconView](self, "descriptionIconView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "widthAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerSummaryCell descriptionIconView](self, "descriptionIconView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "heightAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v27);

      -[HUTriggerSummaryCell descriptionIconView](self, "descriptionIconView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, -5.0);
    }
    else
    {
      -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "leadingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v31);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v32);

    -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v37);

  }
  -[HUTriggerSummaryCell setHorizontalLabelConstraints:](self, "setHorizontalLabelConstraints:", v40);
  v38 = (void *)MEMORY[0x1E0CB3718];
  -[HUTriggerSummaryCell horizontalLabelConstraints](self, "horizontalLabelConstraints");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v39);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  id v5;

  -[HUTriggerSummaryCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HUTriggerSummaryCell updateUITextWithResults:](self, "updateUITextWithResults:", v5);
  -[HUTriggerSummaryCell updateUIIconsWithResults:](self, "updateUIIconsWithResults:", v5);
  -[HUTriggerSummaryCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)updateUITextWithResults:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryCell setTitleText:](self, "setTitleText:", v5);

  -[HUTriggerSummaryCell updateTitle](self, "updateTitle");
  v6 = *MEMORY[0x1E0D30BF8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v20[0] = *MEMORY[0x1E0CEA098];
    -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v20[1] = *MEMORY[0x1E0CEA0A0];
    -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "prefersDynamicString"))
    {
      -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      objc_msgSend(v13, "dynamicStringForSize:attributes:", v12, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAttributedText:", v17);

    }
    else
    {
      objc_msgSend(v13, "stringWithAttributes:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAttributedText:", v14);
    }

  }
  else
  {
    -[HUTriggerSummaryCell descriptionLabel](self, "descriptionLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAttributedText:", 0);

  }
}

- (void)updateUIIconsWithResults:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "addObject:", v5);
    v6 = objc_alloc(MEMORY[0x1E0D31460]);
    v7 = (void *)objc_msgSend(v6, "initWithImageIdentifier:", *MEMORY[0x1E0D30830]);
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C68]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "addObjectsFromArray:", v8);
  -[HUTriggerSummaryCell setIconDescriptors:](self, "setIconDescriptors:", v4);

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
    -[HUTriggerSummaryCell titleText](self, "titleText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryCell titleFont](self, "titleFont");
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
  -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_titleLabel);

  -[HUTriggerSummaryCell updateTitle](self, "updateTitle");
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
    -[HUTriggerSummaryCell descriptionText](self, "descriptionText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryCell descriptionFont](self, "descriptionFont");
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
  -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_descriptionLabel);

}

- (void)_addDescriptionIconView
{
  id v3;
  UIImageView *v4;
  UIImageView *descriptionIconView;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_descriptionIconView)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA658]);
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    descriptionIconView = self->_descriptionIconView;
    self->_descriptionIconView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_descriptionIconView, "setTintColor:", v6);

    -[UIImageView setContentMode:](self->_descriptionIconView, "setContentMode:", 1);
    -[HUTriggerSummaryCell descriptionIcon](self, "descriptionIcon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HUTriggerSummaryCell descriptionIcon](self, "descriptionIcon");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageWithRenderingMode:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_descriptionIconView, "setImage:", v10);

    }
    LODWORD(v8) = 1132003328;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_descriptionIconView, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  }
  -[HUTriggerSummaryCell textContainerView](self, "textContainerView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_descriptionIconView);

}

- (void)updateTitle
{
  void *v3;
  double v4;

  if (-[HUTriggerSummaryCell isDisabled](self, "isDisabled"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v3);

  -[HUTriggerSummaryCell textAlpha](self, "textAlpha");
  if (v4 != 0.0)
  {
    -[HUTriggerSummaryCell textAlpha](self, "textAlpha");
    -[UILabel setAlpha:](self->_titleLabel, "setAlpha:");
    -[HUTriggerSummaryCell textAlpha](self, "textAlpha");
    -[UILabel setAlpha:](self->_descriptionLabel, "setAlpha:");
  }
}

- (void)updateSelectionUI
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[HUTriggerSummaryCell canBeSelected](self, "canBeSelected");
  if (v3)
    v4 = 3;
  else
    v4 = 0;
  -[HUTriggerSummaryCell setAccessoryType:](self, "setAccessoryType:", v3);
  -[HUTriggerSummaryCell setSelectionStyle:](self, "setSelectionStyle:", v4);
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

- (NSString)titleText
{
  return self->_titleText;
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (BOOL)hideDescription
{
  return self->_hideDescription;
}

- (UIImage)descriptionIcon
{
  return self->_descriptionIcon;
}

- (BOOL)hideDescriptionIcon
{
  return self->_hideDescriptionIcon;
}

- (NSArray)iconDescriptors
{
  return self->_iconDescriptors;
}

- (UIColor)cellColor
{
  return self->_cellColor;
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

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UIImageView)descriptionIconView
{
  return self->_descriptionIconView;
}

- (void)setDescriptionIconView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionIconView, a3);
}

- (HUIconListView)iconContainerView
{
  return self->_iconContainerView;
}

- (void)setIconContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_iconContainerView, a3);
}

- (UIView)textContainerView
{
  return self->_textContainerView;
}

- (void)setTextContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_textContainerView, a3);
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

- (void)setDescriptionFont:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_iconContainerView, 0);
  objc_storeStrong((id *)&self->_descriptionIconView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_horizontalLabelConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLabelConstraints, 0);
  objc_storeStrong((id *)&self->_cellColor, 0);
  objc_storeStrong((id *)&self->_iconDescriptors, 0);
  objc_storeStrong((id *)&self->_descriptionIcon, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
