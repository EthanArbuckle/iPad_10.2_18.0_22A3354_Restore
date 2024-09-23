@implementation RoundedBorderView

- (RoundedBorderView)initWithFrame:(CGRect)a3 color:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  RoundedBorderView *v11;
  RoundedBorderView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RoundedBorderView;
  v11 = -[RoundedBorderView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[RoundedBorderView setOpaque:](v11, "setOpaque:", 0);
    objc_storeStrong((id *)&v12->_color, a4);
  }

  return v12;
}

- (void)drawRect:(CGRect)a3
{
  UIColor *color;
  id v5;

  color = self->_color;
  if (color)
  {
    -[UIColor set](color, "set", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[RoundedBorderView bounds](self, "bounds");
    v5 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1));
    objc_msgSend(v5, "fill");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
