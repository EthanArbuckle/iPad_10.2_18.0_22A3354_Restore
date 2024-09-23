@implementation _Badge

- (_Badge)initWithText:(id)a3
{
  id v4;
  _Badge *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_Badge;
  v5 = -[_Badge initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_Badge setTextColor:](v5, "setTextColor:", v6);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_Badge setFont:](v5, "setFont:", v7);

    -[_Badge setTextAlignment:](v5, "setTextAlignment:", 1);
    -[_Badge setText:](v5, "setText:", v4);
  }

  return v5;
}

- (void)setText:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_Badge;
  -[_Badge setText:](&v10, sel_setText_, a3);
  -[_Badge frame](self, "frame");
  v5 = v4;
  v7 = v6;
  -[_Badge sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[_Badge setFrame:](self, "setFrame:", v5, v7, v8, v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)_Badge;
  -[_Badge sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  -[_Badge text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = 18.0;
  if (v7 >= 2)
  {
    v9 = v5 + 10.0;
    if (v5 + 10.0 < 24.0)
      v9 = 24.0;
    v8 = fmin(v9, 44.0);
  }
  v10 = 18.0;
  result.height = v10;
  result.width = v8;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  void *v9;
  void *v10;
  objc_super v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.231372549, 0.188235294, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "set");

  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, CGRectGetHeight(v12) * 0.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fill");

  CGContextRestoreGState(CurrentContext);
  v11.receiver = self;
  v11.super_class = (Class)_Badge;
  -[_Badge drawTextInRect:](&v11, sel_drawTextInRect_, x + 5.0, y + 0.0, width + -10.0, height);
}

@end
