@implementation GKDashboardShowMoreTextCell

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 42.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDashboardShowMoreTextCell;
  -[GKRectShadowCell awakeFromNib](&v6, sel_awakeFromNib);
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardShowMoreTextCell label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  self->_label = (UILabel *)a3;
}

@end
