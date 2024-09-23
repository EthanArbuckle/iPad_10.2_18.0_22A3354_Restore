@implementation CPSCircularBackgroundView

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)CPSCircularBackgroundView;
  -[CPSCircularBackgroundView layoutSubviews](&v8, sel_layoutSubviews);
  -[CPSCircularBackgroundView bounds](self, "bounds");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  v7 = CGRectGetWidth(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  -[CPSCircularBackgroundView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", fmin(v7, CGRectGetHeight(v10)) * 0.5);
}

@end
