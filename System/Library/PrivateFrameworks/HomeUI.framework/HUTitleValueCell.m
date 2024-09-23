@implementation HUTitleValueCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUTitleValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTitleValueCell *v4;
  uint64_t v5;
  uint64_t v6;
  UIFont *titleFont;
  uint64_t v8;
  UIFont *valueFont;
  UIStackView *v10;
  UIStackView *labelsStackView;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUTitleValueCell;
  v4 = -[HUIconCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = *MEMORY[0x1E0CEB538];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v6 = objc_claimAutoreleasedReturnValue();
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v6;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    valueFont = v4->_valueFont;
    v4->_valueFont = (UIFont *)v8;

    v10 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0CEA9E0]);
    labelsStackView = v4->_labelsStackView;
    v4->_labelsStackView = v10;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_labelsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v4->_labelsStackView, "setAxis:", 0);
    v4->_useVerticalLayoutOnly = 0;
    -[HUIconCell containerView](v4, "containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_labelsStackView);

    -[HUTitleValueCell _addTitleLabel](v4, "_addTitleLabel");
    -[HUTitleValueCell _addValueLabel](v4, "_addValueLabel");
  }
  return v4;
}

- (void)prepareForReuse
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUTitleValueCell;
  -[HUIconCell prepareForReuse](&v8, sel_prepareForReuse);
  -[HUTitleValueCell setHideTitle:](self, "setHideTitle:", 0);
  -[HUTitleValueCell setTitleText:](self, "setTitleText:", 0);
  v3 = *MEMORY[0x1E0CEB538];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueCell setTitleFont:](self, "setTitleFont:", v4);

  -[HUTitleValueCell setHideValue:](self, "setHideValue:", 0);
  -[HUTitleValueCell setValueText:](self, "setValueText:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueCell setValueFont:](self, "setValueFont:", v5);

  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 1);

  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 1);

  -[HUTitleValueCell setValueColorFollowsTintColor:](self, "setValueColorFollowsTintColor:", 0);
  -[HUTitleValueCell setTitleColorFollowsTintColor:](self, "setTitleColorFollowsTintColor:", 0);
  -[HUTitleValueCell setAllowCopyValueToPasteboard:](self, "setAllowCopyValueToPasteboard:", 0);
  -[HUTitleValueCell setUseVerticalLayoutOnly:](self, "setUseVerticalLayoutOnly:", 0);
  -[HUTitleValueCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[HUTitleValueCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUTitleValueCell;
  -[HUTitleValueCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HUTitleValueCell _updateValue](self, "_updateValue");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3 && -[HUTitleValueCell allowCopyValueToPasteboard](self, "allowCopyValueToPasteboard");
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", v5);

}

- (void)setTitleText:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_titleText, a3);
  v5 = a3;
  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

}

- (void)setTitleFont:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_titleFont, a3);
  v5 = a3;
  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

}

- (void)setHideTitle:(BOOL)a3
{
  if (self->_hideTitle != a3)
  {
    self->_hideTitle = a3;
    if (a3)
    {
      -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    }
    else
    {
      -[HUTitleValueCell _addTitleLabel](self, "_addTitleLabel");
      -[HUTitleValueCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
  }
}

- (void)setValueText:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_valueText, a3);
  v5 = a3;
  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

}

- (void)setValueFont:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_valueFont, a3);
  v5 = a3;
  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

}

- (void)setTitleColorFollowsTintColor:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  self->_titleColorFollowsTintColor = a3;
  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTextColorFollowsTintColor:", v3);

  -[HUTitleValueCell _updateTitle](self, "_updateTitle");
}

- (void)setValueColorFollowsTintColor:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  self->_valueColorFollowsTintColor = a3;
  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTextColorFollowsTintColor:", v3);

  -[HUTitleValueCell _updateValue](self, "_updateValue");
}

- (void)setHideValue:(BOOL)a3
{
  if (self->_hideValue != a3)
  {
    self->_hideValue = a3;
    if (a3)
    {
      -[UILabel removeFromSuperview](self->_valueLabel, "removeFromSuperview");
    }
    else
    {
      -[HUTitleValueCell _addValueLabel](self, "_addValueLabel");
      -[HUTitleValueCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
  }
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HUTitleValueCell;
  -[HUIconCell setDisabled:](&v5, sel_setDisabled_);
  -[HUTitleValueCell _updateTitle](self, "_updateTitle");
  -[HUTitleValueCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", !v3);
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
  objc_super v11;

  -[HUTitleValueCell stackViewConstraints](self, "stackViewConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_labelsStackView"), self->_labelsStackView, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_labelsStackView]|"), 0, 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

    v8 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_labelsStackView"), self->_labelsStackView, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_labelsStackView]|"), 0, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v10);

    -[HUTitleValueCell setStackViewConstraints:](self, "setStackViewConstraints:", v4);
    -[UIStackView updateConstraintsIfNeeded](self->_labelsStackView, "updateConstraintsIfNeeded");
    -[UIStackView setNeedsLayout](self->_labelsStackView, "setNeedsLayout");
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);

  }
  -[HUTitleValueCell _ensureCorrectHeaderViewOrientation](self, "_ensureCorrectHeaderViewOrientation");
  v11.receiver = self;
  v11.super_class = (Class)HUTitleValueCell;
  -[HUIconCell updateConstraints](&v11, sel_updateConstraints);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUTitleValueCell;
  -[HUTitleValueCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HUTitleValueCell _ensureCorrectHeaderViewOrientation](self, "_ensureCorrectHeaderViewOrientation");
}

- (void)_ensureCorrectHeaderViewOrientation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  id v10;
  UIStackView *v11;
  _BOOL4 v12;
  uint64_t v13;
  UIStackView *v14;
  id v15[8];

  v14 = self->_labelsStackView;
  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(v3, "sizeToFit");
    objc_msgSend(v5, "sizeToFit");
    objc_msgSend(v3, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
        -[HUTitleValueCell labelSpacing](self, "labelSpacing");
      else
        v8 = 0.0;
      -[UIStackView setSpacing:](v14, "setSpacing:", v8);

    }
    else
    {
      -[UIStackView setSpacing:](v14, "setSpacing:", 0.0);
    }

    v15[0] = (id)MEMORY[0x1E0C809B0];
    v15[1] = (id)3221225472;
    v15[2] = __55__HUTitleValueCell__ensureCorrectHeaderViewOrientation__block_invoke;
    v15[3] = &unk_1E6F5B5F8;
    v15[4] = self;
    v9 = v3;
    v15[5] = v9;
    v10 = v5;
    v15[6] = v10;
    v11 = v14;
    v15[7] = v11;
    v12 = __55__HUTitleValueCell__ensureCorrectHeaderViewOrientation__block_invoke(v15);
    -[UIStackView setDistribution:](v11, "setDistribution:", 0);
    if (v12)
    {
      -[UIStackView setAxis:](v11, "setAxis:", 1);
      -[UIStackView setAlignment:](v11, "setAlignment:", 0);
      objc_msgSend(v9, "setNumberOfLines:", 0);
      objc_msgSend(v10, "setNumberOfLines:", 0);
      v13 = 4;
    }
    else
    {
      -[UIStackView setAxis:](v11, "setAxis:", 0);
      -[UIStackView setAlignment:](v11, "setAlignment:", 2);
      objc_msgSend(v9, "setNumberOfLines:", 1);
      objc_msgSend(v10, "setNumberOfLines:", 1);
      v13 = 2
          * (-[HUTitleValueCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0);
    }
    objc_msgSend(v10, "setTextAlignment:", v13);

  }
}

BOOL __55__HUTitleValueCell__ensureCorrectHeaderViewOrientation__block_invoke(id *a1)
{
  void *v3;
  void *v4;
  double Width;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  if ((objc_msgSend(a1[4], "useVerticalLayoutOnly") & 1) != 0)
    return 1;
  objc_msgSend(a1[4], "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Width = 0.0;
  v6 = 0.0;
  if (v4 && (objc_msgSend(a1[4], "hideIcon") & 1) == 0)
  {
    objc_msgSend(a1[4], "contentMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iconSize");
    v9 = v8;
    objc_msgSend(a1[4], "contentMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInset");
    v12 = v9 + v11;
    objc_msgSend(a1[4], "contentMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentInset");
    v6 = v12 + v14;

  }
  objc_msgSend(a1[4], "accessoryView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(a1[4], "accessoryView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    Width = CGRectGetWidth(v24);

  }
  objc_msgSend(a1[5], "frame");
  v17 = CGRectGetWidth(v25);
  objc_msgSend(a1[6], "frame");
  v18 = v17 + CGRectGetWidth(v26);
  objc_msgSend(a1[7], "spacing");
  v20 = v18 + v19;
  objc_msgSend(a1[4], "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "readableContentGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layoutFrame");
  v23 = CGRectGetWidth(v27) - v6 - Width;

  return v20 > v23;
}

- (double)labelSpacing
{
  return 16.0;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
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
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  HUBadgeAndDisclosureAccessoryView *v21;
  HUBadgeAndDisclosureAccessoryView *v22;
  HUBadgeAndDisclosureAccessoryView *v23;
  void *v24;
  uint64_t v25;
  HUBadgeAndDisclosureAccessoryView *v26;
  void *v27;
  HUBadgeAndDisclosureAccessoryView *v28;
  objc_super v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v3 = a3;
  v31[2] = *MEMORY[0x1E0C80C00];
  -[HUIconCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v29.receiver = self;
  v29.super_class = (Class)HUTitleValueCell;
  -[HUIconCell updateUIWithAnimation:](&v29, sel_updateUIWithAnimation_, v3);
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueCell setTitleText:](self, "setTitleText:", v7);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v8);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C08]),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30[0] = *MEMORY[0x1E0CEA098];
    -[HUTitleValueCell valueLabel](self, "valueLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v11;
    v30[1] = *MEMORY[0x1E0CEA0A0];
    -[HUTitleValueCell valueLabel](self, "valueLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "prefersDynamicString"))
    {
      -[HUTitleValueCell valueLabel](self, "valueLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      objc_msgSend(v9, "dynamicStringForSize:attributes:", v14, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleValueCell valueLabel](self, "valueLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAttributedText:", v18);

    }
    else
    {
      objc_msgSend(v9, "stringWithAttributes:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleValueCell valueLabel](self, "valueLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAttributedText:", v15);
    }

    -[HUTitleValueCell valueLabel](self, "valueLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeToFit");

  }
  else
  {
    -[HUTitleValueCell valueLabel](self, "valueLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedText:", 0);
  }

  objc_opt_class();
  -[HUTitleValueCell accessoryView](self, "accessoryView");
  v21 = (HUBadgeAndDisclosureAccessoryView *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BB8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedIntegerValue");

  if (v25 == 2)
  {
    if (!v23)
    {
      v26 = [HUBadgeAndDisclosureAccessoryView alloc];
      v21 = -[HUBadgeAndDisclosureAccessoryView initWithFrame:](v26, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA8]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBadgeAndDisclosureAccessoryView setBadgeCount:](v21, "setBadgeCount:", objc_msgSend(v27, "integerValue"));

    -[HUBadgeAndDisclosureAccessoryView sizeToFit](v21, "sizeToFit");
    v28 = v21;
    goto LABEL_16;
  }
  if (v23)
  {
    v28 = 0;
LABEL_16:
    -[HUTitleValueCell setAccessoryView:](self, "setAccessoryView:", v28);

  }
  -[HUTitleValueCell _updateTitle](self, "_updateTitle");
  -[HUTitleValueCell _ensureCorrectHeaderViewOrientation](self, "_ensureCorrectHeaderViewOrientation");

}

- (void)_addTitleLabel
{
  void *v3;
  UILabel *titleLabel;
  id v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  void *v10;

  -[UILabel superview](self->_titleLabel, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Title label already added: %@"), self);
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA700]);
    v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_titleLabel;
    self->_titleLabel = v6;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUTitleValueCell titleFont](self, "titleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v8);

    -[HUTitleValueCell titleText](self, "titleText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v9);

    -[UILabel _setTextColorFollowsTintColor:](self->_titleLabel, "_setTextColorFollowsTintColor:", -[HUTitleValueCell titleColorFollowsTintColor](self, "titleColorFollowsTintColor"));
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v10);

    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
    titleLabel = self->_titleLabel;
  }
  -[UIStackView addArrangedSubview:](self->_labelsStackView, "addArrangedSubview:", titleLabel);
  -[HUTitleValueCell _updateTitle](self, "_updateTitle");
}

- (void)_addValueLabel
{
  void *v3;
  UILabel *valueLabel;
  id v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  void *v9;

  -[UILabel superview](self->_valueLabel, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Value label already added: %@"), self);
  valueLabel = self->_valueLabel;
  if (!valueLabel)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA700]);
    v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_valueLabel;
    self->_valueLabel = v6;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUTitleValueCell valueFont](self, "valueFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_valueLabel, "setFont:", v8);

    -[HUTitleValueCell valueText](self, "valueText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_valueLabel, "setText:", v9);

    -[UILabel _setTextColorFollowsTintColor:](self->_valueLabel, "_setTextColorFollowsTintColor:", -[HUTitleValueCell valueColorFollowsTintColor](self, "valueColorFollowsTintColor"));
    -[UILabel setLineBreakMode:](self->_valueLabel, "setLineBreakMode:", 0);
    valueLabel = self->_valueLabel;
  }
  -[UIStackView addArrangedSubview:](self->_labelsStackView, "addArrangedSubview:", valueLabel);
  -[HUTitleValueCell _updateValue](self, "_updateValue");
}

- (void)_updateTitle
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__HUTitleValueCell__updateTitle__block_invoke;
  v4[3] = &unk_1E6F57358;
  v4[4] = self;
  __32__HUTitleValueCell__updateTitle__block_invoke((uint64_t)v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v3);
  -[HUTitleValueCell setTextColor:](self, "setTextColor:", v3);

}

id __32__HUTitleValueCell__updateTitle__block_invoke(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "titleColorFollowsTintColor"))
      objc_msgSend(*(id *)(a1 + 32), "tintColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_updateValue
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__HUTitleValueCell__updateValue__block_invoke;
  v4[3] = &unk_1E6F57358;
  v4[4] = self;
  __32__HUTitleValueCell__updateValue__block_invoke((uint64_t)v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_valueLabel, "setTextColor:", v3);

}

id __32__HUTitleValueCell__updateValue__block_invoke(uint64_t a1)
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

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (UIStackView)labelsStackView
{
  return self->_labelsStackView;
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

- (BOOL)titleColorFollowsTintColor
{
  return self->_titleColorFollowsTintColor;
}

- (BOOL)valueColorFollowsTintColor
{
  return self->_valueColorFollowsTintColor;
}

- (BOOL)allowCopyValueToPasteboard
{
  return self->_allowCopyValueToPasteboard;
}

- (void)setAllowCopyValueToPasteboard:(BOOL)a3
{
  self->_allowCopyValueToPasteboard = a3;
}

- (BOOL)useVerticalLayoutOnly
{
  return self->_useVerticalLayoutOnly;
}

- (void)setUseVerticalLayoutOnly:(BOOL)a3
{
  self->_useVerticalLayoutOnly = a3;
}

- (NSArray)stackViewConstraints
{
  return self->_stackViewConstraints;
}

- (void)setStackViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewConstraints, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
