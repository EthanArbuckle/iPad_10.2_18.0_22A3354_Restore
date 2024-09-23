@implementation NTKRichComplicationLineView

- (void)_setupGradientLayer:(id)a3
{
  uint64_t v3;
  id v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v3 = *MEMORY[0x1E0CD2F48];
  v4 = a3;
  objc_msgSend(v4, "setType:", v3);
  CGAffineTransformMakeRotation(&v6, -1.57079633);
  v5 = v6;
  objc_msgSend(v4, "setAffineTransform:", &v5);

}

- (double)_shapeLineWidth
{
  double v2;

  -[NTKRichComplicationLineView bounds](self, "bounds");
  return v2;
}

- (CGPoint)_pointAtProgress:(float)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[NTKRichComplicationLineView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[CDRichComplicationShapeView device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _LayoutConstants_40(v9);

  v11 = v10 + (v6 + v10 * -2.0) * a3;
  v12 = v8 * 0.5;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)_normalizeGradientLocations:(id)a3
{
  return a3;
}

- (CGPath)_generatePath
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  id v11;
  CGPath *v12;

  -[NTKRichComplicationLineView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CDRichComplicationShapeView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _LayoutConstants_40(v7);

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 * 0.5;
  objc_msgSend(v9, "moveToPoint:", v8, v10);
  objc_msgSend(v9, "addLineToPoint:", v4 - v8, v10);
  v11 = objc_retainAutorelease(v9);
  v12 = (CGPath *)objc_msgSend(v11, "CGPath");

  return v12;
}

- (BOOL)_shouldReverseGradient
{
  return 0;
}

@end
