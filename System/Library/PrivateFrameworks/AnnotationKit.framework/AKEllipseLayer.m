@implementation AKEllipseLayer

- (AKEllipseLayer)init
{
  AKEllipseLayer *v2;
  AKEllipseLayer *v3;
  const CGPath *v4;
  id v5;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)AKEllipseLayer;
  v2 = -[AKEllipseLayer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AKEllipseLayer bounds](v2, "bounds");
    v4 = CGPathCreateWithEllipseInRect(v8, 0);
    -[AKEllipseLayer setPath:](v3, "setPath:", v4);
    -[AKEllipseLayer setAnchorPoint:](v3, "setAnchorPoint:", 0.5, 0.5);
    -[AKEllipseLayer setFillColor:](v3, "setFillColor:", 0);
    -[AKEllipseLayer setLineWidth:](v3, "setLineWidth:", *(double *)&qword_255A24AB8);
    objc_msgSend(MEMORY[0x24BDF6950], "akColorWithWhite:alpha:", 0.6, 0.8);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[AKEllipseLayer setStrokeColor:](v3, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

    CGPathRelease(v4);
  }
  return v3;
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  const CGPath *v8;
  objc_super v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)AKEllipseLayer;
  -[AKEllipseLayer setBounds:](&v9, sel_setBounds_);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v8 = CGPathCreateWithEllipseInRect(v10, 0);
  -[AKEllipseLayer setPath:](self, "setPath:", v8);
  CGPathRelease(v8);
}

@end
