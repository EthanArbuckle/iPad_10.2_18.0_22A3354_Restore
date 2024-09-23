@implementation WDMedicalRecordConnectedBrandCell

- (WDMedicalRecordConnectedBrandCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDMedicalRecordConnectedBrandCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDMedicalRecordConnectedBrandCell;
  v4 = -[WDMedicalRecordBrandLogoCell initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3890], "smallLogoViewDimension");
    -[WDMedicalRecordBrandLogoCell setLogoSize:](v4, "setLogoSize:");
  }
  return v4;
}

- (void)setupSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDMedicalRecordConnectedBrandCell;
  -[WDMedicalRecordBrandLogoCell setupSubviews](&v4, sel_setupSubviews);
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 16.0, 16.0, 16.0, 16.0);

}

@end
