@implementation SUUIGiftDashView

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize *p_dashSize;
  double height;
  float v10;
  double v11;
  double v12;
  CGFloat v13;
  double width;
  double v15;
  double v16;

  -[SUUIGiftDashView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  p_dashSize = &self->_dashSize;
  height = self->_dashSize.height;
  -[UIColor set](self->_dashColor, "set");
  if (v5 > 0.0)
  {
    v10 = (v7 - height) * 0.5;
    v11 = floorf(v10);
    v12 = 0.0;
    do
    {
      if (p_dashSize->width >= v5 - v12)
        width = v5 - v12;
      else
        width = p_dashSize->width;
      v15 = v12;
      v16 = v11;
      v13 = self->_dashSize.height;
      UIRectFill(*(CGRect *)(&width - 2));
      v12 = v12 + self->_dashSpacing;
    }
    while (v12 < v5);
  }
}

- (UIColor)dashColor
{
  return self->_dashColor;
}

- (void)setDashColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (CGSize)dashSize
{
  double width;
  double height;
  CGSize result;

  width = self->_dashSize.width;
  height = self->_dashSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDashSize:(CGSize)a3
{
  self->_dashSize = a3;
}

- (double)dashSpacing
{
  return self->_dashSpacing;
}

- (void)setDashSpacing:(double)a3
{
  self->_dashSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashColor, 0);
}

@end
