@implementation FLHiddenImageTableCell

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FLHiddenImageTableCell;
  -[PSTableCell layoutSubviews](&v4, sel_layoutSubviews);
  -[FLHiddenImageTableCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

@end
