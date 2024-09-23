@implementation CUIPSDLayerEffectGradientOverlay

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  CUIPSDGradient *v7;
  CUIPSDGradientEvaluator *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  NSError *v25;
  uint64_t v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;

  v7 = -[CUIPSDLayerEffectGradientOverlay gradient](self, "gradient");
  if (v7)
  {
    v8 = -[CUIPSDGradient evaluator](-[CUIPSDLayerEffectGradientOverlay gradient](self, "gradient"), "evaluator");
    v9 = (id)-[CUIPSDGradientEvaluator blendMode](v8, "blendMode");
    -[CUIPSDGradientEvaluator _smoothedGradientColorAtLocation:](v8, "_smoothedGradientColorAtLocation:", 0.0);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[CUIPSDGradientEvaluator _smoothedGradientColorAtLocation:](v8, "_smoothedGradientColorAtLocation:", 1.0);
    v16 = rint(v11 * 255.0);
    v18 = rint(v17 * 255.0);
    v20 = rint(v19 * 255.0);
    v22 = rint(v21 * 255.0);
    -[CUIPSDGradientEvaluator fillColor](v8, "fillColor");
    v24 = v23;
    LODWORD(v27) = +[CUIShapeEffectPreset cuiEffectBlendModeFromCGBlendMode:](CUIShapeEffectPreset, "cuiEffectBlendModeFromCGBlendMode:", v9);
    objc_msgSend(a3, "addGradientFillWithTopColorRed:green:blue:bottomColorRed:green:blue:opacity:blendMode:", v16, rint(v13 * 255.0), rint(v15 * 255.0), v18, v20, v22, v24, v27);
  }
  else
  {
    v28 = NSLocalizedDescriptionKey;
    v29 = CFSTR("Gradient is missing gradient information");
    v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    if (a4)
      *a4 = v25;
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectGradientOverlay)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  CUIPSDLayerEffectGradientOverlay *v6;
  uint64_t v7;
  id v8;
  int8x8_t v9;
  float32x2_t v10;
  CGColorSpace *SRGB;
  CGColorRef v12;
  int8x8_t v13;
  CGColorRef v14;
  objc_super v16;
  CGFloat components[2];
  double v18;
  id v19;

  v16.receiver = self;
  v16.super_class = (Class)CUIPSDLayerEffectGradientOverlay;
  v6 = -[CUIPSDLayerEffectGradientOverlay init](&v16, sel_init);
  v7 = a4;
  v8 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, a4);
  v9.i32[0] = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, a4);
  v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
  v10 = (float32x2_t)vdup_n_s32(0x437F0000u);
  *(float64x2_t *)components = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), v10));
  v18 = (float)((float)v9.u8[2] / 255.0);
  v19 = v8;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v12 = CGColorCreate(SRGB, components);
  v13.i32[0] = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 1, v7);
  v13.i32[1] = (unsigned __int32)v13.i32[0] >> 8;
  *(float64x2_t *)components = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v13, (int8x8_t)0xFF000000FFLL)), v10));
  v18 = (float)((float)v13.u8[2] / 255.0);
  v19 = v8;
  v14 = CGColorCreate(SRGB, components);
  -[CUIPSDLayerEffectGradientOverlay setGradient:](v6, "setGradient:", +[CUIPSDGradient cuiPSDGradientWithColors:locations:midpointLocations:angle:isRadial:](CUIPSDGradient, "cuiPSDGradientWithColors:locations:midpointLocations:angle:isRadial:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v14, 0), &unk_1E41DDCC8, 0, 0, 90.0));
  -[CUIPSDLayerEffectComponent setVisible:](v6, "setVisible:", 1);
  CFRelease(v14);
  CFRelease(v12);
  return v6;
}

- (CUIPSDLayerEffectGradientOverlay)init
{
  CUIPSDLayerEffectGradientOverlay *v2;
  CUIPSDLayerEffectGradientOverlay *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectGradientOverlay;
  v2 = -[CUIPSDLayerEffectGradientOverlay init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CUIPSDLayerEffectComponent setName:](v2, "setName:", CFSTR("Gradient Overlay"));
  return v3;
}

- (unsigned)effectType
{
  return 1198671468;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectGradientOverlay;
  -[CUIPSDLayerEffectComponent dealloc](&v3, sel_dealloc);
}

- (CUIPSDGradient)gradient
{
  return (CUIPSDGradient *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGradient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
