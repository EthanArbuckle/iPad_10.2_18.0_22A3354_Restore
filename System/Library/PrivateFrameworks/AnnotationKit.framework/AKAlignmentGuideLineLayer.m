@implementation AKAlignmentGuideLineLayer

- (AKAlignmentGuideLineLayer)initWithScaleFactor:(double)a3 forVerticalOrientation:(BOOL)a4 withMaxSize:(double)a5
{
  _BOOL4 v6;
  AKAlignmentGuideLineLayer *v8;
  AKAlignmentGuideLineLayer *v9;
  id v10;
  CGPath *Mutable;
  const CGPath *v12;
  double v13;
  CGPath *v14;
  double v15;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AKAlignmentGuideLineLayer;
  v8 = -[AKAlignmentGuideLineLayer init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AKAlignmentGuideLineLayer setAnchorPoint:](v8, "setAnchorPoint:", 0.0, 0.0);
    -[AKAlignmentGuideLineLayer setFrame:](v9, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 0.933333333, 0.792156863, 0.0, 1.0);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[AKAlignmentGuideLineLayer setStrokeColor:](v9, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

    -[AKAlignmentGuideLineLayer setLineWidth:](v9, "setLineWidth:", 1.0 / a3);
    Mutable = CGPathCreateMutable();
    v12 = Mutable;
    if (v6)
    {
      CGPathMoveToPoint(Mutable, 0, 0.0, -a5);
      v13 = 0.0;
      v14 = v12;
      v15 = a5;
    }
    else
    {
      CGPathMoveToPoint(Mutable, 0, -a5, 0.0);
      v15 = 0.0;
      v14 = v12;
      v13 = a5;
    }
    CGPathAddLineToPoint(v14, 0, v13, v15);
    -[AKAlignmentGuideLineLayer setPath:](v9, "setPath:", v12);
    CGPathRelease(v12);
  }
  return v9;
}

@end
