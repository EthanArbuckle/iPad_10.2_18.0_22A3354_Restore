@implementation WDMedicalRecordCategorySectionHeaderCell

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WDMedicalRecordCategorySectionHeaderCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v13, sel_setupSubviews);
  v3 = objc_alloc(MEMORY[0x1E0D2F830]);
  objc_msgSend(MEMORY[0x1E0D2F720], "defaultGradient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGradient:", v4);
  -[WDMedicalRecordCategorySectionHeaderCell setHeaderView:](self, "setHeaderView:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordCategorySectionHeaderCell headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[WDMedicalRecordCategorySectionHeaderCell headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordCategorySectionHeaderCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordCategorySectionHeaderCell headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[WDMedicalRecordCategorySectionHeaderCell headerView](self, "headerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_alignConstraintsWithView:", v12);

}

- (void)setGradient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordCategorySectionHeaderCell headerView](self, "headerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGradient:", v4);

}

- (HKGradient)gradient
{
  void *v2;
  void *v3;

  -[WDMedicalRecordCategorySectionHeaderCell headerView](self, "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKGradient *)v3;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[WDMedicalRecordCategorySectionHeaderCell headerView](self, "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordCategorySectionHeaderCell headerView](self, "headerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[WDMedicalRecordCategorySectionHeaderCell headerView](self, "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordCategorySectionHeaderCell headerView](self, "headerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (HKRoundedHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
