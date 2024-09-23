@implementation WDMedicalRecordBrandLogoCell

- (WDMedicalRecordBrandLogoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDMedicalRecordBrandLogoCell *v4;
  WDMedicalRecordBrandLogoCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDMedicalRecordBrandLogoCell;
  v4 = -[WDMedicalRecordGroupableCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[WDMedicalRecordBrandLogoCell setShowDisclosureChevron:](v4, "setShowDisclosureChevron:", 0);
  return v5;
}

- (void)setupSubviews
{
  void *v3;
  WDMedicalRecordBrandView *v4;
  WDMedicalRecordBrandView *v5;
  WDMedicalRecordBrandView *brandView;
  void *v7;
  id v8;
  void *v9;
  UIImageView *v10;
  UIImageView *disclosureChevronView;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WDMedicalRecordBrandLogoCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v14, sel_setupSubviews);
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 12.0, 0.0, 12.0, 0.0);

  v4 = [WDMedicalRecordBrandView alloc];
  v5 = -[WDMedicalRecordBrandView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  brandView = self->_brandView;
  self->_brandView = v5;

  -[WDMedicalRecordBrandView setTranslatesAutoresizingMaskIntoConstraints:](self->_brandView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WDMedicalRecordBrandLogoCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_brandView);

  v8 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "hk_disclosureChevronImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (UIImageView *)objc_msgSend(v8, "initWithImage:", v9);
  disclosureChevronView = self->_disclosureChevronView;
  self->_disclosureChevronView = v10;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_disclosureChevronView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v12) = 1148846080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_disclosureChevronView, "setContentHuggingPriority:forAxis:", 0, v12);
  LODWORD(v13) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_disclosureChevronView, "setContentCompressionResistancePriority:forAxis:", 0, v13);
}

- (void)setUpConstraints
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
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)WDMedicalRecordBrandLogoCell;
  -[WDMedicalRecordGroupableCell setUpConstraints](&v21, sel_setUpConstraints);
  -[WDMedicalRecordBrandLogoCell _contentViewMarginsGuide](self, "_contentViewMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(v3, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v3, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v3, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v20) = 1148829696;
  objc_msgSend(v19, "setPriority:", v20);
  objc_msgSend(v19, "setActive:", 1);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDMedicalRecordBrandLogoCell;
  -[WDMedicalRecordGroupableCell prepareForReuse](&v4, sel_prepareForReuse);
  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBrandable:dataProvider:", 0, 0);

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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WDMedicalRecordBrandLogoCell;
  -[WDMedicalRecordBrandLogoCell updateConstraints](&v17, sel_updateConstraints);
  if (-[WDMedicalRecordBrandLogoCell showsDisclosureChevron](self, "showsDisclosureChevron"))
  {
    -[WDMedicalRecordBrandLogoCell disclosureChevronView](self, "disclosureChevronView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, *MEMORY[0x1E0D2F3F0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

    -[WDMedicalRecordBrandLogoCell _contentViewMarginsGuide](self, "_contentViewMarginsGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordBrandLogoCell disclosureChevronView](self, "disclosureChevronView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    objc_msgSend(v8, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordBrandLogoCell disclosureChevronView](self, "disclosureChevronView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

  }
}

- (void)setShowDisclosureChevron:(BOOL)a3
{
  void *v4;

  self->_showDisclosureChevron = a3;
  if (a3)
  {
    -[WDMedicalRecordBrandLogoCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", self->_disclosureChevronView);
  }
  else
  {
    -[WDMedicalRecordBrandLogoCell disclosureChevronView](self, "disclosureChevronView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");
  }

  -[WDMedicalRecordBrandLogoCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (id)_contentViewMarginsGuide
{
  void *v2;
  void *v3;

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateContentWithBrandable:(id)a3 dataProvider:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_updateContentWithBrandable:dataProvider:", v7, v6);

}

- (void)_updateBasedOnAccessibilityCategory:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WDMedicalRecordBrandLogoCell;
  -[WDMedicalRecordGroupableCell _updateBasedOnAccessibilityCategory:](&v6, sel__updateBasedOnAccessibilityCategory_);
  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateBasedOnAccessibilityCategory:", v3);

}

- (void)setBrandable:(id)a3 dataProvider:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBrandable:dataProvider:", v7, v6);

}

- (HKClinicalBrandable)brandable
{
  void *v2;
  void *v3;

  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "brandable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKClinicalBrandable *)v3;
}

- (WDClinicalSourcesDataProvider)dataProvider
{
  void *v2;
  void *v3;

  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WDClinicalSourcesDataProvider *)v3;
}

- (double)logoSize
{
  void *v2;
  double v3;
  double v4;

  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logoSize");
  v4 = v3;

  return v4;
}

- (void)setLogoSize:(double)a3
{
  id v4;

  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLogoSize:", a3);

}

- (BOOL)showsDisclosureChevron
{
  return self->_showDisclosureChevron;
}

- (UIImageView)disclosureChevronView
{
  return self->_disclosureChevronView;
}

- (WDBrandLogoView)logoView
{
  return self->_logoView;
}

- (WDMedicalRecordBrandView)brandView
{
  return self->_brandView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandView, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_disclosureChevronView, 0);
}

@end
