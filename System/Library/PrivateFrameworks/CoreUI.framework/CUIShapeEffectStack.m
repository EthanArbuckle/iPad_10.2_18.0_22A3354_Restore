@implementation CUIShapeEffectStack

- (void)dealloc
{
  objc_super v3;

  -[CUIShapeEffectStack _cleanupEffectSettings](self, "_cleanupEffectSettings");
  v3.receiver = self;
  v3.super_class = (Class)CUIShapeEffectStack;
  -[CUIShapeEffectStack dealloc](&v3, sel_dealloc);
}

- (void)_cleanupEffectSettings
{
  $69725AE9E2C336799B3330C9F2B37222 *hueSaturation;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *colorOverlay;
  $45A57A840939F8DA3264B2B8C70AC12D *innerGradient;
  $B9DFBB3EC52729005FFFDFFACDA0AF43 *innerGlow;
  $C07A9C4F79504F2E326AD5E2BA2D7579 *innerShadow;
  $9A3F6720D51884C1BD061C340F5007EE *outerGlow;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *engraveShadow;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *extraShadow;
  $E0EE018EFC1CA26785F52D94F92F8253 *emboss;

  self->_hueSaturationCount = 0;
  hueSaturation = self->_hueSaturation;
  if (hueSaturation)
  {
    free(hueSaturation);
    self->_hueSaturation = 0;
  }
  self->_colorOverlayCount = 0;
  colorOverlay = self->_colorOverlay;
  if (colorOverlay)
  {
    free(colorOverlay);
    self->_colorOverlay = 0;
  }
  self->_innerGradientCount = 0;
  innerGradient = self->_innerGradient;
  if (innerGradient)
  {
    free(innerGradient);
    self->_innerGradient = 0;
  }
  self->_innerGlowCount = 0;
  innerGlow = self->_innerGlow;
  if (innerGlow)
  {
    free(innerGlow);
    self->_innerGlow = 0;
  }
  self->_innerShadowCount = 0;
  innerShadow = self->_innerShadow;
  if (innerShadow)
  {
    free(innerShadow);
    self->_innerShadow = 0;
  }
  self->_outerGlowCount = 0;
  outerGlow = self->_outerGlow;
  if (outerGlow)
  {
    free(outerGlow);
    self->_outerGlow = 0;
  }
  self->_engraveShadowCount = 0;
  engraveShadow = self->_engraveShadow;
  if (engraveShadow)
  {
    free(engraveShadow);
    self->_engraveShadow = 0;
  }
  self->_extraShadowCount = 0;
  extraShadow = self->_extraShadow;
  if (extraShadow)
  {
    free(extraShadow);
    self->_extraShadow = 0;
  }
  self->_bevelEmbossCount = 0;
  emboss = self->_emboss;
  if (emboss)
  {
    free(emboss);
    self->_emboss = 0;
  }
}

+ (id)preferredCIContextOptions
{
  if (GetShapeEffectCIContextOptions_onceToken != -1)
    dispatch_once(&GetShapeEffectCIContextOptions_onceToken, &__block_literal_global_19);
  return (id)gCIContextOptions;
}

+ (id)sharedCIContext
{
  if (sharedCIContext_gCIContextLock != -1)
    dispatch_once(&sharedCIContext_gCIContextLock, &__block_literal_global_6_0);
  return (id)gSharedCIContext;
}

CIContext *__38__CUIShapeEffectStack_sharedCIContext__block_invoke(uint64_t a1, uint64_t a2)
{
  CIContext *result;

  result = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", objc_msgSend((id)objc_opt_class(CUIShapeEffectStack, a2), "preferredCIContextOptions"));
  gSharedCIContext = (uint64_t)result;
  return result;
}

- (void)_setShapeOpacityFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  float v5;

  v5 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, a4));
  self->_shapeOpacity = v5;
}

- (void)_setOutputOpacityFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  float v5;

  v5 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, a4));
  self->_outputOpacity = v5;
}

- (void)_setColorFillAtIndex:(unint64_t)a3 FromPreset:(id)a4 index:(unsigned int)a5
{
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *colorOverlay;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *v7;
  uint64_t v8;
  int8x8_t v9;
  float v10;

  if (self->_colorOverlayCount > a3)
  {
    colorOverlay = self->_colorOverlay;
    if (colorOverlay)
    {
      v7 = &colorOverlay[a3];
      v8 = a5;
      v7->var0 = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 7, a5);
      v9.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 0, v8);
      v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
      *(float32x2_t *)&v7->var1 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v7->var3 = (float)v9.u8[2] / 255.0;
      v10 = COERCE_DOUBLE(objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 2, v8));
      v7->var4 = v10;
      v7->var5 = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 10, v8) == 1;
    }
  }
}

- (BOOL)hasColorOverlay
{
  unint64_t colorOverlayCount;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *colorOverlay;
  float *p_var4;
  uint64_t v6;
  unint64_t v7;
  float v8;

  colorOverlayCount = self->_colorOverlayCount;
  if (!colorOverlayCount)
    return 0;
  colorOverlay = self->_colorOverlay;
  if (colorOverlay->var4 > 0.01)
    return 1;
  p_var4 = &colorOverlay[1].var4;
  v6 = 1;
  do
  {
    v7 = v6;
    if (colorOverlayCount == v6)
      break;
    v8 = *p_var4;
    p_var4 += 6;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < colorOverlayCount;
}

- (float)colorOverlayOpacity
{
  unint64_t colorOverlayCount;
  float *i;
  float result;

  colorOverlayCount = self->_colorOverlayCount;
  if (!colorOverlayCount)
    return 0.0;
  for (i = &self->_colorOverlay->var4; ; i += 6)
  {
    result = *i;
    if (*i > 0.0)
      break;
    if (!--colorOverlayCount)
      return 0.0;
  }
  return result;
}

- (void)_setInteriorGradientAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  $45A57A840939F8DA3264B2B8C70AC12D *innerGradient;
  $45A57A840939F8DA3264B2B8C70AC12D *v7;
  uint64_t v8;
  int8x8_t v9;
  float32x2_t v10;
  int8x8_t v11;
  double v12;
  float v13;
  float v14;

  if (self->_innerGradientCount > a3)
  {
    innerGradient = self->_innerGradient;
    if (innerGradient)
    {
      v7 = &innerGradient[a3];
      v8 = a5;
      v7->var0 = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 7, a5);
      v9.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 0, v8);
      v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
      v10 = (float32x2_t)vdup_n_s32(0x437F0000u);
      *(float32x2_t *)&v7->var1 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), v10);
      v7->var3 = (float)v9.u8[2] / 255.0;
      v11.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 1, v8);
      v11.i32[1] = (unsigned __int32)v11.i32[0] >> 8;
      *(float32x2_t *)&v7->var4 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v11, (int8x8_t)0xFF000000FFLL)), v10);
      v7->var6 = (float)v11.u8[2] / 255.0;
      v12 = COERCE_DOUBLE(objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 2, v8));
      v14 = 1.0;
      if (v12 != 0.0)
      {
        v13 = v12;
        v14 = v13;
      }
      v7->var7 = v14;
    }
  }
}

- (BOOL)hasInnerGradient
{
  unint64_t innerGradientCount;
  $45A57A840939F8DA3264B2B8C70AC12D *innerGradient;
  float *p_var7;
  uint64_t v6;
  unint64_t v7;
  float v8;

  innerGradientCount = self->_innerGradientCount;
  if (!innerGradientCount)
    return 0;
  innerGradient = self->_innerGradient;
  if (innerGradient->var7 > 0.01)
    return 1;
  p_var7 = &innerGradient[1].var7;
  v6 = 1;
  do
  {
    v7 = v6;
    if (innerGradientCount == v6)
      break;
    v8 = *p_var7;
    p_var7 += 8;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < innerGradientCount;
}

- (float)innerGradientOpacity
{
  unint64_t innerGradientCount;
  float *i;
  float result;

  innerGradientCount = self->_innerGradientCount;
  if (!innerGradientCount)
    return 0.0;
  for (i = &self->_innerGradient->var7; ; i += 8)
  {
    result = *i;
    if (*i > 0.0)
      break;
    if (!--innerGradientCount)
      return 0.0;
  }
  return result;
}

- (void)_setInnerGlowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  $B9DFBB3EC52729005FFFDFFACDA0AF43 *innerGlow;
  $B9DFBB3EC52729005FFFDFFACDA0AF43 *v7;
  uint64_t v8;
  int8x8_t v9;
  float v10;

  if (self->_innerGlowCount > a3)
  {
    innerGlow = self->_innerGlow;
    if (innerGlow)
    {
      v7 = &innerGlow[a3];
      v8 = a5;
      v7->var0 = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 7, a5);
      v9.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 0, v8);
      v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
      *(float32x2_t *)&v7->var1 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v7->var3 = (float)v9.u8[2] / 255.0;
      v10 = COERCE_DOUBLE(objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 2, v8));
      v7->var4 = v10;
      v7->var5 = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 4, v8);
    }
  }
}

- (BOOL)hasInnerGlow
{
  unint64_t innerGlowCount;
  $B9DFBB3EC52729005FFFDFFACDA0AF43 *innerGlow;
  float *p_var4;
  uint64_t v6;
  unint64_t v7;
  float v8;

  innerGlowCount = self->_innerGlowCount;
  if (!innerGlowCount)
    return 0;
  innerGlow = self->_innerGlow;
  if (innerGlow->var4 > 0.01)
    return 1;
  p_var4 = &innerGlow[1].var4;
  v6 = 1;
  do
  {
    v7 = v6;
    if (innerGlowCount == v6)
      break;
    v8 = *p_var4;
    p_var4 += 6;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < innerGlowCount;
}

- (void)_setInnerShadowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  $C07A9C4F79504F2E326AD5E2BA2D7579 *innerShadow;
  $C07A9C4F79504F2E326AD5E2BA2D7579 *v8;
  uint64_t v9;
  int8x8_t v10;
  float v11;
  float v12;
  __float2 v13;
  float var6;
  CGFloat v15;
  double *p_x;
  double v17;
  double v18;
  double v19;

  if (self->_innerShadowCount > a3)
  {
    innerShadow = self->_innerShadow;
    if (innerShadow)
    {
      v8 = &innerShadow[a3];
      v9 = a5;
      v8->var0 = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 7, a5);
      v10.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 0, v9);
      v10.i32[1] = (unsigned __int32)v10.i32[0] >> 8;
      *(float32x2_t *)&v8->var1 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v10, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v8->var3 = (float)v10.u8[2] / 255.0;
      v11 = COERCE_DOUBLE(objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 2, v9));
      v8->var5 = v11;
      v8->var4 = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 4, v9);
      v8->var6 = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 5, v9);
      v12 = (double)(__int16)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 6, v9) * 0.0174532925;
      v13 = __sincosf_stret(v12);
      var6 = v8->var6;
      v15 = (float)(var6 * v13.__cosval);
      v8->var8.x = v15;
      p_x = &v8->var8.x;
      *((float *)p_x - 1) = v12;
      v17 = (float)(var6 * v13.__sinval);
      p_x[1] = v17;
      v18 = rint(v15);
      if (vabdd_f64(v18, v15) < 0.001)
        *p_x = v18;
      v19 = rint(v17);
      if (vabdd_f64(v19, v17) < 0.001)
        innerShadow[a3].var8.y = v19;
    }
  }
}

- (BOOL)hasInnerShadow
{
  unint64_t innerShadowCount;
  $C07A9C4F79504F2E326AD5E2BA2D7579 *innerShadow;
  float *p_var5;
  uint64_t v6;
  unint64_t v7;
  float v8;

  innerShadowCount = self->_innerShadowCount;
  if (!innerShadowCount)
    return 0;
  innerShadow = self->_innerShadow;
  if (innerShadow->var5 > 0.01)
    return 1;
  p_var5 = &innerShadow[1].var5;
  v6 = 1;
  do
  {
    v7 = v6;
    if (innerShadowCount == v6)
      break;
    v8 = *p_var5;
    p_var5 += 12;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < innerShadowCount;
}

- (void)_setOuterGlowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  $9A3F6720D51884C1BD061C340F5007EE *outerGlow;
  float32x2_t *v7;
  uint64_t v8;
  int8x8_t v9;
  float32_t v10;

  if (self->_outerGlowCount > a3)
  {
    outerGlow = self->_outerGlow;
    if (outerGlow)
    {
      v7 = (float32x2_t *)&outerGlow[a3];
      v8 = a5;
      v9.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 0, a5);
      v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
      *v7 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v7[1].f32[0] = (float)v9.u8[2] / 255.0;
      v10 = COERCE_DOUBLE(objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 2, v8));
      v7[1].f32[1] = v10;
      v7[2].f32[0] = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 4, v8);
      v7[2].f32[1] = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 9, v8);
    }
  }
}

- (BOOL)hasOuterGlow
{
  unint64_t outerGlowCount;
  $9A3F6720D51884C1BD061C340F5007EE *outerGlow;
  float *p_var3;
  uint64_t v6;
  unint64_t v7;
  float v8;

  outerGlowCount = self->_outerGlowCount;
  if (!outerGlowCount)
    return 0;
  outerGlow = self->_outerGlow;
  if (outerGlow->var3 > 0.01)
    return 1;
  p_var3 = &outerGlow[1].var3;
  v6 = 1;
  do
  {
    v7 = v6;
    if (outerGlowCount == v6)
      break;
    v8 = *p_var3;
    p_var3 += 6;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < outerGlowCount;
}

- (void)_setEngraveShadowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  $1DE4C1FD5A12EFAE99762DD70974AA56 *engraveShadow;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v8;
  uint64_t v9;
  int8x8_t v10;
  float v11;
  float v12;
  __float2 v13;
  float var6;
  CGFloat v15;
  double *p_x;
  double v17;
  double v18;
  double v19;

  if (self->_engraveShadowCount > a3)
  {
    engraveShadow = self->_engraveShadow;
    if (engraveShadow)
    {
      v8 = &engraveShadow[a3];
      v9 = a5;
      v10.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 0, a5);
      v10.i32[1] = (unsigned __int32)v10.i32[0] >> 8;
      *(float32x2_t *)&v8->var0 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v10, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v8->var2 = (float)v10.u8[2] / 255.0;
      v11 = COERCE_DOUBLE(objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 2, v9));
      v8->var3 = v11;
      v8->var4 = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 4, v9);
      v8->var5 = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 9, v9);
      v8->var6 = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 5, v9);
      v12 = (double)(__int16)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 6, v9) * 0.0174532925;
      v13 = __sincosf_stret(v12);
      var6 = v8->var6;
      v15 = (float)(var6 * v13.__cosval);
      v8->var8.x = v15;
      p_x = &v8->var8.x;
      *((float *)p_x - 1) = v12;
      v17 = (float)(var6 * v13.__sinval);
      p_x[1] = v17;
      v18 = rint(v15);
      if (vabdd_f64(v18, v15) < 0.001)
        *p_x = v18;
      v19 = rint(v17);
      if (vabdd_f64(v19, v17) < 0.001)
        engraveShadow[a3].var8.y = v19;
    }
  }
}

- (BOOL)hasEngraveShadow
{
  unint64_t engraveShadowCount;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *engraveShadow;
  float *p_var3;
  uint64_t v6;
  unint64_t v7;
  float v8;

  engraveShadowCount = self->_engraveShadowCount;
  if (!engraveShadowCount)
    return 0;
  engraveShadow = self->_engraveShadow;
  if (engraveShadow->var3 > 0.01)
    return 1;
  p_var3 = &engraveShadow[1].var3;
  v6 = 1;
  do
  {
    v7 = v6;
    if (engraveShadowCount == v6)
      break;
    v8 = *p_var3;
    p_var3 += 12;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < engraveShadowCount;
}

- (void)_setExtraShadowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  $1DE4C1FD5A12EFAE99762DD70974AA56 *extraShadow;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v8;
  uint64_t v9;
  int8x8_t v10;
  float v11;
  float v12;
  __float2 v13;
  float var6;
  CGFloat v15;
  double *p_x;
  double v17;
  double v18;
  double v19;

  if (self->_extraShadowCount > a3)
  {
    extraShadow = self->_extraShadow;
    if (extraShadow)
    {
      v8 = &extraShadow[a3];
      v9 = a5;
      v10.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 0, a5);
      v10.i32[1] = (unsigned __int32)v10.i32[0] >> 8;
      *(float32x2_t *)&v8->var0 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v10, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v8->var2 = (float)v10.u8[2] / 255.0;
      v11 = COERCE_DOUBLE(objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 2, v9));
      v8->var3 = v11;
      v8->var4 = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 4, v9);
      v8->var5 = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 9, v9);
      v8->var6 = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 5, v9);
      v12 = (double)(__int16)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 6, v9) * 0.0174532925;
      v13 = __sincosf_stret(v12);
      var6 = v8->var6;
      v15 = (float)(var6 * v13.__cosval);
      v8->var8.x = v15;
      p_x = &v8->var8.x;
      *((float *)p_x - 1) = v12;
      v17 = (float)(var6 * v13.__sinval);
      p_x[1] = v17;
      v18 = rint(v15);
      if (vabdd_f64(v18, v15) < 0.001)
        *p_x = v18;
      v19 = rint(v17);
      if (vabdd_f64(v19, v17) < 0.001)
        extraShadow[a3].var8.y = v19;
    }
  }
}

- (BOOL)hasExtraShadow
{
  unint64_t extraShadowCount;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *extraShadow;
  float *p_var3;
  uint64_t v6;
  unint64_t v7;
  float v8;

  extraShadowCount = self->_extraShadowCount;
  if (!extraShadowCount)
    return 0;
  extraShadow = self->_extraShadow;
  if (extraShadow->var3 > 0.01)
    return 1;
  p_var3 = &extraShadow[1].var3;
  v6 = 1;
  do
  {
    v7 = v6;
    if (extraShadowCount == v6)
      break;
    v8 = *p_var3;
    p_var3 += 12;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < extraShadowCount;
}

- (void)_setBevelEmbossAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  $E0EE018EFC1CA26785F52D94F92F8253 *emboss;
  float32x2_t *v7;
  uint64_t v8;
  int8x8_t v9;
  float32x2_t v10;
  float32_t v11;
  int8x8_t v12;
  float32_t v13;

  if (self->_bevelEmbossCount > a3)
  {
    emboss = self->_emboss;
    if (emboss)
    {
      v7 = (float32x2_t *)&emboss[a3];
      v8 = a5;
      v7->f32[0] = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 4, a5);
      v7->f32[1] = (float)(unint64_t)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 8, v8);
      v7[1] = (float32x2_t)0x41F0000042B40000;
      v9.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 0, v8);
      v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
      v10 = (float32x2_t)vdup_n_s32(0x437F0000u);
      v7[2] = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), v10);
      v7[3].f32[0] = (float)v9.u8[2] / 255.0;
      v11 = COERCE_DOUBLE(objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 2, v8));
      v7[3].f32[1] = v11;
      v12.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 1, v8);
      v12.i32[1] = (unsigned __int32)v12.i32[0] >> 8;
      v7[4] = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v12, (int8x8_t)0xFF000000FFLL)), v10);
      v7[5].f32[0] = (float)v12.u8[2] / 255.0;
      v13 = COERCE_DOUBLE(objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 3, v8));
      v7[5].f32[1] = v13;
      v7[6].i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 11, v8);
    }
  }
}

- (BOOL)hasBevelEmboss
{
  return self->_bevelEmbossCount != 0;
}

- (BOOL)hasEffects
{
  if (-[CUIShapeEffectStack hasHueSaturation](self, "hasHueSaturation")
    || !self->_bypassColorFills
    && (-[CUIShapeEffectStack hasColorOverlay](self, "hasColorOverlay")
     || -[CUIShapeEffectStack hasInnerGradient](self, "hasInnerGradient"))
    || -[CUIShapeEffectStack hasInnerGlow](self, "hasInnerGlow")
    || -[CUIShapeEffectStack hasInnerShadow](self, "hasInnerShadow")
    || -[CUIShapeEffectStack hasOuterGlow](self, "hasOuterGlow")
    || -[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow")
    || -[CUIShapeEffectStack hasExtraShadow](self, "hasExtraShadow"))
  {
    return 1;
  }
  else
  {
    return -[CUIShapeEffectStack hasBevelEmboss](self, "hasBevelEmboss");
  }
}

- (void)_setHueSaturationAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  float32x2_t *v6;
  uint64_t v7;
  float32_t v8;
  float32_t v9;
  int8x8_t v10;

  v6 = (float32x2_t *)&self->_hueSaturation[a3];
  v7 = a5;
  v8 = (double)(__int16)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 6, a5) * 0.0174532925;
  v6->f32[0] = v8;
  v9 = (double)(__int16)objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 5, v7) * 0.0174532925;
  v6->f32[1] = v9;
  v10.i32[0] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 0, v7);
  v10.i32[1] = (unsigned __int32)v10.i32[0] >> 8;
  v6[1] = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v10, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
  v6[2].f32[0] = (float)v10.u8[2] / 255.0;
  v6[2].i8[4] = objc_msgSend(a4, "valueForParameter:inEffectAtIndex:", 10, v7) == 1;
}

- (BOOL)hasHueSaturation
{
  return self->_hueSaturationCount != 0;
}

- (BOOL)_precompositeColorOverlayInnerGradient
{
  return 0;
}

- (void)_updateRenderStrategyFromEffect:(unsigned int)a3
{
  double v3;
  int v5;
  unint64_t innerGlowCount;
  unsigned int v7;
  float *p_var5;
  float v9;
  unint64_t colorOverlayCount;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *colorOverlay;
  unsigned int v12;
  unsigned int var0;
  unint64_t outerGlowCount;
  float *v16;
  float v17;
  float v18;
  float v19;
  unint64_t innerShadowCount;
  float *p_var4;
  float v23;
  unint64_t engraveShadowCount;
  float *v25;
  float v26;
  float v27;
  unint64_t bevelEmbossCount;
  $E0EE018EFC1CA26785F52D94F92F8253 *emboss;
  float v31;
  unint64_t extraShadowCount;
  float *v33;
  float v34;
  float v35;
  unint64_t v37;
  $B9DFBB3EC52729005FFFDFFACDA0AF43 *innerGlow;
  unsigned int v39;
  unsigned int v40;
  unint64_t v42;
  $C07A9C4F79504F2E326AD5E2BA2D7579 *innerShadow;
  unsigned int v44;
  unsigned int v45;

  if (self->_renderStrategy == 1)
    return;
  if ((int)a3 <= 1215653202)
  {
    if ((int)a3 <= 1164796530)
    {
      if (a3 != 1131375730)
      {
        v5 = 1148350320;
LABEL_17:
        if (a3 != v5)
          return;
        goto LABEL_18;
      }
    }
    else
    {
      if (a3 == 1164796531 || a3 == 1180787813)
        goto LABEL_92;
      if (a3 != 1198678372)
        return;
    }
    -[CUIShapeEffectStack _precompositeColorOverlayInnerGradient](self, "_precompositeColorOverlayInnerGradient");
    colorOverlayCount = self->_colorOverlayCount;
    if (!colorOverlayCount)
      return;
    colorOverlay = self->_colorOverlay;
    while (1)
    {
      var0 = colorOverlay->var0;
      ++colorOverlay;
      v12 = var0;
      if (var0 != 1852797549 && v12 != 0)
        break;
      if (!--colorOverlayCount)
        return;
    }
    goto LABEL_92;
  }
  if ((int)a3 <= 1766288502)
  {
    if (a3 != 1215653203 && a3 != 1397715043)
    {
      v5 = 1484026465;
      goto LABEL_17;
    }
LABEL_92:
    self->_renderStrategy = 1;
    return;
  }
  if (a3 != 1766288503 && a3 != 1768837992)
  {
    v5 = 1866951799;
    goto LABEL_17;
  }
LABEL_18:
  innerGlowCount = self->_innerGlowCount;
  if (innerGlowCount)
  {
    v7 = 0;
    p_var5 = &self->_innerGlow->var5;
    do
    {
      v9 = *p_var5;
      p_var5 += 6;
      if (v9 > 0.0)
        ++v7;
      --innerGlowCount;
    }
    while (innerGlowCount);
  }
  else
  {
    v7 = 0;
  }
  outerGlowCount = self->_outerGlowCount;
  if (outerGlowCount)
  {
    v16 = &self->_outerGlow->var5;
    LODWORD(v3) = 0;
    v17 = 0.0;
    do
    {
      if (*(v16 - 1) > 0.0)
        ++v7;
      v18 = *v16;
      v16 += 6;
      v19 = v18;
      if (v18 > 0.0)
        v17 = v17 + 1.0;
      if (v19 > *(float *)&v3 && v19 > 0.0)
        *(float *)&v3 = v19;
      --outerGlowCount;
    }
    while (outerGlowCount);
  }
  else
  {
    v17 = 0.0;
    LODWORD(v3) = 0;
  }
  innerShadowCount = self->_innerShadowCount;
  if (innerShadowCount)
  {
    p_var4 = &self->_innerShadow->var4;
    do
    {
      v23 = *p_var4;
      p_var4 += 12;
      if (v23 > 0.0)
        ++v7;
      --innerShadowCount;
    }
    while (innerShadowCount);
  }
  engraveShadowCount = self->_engraveShadowCount;
  if (engraveShadowCount)
  {
    v25 = &self->_engraveShadow->var5;
    do
    {
      if (*(v25 - 1) > 0.0)
        ++v7;
      v26 = *v25;
      v25 += 12;
      v27 = v26;
      if (v26 > 0.0)
        v17 = v17 + 1.0;
      if (v27 > *(float *)&v3 && v27 > 0.0)
        *(float *)&v3 = v27;
      --engraveShadowCount;
    }
    while (engraveShadowCount);
  }
  bevelEmbossCount = self->_bevelEmbossCount;
  if (bevelEmbossCount)
  {
    emboss = self->_emboss;
    do
    {
      v31 = emboss->var0;
      ++emboss;
      if (v31 > 0.0)
        ++v7;
      --bevelEmbossCount;
    }
    while (bevelEmbossCount);
  }
  extraShadowCount = self->_extraShadowCount;
  if (extraShadowCount)
  {
    v33 = &self->_extraShadow->var5;
    do
    {
      if (*(v33 - 1) > 0.0)
        ++v7;
      v34 = *v33;
      v33 += 12;
      v35 = v34;
      if (v34 > 0.0)
        v17 = v17 + 1.0;
      if (v35 > *(float *)&v3 && v35 > 0.0)
        *(float *)&v3 = v35;
      --extraShadowCount;
    }
    while (extraShadowCount);
  }
  if (v7 > 1)
    goto LABEL_92;
  if (v17 > 0.0 || *(float *)&v3 > 0.0)
    self->_renderStrategy = 1;
  if (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow", v3)
    && -[CUIShapeEffectStack hasInnerShadow](self, "hasInnerShadow")
    || -[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow")
    && -[CUIShapeEffectStack hasExtraShadow](self, "hasExtraShadow")
    || -[CUIShapeEffectStack hasInnerShadow](self, "hasInnerShadow")
    && -[CUIShapeEffectStack hasExtraShadow](self, "hasExtraShadow"))
  {
    goto LABEL_92;
  }
  v37 = self->_innerGlowCount;
  if (v37)
  {
    innerGlow = self->_innerGlow;
    do
    {
      v40 = innerGlow->var0;
      ++innerGlow;
      v39 = v40;
      if (v40 != 1852797549 && v39 != 0)
        goto LABEL_92;
    }
    while (--v37);
  }
  v42 = self->_innerShadowCount;
  if (v42)
  {
    innerShadow = self->_innerShadow;
    while (1)
    {
      v45 = innerShadow->var0;
      ++innerShadow;
      v44 = v45;
      if (v45 != 1852797549 && v44 != 0)
        break;
      if (!--v42)
        return;
    }
    goto LABEL_92;
  }
}

- (CUIShapeEffectStack)initWithEffectPreset:(id)a3
{
  CUIShapeEffectStack *v4;
  double v5;
  id v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  unint64_t *p_bevelEmbossCount;
  int v16;
  BOOL v17;
  size_t colorOverlayCount;
  size_t innerGradientCount;
  size_t innerGlowCount;
  size_t innerShadowCount;
  size_t outerGlowCount;
  size_t engraveShadowCount;
  size_t bevelEmbossCount;
  size_t extraShadowCount;
  size_t hueSaturationCount;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  id v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CUIShapeEffectStack;
  v4 = -[CUIShapeEffectStack init](&v42, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "effectScale");
    *(float *)&v5 = v5;
    v4->_scalefactor = *(float *)&v5;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&v4->_shapeOpacity = _D0;
    v4->_renderStrategy = 2;
    v11 = objc_msgSend(a3, "effectCount");
    -[CUIShapeEffectStack _cleanupEffectSettings](v4, "_cleanupEffectSettings");
    if (v11)
    {
      v12 = 0;
      v13 = 1;
      do
      {
        v14 = objc_msgSend(a3, "effectTypeAtIndex:", v12);
        if (v14 <= 1215653202)
        {
          if (v14 > 1164796530)
          {
            p_bevelEmbossCount = &v4->_bevelEmbossCount;
            if (v14 == 1164796531)
              goto LABEL_17;
            p_bevelEmbossCount = &v4->_innerGradientCount;
            v16 = 1198678372;
          }
          else
          {
            p_bevelEmbossCount = &v4->_colorOverlayCount;
            if (v14 == 1131375730)
              goto LABEL_17;
            p_bevelEmbossCount = &v4->_engraveShadowCount;
            v16 = 1148350320;
          }
        }
        else if (v14 <= 1766288502)
        {
          if (v14 == 1215653203)
          {
            p_bevelEmbossCount = &v4->_hueSaturationCount;
LABEL_17:
            ++*p_bevelEmbossCount;
            goto LABEL_18;
          }
          p_bevelEmbossCount = &v4->_extraShadowCount;
          v16 = 1484026465;
        }
        else
        {
          p_bevelEmbossCount = &v4->_innerGlowCount;
          if (v14 == 1766288503)
            goto LABEL_17;
          p_bevelEmbossCount = &v4->_innerShadowCount;
          if (v14 == 1768837992)
            goto LABEL_17;
          p_bevelEmbossCount = &v4->_outerGlowCount;
          v16 = 1866951799;
        }
        if (v14 == v16)
          goto LABEL_17;
LABEL_18:
        v12 = v13;
        v17 = (unint64_t)v11 > v13++;
      }
      while (v17);
    }
    colorOverlayCount = v4->_colorOverlayCount;
    if (colorOverlayCount)
      v4->_colorOverlay = ($EB69DF3B1DDA5C6930A5C79FD1E30C08 *)malloc_type_calloc(colorOverlayCount, 0x18uLL, 0x10000402C707793uLL);
    innerGradientCount = v4->_innerGradientCount;
    if (innerGradientCount)
      v4->_innerGradient = ($45A57A840939F8DA3264B2B8C70AC12D *)malloc_type_calloc(innerGradientCount, 0x20uLL, 0x1000040E0EAB150uLL);
    innerGlowCount = v4->_innerGlowCount;
    if (innerGlowCount)
      v4->_innerGlow = ($B9DFBB3EC52729005FFFDFFACDA0AF43 *)malloc_type_calloc(innerGlowCount, 0x18uLL, 0x1000040504FFAC1uLL);
    innerShadowCount = v4->_innerShadowCount;
    if (innerShadowCount)
      v4->_innerShadow = ($C07A9C4F79504F2E326AD5E2BA2D7579 *)malloc_type_calloc(innerShadowCount, 0x30uLL, 0x1000040EED21634uLL);
    outerGlowCount = v4->_outerGlowCount;
    if (outerGlowCount)
      v4->_outerGlow = ($9A3F6720D51884C1BD061C340F5007EE *)malloc_type_calloc(outerGlowCount, 0x18uLL, 0x1000040504FFAC1uLL);
    engraveShadowCount = v4->_engraveShadowCount;
    if (engraveShadowCount)
      v4->_engraveShadow = ($1DE4C1FD5A12EFAE99762DD70974AA56 *)malloc_type_calloc(engraveShadowCount, 0x30uLL, 0x1000040EED21634uLL);
    bevelEmbossCount = v4->_bevelEmbossCount;
    if (bevelEmbossCount)
      v4->_emboss = ($E0EE018EFC1CA26785F52D94F92F8253 *)malloc_type_calloc(bevelEmbossCount, 0x34uLL, 0x10000403884A0CCuLL);
    extraShadowCount = v4->_extraShadowCount;
    if (extraShadowCount)
      v4->_extraShadow = ($1DE4C1FD5A12EFAE99762DD70974AA56 *)malloc_type_calloc(extraShadowCount, 0x30uLL, 0x1000040EED21634uLL);
    hueSaturationCount = v4->_hueSaturationCount;
    if (hueSaturationCount)
      v4->_hueSaturation = ($69725AE9E2C336799B3330C9F2B37222 *)malloc_type_calloc(hueSaturationCount, 0x18uLL, 0x100004020B92A0BuLL);
    if (v11)
    {
      v27 = 0;
      v28 = 0;
      v33 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v29 = 1;
      while (1)
      {
        v30 = objc_msgSend(a3, "effectTypeAtIndex:", v27, v33);
        v31 = v30;
        if ((int)v30 <= 1215653202)
        {
          if ((int)v30 <= 1164796530)
          {
            if ((_DWORD)v30 == 1131375730)
            {
              -[CUIShapeEffectStack _setColorFillAtIndex:FromPreset:index:](v4, "_setColorFillAtIndex:FromPreset:index:");
              ++v41;
            }
            else if ((_DWORD)v30 == 1148350320)
            {
              -[CUIShapeEffectStack _setEngraveShadowAtIndex:fromPreset:index:](v4, "_setEngraveShadowAtIndex:fromPreset:index:");
              ++v36;
            }
          }
          else
          {
            switch((_DWORD)v30)
            {
              case 0x456D6273:
                -[CUIShapeEffectStack _setBevelEmbossAtIndex:fromPreset:index:](v4, "_setBevelEmbossAtIndex:fromPreset:index:");
                ++v35;
                break;
              case 0x46616465:
                -[CUIShapeEffectStack _setOutputOpacityFromPreset:atIndex:](v4, "_setOutputOpacityFromPreset:atIndex:", a3, v29 - 1);
                break;
              case 0x47726164:
                -[CUIShapeEffectStack _setInteriorGradientAtIndex:fromPreset:index:](v4, "_setInteriorGradientAtIndex:fromPreset:index:");
                ++v40;
                break;
            }
          }
          goto LABEL_66;
        }
        if ((int)v30 > 1766288502)
        {
          switch((_DWORD)v30)
          {
            case 0x69476C77:
              -[CUIShapeEffectStack _setInnerGlowAtIndex:fromPreset:index:](v4, "_setInnerGlowAtIndex:fromPreset:index:");
              ++v39;
              break;
            case 0x696E5368:
              -[CUIShapeEffectStack _setInnerShadowAtIndex:fromPreset:index:](v4, "_setInnerShadowAtIndex:fromPreset:index:");
              ++v38;
              break;
            case 0x6F476C77:
              -[CUIShapeEffectStack _setOuterGlowAtIndex:fromPreset:index:](v4, "_setOuterGlowAtIndex:fromPreset:index:");
              ++v37;
              break;
          }
          goto LABEL_66;
        }
        if ((_DWORD)v30 == 1215653203)
          break;
        if ((_DWORD)v30 == 1397715043)
        {
          -[CUIShapeEffectStack _setShapeOpacityFromPreset:atIndex:](v4, "_setShapeOpacityFromPreset:atIndex:", a3, v29 - 1);
          goto LABEL_66;
        }
        if ((_DWORD)v30 != 1484026465)
          goto LABEL_66;
        -[CUIShapeEffectStack _setExtraShadowAtIndex:fromPreset:index:](v4, "_setExtraShadowAtIndex:fromPreset:index:");
        -[CUIShapeEffectStack _updateRenderStrategyFromEffect:](v4, "_updateRenderStrategyFromEffect:", v31, v34 + 1);
LABEL_67:
        v27 = v29;
        v17 = (unint64_t)v11 > v29++;
        if (!v17)
          return v4;
      }
      -[CUIShapeEffectStack _setHueSaturationAtIndex:fromPreset:index:](v4, "_setHueSaturationAtIndex:fromPreset:index:", v28++, a3, v29 - 1);
LABEL_66:
      -[CUIShapeEffectStack _updateRenderStrategyFromEffect:](v4, "_updateRenderStrategyFromEffect:", v31, v34);
      goto LABEL_67;
    }
  }
  return v4;
}

- (id)effectPreset
{
  CUIShapeEffectPreset *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CUIShapeEffectPreset *v10;
  float shapeOpacity;
  uint64_t v12;
  unint64_t v13;
  $45A57A840939F8DA3264B2B8C70AC12D *v14;
  uint64_t v15;
  unint64_t v16;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *v17;
  uint64_t v18;
  unint64_t v19;
  $69725AE9E2C336799B3330C9F2B37222 *v20;
  uint64_t v21;
  unint64_t v22;
  $B9DFBB3EC52729005FFFDFFACDA0AF43 *v23;
  uint64_t v24;
  unint64_t v25;
  $C07A9C4F79504F2E326AD5E2BA2D7579 *v26;
  uint64_t v27;
  unint64_t v28;
  $9A3F6720D51884C1BD061C340F5007EE *v29;
  uint64_t v30;
  unint64_t v31;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v32;
  uint64_t v33;
  unint64_t v34;
  $E0EE018EFC1CA26785F52D94F92F8253 *v35;
  uint64_t v36;
  unint64_t v37;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v3 = objc_alloc_init(CUIShapeEffectPreset);
  v10 = v3;
  shapeOpacity = self->_shapeOpacity;
  if (shapeOpacity < 1.0)
    -[CUIShapeEffectPreset addShapeOpacityWithOpacity:](v3, "addShapeOpacityWithOpacity:", shapeOpacity);
  if (self->_outputOpacity < 1.0)
    -[CUIShapeEffectPreset addOutputOpacityWithOpacity:](v10, "addOutputOpacityWithOpacity:", self->_shapeOpacity);
  if (self->_innerGradientCount)
  {
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = &self->_innerGradient[v12];
      LODWORD(v4) = vcvtms_u32_f32(v14->var1 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v14->var2 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v14->var3 * 255.0);
      LODWORD(v7) = vcvtms_u32_f32(v14->var4 * 255.0);
      LODWORD(v8) = vcvtms_u32_f32(v14->var5 * 255.0);
      LODWORD(v9) = vcvtms_u32_f32(v14->var6 * 255.0);
      LODWORD(v40) = v14->var0;
      -[CUIShapeEffectPreset addGradientFillWithTopColorRed:green:blue:bottomColorRed:green:blue:opacity:blendMode:](v10, "addGradientFillWithTopColorRed:green:blue:bottomColorRed:green:blue:opacity:blendMode:", v4, v5, v6, v7, v8, v9, v14->var7, v40);
      ++v13;
      ++v12;
    }
    while (v13 < self->_innerGradientCount);
  }
  if (self->_colorOverlayCount)
  {
    v15 = 0;
    v16 = 0;
    do
    {
      v17 = &self->_colorOverlay[v15];
      LODWORD(v4) = vcvtms_u32_f32(v17->var1 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v17->var2 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v17->var3 * 255.0);
      -[CUIShapeEffectPreset addColorFillWithRed:green:blue:opacity:blendMode:tintable:](v10, "addColorFillWithRed:green:blue:opacity:blendMode:tintable:", v4, v5, v6, v17->var0, v17->var5, v17->var4);
      ++v16;
      ++v15;
    }
    while (v16 < self->_colorOverlayCount);
  }
  if (self->_hueSaturationCount)
  {
    v18 = 0;
    v19 = 0;
    do
    {
      v20 = &self->_hueSaturation[v18];
      LODWORD(v4) = vcvtms_u32_f32(v20->var2 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v20->var3 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v20->var4 * 255.0);
      -[CUIShapeEffectPreset addHueSaturationWithColorRed:green:blue:angle:width:tintable:](v10, "addHueSaturationWithColorRed:green:blue:angle:width:tintable:", v4, v5, v6, (int)rint(v20->var0 * 57.2957795), rint(v20->var1 * 57.2957795), v20->var5);
      ++v19;
      ++v18;
    }
    while (v19 < self->_hueSaturationCount);
  }
  if (self->_innerGlowCount)
  {
    v21 = 0;
    v22 = 0;
    do
    {
      v23 = &self->_innerGlow[v21];
      LODWORD(v4) = vcvtms_u32_f32(v23->var1 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v23->var2 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v23->var3 * 255.0);
      -[CUIShapeEffectPreset addInnerGlowWithColorRed:green:blue:opacity:blur:blendMode:](v10, "addInnerGlowWithColorRed:green:blue:opacity:blur:blendMode:", v4, v5, v6, v23->var5, v23->var0, v23->var4);
      ++v22;
      ++v21;
    }
    while (v22 < self->_innerGlowCount);
  }
  if (self->_innerShadowCount)
  {
    v24 = 0;
    v25 = 0;
    do
    {
      v26 = &self->_innerShadow[v24];
      LODWORD(v4) = vcvtms_u32_f32(v26->var1 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v26->var2 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v26->var3 * 255.0);
      LODWORD(v40) = v26->var0;
      -[CUIShapeEffectPreset addInnerShadowWithColorRed:green:blue:opacity:blur:offset:angle:blendMode:](v10, "addInnerShadowWithColorRed:green:blue:opacity:blur:offset:angle:blendMode:", v4, v5, v6, v26->var4, v26->var6, (int)rint(v26->var7 * 57.2957795), v26->var5, v40);
      ++v25;
      ++v24;
    }
    while (v25 < self->_innerShadowCount);
  }
  if (self->_outerGlowCount)
  {
    v27 = 0;
    v28 = 0;
    do
    {
      v29 = &self->_outerGlow[v27];
      LODWORD(v4) = vcvtms_u32_f32(v29->var0 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v29->var1 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v29->var2 * 255.0);
      -[CUIShapeEffectPreset addOuterGlowWithColorRed:green:blue:opacity:blur:spread:](v10, "addOuterGlowWithColorRed:green:blue:opacity:blur:spread:", v4, v5, v6, v29->var4, v29->var5, v29->var3);
      ++v28;
      ++v27;
    }
    while (v28 < self->_outerGlowCount);
  }
  if (self->_engraveShadowCount)
  {
    v30 = 0;
    v31 = 0;
    do
    {
      v32 = &self->_engraveShadow[v30];
      LODWORD(v4) = vcvtms_u32_f32(v32->var0 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v32->var1 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v32->var2 * 255.0);
      LODWORD(v40) = (int)rint(v32->var7 * 57.2957795);
      -[CUIShapeEffectPreset addDropShadowWithColorRed:green:blue:opacity:blur:spread:offset:angle:](v10, "addDropShadowWithColorRed:green:blue:opacity:blur:spread:offset:angle:", v4, v5, v6, v32->var4, v32->var5, v32->var6, v32->var3, v40);
      ++v31;
      ++v30;
    }
    while (v31 < self->_engraveShadowCount);
  }
  if (self->_bevelEmbossCount)
  {
    v33 = 0;
    v34 = 0;
    do
    {
      v35 = &self->_emboss[v33];
      LODWORD(v4) = vcvtms_u32_f32(v35->var4 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v35->var5 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v35->var6 * 255.0);
      LODWORD(v7) = vcvtms_u32_f32(v35->var8 * 255.0);
      LODWORD(v8) = vcvtms_u32_f32(v35->var9 * 255.0);
      LODWORD(v9) = vcvtms_u32_f32(v35->var10 * 255.0);
      HIDWORD(v41) = v35->var1;
      LODWORD(v42) = v35->var12;
      LODWORD(v41) = v35->var0;
      -[CUIShapeEffectPreset addBevelEmbossWithHighlightColorRed:green:blue:opacity:shadowColorRed:green:blue:opacity:blur:soften:bevelStyle:](v10, "addBevelEmbossWithHighlightColorRed:green:blue:opacity:shadowColorRed:green:blue:opacity:blur:soften:bevelStyle:", v4, v5, v6, v7, v8, v9, v35->var7, v35->var11, v41, v42);
      ++v34;
      ++v33;
    }
    while (v34 < self->_bevelEmbossCount);
  }
  if (self->_extraShadowCount)
  {
    v36 = 0;
    v37 = 0;
    do
    {
      v38 = &self->_extraShadow[v36];
      LODWORD(v4) = vcvtms_u32_f32(v38->var0 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v38->var1 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v38->var2 * 255.0);
      LODWORD(v40) = (int)rint(v38->var7 * 57.2957795);
      -[CUIShapeEffectPreset addExtraShadowWithColorRed:green:blue:opacity:blur:spread:offset:angle:](v10, "addExtraShadowWithColorRed:green:blue:opacity:blur:spread:offset:angle:", v4, v5, v6, v38->var4, v38->var5, v38->var6, v38->var3, v40);
      ++v37;
      ++v36;
    }
    while (v37 < self->_extraShadowCount);
  }
  return v10;
}

+ (id)offset:(id)a3 by:(CGPoint)a4
{
  CGAffineTransform v6;

  CGAffineTransformMakeTranslation(&v6, a4.x, a4.y);
  return objc_msgSend(a3, "imageByApplyingTransform:", &v6);
}

+ (id)adjustOpacity:(id)a3 by:(float)a4
{
  CIFilter *v6;
  double v7;

  v6 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CUIScaleClampFilter"), CFSTR("inputImage"), a3, CFSTR("inputScale"), +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), 0);
  if (v6)
    return -[CIFilter valueForKey:](v6, "valueForKey:", CFSTR("outputImage"));
  *(float *)&v7 = a4;
  v6 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CUIScaleClampFilterLocal"), CFSTR("inputImage"), a3, CFSTR("inputScale"), +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), 0);
  if (v6)
    return -[CIFilter valueForKey:](v6, "valueForKey:", CFSTR("outputImage"));
  else
    return a3;
}

+ (id)pixelZoomed:(id)a3 scale:(int)a4 about:(CGPoint)a5
{
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIPixelZoom"), CFSTR("inputImage"), a3, CFSTR("inputScale"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a4), CFSTR("inputSourceCenter"), +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", a5.x, a5.y), CFSTR("inputDestCenter"), +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", a5.x, a5.y), 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)unsharpMask:(id)a3 radius:(float)a4 intensity:(float)a5
{
  NSNumber *v7;
  double v8;

  v7 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  *(float *)&v8 = a5;
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIUnsharpMask"), CFSTR("inputImage"), a3, CFSTR("inputRadius"), v7, CFSTR("inputIntensity"), +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8), 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)composite:(id)a3 over:(id)a4
{
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CISourceOverCompositing"), CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)composite:(id)a3 into:(id)a4
{
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CISourceInCompositing"), CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)composite:(id)a3 outOf:(id)a4
{
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CISourceOutCompositing"), CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)composite:(id)a3 atop:(id)a4
{
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CISourceAtopCompositing"), CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)blend:(id)a3 over:(id)a4 blendKind:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v10;
  int v11;
  id v12;
  int v14;
  const __CFString *v15;
  BOOL v16;
  const __CFString *v17;
  BOOL v18;
  const __CFString *v19;

  if (!a3)
  {
    v12 = a4;
    return v12;
  }
  if (!a4)
  {
    v12 = a3;
    return v12;
  }
  v10 = 0;
  if ((int)a5 <= 1749838195)
  {
    if ((int)a5 <= 1668246641)
    {
      switch(a5)
      {
        case 0u:
          goto LABEL_64;
        case 0x10u:
        case 0x11u:
        case 0x15u:
        case 0x16u:
        case 0x17u:
        case 0x18u:
        case 0x19u:
          goto LABEL_63;
        case 0x12u:
          v10 = CFSTR("CISourceInCompositing");
          break;
        case 0x13u:
          v10 = CFSTR("CISourceOutCompositing");
          break;
        case 0x14u:
          v10 = CFSTR("CISourceAtopCompositing");
          break;
        case 0x1Au:
          v10 = CFSTR("CIPlusDarkerCompositing");
          break;
        case 0x1Bu:
          v10 = CFSTR("CIAdditionCompositing");
          break;
        default:
          return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
      }
      return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
    }
    if ((int)a5 > 1684633119)
    {
      if ((int)a5 > 1717856629)
      {
        if (a5 == 1717856630)
        {
LABEL_63:
          _CUILog(4, (uint64_t)"CUIShapeEffectStack: Unsupported blend mode %d encountered. Using SourceOver instead.", 0, (uint64_t)a4, *(uint64_t *)&a5, v5, v6, v7, *(uint64_t *)&a5);
          goto LABEL_64;
        }
        v18 = a5 == 1718842722;
        v19 = CFSTR("CISubtractBlendMode");
LABEL_60:
        if (v18)
          v10 = v19;
        else
          v10 = 0;
        return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
      }
      if (a5 == 1684633120)
      {
        v10 = CFSTR("CIColorDodgeBlendMode");
        return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
      }
      v11 = 1684751212;
    }
    else
    {
      if ((int)a5 <= 1684629093)
      {
        v14 = 1668246642;
        v15 = CFSTR("CIColorBlendMode");
        v16 = a5 == 1684107883;
        v17 = CFSTR("CIDarkenBlendMode");
        goto LABEL_51;
      }
      if (a5 == 1684629094)
      {
        v10 = CFSTR("CIDifferenceBlendMode");
        return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
      }
      v11 = 1684632435;
    }
LABEL_48:
    if (a5 != v11)
      return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
    goto LABEL_63;
  }
  if ((int)a5 <= 1852797548)
  {
    if ((int)a5 > 1818391149)
    {
      if ((int)a5 > 1818850404)
      {
        switch(a5)
        {
          case 0x6C697465u:
            v10 = CFSTR("CILightenBlendMode");
            break;
          case 0x6C756D20u:
            v10 = CFSTR("CILuminosityBlendMode");
            break;
          case 0x6D756C20u:
            v10 = CFSTR("CIMultiplyBlendMode");
            break;
        }
        return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
      }
      if (a5 == 1818391150)
      {
        v10 = CFSTR("CILinearBurnBlendMode");
        return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
      }
      if (a5 == 1818518631)
      {
        v10 = CFSTR("CILinearDodgeBlendMode");
        return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
      }
      v11 = 1818706796;
      goto LABEL_48;
    }
    if ((int)a5 > 1752524063)
    {
      switch(a5)
      {
        case 0x68756520u:
          v10 = CFSTR("CIHueBlendMode");
          break;
        case 0x69646976u:
          v10 = CFSTR("CIColorBurnBlendMode");
          break;
        case 0x6C4C6974u:
          v10 = CFSTR("CILinearLightBlendMode");
          break;
      }
      return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
    }
    v14 = 1749838196;
    v15 = CFSTR("CIHardLightBlendMode");
    v16 = a5 == 1749903736;
    v17 = CFSTR("CIHardMixBlendMode");
LABEL_51:
    if (!v16)
      v17 = 0;
    if (a5 == v14)
      v10 = v15;
    else
      v10 = v17;
    return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
  }
  if ((int)a5 > 1935766559)
  {
    if ((int)a5 <= 1984719219)
    {
      switch(a5)
      {
        case 0x73617420u:
          v10 = CFSTR("CISaturationBlendMode");
          break;
        case 0x7363726Eu:
          v10 = CFSTR("CIScreenBlendMode");
          break;
        case 0x736D7564u:
          v10 = CFSTR("CIExclusionBlendMode");
          break;
      }
      return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
    }
    if (a5 == 1984719220)
    {
      v10 = CFSTR("CIVividLightBlendMode");
      return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
    }
    if (a5 != 1986227573 && a5 != 1986229103)
      return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
    goto LABEL_64;
  }
  if ((int)a5 > 1884055923)
  {
    if (a5 == 1884055924)
    {
      v10 = CFSTR("CIPinLightBlendMode");
      return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
    }
    if (a5 != 1885434739)
    {
      if (a5 == 1934387572)
        v10 = CFSTR("CISoftLightBlendMode");
      return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
    }
    goto LABEL_63;
  }
  if (a5 != 1852797549)
  {
    v18 = a5 == 1870030194;
    v19 = CFSTR("CIOverlayBlendMode");
    goto LABEL_60;
  }
LABEL_64:
  v10 = CFSTR("CISourceOverCompositing");
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", v10, CFSTR("inputImage"), a3, CFSTR("inputBackgroundImage"), a4, 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)image:(id)a3 withOpacity:(float)a4
{
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIOpacity"), CFSTR("inputImage"), a3, CFSTR("inputOpacity"), +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)invert:(id)a3
{
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIColorInvert"), CFSTR("inputImage"), a3, 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)blur:(id)a3 radius:(float)a4
{
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIGaussianBlur"), CFSTR("inputImage"), a3, CFSTR("inputRadius"), +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)colorWithGray:(float)a3 alpha:(float)a4
{
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIConstantColorGenerator"), CFSTR("inputColor"), +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a3, a3, a3, a4), 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)colorWithRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIConstantColorGenerator"), CFSTR("inputColor"), +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a3, a4, a5, a6), 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)rectangle:(CGRect)a3 withRed:(float)a4 green:(float)a5 blue:(float)a6 alpha:(float)a7
{
  double height;
  double width;
  double y;
  double x;
  CIColor *v11;
  CIVector *v12;
  double v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a4, a5, a6, a7);
  v12 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", x, y, width, height);
  LODWORD(v13) = 1.0;
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIRectangleGenerator"), CFSTR("inputColor"), v11, CFSTR("inputRectangle"), v12, CFSTR("inputEdgeBlur"), +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13), 0), "valueForKey:", CFSTR("outputImage"));
}

+ (id)gradientWithParameters:(id *)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxY;
  CGRect v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MaxY = CGRectGetMaxY(a4);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return -[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CILinearGradient"), CFSTR("inputColor0"), +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a3->var1, a3->var2, a3->var3, a3->var7), CFSTR("inputColor1"), +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a3->var4, a3->var5, a3->var6,
               a3->var7),
             CFSTR("inputPoint0"),
             +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, MaxY),
             CFSTR("inputPoint1"),
             +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, CGRectGetMinY(v11)),
             0),
           "valueForKey:",
           CFSTR("outputImage"));
}

+ (id)shadowFrom:(id)a3 red:(float)a4 green:(float)a5 blue:(float)a6 opacity:(float)a7
{
  CIFilter *v12;
  double v13;

  v12 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMakeShadowMask"));
  -[CIFilter setValue:forKey:](v12, "setValue:forKey:", a3, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v12, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a4, a5, a6, 1.0), CFSTR("inputColor"));
  *(float *)&v13 = a7;
  -[CIFilter setValue:forKey:](v12, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13), CFSTR("inputOpacity"));
  return -[CIFilter valueForKey:](v12, "valueForKey:", CFSTR("outputImage"));
}

+ (id)imageFromBlendWithMask:(id)a3 foreground:(id)a4 background:(id)a5
{
  CIFilter *v8;

  v8 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBlendWithAlphaMask"));
  -[CIFilter setValue:forKey:](v8, "setValue:forKey:", a3, CFSTR("inputMaskImage"));
  -[CIFilter setValue:forKey:](v8, "setValue:forKey:", a4, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v8, "setValue:forKey:", a5, CFSTR("inputBackgroundImage"));
  return -[CIFilter valueForKey:](v8, "valueForKey:", CFSTR("outputImage"));
}

+ (id)innerGlowFrom:(id)a3 withRadius:(float)a4 red:(float)a5 green:(float)a6 blue:(float)a7 opacity:(float)a8
{
  CIFilter *v14;
  double v15;
  double v16;

  v14 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIInnerGlowOrShadowFilter"));
  if (!v14)
  {
    v14 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIInnerGlowOrShadowFilterLocal"));
    if (!v14)
      return a3;
  }
  -[CIFilter setValue:forKey:](v14, "setValue:forKey:", a3, CFSTR("inputImage"));
  *(float *)&v15 = a4;
  -[CIFilter setValue:forKey:](v14, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15), CFSTR("inputRadius"));
  LODWORD(v16) = 0.5;
  -[CIFilter setValue:forKey:](v14, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16), CFSTR("inputRange"));
  -[CIFilter setValue:forKey:](v14, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a5, a6, a7, a8), CFSTR("inputColor"));
  return -[CIFilter valueForKey:](v14, "valueForKey:", CFSTR("outputImage"));
}

+ (id)innerShadowFrom:(id)a3 withOffset:(CGPoint)a4 radius:(float)a5 red:(float)a6 green:(float)a7 blue:(float)a8 opacity:(float)a9
{
  double y;
  double x;
  CIFilter *v17;
  double v18;
  double v19;
  double v20;

  y = a4.y;
  x = a4.x;
  v17 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIInnerGlowOrShadowFilter"));
  LODWORD(v18) = 1.0;
  -[CIFilter setValue:forKey:](v17, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18), CFSTR("inputRange"));
  if (!v17)
  {
    v17 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIInnerGlowOrShadowFilterLocal"));
    LODWORD(v19) = 1.0;
    -[CIFilter setValue:forKey:](v17, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19), CFSTR("inputRange"));
    if (!v17)
      return a3;
  }
  -[CIFilter setValue:forKey:](v17, "setValue:forKey:", a3, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v17, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", x, y), CFSTR("inputOffset"));
  *(float *)&v20 = a5;
  -[CIFilter setValue:forKey:](v17, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20), CFSTR("inputRadius"));
  -[CIFilter setValue:forKey:](v17, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a6, a7, a8, a9), CFSTR("inputColor"));
  return -[CIFilter valueForKey:](v17, "valueForKey:", CFSTR("outputImage"));
}

+ (id)outerGlowFrom:(id)a3 withSize:(unsigned int)a4 spread:(unsigned int)a5 red:(float)a6 green:(float)a7 blue:(float)a8 opacity:(float)a9
{
  uint64_t v13;
  uint64_t v14;
  CIFilter *v16;
  double v17;
  NSNumber *v18;
  const __CFString *v19;
  double v20;

  v13 = *(_QWORD *)&a5;
  v14 = *(_QWORD *)&a4;
  v16 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIOuterGlowOrShadowFilter"));
  if (!v16)
  {
    v16 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIOuterGlowOrShadowFilterLocal"));
    if (!v16)
      return a3;
  }
  if (-[NSDictionary valueForKey:](-[CIFilter attributes](v16, "attributes"), "valueForKey:", CFSTR("inputSpread")))
  {
    -[CIFilter setValue:forKey:](v16, "setValue:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v14), CFSTR("inputSize"));
    v18 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v13);
    v19 = CFSTR("inputSpread");
  }
  else
  {
    *(float *)&v17 = (float)v14 / 2.853;
    v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17);
    v19 = CFSTR("inputRadius");
  }
  -[CIFilter setValue:forKey:](v16, "setValue:forKey:", v18, v19);
  -[CIFilter setValue:forKey:](v16, "setValue:forKey:", a3, CFSTR("inputImage"));
  LODWORD(v20) = 0.5;
  -[CIFilter setValue:forKey:](v16, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20), CFSTR("inputRange"));
  -[CIFilter setValue:forKey:](v16, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a6, a7, a8, a9), CFSTR("inputColor"));
  return -[CIFilter valueForKey:](v16, "valueForKey:", CFSTR("outputImage"));
}

+ (id)outerShadowFrom:(id)a3 withOffset:(CGPoint)a4 size:(unsigned int)a5 spread:(unsigned int)a6 red:(float)a7 green:(float)a8 blue:(float)a9 opacity:(float)a10
{
  uint64_t v14;
  uint64_t v15;
  double y;
  double x;
  CIFilter *v19;
  double v20;
  double v21;
  NSNumber *v22;
  const __CFString *v23;

  v14 = *(_QWORD *)&a6;
  v15 = *(_QWORD *)&a5;
  y = a4.y;
  x = a4.x;
  v19 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIOuterGlowOrShadowFilter"));
  if (!v19)
  {
    v19 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIOuterGlowOrShadowFilterLocal"));
    if (!v19)
      return a3;
  }
  LODWORD(v20) = 1.0;
  -[CIFilter setValue:forKey:](v19, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20), CFSTR("inputRange"));
  if (-[NSDictionary valueForKey:](-[CIFilter attributes](v19, "attributes"), "valueForKey:", CFSTR("inputSpread")))
  {
    -[CIFilter setValue:forKey:](v19, "setValue:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v15), CFSTR("inputSize"));
    v22 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v14);
    v23 = CFSTR("inputSpread");
  }
  else
  {
    *(float *)&v21 = (float)v15 / 2.853;
    v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21);
    v23 = CFSTR("inputRadius");
  }
  -[CIFilter setValue:forKey:](v19, "setValue:forKey:", v22, v23);
  -[CIFilter setValue:forKey:](v19, "setValue:forKey:", a3, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v19, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", x, y), CFSTR("inputOffset"));
  -[CIFilter setValue:forKey:](v19, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a7, a8, a9, a10), CFSTR("inputColor"));
  return -[CIFilter valueForKey:](v19, "valueForKey:", CFSTR("outputImage"));
}

+ (id)bevelEmbossFrom:(id)a3 withSize:(unsigned int)a4 soften:(unsigned int)a5 angle:(float)a6 altitude:(float)a7 highlightRed:(float)a8 highlightGreen:(float)a9 highlightBlue:(float)a10 highlightOpacity:(float)a11 shadowRed:(float)a12 shadowGreen:(float)a13 shadowBlue:(float)a14 shadowOpacity:(float)a15 bevelStyle:(unsigned int)a16
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v26;
  uint64_t v27;
  CIFilter *v28;
  const __CFString *v29;
  const char *v30;
  double v31;
  NSNumber *v32;
  id result;
  double v34;
  double v35;
  uint64_t v36;
  float v37;

  v26 = *(_QWORD *)&a5;
  v27 = *(_QWORD *)&a4;
  switch(a16)
  {
    case 0u:
      v37 = a15;
      v28 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIOuterBevelEmbossFilter"));
      if (v28)
        goto LABEL_8;
      v29 = CFSTR("CUIOuterBevelEmbossFilterLocal");
      goto LABEL_7;
    case 1u:
      v37 = a15;
      v28 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIInnerBevelEmbossFilter"));
      if (!v28)
      {
        v29 = CFSTR("CUIInnerBevelEmbossFilterLocal");
LABEL_7:
        v28 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", v29);
        if (!v28)
          goto LABEL_14;
      }
LABEL_8:
      -[CIFilter setValue:forKey:](v28, "setValue:forKey:", a3, CFSTR("inputImage"));
      if (-[NSDictionary valueForKey:](-[CIFilter attributes](v28, "attributes"), "valueForKey:", CFSTR("inputSize")))
      {
        -[CIFilter setValue:forKey:](v28, "setValue:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v27), CFSTR("inputSize"));
        v32 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v26);
      }
      else
      {
        *(float *)&v31 = (float)v27 / 2.853;
        -[CIFilter setValue:forKey:](v28, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v31), CFSTR("inputRadius"));
        *(float *)&v34 = (float)v26 / 2.853;
        v32 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34);
      }
      -[CIFilter setValue:forKey:](v28, "setValue:forKey:", v32, CFSTR("inputSoften"));
      *(float *)&v35 = a6;
      -[CIFilter setValue:forKey:](v28, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v35), CFSTR("inputAngle"));
      -[CIFilter setValue:forKey:](v28, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a8, a9, a10, a11), CFSTR("inputHighlightColor"));
      -[CIFilter setValue:forKey:](v28, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a12, a13, a14, v37), CFSTR("inputShadowColor"));
      result = -[CIFilter valueForKey:](v28, "valueForKey:", CFSTR("outputImage"));
      break;
    case 2u:
      v30 = "Emboss bevel style isn't yet implemented";
      goto LABEL_13;
    case 3u:
      v30 = "Pillow emboss bevel style isn't yet implemented";
      goto LABEL_13;
    case 4u:
      v30 = "Stroke emboss bevel style isn't yet implemented";
      goto LABEL_13;
    default:
      v30 = "unrecognized bevel style";
LABEL_13:
      _CUILog(4, (uint64_t)v30, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a16, v16, v17, v36);
LABEL_14:
      result = a3;
      break;
  }
  return result;
}

+ (id)hueSaturationFrom:(id)a3 withCenterAngle:(double)a4 width:(double)a5 tintRed:(float)a6 tintGreen:(float)a7 tintBlue:(float)a8
{
  CIFilter *v14;

  v14 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIHueSaturationFilter"));
  if (!v14)
  {
    v14 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIHueSaturationFilterLocal"));
    if (!v14)
      return a3;
  }
  -[CIFilter setValue:forKey:](v14, "setValue:forKey:", a3, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v14, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:](CIColor, "colorWithSRGBRed:green:blue:", a6, a7, a8), CFSTR("inputTintColor"));
  -[CIFilter setValue:forKey:](v14, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4), CFSTR("inputCenterAngle"));
  -[CIFilter setValue:forKey:](v14, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5), CFSTR("inputAngleWidth"));
  return -[CIFilter valueForKey:](v14, "valueForKey:", CFSTR("outputImage"));
}

+ (id)shapeEffectSingleBlurFrom:(id)a3 withInteriorFill:(id)a4 offset:(CGPoint)a5 blurSize:(float)a6 innerGlowRed:(float)a7 innerGlowGreen:(float)a8 innerGlowBlue:(float)a9 innerGlowOpacity:(float)a10 innerShadowRed:(float)a11 innerShadowGreen:(float)a12 innerShadowBlue:(float)a13 innerShadowOpacity:(float)a14 outerGlowRed:(float)a15 outerGlowGreen:(float)a16 outerGlowBlue:(float)a17 outerGlowOpacity:(float)a18 outerShadowRed:(float)a19 outerShadowGreen:(float)a20 outerShadowBlue:(float)a21 outerShadowOpacity:(float)a22 hasInsideShadowBlur:(BOOL)a23 hasOutsideShadowBlur:(BOOL)a24
{
  _BOOL8 v24;
  _BOOL8 v25;
  double y;
  double x;
  CIFilter *v35;
  double v36;

  v24 = a24;
  v25 = a23;
  y = a5.y;
  x = a5.x;
  v35 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIShapeEffectBlur1"));
  if (!v35)
  {
    v35 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CUIShapeEffectBlur1Local"));
    if (!v35)
      return a3;
  }
  -[CIFilter setValue:forKey:](v35, "setValue:forKey:", a3, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v35, "setValue:forKey:", a4, CFSTR("inputFill"));
  -[CIFilter setValue:forKey:](v35, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", x, y), CFSTR("inputOffset"));
  *(float *)&v36 = a6;
  -[CIFilter setValue:forKey:](v35, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36), CFSTR("inputRadius"));
  -[CIFilter setValue:forKey:](v35, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a7, a8, a9, a10), CFSTR("inputGlowColorInner"));
  -[CIFilter setValue:forKey:](v35, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a15, a16, a17, a18), CFSTR("inputGlowColorOuter"));
  -[CIFilter setValue:forKey:](v35, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a19, a20, a21, a22), CFSTR("inputShadowColorOuter"));
  -[CIFilter setValue:forKey:](v35, "setValue:forKey:", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a11, a12, a13, a14), CFSTR("inputShadowColorInner"));
  -[CIFilter setValue:forKey:](v35, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v25), CFSTR("inputShadowBlurInner"));
  -[CIFilter setValue:forKey:](v35, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v24), CFSTR("inputShadowBlurOuter"));
  return -[CIFilter valueForKey:](v35, "valueForKey:", CFSTR("outputImage"));
}

- (id)imageWithSingleBlurShapeEffectOfImage:(id)a3 withInteriorFill:(id)a4
{
  _BOOL8 v7;
  uint64_t v8;
  unsigned int v9;
  float v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  float v14;
  float *v15;
  _BOOL8 v16;
  unsigned int v17;
  float var1;
  float var2;
  float var3;
  float var4;
  float var5;
  $B9DFBB3EC52729005FFFDFFACDA0AF43 *innerGlow;
  $C07A9C4F79504F2E326AD5E2BA2D7579 *innerShadow;
  float v25;
  double y;
  unsigned int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float v38;
  $9A3F6720D51884C1BD061C340F5007EE *outerGlow;
  double v40;
  float v41;
  uint64_t v43;
  unsigned int v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  float v57;

  v7 = -[CUIShapeEffectStack hasInnerShadow](self, "hasInnerShadow");
  if (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow"))
  {
    v8 = 128;
LABEL_5:
    v15 = *(float **)((char *)&self->super.isa + v8);
    v10 = *v15;
    v11 = *((_DWORD *)v15 + 1);
    v12 = *((_DWORD *)v15 + 2);
    v13 = *((_DWORD *)v15 + 3);
    v14 = v15[4];
    v57 = v15[6];
    goto LABEL_6;
  }
  v9 = -[CUIShapeEffectStack hasExtraShadow](self, "hasExtraShadow");
  v10 = 0.0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0.0;
  v57 = 0.0;
  if (v9)
  {
    v8 = 144;
    goto LABEL_5;
  }
LABEL_6:
  v54 = v12;
  v55 = v11;
  v56 = LODWORD(v10);
  v16 = (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow")
      || -[CUIShapeEffectStack hasExtraShadow](self, "hasExtraShadow"))
     && v14 > 0.0;
  v17 = -[CUIShapeEffectStack hasInnerGlow](self, "hasInnerGlow");
  var1 = 0.0;
  var2 = 0.0;
  var3 = 0.0;
  var4 = 0.0;
  var5 = 0.0;
  if (v17)
  {
    innerGlow = self->_innerGlow;
    var1 = innerGlow->var1;
    var2 = innerGlow->var2;
    var3 = innerGlow->var3;
    var4 = innerGlow->var4;
    var5 = innerGlow->var5;
  }
  v48 = var4;
  v49 = var3;
  v50 = var2;
  v51 = var1;
  v53 = v13;
  if (-[CUIShapeEffectStack hasInnerShadow](self, "hasInnerShadow"))
  {
    innerShadow = self->_innerShadow;
    v52 = innerShadow->var1;
    v25 = innerShadow->var4;
    v46 = innerShadow->var3;
    v47 = innerShadow->var2;
    v45 = innerShadow->var5;
    y = innerShadow->var8.y;
  }
  else
  {
    v52 = 0.0;
    y = NSZeroPoint.y;
    v46 = 0.0;
    v47 = 0.0;
    v25 = 0.0;
    v45 = 0.0;
  }
  v27 = -[CUIShapeEffectStack hasOuterGlow](self, "hasOuterGlow");
  LODWORD(v34) = 0;
  v35 = 0.0;
  v36 = 0.0;
  v37 = 0.0;
  v38 = 0.0;
  if (v27)
  {
    outerGlow = self->_outerGlow;
    *(float *)&v34 = outerGlow->var0;
    v35 = outerGlow->var1;
    v36 = outerGlow->var2;
    v37 = outerGlow->var3;
    v38 = outerGlow->var4;
  }
  v44 = LODWORD(v34);
  *(float *)&v34 = v57;
  if (v57 <= 0.0)
    -[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow", v34);
  if (y <= 0.0)
    -[CUIShapeEffectStack hasInnerShadow](self, "hasInnerShadow", v34);
  if (v14 != v25)
    -[CUIShapeEffectStack hasInnerShadow](self, "hasInnerShadow");
  if (var5 != v38 && -[CUIShapeEffectStack hasInnerGlow](self, "hasInnerGlow"))
    -[CUIShapeEffectStack hasOuterGlow](self, "hasOuterGlow");
  if (y >= v57)
    v40 = y;
  else
    v40 = v57;
  if (v14 <= v25)
    v41 = v25;
  else
    v41 = v14;
  if (v41 <= var5)
    v41 = var5;
  if (v41 <= v38)
    v41 = v38;
  *(float *)&v28 = v41 / 2.853;
  LODWORD(v43) = v53;
  *(float *)&v32 = v48;
  *(float *)&v30 = v50;
  *(float *)&v29 = v51;
  *(float *)&v31 = v49;
  *(float *)&v33 = v52;
  return +[CUIShapeEffectStack shapeEffectSingleBlurFrom:withInteriorFill:offset:blurSize:innerGlowRed:innerGlowGreen:innerGlowBlue:innerGlowOpacity:innerShadowRed:innerShadowGreen:innerShadowBlue:innerShadowOpacity:outerGlowRed:outerGlowGreen:outerGlowBlue:outerGlowOpacity:outerShadowRed:outerShadowGreen:outerShadowBlue:outerShadowOpacity:hasInsideShadowBlur:hasOutsideShadowBlur:](CUIShapeEffectStack, "shapeEffectSingleBlurFrom:withInteriorFill:offset:blurSize:innerGlowRed:innerGlowGreen:innerGlowBlue:innerGlowOpacity:innerShadowRed:innerShadowGreen:innerShadowBlue:innerShadowOpacity:outerGlowRed:outerGlowGreen:outerGlowBlue:outerGlowOpacity:outerShadowRed:outerShadowGreen:outerShadowBlue:outerShadowOpacity:hasInsideShadowBlur:hasOutsideShadowBlur:", a3, a4, v7, v16, 0.0, v40, v28, v29, v30, v31, v32, v33, __PAIR64__(LODWORD(v46), LODWORD(v47)), __PAIR64__(v44, LODWORD(v45)),
           __PAIR64__(LODWORD(v36), LODWORD(v35)),
           __PAIR64__(v56, LODWORD(v37)),
           __PAIR64__(v54, v55),
           v43);
}

- (id)imageWithInnerGlowOfImage:(id)a3 effect:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  *(float *)&v8 = a4->var4;
  *(float *)&v4 = a4->var5 / 2.853;
  *(float *)&v5 = a4->var1;
  *(float *)&v6 = a4->var2;
  *(float *)&v7 = a4->var3;
  return +[CUIShapeEffectStack innerGlowFrom:withRadius:red:green:blue:opacity:](CUIShapeEffectStack, "innerGlowFrom:withRadius:red:green:blue:opacity:", a3, v4, v5, v6, v7, v8);
}

- (id)imageWithInnerShadowOfImage:(id)a3 effect:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  *(float *)&v7 = a4->var3;
  *(float *)&v4 = a4->var4 / 2.853;
  *(float *)&v5 = a4->var1;
  *(float *)&v6 = a4->var2;
  *(float *)&v8 = a4->var5;
  return +[CUIShapeEffectStack innerShadowFrom:withOffset:radius:red:green:blue:opacity:](CUIShapeEffectStack, "innerShadowFrom:withOffset:radius:red:green:blue:opacity:", a3, -a4->var8.x, -a4->var8.y, v4, v5, v6, v7, v8);
}

- (id)image:(id)a3 withAdjustedOpacity:(float)a4
{
  if (a4 >= 1.0)
    return a3;
  else
    return +[CUIShapeEffectStack adjustOpacity:by:](CUIShapeEffectStack, "adjustOpacity:by:", a3);
}

- (id)imageWithColorOverlayOfImage:(id)a3 effect:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;

  *(float *)&v4 = a4->var1;
  *(float *)&v5 = a4->var2;
  *(float *)&v6 = a4->var3;
  *(float *)&v7 = a4->var4;
  return +[CUIShapeEffectStack blend:over:blendKind:](CUIShapeEffectStack, "blend:over:blendKind:", +[CUIShapeEffectStack colorWithRed:green:blue:alpha:](CUIShapeEffectStack, "colorWithRed:green:blue:alpha:", v4, v5, v6, v7), a3, a4->var0);
}

- (id)imageWithHueSaturationOfImage:(id)a3 effect:(id *)a4
{
  double v4;
  double v5;
  double v6;

  if (!a4->var6)
    return a3;
  *(float *)&v4 = a4->var2;
  *(float *)&v5 = a4->var3;
  *(float *)&v6 = a4->var4;
  return +[CUIShapeEffectStack hueSaturationFrom:withCenterAngle:width:tintRed:tintGreen:tintBlue:](CUIShapeEffectStack, "hueSaturationFrom:withCenterAngle:width:tintRed:tintGreen:tintBlue:", a3, a4->var0, a4->var1, v4, v5, v6);
}

- (id)imageWithInteriorGradientFillOfImage:(id)a3 effect:(id *)a4
{
  objc_msgSend(a3, "extent");
  return +[CUIShapeEffectStack blend:over:blendKind:](CUIShapeEffectStack, "blend:over:blendKind:", +[CUIShapeEffectStack gradientWithParameters:inRect:](CUIShapeEffectStack, "gradientWithParameters:inRect:", a4), a3, a4->var0);
}

- (id)imageWithOuterGlowOfImage:(id)a3 effect:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;

  *(float *)&v4 = a4->var0;
  *(float *)&v5 = a4->var1;
  *(float *)&v6 = a4->var2;
  *(float *)&v7 = a4->var3;
  return +[CUIShapeEffectStack outerGlowFrom:withSize:spread:red:green:blue:opacity:](CUIShapeEffectStack, "outerGlowFrom:withSize:spread:red:green:blue:opacity:", a3, a4->var4, a4->var5, v4, v5, v6, v7);
}

- (id)imageWithEngraveShadowOfImage:(id)a3 effect:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;

  *(float *)&v4 = a4->var0;
  *(float *)&v5 = a4->var1;
  *(float *)&v6 = a4->var2;
  *(float *)&v7 = a4->var3;
  return +[CUIShapeEffectStack outerShadowFrom:withOffset:size:spread:red:green:blue:opacity:](CUIShapeEffectStack, "outerShadowFrom:withOffset:size:spread:red:green:blue:opacity:", a3, a4->var4, a4->var5, -a4->var8.x, -a4->var8.y, v4, v5, v6, v7);
}

- (id)imageWithExtraShadowOfImage:(id)a3 effect:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;

  *(float *)&v4 = a4->var0;
  *(float *)&v5 = a4->var1;
  *(float *)&v6 = a4->var2;
  *(float *)&v7 = a4->var3;
  return +[CUIShapeEffectStack outerShadowFrom:withOffset:size:spread:red:green:blue:opacity:](CUIShapeEffectStack, "outerShadowFrom:withOffset:size:spread:red:green:blue:opacity:", a3, a4->var4, a4->var5, -a4->var8.x, -a4->var8.y, v4, v5, v6, v7);
}

- (id)imageWithBevelEmbossOfImage:(id)a3 effect:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  *(float *)&v4 = a4->var2;
  *(float *)&v5 = a4->var3;
  *(float *)&v6 = a4->var4;
  *(float *)&v7 = a4->var5;
  *(float *)&v8 = a4->var6;
  *(float *)&v9 = a4->var7;
  *(float *)&v10 = a4->var8;
  *(float *)&v11 = a4->var9;
  return +[CUIShapeEffectStack bevelEmbossFrom:withSize:soften:angle:altitude:highlightRed:highlightGreen:highlightBlue:highlightOpacity:shadowRed:shadowGreen:shadowBlue:shadowOpacity:bevelStyle:](CUIShapeEffectStack, "bevelEmbossFrom:withSize:soften:angle:altitude:highlightRed:highlightGreen:highlightBlue:highlightOpacity:shadowRed:shadowGreen:shadowBlue:shadowOpacity:bevelStyle:", a3, a4->var0, a4->var1, a4->var12, v4, v5, v6, v7, v8, v9, v10, v11, *(_QWORD *)&a4->var10);
}

- (int)cgBlendModeForOutputBlending
{
  return +[CUIShapeEffectPreset cgBlendModeFromCUIEffectBlendMode:](CUIShapeEffectPreset, "cgBlendModeFromCUIEffectBlendMode:", -[CUIShapeEffectStack outputBlendMode](self, "outputBlendMode"));
}

- (void)updateOutputBlendingWithInteriorFillHeuristic
{
  unint64_t colorOverlayCount;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *colorOverlay;
  unsigned int v4;
  unsigned int var0;

  colorOverlayCount = self->_colorOverlayCount;
  if (colorOverlayCount)
  {
    colorOverlay = self->_colorOverlay;
    while (1)
    {
      var0 = colorOverlay->var0;
      ++colorOverlay;
      v4 = var0;
      if (var0)
        break;
      if (!--colorOverlayCount)
        return;
    }
    self->_outputBlendMode = v4;
  }
}

- (void)scaleEffectParametersBy:(double)a3
{
  unint64_t innerGlowCount;
  float v6;
  float *p_var5;
  unint64_t innerShadowCount;
  float v9;
  float *p_var6;
  float v11;
  float v12;
  __float2 v13;
  unint64_t outerGlowCount;
  float v15;
  float *p_var4;
  unint64_t engraveShadowCount;
  float v18;
  float *v19;
  float v20;
  float v21;
  __float2 v22;
  unint64_t bevelEmbossCount;
  float v24;
  float *p_var1;

  if (self->_scalefactor != a3)
  {
    innerGlowCount = self->_innerGlowCount;
    if (innerGlowCount)
    {
      p_var5 = &self->_innerGlow->var5;
      do
      {
        v6 = a3;
        *p_var5 = (float)(*p_var5 / self->_scalefactor) * v6;
        p_var5 += 6;
        --innerGlowCount;
      }
      while (innerGlowCount);
    }
    innerShadowCount = self->_innerShadowCount;
    if (innerShadowCount)
    {
      v9 = a3;
      p_var6 = &self->_innerShadow->var6;
      do
      {
        *(p_var6 - 2) = (float)(*(p_var6 - 2) / self->_scalefactor) * v9;
        v11 = p_var6[1];
        v12 = (float)(*p_var6 / self->_scalefactor) * v9;
        *p_var6 = v12;
        v13 = __sincosf_stret(v11);
        *((double *)p_var6 + 1) = (float)(v12 * v13.__cosval);
        *((double *)p_var6 + 2) = (float)(v12 * v13.__sinval);
        p_var6 += 12;
        --innerShadowCount;
      }
      while (innerShadowCount);
    }
    outerGlowCount = self->_outerGlowCount;
    if (outerGlowCount)
    {
      p_var4 = &self->_outerGlow->var4;
      do
      {
        v15 = a3;
        *p_var4 = (float)(*p_var4 / self->_scalefactor) * v15;
        p_var4 += 6;
        --outerGlowCount;
      }
      while (outerGlowCount);
    }
    engraveShadowCount = self->_engraveShadowCount;
    if (engraveShadowCount)
    {
      v18 = a3;
      v19 = &self->_engraveShadow->var6;
      do
      {
        *(v19 - 2) = (float)(*(v19 - 2) / self->_scalefactor) * v18;
        v20 = v19[1];
        v21 = (float)(*v19 / self->_scalefactor) * v18;
        *v19 = v21;
        v22 = __sincosf_stret(v20);
        *((double *)v19 + 1) = (float)(v21 * v22.__cosval);
        *((double *)v19 + 2) = (float)(v21 * v22.__sinval);
        v19 += 12;
        --engraveShadowCount;
      }
      while (engraveShadowCount);
    }
    bevelEmbossCount = self->_bevelEmbossCount;
    if (bevelEmbossCount)
    {
      v24 = a3;
      p_var1 = &self->_emboss->var1;
      do
      {
        *(p_var1 - 1) = (float)(*(p_var1 - 1) / self->_scalefactor) * v24;
        *p_var1 = (float)(*p_var1 / self->_scalefactor) * v24;
        p_var1 += 13;
        --bevelEmbossCount;
      }
      while (bevelEmbossCount);
    }
    else
    {
      v24 = a3;
    }
    self->_scalefactor = v24;
    -[CUIShapeEffectStack _updateRenderStrategyFromEffect:](self, "_updateRenderStrategyFromEffect:", 1148350320);
  }
}

- (void)_normalizeEffectParameters
{
  unint64_t innerGlowCount;
  float *p_var5;
  float v4;
  unint64_t outerGlowCount;
  float *p_var4;
  float v7;
  unint64_t bevelEmbossCount;
  float32x2_t *emboss;

  innerGlowCount = self->_innerGlowCount;
  if (innerGlowCount)
  {
    p_var5 = &self->_innerGlow->var5;
    do
    {
      v4 = *p_var5;
      if (*p_var5 == 2.0)
        v4 = 1.0;
      *p_var5 = v4;
      p_var5 += 6;
      --innerGlowCount;
    }
    while (innerGlowCount);
  }
  outerGlowCount = self->_outerGlowCount;
  if (outerGlowCount)
  {
    p_var4 = &self->_outerGlow->var4;
    do
    {
      v7 = *p_var4;
      if (*p_var4 == 2.0)
        v7 = 1.0;
      *p_var4 = v7;
      p_var4 += 6;
      --outerGlowCount;
    }
    while (outerGlowCount);
  }
  bevelEmbossCount = self->_bevelEmbossCount;
  if (bevelEmbossCount)
  {
    emboss = (float32x2_t *)self->_emboss;
    __asm { FMOV            V1.2S, #1.0 }
    do
    {
      *emboss = (float32x2_t)vbsl_s8((int8x8_t)vceq_f32(*emboss, (float32x2_t)0x4000000040000000), _D1, (int8x8_t)*emboss);
      emboss = (float32x2_t *)((char *)emboss + 52);
      --bevelEmbossCount;
    }
    while (bevelEmbossCount);
  }
}

- (BOOL)anyEffectAllowsTintSubstitution
{
  unint64_t colorOverlayCount;
  BOOL *p_var5;
  _BOOL4 v4;
  unint64_t hueSaturationCount;
  unint64_t v6;
  BOOL *v7;
  _BOOL4 v8;
  BOOL result;

  colorOverlayCount = self->_colorOverlayCount;
  if (colorOverlayCount)
  {
    p_var5 = &self->_colorOverlay->var5;
    while (1)
    {
      v4 = *p_var5;
      p_var5 += 24;
      if (v4)
        return 1;
      if (!--colorOverlayCount)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    hueSaturationCount = self->_hueSaturationCount;
    if (hueSaturationCount)
    {
      v6 = hueSaturationCount - 1;
      v7 = &self->_hueSaturation->var5;
      do
      {
        v8 = *v7;
        v7 += 24;
        result = v8;
      }
      while (!v8 && v6-- != 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)applyCustomForegroundColor:(CGColor *)a3
{
  -[CUIShapeEffectStack applyCustomForegroundColor:tintEffectColors:](self, "applyCustomForegroundColor:tintEffectColors:", a3, 0);
}

- (void)applyCustomForegroundColor:(CGColor *)a3 tintEffectColors:(BOOL)a4
{
  _BOOL4 v4;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  const CGFloat *Components;
  double v10;
  double v11;
  double v12;
  double Alpha;
  uint64_t SRGB;
  uint64_t v15;
  CGColor *v16;
  const CGFloat *v17;
  unsigned int v18;
  unint64_t colorOverlayCount;
  float v20;
  float v21;
  float v22;
  BOOL *p_var5;
  BOOL *v24;
  _BOOL4 v25;
  float v26;
  double v27;
  float v28;
  unint64_t hueSaturationCount;
  float v30;
  float v31;
  float v32;
  float *p_var3;
  float v34;
  unint64_t v35;
  float v36;
  float v37;
  float v38;
  float *p_var4;
  unint64_t innerGlowCount;
  float v41;
  float v42;
  float v43;
  float *v44;
  unint64_t innerShadowCount;
  float v46;
  float v47;
  float v48;
  float *v49;
  unint64_t outerGlowCount;
  float v51;
  float v52;
  float v53;
  float *p_var2;
  unint64_t engraveShadowCount;
  float v56;
  float v57;
  float v58;
  float *v59;
  unint64_t extraShadowCount;
  float v61;
  float v62;
  float v63;
  float *v64;
  unint64_t innerGradientCount;
  float64x2_t v66;
  float64x2_t v67;
  float *p_var7;
  double v69;
  float v70;
  float v71;
  unint64_t v72;
  float *v73;
  double v74;
  float v75;
  float v76;
  float v77;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *v78;
  float v79;
  float v80;
  float v81;
  float v82;

  v4 = a4;
  ColorSpace = CGColorGetColorSpace(a3);
  if (ColorSpace)
  {
    Model = CGColorSpaceGetModel(ColorSpace);
    if (Model)
    {
      if (Model == kCGColorSpaceModelRGB)
      {
        Components = CGColorGetComponents(a3);
        v10 = *Components;
        v11 = Components[1];
        v12 = Components[2];
        Alpha = CGColorGetAlpha(a3);
      }
      else
      {
        SRGB = _CUIColorSpaceGetSRGB();
        v15 = MEMORY[0x1A1AEDE3C](SRGB, 0);
        v16 = (CGColor *)CGColorTransformConvertColor(v15, a3, 0);
        CGColorTransformRelease(v15);
        if (!v16)
          return;
        v17 = CGColorGetComponents(v16);
        v10 = *v17;
        v11 = v17[1];
        v12 = v17[2];
        Alpha = CGColorGetAlpha(v16);
        CGColorRelease(v16);
      }
    }
    else
    {
      v10 = *CGColorGetComponents(a3);
      Alpha = CGColorGetAlpha(a3);
      v11 = v10;
      v12 = v10;
    }
    v18 = -[CUIShapeEffectStack anyEffectAllowsTintSubstitution](self, "anyEffectAllowsTintSubstitution");
    if (v4)
    {
      if (v18)
      {
        colorOverlayCount = self->_colorOverlayCount;
        if (colorOverlayCount)
        {
          p_var5 = &self->_colorOverlay->var5;
          v24 = p_var5;
          do
          {
            v25 = *v24;
            v24 += 24;
            if (v25)
            {
              v20 = v10;
              *((float *)p_var5 - 4) = v20;
              v21 = v11;
              *((float *)p_var5 - 3) = v21;
              v26 = *((float *)p_var5 - 1);
              if (v26 <= 0.0)
                v27 = 1.0;
              else
                v27 = v26;
              v28 = Alpha * v27;
              v22 = v12;
              *((float *)p_var5 - 2) = v22;
              *((float *)p_var5 - 1) = v28;
            }
            p_var5 = v24;
            --colorOverlayCount;
          }
          while (colorOverlayCount);
        }
        hueSaturationCount = self->_hueSaturationCount;
        if (hueSaturationCount)
        {
          p_var3 = &self->_hueSaturation->var3;
          do
          {
            if (*((_BYTE *)p_var3 + 8)
              && (vabdd_f64(v10, *(p_var3 - 1)) > 0.00000011920929
               || vabdd_f64(v11, *p_var3) > 0.00000011920929
               || vabdd_f64(v12, p_var3[1]) > 0.00000011920929))
            {
              v30 = v10;
              *(p_var3 - 1) = v30;
              v31 = v11;
              *p_var3 = v31;
              v32 = v12;
              p_var3[1] = v32;
              *((_BYTE *)p_var3 + 9) = 1;
            }
            p_var3 += 6;
            --hueSaturationCount;
          }
          while (hueSaturationCount);
        }
      }
      else
      {
        v34 = Alpha;
        self->_outputOpacity = v34;
        v35 = self->_colorOverlayCount;
        if (v35)
        {
          p_var4 = &self->_colorOverlay->var4;
          do
          {
            v36 = v10;
            *(p_var4 - 3) = v36;
            v37 = v11;
            *(p_var4 - 2) = v37;
            v38 = v12;
            *(p_var4 - 1) = v38;
            *p_var4 = v34;
            p_var4 += 6;
            --v35;
          }
          while (v35);
        }
        innerGlowCount = self->_innerGlowCount;
        if (innerGlowCount)
        {
          v44 = &self->_innerGlow->var3;
          do
          {
            v41 = v10;
            *(v44 - 2) = v41;
            v42 = v11;
            *(v44 - 1) = v42;
            v43 = v12;
            *v44 = v43;
            v44 += 6;
            --innerGlowCount;
          }
          while (innerGlowCount);
        }
        innerShadowCount = self->_innerShadowCount;
        if (innerShadowCount)
        {
          v49 = &self->_innerShadow->var3;
          do
          {
            v46 = v10;
            *(v49 - 2) = v46;
            v47 = v11;
            *(v49 - 1) = v47;
            v48 = v12;
            *v49 = v48;
            v49 += 12;
            --innerShadowCount;
          }
          while (innerShadowCount);
        }
        outerGlowCount = self->_outerGlowCount;
        if (outerGlowCount)
        {
          p_var2 = &self->_outerGlow->var2;
          do
          {
            v51 = v10;
            *(p_var2 - 2) = v51;
            v52 = v11;
            *(p_var2 - 1) = v52;
            v53 = v12;
            *p_var2 = v53;
            p_var2 += 6;
            --outerGlowCount;
          }
          while (outerGlowCount);
        }
        engraveShadowCount = self->_engraveShadowCount;
        if (engraveShadowCount)
        {
          v59 = &self->_engraveShadow->var2;
          do
          {
            v56 = v10;
            *(v59 - 2) = v56;
            v57 = v11;
            *(v59 - 1) = v57;
            v58 = v12;
            *v59 = v58;
            v59 += 12;
            --engraveShadowCount;
          }
          while (engraveShadowCount);
        }
        extraShadowCount = self->_extraShadowCount;
        if (extraShadowCount)
        {
          v64 = &self->_extraShadow->var2;
          do
          {
            v61 = v10;
            *(v64 - 2) = v61;
            v62 = v11;
            *(v64 - 1) = v62;
            v63 = v12;
            *v64 = v63;
            v64 += 12;
            --extraShadowCount;
          }
          while (extraShadowCount);
        }
      }
    }
    if ((v18 & 1) == 0)
    {
      if (-[CUIShapeEffectStack hasInnerGradient](self, "hasInnerGradient"))
      {
        innerGradientCount = self->_innerGradientCount;
        if (innerGradientCount)
        {
          p_var7 = &self->_innerGradient->var7;
          do
          {
            v69 = *p_var7;
            v66.f64[1] = v10 * (1.0 - Alpha);
            v66.f64[0] = v12 * (1.0 - Alpha);
            v67.f64[1] = v11 * (1.0 - Alpha);
            v67.f64[0] = v66.f64[1];
            *(float32x4_t *)(p_var7 - 6) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(v67, vcvtq_f64_f32(*(float32x2_t *)(p_var7 - 6)), v69)), vmlaq_n_f64(v66, vcvt_hight_f64_f32(*(float32x4_t *)(p_var7 - 6)), v69));
            v70 = v67.f64[1] + v69 * *(p_var7 - 2);
            v71 = v66.f64[0] + v69 * *(p_var7 - 1);
            *(p_var7 - 2) = v70;
            *(p_var7 - 1) = v71;
            *(float *)&v69 = 1.0 - Alpha + v69;
            *p_var7 = *(float *)&v69;
            p_var7 += 8;
            --innerGradientCount;
          }
          while (innerGradientCount);
        }
      }
      else if (-[CUIShapeEffectStack hasColorOverlay](self, "hasColorOverlay"))
      {
        v72 = self->_colorOverlayCount;
        if (v72)
        {
          v73 = &self->_colorOverlay->var4;
          do
          {
            v74 = *v73;
            v75 = v10 * (1.0 - Alpha) + v74 * *(v73 - 3);
            v76 = v11 * (1.0 - Alpha) + v74 * *(v73 - 2);
            *(v73 - 3) = v75;
            *(v73 - 2) = v76;
            v77 = v12 * (1.0 - Alpha) + v74 * *(v73 - 1);
            *(float *)&v74 = 1.0 - Alpha + v74;
            *(v73 - 1) = v77;
            *v73 = *(float *)&v74;
            v73 += 6;
            --v72;
          }
          while (v72);
        }
      }
      else
      {
        self->_colorOverlayCount = 1;
        v78 = ($EB69DF3B1DDA5C6930A5C79FD1E30C08 *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000402C707793uLL);
        self->_colorOverlay = v78;
        v79 = v10;
        v80 = v11;
        v78->var1 = v79;
        v78->var2 = v80;
        v81 = v12;
        v82 = Alpha;
        v78->var3 = v81;
        v78->var4 = v82;
      }
    }
  }
}

- (void)scaleBrightnessOfEffectColorsByAmount:(double)a3 onlyTintableColors:(BOOL)a4
{
  _BOOL4 v5;
  unint64_t colorOverlayCount;
  uint64_t v8;
  unint64_t i;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *colorOverlay;
  float *p_var0;
  float v12;
  float v13;
  float v14;
  unint64_t hueSaturationCount;
  uint64_t v16;
  unint64_t j;
  $69725AE9E2C336799B3330C9F2B37222 *hueSaturation;
  $69725AE9E2C336799B3330C9F2B37222 *v19;
  float v20;
  float v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  if (vabdd_f64(1.0, a3) > 0.00000011920929)
  {
    v5 = a4;
    colorOverlayCount = self->_colorOverlayCount;
    if (colorOverlayCount)
    {
      v8 = 0;
      for (i = 0; i < colorOverlayCount; ++i)
      {
        colorOverlay = self->_colorOverlay;
        if (!v5 || colorOverlay[v8].var5)
        {
          v27 = 0.0;
          v28 = 0.0;
          v25 = 0.0;
          v26 = 0.0;
          v23 = 0.0;
          v24 = 0.0;
          p_var0 = (float *)&colorOverlay[v8].var0;
          _CUIRGBToHSB(&v28, &v27, &v26, colorOverlay[v8].var1, colorOverlay[v8].var2, colorOverlay[v8].var3);
          v26 = v26 * a3;
          _CUIHSBToRGB(&v25, &v24, &v23, v28, v27, v26);
          v12 = v25;
          p_var0[1] = v12;
          v13 = v24;
          p_var0[2] = v13;
          v14 = v23;
          p_var0[3] = v14;
          colorOverlayCount = self->_colorOverlayCount;
        }
        ++v8;
      }
    }
    hueSaturationCount = self->_hueSaturationCount;
    if (hueSaturationCount)
    {
      v16 = 0;
      for (j = 0; j < hueSaturationCount; ++j)
      {
        hueSaturation = self->_hueSaturation;
        if (!v5 || hueSaturation[v16].var5)
        {
          v27 = 0.0;
          v28 = 0.0;
          v25 = 0.0;
          v26 = 0.0;
          v23 = 0.0;
          v24 = 0.0;
          v19 = &hueSaturation[v16];
          _CUIRGBToHSB(&v28, &v27, &v26, hueSaturation[v16].var2, hueSaturation[v16].var3, hueSaturation[v16].var4);
          v26 = v26 * a3;
          _CUIHSBToRGB(&v25, &v24, &v23, v28, v27, v26);
          v20 = v25;
          v19->var2 = v20;
          v21 = v24;
          v19->var3 = v21;
          v22 = v23;
          v19->var4 = v22;
          v19->var6 = 1;
          hueSaturationCount = self->_hueSaturationCount;
        }
        ++v16;
      }
    }
  }
}

- (void)adjustEffectColorsToTemperature:(int)a3 onlyTintableColors:(BOOL)a4
{
  double v4;
  double v5;
  _BOOL4 v7;
  unint64_t colorOverlayCount;
  uint64_t v10;
  unint64_t i;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *colorOverlay;
  float *p_var0;
  float v14;
  float v15;
  float v16;
  unint64_t hueSaturationCount;
  uint64_t v18;
  unint64_t j;
  $69725AE9E2C336799B3330C9F2B37222 *hueSaturation;
  $69725AE9E2C336799B3330C9F2B37222 *v21;
  float v22;
  float v23;
  float v24;
  double v25;
  double v26;
  double v27[11];

  if (a3 != 6500)
  {
    v27[9] = v4;
    v27[10] = v5;
    if ((a3 - 1000) <= 0x9858)
    {
      v7 = a4;
      v26 = 0.0;
      v27[0] = 0.0;
      v25 = 0.0;
      colorOverlayCount = self->_colorOverlayCount;
      if (colorOverlayCount)
      {
        v10 = 0;
        for (i = 0; i < colorOverlayCount; ++i)
        {
          colorOverlay = self->_colorOverlay;
          if (!v7 || colorOverlay[v10].var5)
          {
            p_var0 = (float *)&colorOverlay[v10].var0;
            _CUICreateColorByAdjustingTemperature(a3, v27, &v26, &v25, colorOverlay[v10].var1, colorOverlay[v10].var2, colorOverlay[v10].var3);
            v14 = v27[0];
            p_var0[1] = v14;
            v15 = v26;
            p_var0[2] = v15;
            v16 = v25;
            p_var0[3] = v16;
            colorOverlayCount = self->_colorOverlayCount;
          }
          ++v10;
        }
      }
      hueSaturationCount = self->_hueSaturationCount;
      if (hueSaturationCount)
      {
        v18 = 0;
        for (j = 0; j < hueSaturationCount; ++j)
        {
          hueSaturation = self->_hueSaturation;
          if (!v7 || hueSaturation[v18].var5)
          {
            v21 = &hueSaturation[v18];
            _CUICreateColorByAdjustingTemperature(a3, v27, &v26, &v25, hueSaturation[v18].var2, hueSaturation[v18].var3, hueSaturation[v18].var4);
            v22 = v27[0];
            v21->var2 = v22;
            v23 = v26;
            v21->var3 = v23;
            v24 = v25;
            v21->var4 = v24;
            v21->var6 = 1;
            hueSaturationCount = self->_hueSaturationCount;
          }
          ++v18;
        }
      }
    }
  }
}

- (id)standardEffectCompositeWithShapeImage:(id)a3 blendOntoImage:(BOOL)a4
{
  double v4;
  _BOOL4 v5;
  int v8;
  id v9;
  double v10;
  CIImage *v11;
  uint64_t v12;
  unint64_t v13;
  $45A57A840939F8DA3264B2B8C70AC12D *v14;
  __int128 v15;
  CIImage *v16;
  uint64_t v17;
  unint64_t v18;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *v19;
  __int128 v20;
  _BOOL4 v21;
  uint64_t v22;
  unint64_t v23;
  $69725AE9E2C336799B3330C9F2B37222 *v24;
  __int128 v25;
  CIImage *v26;
  uint64_t v27;
  unint64_t v28;
  $B9DFBB3EC52729005FFFDFFACDA0AF43 *v29;
  __int128 v30;
  uint64_t v31;
  unint64_t v32;
  $C07A9C4F79504F2E326AD5E2BA2D7579 *v33;
  __int128 v34;
  CGPoint var8;
  unint64_t bevelEmbossCount;
  uint64_t v37;
  unint64_t i;
  $E0EE018EFC1CA26785F52D94F92F8253 *v39;
  __int128 v40;
  __int128 v41;
  CGPoint v42;
  CIImage *v43;
  uint64_t v44;
  unint64_t v45;
  $9A3F6720D51884C1BD061C340F5007EE *v46;
  __int128 v47;
  uint64_t v48;
  unint64_t v49;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v50;
  __int128 v51;
  CGPoint v52;
  uint64_t v53;
  unint64_t v54;
  $1DE4C1FD5A12EFAE99762DD70974AA56 *v55;
  __int128 v56;
  CGPoint v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t j;
  $E0EE018EFC1CA26785F52D94F92F8253 *v61;
  __int128 v62;
  __int128 v63;
  CGPoint v64;
  id v65;
  __int128 v67;
  __int128 v68;
  CGPoint v69;
  unsigned int var12;

  v5 = a4;
  if (standardEffectCompositeWithShapeImage_blendOntoImage__once_token != -1)
    dispatch_once(&standardEffectCompositeWithShapeImage_blendOntoImage__once_token, &__block_literal_global_193);
  v8 = standardEffectCompositeWithShapeImage_blendOntoImage__blendWithMaskAvailable;
  *(float *)&v4 = self->_shapeOpacity;
  v9 = -[CUIShapeEffectStack image:withAdjustedOpacity:](self, "image:withAdjustedOpacity:", a3, v4);
  if (-[CUIShapeEffectStack hasEffects](self, "hasEffects"))
  {
    v11 = +[CIImage emptyImage](CIImage, "emptyImage");
    if (v5)
      v11 = +[CUIShapeEffectStack composite:over:](CUIShapeEffectStack, "composite:over:", a3, v11);
    if (!self->_bypassColorFills)
    {
      if (self->_innerGradientCount)
      {
        v12 = 0;
        v13 = 0;
        do
        {
          v14 = &self->_innerGradient[v12];
          v15 = *(_OWORD *)&v14->var4;
          v67 = *(_OWORD *)&v14->var0;
          v68 = v15;
          v16 = -[CUIShapeEffectStack imageWithInteriorGradientFillOfImage:effect:](self, "imageWithInteriorGradientFillOfImage:effect:", v9, &v67);
          ++v13;
          ++v12;
        }
        while (v13 < self->_innerGradientCount);
        v11 = v16;
      }
      if (self->_colorOverlayCount)
      {
        v17 = 0;
        v18 = 0;
        do
        {
          v19 = &self->_colorOverlay[v17];
          v20 = *(_OWORD *)&v19->var0;
          *(_QWORD *)&v68 = *(_QWORD *)&v19->var4;
          v67 = v20;
          v11 = -[CUIShapeEffectStack imageWithColorOverlayOfImage:effect:](self, "imageWithColorOverlayOfImage:effect:", v11, &v67);
          ++v18;
          ++v17;
        }
        while (v18 < self->_colorOverlayCount);
      }
    }
    v21 = v8 != 0;
    if (self->_hueSaturationCount)
    {
      v22 = 0;
      v23 = 0;
      do
      {
        v24 = &self->_hueSaturation[v22];
        v25 = *(_OWORD *)&v24->var0;
        *(_QWORD *)&v68 = *(_QWORD *)&v24->var4;
        v67 = v25;
        v26 = -[CUIShapeEffectStack imageWithHueSaturationOfImage:effect:](self, "imageWithHueSaturationOfImage:effect:", v9, &v67);
        ++v23;
        ++v22;
      }
      while (v23 < self->_hueSaturationCount);
      v11 = v26;
      v21 = 0;
    }
    if (self->_innerGlowCount)
    {
      v27 = 0;
      v28 = 0;
      do
      {
        v29 = &self->_innerGlow[v27];
        v30 = *(_OWORD *)&v29->var0;
        *(_QWORD *)&v68 = *(_QWORD *)&v29->var4;
        v67 = v30;
        v11 = +[CUIShapeEffectStack blend:over:blendKind:](CUIShapeEffectStack, "blend:over:blendKind:", -[CUIShapeEffectStack imageWithInnerGlowOfImage:effect:](self, "imageWithInnerGlowOfImage:effect:", v9, &v67), v11, self->_innerGlow[v27].var0);
        ++v28;
        ++v27;
      }
      while (v28 < self->_innerGlowCount);
    }
    if (self->_innerShadowCount)
    {
      v31 = 0;
      v32 = 0;
      do
      {
        v33 = &self->_innerShadow[v31];
        v34 = *(_OWORD *)&v33->var0;
        var8 = v33->var8;
        v68 = *(_OWORD *)&v33->var4;
        v69 = var8;
        v67 = v34;
        v11 = +[CUIShapeEffectStack blend:over:blendKind:](CUIShapeEffectStack, "blend:over:blendKind:", -[CUIShapeEffectStack imageWithInnerShadowOfImage:effect:](self, "imageWithInnerShadowOfImage:effect:", v9, &v67), v11, self->_innerShadow[v31].var0);
        ++v32;
        ++v31;
      }
      while (v32 < self->_innerShadowCount);
    }
    bevelEmbossCount = self->_bevelEmbossCount;
    if (bevelEmbossCount)
    {
      v37 = 0;
      for (i = 0; i < bevelEmbossCount; ++i)
      {
        v39 = &self->_emboss[v37];
        if (v39->var12 == 1)
        {
          v40 = *(_OWORD *)&v39->var0;
          v41 = *(_OWORD *)&v39->var4;
          v42 = *(CGPoint *)&v39->var8;
          var12 = v39->var12;
          v68 = v41;
          v69 = v42;
          v67 = v40;
          v11 = +[CUIShapeEffectStack composite:over:](CUIShapeEffectStack, "composite:over:", -[CUIShapeEffectStack imageWithBevelEmbossOfImage:effect:](self, "imageWithBevelEmbossOfImage:effect:", v9, &v67), v11);
          bevelEmbossCount = self->_bevelEmbossCount;
        }
        ++v37;
      }
    }
    if (!standardEffectCompositeWithShapeImage_blendOntoImage__blendWithMaskAvailable)
      v11 = +[CUIShapeEffectStack composite:into:](CUIShapeEffectStack, "composite:into:", v11, v9);
    v43 = +[CIImage emptyImage](CIImage, "emptyImage");
    if (self->_outerGlowCount)
    {
      v44 = 0;
      v45 = 0;
      do
      {
        v46 = &self->_outerGlow[v44];
        v47 = *(_OWORD *)&v46->var0;
        *(_QWORD *)&v68 = *(_QWORD *)&v46->var4;
        v67 = v47;
        v43 = +[CUIShapeEffectStack composite:over:](CUIShapeEffectStack, "composite:over:", -[CUIShapeEffectStack imageWithOuterGlowOfImage:effect:](self, "imageWithOuterGlowOfImage:effect:", v9, &v67), v43);
        ++v45;
        ++v44;
      }
      while (v45 < self->_outerGlowCount);
    }
    if (self->_engraveShadowCount)
    {
      v48 = 0;
      v49 = 0;
      do
      {
        v50 = &self->_engraveShadow[v48];
        v51 = *(_OWORD *)&v50->var0;
        v52 = v50->var8;
        v68 = *(_OWORD *)&v50->var4;
        v69 = v52;
        v67 = v51;
        v43 = +[CUIShapeEffectStack composite:over:](CUIShapeEffectStack, "composite:over:", -[CUIShapeEffectStack imageWithEngraveShadowOfImage:effect:](self, "imageWithEngraveShadowOfImage:effect:", v9, &v67), v43);
        ++v49;
        ++v48;
      }
      while (v49 < self->_engraveShadowCount);
    }
    if (self->_extraShadowCount)
    {
      v53 = 0;
      v54 = 0;
      do
      {
        v55 = &self->_extraShadow[v53];
        v56 = *(_OWORD *)&v55->var0;
        v57 = v55->var8;
        v68 = *(_OWORD *)&v55->var4;
        v69 = v57;
        v67 = v56;
        v43 = +[CUIShapeEffectStack composite:over:](CUIShapeEffectStack, "composite:over:", -[CUIShapeEffectStack imageWithExtraShadowOfImage:effect:](self, "imageWithExtraShadowOfImage:effect:", v9, &v67), v43);
        ++v54;
        ++v53;
      }
      while (v54 < self->_extraShadowCount);
    }
    v58 = self->_bevelEmbossCount;
    if (v58)
    {
      v59 = 0;
      for (j = 0; j < v58; ++j)
      {
        v61 = &self->_emboss[v59];
        if (v61->var12 != 1)
        {
          v62 = *(_OWORD *)&v61->var0;
          v63 = *(_OWORD *)&v61->var4;
          v64 = *(CGPoint *)&v61->var8;
          var12 = v61->var12;
          v68 = v63;
          v69 = v64;
          v67 = v62;
          v43 = +[CUIShapeEffectStack composite:over:](CUIShapeEffectStack, "composite:over:", -[CUIShapeEffectStack imageWithBevelEmbossOfImage:effect:](self, "imageWithBevelEmbossOfImage:effect:", v9, &v67), v43);
          v58 = self->_bevelEmbossCount;
        }
        ++v59;
      }
    }
    if (v21)
      v65 = +[CUIShapeEffectStack imageFromBlendWithMask:foreground:background:](CUIShapeEffectStack, "imageFromBlendWithMask:foreground:background:", a3, v11, v43);
    else
      v65 = +[CUIShapeEffectStack composite:over:](CUIShapeEffectStack, "composite:over:", v11, v43);
    v9 = v65;
  }
  *(float *)&v10 = self->_outputOpacity;
  return -[CUIShapeEffectStack image:withAdjustedOpacity:](self, "image:withAdjustedOpacity:", v9, v10);
}

CIFilter *__76__CUIShapeEffectStack_standardEffectCompositeWithShapeImage_blendOntoImage___block_invoke()
{
  CIFilter *result;

  result = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBlendWithAlphaMask"));
  standardEffectCompositeWithShapeImage_blendOntoImage__blendWithMaskAvailable = result != 0;
  return result;
}

- (id)optimizedSingleBlurEffectCompositeWithShapeImage:(id)a3
{
  CIImage *v5;
  $45A57A840939F8DA3264B2B8C70AC12D *innerGradient;
  __int128 v7;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *colorOverlay;
  __int128 v9;
  __int128 v11;
  __int128 v12;

  v5 = +[CIImage emptyImage](CIImage, "emptyImage");
  if (-[CUIShapeEffectStack hasInnerGradient](self, "hasInnerGradient"))
  {
    innerGradient = self->_innerGradient;
    v7 = *(_OWORD *)&innerGradient->var4;
    v11 = *(_OWORD *)&innerGradient->var0;
    v12 = v7;
    v5 = -[CUIShapeEffectStack imageWithInteriorGradientFillOfImage:effect:](self, "imageWithInteriorGradientFillOfImage:effect:", a3, &v11);
  }
  if (-[CUIShapeEffectStack hasColorOverlay](self, "hasColorOverlay"))
  {
    colorOverlay = self->_colorOverlay;
    v9 = *(_OWORD *)&colorOverlay->var0;
    *(_QWORD *)&v12 = *(_QWORD *)&colorOverlay->var4;
    v11 = v9;
    v5 = -[CUIShapeEffectStack imageWithColorOverlayOfImage:effect:](self, "imageWithColorOverlayOfImage:effect:", v5, &v11);
  }
  return -[CUIShapeEffectStack imageWithSingleBlurShapeEffectOfImage:withInteriorFill:](self, "imageWithSingleBlurShapeEffectOfImage:withInteriorFill:", a3, v5);
}

- (id)compositeEffectStackWithShapeImage:(id)a3 withScale:(double)a4 blendOntoImage:(BOOL)a5
{
  _BOOL8 v5;
  int renderStrategy;

  v5 = a5;
  if (self->_scalefactor != a4)
    -[CUIShapeEffectStack scaleEffectParametersBy:](self, "scaleEffectParametersBy:");
  -[CUIShapeEffectStack _normalizeEffectParameters](self, "_normalizeEffectParameters");
  if (_CUIDebugUseStandardRendering())
  {
    self->_renderStrategy = 1;
    return -[CUIShapeEffectStack standardEffectCompositeWithShapeImage:blendOntoImage:](self, "standardEffectCompositeWithShapeImage:blendOntoImage:", a3, v5);
  }
  renderStrategy = self->_renderStrategy;
  if (renderStrategy == 1)
    return -[CUIShapeEffectStack standardEffectCompositeWithShapeImage:blendOntoImage:](self, "standardEffectCompositeWithShapeImage:blendOntoImage:", a3, v5);
  if (renderStrategy == 2)
    return -[CUIShapeEffectStack optimizedSingleBlurEffectCompositeWithShapeImage:](self, "optimizedSingleBlurEffectCompositeWithShapeImage:", a3);
  else
    return 0;
}

- (CGRect)effectPaddingWithScale:(double)a3
{
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat x;
  unint64_t v11;
  uint64_t v12;
  CGFloat v13;
  uint64_t v14;
  unint64_t v15;
  CGFloat v16;
  uint64_t v17;
  unint64_t v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;
  CGRect v35;

  if (self->_scalefactor != a3)
    -[CUIShapeEffectStack scaleEffectParametersBy:](self, "scaleEffectParametersBy:");
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  -[CUIShapeEffectStack _normalizeEffectParameters](self, "_normalizeEffectParameters");
  v7 = height;
  v8 = width;
  v9 = y;
  x = CGRectZero.origin.x;
  if (-[CUIShapeEffectStack hasOuterGlow](self, "hasOuterGlow"))
  {
    v7 = height;
    v8 = width;
    v9 = y;
    x = CGRectZero.origin.x;
    if (self->_outerGlowCount)
    {
      v11 = 0;
      v12 = 16;
      x = CGRectZero.origin.x;
      v9 = y;
      v8 = width;
      v7 = height;
      do
      {
        v24.origin.x = x;
        v24.origin.y = v9;
        v24.size.width = v8;
        v24.size.height = v7;
        v13 = -*(float *)((char *)&self->_outerGlow->var0 + v12);
        v25 = CGRectInset(v24, v13, v13);
        x = v25.origin.x;
        v9 = v25.origin.y;
        v8 = v25.size.width;
        v7 = v25.size.height;
        ++v11;
        v12 += 24;
      }
      while (v11 < self->_outerGlowCount);
    }
  }
  if (-[CUIShapeEffectStack hasBevelEmboss](self, "hasBevelEmboss") && self->_bevelEmbossCount)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      v26.origin.x = CGRectZero.origin.x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v16 = -(float)(self->_emboss[v14].var0 + self->_emboss[v14].var1);
      v34 = CGRectInset(v26, v16, v16);
      v27.origin.x = x;
      v27.origin.y = v9;
      v27.size.width = v8;
      v27.size.height = v7;
      v28 = CGRectUnion(v27, v34);
      x = v28.origin.x;
      v9 = v28.origin.y;
      v8 = v28.size.width;
      v7 = v28.size.height;
      ++v15;
      ++v14;
    }
    while (v15 < self->_bevelEmbossCount);
  }
  if (-[CUIShapeEffectStack hasEngraveShadow](self, "hasEngraveShadow") && self->_engraveShadowCount)
  {
    v17 = 0;
    v18 = 0;
    do
    {
      v29.origin.x = CGRectZero.origin.x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      v19 = -self->_engraveShadow[v17].var4;
      v30 = CGRectInset(v29, v19, v19);
      v35 = CGRectOffset(v30, -self->_engraveShadow[v17].var8.x, -self->_engraveShadow[v17].var8.y);
      v31.origin.x = x;
      v31.origin.y = v9;
      v31.size.width = v8;
      v31.size.height = v7;
      v32 = CGRectUnion(v31, v35);
      x = v32.origin.x;
      v9 = v32.origin.y;
      v8 = v32.size.width;
      v7 = v32.size.height;
      ++v18;
      ++v17;
    }
    while (v18 < self->_engraveShadowCount);
  }
  v20 = x;
  v21 = v9;
  v22 = v8;
  v23 = v7;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)effectInsetsWithScale:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  -[CUIShapeEffectStack effectPaddingWithScale:](self, "effectPaddingWithScale:", a3);
  v4 = v3;
  v6 = v5;
  v8 = -(v7 + v3);
  v10 = -(v9 + v5);
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.var3 = v13;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (id)processedImageFromImage:(id)a3
{
  return -[CUIShapeEffectStack compositeEffectStackWithShapeImage:withScale:blendOntoImage:](self, "compositeEffectStackWithShapeImage:withScale:blendOntoImage:", a3, 1, 1.0);
}

- (id)processedImageFromImage:(id)a3 withScale:(double)a4
{
  return -[CUIShapeEffectStack compositeEffectStackWithShapeImage:withScale:blendOntoImage:](self, "compositeEffectStackWithShapeImage:withScale:blendOntoImage:", a3, 1, a4);
}

- (id)processedImageFromShapeImage:(id)a3
{
  return -[CUIShapeEffectStack compositeEffectStackWithShapeImage:withScale:blendOntoImage:](self, "compositeEffectStackWithShapeImage:withScale:blendOntoImage:", a3, 0, 1.0);
}

- (id)processedImageFromShapeImage:(id)a3 withScale:(double)a4
{
  return -[CUIShapeEffectStack processedImageFromShapeImage:withScale:invertShadows:](self, "processedImageFromShapeImage:withScale:invertShadows:", a3, 0, a4);
}

- (id)processedImageFromShapeImage:(id)a3 withScale:(double)a4 invertShadows:(BOOL)a5
{
  unint64_t innerShadowCount;
  CGFloat *p_y;
  unint64_t engraveShadowCount;
  CGFloat *v8;
  unint64_t extraShadowCount;
  CGFloat *v10;

  if (a5)
  {
    innerShadowCount = self->_innerShadowCount;
    if (innerShadowCount)
    {
      p_y = &self->_innerShadow->var8.y;
      do
      {
        *p_y = -*p_y;
        p_y += 6;
        --innerShadowCount;
      }
      while (innerShadowCount);
    }
    engraveShadowCount = self->_engraveShadowCount;
    if (engraveShadowCount)
    {
      v8 = &self->_engraveShadow->var8.y;
      do
      {
        *v8 = -*v8;
        v8 += 6;
        --engraveShadowCount;
      }
      while (engraveShadowCount);
    }
    extraShadowCount = self->_extraShadowCount;
    if (extraShadowCount)
    {
      v10 = &self->_extraShadow->var8.y;
      do
      {
        *v10 = -*v10;
        v10 += 6;
        --extraShadowCount;
      }
      while (extraShadowCount);
    }
  }
  return -[CUIShapeEffectStack compositeEffectStackWithShapeImage:withScale:blendOntoImage:](self, "compositeEffectStackWithShapeImage:withScale:blendOntoImage:", a3, 0, a4);
}

- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4
{
  return -[CUIShapeEffectStack newFlattenedImageFromShapeCGImage:withScale:cache:](self, "newFlattenedImageFromShapeCGImage:withScale:cache:", a3, 0, a4);
}

- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4 cache:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  CGImage *Property;
  CGImage *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t SRGB;
  uint64_t v23;
  id v24;

  v5 = a5;
  v9 = -[CUIShapeEffectStack cacheKey](self, "cacheKey");
  Property = (CGImage *)CGImageGetProperty(a3, v9);
  if (!Property || (v11 = Property, Property == a3))
  {
    v12 = objc_msgSend(objc_alloc((Class)CIImage), "initWithCGImage:", a3);
    v13 = -[CUIShapeEffectStack compositeEffectStackWithShapeImage:withScale:blendOntoImage:](self, "compositeEffectStackWithShapeImage:withScale:blendOntoImage:", v12, 0, a4);
    objc_msgSend(v13, "extent");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    SRGB = _CUIColorSpaceGetSRGB();
    v24 = objc_msgSend((id)objc_opt_class(self, v23), "sharedCIContext");
    v11 = (CGImage *)objc_msgSend(v24, "createCGImage:fromRect:format:colorSpace:deferred:", v13, objc_msgSend(v24, "workingFormat"), SRGB, 1, v15, v17, v19, v21);

    if (v5)
      CGImageSetProperty(a3, v9, v11);
  }
  else
  {
    CGImageRetain(Property);
  }
  return v11;
}

- (CGImage)_newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4 ciContext:(id)a5 blendOverImage:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGColorSpace *SRGB;
  size_t AlignedBytesPerRow;
  const void *Data;
  CGDataProvider *v27;
  CGImage *v28;

  v6 = a6;
  v10 = objc_msgSend(objc_alloc((Class)CIImage), "initWithCGImage:options:", a3, &unk_1E41DDE28);
  v11 = -[CUIShapeEffectStack compositeEffectStackWithShapeImage:withScale:blendOntoImage:](self, "compositeEffectStackWithShapeImage:withScale:blendOntoImage:", v10, v6, a4);
  objc_msgSend(v10, "extent");
  v13 = v12;
  v15 = v14;
  -[CUIShapeEffectStack effectPaddingWithScale:](self, "effectPaddingWithScale:", a4);
  v17 = v16;
  v19 = v18;
  v21 = v13 + v20;
  v23 = v15 + v22;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow(vcvtd_n_u64_f64(v21, 2uLL));
  Data = (const void *)CGBitmapAllocateData((unint64_t)(v23 * (double)AlignedBytesPerRow));
  objc_msgSend(a5, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v11, Data, AlignedBytesPerRow, kCIFormatBGRA8, SRGB, v17, v19, v21, v23);
  v27 = CGDataProviderCreateWithData(0, Data, (unint64_t)(v23 * (double)AlignedBytesPerRow), (CGDataProviderReleaseDataCallback)CGBitmapDataProviderReleaseData);
  v28 = CGImageCreate((unint64_t)v21, (unint64_t)v23, 8uLL, 0x20uLL, AlignedBytesPerRow, SRGB, 0x2002u, v27, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v27);

  return v28;
}

- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4 ciContext:(id)a5
{
  return -[CUIShapeEffectStack _newFlattenedImageFromShapeCGImage:withScale:ciContext:blendOverImage:](self, "_newFlattenedImageFromShapeCGImage:withScale:ciContext:blendOverImage:", a3, a5, 0, a4);
}

- (CGImage)newFlattenedImageFromCGImage:(CGImage *)a3 withScale:(double)a4 ciContext:(id)a5
{
  return -[CUIShapeEffectStack _newFlattenedImageFromShapeCGImage:withScale:ciContext:blendOverImage:](self, "_newFlattenedImageFromShapeCGImage:withScale:ciContext:blendOverImage:", a3, a5, 1, a4);
}

- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3
{
  return -[CUIShapeEffectStack newFlattenedImageFromShapeCGImage:withScale:](self, "newFlattenedImageFromShapeCGImage:withScale:", a3, 1.0);
}

- (id)processedImageFromShapePath:(CGPath *)a3 inRect:(CGRect)a4
{
  return 0;
}

- (CGColor)newColorByProcessingColor:(CGColor *)a3
{
  return CGColorCreateCopy(a3);
}

- (BOOL)expressableByColorFillCheckingOutputBlending:(BOOL)a3
{
  uint64_t v3;
  unint64_t innerGlowCount;
  unint64_t outerGlowCount;
  unint64_t extraShadowCount;
  unint64_t colorOverlayCount;
  $EB69DF3B1DDA5C6930A5C79FD1E30C08 *colorOverlay;
  BOOL result;
  int v10;
  int var0;
  BOOL v12;
  _QWORD v14[7];

  v3 = 0;
  innerGlowCount = self->_innerGlowCount;
  v14[0] = self->_innerGradientCount;
  v14[1] = innerGlowCount;
  outerGlowCount = self->_outerGlowCount;
  v14[2] = self->_innerShadowCount;
  v14[3] = outerGlowCount;
  extraShadowCount = self->_extraShadowCount;
  v14[4] = self->_engraveShadowCount;
  v14[5] = extraShadowCount;
  v14[6] = self->_bevelEmbossCount;
  do
  {
    if (v14[v3])
      return 0;
    ++v3;
  }
  while (v3 != 7);
  if (a3)
  {
    colorOverlayCount = self->_colorOverlayCount;
    if (colorOverlayCount)
    {
      colorOverlay = self->_colorOverlay;
      do
      {
        result = 0;
        var0 = colorOverlay->var0;
        ++colorOverlay;
        v10 = var0;
        if (var0 > 1986227572)
        {
          if (v10 != 1986229103 && v10 != 1986227573)
            return result;
        }
        else
        {
          if (v10)
            v12 = v10 == 1852797549;
          else
            v12 = 1;
          if (!v12)
            return result;
        }
        --colorOverlayCount;
      }
      while (colorOverlayCount);
    }
  }
  return 1;
}

+ (CGColor)newColorByAdjustingLightnessOfColor:(CGColor *)a3 darker:(BOOL)a4
{
  _BOOL4 v4;
  CGColor *CopyByMatchingToColorSpace;
  CGColorSpace *SRGB;
  CGColorSpaceRef ColorSpace;
  const CGFloat *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float64x2_t v13;
  CGColor *v19;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat components[2];
  double v29;
  double v30;

  if (!a3)
    return 0;
  v4 = a4;
  CopyByMatchingToColorSpace = a3;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  ColorSpace = CGColorGetColorSpace(CopyByMatchingToColorSpace);
  if (!CGColorSpaceEqualToColorSpace(SRGB, ColorSpace))
  {
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(SRGB, kCGRenderingIntentRelativeColorimetric, CopyByMatchingToColorSpace, 0);
    if (CopyByMatchingToColorSpace)
      goto LABEL_5;
    return 0;
  }
  CGColorRetain(CopyByMatchingToColorSpace);
LABEL_5:
  v8 = CGColorGetComponents(CopyByMatchingToColorSpace);
  v9 = *v8;
  v10 = v8[1];
  v26 = v10;
  v27 = v9;
  v11 = v8[2];
  v12 = v8[3];
  v25 = v11;
  v23 = 0.0;
  v24 = 0.0;
  v22 = 0.0;
  if (v4)
  {
    v21 = v12;
    _CUIRGBToHSB(&v24, &v23, &v22, v9, v10, v11);
    v24 = fmod(v24 + 0.5, 1.0);
    _CUIHSBToRGB(&v27, &v26, &v25, v24, v23, v22);
    v13 = vmulq_n_f64((float64x2_t)xmmword_19EC75A30, v26);
    __asm { FMOV            V4.2D, #1.0 }
    *(float64x2_t *)components = vaddq_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v13, (float64x2_t)xmmword_19EC75A40, v27), (float64x2_t)vdupq_n_s64(0xBFB6C8B439581062), v25), (float64x2_t)0, v21), _Q4);
    v29 = v13.f64[0] + v27 * 0.03 + v25 * -0.89 + v21 * 0.0 + 1.0;
    v30 = v21 + v26 * 0.0 + v27 * 0.0 + v25 * 0.0 + 0.0;
  }
  else
  {
    v30 = v10 * 0.0 + v9 * 0.0 + v11 * 0.0 + v12 + 0.0;
    v26 = v10 * -1.347 + v9 * -0.049 + v11 * 0.146 + v12 * 0.0 + 1.25;
    v27 = v10 * -0.097 + v9 * -1.3 + v11 * 0.147 + v12 * 0.0 + 1.25;
    v25 = v10 * -0.097 + v9 * -0.049 + v11 * -1.104 + v12 * 0.0 + 1.25;
    _CUIRGBToHSB(&v24, &v23, &v22, v27, v26, v25);
    v24 = fmod(v24 + 0.5, 1.0);
    _CUIHSBToRGB(&v27, &v26, &v25, v24, v23, v22);
    components[0] = v27;
    components[1] = v26;
    v29 = v25;
  }
  v19 = CGColorCreate(SRGB, components);
  CGColorRelease(CopyByMatchingToColorSpace);
  return v19;
}

- (void)setBypassColorFills:(BOOL)a3
{
  self->_bypassColorFills = a3;
}

- (id)cacheKey
{
  unint64_t v2;
  unint64_t innerGradientCount;
  float *p_var4;
  unint64_t v5;
  unint64_t v6;
  unint64_t colorOverlayCount;
  float *p_var3;
  unint64_t v9;
  unint64_t hueSaturationCount;
  float *v11;
  unint64_t v12;
  unint64_t innerGlowCount;
  float *v14;
  uint64_t v15;
  float v16;
  unint64_t innerShadowCount;
  float *p_var5;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t bevelEmbossCount;
  float *p_var6;
  unint64_t v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  float v33;
  unint64_t outerGlowCount;
  float *v35;
  unint64_t v36;
  unint64_t engraveShadowCount;
  float *v38;
  unint64_t v39;
  float v40;
  float v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t extraShadowCount;
  float *v45;
  unint64_t v46;
  float v47;
  float v48;
  unint64_t v49;
  unint64_t v50;

  v2 = ((unint64_t)self->_scalefactor << ((unint64_t)self->_scalefactor & 7))
     + 83
     * (((unint64_t)self->_outputBlendMode << (self->_outputBlendMode & 7))
      + 83
      * (((unint64_t)(float)(self->_outputOpacity * 100.0) << ((unint64_t)(float)(self->_outputOpacity
                                                                                              * 100.0) & 7))
       + 83
       * ((unint64_t)(float)(self->_shapeOpacity * 100.0) << ((unint64_t)(float)(self->_shapeOpacity
                                                                                             * 100.0) & 7))))
     + 47458321;
  innerGradientCount = self->_innerGradientCount;
  if (innerGradientCount)
  {
    p_var4 = &self->_innerGradient->var4;
    do
    {
      v5 = (unint64_t)(float)(*(p_var4 - 3) * 255.0);
      v6 = (unint64_t)(float)(*(p_var4 - 1) * 255.0);
      v2 = ((unint64_t)(float)(p_var4[3] * 100.0) << ((unint64_t)(float)(p_var4[3] * 100.0) & 7))
         + 83
         * (((unint64_t)(float)(p_var4[2] * 255.0) << ((unint64_t)(float)(p_var4[2] * 255.0) & 7))
          + 83
          * (((unint64_t)(float)(p_var4[1] * 255.0) << ((unint64_t)(float)(p_var4[1] * 255.0) & 7))
           + 83
           * (((unint64_t)(float)(*p_var4 * 255.0) << ((unint64_t)(float)(*p_var4 * 255.0) & 7))
            + 83
            * ((v6 << (v6 & 7))
             + 83
             * (((unint64_t)(float)(*(p_var4 - 2) * 255.0) << ((unint64_t)(float)(*(p_var4 - 2) * 255.0) & 7))
              + 83
              * ((v5 << (v5 & 7))
               + 83 * (((unint64_t)*((unsigned int *)p_var4 - 4) << (*(_DWORD *)(p_var4 - 4) & 7)) + 6889 * v2)))))))
         - 0x57DF3F949DCCE1C0;
      p_var4 += 8;
      --innerGradientCount;
    }
    while (innerGradientCount);
  }
  colorOverlayCount = self->_colorOverlayCount;
  if (colorOverlayCount)
  {
    p_var3 = &self->_colorOverlay->var3;
    do
    {
      v9 = (unint64_t)(float)(*(p_var3 - 2) * 255.0);
      v2 = ((unint64_t)*((unsigned __int8 *)p_var3 + 8) << *((_BYTE *)p_var3 + 8))
         + 83
         * (((unint64_t)(float)(p_var3[1] * 100.0) << ((unint64_t)(float)(p_var3[1] * 100.0) & 7))
          + 83
          * (((unint64_t)(float)(*p_var3 * 255.0) << ((unint64_t)(float)(*p_var3 * 255.0) & 7))
           + 83
           * (((unint64_t)(float)(*(p_var3 - 1) * 255.0) << ((unint64_t)(float)(*(p_var3 - 1) * 255.0) & 7))
            + 83
            * ((v9 << (v9 & 7))
             + 83 * (((unint64_t)*((unsigned int *)p_var3 - 3) << (*(_DWORD *)(p_var3 - 3) & 7)) + 6889 * v2)))))
         + 0x3527352730804F88;
      p_var3 += 6;
      --colorOverlayCount;
    }
    while (colorOverlayCount);
  }
  hueSaturationCount = self->_hueSaturationCount;
  if (hueSaturationCount)
  {
    v11 = &self->_hueSaturation->var3;
    do
    {
      v12 = (unint64_t)(float)(*(v11 - 1) * 255.0);
      v2 = ((unint64_t)*((unsigned __int8 *)v11 + 9) << *((_BYTE *)v11 + 9))
         + 83
         * (((unint64_t)*((unsigned __int8 *)v11 + 8) << *((_BYTE *)v11 + 8))
          + 83
          * (((unint64_t)(float)(v11[1] * 255.0) << ((unint64_t)(float)(v11[1] * 255.0) & 7))
           + 83
           * (((unint64_t)(float)(*v11 * 255.0) << ((unint64_t)(float)(*v11 * 255.0) & 7))
            + 83
            * ((v12 << (v12 & 7))
             + 83
             * (((unint64_t)*(v11 - 2) << ((unint64_t)*(v11 - 2) & 7))
              + 83
              * (((unint64_t)(*(v11 - 3) * 57.2957795) << ((unint64_t)(*(v11 - 3) * 57.2957795) & 7))
               + 6889 * v2))))))
         + 0x46BEAB24AB6CC108;
      v11 += 6;
      --hueSaturationCount;
    }
    while (hueSaturationCount);
  }
  innerGlowCount = self->_innerGlowCount;
  if (innerGlowCount)
  {
    v14 = &self->_innerGlow->var3;
    do
    {
      v15 = *((unsigned int *)v14 - 3);
      v16 = v14[2];
      v2 = ((unint64_t)v16 << ((unint64_t)v16 & 7))
         + 83
         * (((unint64_t)(float)(v14[1] * 100.0) << ((unint64_t)(float)(v14[1] * 100.0) & 7))
          + 83
          * (((unint64_t)(float)(*v14 * 255.0) << ((unint64_t)(float)(*v14 * 255.0) & 7))
           + 83
           * (((unint64_t)(float)(*(v14 - 1) * 255.0) << ((unint64_t)(float)(*(v14 - 1) * 255.0) & 7))
            + 83
            * (((unint64_t)(float)(*(v14 - 2) * 255.0) << ((unint64_t)(float)(*(v14 - 2) * 255.0) & 7))
             + 83 * ((v15 << (v15 & 7)) + 6889 * v2)))))
         + 0x299C35185859F80;
      v14 += 6;
      --innerGlowCount;
    }
    while (innerGlowCount);
  }
  innerShadowCount = self->_innerShadowCount;
  if (innerShadowCount)
  {
    p_var5 = &self->_innerShadow->var5;
    do
    {
      v19 = (unint64_t)(float)(*(p_var5 - 4) * 255.0);
      v20 = ((unint64_t)p_var5[1] << ((unint64_t)p_var5[1] & 7))
          + 83
          * (((unint64_t)(float)(*p_var5 * 100.0) << ((unint64_t)(float)(*p_var5 * 100.0) & 7))
           + 83
           * (((unint64_t)*(p_var5 - 1) << ((unint64_t)*(p_var5 - 1) & 7))
            + 83
            * (((unint64_t)(float)(*(p_var5 - 2) * 255.0) << ((unint64_t)(float)(*(p_var5 - 2) * 255.0) & 7))
             + 83
             * (((unint64_t)(float)(*(p_var5 - 3) * 255.0) << ((unint64_t)(float)(*(p_var5 - 3) * 255.0) & 7))
              + 83
              * ((v19 << (v19 & 7))
               + 83 * (((unint64_t)*((unsigned int *)p_var5 - 5) << (*(_DWORD *)(p_var5 - 5) & 7)) + 6889 * v2))))));
      v21 = (unint64_t)(p_var5[2] * 57.2957795);
      v2 = ((unint64_t)*(double *)(p_var5 + 5) << ((unint64_t)*(double *)(p_var5 + 5) & 7))
         + 83
         * (((unint64_t)*(double *)(p_var5 + 3) << ((unint64_t)*(double *)(p_var5 + 3) & 7))
          + 83 * ((v21 << (v21 & 7)) + 83 * v20))
         - 0x173702E434C82958;
      p_var5 += 12;
      --innerShadowCount;
    }
    while (innerShadowCount);
  }
  bevelEmbossCount = self->_bevelEmbossCount;
  if (bevelEmbossCount)
  {
    p_var6 = &self->_emboss->var6;
    do
    {
      v24 = (unint64_t)*(p_var6 - 6);
      v25 = *(p_var6 - 4) * 57.2957795;
      v26 = (unint64_t)*(p_var6 - 3);
      v27 = (unint64_t)(float)(*(p_var6 - 2) * 255.0);
      v28 = (unint64_t)(float)(*(p_var6 - 1) * 255.0);
      v29 = (unint64_t)(float)(*p_var6 * 255.0);
      v30 = (unint64_t)(float)(p_var6[1] * 100.0);
      v31 = (unint64_t)(float)(p_var6[2] * 255.0);
      v32 = (unint64_t)(float)(p_var6[3] * 255.0);
      v33 = p_var6[4];
      v2 = ((unint64_t)(float)(p_var6[5] * 100.0) << ((unint64_t)(float)(p_var6[5] * 100.0) & 7))
         + 83
         * (((unint64_t)(float)(v33 * 255.0) << ((unint64_t)(float)(v33 * 255.0) & 7))
          + 83
          * ((v32 << (v32 & 7))
           + 83
           * ((v31 << (v31 & 7))
            + 83
            * ((v30 << (v30 & 7))
             + 83
             * ((v29 << (v29 & 7))
              + 83
              * ((v28 << (v28 & 7))
               + 83
               * ((v27 << (v27 & 7))
                + 83
                * ((v26 << (v26 & 7))
                 + 83
                 * (((unint64_t)v25 << ((unint64_t)v25 & 7))
                  + 83
                  * (((unint64_t)*(p_var6 - 5) << ((unint64_t)*(p_var6 - 5) & 7))
                   + 83
                   * ((v24 << (v24 & 7))
                    + 83 * (((unint64_t)*((unsigned int *)p_var6 + 6) << ((_DWORD)p_var6[6] & 7)) + 6889 * v2))))))))))))
         + 0x60D4F8F84CF55FC8;
      p_var6 += 13;
      --bevelEmbossCount;
    }
    while (bevelEmbossCount);
  }
  outerGlowCount = self->_outerGlowCount;
  if (outerGlowCount)
  {
    v35 = &self->_outerGlow->var3;
    do
    {
      v36 = (unint64_t)(float)(*(v35 - 3) * 255.0);
      v2 = ((unint64_t)v35[2] << ((unint64_t)v35[2] & 7))
         + 83
         * (((unint64_t)v35[1] << ((unint64_t)v35[1] & 7))
          + 83
          * (((unint64_t)(float)(*v35 * 100.0) << ((unint64_t)(float)(*v35 * 100.0) & 7))
           + 83
           * (((unint64_t)(float)(*(v35 - 1) * 255.0) << ((unint64_t)(float)(*(v35 - 1) * 255.0) & 7))
            + 83
            * (((unint64_t)(float)(*(v35 - 2) * 255.0) << ((unint64_t)(float)(*(v35 - 2) * 255.0) & 7))
             + 83 * ((v36 << (v36 & 7)) + 6889 * v2)))))
         + 0x601857BC85859F80;
      v35 += 6;
      --outerGlowCount;
    }
    while (outerGlowCount);
  }
  engraveShadowCount = self->_engraveShadowCount;
  if (engraveShadowCount)
  {
    v38 = &self->_engraveShadow->var5;
    do
    {
      v39 = (unint64_t)(float)(*(v38 - 5) * 255.0);
      v40 = *(v38 - 2);
      v41 = v38[1];
      v42 = ((unint64_t)v41 << ((unint64_t)v41 & 7))
          + 83
          * (((unint64_t)*v38 << ((unint64_t)*v38 & 7))
           + 83
           * (((unint64_t)(float)(v40 * 100.0) << ((unint64_t)(float)(v40 * 100.0) & 7))
            + 83
            * (((unint64_t)*(v38 - 1) << ((unint64_t)*(v38 - 1) & 7))
             + 83
             * (((unint64_t)(float)(*(v38 - 3) * 255.0) << ((unint64_t)(float)(*(v38 - 3) * 255.0) & 7))
              + 83
              * (((unint64_t)(float)(*(v38 - 4) * 255.0) << ((unint64_t)(float)(*(v38 - 4) * 255.0) & 7))
               + 83 * ((v39 << (v39 & 7)) + 6889 * v2))))));
      v43 = (unint64_t)(v38[2] * 57.2957795);
      v2 = ((unint64_t)*(double *)(v38 + 5) << ((unint64_t)*(double *)(v38 + 5) & 7))
         + 83
         * (((unint64_t)*(double *)(v38 + 3) << ((unint64_t)*(double *)(v38 + 3) & 7))
          + 83 * ((v43 << (v43 & 7)) + 83 * v42))
         - 0x4B7B6CDC8A65A510;
      v38 += 12;
      --engraveShadowCount;
    }
    while (engraveShadowCount);
  }
  extraShadowCount = self->_extraShadowCount;
  if (extraShadowCount)
  {
    v45 = &self->_extraShadow->var5;
    do
    {
      v46 = (unint64_t)(float)(*(v45 - 5) * 255.0);
      v47 = *(v45 - 2);
      v48 = v45[1];
      v49 = ((unint64_t)v48 << ((unint64_t)v48 & 7))
          + 83
          * (((unint64_t)*v45 << ((unint64_t)*v45 & 7))
           + 83
           * (((unint64_t)(float)(v47 * 100.0) << ((unint64_t)(float)(v47 * 100.0) & 7))
            + 83
            * (((unint64_t)*(v45 - 1) << ((unint64_t)*(v45 - 1) & 7))
             + 83
             * (((unint64_t)(float)(*(v45 - 3) * 255.0) << ((unint64_t)(float)(*(v45 - 3) * 255.0) & 7))
              + 83
              * (((unint64_t)(float)(*(v45 - 4) * 255.0) << ((unint64_t)(float)(*(v45 - 4) * 255.0) & 7))
               + 83 * ((v46 << (v46 & 7)) + 6889 * v2))))));
      v50 = (unint64_t)(v45[2] * 57.2957795);
      v2 = ((unint64_t)*(double *)(v45 + 5) << ((unint64_t)*(double *)(v45 + 5) & 7))
         + 83
         * (((unint64_t)*(double *)(v45 + 3) << ((unint64_t)*(double *)(v45 + 3) & 7))
          + 83 * ((v50 << (v50 & 7)) + 83 * v49))
         + 0x7196D2C630712CD2;
      v45 += 12;
      --extraShadowCount;
    }
    while (extraShadowCount);
  }
  return objc_msgSend(CFSTR("com.apple.CoreUI.ShapeEffectStack."), "stringByAppendingFormat:", CFSTR("%lu"), v2);
}

- (unsigned)outputBlendMode
{
  return self->_outputBlendMode;
}

- (float)shapeOpacity
{
  return self->_shapeOpacity;
}

- (float)outputOpacity
{
  return self->_outputOpacity;
}

- (unint64_t)hueSaturationCount
{
  return self->_hueSaturationCount;
}

- ($69725AE9E2C336799B3330C9F2B37222)hueSaturation
{
  return self->_hueSaturation;
}

- (unint64_t)colorOverlayCount
{
  return self->_colorOverlayCount;
}

- (void)setColorOverlayCount:(unint64_t)a3
{
  self->_colorOverlayCount = a3;
}

- ($EB69DF3B1DDA5C6930A5C79FD1E30C08)colorOverlay
{
  return self->_colorOverlay;
}

- (unint64_t)innerGradientCount
{
  return self->_innerGradientCount;
}

- (void)setInnerGradientCount:(unint64_t)a3
{
  self->_innerGradientCount = a3;
}

- ($45A57A840939F8DA3264B2B8C70AC12D)innerGradient
{
  return self->_innerGradient;
}

- (unint64_t)innerGlowCount
{
  return self->_innerGlowCount;
}

- (void)setInnerGlowCount:(unint64_t)a3
{
  self->_innerGlowCount = a3;
}

- ($B9DFBB3EC52729005FFFDFFACDA0AF43)innerGlow
{
  return self->_innerGlow;
}

- (unint64_t)innerShadowCount
{
  return self->_innerShadowCount;
}

- (void)setInnerShadowCount:(unint64_t)a3
{
  self->_innerShadowCount = a3;
}

- ($C07A9C4F79504F2E326AD5E2BA2D7579)innerShadow
{
  return self->_innerShadow;
}

- (unint64_t)outerGlowCount
{
  return self->_outerGlowCount;
}

- ($9A3F6720D51884C1BD061C340F5007EE)outerGlow
{
  return self->_outerGlow;
}

- (unint64_t)engraveShadowCount
{
  return self->_engraveShadowCount;
}

- (void)setEngraveShadowCount:(unint64_t)a3
{
  self->_engraveShadowCount = a3;
}

- ($1DE4C1FD5A12EFAE99762DD70974AA56)engraveShadow
{
  return self->_engraveShadow;
}

- (unint64_t)extraShadowCount
{
  return self->_extraShadowCount;
}

- ($1DE4C1FD5A12EFAE99762DD70974AA56)extraShadow
{
  return self->_extraShadow;
}

- (unint64_t)bevelEmbossCount
{
  return self->_bevelEmbossCount;
}

- ($E0EE018EFC1CA26785F52D94F92F8253)emboss
{
  return self->_emboss;
}

- (float)scalefactor
{
  return self->_scalefactor;
}

- (int)renderStrategy
{
  return self->_renderStrategy;
}

@end
