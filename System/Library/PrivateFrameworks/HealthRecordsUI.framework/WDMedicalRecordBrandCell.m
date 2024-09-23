@implementation WDMedicalRecordBrandCell

- (UILabel)brandTitleLabel
{
  void *v2;
  void *v3;

  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "brandTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v3;
}

- (UILabel)brandSubtitleLabel
{
  void *v2;
  void *v3;

  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "brandSubtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v3;
}

- (UILabel)brandDetailLabel
{
  void *v2;
  void *v3;

  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "brandDetailLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v3;
}

- (void)_updateForContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDMedicalRecordBrandCell;
  v4 = a3;
  -[WDMedicalRecordGroupableCell _updateForContentSizeCategory:](&v6, sel__updateForContentSizeCategory_, v4);
  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateForContentSizeCategory:", v4);

}

- (void)_updateLabelVisibility
{
  void *v3;

  -[WDMedicalRecordBrandLogoCell brandView](self, "brandView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateLabelVisibility");

  -[WDMedicalRecordBrandCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setBrandable:(id)a3 dataProvider:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDMedicalRecordBrandCell;
  -[WDMedicalRecordBrandLogoCell setBrandable:dataProvider:](&v5, sel_setBrandable_dataProvider_, a3, a4);
  -[WDMedicalRecordBrandCell _updateLabelVisibility](self, "_updateLabelVisibility");
}

@end
