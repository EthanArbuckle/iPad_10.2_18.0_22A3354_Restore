@implementation CSClippingLine

- (CSClippingLine)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CSClippingLine *v7;
  uint64_t v8;
  UIView *realLine;
  UIView *v10;
  void *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)CSClippingLine;
  v7 = -[CSClippingLine initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", x, y, width, height);
    realLine = v7->_realLine;
    v7->_realLine = (UIView *)v8;

    v10 = v7->_realLine;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorWithAlphaComponent:", 0.25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v12);

    -[UIView setAlpha:](v7->_realLine, "setAlpha:", 0.0);
    -[UIView setAutoresizingMask:](v7->_realLine, "setAutoresizingMask:", 18);
    -[CSClippingLine addSubview:](v7, "addSubview:", v7->_realLine);
  }
  return v7;
}

- (double)lineAlpha
{
  double result;

  -[UIView alpha](self->_realLine, "alpha");
  return result;
}

- (void)setLineAlpha:(double)a3
{
  -[UIView setAlpha:](self->_realLine, "setAlpha:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realLine, 0);
}

@end
