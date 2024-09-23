@implementation CEKLightingCubeAppearance

- (CEKLightingCubeAppearance)initWithStroke:(CGColor *)a3
{
  CEKLightingCubeAppearance *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEKLightingCubeAppearance;
  v4 = -[CEKLightingCubeAppearance init](&v6, sel_init);
  if (v4)
  {
    v4->_stroke = CGColorRetain(a3);
    *(_OWORD *)&v4->_verticalFillFrontIntensity = xmmword_1B9877E10;
  }
  return v4;
}

+ (id)appearanceFrom:(id)a3 to:(id)a4 progress:(double)a5
{
  id v7;
  id v8;
  CGColor *Interpolated;
  CEKLightingCubeMutableAppearance *v10;
  CGColor *v11;
  CGGradient *v12;
  CGColor *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  CGGradient *v24;
  CGColor *v26;
  CGGradient *v27;
  CGGradient *v28;
  CGGradient *v29;
  CGGradient *v30;
  CGGradient *gradient;

  v7 = a4;
  v8 = a3;
  Interpolated = CubeColorCreateInterpolated((CGColorRef)objc_msgSend(v8, "stroke"), (CGColorRef)objc_msgSend(v7, "stroke"), a5);
  v10 = -[CEKLightingCubeAppearance initWithStroke:]([CEKLightingCubeMutableAppearance alloc], "initWithStroke:", Interpolated);
  CGColorRelease(Interpolated);
  gradient = CubeGradientCreateInterpolated(objc_msgSend(v8, "background"), objc_msgSend(v7, "background"), a5);
  v11 = CubeColorCreateInterpolated((CGColorRef)objc_msgSend(v8, "topFill"), (CGColorRef)objc_msgSend(v7, "topFill"), a5);
  v12 = CubeGradientCreateInterpolated(objc_msgSend(v8, "topGlow"), objc_msgSend(v7, "topGlow"), a5);
  v30 = CubeGradientCreateInterpolated(objc_msgSend(v8, "topMask"), objc_msgSend(v7, "topMask"), a5);
  v13 = CubeColorCreateInterpolated((CGColorRef)objc_msgSend(v8, "bottomFill"), (CGColorRef)objc_msgSend(v7, "bottomFill"), a5);
  v29 = CubeGradientCreateInterpolated(objc_msgSend(v8, "bottomInnerGlow"), objc_msgSend(v7, "bottomInnerGlow"), a5);
  v28 = CubeGradientCreateInterpolated(objc_msgSend(v8, "bottomOuterGlow"), objc_msgSend(v7, "bottomOuterGlow"), a5);
  v27 = CubeGradientCreateInterpolated(objc_msgSend(v8, "bottomMask"), objc_msgSend(v7, "bottomMask"), a5);
  v26 = CubeColorCreateInterpolated((CGColorRef)objc_msgSend(v8, "verticalFillColor"), (CGColorRef)objc_msgSend(v7, "verticalFillColor"), a5);
  objc_msgSend(v8, "verticalFillFrontIntensity");
  v15 = v14;
  objc_msgSend(v7, "verticalFillFrontIntensity");
  v17 = CEKInterpolate(v15, v16, a5);
  objc_msgSend(v8, "verticalFillBackIntensity");
  v19 = v18;
  objc_msgSend(v7, "verticalFillBackIntensity");
  v21 = CEKInterpolate(v19, v20, a5);
  v22 = objc_msgSend(v8, "topOver");

  v23 = objc_msgSend(v7, "topOver");
  v24 = CubeGradientCreateInterpolated(v22, v23, a5);
  -[CEKLightingCubeMutableAppearance setBackground:](v10, "setBackground:", gradient);
  -[CEKLightingCubeMutableAppearance setTopFill:](v10, "setTopFill:", v11);
  -[CEKLightingCubeMutableAppearance setTopGlow:](v10, "setTopGlow:", v12);
  -[CEKLightingCubeMutableAppearance setTopMask:](v10, "setTopMask:", v30);
  -[CEKLightingCubeMutableAppearance setBottomFill:](v10, "setBottomFill:", v13);
  -[CEKLightingCubeMutableAppearance setBottomInnerGlow:](v10, "setBottomInnerGlow:", v29);
  -[CEKLightingCubeMutableAppearance setBottomOuterGlow:](v10, "setBottomOuterGlow:", v28);
  -[CEKLightingCubeMutableAppearance setBottomMask:](v10, "setBottomMask:", v27);
  -[CEKLightingCubeMutableAppearance setVerticalFillColor:](v10, "setVerticalFillColor:", v26);
  -[CEKLightingCubeMutableAppearance setVerticalFillFrontIntensity:](v10, "setVerticalFillFrontIntensity:", v17);
  -[CEKLightingCubeMutableAppearance setVerticalFillBackIntensity:](v10, "setVerticalFillBackIntensity:", v21);
  -[CEKLightingCubeMutableAppearance setTopOver:](v10, "setTopOver:", v24);
  CGColorRelease(v11);
  CGColorRelease(v13);
  CGColorRelease(v26);
  CGGradientRelease(gradient);
  CGGradientRelease(v12);
  CGGradientRelease(v30);
  CGGradientRelease(v29);
  CGGradientRelease(v28);
  CGGradientRelease(v27);
  CGGradientRelease(v24);
  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CEKLightingCubeMutableAppearance *v4;

  v4 = -[CEKLightingCubeAppearance initWithStroke:]([CEKLightingCubeMutableAppearance alloc], "initWithStroke:", self->_stroke);
  -[CEKLightingCubeMutableAppearance setBackground:](v4, "setBackground:", self->_background);
  -[CEKLightingCubeMutableAppearance setTopFill:](v4, "setTopFill:", self->_topFill);
  -[CEKLightingCubeMutableAppearance setBottomFill:](v4, "setBottomFill:", self->_bottomFill);
  -[CEKLightingCubeMutableAppearance setTopGlow:](v4, "setTopGlow:", self->_topGlow);
  -[CEKLightingCubeMutableAppearance setBottomInnerGlow:](v4, "setBottomInnerGlow:", self->_bottomInnerGlow);
  -[CEKLightingCubeMutableAppearance setBottomOuterGlow:](v4, "setBottomOuterGlow:", self->_bottomOuterGlow);
  -[CEKLightingCubeMutableAppearance setVerticalFillColor:](v4, "setVerticalFillColor:", self->_verticalFillColor);
  -[CEKLightingCubeMutableAppearance setVerticalFillFrontIntensity:](v4, "setVerticalFillFrontIntensity:", self->_verticalFillFrontIntensity);
  -[CEKLightingCubeMutableAppearance setVerticalFillBackIntensity:](v4, "setVerticalFillBackIntensity:", self->_verticalFillBackIntensity);
  -[CEKLightingCubeMutableAppearance setTopOver:](v4, "setTopOver:", self->_topOver);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGGradientRelease(self->_background);
  CGColorRelease(self->_topFill);
  CGGradientRelease(self->_topGlow);
  CGGradientRelease(self->_topMask);
  CGColorRelease(self->_bottomFill);
  CGGradientRelease(self->_bottomInnerGlow);
  CGGradientRelease(self->_bottomOuterGlow);
  CGGradientRelease(self->_bottomMask);
  CGColorRelease(self->_verticalFillColor);
  CGGradientRelease(self->_topOver);
  CGColorRelease(self->_stroke);
  v3.receiver = self;
  v3.super_class = (Class)CEKLightingCubeAppearance;
  -[CEKLightingCubeAppearance dealloc](&v3, sel_dealloc);
}

- (CGGradient)background
{
  return self->_background;
}

- (CGColor)topFill
{
  return self->_topFill;
}

- (CGGradient)topGlow
{
  return self->_topGlow;
}

- (CGGradient)topMask
{
  return self->_topMask;
}

- (CGColor)bottomFill
{
  return self->_bottomFill;
}

- (CGGradient)bottomInnerGlow
{
  return self->_bottomInnerGlow;
}

- (CGGradient)bottomOuterGlow
{
  return self->_bottomOuterGlow;
}

- (CGGradient)bottomMask
{
  return self->_bottomMask;
}

- (CGColor)verticalFillColor
{
  return self->_verticalFillColor;
}

- (double)verticalFillBackIntensity
{
  return self->_verticalFillBackIntensity;
}

- (double)verticalFillFrontIntensity
{
  return self->_verticalFillFrontIntensity;
}

- (CGGradient)topOver
{
  return self->_topOver;
}

- (CGColor)stroke
{
  return self->_stroke;
}

@end
