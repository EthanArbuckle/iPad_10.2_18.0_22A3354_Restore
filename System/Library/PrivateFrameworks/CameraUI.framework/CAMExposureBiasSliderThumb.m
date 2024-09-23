@implementation CAMExposureBiasSliderThumb

- (CAMExposureBiasSliderThumb)initWithFrame:(CGRect)a3
{
  CAMExposureBiasSliderThumb *v3;
  CAMExposureBiasSliderThumb *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMExposureBiasSliderThumb;
  v3 = -[CAMExposureBiasSliderThumb initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CAMExposureBiasSliderThumb setOpaque:](v3, "setOpaque:", 0);
  return v4;
}

- (void)setNormalizedExposureValue:(float)a3
{
  if (self->_normalizedExposureValue != a3)
  {
    self->_normalizedExposureValue = a3;
    -[CAMExposureBiasSliderThumb setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (double)maxRadius
{
  return 14.5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[CAMExposureBiasSliderThumb _sunRadius](self, "_sunRadius", a3.width, a3.height);
  -[CAMExposureBiasSliderThumb _sunRaySpacing](self, "_sunRaySpacing");
  -[CAMExposureBiasSliderThumb _sunRayLength](self, "_sunRayLength");
  UICeilToViewScale();
  v5 = v4 + v4;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  CGContext *CurrentContext;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  __double2 v21;
  id v22;
  CGRect v23;
  CGRect v24;

  -[CAMExposureBiasSliderThumb bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  MidX = CGRectGetMidX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MidY = CGRectGetMidY(v24);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[CAMExposureBiasSliderThumb tintColor](self, "tintColor");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "set");
  -[CAMExposureBiasSliderThumb _sunRadius](self, "_sunRadius");
  v12 = v11;
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, MidX + v12, MidY);
  v13 = 0.0;
  CGContextAddArc(CurrentContext, MidX, MidY, v12, 0.0, 6.28318531, 0);
  CGContextClosePath(CurrentContext);
  CGContextFillPath(CurrentContext);
  CGContextBeginPath(CurrentContext);
  -[CAMExposureBiasSliderThumb _sunRadius](self, "_sunRadius");
  v15 = v14;
  -[CAMExposureBiasSliderThumb _sunRaySpacing](self, "_sunRaySpacing");
  v17 = v15 + v16;
  -[CAMExposureBiasSliderThumb _sunRayLength](self, "_sunRayLength");
  v19 = v17 + v18;
  v20 = 8;
  do
  {
    v21 = __sincos_stret(v13 * 0.785398163);
    CGContextMoveToPoint(CurrentContext, MidX + v17 * v21.__cosval, MidY + v17 * v21.__sinval);
    CGContextAddLineToPoint(CurrentContext, MidX + v19 * v21.__cosval, MidY + v19 * v21.__sinval);
    v13 = v13 + 1.0;
    --v20;
  }
  while (v20);
  CGContextClosePath(CurrentContext);
  CGContextStrokePath(CurrentContext);

}

- (double)_interpolatedValueWithMin:(double)a3 mid:(double)a4 max:(double)a5
{
  float normalizedExposureValue;
  double v6;

  normalizedExposureValue = self->_normalizedExposureValue;
  v6 = normalizedExposureValue;
  if (normalizedExposureValue >= 0.5)
    return a4 + (v6 + -0.5 + v6 + -0.5) * (a5 - a4);
  else
    return a3 + (v6 + v6) * (a4 - a3);
}

- (double)_sunRadius
{
  double v2;

  -[CAMExposureBiasSliderThumb _interpolatedValueWithMin:mid:max:](self, "_interpolatedValueWithMin:mid:max:", 6.0, 9.0, 11.0);
  return v2 * 0.5;
}

- (double)_sunRayLength
{
  double result;

  -[CAMExposureBiasSliderThumb _interpolatedValueWithMin:mid:max:](self, "_interpolatedValueWithMin:mid:max:", 3.5, 5.0, 6.0);
  return result;
}

- (double)_sunRaySpacing
{
  double result;

  -[CAMExposureBiasSliderThumb _interpolatedValueWithMin:mid:max:](self, "_interpolatedValueWithMin:mid:max:", 2.0, 3.0, 3.0);
  return result;
}

- (float)normalizedExposureValue
{
  return self->_normalizedExposureValue;
}

@end
