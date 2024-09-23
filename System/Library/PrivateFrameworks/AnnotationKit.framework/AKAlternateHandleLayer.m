@implementation AKAlternateHandleLayer

- (AKAlternateHandleLayer)init
{
  AKAlternateHandleLayer *v2;
  double v3;
  id v4;
  id v5;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)AKAlternateHandleLayer;
  v2 = -[AKAlternateHandleLayer init](&v7, sel_init);
  if (v2)
  {
    v3 = *(double *)&AKPointOfInterestRadius_Handle_Alternate;
    if (!qword_255A270C8)
    {
      v8.origin.x = 0.0;
      v8.origin.y = 0.0;
      *(_QWORD *)&v8.size.width = AKPointOfInterestRadius_Handle_Alternate;
      *(_QWORD *)&v8.size.height = AKPointOfInterestRadius_Handle_Alternate;
      qword_255A270C8 = (uint64_t)CGPathCreateWithEllipseInRect(v8, 0);
    }
    -[AKAlternateHandleLayer setPath:](v2, "setPath:");
    -[AKAlternateHandleLayer setLineWidth:](v2, "setLineWidth:", 1.0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[AKAlternateHandleLayer setStrokeColor:](v2, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

    objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[AKAlternateHandleLayer setFillColor:](v2, "setFillColor:", objc_msgSend(v5, "CGColor"));

    -[AKAlternateHandleLayer setBounds:](v2, "setBounds:", 0.0, 0.0, v3, v3);
    -[AKAlternateHandleLayer setAnchorPoint:](v2, "setAnchorPoint:", 0.5, 0.5);
  }
  return v2;
}

@end
