@implementation SUUIBadgeLabel

- (SUUIBadgeLabel)initWithFrame:(CGRect)a3
{
  SUUIBadgeLabel *v3;
  SUUIBadgeLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIBadgeLabel;
  v3 = -[SUUIBadgeLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIBadgeLabel layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 6.0);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 10.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBadgeLabel setFont:](v4, "setFont:", v6);

    -[SUUIBadgeLabel setTextAlignment:](v4, "setTextAlignment:", 1);
    -[SUUIBadgeLabel setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBadgeLabel setBackgroundColor:](v4, "setBackgroundColor:", v7);

    objc_msgSend((id)objc_opt_class(), "defaultTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBadgeLabel setTextColor:](v4, "setTextColor:", v8);

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)SUUIBadgeLabel;
  -[SUUIBadgeLabel sizeThatFits:](&v7, sel_sizeThatFits_, a3.width, a3.height);
  v4 = v3 + 9.0;
  v6 = v5 + 0.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  CGContext *CurrentContext;
  void *v10;
  void *v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUIBadgeLabel superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    -[SUUIBadgeLabel backgroundColor](self, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "set");

    objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 6.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fill");

    CGContextRestoreGState(CurrentContext);
  }
  v12.receiver = self;
  v12.super_class = (Class)SUUIBadgeLabel;
  -[SUUIBadgeLabel drawTextInRect:](&v12, sel_drawTextInRect_, x, y, width, height);
}

+ (id)defaultBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.517647059, 1.0);
}

+ (id)defaultTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
}

@end
