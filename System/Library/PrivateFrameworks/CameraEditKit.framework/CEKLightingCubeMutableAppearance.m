@implementation CEKLightingCubeMutableAppearance

- (CGGradient)background
{
  return self->super._background;
}

- (void)setBackground:(CGGradient *)a3
{
  CGGradient *background;

  background = self->super._background;
  if (background != a3)
  {
    CGGradientRelease(background);
    self->super._background = CGGradientRetain(a3);
  }
}

- (CGColor)topFill
{
  return self->super._topFill;
}

- (void)setTopFill:(CGColor *)a3
{
  CGColor *topFill;

  topFill = self->super._topFill;
  if (topFill != a3)
  {
    CGColorRelease(topFill);
    self->super._topFill = CGColorRetain(a3);
  }
}

- (CGGradient)topGlow
{
  return self->super._topGlow;
}

- (void)setTopGlow:(CGGradient *)a3
{
  CGGradient *topGlow;

  topGlow = self->super._topGlow;
  if (topGlow != a3)
  {
    CGGradientRelease(topGlow);
    self->super._topGlow = CGGradientRetain(a3);
  }
}

- (CGGradient)topMask
{
  return self->super._topMask;
}

- (void)setTopMask:(CGGradient *)a3
{
  CGGradient *topMask;

  topMask = self->super._topMask;
  if (topMask != a3)
  {
    CGGradientRelease(topMask);
    self->super._topMask = CGGradientRetain(a3);
  }
}

- (CGColor)bottomFill
{
  return self->super._bottomFill;
}

- (void)setBottomFill:(CGColor *)a3
{
  CGColor *bottomFill;

  bottomFill = self->super._bottomFill;
  if (bottomFill != a3)
  {
    CGColorRelease(bottomFill);
    self->super._bottomFill = CGColorRetain(a3);
  }
}

- (CGGradient)bottomInnerGlow
{
  return self->super._bottomInnerGlow;
}

- (void)setBottomInnerGlow:(CGGradient *)a3
{
  CGGradient *bottomInnerGlow;

  bottomInnerGlow = self->super._bottomInnerGlow;
  if (bottomInnerGlow != a3)
  {
    CGGradientRelease(bottomInnerGlow);
    self->super._bottomInnerGlow = CGGradientRetain(a3);
  }
}

- (CGGradient)bottomOuterGlow
{
  return self->super._bottomOuterGlow;
}

- (void)setBottomOuterGlow:(CGGradient *)a3
{
  CGGradient *bottomOuterGlow;

  bottomOuterGlow = self->super._bottomOuterGlow;
  if (bottomOuterGlow != a3)
  {
    CGGradientRelease(bottomOuterGlow);
    self->super._bottomOuterGlow = CGGradientRetain(a3);
  }
}

- (CGGradient)bottomMask
{
  return self->super._bottomMask;
}

- (void)setBottomMask:(CGGradient *)a3
{
  CGGradient *bottomMask;

  bottomMask = self->super._bottomMask;
  if (bottomMask != a3)
  {
    CGGradientRelease(bottomMask);
    self->super._bottomMask = CGGradientRetain(a3);
  }
}

- (CGGradient)topOver
{
  return self->super._topOver;
}

- (void)setTopOver:(CGGradient *)a3
{
  CGGradient *topOver;

  topOver = self->super._topOver;
  if (topOver != a3)
  {
    CGGradientRelease(topOver);
    self->super._topOver = CGGradientRetain(a3);
  }
}

- (CGColor)verticalFillColor
{
  return self->super._verticalFillColor;
}

- (void)setVerticalFillColor:(CGColor *)a3
{
  CGColor *verticalFillColor;

  verticalFillColor = self->super._verticalFillColor;
  if (verticalFillColor != a3)
  {
    CGColorRelease(verticalFillColor);
    self->super._verticalFillColor = CGColorRetain(a3);
  }
}

- (double)verticalFillFrontIntensity
{
  return self->super._verticalFillFrontIntensity;
}

- (void)setVerticalFillFrontIntensity:(double)a3
{
  self->super._verticalFillFrontIntensity = a3;
}

- (double)verticalFillBackIntensity
{
  return self->super._verticalFillBackIntensity;
}

- (void)setVerticalFillBackIntensity:(double)a3
{
  self->super._verticalFillBackIntensity = a3;
}

- (CGColor)stroke
{
  return self->super._stroke;
}

- (void)setStroke:(CGColor *)a3
{
  CGColor *stroke;

  stroke = self->super._stroke;
  if (stroke != a3)
  {
    CGColorRelease(stroke);
    self->super._stroke = CGColorRetain(a3);
  }
}

@end
