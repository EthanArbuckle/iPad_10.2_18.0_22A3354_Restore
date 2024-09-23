@implementation CEKLightingCubeStyleGlowing

+ (id)naturalAppearance
{
  if (naturalAppearance_token != -1)
    dispatch_once(&naturalAppearance_token, &__block_literal_global_1);
  return (id)naturalAppearance_naturalAppearance;
}

void __48__CEKLightingCubeStyleGlowing_naturalAppearance__block_invoke()
{
  CGColor *StrokeColor;
  CEKLightingCubeMutableAppearance *v1;
  void *v2;

  StrokeColor = CreateStrokeColor();
  v1 = -[CEKLightingCubeAppearance initWithStroke:]([CEKLightingCubeMutableAppearance alloc], "initWithStroke:", StrokeColor);
  v2 = (void *)naturalAppearance_naturalAppearance;
  naturalAppearance_naturalAppearance = (uint64_t)v1;

  CGColorRelease(StrokeColor);
}

+ (id)studioAppearance
{
  if (studioAppearance_token != -1)
    dispatch_once(&studioAppearance_token, &__block_literal_global_1);
  return (id)studioAppearance_studioAppearance;
}

void __47__CEKLightingCubeStyleGlowing_studioAppearance__block_invoke()
{
  CGGradient *BackgroundGradient;
  CGColor *FillColor;
  CGGradient *GlowGradient;
  CGGradient *MaskGradient;
  CGColor *v4;
  CGGradient *v5;
  CGGradient *v6;
  CGColor *v7;
  CGColor *StrokeColor;
  CEKLightingCubeMutableAppearance *v9;
  void *v10;
  CGColorSpace *space;
  CGFloat components[3];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  space = CGColorSpaceCreateDeviceGray();
  BackgroundGradient = CreateBackgroundGradient();
  FillColor = CreateFillColor();
  GlowGradient = CreateGlowGradient();
  MaskGradient = CreateMaskGradient(0.1, 0.3);
  v4 = CreateFillColor();
  v5 = CreateGlowGradient();
  v6 = CreateMaskGradient(0.5, 0.9);
  *(_OWORD *)components = xmmword_1B9877B60;
  v7 = CGColorCreate(space, components);
  StrokeColor = CreateStrokeColor();
  v9 = -[CEKLightingCubeAppearance initWithStroke:]([CEKLightingCubeMutableAppearance alloc], "initWithStroke:", StrokeColor);
  -[CEKLightingCubeMutableAppearance setBackground:](v9, "setBackground:", BackgroundGradient);
  -[CEKLightingCubeMutableAppearance setTopFill:](v9, "setTopFill:", FillColor);
  -[CEKLightingCubeMutableAppearance setTopGlow:](v9, "setTopGlow:", GlowGradient);
  -[CEKLightingCubeMutableAppearance setTopMask:](v9, "setTopMask:", MaskGradient);
  -[CEKLightingCubeMutableAppearance setBottomFill:](v9, "setBottomFill:", v4);
  -[CEKLightingCubeMutableAppearance setBottomOuterGlow:](v9, "setBottomOuterGlow:", v5);
  -[CEKLightingCubeMutableAppearance setBottomMask:](v9, "setBottomMask:", v6);
  -[CEKLightingCubeMutableAppearance setVerticalFillColor:](v9, "setVerticalFillColor:", v7);
  v10 = (void *)studioAppearance_studioAppearance;
  studioAppearance_studioAppearance = (uint64_t)v9;

  CGColorRelease(StrokeColor);
  CGColorRelease(v7);
  CGColorRelease(FillColor);
  CGGradientRelease(GlowGradient);
  CGGradientRelease(MaskGradient);
  CGColorRelease(v4);
  CGGradientRelease(v5);
  CGGradientRelease(v6);
  CGGradientRelease(BackgroundGradient);
  CGColorSpaceRelease(space);
}

+ (id)contourAppearance
{
  if (contourAppearance_token != -1)
    dispatch_once(&contourAppearance_token, &__block_literal_global_2);
  return (id)contourAppearance_contourAppearance;
}

void __48__CEKLightingCubeStyleGlowing_contourAppearance__block_invoke()
{
  CGGradient *BackgroundGradient;
  CGColor *FillColor;
  CGGradient *GlowGradient;
  CGGradient *MaskGradient;
  CGColor *v4;
  CGGradient *v5;
  CGGradient *v6;
  CGColor *v7;
  CGColor *StrokeColor;
  CEKLightingCubeMutableAppearance *v9;
  void *v10;
  CGColorSpace *space;
  CGFloat components[3];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  space = CGColorSpaceCreateDeviceGray();
  BackgroundGradient = CreateBackgroundGradient();
  FillColor = CreateFillColor();
  GlowGradient = CreateGlowGradient();
  MaskGradient = CreateMaskGradient(0.5, 0.8);
  v4 = CreateFillColor();
  v5 = CreateGlowGradient();
  v6 = CreateMaskGradient(0.5, 0.9);
  *(_OWORD *)components = xmmword_1B9877C60;
  v7 = CGColorCreate(space, components);
  StrokeColor = CreateStrokeColor();
  v9 = -[CEKLightingCubeAppearance initWithStroke:]([CEKLightingCubeMutableAppearance alloc], "initWithStroke:", StrokeColor);
  -[CEKLightingCubeMutableAppearance setBackground:](v9, "setBackground:", BackgroundGradient);
  -[CEKLightingCubeMutableAppearance setTopFill:](v9, "setTopFill:", FillColor);
  -[CEKLightingCubeMutableAppearance setTopGlow:](v9, "setTopGlow:", GlowGradient);
  -[CEKLightingCubeMutableAppearance setTopMask:](v9, "setTopMask:", MaskGradient);
  -[CEKLightingCubeMutableAppearance setBottomFill:](v9, "setBottomFill:", v4);
  -[CEKLightingCubeMutableAppearance setBottomOuterGlow:](v9, "setBottomOuterGlow:", v5);
  -[CEKLightingCubeMutableAppearance setBottomMask:](v9, "setBottomMask:", v6);
  -[CEKLightingCubeMutableAppearance setVerticalFillColor:](v9, "setVerticalFillColor:", v7);
  v10 = (void *)contourAppearance_contourAppearance;
  contourAppearance_contourAppearance = (uint64_t)v9;

  CGColorRelease(StrokeColor);
  CGColorRelease(v7);
  CGColorRelease(FillColor);
  CGGradientRelease(GlowGradient);
  CGGradientRelease(MaskGradient);
  CGColorRelease(v4);
  CGGradientRelease(v5);
  CGGradientRelease(v6);
  CGGradientRelease(BackgroundGradient);
  CGColorSpaceRelease(space);
}

+ (id)stageAppearance
{
  if (stageAppearance_token != -1)
    dispatch_once(&stageAppearance_token, &__block_literal_global_3);
  return (id)stageAppearance_stageAppearance;
}

void __46__CEKLightingCubeStyleGlowing_stageAppearance__block_invoke()
{
  CGColorSpace *DeviceGray;
  CGColor *FillColor;
  CGGradient *GlowGradient;
  CGGradient *MaskGradient;
  CGColor *v4;
  CGColor *StrokeColor;
  CEKLightingCubeMutableAppearance *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  FillColor = CreateFillColor();
  GlowGradient = CreateGlowGradient();
  MaskGradient = CreateMaskGradient(0.55, 0.9);
  v8 = xmmword_1B9877C70;
  v4 = CGColorCreate(DeviceGray, (const CGFloat *)&v8);
  StrokeColor = CreateStrokeColor();
  v6 = -[CEKLightingCubeAppearance initWithStroke:]([CEKLightingCubeMutableAppearance alloc], "initWithStroke:", StrokeColor);
  -[CEKLightingCubeMutableAppearance setBottomFill:](v6, "setBottomFill:", FillColor);
  -[CEKLightingCubeMutableAppearance setBottomOuterGlow:](v6, "setBottomOuterGlow:", GlowGradient);
  -[CEKLightingCubeMutableAppearance setBottomMask:](v6, "setBottomMask:", MaskGradient);
  -[CEKLightingCubeMutableAppearance setVerticalFillColor:](v6, "setVerticalFillColor:", v4);
  v7 = (void *)stageAppearance_stageAppearance;
  stageAppearance_stageAppearance = (uint64_t)v6;

  CGColorRelease(StrokeColor);
  CGColorRelease(v4);
  CGColorRelease(FillColor);
  CGGradientRelease(GlowGradient);
  CGGradientRelease(MaskGradient);
  CGColorSpaceRelease(DeviceGray);
}

+ (id)stageWhiteAppearance
{
  if (stageWhiteAppearance_token != -1)
    dispatch_once(&stageWhiteAppearance_token, &__block_literal_global_4);
  return (id)stageWhiteAppearance_stageWhiteAppearance;
}

void __51__CEKLightingCubeStyleGlowing_stageWhiteAppearance__block_invoke()
{
  CGColorSpace *DeviceGray;
  CGGradient *BackgroundGradient;
  CGColor *v2;
  CGGradient *GlowGradient;
  CGGradient *MaskGradient;
  CGColor *v10;
  CGColor *StrokeColor;
  CEKLightingCubeMutableAppearance *v12;
  void *v13;
  __int128 v14;
  CGFloat components[3];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  BackgroundGradient = CreateBackgroundGradient();
  *(_OWORD *)components = xmmword_1B9877C80;
  v2 = CGColorCreate(DeviceGray, components);
  GlowGradient = CreateGlowGradient();
  MaskGradient = CreateMaskGradient(0.55, 0.9);
  __asm { FMOV            V0.2D, #1.0 }
  v14 = _Q0;
  v10 = CGColorCreate(DeviceGray, (const CGFloat *)&v14);
  StrokeColor = CreateStrokeColor();
  v12 = -[CEKLightingCubeAppearance initWithStroke:]([CEKLightingCubeMutableAppearance alloc], "initWithStroke:", StrokeColor);
  -[CEKLightingCubeMutableAppearance setBackground:](v12, "setBackground:", BackgroundGradient);
  -[CEKLightingCubeMutableAppearance setBottomFill:](v12, "setBottomFill:", v2);
  -[CEKLightingCubeMutableAppearance setBottomInnerGlow:](v12, "setBottomInnerGlow:", GlowGradient);
  -[CEKLightingCubeMutableAppearance setBottomMask:](v12, "setBottomMask:", MaskGradient);
  -[CEKLightingCubeMutableAppearance setVerticalFillColor:](v12, "setVerticalFillColor:", v10);
  -[CEKLightingCubeMutableAppearance setVerticalFillFrontIntensity:](v12, "setVerticalFillFrontIntensity:", 0.0);
  -[CEKLightingCubeMutableAppearance setVerticalFillBackIntensity:](v12, "setVerticalFillBackIntensity:", 0.33);
  v13 = (void *)stageWhiteAppearance_stageWhiteAppearance;
  stageWhiteAppearance_stageWhiteAppearance = (uint64_t)v12;

  CGColorRelease(StrokeColor);
  CGColorRelease(v2);
  CGGradientRelease(BackgroundGradient);
  CGGradientRelease(GlowGradient);
  CGGradientRelease(MaskGradient);
  CGColorRelease(v10);
  CGColorSpaceRelease(DeviceGray);
}

@end
