@implementation HKDisplayTypeContextVerticalCollectionViewCell

- (HKDisplayTypeContextVerticalCollectionViewCell)initWithFrame:(CGRect)a3
{
  HKDisplayTypeContextVerticalCollectionViewCell *v3;
  void *v4;
  double v5;
  uint64_t v6;
  UILabel *titleLabel;
  void *v8;
  double v9;
  uint64_t v10;
  UILabel *valueAndUnitLabel;
  uint64_t v12;
  UIButton *infoButton;
  void *v14;
  uint64_t v15;
  UIStackView *contentStackView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *minTitleWidthConstraint;
  double v23;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;
  _QWORD v48[4];
  _QWORD v49[5];

  v49[3] = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)HKDisplayTypeContextVerticalCollectionViewCell;
  v3 = -[HKDisplayTypeContextVerticalCollectionViewCell initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionItemTitleFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = 1132068864;
    -[HKDisplayTypeContextVerticalCollectionViewCell _labelWithFont:allowsMultiline:supportsDyanmicType:layoutPriority:](v3, "_labelWithFont:allowsMultiline:supportsDyanmicType:layoutPriority:", v4, 1, 1, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v6;

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionItemValueAndUnitFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1148813312;
    -[HKDisplayTypeContextVerticalCollectionViewCell _labelWithFont:allowsMultiline:supportsDyanmicType:layoutPriority:](v3, "_labelWithFont:allowsMultiline:supportsDyanmicType:layoutPriority:", v8, 1, 1, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    valueAndUnitLabel = v3->_valueAndUnitLabel;
    v3->_valueAndUnitLabel = (UILabel *)v10;

    -[HKDisplayTypeContextVerticalCollectionViewCell _generateInfoButton](v3, "_generateInfoButton");
    v12 = objc_claimAutoreleasedReturnValue();
    infoButton = v3->_infoButton;
    v3->_infoButton = (UIButton *)v12;

    v49[0] = v3->_titleLabel;
    v49[1] = v3->_valueAndUnitLabel;
    v49[2] = v3->_infoButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell _stackViewWithArrangedSubviews:](v3, "_stackViewWithArrangedSubviews:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    contentStackView = v3->_contentStackView;
    v3->_contentStackView = (UIStackView *)v15;

    -[HKDisplayTypeContextVerticalCollectionViewCell configureForTraitCollection](v3, "configureForTraitCollection");
    -[HKDisplayTypeContextVerticalCollectionViewCell contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v3->_contentStackView);

    -[UILabel widthAnchor](v3->_titleLabel, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell contentView](v3, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:multiplier:", v20, 0.25);
    v21 = objc_claimAutoreleasedReturnValue();
    minTitleWidthConstraint = v3->_minTitleWidthConstraint;
    v3->_minTitleWidthConstraint = (NSLayoutConstraint *)v21;

    LODWORD(v23) = 1148829696;
    -[NSLayoutConstraint setPriority:](v3->_minTitleWidthConstraint, "setPriority:", v23);
    -[NSLayoutConstraint setActive:](v3->_minTitleWidthConstraint, "setActive:", 1);
    v39 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView topAnchor](v3->_contentStackView, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell contentView](v3, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v43;
    -[UIStackView leadingAnchor](v3->_contentStackView, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell contentView](v3, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v38;
    -[UIStackView bottomAnchor](v3->_contentStackView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell contentView](v3, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v27;
    -[UIStackView trailingAnchor](v3->_contentStackView, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell contentView](v3, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v32);

    -[HKDisplayTypeContextVerticalCollectionViewCell contentView](v3, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCornerRadius:", 10.0);

    -[HKDisplayTypeContextVerticalCollectionViewCell contentView](v3, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMasksToBounds:", 1);

  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HKDisplayTypeContextVerticalCollectionViewCell;
  -[HKDisplayTypeContextVerticalCollectionViewCell setSelected:](&v5, sel_setSelected_);
  -[HKDisplayTypeContextVerticalCollectionViewCell _updateUI:](self, "_updateUI:", v3);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKDisplayTypeContextVerticalCollectionViewCell;
  -[HKDisplayTypeContextVerticalCollectionViewCell prepareForReuse](&v6, sel_prepareForReuse);
  -[HKDisplayTypeContextVerticalCollectionViewCell setSelected:](self, "setSelected:", 0);
  -[HKDisplayTypeContextVerticalCollectionViewCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[HKDisplayTypeContextVerticalCollectionViewCell valueAndUnitLabel](self, "valueAndUnitLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[HKDisplayTypeContextVerticalCollectionViewCell valueAndUnitLabel](self, "valueAndUnitLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", 0);

  -[HKDisplayTypeContextVerticalCollectionViewCell configureForTraitCollection](self, "configureForTraitCollection");
}

- (void)updateWithContextItem:(id)a3 mode:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[HKDisplayTypeContextVerticalCollectionViewCell setContextItem:](self, "setContextItem:", v6);
  -[HKDisplayTypeContextVerticalCollectionViewCell setMode:](self, "setMode:", a4);
  -[HKDisplayTypeContextVerticalCollectionViewCell _configureForContextItem:](self, "_configureForContextItem:", v6);

}

+ (id)reuseIdentifier
{
  return CFSTR("HKDisplayTypeContextVerticalCollectionViewCell");
}

- (int64_t)_widthDesignationFromTraitCollection:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "valueForNSIntegerTrait:", objc_opt_class());

  return v4;
}

- (void)configureForTraitCollection
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;

  -[HKDisplayTypeContextVerticalCollectionViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory)
  {
    -[HKDisplayTypeContextVerticalCollectionViewCell contentStackView](self, "contentStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    goto LABEL_6;
  }
  -[HKDisplayTypeContextVerticalCollectionViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKDisplayTypeContextVerticalCollectionViewCell _widthDesignationFromTraitCollection:](self, "_widthDesignationFromTraitCollection:", v6);

  if ((unint64_t)(v7 - 1) < 4)
  {
    -[HKDisplayTypeContextVerticalCollectionViewCell contentStackView](self, "contentStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
LABEL_4:
    objc_msgSend(v8, "setAxis:", 1);

    -[HKDisplayTypeContextVerticalCollectionViewCell contentStackView](self, "contentStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    v11 = 1;
LABEL_7:
    objc_msgSend(v10, "setAlignment:", v11);

    return;
  }
  if ((unint64_t)(v7 - 5) < 2)
  {
    -[HKDisplayTypeContextVerticalCollectionViewCell traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSizeCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0DC48C0];

    -[HKDisplayTypeContextVerticalCollectionViewCell contentStackView](self, "contentStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((unint64_t)v13 >= v14)
      goto LABEL_4;
LABEL_6:
    objc_msgSend(v8, "setAxis:", 0);

    -[HKDisplayTypeContextVerticalCollectionViewCell contentStackView](self, "contentStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    v11 = 3;
    goto LABEL_7;
  }
}

- (void)_configureForContextItem:(id)a3
{
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
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  if (objc_msgSend(v22, "hasTitleAccessory"))
  {
    -[HKDisplayTypeContextVerticalCollectionViewCell _attributedTitleWithAccessoryForContextItem:selected:](self, "_attributedTitleWithAccessoryForContextItem:selected:", v22, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedText:", v4);
  }
  else
  {
    objc_msgSend(v22, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v4);
  }

  -[HKDisplayTypeContextVerticalCollectionViewCell _attributedValueAndUnitForContextItem:selected:](self, "_attributedValueAndUnitForContextItem:selected:", v22, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextVerticalCollectionViewCell valueAndUnitLabel](self, "valueAndUnitLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedText:", v6);

  -[HKDisplayTypeContextVerticalCollectionViewCell contentStackView](self, "contentStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextVerticalCollectionViewCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCustomSpacing:afterView:", v9, 14.0);

  -[HKDisplayTypeContextVerticalCollectionViewCell contentStackView](self, "contentStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextVerticalCollectionViewCell valueAndUnitLabel](self, "valueAndUnitLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomSpacing:afterView:", v11, 5.0);

  objc_msgSend(v22, "accessibilityIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v22, "accessibilityIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v13);

  }
  else
  {
    -[HKDisplayTypeContextVerticalCollectionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("UnknownOverlayContext"));
  }

  objc_msgSend(v22, "metricColors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keyColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextVerticalCollectionViewCell _backgroundViewWithColor:userInteractive:](self, "_backgroundViewWithColor:userInteractive:", v15, objc_msgSend(v22, "userInteractive"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextVerticalCollectionViewCell setBackgroundView:](self, "setBackgroundView:", v16);

  objc_msgSend(v22, "selectedMetricColors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "keyColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextVerticalCollectionViewCell _backgroundViewWithColor:userInteractive:](self, "_backgroundViewWithColor:userInteractive:", v18, objc_msgSend(v22, "userInteractive"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextVerticalCollectionViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v19);

  v20 = objc_msgSend(v22, "infoHidden");
  -[HKDisplayTypeContextVerticalCollectionViewCell infoButton](self, "infoButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", v20);

  -[HKDisplayTypeContextVerticalCollectionViewCell _updateUI:](self, "_updateUI:", -[HKDisplayTypeContextVerticalCollectionViewCell isSelected](self, "isSelected"));
  -[HKDisplayTypeContextVerticalCollectionViewCell _updateLabelsMultilineAndAlignmentForContentSizeCategoryAndUIDirection](self, "_updateLabelsMultilineAndAlignmentForContentSizeCategoryAndUIDirection");

}

- (void)_updateLabelsMultilineAndAlignmentForContentSizeCategoryAndUIDirection
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  double v7;
  uint64_t v8;
  double v9;
  id v10;

  -[HKDisplayTypeContextVerticalCollectionViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[HKDisplayTypeContextVerticalCollectionViewCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1132068864;
  -[HKDisplayTypeContextVerticalCollectionViewCell _setLabel:allowsMultiline:textAlignment:layoutPriority:](self, "_setLabel:allowsMultiline:textAlignment:layoutPriority:", v6, 1, 4, v7);

  if (-[UIView hk_isLeftToRight](self, "hk_isLeftToRight") && !IsAccessibilityCategory)
    v8 = 2;
  else
    v8 = 0;
  -[HKDisplayTypeContextVerticalCollectionViewCell valueAndUnitLabel](self, "valueAndUnitLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1148813312;
  -[HKDisplayTypeContextVerticalCollectionViewCell _setLabel:allowsMultiline:textAlignment:layoutPriority:](self, "_setLabel:allowsMultiline:textAlignment:layoutPriority:", v10, 1, v8, v9);

}

- (id)_attributedTitleWithAccessoryForContextItem:(id)a3 selected:(BOOL)a4
{
  id v6;
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
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(v6, "selectedTitleAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemImageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "selectedTitleAccessory");
  }
  else
  {
    objc_msgSend(v6, "titleAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "systemImageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "titleAccessory");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionItemTitleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationWithFont:scale:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v16, "imageWithRenderingMode:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:", v18);

  v19 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendAttributedString:", v20);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v19, "appendAttributedString:", v21);

  objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v12, 0, objc_msgSend(v19, "length"));
  v22 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v7, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextVerticalCollectionViewCell _titleAttributes](self, "_titleAttributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v22, "initWithString:attributes:", v23, v24);
  objc_msgSend(v19, "appendAttributedString:", v25);

  v26 = (void *)objc_msgSend(v19, "copy");
  return v26;
}

- (id)_attributedValueAndUnitForContextItem:(id)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  uint64_t v40;
  _QWORD v41[2];

  v4 = a4;
  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "attributedLabelTextOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "attributedLabelTextOverride");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedLabelTextWithSelectionState:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKDisplayTypeContextVerticalCollectionViewCell traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell _updateAttributedString:withTraitCollection:](self, "_updateAttributedString:withTraitCollection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_25;
  }
  objc_msgSend(v6, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unit");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = objc_msgSend(v6, "isUnitIncludedInValue");

  }
  else
  {
    v15 = 0;
  }
  -[HKDisplayTypeContextVerticalCollectionViewCell _unitStringForContextItem:isUnitStringIncludedInValueString:](self, "_unitStringForContextItem:isUnitStringIncludedInValueString:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v15;
  if (v16)
  {
    v17 = objc_msgSend(v6, "useTightSpacingBetweenValueAndUnit");
    v18 = CFSTR(" ");
    if (v17)
      v18 = CFSTR(" ");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v12, v18, v16);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v12;
  }
  v20 = v19;
  v40 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionItemValueAndUnitFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v20, v22);
  -[HKDisplayTypeContextVerticalCollectionViewCell currentMetricColors](self, "currentMetricColors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contextViewPrimaryTextColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HKDisplayTypeContextVerticalCollectionViewCell currentMetricColors](self, "currentMetricColors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contextViewSecondaryTextColor");
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_17;
LABEL_15:
    if (v24)
    {
      v27 = *MEMORY[0x1E0DC1140];
      v28 = objc_msgSend(v20, "rangeOfString:", v12);
      objc_msgSend(v11, "addAttribute:value:range:", v27, v24, v28, v29);
    }
    goto LABEL_17;
  }
  v25 = v24;
  if (v12)
    goto LABEL_15;
LABEL_17:
  if (v16 && v25)
  {
    v30 = *MEMORY[0x1E0DC1140];
    v31 = objc_msgSend(v20, "rangeOfString:", v16);
    objc_msgSend(v11, "addAttribute:value:range:", v30, v25, v31, v32);
  }
  v33 = v39;
  if (!v25)
    v33 = 0;
  if (v33 == 1)
  {
    v34 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v6, "unit");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v20, "rangeOfString:", v35);
    objc_msgSend(v11, "addAttribute:value:range:", v34, v25, v36, v37);

  }
LABEL_25:

  return v11;
}

- (id)_updateAttributedString:(id)a3 withTraitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    v8 = objc_msgSend(v7, "length");
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __94__HKDisplayTypeContextVerticalCollectionViewCell__updateAttributedString_withTraitCollection___block_invoke;
    v15 = &unk_1E9C41EF8;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, &v12);
    v10 = (id)objc_msgSend(v9, "copy", v12, v13, v14, v15);

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

void __94__HKDisplayTypeContextVerticalCollectionViewCell__updateAttributedString_withTraitCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v7 = *MEMORY[0x1E0DC1138];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v7, a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v7, v9, a3, a4);

    v8 = v10;
  }

}

- (id)_unitStringForContextItem:(id)a3 isUnitStringIncludedInValueString:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "unit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "valueContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "valueContext");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v7)
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (%@)"), v7, v10);
    else
      objc_msgSend(v9, "stringWithFormat:", CFSTR("(%@)"), v10, v14);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }

  return v7;
}

- (id)_titleAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionItemTitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E0DC1140];
  -[HKDisplayTypeContextVerticalCollectionViewCell currentMetricColors](self, "currentMetricColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextViewPrimaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  return v7;
}

- (void)_updateUI:(BOOL)a3
{
  _BOOL8 v3;
  HKDisplayTypeContextItem *contextItem;
  void *v6;
  void *v7;
  void *v8;
  HKDisplayTypeContextItem *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = a3;
  contextItem = self->_contextItem;
  if (a3)
    -[HKDisplayTypeContextItem selectedMetricColors](contextItem, "selectedMetricColors");
  else
    -[HKDisplayTypeContextItem metricColors](contextItem, "metricColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextVerticalCollectionViewCell setCurrentMetricColors:](self, "setCurrentMetricColors:", v6);

  if (-[HKDisplayTypeContextItem hasTitleAccessory](self->_contextItem, "hasTitleAccessory"))
  {
    -[HKDisplayTypeContextVerticalCollectionViewCell _attributedTitleWithAccessoryForContextItem:selected:](self, "_attributedTitleWithAccessoryForContextItem:selected:", self->_contextItem, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v7);
  }
  else
  {
    -[HKDisplayTypeContextVerticalCollectionViewCell currentMetricColors](self, "currentMetricColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextViewPrimaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v8);

  }
  v9 = self->_contextItem;
  if (!v9)
  {
    -[UILabel setAttributedText:](self->_valueAndUnitLabel, "setAttributedText:");
    if (v3)
      goto LABEL_9;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[HKDisplayTypeContextVerticalCollectionViewCell _attributedValueAndUnitForContextItem:selected:](self, "_attributedValueAndUnitForContextItem:selected:", v9, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_valueAndUnitLabel, "setAttributedText:", v10);

  if (!v3)
    goto LABEL_11;
LABEL_9:
  -[UILabel textColor](self->_valueAndUnitLabel, "textColor");
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v12 = (id)v11;
  -[UIButton setTintColor:](self->_infoButton, "setTintColor:", v11);

}

- (id)_backgroundViewWithColor:(id)a3 userInteractive:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  BOOL v22;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1E0DC3658];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __91__HKDisplayTypeContextVerticalCollectionViewCell__backgroundViewWithColor_userInteractive___block_invoke;
    v20 = &unk_1E9C41F20;
    v22 = a4;
    v21 = v5;
    objc_msgSend(v8, "colorWithDynamicProvider:", &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v9, v17, v18, v19, v20);

  }
  else
  {
    objc_msgSend(v6, "setBackgroundColor:", 0);
  }
  objc_msgSend(v7, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 10.0);

  v11 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v7, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerCurve:", v11);

  objc_msgSend(v7, "setClipsToBounds:", 1);
  if (!a4)
  {
    v13 = objc_msgSend(objc_retainAutorelease(v5), "CGColor");
    objc_msgSend(v7, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderColor:", v13);

    objc_msgSend(v7, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBorderWidth:", 1.0);

  }
  return v7;
}

id __91__HKDisplayTypeContextVerticalCollectionViewCell__backgroundViewWithColor_userInteractive___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    return *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_stackViewWithArrangedSubviews:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DC3CA8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArrangedSubviews:", v4);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setSpacing:", 4.0);
  objc_msgSend(v5, "setAlignment:", 1);
  objc_msgSend(v5, "setDistribution:", 0);
  objc_msgSend(v5, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v5, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  return v5;
}

- (id)_generateInfoButton
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_infoButtonTapped_, 64);
  LODWORD(v5) = 1148813312;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148813312;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  return v3;
}

- (void)infoButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[HKDisplayTypeContextVerticalCollectionViewCell delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKDisplayTypeContextVerticalCollectionViewCell delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didTapOnInfoButtonForCollectionViewCell:", self);

  }
}

- (id)_labelWithFont:(id)a3 allowsMultiline:(BOOL)a4 supportsDyanmicType:(BOOL)a5 layoutPriority:(float)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;

  v7 = a5;
  v8 = a4;
  v10 = (objc_class *)MEMORY[0x1E0DC3990];
  v11 = a3;
  v12 = [v10 alloc];
  v13 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "setFont:", v11);

  objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v15);

  objc_msgSend(v13, "setClipsToBounds:", 0);
  *(float *)&v16 = a6;
  -[HKDisplayTypeContextVerticalCollectionViewCell _setLabel:allowsMultiline:textAlignment:layoutPriority:](self, "_setLabel:allowsMultiline:textAlignment:layoutPriority:", v13, v8, 4, v16);
  return v13;
}

- (void)_setLabel:(id)a3 allowsMultiline:(BOOL)a4 textAlignment:(int64_t)a5 layoutPriority:(float)a6
{
  _BOOL4 v8;
  _BOOL8 v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v8 = a4;
  v13 = a3;
  v9 = !v8;
  objc_msgSend(v13, "setNumberOfLines:", v9);
  objc_msgSend(v13, "setTextAlignment:", a5);
  LODWORD(v10) = 0;
  if (!v9)
  {
    objc_msgSend(v13, "setLineBreakMode:", 0, v10);
    LODWORD(v10) = 1.0;
  }
  objc_msgSend(v13, "_setHyphenationFactor:", v10);
  *(float *)&v11 = a6;
  objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 0, v11);
  *(float *)&v12 = a6;
  objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 0, v12);

}

- (HKDisplayTypeContextVerticalCollectionViewCellDelegate)delegate
{
  return (HKDisplayTypeContextVerticalCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKDisplayTypeContextItem)contextItem
{
  return self->_contextItem;
}

- (void)setContextItem:(id)a3
{
  objc_storeStrong((id *)&self->_contextItem, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)valueAndUnitLabel
{
  return self->_valueAndUnitLabel;
}

- (void)setValueAndUnitLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueAndUnitLabel, a3);
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (void)setInfoButton:(id)a3
{
  objc_storeStrong((id *)&self->_infoButton, a3);
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (HKUIMetricColors)currentMetricColors
{
  return self->_currentMetricColors;
}

- (void)setCurrentMetricColors:(id)a3
{
  objc_storeStrong((id *)&self->_currentMetricColors, a3);
}

- (NSLayoutConstraint)minTitleWidthConstraint
{
  return self->_minTitleWidthConstraint;
}

- (void)setMinTitleWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_minTitleWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minTitleWidthConstraint, 0);
  objc_storeStrong((id *)&self->_currentMetricColors, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_valueAndUnitLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contextItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
