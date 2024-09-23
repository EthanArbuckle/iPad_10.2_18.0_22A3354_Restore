@implementation CoreColor

+ (id)colorWithSystem:(unsigned __int8)a3 cgColor:(CGColor *)a4
{
  void *v6;

  v6 = (void *)CoreColorClass(a3);
  if (v6)
    return (id)objc_msgSend(v6, "colorWithCGColor:", a4);
  else
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCGColor:", a4);
}

+ (id)blackColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "blackColor");
}

+ (id)systemRedColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemRedColor");
}

+ (id)systemOrangeColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemOrangeColor");
}

+ (id)systemYellowColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemYellowColor");
}

+ (id)systemGreenColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemGreenColor");
}

+ (id)systemTealColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemTealColor");
}

+ (id)systemMintColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemMintColor");
}

+ (id)systemCyanColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemCyanColor");
}

+ (id)systemBlueColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemBlueColor");
}

+ (id)systemIndigoColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemIndigoColor");
}

+ (id)systemPurpleColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemPurpleColor");
}

+ (id)systemPinkColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemPinkColor");
}

+ (id)systemBrownColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemBrownColor");
}

+ (id)systemGrayColorWithSystem:(unsigned __int8)a3
{
  return (id)objc_msgSend((id)CoreColorClass(a3), "systemGrayColor");
}

- (CoreColor)initWithCGColor:(CGColor *)a3
{
  CoreColor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CoreColor;
  v4 = -[CoreColor init](&v6, sel_init);
  if (v4)
    v4->_color = CGColorRetain(a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)CoreColor;
  -[CoreColor dealloc](&v3, sel_dealloc);
}

- (void)set
{
  CGContext *v3;
  CGContext *v4;

  v3 = -[CoreGraphicsContext CGContext](+[CoreGraphicsContext current](CoreGraphicsContext, "current"), "CGContext");
  if (v3)
  {
    v4 = v3;
    CGContextSetFillColorWithColor(v3, -[CoreColor CGColor](self, "CGColor"));
    CGContextSetStrokeColorWithColor(v4, -[CoreColor CGColor](self, "CGColor"));
  }
}

- (void)setFill
{
  CGContext *v3;

  v3 = -[CoreGraphicsContext CGContext](+[CoreGraphicsContext current](CoreGraphicsContext, "current"), "CGContext");
  if (v3)
    CGContextSetFillColorWithColor(v3, -[CoreColor CGColor](self, "CGColor"));
}

- (void)setStroke
{
  CGContext *v3;

  v3 = -[CoreGraphicsContext CGContext](+[CoreGraphicsContext current](CoreGraphicsContext, "current"), "CGContext");
  if (v3)
    CGContextSetStrokeColorWithColor(v3, -[CoreColor CGColor](self, "CGColor"));
}

- (CGColor)CGColor
{
  return self->_color;
}

- (CoreColor)colorWithAlphaComponent:(double)a3
{
  CGColor *CopyWithAlpha;
  CoreColor *v4;

  CopyWithAlpha = CGColorCreateCopyWithAlpha(self->_color, a3);
  v4 = +[CoreColor colorWithCGColor:](CoreColor, "colorWithCGColor:", CopyWithAlpha);
  CGColorRelease(CopyWithAlpha);
  return v4;
}

@end
