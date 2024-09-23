@implementation PKRoundedCollectionViewCell

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKRoundedCollectionViewCell;
  -[PKRoundedCollectionViewCell layoutSubviews](&v9, sel_layoutSubviews);
  -[PKRoundedCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  -[PKRoundedCollectionViewCell bounds](self, "bounds");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6 * 0.5;
  -[PKRoundedCollectionViewCell layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

}

@end
