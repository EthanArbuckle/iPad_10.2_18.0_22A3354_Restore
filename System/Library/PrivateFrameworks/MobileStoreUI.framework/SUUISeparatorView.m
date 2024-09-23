@implementation SUUISeparatorView

- (void)setColor1:(id)a3
{
  UIColor *v4;
  UIColor *color1;

  if (self->_color1 != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    color1 = self->_color1;
    self->_color1 = v4;

    -[SUUISeparatorView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setColor2:(id)a3
{
  UIColor *v4;
  UIColor *color2;

  if (self->_color2 != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    color2 = self->_color2;
    self->_color2 = v4;

    -[SUUISeparatorView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    -[SUUISeparatorView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  int64_t separatorStyle;
  float v9;
  double v10;
  double v11;
  float v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[SUUISeparatorView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v4;
  v7 = v5;
  separatorStyle = self->_separatorStyle;
  if (separatorStyle == 1)
  {
    v12 = v4 * 0.5;
    v11 = floorf(v12);
    -[UIColor set](self->_color1, "set");
    v10 = 0.0;
    v14.origin.x = 0.0;
    v14.origin.y = 0.0;
    v14.size.width = v11;
    v14.size.height = v7;
    UIRectFill(v14);
    -[UIColor set](self->_color2, "set");
    v6 = v11;
  }
  else
  {
    if (separatorStyle)
      return;
    v9 = v5 * 0.5;
    v10 = floorf(v9);
    -[UIColor set](self->_color1, "set");
    v11 = 0.0;
    v13.origin.x = 0.0;
    v13.origin.y = 0.0;
    v13.size.width = v6;
    v13.size.height = v10;
    UIRectFill(v13);
    -[UIColor set](self->_color2, "set");
    v7 = v10;
  }
  v15.origin.x = v11;
  v15.origin.y = v10;
  v15.size.width = v6;
  v15.size.height = v7;
  UIRectFill(v15);
}

- (UIColor)color1
{
  return self->_color1;
}

- (UIColor)color2
{
  return self->_color2;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color2, 0);
  objc_storeStrong((id *)&self->_color1, 0);
}

@end
