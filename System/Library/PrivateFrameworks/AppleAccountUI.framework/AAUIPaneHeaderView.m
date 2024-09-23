@implementation AAUIPaneHeaderView

- (void)setTitleText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAUIPaneHeaderView;
  -[AAUIPaneHeaderView setTitle:](&v3, sel_setTitle_, a3);
}

- (void)setDetailText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAUIPaneHeaderView;
  -[AAUIPaneHeaderView setDetailText:](&v3, sel_setDetailText_, a3);
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AAUIPaneHeaderView;
  -[AAUIPaneHeaderView layoutSubviews](&v2, sel_layoutSubviews);
}

- (double)innerHeaderMaxY
{
  void *v2;
  double MaxY;
  CGRect v5;

  -[AAUIPaneHeaderView detailLabel](self, "detailLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  MaxY = CGRectGetMaxY(v5);

  return MaxY;
}

@end
