@implementation AAUIButton

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[AAUIButton titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  void *v4;
  objc_super v5;
  CGRect v6;

  -[AAUIButton bounds](self, "bounds");
  Width = CGRectGetWidth(v6);
  -[AAUIButton titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredMaxLayoutWidth:", Width);

  v5.receiver = self;
  v5.super_class = (Class)AAUIButton;
  -[AAUIButton layoutSubviews](&v5, sel_layoutSubviews);
}

@end
