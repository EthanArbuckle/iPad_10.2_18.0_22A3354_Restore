@implementation CLKUICurvedCircleGlyphLayoutProvider

- (CLKUICurvedCircleGlyphLayoutProvider)init
{
  CLKUICurvedCircleGlyphLayoutProvider *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedCircleGlyphLayoutProvider;
  result = -[CLKUICurvedCircleGlyphLayoutProvider init](&v4, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_extraWidthForImage = 0u;
    *(_OWORD *)&result->_maxAngularWidth = 0u;
    result->_layoutLocation = (CGPoint)*MEMORY[0x1E0C9D538];
    result->_usedWidth = 0.0;
    result->_distance = 0.0;
    v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    result->_bounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    result->_bounds.size = v3;
  }
  return result;
}

- (double)maxTextWidth
{
  double maxAngularWidth;
  double circleRadius;
  double v4;

  maxAngularWidth = self->_maxAngularWidth;
  if (fabs(maxAngularWidth) >= 0.00000011920929
    && (circleRadius = self->_circleRadius, fabs(circleRadius) >= 0.00000011920929))
  {
    if (maxAngularWidth > 3.14159265)
      maxAngularWidth = 6.28318531 - maxAngularWidth;
    v4 = maxAngularWidth * circleRadius;
  }
  else
  {
    v4 = 1.79769313e308;
  }
  return v4 - self->_extraWidthForImage;
}

- (CGAffineTransform)makeTransform
{
  double x;
  double distance;
  CGAffineTransform *result;
  double centerAngle;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat width;
  CGFloat height;
  double MidX;
  __double2 v15;
  double v16;
  double v17;
  __double2 v18;
  __int128 v19;
  __int128 v20;
  double y;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  distance = self->_distance;
  x = self->_layoutLocation.x;
  if (fabs(distance) < 0.00000011920929)
    return CGAffineTransformMakeTranslation(retstr, x, self->_layoutLocation.y);
  centerAngle = self->_centerAngle;
  v9 = centerAngle + (x + self->_usedWidth * -0.5) / distance;
  v10 = self->_bounds.origin.x;
  y = self->_layoutLocation.y;
  v11 = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  v24.origin.x = v10;
  v24.origin.y = v11;
  v24.size.width = width;
  v24.size.height = height;
  MidX = CGRectGetMidX(v24);
  v15 = __sincos_stret(centerAngle);
  v25.origin.x = v10;
  v25.origin.y = v11;
  v25.size.width = width;
  v25.size.height = height;
  v16 = y + CGRectGetMinY(v25) - distance * v15.__cosval;
  v17 = self->_distance;
  v18 = __sincos_stret(v9);
  CGAffineTransformMakeTranslation(retstr, MidX - distance * v15.__sinval + v17 * v18.__sinval, v16 + v17 * v18.__cosval);
  v19 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v22.c = v19;
  *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformRotate(&v23, &v22, -v9);
  v20 = *(_OWORD *)&v23.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v23.a;
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v23.tx;
  return result;
}

- (double)maxAngularWidth
{
  return self->_maxAngularWidth;
}

- (void)setMaxAngularWidth:(double)a3
{
  self->_maxAngularWidth = a3;
}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (void)setCircleRadius:(double)a3
{
  self->_circleRadius = a3;
}

- (double)extraWidthForImage
{
  return self->_extraWidthForImage;
}

- (void)setExtraWidthForImage:(double)a3
{
  self->_extraWidthForImage = a3;
}

- (double)centerAngle
{
  return self->_centerAngle;
}

- (void)setCenterAngle:(double)a3
{
  self->_centerAngle = a3;
}

- (CGPoint)layoutLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_layoutLocation.x;
  y = self->_layoutLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLayoutLocation:(CGPoint)a3
{
  self->_layoutLocation = a3;
}

- (double)usedWidth
{
  return self->_usedWidth;
}

- (void)setUsedWidth:(double)a3
{
  self->_usedWidth = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

@end
