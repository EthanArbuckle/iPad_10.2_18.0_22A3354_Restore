@implementation CSRingLayer

+ (CSRingLayer)ringLayerWithBlendMode:(id)a3 diameter:(double)a4 lineWidth:(double)a5 brightnessAmount:(double)a6 saturationAmount:(double)a7
{
  id v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  objc_msgSend(a1, "ringWithDiameter:lineWidth:", a4, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 0;
  objc_msgSend(v13, "setOpacity:", v14);
  objc_msgSend(v13, "setStrokeEnd:", 1.0);
  objc_msgSend(v13, "setLineCap:", *MEMORY[0x1E0CD3010]);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setCompositingFilter:", v15);
  objc_msgSend(MEMORY[0x1E0CD2780], "brightnessFilterWithAmount:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "saturationFilterWithAmount:", a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFilters:", v18);

  return (CSRingLayer *)v13;
}

+ (id)ringWithDiameter:(double)a3 lineWidth:(double)a4
{
  void *v7;
  void *v8;
  const CGPath *v9;

  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setFillColor:", 0);
    objc_msgSend(v8, "setLineWidth:", a4);
    objc_msgSend(v8, "setBounds:", 0.0, 0.0, a3, a3);
    v9 = (const CGPath *)objc_msgSend(a1, "newPathForDiameter:lineWidth:", a3, a4);
    objc_msgSend(v8, "setPath:", v9);
    CGPathRelease(v9);
  }
  return v8;
}

+ (CGPath)newPathForDiameter:(double)a3 lineWidth:(double)a4
{
  CGFloat v5;
  CGPath *Mutable;
  CGFloat MidX;
  CGFloat MidY;
  CGRect v10;
  CGRect v11;

  v5 = (a3 - a4) * 0.5;
  Mutable = CGPathCreateMutable();
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = a3;
  v10.size.height = a3;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = a3;
  v11.size.height = a3;
  MidY = CGRectGetMidY(v11);
  CGPathAddArc(Mutable, 0, MidX, MidY, v5, -1.57079633, 4.71238898, 0);
  return Mutable;
}

@end
