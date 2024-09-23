@implementation AKTextOverflowIndicatorLayer

- (AKTextOverflowIndicatorLayer)init
{
  AKTextOverflowIndicatorLayer *v2;
  CGPath *Mutable;
  const CGPath *v4;
  id v5;
  id v6;
  CGAffineTransform v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)AKTextOverflowIndicatorLayer;
  v2 = -[AKTextOverflowIndicatorLayer init](&v9, sel_init);
  if (v2)
  {
    Mutable = (CGPath *)qword_255A26FD8;
    if (!qword_255A26FD8)
    {
      Mutable = CGPathCreateMutable();
      memset(&v8, 0, sizeof(v8));
      CGAffineTransformMakeTranslation(&v8, 0.5, 0.5);
      v10.origin.x = 0.0;
      v10.origin.y = 0.0;
      v10.size.width = 12.0;
      v10.size.height = 12.0;
      v4 = CGPathCreateWithRect(v10, 0);
      CGPathAddPath(Mutable, &v8, v4);
      CGPathRelease(v4);
      CGPathMoveToPoint(Mutable, &v8, 6.0, 1.5);
      CGPathAddLineToPoint(Mutable, &v8, 6.0, 10.5);
      CGPathMoveToPoint(Mutable, &v8, 1.5, 6.0);
      CGPathAddLineToPoint(Mutable, &v8, 10.5, 6.0);
      qword_255A26FD8 = (uint64_t)Mutable;
    }
    -[AKTextOverflowIndicatorLayer setPath:](v2, "setPath:", Mutable);
    -[AKTextOverflowIndicatorLayer setLineWidth:](v2, "setLineWidth:", 1.0);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[AKTextOverflowIndicatorLayer setStrokeColor:](v2, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[AKTextOverflowIndicatorLayer setFillColor:](v2, "setFillColor:", objc_msgSend(v6, "CGColor"));

    -[AKTextOverflowIndicatorLayer setBounds:](v2, "setBounds:", 0.0, 0.0, 12.0, 12.0);
    -[AKTextOverflowIndicatorLayer setAnchorPoint:](v2, "setAnchorPoint:", 0.5, 0.5);
  }
  return v2;
}

@end
