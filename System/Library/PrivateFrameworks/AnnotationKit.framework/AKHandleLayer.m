@implementation AKHandleLayer

- (AKHandleLayer)init
{
  AKHandleLayer *v2;
  double v3;
  id v4;
  id v5;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)AKHandleLayer;
  v2 = -[AKHandleLayer init](&v7, sel_init);
  if (v2)
  {
    v3 = *(double *)&AKPointOfInterestSize_Handle;
    if (!qword_255A27090)
    {
      v8.origin.x = 0.0;
      v8.origin.y = 0.0;
      *(_QWORD *)&v8.size.width = AKPointOfInterestSize_Handle;
      *(_QWORD *)&v8.size.height = AKPointOfInterestSize_Handle;
      qword_255A27090 = (uint64_t)CGPathCreateWithEllipseInRect(v8, 0);
    }
    -[AKHandleLayer setPath:](v2, "setPath:");
    -[AKHandleLayer setLineWidth:](v2, "setLineWidth:", 1.0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[AKHandleLayer setStrokeColor:](v2, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

    objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 0.105882353, 0.454901961, 0.796078431, 1.0);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[AKHandleLayer setFillColor:](v2, "setFillColor:", objc_msgSend(v5, "CGColor"));

    -[AKHandleLayer setBounds:](v2, "setBounds:", 0.0, 0.0, v3, v3);
    -[AKHandleLayer setAnchorPoint:](v2, "setAnchorPoint:", 0.5, 0.5);
  }
  return v2;
}

@end
