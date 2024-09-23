@implementation WDClinicalOnboardingLocationCell

- (WDClinicalOnboardingLocationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDClinicalOnboardingLocationCell *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WDClinicalOnboardingLocationCell;
  v4 = -[WDClinicalLocationCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3890], "providerDetailLogoViewDimension");
    v6 = v5;
    -[WDClinicalLocationCell logoView](v4, "logoView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSize:", v6);

  }
  return v4;
}

- (void)_setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WDClinicalOnboardingLocationCell;
  -[WDClinicalLocationCell _setupSubviews](&v14, sel__setupSubviews);
  -[WDClinicalLocationCell stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalLocationCell subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addArrangedSubview:", v4);

  -[WDClinicalLocationCell stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalLocationCell detailLabel](self, "detailLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addArrangedSubview:", v6);

  v7 = *MEMORY[0x1E0D2F3F0];
  -[WDClinicalLocationCell stackView](self, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 8.0, v7, 4.0, v7);

  -[WDClinicalLocationCell stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBaselineRelativeArrangement:", 0);

  -[WDClinicalLocationCell stackView](self, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreservesSuperviewLayoutMargins:", 0);

  -[WDClinicalLocationCell stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSpacing:", 15.0);

  -[WDClinicalLocationCell stackView](self, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalLocationCell logoView](self, "logoView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCustomSpacing:afterView:", v13, 20.0);

}

- (void)setProvider:(id)a3 dataProvider:(id)a4
{
  id v6;
  id v7;
  HKClinicalProvider *v8;
  HKClinicalProvider *provider;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  v8 = (HKClinicalProvider *)objc_msgSend(v7, "copy");
  provider = self->_provider;
  self->_provider = v8;

  v10.receiver = self;
  v10.super_class = (Class)WDClinicalOnboardingLocationCell;
  -[WDClinicalLocationCell setBrandable:dataProvider:](&v10, sel_setBrandable_dataProvider_, v7, v6);

}

- (void)_updateContentWithBrandable:(id)a3 dataProvider:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDClinicalOnboardingLocationCell;
  -[WDClinicalLocationCell _updateContentWithBrandable:dataProvider:](&v9, sel__updateContentWithBrandable_dataProvider_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[WDClinicalLocationCell detailLabel](self, "detailLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

}

- (void)_updateForContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WDClinicalOnboardingLocationCell;
  v4 = a3;
  -[WDClinicalLocationCell _updateForContentSizeCategory:](&v22, sel__updateForContentSizeCategory_, v4);
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AE8], 1280, v4, v22.receiver, v22.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalLocationCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], 256, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalLocationCell subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], 256, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDClinicalLocationCell detailLabel](self, "detailLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  -[WDClinicalLocationCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_scaledValueForValue:", 20.0);
  v14 = v13;

  -[WDClinicalLocationCell subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_scaledValueForValue:", 15.0);
  v18 = v17;

  -[WDClinicalLocationCell stackView](self, "stackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSpacing:", v18);

  -[WDClinicalLocationCell stackView](self, "stackView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalLocationCell logoView](self, "logoView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCustomSpacing:afterView:", v21, v14);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDClinicalOnboardingLocationCell;
  -[WDClinicalLocationCell prepareForReuse](&v3, sel_prepareForReuse);
  -[WDClinicalOnboardingLocationCell setProvider:dataProvider:](self, "setProvider:dataProvider:", 0, 0);
}

- (HKClinicalProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
