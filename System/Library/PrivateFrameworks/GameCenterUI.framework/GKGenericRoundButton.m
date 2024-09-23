@implementation GKGenericRoundButton

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((-[GKGenericRoundButton isHighlighted](self, "isHighlighted") & 1) != 0)
    -[GKGenericRoundButton highlightedFillColor](self, "highlightedFillColor");
  else
    -[GKGenericRoundButton fillColor](self, "fillColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (width - height) * 0.5;
    if (width <= height)
      v9 = 0.0;
    v10 = (height - width) * 0.5;
    if (width < height)
    {
      v11 = width;
    }
    else
    {
      v10 = 0.0;
      v11 = height;
    }
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v9, v10, v11, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFill");
    objc_msgSend(v12, "fill");

  }
  v13.receiver = self;
  v13.super_class = (Class)GKGenericRoundButton;
  -[GKGenericRoundButton drawRect:](&v13, sel_drawRect_, x, y, width, height);

}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (UIColor)highlightedFillColor
{
  return self->_highlightedFillColor;
}

- (void)setHighlightedFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedFillColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedFillColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
