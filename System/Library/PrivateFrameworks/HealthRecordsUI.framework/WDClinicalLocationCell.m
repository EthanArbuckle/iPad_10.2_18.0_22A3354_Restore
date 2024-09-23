@implementation WDClinicalLocationCell

- (WDClinicalLocationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDClinicalLocationCell *v4;
  WDClinicalLocationCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WDClinicalLocationCell;
  v4 = -[WDClinicalLocationCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WDClinicalLocationCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalLocationCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[WDClinicalLocationCell _setupSubviews](v5, "_setupSubviews");
    -[WDClinicalLocationCell _setUpConstraints](v5, "_setUpConstraints");
  }
  return v5;
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
  UILabel *v10;
  UILabel *titleLabel;
  void *v12;
  UILabel *v13;
  UILabel *subtitleLabel;
  uint64_t v15;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *detailLabel;
  void *v20;
  void *v21;
  id v22;
  UILabel *v23;
  void *v24;
  UIStackView *v25;
  UIStackView *stackView;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = [WDBrandLogoView alloc];
  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v8 = -[WDBrandLogoView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D628], v5, v6, v7);
  logoView = self->_logoView;
  self->_logoView = v8;

  -[WDBrandLogoView setTranslatesAutoresizingMaskIntoConstraints:](self->_logoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v10;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 0);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v12);

  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 0);
  v15 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_scalableFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B10], 0x8000);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v16);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v17);

  v18 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v18;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_detailLabel, "setAdjustsFontForContentSizeCategory:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_scalableFontForTextStyle:symbolicTraits:", v15, 0x8000);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_detailLabel, "setFont:", v20);

  -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_detailLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_detailLabel, "setTextColor:", v21);

  v22 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v23 = self->_titleLabel;
  v28[0] = self->_logoView;
  v28[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (UIStackView *)objc_msgSend(v22, "initWithArrangedSubviews:", v24);
  stackView = self->_stackView;
  self->_stackView = v25;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 1.17549435e-38);
  -[UIStackView setBaselineRelativeArrangement:](self->_stackView, "setBaselineRelativeArrangement:", 1);
  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
  -[UIStackView setPreservesSuperviewLayoutMargins:](self->_stackView, "setPreservesSuperviewLayoutMargins:", 1);
  -[WDClinicalLocationCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", self->_stackView);

  -[WDClinicalLocationCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)_setUpConstraints
{
  UIStackView *stackView;
  void *v4;

  stackView = self->_stackView;
  -[WDClinicalLocationCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView hk_alignConstraintsWithView:](stackView, "hk_alignConstraintsWithView:", v4);

  -[WDClinicalLocationCell _configureDistinctIntrinsicLayoutPrioritiesForLabels](self, "_configureDistinctIntrinsicLayoutPrioritiesForLabels");
}

- (void)_configureDistinctIntrinsicLayoutPrioritiesForLabels
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  -[UIStackView constraintsAffectingLayoutForAxis:](self->_stackView, "constraintsAffectingLayoutForAxis:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = 1132003328;
  objc_msgSend(v4, "setPriority:", v5);
  -[WDClinicalLocationCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalLocationCell subtitleLabel](self, "subtitleLabel", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  -[WDClinicalLocationCell detailLabel](self, "detailLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_0);
}

void __78__WDClinicalLocationCell__configureDistinctIntrinsicLayoutPrioritiesForLabels__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  float v3;
  float v4;
  double v5;
  double v6;
  id v7;

  v3 = (float)a3;
  v4 = (float)a3 + 750.0;
  v7 = a2;
  *(float *)&v5 = v4;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  *(float *)&v6 = v3 + 250.0;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 1, v6);

}

- (void)setBrandable:(id)a3 dataProvider:(id)a4
{
  HKClinicalBrandable *v6;
  WDClinicalSourcesDataProvider *v7;
  HKClinicalBrandable *brandable;
  WDClinicalSourcesDataProvider *dataProvider;
  WDClinicalSourcesDataProvider *v10;
  HKClinicalBrandable *v11;

  v6 = (HKClinicalBrandable *)a3;
  v7 = (WDClinicalSourcesDataProvider *)a4;
  brandable = self->_brandable;
  self->_brandable = v6;
  v11 = v6;

  dataProvider = self->_dataProvider;
  self->_dataProvider = v7;
  v10 = v7;

  -[WDClinicalLocationCell _updateContentWithBrandable:dataProvider:](self, "_updateContentWithBrandable:dataProvider:", v11, v10);
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
  id v13;

  v13 = a3;
  v6 = a4;
  -[WDClinicalLocationCell logoView](self, "logoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v13 && v6)
    objc_msgSend(v7, "fetchBrandable:dataProvider:", v13, v6);
  else
    objc_msgSend(v7, "prepareForReuse");

  objc_msgSend(v13, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalLocationCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v13, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalLocationCell subtitleLabel](self, "subtitleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDClinicalLocationCell;
  -[WDClinicalLocationCell _updateForCurrentSizeCategory](&v6, sel__updateForCurrentSizeCategory);
  -[WDClinicalLocationCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIContentSizeCategoryMin();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDClinicalLocationCell _updateForContentSizeCategory:](self, "_updateForContentSizeCategory:", v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDClinicalLocationCell;
  -[WDClinicalLocationCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDClinicalLocationCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[WDClinicalLocationCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDClinicalLocationCell;
  -[WDClinicalLocationCell prepareForReuse](&v3, sel_prepareForReuse);
  -[WDClinicalLocationCell setBrandable:dataProvider:](self, "setBrandable:dataProvider:", 0, 0);
}

- (void)willDisplay
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

  -[WDClinicalLocationCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") == 0;
  -[WDClinicalLocationCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  -[WDClinicalLocationCell subtitleLabel](self, "subtitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") == 0;
  -[WDClinicalLocationCell subtitleLabel](self, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  -[WDClinicalLocationCell detailLabel](self, "detailLabel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length") == 0;
  -[WDClinicalLocationCell detailLabel](self, "detailLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v12);

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

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_brandable, 0);
}

@end
