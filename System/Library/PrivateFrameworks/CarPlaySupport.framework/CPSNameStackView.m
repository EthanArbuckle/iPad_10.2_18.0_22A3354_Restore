@implementation CPSNameStackView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  SEL v9;
  CPSNameStackView *v10;
  double v11;
  double v12;
  CGSize result;

  v10 = self;
  v9 = a2;
  v11 = 0.0;
  v12 = 0.0;
  v8.receiver = self;
  v8.super_class = (Class)CPSNameStackView;
  -[CPSNameStackView intrinsicContentSize](&v8, sel_intrinsicContentSize);
  v11 = v2;
  v12 = v3;
  -[CPSNameStackView fittingWidth](v10, "fittingWidth");
  if (v4 > 0.0)
  {
    -[CPSNameStackView fittingWidth](v10, "fittingWidth");
    v11 = v5;
  }
  v6 = v11;
  v7 = v12;
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)fittingWidth
{
  return self->_fittingWidth;
}

- (void)setFittingWidth:(double)a3
{
  self->_fittingWidth = a3;
}

@end
