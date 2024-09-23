@implementation HUTitleValueDescriptionCell

- (HUTitleValueDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTitleValueDescriptionCell *v4;
  uint64_t v5;
  UIFont *valueFont;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UILabel *valueLabel;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUTitleValueDescriptionCell;
  v4 = -[HUTitleDescriptionCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v5 = objc_claimAutoreleasedReturnValue();
    valueFont = v4->_valueFont;
    v4->_valueFont = (UIFont *)v5;

    -[HUTitleDescriptionCell setMaxNumberOfTitleLines:](v4, "setMaxNumberOfTitleLines:", 0);
    v7 = (void *)MEMORY[0x1E0CEA700];
    -[HUTitleDescriptionCell titleText](v4, "titleText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleDescriptionCell titleFont](v4, "titleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "labelWithText:font:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = (UILabel *)v10;

    -[UILabel _setTextColorFollowsTintColor:](v4->_valueLabel, "_setTextColorFollowsTintColor:", -[HUTitleValueDescriptionCell valueColorFollowsTintColor](v4, "valueColorFollowsTintColor"));
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_valueLabel, "setTextColor:", v12);

  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUTitleValueDescriptionCell;
  -[HUTitleDescriptionCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUTitleValueDescriptionCell setHideValue:](self, "setHideValue:", 0);
  -[HUTitleValueDescriptionCell setValueText:](self, "setValueText:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueDescriptionCell setValueFont:](self, "setValueFont:", v3);

  -[HUTitleValueDescriptionCell setValueColorFollowsTintColor:](self, "setValueColorFollowsTintColor:", 0);
}

- (void)setHideValue:(BOOL)a3
{
  if (self->_hideValue != a3)
  {
    self->_hideValue = a3;
    -[HUTitleValueDescriptionCell _updateValueHidden](self, "_updateValueHidden");
  }
}

- (void)setValueText:(id)a3
{
  id v5;
  id v6;
  id v7;
  char v8;
  void *v9;
  id v10;

  v5 = a3;
  -[HUTitleValueDescriptionCell valueText](self, "valueText");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v10 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v6)
    {
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_valueText, a3);
    -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v10);

    -[HUTitleValueDescriptionCell _updateValueHidden](self, "_updateValueHidden");
    -[HUTitleValueDescriptionCell _updateValueWidthConstraintConstant](self, "_updateValueWidthConstraintConstant");
  }
LABEL_8:

}

- (void)setValueFont:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIFont isEqual:](self->_valueFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueFont, a3);
    -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    -[HUTitleValueDescriptionCell _updateValueWidthConstraintConstant](self, "_updateValueWidthConstraintConstant");
  }

}

- (void)setValueColorFollowsTintColor:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_valueColorFollowsTintColor != a3)
  {
    v3 = a3;
    self->_valueColorFollowsTintColor = a3;
    -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setTextColorFollowsTintColor:", v3);

    -[HUTitleValueDescriptionCell _updateValue](self, "_updateValue");
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
  uint64_t v26;
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
  _QWORD v43[5];
  _QWORD v44[5];
  objc_super v45;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);

  v45.receiver = self;
  v45.super_class = (Class)HUTitleValueDescriptionCell;
  -[HUTitleDescriptionCell updateConstraints](&v45, sel_updateConstraints);
  -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleValueDescriptionCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

    -[HUTitleValueDescriptionCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v16, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

    -[HUTitleValueDescriptionCell valueLabelWidthConstraint](self, "valueLabelWidthConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "widthAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToConstant:", 1.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleValueDescriptionCell setValueLabelWidthConstraint:](self, "setValueLabelWidthConstraint:", v21);

    }
    -[HUTitleValueDescriptionCell _updateValueWidthConstraintConstant](self, "_updateValueWidthConstraintConstant");
    -[HUTitleValueDescriptionCell valueLabelWidthConstraint](self, "valueLabelWidthConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

    -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintsAffectingLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __48__HUTitleValueDescriptionCell_updateConstraints__block_invoke;
    v44[3] = &unk_1E6F57D48;
    v44[4] = self;
    objc_msgSend(v25, "na_each:", v44);

    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintsAffectingLayout");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v26;
    v43[1] = 3221225472;
    v43[2] = __48__HUTitleValueDescriptionCell_updateConstraints__block_invoke_2;
    v43[3] = &unk_1E6F57D48;
    v43[4] = self;
    objc_msgSend(v29, "na_each:", v43);

    -[HUTitleDescriptionCell titleTrailingConstraint](self, "titleTrailingConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 0);

    -[HUTitleDescriptionCell descriptionTrailingConstraint](self, "descriptionTrailingConstraint");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 0);

    -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v35, 1.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v36);

    -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v40, 1.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v41);

  }
  else
  {
    -[HUTitleValueDescriptionCell valueLabelWidthConstraint](self, "valueLabelWidthConstraint");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 0);

    -[HUTitleValueDescriptionCell setValueLabelWidthConstraint:](self, "setValueLabelWidthConstraint:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);

}

void __48__HUTitleValueDescriptionCell_updateConstraints__block_invoke(uint64_t a1, void *a2)
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
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "firstAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v5) & 1) != 0)
    objc_msgSend(v13, "secondAnchor");
  else
    objc_msgSend(v13, "firstAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v9))
  {

LABEL_7:
    objc_msgSend(v13, "setActive:", 0);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isEqual:", v11);

  if (v12)
    goto LABEL_7;
LABEL_8:

}

void __48__HUTitleValueDescriptionCell_updateConstraints__block_invoke_2(uint64_t a1, void *a2)
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
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "firstAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v5) & 1) != 0)
    objc_msgSend(v13, "secondAnchor");
  else
    objc_msgSend(v13, "firstAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v9))
  {

LABEL_7:
    objc_msgSend(v13, "setActive:", 0);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isEqual:", v11);

  if (v12)
    goto LABEL_7;
LABEL_8:

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUTitleValueDescriptionCell;
  -[HUTitleDescriptionCell updateUIWithAnimation:](&v9, sel_updateUIWithAnimation_, a3);
  objc_opt_class();
  -[HUIconCell item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C08]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  -[HUTitleValueDescriptionCell setValueText:](self, "setValueText:", v8);

  -[HUTitleValueDescriptionCell _updateValueWidthConstraintConstant](self, "_updateValueWidthConstraintConstant");
}

- (void)_updateValueWidthConstraintConstant
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueDescriptionCell bounds](self, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  v7 = v6;

  -[HUTitleValueDescriptionCell valueLabelWidthConstraint](self, "valueLabelWidthConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUTitleValueDescriptionCell valueLabelWidthConstraint](self, "valueLabelWidthConstraint");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v7);

  }
}

- (void)_updateValueHidden
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[HUTitleValueDescriptionCell hideValue](self, "hideValue"))
  {
    v3 = 1;
  }
  else
  {
    -[HUTitleValueDescriptionCell valueText](self, "valueText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length") == 0;

  }
  -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  if (((v3 ^ v7) & 1) == 0)
  {
    if (v3)
    {
      -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
    else
    {
      -[HUIconCell containerView](self, "containerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleValueDescriptionCell valueLabel](self, "valueLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);

      -[HUTitleValueDescriptionCell _updateValueWidthConstraintConstant](self, "_updateValueWidthConstraintConstant");
    }
    -[HUTitleValueDescriptionCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[HUTitleDescriptionCell updateTitle](self, "updateTitle");
  }
}

- (void)_updateValue
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__HUTitleValueDescriptionCell__updateValue__block_invoke;
  v4[3] = &unk_1E6F57358;
  v4[4] = self;
  __43__HUTitleValueDescriptionCell__updateValue__block_invoke((uint64_t)v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_valueLabel, "setTextColor:", v3);

}

id __43__HUTitleValueDescriptionCell__updateValue__block_invoke(uint64_t a1)
{
  void *v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDisabled") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "valueColorFollowsTintColor") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tintColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (NSString)valueText
{
  return self->_valueText;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (BOOL)hideValue
{
  return self->_hideValue;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (BOOL)valueColorFollowsTintColor
{
  return self->_valueColorFollowsTintColor;
}

- (NSLayoutConstraint)valueLabelWidthConstraint
{
  return self->_valueLabelWidthConstraint;
}

- (void)setValueLabelWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabelWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
}

@end
