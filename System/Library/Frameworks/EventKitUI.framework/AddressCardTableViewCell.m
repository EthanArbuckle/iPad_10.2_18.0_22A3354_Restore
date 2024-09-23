@implementation AddressCardTableViewCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AddressCardTableViewCell;
  -[AddressCardTableViewCell layoutSubviews](&v7, sel_layoutSubviews);
  -[AddressCardTableViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[AddressCardTableViewCell imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v5, 1.0, 61.0, 61.0);

}

@end
