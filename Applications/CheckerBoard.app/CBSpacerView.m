@implementation CBSpacerView

+ (id)spacerViewWithHeight:(double)a3
{
  return -[CBSpacerView initWithHeight:]([CBSpacerView alloc], "initWithHeight:", a3);
}

- (CBSpacerView)initWithHeight:(double)a3
{
  CBSpacerView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBSpacerView;
  result = -[CBSpacerView init](&v5, "init");
  if (result)
    result->_height = a3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[CBSpacerView height](self, "height");
  v3 = v2;
  v4 = 0.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

@end
