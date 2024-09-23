@implementation CUITextEffectStack

- (CUITextEffectStack)initWithEffectPreset:(id)a3
{
  CUITextEffectStack *v4;
  CUITextEffectStack *v5;
  BOOL v6;
  float v7;
  float v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CUITextEffectStack;
  v4 = -[CUIShapeEffectStack initWithEffectPreset:](&v14, sel_initWithEffectPreset_);
  v5 = v4;
  if (v4)
  {
    v6 = -[CUIShapeEffectStack hasInnerGlow](v4, "hasInnerGlow")
      || -[CUIShapeEffectStack hasInnerShadow](v5, "hasInnerShadow")
      || -[CUIShapeEffectStack hasOuterGlow](v5, "hasOuterGlow")
      || -[CUIShapeEffectStack hasBevelEmboss](v5, "hasBevelEmboss")
      || -[CUIShapeEffectStack hasHueSaturation](v5, "hasHueSaturation");
    *(&v5->super._bypassColorFills + 1) = v6;
    objc_msgSend(a3, "minimumShadowSpread");
    if (!*(&v5->super._bypassColorFills + 1))
    {
      v8 = v7;
      if (-[CUIShapeEffectStack engraveShadowCount](v5, "engraveShadowCount")
        && -[CUIShapeEffectStack engraveShadowCount](v5, "engraveShadowCount"))
      {
        v9 = 0;
        v10 = 20;
        while (*(float *)((char *)-[CUIShapeEffectStack engraveShadow](v5, "engraveShadow") + v10) <= v8)
        {
          ++v9;
          v10 += 48;
          if (v9 >= -[CUIShapeEffectStack engraveShadowCount](v5, "engraveShadowCount"))
            goto LABEL_13;
        }
        goto LABEL_20;
      }
LABEL_13:
      if (!*(&v5->super._bypassColorFills + 1)
        && -[CUIShapeEffectStack extraShadowCount](v5, "extraShadowCount")
        && -[CUIShapeEffectStack extraShadowCount](v5, "extraShadowCount"))
      {
        v11 = 0;
        for (i = 20; *(float *)((char *)-[CUIShapeEffectStack extraShadow](v5, "extraShadow") + i) <= v8; i += 48)
        {
          if (++v11 >= -[CUIShapeEffectStack extraShadowCount](v5, "extraShadowCount"))
            return v5;
        }
LABEL_20:
        *(&v5->super._bypassColorFills + 1) = 1;
      }
    }
  }
  return v5;
}

- (BOOL)useCoreImageRendering
{
  return *(&self->super._bypassColorFills + 1);
}

- (double)effectiveInteriorFillOpacity
{
  double v3;
  float v4;
  float v5;

  v3 = 0.0;
  if (-[CUIShapeEffectStack hasInnerGradient](self, "hasInnerGradient"))
  {
    -[CUIShapeEffectStack innerGradientOpacity](self, "innerGradientOpacity");
    v3 = v4;
  }
  if (!-[CUIShapeEffectStack hasColorOverlay](self, "hasColorOverlay"))
    return v3;
  -[CUIShapeEffectStack colorOverlayOpacity](self, "colorOverlayOpacity");
  return v5 + v3 * (float)(1.0 - v5);
}

- (CGColor)newBackgroundPatternColorWithSize:(CGSize)a3 contentScale:(double)a4 forContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat v10;
  CGFloat v11;
  CGColorSpace *SRGB;
  uint64_t v13;
  uint64_t v14;
  CGContext *v15;
  CGContext *v16;
  unint64_t v17;
  uint64_t v18;
  CGGradient *v19;
  double d;
  CGColorSpace *DeviceGray;
  CGColor *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  CGImage *Image;
  CGPattern *v27;
  CGColorSpace *Pattern;
  CGAffineTransform v30;
  CGAffineTransform components;
  double v32;
  double v33;
  CGPoint v34;
  CGPoint v35;
  CGRect v36;

  height = a3.height;
  width = a3.width;
  v10 = a3.width * a4;
  v11 = a3.height * a4;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v15 = CUICGBitmapContextCreate((unint64_t)v10, (unint64_t)v11, 8uLL, 0, SRGB, 8194, v13, v14);
  if (v15)
  {
    v16 = v15;
    CGContextScaleCTM(v15, a4, a4);
    if (-[CUIShapeEffectStack hasInnerGradient](self, "hasInnerGradient"))
    {
      v17 = -[CUIShapeEffectStack innerGlowCount](self, "innerGlowCount");
      if (v17)
      {
        v18 = 0;
        do
        {
          components.a = *(float *)((char *)-[CUIShapeEffectStack innerGradient](self, "innerGradient") + v18 + 4);
          components.b = *(float *)((char *)-[CUIShapeEffectStack innerGradient](self, "innerGradient") + v18 + 8);
          components.c = *(float *)((char *)-[CUIShapeEffectStack innerGradient](self, "innerGradient") + v18 + 12);
          components.d = *(float *)((char *)-[CUIShapeEffectStack innerGradient](self, "innerGradient") + v18 + 28);
          components.tx = *(float *)((char *)-[CUIShapeEffectStack innerGradient](self, "innerGradient") + v18 + 16);
          components.ty = *(float *)((char *)-[CUIShapeEffectStack innerGradient](self, "innerGradient") + v18 + 20);
          v32 = *(float *)((char *)-[CUIShapeEffectStack innerGradient](self, "innerGradient") + v18 + 24);
          v33 = *(float *)((char *)-[CUIShapeEffectStack innerGradient](self, "innerGradient") + v18 + 28);
          v19 = CGGradientCreateWithColorComponents(SRGB, &components.a, 0, 2uLL);
          memset(&v30, 0, sizeof(v30));
          CGContextGetBaseCTM(&v30, a5);
          d = v30.d;
          v34.x = 0.0;
          v35.x = 0.0;
          v35.y = 0.0;
          v34.y = height;
          CGContextDrawLinearGradient(v16, v19, v34, v35, 3u);
          CGGradientRelease(v19);
          v18 += 32;
          --v17;
        }
        while (v17);
        LODWORD(v17) = d < 0.0;
      }
    }
    else
    {
      LODWORD(v17) = 0;
    }
    if (-[CUIShapeEffectStack hasColorOverlay](self, "hasColorOverlay"))
    {
      v23 = -[CUIShapeEffectStack colorOverlayCount](self, "colorOverlayCount");
      if (v23)
      {
        v24 = v23;
        v25 = 0;
        do
        {
          components.a = *(float *)((char *)-[CUIShapeEffectStack colorOverlay](self, "colorOverlay") + v25 + 4);
          components.b = *(float *)((char *)-[CUIShapeEffectStack colorOverlay](self, "colorOverlay") + v25 + 8);
          components.c = *(float *)((char *)-[CUIShapeEffectStack colorOverlay](self, "colorOverlay") + v25 + 12);
          components.d = *(float *)((char *)-[CUIShapeEffectStack colorOverlay](self, "colorOverlay") + v25 + 16);
          CGContextSetFillColorSpace(v16, SRGB);
          CGContextSetFillColor(v16, &components.a);
          v36.origin.x = 0.0;
          v36.origin.y = 0.0;
          v36.size.width = width;
          v36.size.height = height;
          CGContextFillRect(v16, v36);
          v25 += 24;
          --v24;
        }
        while (v24);
      }
    }
    Image = CGBitmapContextCreateImage(v16);
    memset(&components, 0, sizeof(components));
    CGAffineTransformMakeScale(&components, 1.0 / a4, 1.0 / a4);
    if ((_DWORD)v17)
      components.d = -components.d;
    v30 = components;
    v27 = (CGPattern *)CGPatternCreateWithImage2(Image, &v30, 2);
    Pattern = CGColorSpaceCreatePattern(0);
    v30.a = 1.0;
    v22 = CGColorCreateWithPattern(Pattern, v27, &v30.a);
    CGColorSpaceRelease(Pattern);
    CGPatternRelease(v27);
    CGImageRelease(Image);
    CGContextRelease(v16);
  }
  else
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    *(_OWORD *)&components.a = xmmword_19EC72D40;
    v22 = CGColorCreate(DeviceGray, &components.a);
    CGColorSpaceRelease(DeviceGray);
  }
  return v22;
}

- (CGContext)newGlyphMaskContextForBounds:(CGRect)a3 fromContext:(CGContext *)a4 withScale:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  CGColorSpace *SRGB;
  uint64_t v15;
  uint64_t v16;
  CGContext *v17;
  CGPoint TextPosition;
  CGFont *Font;
  CGFloat FontSize;
  CGFloat CharacterSpacing;
  uint64_t FontRenderingStyle;
  CGColorSpace *DeviceGray;
  CGColor *v24;
  CGAffineTransform v26;
  CGAffineTransform t2;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform t1;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v31, 0, sizeof(v31));
  CGContextGetCTM(&v31, a4);
  v30 = v31;
  v29 = v31;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v34 = CGRectApplyAffineTransform(v33, &v29);
  v35 = CGRectIntegral(v34);
  v10 = v35.origin.x;
  v11 = v35.origin.y;
  v12 = v35.size.width;
  v13 = v35.size.height;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v17 = CUICGBitmapContextCreate((unint64_t)v12, (unint64_t)v13, 8uLL, vcvtd_n_u64_f64(v12, 2uLL), SRGB, 8194, v15, v16);
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeTranslation(&v29, -v10, -v11);
  t1 = v30;
  t2 = v29;
  memset(&v28, 0, sizeof(v28));
  CGAffineTransformConcat(&v28, &t1, &t2);
  t1 = v28;
  CGContextConcatCTM(v17, &t1);
  TextPosition = CGContextGetTextPosition(a4);
  CGContextSetTextPosition(v17, TextPosition.x, TextPosition.y);
  CGContextGetTextMatrix(&v26, a4);
  CGContextSetTextMatrix(v17, &v26);
  Font = (CGFont *)CGContextGetFont(a4);
  CGContextSetFont(v17, Font);
  FontSize = CGContextGetFontSize(a4);
  CGContextSetFontSize(v17, FontSize);
  CharacterSpacing = CGContextGetCharacterSpacing(a4);
  CGContextSetCharacterSpacing(v17, CharacterSpacing);
  FontRenderingStyle = CGContextGetFontRenderingStyle(a4);
  CGContextSetFontRenderingStyle(v17, FontRenderingStyle);
  CGContextSetShouldSmoothFonts(v17, 0);
  CGContextSetFontAntialiasingStyle(v17, 256);
  CGContextSetGrayFillColor(v17, 0.0, 1.0);
  CGContextSetAlpha(v17, 1.0);
  CGContextSetCompositeOperation(v17, 2);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  *(_OWORD *)&t1.a = xmmword_19EC75990;
  v24 = CGColorCreate(DeviceGray, &t1.a);
  CGContextSetFontSmoothingBackgroundColor(v17, v24);
  CGColorRelease(v24);
  CGColorSpaceRelease(DeviceGray);
  return v17;
}

- (void)drawProcessedMask:(CGContext *)a3 atBounds:(CGRect)a4 inContext:(CGContext *)a5 withScale:(double)a6
{
  double Width;
  double Height;
  size_t BytesPerRow;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  uint64_t v30;
  id v31;
  CGFloat x;
  CGFloat y;
  CGFloat v34;
  CGFloat v35;
  CGImage *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGAffineTransform v41;
  CGAffineTransform transform;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  uint64_t v47;
  void *v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  Width = (double)CGBitmapContextGetWidth(a3);
  Height = (double)CGBitmapContextGetHeight(a3);
  BytesPerRow = CGBitmapContextGetBytesPerRow(a3);
  v13 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", CGBitmapContextGetData(a3), (unint64_t)(Height * (double)BytesPerRow), 0);
  v14 = kCIFormatBGRA8;
  v15 = objc_alloc((Class)CIImage);
  v47 = kCIImageEdgesAreClear;
  v48 = &__kCFBooleanTrue;
  v16 = objc_msgSend(v15, "initWithBitmapData:bytesPerRow:size:format:options:", v13, BytesPerRow, v14, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1), Width, Height);

  memset(&v46, 0, sizeof(v46));
  CGContextGetCTM(&v46, a3);
  v17 = -[CUIShapeEffectStack processedImageFromShapeImage:withScale:invertShadows:](self, "processedImageFromShapeImage:withScale:invertShadows:", v16, v46.d > 0.0, a6);
  -[CUIShapeEffectStack effectPaddingWithScale:](self, "effectPaddingWithScale:", a6);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v16, "extent");
  v27 = v23 + v26;
  v29 = v25 + v28;
  v31 = objc_msgSend((id)objc_opt_class(self, v30), "sharedCIContext");
  memset(&v45, 0, sizeof(v45));
  CGContextGetCTM(&v44, a3);
  CGAffineTransformInvert(&v45, &v44);
  v43 = v45;
  v49.origin.x = v19;
  v49.origin.y = v21;
  v49.size.width = v27;
  v49.size.height = v29;
  v50 = CGRectApplyAffineTransform(v49, &v43);
  x = v50.origin.x;
  y = v50.origin.y;
  v34 = v50.size.width;
  v35 = v50.size.height;
  v36 = (CGImage *)objc_msgSend(v31, "createCGImage:fromRect:", v17, v19, v21, v27, v29);
  CGContextSaveGState(a5);
  memset(&v43, 0, sizeof(v43));
  CGContextGetCTM(&v43, a5);
  v41 = v43;
  CGAffineTransformInvert(&transform, &v41);
  CGContextConcatCTM(a5, &transform);
  v41 = v43;
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = v34;
  v51.size.height = v35;
  v52 = CGRectApplyAffineTransform(v51, &v41);
  v37 = v52.origin.x;
  v38 = v52.origin.y;
  v39 = v52.size.width;
  v40 = v52.size.height;
  if (-[CUIShapeEffectStack outputBlendMode](self, "outputBlendMode"))
    CGContextSetBlendMode(a5, (CGBlendMode)-[CUIShapeEffectStack cgBlendModeForOutputBlending](self, "cgBlendModeForOutputBlending"));
  v53.origin.x = v37;
  v53.origin.y = v38;
  v53.size.width = v39;
  v53.size.height = v40;
  CGContextDrawImage(a5, v53, v36);
  CGContextRestoreGState(a5);
  CGImageRelease(v36);

}

- (void)_drawShadow:(id *)a3 forGlyphs:(const unsigned __int16 *)a4 inContext:(CGContext *)a5 usingFont:(__CTFont *)a6 withAdvances:(const CGSize *)a7 count:(unint64_t)a8
{
  CGColorSpace *SRGB;
  float64x2_t v16;
  float64x2_t v17;
  int8x16_t v18;
  int8x16_t v19;
  float64x2_t v20;
  int8x16_t v21;
  float var4;
  double v23;
  CGColor *v24;
  __n128 v25;
  uint64_t Shadow2;
  uint64_t Style;
  CGPoint TextPosition;
  unint64_t v29;
  int8x16_t v30;
  __n128 v31;
  int8x16_t v32;
  __n128 v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform transform;
  CGAffineTransform v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGFloat components[2];
  float64x2_t v44;

  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v16 = vcvtq_f64_f32(*(float32x2_t *)&a3->var0);
  v17 = vcvtq_f64_f32(*(float32x2_t *)&a3->var2);
  *(float64x2_t *)components = v16;
  v44 = v17;
  v16.f64[0] = a3->var8.x;
  v32 = (int8x16_t)v16;
  v16.f64[0] = a3->var8.y;
  v30 = (int8x16_t)v16;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  CGContextGetBaseCTM(&v40, a5);
  *(double *)v18.i64 = -(*(double *)v30.i64 * *(double *)&v41) - *(double *)&v40 * *(double *)v32.i64;
  *(double *)v19.i64 = -(*(double *)v30.i64 * *((double *)&v41 + 1)) - *((double *)&v40 + 1) * *(double *)v32.i64;
  v20.f64[0] = NAN;
  v20.f64[1] = NAN;
  v21 = (int8x16_t)vnegq_f64(v20);
  v33 = (__n128)vbslq_s8(v21, v32, v18);
  v31 = (__n128)vbslq_s8(v21, v30, v19);
  var4 = a3->var4;
  if (var4 <= 0.0)
  {
    CGContextSetFillColorSpace(a5, SRGB);
    CGContextSetFillColor(a5, components);
    memset(&v39, 0, sizeof(v39));
    CGContextGetCTM(&v39, a5);
    v37 = v39;
    CGAffineTransformInvert(&transform, &v37);
    CGContextConcatCTM(a5, &transform);
    CGContextGetBaseCTM(&v36, a5);
    CGContextConcatCTM(a5, &v36);
    CGContextTranslateCTM(a5, v33.n128_f64[0], v31.n128_f64[0]);
    CGContextGetBaseCTM(&v34, a5);
    CGAffineTransformInvert(&v35, &v34);
    CGContextConcatCTM(a5, &v35);
    v37 = v39;
    CGContextConcatCTM(a5, &v37);
    CGContextTranslateCTM(a5, v33.n128_f64[0], v31.n128_f64[0]);
    TextPosition = CGContextGetTextPosition(a5);
    CTFontDrawGlyphsWithAdvances(a6, a4, a7, a8, a5);
    v37 = v39;
    CGContextSetCTM(a5, &v37);
    CGContextSetTextPosition(a5, TextPosition.x, TextPosition.y);
  }
  else
  {
    v29 = a8;
    v23 = var4;
    v44.f64[1] = a3->var3;
    v24 = CGColorCreate(SRGB, components);
    if (a3->var4 <= 2.0)
      v25.n128_f64[0] = v23 + 0.100000001;
    else
      v25.n128_f64[0] = v23;
    Shadow2 = CGStyleCreateShadow2(v33, v31, v25);
    Style = CGContextGetStyle(a5);
    if (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow"))
    {
      if (Style)
        CTFontDrawGlyphsWithAdvances(a6, a4, a7, v29, a5);
    }
    CGContextSetStyle(a5, Shadow2);
    v44.f64[1] = a3->var3;
    CGContextSetFillColorSpace(a5, SRGB);
    CGContextSetFillColor(a5, components);
    CGStyleRelease(Shadow2);
    CGColorRelease(v24);
  }
}

- (void)drawGlyphs:(const unsigned __int16 *)a3 inContext:(CGContext *)a4 usingFont:(__CTFont *)a5 withAdvances:(const CGSize *)a6 count:(unint64_t)a7 lineHeight:(double)a8 inBounds:(CGRect)a9 atScale:(double)a10
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGContext *v26;
  CGColor *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v31;
  __int128 v32;
  CGPoint var8;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v37;
  __int128 v38;
  CGPoint v39;
  CGFloat v40;
  double MinX;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double MinY;
  CGFloat v47;
  CGFloat v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGSize v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  -[CUIShapeEffectStack scalefactor](self, "scalefactor", a8);
  if (v21 != a10)
    -[CUIShapeEffectStack scaleEffectParametersBy:](self, "scaleEffectParametersBy:", a10);
  if (-[CUITextEffectStack useCoreImageRendering](self, "useCoreImageRendering"))
  {
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    v54 = CGRectInset(v53, -2.0, -2.0);
    v22 = v54.origin.x;
    v23 = v54.origin.y;
    v24 = v54.size.width;
    v25 = v54.size.height;
    v26 = -[CUITextEffectStack newGlyphMaskContextForBounds:fromContext:withScale:](self, "newGlyphMaskContextForBounds:fromContext:withScale:", a4);
    CTFontDrawGlyphsWithAdvances(a5, a3, a6, a7, v26);
    -[CUITextEffectStack drawProcessedMask:atBounds:inContext:withScale:](self, "drawProcessedMask:atBounds:inContext:withScale:", v26, a4, v22, v23, v24, v25, a10);
    CGContextRelease(v26);
  }
  else
  {
    v27 = -[CUITextEffectStack newBackgroundPatternColorWithSize:contentScale:forContext:](self, "newBackgroundPatternColorWithSize:contentScale:forContext:", a4, 10.0, height, a10);
    CGContextSaveGState(a4);
    if (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow"))
    {
      v28 = -[CUIShapeEffectStack engraveShadowCount](self, "engraveShadowCount");
      if (v28)
      {
        v29 = v28;
        v30 = 0;
        do
        {
          v31 = -[CUIShapeEffectStack engraveShadow](self, "engraveShadow");
          v32 = *(_OWORD *)&v31[v30].var0;
          var8 = v31[v30].var8;
          *(_OWORD *)&v51.c = *(_OWORD *)&v31[v30].var4;
          *(CGPoint *)&v51.tx = var8;
          *(_OWORD *)&v51.a = v32;
          -[CUITextEffectStack _drawShadow:forGlyphs:inContext:usingFont:withAdvances:count:](self, "_drawShadow:forGlyphs:inContext:usingFont:withAdvances:count:", &v51, a3, a4, a5, a6, a7);
          ++v30;
          --v29;
        }
        while (v29);
      }
    }
    if (-[CUIShapeEffectStack hasExtraShadow](self, "hasExtraShadow"))
    {
      v34 = -[CUIShapeEffectStack extraShadowCount](self, "extraShadowCount");
      if (v34)
      {
        v35 = v34;
        v36 = 0;
        do
        {
          v37 = -[CUIShapeEffectStack extraShadow](self, "extraShadow");
          v38 = *(_OWORD *)&v37[v36].var0;
          v39 = v37[v36].var8;
          *(_OWORD *)&v51.c = *(_OWORD *)&v37[v36].var4;
          *(CGPoint *)&v51.tx = v39;
          *(_OWORD *)&v51.a = v38;
          -[CUITextEffectStack _drawShadow:forGlyphs:inContext:usingFont:withAdvances:count:](self, "_drawShadow:forGlyphs:inContext:usingFont:withAdvances:count:", &v51, a3, a4, a5, a6, a7);
          ++v36;
          --v35;
        }
        while (v35);
      }
    }
    memset(&v51, 0, sizeof(v51));
    CGContextGetCTM(&v51, a4);
    v40 = v51.d - fabs(v51.d);
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    MinX = CGRectGetMinX(v55);
    v42 = x;
    v43 = y;
    v44 = width;
    v45 = height;
    if (v40 >= 0.0)
      MinY = CGRectGetMinY(*(CGRect *)&v42);
    else
      MinY = CGRectGetMaxY(*(CGRect *)&v42);
    v47 = v51.tx + MinY * v51.c + v51.a * MinX;
    v48 = v51.ty + MinY * v51.d + v51.b * MinX;
    CGContextGetBaseCTM(&v49, a4);
    CGAffineTransformInvert(&v50, &v49);
    v52.height = v50.ty + v48 * v50.d + v50.b * v47;
    v52.width = 0.0;
    CGContextSetPatternPhase(a4, v52);
    CGContextSetFillColorWithColor(a4, v27);
    if (-[CUIShapeEffectStack outputBlendMode](self, "outputBlendMode"))
      CGContextSetBlendMode(a4, (CGBlendMode)-[CUIShapeEffectStack cgBlendModeForOutputBlending](self, "cgBlendModeForOutputBlending"));
    CTFontDrawGlyphsWithAdvances(a5, a3, a6, a7, a4);
    CGColorRelease(v27);
    CGContextRestoreGState(a4);
  }
}

- (void)_drawShadow:(id *)a3 forGlyphs:(const unsigned __int16 *)a4 inContext:(CGContext *)a5 usingFont:(__CTFont *)a6 atPositions:(const CGPoint *)a7 count:(unint64_t)a8
{
  CGColorSpace *SRGB;
  float64x2_t v16;
  double x;
  double y;
  double v19;
  double v20;
  float var4;
  double v22;
  CGColor *v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  uint64_t Shadow2;
  uint64_t Style;
  unint64_t v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform transform;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGFloat components[2];
  float64x2_t v39;

  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v16 = vcvtq_f64_f32(*(float32x2_t *)&a3->var2);
  *(float64x2_t *)components = vcvtq_f64_f32(*(float32x2_t *)&a3->var0);
  v39 = v16;
  x = a3->var8.x;
  y = a3->var8.y;
  memset(&v37, 0, sizeof(v37));
  CGContextGetBaseCTM(&v37, a5);
  memset(&v36, 0, sizeof(v36));
  v35 = v37;
  CGAffineTransformInvert(&v36, &v35);
  v19 = -(y * v36.c) - v36.a * x;
  v20 = -(y * v36.d) - v36.b * x;
  var4 = a3->var4;
  if (var4 <= 0.0)
  {
    CGContextSetFillColorSpace(a5, SRGB);
    CGContextSetFillColor(a5, components);
    memset(&v35, 0, sizeof(v35));
    CGContextGetCTM(&v35, a5);
    v33 = v35;
    CGAffineTransformInvert(&transform, &v33);
    CGContextConcatCTM(a5, &transform);
    CGContextGetBaseCTM(&v32, a5);
    CGContextConcatCTM(a5, &v32);
    CGContextTranslateCTM(a5, v19, v20);
    CGContextGetBaseCTM(&v30, a5);
    CGAffineTransformInvert(&v31, &v30);
    CGContextConcatCTM(a5, &v31);
    v33 = v35;
    CGContextConcatCTM(a5, &v33);
    CTFontDrawGlyphsAtPositions(a6, a4, a7, a8, a5);
    v33 = v35;
    CGContextSetCTM(a5, &v33);
  }
  else
  {
    v29 = a8;
    v22 = var4;
    v39.f64[1] = a3->var3;
    v23 = CGColorCreate(SRGB, components);
    if (a3->var4 <= 2.0)
      v24.n128_f64[0] = v22 + 0.100000001;
    else
      v24.n128_f64[0] = v22;
    v26.n128_f64[0] = v24.n128_f64[0] * v36.c + v36.a * v24.n128_f64[0];
    v24.n128_f64[0] = v19;
    v25.n128_f64[0] = v20;
    Shadow2 = CGStyleCreateShadow2(v24, v25, v26);
    Style = CGContextGetStyle(a5);
    if (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow"))
    {
      if (Style)
        CTFontDrawGlyphsAtPositions(a6, a4, a7, v29, a5);
    }
    CGContextSetStyle(a5, Shadow2);
    v39.f64[1] = a3->var3;
    CGContextSetFillColorSpace(a5, SRGB);
    CGContextSetFillColor(a5, components);
    CGStyleRelease(Shadow2);
    CGColorRelease(v23);
  }
}

- (void)drawGlyphs:(const unsigned __int16 *)a3 inContext:(CGContext *)a4 usingFont:(__CTFont *)a5 atPositions:(const CGPoint *)a6 count:(unint64_t)a7 lineHeight:(double)a8 inBounds:(CGRect)a9 atScale:(double)a10
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  float v21;
  __int16 SymbolicTraits;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGContext *v30;
  CGColor *FillColorAsColor;
  CGColor *v32;
  CGColor *v33;
  CGColorSpace *DeviceGray;
  CGColor *v35;
  float v36;
  float v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v41;
  __int128 v42;
  CGPoint var8;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v47;
  __int128 v48;
  CGPoint v49;
  double MinX;
  CGFloat MinY;
  CGFloat v52;
  CGFloat v53;
  unsigned int FontSmoothingStyle;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform components;
  CGSize v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  -[CUIShapeEffectStack scalefactor](self, "scalefactor", a8);
  if (v21 != a10)
    -[CUIShapeEffectStack scaleEffectParametersBy:](self, "scaleEffectParametersBy:", a10);
  SymbolicTraits = CTFontGetSymbolicTraits(a5);
  if ((SymbolicTraits & 0x2000) != 0)
  {
    -[CUIShapeEffectStack setInnerGradientCount:](self, "setInnerGradientCount:", 0);
    -[CUIShapeEffectStack setInnerShadowCount:](self, "setInnerShadowCount:", 0);
    -[CUIShapeEffectStack setInnerGlowCount:](self, "setInnerGlowCount:", 0);
    -[CUIShapeEffectStack setColorOverlayCount:](self, "setColorOverlayCount:", 0);
    if (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow"))
    {
      v23 = -[CUIShapeEffectStack engraveShadowCount](self, "engraveShadowCount");
      if (v23)
      {
        v24 = v23;
        v25 = 28;
        while (fabs(*(float *)((char *)-[CUIShapeEffectStack engraveShadow](self, "engraveShadow") + v25) + -1.57079633) <= 0.00100000005)
        {
          v25 += 48;
          if (!--v24)
            goto LABEL_9;
        }
      }
      else
      {
LABEL_9:
        -[CUIShapeEffectStack setEngraveShadowCount:](self, "setEngraveShadowCount:", 0);
      }
    }
    -[CUIShapeEffectStack _updateRenderStrategyFromEffect:](self, "_updateRenderStrategyFromEffect:", 1148350320);
  }
  if (-[CUITextEffectStack useCoreImageRendering](self, "useCoreImageRendering"))
  {
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    v60 = CGRectInset(v59, -2.0, -2.0);
    v26 = v60.origin.x;
    v27 = v60.origin.y;
    v28 = v60.size.width;
    v29 = v60.size.height;
    v30 = -[CUITextEffectStack newGlyphMaskContextForBounds:fromContext:withScale:](self, "newGlyphMaskContextForBounds:fromContext:withScale:", a4);
    CTFontDrawGlyphsAtPositions(a5, a3, a6, a7, v30);
    -[CUITextEffectStack drawProcessedMask:atBounds:inContext:withScale:](self, "drawProcessedMask:atBounds:inContext:withScale:", v30, a4, v26, v27, v28, v29, a10);
    CGContextRelease(v30);
    if ((SymbolicTraits & 0x2000) != 0)
      CTFontDrawGlyphs(a5, a3, a6, a7, a4);
  }
  else
  {
    if (-[CUIShapeEffectStack hasInnerGradient](self, "hasInnerGradient"))
    {
      FillColorAsColor = -[CUITextEffectStack newBackgroundPatternColorWithSize:contentScale:forContext:](self, "newBackgroundPatternColorWithSize:contentScale:forContext:", a4, 10.0, height, a10);
    }
    else
    {
      FillColorAsColor = (CGColor *)CGContextGetFillColorAsColor(a4);
      CGColorRetain(FillColorAsColor);
      if (-[CUIShapeEffectStack hasColorOverlay](self, "hasColorOverlay"))
      {
        v32 = -[CUIShapeEffectStack newColorByProcessingColor:](self, "newColorByProcessingColor:", FillColorAsColor);
        if (v32)
        {
          v33 = v32;
          CGColorRelease(FillColorAsColor);
          FillColorAsColor = v33;
        }
      }
    }
    CGContextSaveGState(a4);
    if (_CUIDebugUseSimplifiedTextAntialiasing())
    {
      CGContextSetShouldSmoothFonts(a4, 0);
      CGContextSetFontAntialiasingStyle(a4, 256);
      DeviceGray = CGColorSpaceCreateDeviceGray();
      *(_OWORD *)&components.a = xmmword_19EC75990;
      v35 = CGColorCreate(DeviceGray, &components.a);
      CGContextSetFontSmoothingBackgroundColor(a4, v35);
      CGColorRelease(v35);
      CGColorSpaceRelease(DeviceGray);
    }
    -[CUIShapeEffectStack outputOpacity](self, "outputOpacity");
    if (v36 < 1.0)
    {
      -[CUIShapeEffectStack outputOpacity](self, "outputOpacity");
      CGContextSetAlpha(a4, v37);
    }
    if (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow"))
    {
      v38 = -[CUIShapeEffectStack engraveShadowCount](self, "engraveShadowCount");
      if (v38)
      {
        v39 = v38;
        v40 = 0;
        do
        {
          v41 = -[CUIShapeEffectStack engraveShadow](self, "engraveShadow");
          v42 = *(_OWORD *)&v41[v40].var0;
          var8 = v41[v40].var8;
          *(_OWORD *)&components.c = *(_OWORD *)&v41[v40].var4;
          *(CGPoint *)&components.tx = var8;
          *(_OWORD *)&components.a = v42;
          -[CUITextEffectStack _drawShadow:forGlyphs:inContext:usingFont:atPositions:count:](self, "_drawShadow:forGlyphs:inContext:usingFont:atPositions:count:", &components, a3, a4, a5, a6, a7);
          ++v40;
          --v39;
        }
        while (v39);
      }
    }
    if (-[CUIShapeEffectStack hasExtraShadow](self, "hasExtraShadow"))
    {
      v44 = -[CUIShapeEffectStack extraShadowCount](self, "extraShadowCount");
      if (v44)
      {
        v45 = v44;
        v46 = 0;
        do
        {
          v47 = -[CUIShapeEffectStack extraShadow](self, "extraShadow");
          v48 = *(_OWORD *)&v47[v46].var0;
          v49 = v47[v46].var8;
          *(_OWORD *)&components.c = *(_OWORD *)&v47[v46].var4;
          *(CGPoint *)&components.tx = v49;
          *(_OWORD *)&components.a = v48;
          -[CUITextEffectStack _drawShadow:forGlyphs:inContext:usingFont:atPositions:count:](self, "_drawShadow:forGlyphs:inContext:usingFont:atPositions:count:", &components, a3, a4, a5, a6, a7);
          ++v46;
          --v45;
        }
        while (v45);
      }
    }
    memset(&components, 0, sizeof(components));
    CGContextGetCTM(&components, a4);
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    MinX = CGRectGetMinX(v61);
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    MinY = CGRectGetMinY(v62);
    v52 = components.tx + MinY * components.c + components.a * MinX;
    v53 = components.ty + MinY * components.d + components.b * MinX;
    CGContextGetBaseCTM(&v55, a4);
    CGAffineTransformInvert(&v56, &v55);
    v58.height = v56.ty + v53 * v56.d + v56.b * v52;
    v58.width = 0.0;
    CGContextSetPatternPhase(a4, v58);
    CGContextSetFillColorWithColor(a4, FillColorAsColor);
    if (-[CUIShapeEffectStack outputBlendMode](self, "outputBlendMode")
      && (CGContextSetBlendMode(a4, (CGBlendMode)-[CUIShapeEffectStack cgBlendModeForOutputBlending](self, "cgBlendModeForOutputBlending")), FontSmoothingStyle = CGContextGetFontSmoothingStyle(a4), CGContextGetShouldSmoothFonts(a4))&& FontSmoothingStyle >= 0x11)
    {
      CGContextBeginTransparencyLayer(a4, 0);
      CTFontDrawGlyphsAtPositions(a5, a3, a6, a7, a4);
      CGContextEndTransparencyLayer(a4);
    }
    else
    {
      CTFontDrawGlyphsAtPositions(a5, a3, a6, a7, a4);
    }
    CGColorRelease(FillColorAsColor);
    CGContextRestoreGState(a4);
  }
}

- (void)_drawShadow:(id *)a3 usingQuartz:(id)a4 inContext:(CGContext *)a5
{
  CGColorSpace *SRGB;
  float64x2_t v10;
  double x;
  double y;
  double v13;
  double v14;
  double var4;
  CGColor *v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  BOOL v20;
  uint64_t Shadow2;
  uint64_t Style;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGFloat components[2];
  double var2;
  double var3;

  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v10 = vcvtq_f64_f32(*(float32x2_t *)&a3->var0);
  var2 = a3->var2;
  x = a3->var8.x;
  y = a3->var8.y;
  *(float64x2_t *)components = v10;
  memset(&v25, 0, sizeof(v25));
  CGContextGetBaseCTM(&v25, a5);
  v23 = v25;
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformInvert(&v24, &v23);
  v13 = -(y * v24.c) - v24.a * x;
  v14 = -(y * v24.d) - v24.b * x;
  var4 = a3->var4;
  var3 = a3->var3;
  v16 = CGColorCreate(SRGB, components);
  v18.n128_u32[0] = LODWORD(a3->var4);
  v19.n128_f64[0] = var4 + 0.100000001;
  if (v18.n128_f32[0] > 2.0)
    v19.n128_f64[0] = var4;
  v20 = v18.n128_f32[0] == 0.0;
  v18.n128_u64[0] = 0;
  if (!v20)
    v18.n128_f64[0] = v19.n128_f64[0];
  v17.n128_f64[0] = v24.c * v18.n128_f64[0] + v24.a * v18.n128_f64[0];
  v18.n128_f64[0] = v13;
  v19.n128_f64[0] = v14;
  Shadow2 = CGStyleCreateShadow2(v18, v19, v17);
  Style = CGContextGetStyle(a5);
  if (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow") && Style)
    (*((void (**)(id, CGContext *))a4 + 2))(a4, a5);
  CGContextSetStyle(a5, Shadow2);
  var3 = a3->var3;
  CGContextSetFillColorSpace(a5, SRGB);
  CGContextSetFillColor(a5, components);
  CGContextSetStrokeColorSpace(a5, SRGB);
  CGContextSetStrokeColor(a5, components);
  CGStyleRelease(Shadow2);
  CGColorRelease(v16);
}

- (void)drawUsingQuartz:(id)a3 inContext:(CGContext *)a4 inBounds:(CGRect)a5 atScale:(double)a6
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v14;
  double v15;
  double v16;
  double v17;
  CGContext *v18;
  CGColor *FillColorAsColor;
  CGColor *v20;
  CGColor *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v25;
  __int128 v26;
  CGPoint var8;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v31;
  __int128 v32;
  CGPoint v33;
  double MinX;
  CGFloat MinY;
  CGFloat v36;
  CGFloat v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGSize v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  if (-[CUITextEffectStack useCoreImageRendering](self, "useCoreImageRendering"))
  {
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v43 = CGRectInset(v42, -2.0, -2.0);
    v14 = v43.origin.x;
    v15 = v43.origin.y;
    v16 = v43.size.width;
    v17 = v43.size.height;
    v18 = -[CUITextEffectStack newGlyphMaskContextForBounds:fromContext:withScale:](self, "newGlyphMaskContextForBounds:fromContext:withScale:", a4);
    (*((void (**)(id, CGContext *))a3 + 2))(a3, v18);
    -[CUITextEffectStack drawProcessedMask:atBounds:inContext:withScale:](self, "drawProcessedMask:atBounds:inContext:withScale:", v18, a4, v14, v15, v16, v17, a6);
    CGContextBeginPath(a4);
    CGContextRelease(v18);
  }
  else
  {
    if (-[CUIShapeEffectStack hasInnerGradient](self, "hasInnerGradient"))
    {
      FillColorAsColor = -[CUITextEffectStack newBackgroundPatternColorWithSize:contentScale:forContext:](self, "newBackgroundPatternColorWithSize:contentScale:forContext:", a4, 10.0, height, a6);
    }
    else
    {
      FillColorAsColor = (CGColor *)CGContextGetFillColorAsColor(a4);
      CGColorRetain(FillColorAsColor);
      if (-[CUIShapeEffectStack hasColorOverlay](self, "hasColorOverlay"))
      {
        v20 = -[CUIShapeEffectStack newColorByProcessingColor:](self, "newColorByProcessingColor:", FillColorAsColor);
        if (v20)
        {
          v21 = v20;
          CGColorRelease(FillColorAsColor);
          FillColorAsColor = v21;
        }
      }
    }
    CGContextSaveGState(a4);
    if (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow"))
    {
      v22 = -[CUIShapeEffectStack engraveShadowCount](self, "engraveShadowCount");
      if (v22)
      {
        v23 = v22;
        v24 = 0;
        do
        {
          v25 = -[CUIShapeEffectStack engraveShadow](self, "engraveShadow");
          v26 = *(_OWORD *)&v25[v24].var0;
          var8 = v25[v24].var8;
          *(_OWORD *)&v40.c = *(_OWORD *)&v25[v24].var4;
          *(CGPoint *)&v40.tx = var8;
          *(_OWORD *)&v40.a = v26;
          -[CUITextEffectStack _drawShadow:usingQuartz:inContext:](self, "_drawShadow:usingQuartz:inContext:", &v40, a3, a4);
          ++v24;
          --v23;
        }
        while (v23);
      }
    }
    if (-[CUIShapeEffectStack hasExtraShadow](self, "hasExtraShadow"))
    {
      v28 = -[CUIShapeEffectStack extraShadowCount](self, "extraShadowCount");
      if (v28)
      {
        v29 = v28;
        v30 = 0;
        do
        {
          v31 = -[CUIShapeEffectStack extraShadow](self, "extraShadow");
          v32 = *(_OWORD *)&v31[v30].var0;
          v33 = v31[v30].var8;
          *(_OWORD *)&v40.c = *(_OWORD *)&v31[v30].var4;
          *(CGPoint *)&v40.tx = v33;
          *(_OWORD *)&v40.a = v32;
          -[CUITextEffectStack _drawShadow:usingQuartz:inContext:](self, "_drawShadow:usingQuartz:inContext:", &v40, a3, a4);
          ++v30;
          --v29;
        }
        while (v29);
      }
    }
    memset(&v40, 0, sizeof(v40));
    CGContextGetCTM(&v40, a4);
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    MinX = CGRectGetMinX(v44);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MinY = CGRectGetMinY(v45);
    v36 = v40.tx + MinY * v40.c + v40.a * MinX;
    v37 = v40.ty + MinY * v40.d + v40.b * MinX;
    CGContextGetBaseCTM(&v38, a4);
    CGAffineTransformInvert(&v39, &v38);
    v41.height = v39.ty + v37 * v39.d + v39.b * v36;
    v41.width = 0.0;
    CGContextSetPatternPhase(a4, v41);
    CGContextSetFillColorWithColor(a4, FillColorAsColor);
    CGContextSetStrokeColorWithColor(a4, FillColorAsColor);
    if (-[CUIShapeEffectStack outputBlendMode](self, "outputBlendMode"))
      CGContextSetBlendMode(a4, (CGBlendMode)-[CUIShapeEffectStack cgBlendModeForOutputBlending](self, "cgBlendModeForOutputBlending"));
    (*((void (**)(id, CGContext *))a3 + 2))(a3, a4);
    CGColorRelease(FillColorAsColor);
    CGContextRestoreGState(a4);
  }
}

@end
