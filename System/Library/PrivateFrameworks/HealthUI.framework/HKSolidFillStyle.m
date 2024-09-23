@implementation HKSolidFillStyle

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6
{
  id v10;

  CGContextSaveGState(a4);
  CGContextAddPath(a4, a3);
  CGContextSetAlpha(a4, a6);
  CGContextSetBlendMode(a4, kCGBlendModeNormal);
  -[HKSolidFillStyle color](self, "color");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v10, "CGColor"));

  CGContextFillPath(a4);
  CGContextRestoreGState(a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSolidFillStyle;
  v4 = -[HKFillStyle copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 1, self->_color);
  return v4;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
