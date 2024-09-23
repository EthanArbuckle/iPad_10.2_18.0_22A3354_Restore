@implementation WDMedicalRecordBrandView

- (WDMedicalRecordBrandView)initWithFrame:(CGRect)a3
{
  WDMedicalRecordBrandView *v3;
  WDMedicalRecordBrandView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDMedicalRecordBrandView;
  v3 = -[WDMedicalRecordBrandView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WDMedicalRecordBrandView _setupSubviews](v3, "_setupSubviews");
    -[WDMedicalRecordBrandView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (double)logoSize
{
  void *v2;
  double v3;
  double v4;

  -[WDMedicalRecordBrandView logoView](self, "logoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;

  return v4;
}

- (void)setLogoSize:(double)a3
{
  id v4;

  -[WDMedicalRecordBrandView logoView](self, "logoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSize:", a3);

}

- (void)setBrandable:(id)a3 dataProvider:(id)a4
{
  HKClinicalBrandable *v6;
  id v7;
  HKClinicalBrandable *brandable;
  HKClinicalBrandable *v9;

  v6 = (HKClinicalBrandable *)a3;
  objc_storeStrong((id *)&self->_dataProvider, a4);
  v7 = a4;
  brandable = self->_brandable;
  self->_brandable = v6;
  v9 = v6;

  -[WDMedicalRecordBrandView _updateContentWithBrandable:dataProvider:](self, "_updateContentWithBrandable:dataProvider:", v9, v7);
  -[WDMedicalRecordBrandView _updateLabelVisibility](self, "_updateLabelVisibility");
}

- (void)_setupSubviews
{
  WDBrandLogoView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  WDBrandLogoView *v8;
  WDBrandLogoView *logoView;
  UIView *v10;
  UIView *logoAlignedContentView;
  UILabel *v12;
  UILabel *brandTitleLabel;
  void *v14;
  UILabel *v15;
  UILabel *brandSubtitleLabel;
  void *v17;
  UILabel *v18;
  UILabel *brandDetailLabel;
  void *v20;
  id v21;
  UILabel *v22;
  void *v23;
  UIStackView *v24;
  UIStackView *verticalSpecContainerView;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  UIView *v30;
  void *v31;
  UIStackView *v32;
  UIStackView *stackView;
  _QWORD v34[2];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v3 = [WDBrandLogoView alloc];
  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v8 = -[WDBrandLogoView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D628], v5, v6, v7);
  logoView = self->_logoView;
  self->_logoView = v8;

  -[WDBrandLogoView setTranslatesAutoresizingMaskIntoConstraints:](self->_logoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
  logoAlignedContentView = self->_logoAlignedContentView;
  self->_logoAlignedContentView = v10;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_logoAlignedContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  brandTitleLabel = self->_brandTitleLabel;
  self->_brandTitleLabel = v12;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_brandTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_brandTitleLabel, "setAdjustsFontForContentSizeCategory:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_brandTitleLabel, "setTextColor:", v14);

  v15 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  brandSubtitleLabel = self->_brandSubtitleLabel;
  self->_brandSubtitleLabel = v15;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_brandSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_brandSubtitleLabel, "setAdjustsFontForContentSizeCategory:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_brandSubtitleLabel, "setTextColor:", v17);

  v18 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  brandDetailLabel = self->_brandDetailLabel;
  self->_brandDetailLabel = v18;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_brandDetailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_brandDetailLabel, "setAdjustsFontForContentSizeCategory:", 0);
  -[UILabel setNumberOfLines:](self->_brandDetailLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_brandDetailLabel, "setTextColor:", v20);

  v21 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v22 = self->_brandSubtitleLabel;
  v35[0] = self->_brandTitleLabel;
  v35[1] = v22;
  v35[2] = self->_brandDetailLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (UIStackView *)objc_msgSend(v21, "initWithArrangedSubviews:", v23);
  verticalSpecContainerView = self->_verticalSpecContainerView;
  self->_verticalSpecContainerView = v24;

  -[UIStackView setAxis:](self->_verticalSpecContainerView, "setAxis:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_verticalSpecContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WDMedicalRecordBrandView verticalSpecContainerView](self, "verticalSpecContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBaselineRelativeArrangement:", 1);

  -[WDMedicalRecordBrandView logoAlignedContentView](self, "logoAlignedContentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandView verticalSpecContainerView](self, "verticalSpecContainerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v28);

  v29 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v30 = self->_logoAlignedContentView;
  v34[0] = self->_logoView;
  v34[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (UIStackView *)objc_msgSend(v29, "initWithArrangedSubviews:", v31);
  stackView = self->_stackView;
  self->_stackView = v32;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WDMedicalRecordBrandView addSubview:](self, "addSubview:", self->_stackView);
}

- (void)_setupConstraints
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
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[WDMedicalRecordBrandView topAnchor](self, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandView stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[WDMedicalRecordBrandView leadingAnchor](self, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandView stackView](self, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[WDMedicalRecordBrandView bottomAnchor](self, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandView stackView](self, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[WDMedicalRecordBrandView trailingAnchor](self, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandView stackView](self, "stackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[WDMedicalRecordBrandView logoAlignedContentView](self, "logoAlignedContentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandView verticalSpecContainerView](self, "verticalSpecContainerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hk_alignConstraintsWithView:", v20);

  v23[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)-[WDMedicalRecordBrandView registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v21, self, sel__updateForCurrentSizeCategory);

}

- (void)_updateBasedOnAccessibilityCategory:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[WDMedicalRecordBrandView stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = 1;
  else
    v7 = 3;
  if (v3)
    v8 = 12.0;
  else
    v8 = 16.0;
  if (v3)
    v9 = 4;
  else
    v9 = 2;
  if (v3)
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(v5, "setAlignment:", v7);

  -[WDMedicalRecordBrandView stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAxis:", v3);

  -[WDMedicalRecordBrandView stackView](self, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCustomSpacing:afterView:", self->_logoView, v8);

  -[WDMedicalRecordBrandView brandTitleLabel](self, "brandTitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", v9);

  -[WDMedicalRecordBrandView brandSubtitleLabel](self, "brandSubtitleLabel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", v10);

}

- (void)_updateContentWithBrandable:(id)a3 dataProvider:(id)a4
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
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  if (v20 && v6)
  {
    -[WDMedicalRecordBrandView brandTitleLabel](self, "brandTitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v20, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDMedicalRecordBrandView brandTitleLabel](self, "brandTitleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v9);

    }
    -[WDMedicalRecordBrandView brandSubtitleLabel](self, "brandSubtitleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v20, "subtitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDMedicalRecordBrandView brandSubtitleLabel](self, "brandSubtitleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v13);

    }
    -[WDMedicalRecordBrandView logoView](self, "logoView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchBrandable:dataProvider:", v20, v6);

    -[WDMedicalRecordBrandView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }
  else
  {
    -[WDMedicalRecordBrandView logoView](self, "logoView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "prepareForReuse");

    -[WDMedicalRecordBrandView brandTitleLabel](self, "brandTitleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", 0);

    -[WDMedicalRecordBrandView brandSubtitleLabel](self, "brandSubtitleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", 0);

    -[WDMedicalRecordBrandView brandDetailLabel](self, "brandDetailLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", 0);

  }
}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;
  NSString *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDMedicalRecordBrandView;
  -[WDMedicalRecordBrandView _updateForCurrentSizeCategory](&v6, sel__updateForCurrentSizeCategory);
  -[WDMedicalRecordBrandView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIContentSizeCategoryMin();
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  -[WDMedicalRecordBrandView _updateForContentSizeCategory:](self, "_updateForContentSizeCategory:", v5);
  -[WDMedicalRecordBrandView _updateBasedOnAccessibilityCategory:](self, "_updateBasedOnAccessibilityCategory:", UIContentSizeCategoryIsAccessibilityCategory(v5));

}

- (void)_updateLabelVisibility
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  id v14;

  -[WDMedicalRecordBrandView brandTitleLabel](self, "brandTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") == 0;
  -[WDMedicalRecordBrandView brandTitleLabel](self, "brandTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  -[WDMedicalRecordBrandView brandSubtitleLabel](self, "brandSubtitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") == 0;
  -[WDMedicalRecordBrandView brandSubtitleLabel](self, "brandSubtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  -[WDMedicalRecordBrandView brandDetailLabel](self, "brandDetailLabel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length") == 0;
  -[WDMedicalRecordBrandView brandDetailLabel](self, "brandDetailLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v12);

}

- (void)_updateForContentSizeCategory:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  double v20;
  double v21;
  void *v22;
  id v23;

  v4 = (void *)MEMORY[0x1E0DC1350];
  v5 = *MEMORY[0x1E0DC4A88];
  v6 = a3;
  objc_msgSend(v4, "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", v5, 1280, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandView brandTitleLabel](self, "brandTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  v9 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AB8], 256, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandView brandSubtitleLabel](self, "brandSubtitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", v9, 256, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandView brandDetailLabel](self, "brandDetailLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37F8]), "initForTextStyle:", v9);
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDMedicalRecordBrandView verticalSpecContainerView](self, "verticalSpecContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scaledValueForValue:compatibleWithTraitCollection:", v14, 20.0);
  v17 = v16;
  -[WDMedicalRecordBrandView brandTitleLabel](self, "brandTitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCustomSpacing:afterView:", v18, v17);

  -[WDMedicalRecordBrandView verticalSpecContainerView](self, "verticalSpecContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scaledValueForValue:compatibleWithTraitCollection:", v14, 20.0);
  v21 = v20;
  -[WDMedicalRecordBrandView brandSubtitleLabel](self, "brandSubtitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCustomSpacing:afterView:", v22, v21);

}

- (UILabel)brandTitleLabel
{
  return self->_brandTitleLabel;
}

- (UILabel)brandSubtitleLabel
{
  return self->_brandSubtitleLabel;
}

- (UILabel)brandDetailLabel
{
  return self->_brandDetailLabel;
}

- (HKClinicalBrandable)brandable
{
  return self->_brandable;
}

- (WDClinicalSourcesDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (WDBrandLogoView)logoView
{
  return self->_logoView;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UIView)logoAlignedContentView
{
  return self->_logoAlignedContentView;
}

- (UIStackView)verticalSpecContainerView
{
  return self->_verticalSpecContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalSpecContainerView, 0);
  objc_storeStrong((id *)&self->_logoAlignedContentView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_brandable, 0);
  objc_storeStrong((id *)&self->_brandDetailLabel, 0);
  objc_storeStrong((id *)&self->_brandSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_brandTitleLabel, 0);
}

@end
