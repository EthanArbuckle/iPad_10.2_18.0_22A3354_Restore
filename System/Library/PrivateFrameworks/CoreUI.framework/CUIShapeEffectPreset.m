@implementation CUIShapeEffectPreset

- (id)layerEffectsRepresentation
{
  CUIPSDLayerEffects *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  __objc2_class **v9;
  id v10;

  v3 = objc_alloc_init(CUIPSDLayerEffects);
  v4 = -[CUIShapeEffectPreset effectCount](self, "effectCount");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = -[CUIShapeEffectPreset effectTypeAtIndex:](self, "effectTypeAtIndex:", v6);
      if (v8 <= 1198678371)
      {
        switch(v8)
        {
          case 1131375730:
            v9 = OBJC_CLASS___CUIPSDLayerEffectColorOverlay_ptr;
            goto LABEL_19;
          case 1148350320:
            v9 = OBJC_CLASS___CUIPSDLayerEffectDropShadow_ptr;
            goto LABEL_19;
          case 1164796531:
            v9 = OBJC_CLASS___CUIPSDLayerEffectBevelEmboss_ptr;
            goto LABEL_19;
        }
      }
      else if (v8 > 1768837991)
      {
        if (v8 == 1768837992)
        {
          v9 = OBJC_CLASS___CUIPSDLayerEffectInnerShadow_ptr;
          goto LABEL_19;
        }
        if (v8 == 1866951799)
        {
          v9 = OBJC_CLASS___CUIPSDLayerEffectOuterGlow_ptr;
          goto LABEL_19;
        }
      }
      else
      {
        if (v8 == 1198678372)
        {
          v9 = OBJC_CLASS___CUIPSDLayerEffectGradientOverlay_ptr;
          goto LABEL_19;
        }
        if (v8 == 1766288503)
        {
          v9 = OBJC_CLASS___CUIPSDLayerEffectInnerGlow_ptr;
LABEL_19:
          v10 = objc_msgSend(objc_alloc(*v9), "initWithEffectFromPreset:atIndex:", self, v7);
          -[CUIPSDLayerEffects addLayerEffectComponent:](v3, "addLayerEffectComponent:", v10);

        }
      }
      v6 = (v7 + 1);
      v7 = v6;
    }
    while (v5 > v6);
  }
  return v3;
}

- (CUIShapeEffectPreset)init
{
  CUIShapeEffectPreset *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIShapeEffectPreset;
  result = -[CUIShapeEffectPreset init](&v3, sel_init);
  if (result)
  {
    result->_scaleFactor = 1.0;
    result->_minimumShadowSpread = 0.0;
  }
  return result;
}

- (CUIShapeEffectPreset)initWithEffectScale:(double)a3
{
  CUIShapeEffectPreset *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIShapeEffectPreset;
  result = -[CUIShapeEffectPreset init](&v5, sel_init);
  if (result)
  {
    result->_scaleFactor = a3;
    result->_minimumShadowSpread = 0.0;
  }
  return result;
}

+ (id)requiredEffectParametersForEffectType:(unsigned int)a3
{
  BOOL v3;
  void *v4;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  if ((int)a3 <= 1215653202)
  {
    if ((int)a3 > 1164796530)
    {
      if (a3 == 1164796531)
        return &unk_1E41DDDA0;
      if (a3 != 1180787813)
      {
        v3 = a3 == 1198678372;
        v4 = &unk_1E41DDD28;
LABEL_10:
        if (v3)
          return v4;
        else
          return 0;
      }
      return &unk_1E41DDCF8;
    }
    v6 = 1131375730;
    v7 = &unk_1E41DDD10;
    v9 = &unk_1E41DDD88;
    if (a3 != 1148350320)
      v9 = 0;
  }
  else
  {
    if ((int)a3 <= 1766288502)
    {
      if (a3 == 1215653203)
        return &unk_1E41DDDD0;
      if (a3 != 1397715043)
      {
        v3 = a3 == 1484026465;
        v4 = &unk_1E41DDDB8;
        goto LABEL_10;
      }
      return &unk_1E41DDCF8;
    }
    v6 = 1766288503;
    v7 = &unk_1E41DDD40;
    if (a3 == 1866951799)
      v8 = &unk_1E41DDD70;
    else
      v8 = 0;
    if (a3 == 1768837992)
      v9 = &unk_1E41DDD58;
    else
      v9 = v8;
  }
  if (a3 == v6)
    return v7;
  else
    return v9;
}

- (double)effectScale
{
  return self->_scaleFactor;
}

- (unint64_t)effectCount
{
  unsigned int v2;
  unsigned int v3;

  v2 = 0;
  do
    v3 = v2;
  while (self->_effectIndex[v2++]);
  return v3;
}

- (unsigned)effectTypeAtIndex:(unint64_t)a3
{
  uint64_t v5;

  if (a3 > 0x18 || !self->_effectIndex[a3])
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Invalid effect index %lu for effect preset"), a3);
    if (a3)
      goto LABEL_4;
LABEL_6:
    v5 = 0;
    return self->_parameterList[v5].effectType;
  }
  if (!a3)
    goto LABEL_6;
LABEL_4:
  v5 = *((int *)&self->_parameterList[124].effectValue.angleValue + a3 + 1);
  return self->_parameterList[v5].effectType;
}

- ($BEFD66571C471BB2AEB14086D2581294)valueForParameter:(unsigned int)a3 inEffectAtIndex:(unint64_t)a4
{
  unsigned int v7;
  int v8;
  unsigned int v9;
  BOOL v10;
  int v11;
  unsigned int *v12;
  unint64_t v13;

  if (a3 == 6)
    v7 = 90;
  else
    v7 = 0;
  if (a4 <= 0x18 && self->_effectIndex[a4])
  {
    if (a4)
    {
LABEL_7:
      v8 = *((_DWORD *)&self->_parameterList[124].effectValue.angleValue + a4 + 1);
      goto LABEL_10;
    }
  }
  else
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Invalid effect index %lu for effect preset"), a4);
    if (a4)
      goto LABEL_7;
  }
  v8 = 0;
LABEL_10:
  v9 = self->_effectIndex[a4];
  v10 = __OFSUB__(v9, v8);
  v11 = v9 - v8;
  if ((v11 < 0) ^ v10 | (v11 == 0))
  {
LABEL_14:
    v13 = 0;
  }
  else
  {
    v12 = (unsigned int *)((char *)&self->_parameterList[v8].effectValue.intValue + 2);
    while (*(unsigned int *)((char *)v12 - 6) != a3)
    {
      v12 += 4;
      if (!--v11)
        goto LABEL_14;
    }
    v7 = *((unsigned __int16 *)v12 - 1);
    v13 = ((unint64_t)*v12 << 16) | ((unint64_t)*((unsigned __int16 *)v12 + 2) << 48);
  }
  return ($BEFD66571C471BB2AEB14086D2581294)(v13 | v7);
}

- (void)_insertEffectTuple:(id)a3 atEffectIndex:(unint64_t)a4
{
  unsigned int *effectIndex;
  unsigned int v5;
  int v6;
  unsigned int *v7;
  unint64_t v9;

  effectIndex = self->_effectIndex;
  v5 = self->_effectIndex[a4];
  v6 = self->_effectIndex[a4 + 1];
  if (a4 && !v5)
  {
    v7 = &effectIndex[a4];
    v5 = *(v7 - 1);
    *v7 = v5;
  }
  if (v6 >= 1 && a4 + 1 <= 0x18)
  {
    v9 = a4;
    do
      ++self->_effectIndex[++v9];
    while (v9 != 24);
  }
  self->_parameterList[v5] = ($227A92AB6917B72AF7983ACE8C3D385D)a3;
  ++effectIndex[a4];
}

- (void)getEffectTuples:(id *)a3 count:(unint64_t *)a4 atEffectIndex:(unint64_t)a5
{
  int v9;
  uint64_t v10;

  if (a5 <= 0x18 && self->_effectIndex[a5])
  {
    if (a5)
    {
LABEL_4:
      v9 = *((_DWORD *)&self->_parameterList[124].effectValue.angleValue + a5 + 1);
      goto LABEL_7;
    }
  }
  else
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Invalid effect index %lu for effect preset"), a5);
    if (a5)
      goto LABEL_4;
  }
  v9 = 0;
LABEL_7:
  v10 = (int)self->_effectIndex[a5];
  if (a3)
    *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self->_parameterList[v9];
  if (a4)
    *a4 = v10 - v9;
}

- (void)addValue:(id)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5 atEffectIndex:(unint64_t)a6
{
  uint64_t v8;
  uint64_t v11;

  v8 = *(_QWORD *)&a4;
  if (a6 >= 0x19)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSRangeException, CFSTR("Invalid effect index %lu for effect preset"), a6);
LABEL_4:
    v11 = *((int *)&self->_parameterList[124].effectValue.angleValue + a6 + 1);
    goto LABEL_6;
  }
  if (a6)
    goto LABEL_4;
  v11 = 0;
LABEL_6:
  if (self->_parameterList[v11].effectType != a5 && (signed int)self->_effectIndex[a6] >= 1)
    +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Attempt to add an effect with incompatible type at index %lu"), a6);
  -[CUIShapeEffectPreset _insertEffectTuple:atEffectIndex:](self, "_insertEffectTuple:atEffectIndex:", a5 | (unint64_t)(v8 << 32), a3.var1, a6);
}

- (void)appendValue:(id)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v9 = -[CUIShapeEffectPreset effectCount](self, "effectCount");
  v10 = v9;
  if (v9)
  {
    v11 = *((_DWORD *)&self->_parameterList[124].effectValue.angleValue + v9 + 1);
    if (v11)
      v10 = v9 - (self->_parameterList[v11 - 1].effectType == (_DWORD)v5);
  }
  -[CUIShapeEffectPreset addValue:forParameter:withEffectType:atEffectIndex:](self, "addValue:forParameter:withEffectType:atEffectIndex:", a3.var1, v6, v5, v10);
}

- (void)addValue:(id)a3 forParameter:(unsigned int)a4 withNewEffectType:(unsigned int)a5
{
  -[CUIShapeEffectPreset addValue:forParameter:withEffectType:atEffectIndex:](self, "addValue:forParameter:withEffectType:atEffectIndex:", a3.var1, *(_QWORD *)&a4, *(_QWORD *)&a5, -[CUIShapeEffectPreset effectCount](self, "effectCount"));
}

- (void)addFloatValue:(double)a3 forParameter:(unsigned int)a4 withNewEffectType:(unsigned int)a5
{
  -[CUIShapeEffectPreset addValue:forParameter:withNewEffectType:](self, "addValue:forParameter:withNewEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (void)addEnumValue:(unsigned int)a3 forParameter:(unsigned int)a4 withNewEffectType:(unsigned int)a5
{
  -[CUIShapeEffectPreset addValue:forParameter:withNewEffectType:](self, "addValue:forParameter:withNewEffectType:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (void)addColorValueRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 forParameter:(unsigned int)a6 withNewEffectType:(unsigned int)a7
{
  -[CUIShapeEffectPreset addValue:forParameter:withNewEffectType:](self, "addValue:forParameter:withNewEffectType:", (unsigned __int16)(a3 | (a4 << 8)) | ((unint64_t)a5 << 16), *(_QWORD *)&a6, *(_QWORD *)&a7);
}

- (void)appendFloatValue:(double)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5
{
  -[CUIShapeEffectPreset appendValue:forParameter:withEffectType:](self, "appendValue:forParameter:withEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (void)appendAngleValue:(int64_t)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5
{
  -[CUIShapeEffectPreset appendValue:forParameter:withEffectType:](self, "appendValue:forParameter:withEffectType:", (unsigned __int16)a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (void)appendEnumValue:(unsigned int)a3 forParameter:(unsigned int)a4 withEffectType:(unsigned int)a5
{
  -[CUIShapeEffectPreset appendValue:forParameter:withEffectType:](self, "appendValue:forParameter:withEffectType:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (void)appendColorValueRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 forParameter:(unsigned int)a6 withEffectType:(unsigned int)a7
{
  -[CUIShapeEffectPreset appendValue:forParameter:withEffectType:](self, "appendValue:forParameter:withEffectType:", (unsigned __int16)(a3 | (a4 << 8)) | ((unint64_t)a5 << 16), *(_QWORD *)&a6, *(_QWORD *)&a7);
}

- (void)addShapeOpacityWithOpacity:(double)a3
{
  -[CUIShapeEffectPreset addFloatValue:forParameter:withNewEffectType:](self, "addFloatValue:forParameter:withNewEffectType:", 2, 1397715043, a3);
}

- (void)addOutputOpacityWithOpacity:(double)a3
{
  -[CUIShapeEffectPreset addFloatValue:forParameter:withNewEffectType:](self, "addFloatValue:forParameter:withNewEffectType:", 2, 1180787813, a3);
}

- (void)addColorFillWithRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blendMode:(unsigned int)a7 tintable:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v9;

  v8 = a8;
  v9 = *(_QWORD *)&a7;
  -[CUIShapeEffectPreset addColorValueRed:green:blue:forParameter:withNewEffectType:](self, "addColorValueRed:green:blue:forParameter:withNewEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, 1131375730);
  -[CUIShapeEffectPreset appendFloatValue:forParameter:withEffectType:](self, "appendFloatValue:forParameter:withEffectType:", 2, 1131375730, a6);
  -[CUIShapeEffectPreset appendEnumValue:forParameter:withEffectType:](self, "appendEnumValue:forParameter:withEffectType:", v9, 7, 1131375730);
  -[CUIShapeEffectPreset appendEnumValue:forParameter:withEffectType:](self, "appendEnumValue:forParameter:withEffectType:", v8, 10, 1131375730);
}

- (void)addGradientFillWithTopColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 bottomColorRed:(unsigned int)a6 green:(unsigned int)a7 blue:(unsigned int)a8 opacity:(double)a9 blendMode:(unsigned int)a10
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = *(_QWORD *)&a8;
  v12 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a6;
  -[CUIShapeEffectPreset addColorValueRed:green:blue:forParameter:withNewEffectType:](self, "addColorValueRed:green:blue:forParameter:withNewEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, 1198678372);
  -[CUIShapeEffectPreset appendColorValueRed:green:blue:forParameter:withEffectType:](self, "appendColorValueRed:green:blue:forParameter:withEffectType:", v13, v12, v11, 1, 1198678372);
  -[CUIShapeEffectPreset appendFloatValue:forParameter:withEffectType:](self, "appendFloatValue:forParameter:withEffectType:", 2, 1198678372, a9);
  -[CUIShapeEffectPreset appendEnumValue:forParameter:withEffectType:](self, "appendEnumValue:forParameter:withEffectType:", a10, 7, 1198678372);
}

- (void)addInnerGlowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 blendMode:(unsigned int)a8
{
  uint64_t v8;

  v8 = *(_QWORD *)&a8;
  -[CUIShapeEffectPreset addColorValueRed:green:blue:forParameter:withNewEffectType:](self, "addColorValueRed:green:blue:forParameter:withNewEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, 1766288503);
  -[CUIShapeEffectPreset appendFloatValue:forParameter:withEffectType:](self, "appendFloatValue:forParameter:withEffectType:", 2, 1766288503, a6);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a7, 4, 1766288503);
  -[CUIShapeEffectPreset appendEnumValue:forParameter:withEffectType:](self, "appendEnumValue:forParameter:withEffectType:", v8, 7, 1766288503);
}

- (void)addInnerShadowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 offset:(int)a8 angle:(int)a9 blendMode:(unsigned int)a10
{
  -[CUIShapeEffectPreset addColorValueRed:green:blue:forParameter:withNewEffectType:](self, "addColorValueRed:green:blue:forParameter:withNewEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, 1768837992);
  -[CUIShapeEffectPreset appendFloatValue:forParameter:withEffectType:](self, "appendFloatValue:forParameter:withEffectType:", 2, 1768837992, a6);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a7, 4, 1768837992);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a8, 5, 1768837992);
  -[CUIShapeEffectPreset appendAngleValue:forParameter:withEffectType:](self, "appendAngleValue:forParameter:withEffectType:", a9, 6, 1768837992);
  -[CUIShapeEffectPreset appendEnumValue:forParameter:withEffectType:](self, "appendEnumValue:forParameter:withEffectType:", a10, 7, 1768837992);
}

- (void)addOuterGlowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 spread:(int)a8
{
  -[CUIShapeEffectPreset addColorValueRed:green:blue:forParameter:withNewEffectType:](self, "addColorValueRed:green:blue:forParameter:withNewEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, 1866951799);
  -[CUIShapeEffectPreset appendFloatValue:forParameter:withEffectType:](self, "appendFloatValue:forParameter:withEffectType:", 2, 1866951799, a6);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a7, 4, 1866951799);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a8, 9, 1866951799);
}

- (void)addDropShadowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 spread:(int)a8 offset:(int)a9 angle:(int)a10
{
  -[CUIShapeEffectPreset addColorValueRed:green:blue:forParameter:withNewEffectType:](self, "addColorValueRed:green:blue:forParameter:withNewEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, 1148350320);
  -[CUIShapeEffectPreset appendFloatValue:forParameter:withEffectType:](self, "appendFloatValue:forParameter:withEffectType:", 2, 1148350320, a6);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a7, 4, 1148350320);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a8, 9, 1148350320);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a9, 5, 1148350320);
  -[CUIShapeEffectPreset appendAngleValue:forParameter:withEffectType:](self, "appendAngleValue:forParameter:withEffectType:", a10, 6, 1148350320);
}

- (void)addExtraShadowWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 blur:(int)a7 spread:(int)a8 offset:(int)a9 angle:(int)a10
{
  -[CUIShapeEffectPreset addColorValueRed:green:blue:forParameter:withNewEffectType:](self, "addColorValueRed:green:blue:forParameter:withNewEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, 1484026465);
  -[CUIShapeEffectPreset appendFloatValue:forParameter:withEffectType:](self, "appendFloatValue:forParameter:withEffectType:", 2, 1484026465, a6);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a7, 4, 1484026465);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a8, 9, 1484026465);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a9, 5, 1484026465);
  -[CUIShapeEffectPreset appendAngleValue:forParameter:withEffectType:](self, "appendAngleValue:forParameter:withEffectType:", a10, 6, 1484026465);
}

- (void)addBevelEmbossWithHighlightColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 opacity:(double)a6 shadowColorRed:(unsigned int)a7 green:(unsigned int)a8 blue:(unsigned int)a9 opacity:(double)a10 blur:(int)a11 soften:(int)a12 bevelStyle:(unsigned int)a13
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v14 = *(_QWORD *)&a9;
  v15 = *(_QWORD *)&a8;
  v16 = *(_QWORD *)&a7;
  -[CUIShapeEffectPreset addColorValueRed:green:blue:forParameter:withNewEffectType:](self, "addColorValueRed:green:blue:forParameter:withNewEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, 1164796531);
  -[CUIShapeEffectPreset appendFloatValue:forParameter:withEffectType:](self, "appendFloatValue:forParameter:withEffectType:", 2, 1164796531, a6);
  -[CUIShapeEffectPreset appendColorValueRed:green:blue:forParameter:withEffectType:](self, "appendColorValueRed:green:blue:forParameter:withEffectType:", v16, v15, v14, 1, 1164796531);
  -[CUIShapeEffectPreset appendFloatValue:forParameter:withEffectType:](self, "appendFloatValue:forParameter:withEffectType:", 3, 1164796531, a10);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a11, 4, 1164796531);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a12, 8, 1164796531);
  -[CUIShapeEffectPreset appendEnumValue:forParameter:withEffectType:](self, "appendEnumValue:forParameter:withEffectType:", a13, 11, 1164796531);
}

- (void)addHueSaturationWithColorRed:(unsigned int)a3 green:(unsigned int)a4 blue:(unsigned int)a5 angle:(int)a6 width:(int)a7 tintable:(BOOL)a8
{
  _BOOL8 v8;

  v8 = a8;
  -[CUIShapeEffectPreset addColorValueRed:green:blue:forParameter:withNewEffectType:](self, "addColorValueRed:green:blue:forParameter:withNewEffectType:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, 1215653203);
  -[CUIShapeEffectPreset appendAngleValue:forParameter:withEffectType:](self, "appendAngleValue:forParameter:withEffectType:", a6, 6, 1215653203);
  -[CUIShapeEffectPreset appendIntValue:forParameter:withEffectType:](self, "appendIntValue:forParameter:withEffectType:", a7, 5, 1215653203);
  -[CUIShapeEffectPreset appendEnumValue:forParameter:withEffectType:](self, "appendEnumValue:forParameter:withEffectType:", v8, 10, 1215653203);
}

- (void)addEffectsFromPreset:(id)a3
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _BOOL8 v45;
  uint64_t v46;
  float v47;
  unsigned int v48;
  unsigned int v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  float v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  float v59;
  uint64_t v60;
  float v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  float v67;
  unsigned int v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  float v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  float v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;

  v4 = (char *)objc_msgSend(a3, "effectCount");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v82 = v4;
    do
    {
      v7 = objc_msgSend(a3, "effectTypeAtIndex:", v6);
      if (v7 <= 1215653202)
      {
        if (v7 <= 1164796530)
        {
          if (v7 == 1131375730)
          {
            v74 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 7, v6);
            v75 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, v6);
            v76 = v75;
            v77 = BYTE1(v75);
            v78 = BYTE2(v75);
            v79 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, v6));
            -[CUIShapeEffectPreset addColorFillWithRed:green:blue:opacity:blendMode:tintable:](self, "addColorFillWithRed:green:blue:opacity:blendMode:tintable:", v76, v77, v78, v74, objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 10, v6) == 1, v79);
          }
          else if (v7 == 1148350320)
          {
            v31 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, v6);
            v32 = v31;
            v33 = BYTE1(v31);
            v34 = BYTE2(v31);
            v35 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, v6));
            v36 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, v6);
            v37 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 9, v6);
            v38 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 5, v6);
            LODWORD(v80) = (__int16)objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 6, v6);
            -[CUIShapeEffectPreset addDropShadowWithColorRed:green:blue:opacity:blur:spread:offset:angle:](self, "addDropShadowWithColorRed:green:blue:opacity:blur:spread:offset:angle:", v32, v33, v34, v36, v37, v38, v35, v80);
          }
        }
        else
        {
          switch(v7)
          {
            case 1164796531:
              v48 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, v6);
              v49 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 8, v6);
              v50 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, v6);
              v51 = v50;
              v52 = BYTE1(v50);
              v53 = BYTE2(v50);
              v54 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, v6));
              v55 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 1, v6);
              v56 = v55;
              v57 = BYTE1(v55);
              v58 = BYTE2(v55);
              v59 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 3, v6));
              LODWORD(v81) = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 11, v6);
              v60 = v57;
              v5 = v82;
              -[CUIShapeEffectPreset addBevelEmbossWithHighlightColorRed:green:blue:opacity:shadowColorRed:green:blue:opacity:blur:soften:bevelStyle:](self, "addBevelEmbossWithHighlightColorRed:green:blue:opacity:shadowColorRed:green:blue:opacity:blur:soften:bevelStyle:", v51, v52, v53, v56, v60, v58, v54, v59, __PAIR64__(v49, v48), v81);
              break;
            case 1180787813:
              v61 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, v6));
              -[CUIShapeEffectPreset addOutputOpacityWithOpacity:](self, "addOutputOpacityWithOpacity:", v61);
              break;
            case 1198678372:
              v17 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, v6);
              v18 = v17;
              v19 = BYTE1(v17);
              v20 = BYTE2(v17);
              v21 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 1, v6);
              v22 = v21;
              v23 = BYTE1(v21);
              v24 = BYTE2(v21);
              v25 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, v6));
              LODWORD(v80) = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 7, v6);
              -[CUIShapeEffectPreset addGradientFillWithTopColorRed:green:blue:bottomColorRed:green:blue:opacity:blendMode:](self, "addGradientFillWithTopColorRed:green:blue:bottomColorRed:green:blue:opacity:blendMode:", v18, v19, v20, v22, v23, v24, v25, v80);
              break;
          }
        }
      }
      else if (v7 > 1766288502)
      {
        switch(v7)
        {
          case 1766288503:
            v62 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 7, v6);
            v63 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, v6);
            v64 = v63;
            v65 = BYTE1(v63);
            v66 = BYTE2(v63);
            v67 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, v6));
            -[CUIShapeEffectPreset addInnerGlowWithColorRed:green:blue:opacity:blur:blendMode:](self, "addInnerGlowWithColorRed:green:blue:opacity:blur:blendMode:", v64, v65, v66, objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, v6), v62, v67);
            break;
          case 1768837992:
            v68 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 7, v6);
            v69 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, v6);
            v70 = v69;
            v71 = BYTE1(v69);
            v72 = BYTE2(v69);
            v73 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, v6));
            LODWORD(v80) = v68;
            -[CUIShapeEffectPreset addInnerShadowWithColorRed:green:blue:opacity:blur:offset:angle:blendMode:](self, "addInnerShadowWithColorRed:green:blue:opacity:blur:offset:angle:blendMode:", v70, v71, v72, objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, v6), objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 5, v6), (__int16)objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 6, v6), v73, v80);
            break;
          case 1866951799:
            v26 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, v6);
            v27 = v26;
            v28 = BYTE1(v26);
            v29 = BYTE2(v26);
            v30 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, v6));
            -[CUIShapeEffectPreset addOuterGlowWithColorRed:green:blue:opacity:blur:spread:](self, "addOuterGlowWithColorRed:green:blue:opacity:blur:spread:", v27, v28, v29, objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, v6), objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 9, v6), v30);
            break;
        }
      }
      else
      {
        switch(v7)
        {
          case 1215653203:
            v39 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, v6);
            v40 = v39;
            v41 = BYTE1(v39);
            v42 = BYTE2(v39);
            v43 = (__int16)objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 6, v6);
            v44 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 5, v6);
            v45 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 10, v6) == 1;
            v46 = v40;
            v5 = v82;
            -[CUIShapeEffectPreset addHueSaturationWithColorRed:green:blue:angle:width:tintable:](self, "addHueSaturationWithColorRed:green:blue:angle:width:tintable:", v46, v41, v42, v43, v44, v45);
            break;
          case 1397715043:
            v47 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, v6));
            -[CUIShapeEffectPreset addShapeOpacityWithOpacity:](self, "addShapeOpacityWithOpacity:", v47);
            break;
          case 1484026465:
            v8 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, v6);
            v9 = v8;
            v10 = BYTE1(v8);
            v11 = BYTE2(v8);
            v12 = COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, v6));
            v13 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, v6);
            v14 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 9, v6);
            v15 = objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 5, v6);
            LODWORD(v80) = (__int16)objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 6, v6);
            v16 = v9;
            v5 = v82;
            -[CUIShapeEffectPreset addExtraShadowWithColorRed:green:blue:opacity:blur:spread:offset:angle:](self, "addExtraShadowWithColorRed:green:blue:opacity:blur:spread:offset:angle:", v16, v10, v11, v13, v14, v15, v12, v80);
            break;
        }
      }
      ++v6;
    }
    while (v5 != v6);
  }
}

- (id)debugDescription
{
  NSMutableString *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  $BEFD66571C471BB2AEB14086D2581294 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  $BEFD66571C471BB2AEB14086D2581294 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  $BEFD66571C471BB2AEB14086D2581294 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  $BEFD66571C471BB2AEB14086D2581294 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  $BEFD66571C471BB2AEB14086D2581294 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  $BEFD66571C471BB2AEB14086D2581294 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  $BEFD66571C471BB2AEB14086D2581294 v37;
  unsigned int v38;
  const __CFString *v39;
  float v40;
  $BEFD66571C471BB2AEB14086D2581294 v41;
  $BEFD66571C471BB2AEB14086D2581294 v42;
  unsigned int v43;
  double v44;
  unsigned int v45;
  double v46;
  unsigned int v47;
  const __CFString *v48;
  const __CFString *v49;
  float v50;
  float v51;
  float v52;
  int v53;
  $BEFD66571C471BB2AEB14086D2581294 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  float v58;
  int v59;
  $BEFD66571C471BB2AEB14086D2581294 v60;
  uint64_t v61;
  uint64_t v62;
  float v63;
  int v64;
  $BEFD66571C471BB2AEB14086D2581294 v65;
  uint64_t r;
  uint64_t g;
  uint64_t b;
  float v69;
  unsigned int v70;
  double v71;
  const __CFString *v72;
  const __CFString *v73;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  int v85;
  objc_super v86;

  v86.receiver = self;
  v86.super_class = (Class)CUIShapeEffectPreset;
  v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", -[CUIShapeEffectPreset debugDescription](&v86, sel_debugDescription));
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("\nEffects: {\n"));
  v4 = -[CUIShapeEffectPreset effectCount](self, "effectCount");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v84 = v4;
    v85 = 1852797549;
    do
    {
      v7 = -[CUIShapeEffectPreset effectTypeAtIndex:](self, "effectTypeAtIndex:", v6);
      -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n\t"));
      if (v7 <= 1215653202)
      {
        if (v7 <= 1164796530)
        {
          if (v7 == 1131375730)
          {
            v64 = -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 7, v6);
            v65.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 0, v6);
            r = v65.var2.r;
            g = v65.var2.g;
            b = v65.var2.b;
            v69 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 2, v6));
            v70 = -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 10, v6);
            v71 = v69;
            v85 = v64;
            v72 = CUIEffectBlendModeToString(v64);
            v73 = CFSTR("NO");
            if (v70 == 1)
              v73 = CFSTR("YES");
            -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Color Fill: r=%d, g=%d, b=%d, opacity=%.1f, blendMode=%@, tintable=%@"), r, g, b, *(_QWORD *)&v71, v72, v73, v80, v81, v82);
          }
          else if (v7 == 1148350320)
          {
            v27.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 0, v6);
            v28 = v27.var2.r;
            v29 = v27.var2.g;
            v30 = v27.var2.b;
            v31 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 2, v6));
            v5 = v84;
            -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Drop Shadow: r=%d, g=%d, b=%d, opacity=%.1f, blurSize=%d, spread=%d, offset=%d, angle=%d, blendMode=%@"), v28, v29, v30, v31, -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 4, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 9, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self,
                "valueForParameter:inEffectAtIndex:",
                5,
                v6),
              (__int16)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 6, v6), CUIEffectBlendModeToString(v85));
          }
        }
        else
        {
          switch(v7)
          {
            case 1164796531:
              v41.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 4, v6);
              v42.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 8, v6);
              v43 = -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 0, v6);
              v44 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 2, v6));
              v45 = -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 1, v6);
              v46 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 3, v6));
              v47 = -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 11, v6);
              v48 = CUIEffectBlendModeToString(v85);
              v49 = CFSTR("<unknown>");
              if (v47 <= 4)
                v49 = off_1E41B24B0[v47];
              v50 = v44;
              v51 = v46;
              -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Bevel Emboss: startR=%d, startG=%d, startB=%d, opacity=%.1f, endR=%d, endG=%d, endB=%d, endOpacity=%.1f, blendMode=%@, blurSize=%d, soften=%d, bevelStyle=%@"), v43, BYTE1(v43), BYTE2(v43), v50, v45, BYTE1(v45), BYTE2(v45), v51, v48, v41.var1, v42.var1, v49);
              v5 = v84;
              break;
            case 1180787813:
              v52 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 2, v6));
              -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Output Opacity=%.1f"), v52, v75, v76, v77, v78, v79, v80, v81, v82);
              break;
            case 1198678372:
              v13.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 0, v6);
              v14 = v13.var2.r;
              v15 = v13.var2.g;
              v16 = v13.var2.b;
              v17.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 1, v6);
              v18 = v17.var2.r;
              v19 = v17.var2.g;
              v20 = v17.var2.b;
              v21 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 2, v6));
              v85 = -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 7, v6);
              -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Gradient Fill: r=%d, g=%d, b=%d, r=%d, g=%d, b=%d, opacity=%.1f, blendMode=%@"), v14, v15, v16, v18, v19, v20, v21, CUIEffectBlendModeToString(v85), v82);
              break;
          }
        }
      }
      else if (v7 > 1766288502)
      {
        switch(v7)
        {
          case 1766288503:
            v53 = -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 7, v6);
            v54.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 0, v6);
            v55 = v54.var2.r;
            v56 = v54.var2.g;
            v57 = v54.var2.b;
            v58 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 2, v6));
            v85 = v53;
            -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Inner Glow: r=%d, g=%d, b=%d, opacity=%.1f, blurSize=%d, blendMode=%@"), v55, v56, v57, v58, -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 4, v6), CUIEffectBlendModeToString(v53), v80, v81, v82);
            break;
          case 1768837992:
            v59 = -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 7, v6);
            v60.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 0, v6);
            v83 = v60.var2.r;
            v61 = v60.var2.g;
            v62 = v60.var2.b;
            v63 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 2, v6));
            v85 = v59;
            -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Inner Shadow: r=%d, g=%d, b=%d, opacity=%.1f, blurSize=%d, offset=%d, angle=%d, blendMode=%@"), v83, v61, v62, v63, -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 4, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 5, v6), (__int16)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self,
                                       "valueForParameter:inEffectAtIndex:",
                                       6,
                                       v6),
              CUIEffectBlendModeToString(v59),
              v82);
            break;
          case 1866951799:
            v22.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 0, v6);
            v23 = v22.var2.r;
            v24 = v22.var2.g;
            v25 = v22.var2.b;
            v26 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 2, v6));
            -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Outer Glow: r=%d, g=%d, b=%d, opacity=%.1f, blurSize=%d, spread=%d, blendMode=%@"), v23, v24, v25, v26, -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 4, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 9, v6), CUIEffectBlendModeToString(v85), v81,
              v82);
            break;
        }
      }
      else
      {
        switch(v7)
        {
          case 1215653203:
            v32.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 0, v6);
            v33 = v32.var2.r;
            v34 = v32.var2.g;
            v35 = v32.var2.b;
            v36 = (__int16)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 6, v6);
            v37.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 5, v6);
            v38 = -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 10, v6);
            v39 = CFSTR("NO");
            if (v38 == 1)
              v39 = CFSTR("YES");
            -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Hue/Saturation: r=%d, g=%d, b=%d, angle=%d, width=%d, tintable=%@"), v33, v34, v35, v36, v37.var1, v39, v80, v81, v82);
            break;
          case 1397715043:
            v40 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 2, v6));
            -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Shape Opacity=%.1f"), v40, v75, v76, v77, v78, v79, v80, v81, v82);
            break;
          case 1484026465:
            v8.var1 = (unint64_t)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 0, v6);
            v9 = v8.var2.r;
            v10 = v8.var2.g;
            v11 = v8.var2.b;
            v12 = COERCE_DOUBLE(-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 2, v6));
            v5 = v84;
            -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Extra Shadow: r=%d, g=%d, b=%d, opacity=%.1f, blurSize=%d, spread=%d, offset=%d, angle=%d, blendMode=%@"), v9, v10, v11, v12, -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 4, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 9, v6), -[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self,
                "valueForParameter:inEffectAtIndex:",
                5,
                v6),
              (__int16)-[CUIShapeEffectPreset valueForParameter:inEffectAtIndex:](self, "valueForParameter:inEffectAtIndex:", 6, v6), CUIEffectBlendModeToString(v85));
            break;
        }
      }
      ++v6;
    }
    while (v5 != v6);
  }
  -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n}"));
  return v3;
}

+ (unsigned)cuiEffectBlendModeFromCGBlendMode:(int)a3
{
  if ((a3 - 1) > 0x1A)
    return 1852797549;
  else
    return dword_19EC73118[a3 - 1];
}

+ (int)cgBlendModeFromCUIEffectBlendMode:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int result;

  result = 0;
  if ((int)a3 > 1749838195)
  {
    if ((int)a3 > 1852797548)
    {
      if ((int)a3 > 1935897197)
      {
        if ((int)a3 > 1986227572)
        {
          if (a3 != 1986227573 && a3 != 1986229103)
          {
LABEL_44:
            _CUILog(4, (uint64_t)"CUIEffectBlendMode can't be converted to CGBlendMode", *(uint64_t *)&a3, v3, v4, v5, v6, v7, v8);
            return 0;
          }
        }
        else
        {
          if (a3 != 1935897198)
          {
            if (a3 == 1936553316)
              return 11;
            goto LABEL_44;
          }
          return 2;
        }
      }
      else if ((int)a3 > 1934387571)
      {
        if (a3 != 1934387572)
        {
          if (a3 == 1935766560)
            return 13;
          goto LABEL_44;
        }
        return 8;
      }
      else if (a3 != 1852797549)
      {
        if (a3 == 1870030194)
          return 3;
        goto LABEL_44;
      }
    }
    else if ((int)a3 > 1818518630)
    {
      if ((int)a3 > 1819634975)
      {
        if (a3 != 1819634976)
        {
          if (a3 == 1836411936)
            return 1;
          goto LABEL_44;
        }
        return 15;
      }
      else
      {
        if (a3 != 1818518631)
        {
          if (a3 == 1818850405)
            return 5;
          goto LABEL_44;
        }
        return 27;
      }
    }
    else if ((int)a3 > 1768188277)
    {
      if (a3 != 1768188278)
      {
        if (a3 == 1818391150)
          return 26;
        goto LABEL_44;
      }
      return 7;
    }
    else
    {
      if (a3 != 1749838196)
      {
        if (a3 == 1752524064)
          return 12;
        goto LABEL_44;
      }
      return 9;
    }
  }
  else if ((int)a3 > 1668246641)
  {
    if ((int)a3 > 1684629093)
    {
      if (a3 != 1684629094)
      {
        if (a3 == 1684633120)
          return 6;
        goto LABEL_44;
      }
      return 10;
    }
    else
    {
      if (a3 != 1668246642)
      {
        if (a3 == 1684107883)
          return 4;
        goto LABEL_44;
      }
      return 14;
    }
  }
  else
  {
    if (a3 - 16 < 0xC)
      return a3;
    if (a3)
      goto LABEL_44;
  }
  return result;
}

+ (id)caFilterFromCUIEffectBlendMode:(unsigned int)a3
{
  const __CFString **v3;
  BOOL v4;
  const __CFString **v5;
  const __CFString *v6;
  int v7;
  const __CFString **v8;
  BOOL v9;
  const __CFString **v10;

  v3 = (const __CFString **)&kCAFilterNormalBlendMode;
  if ((int)a3 <= 1718842721)
  {
    if ((int)a3 <= 1668246641)
    {
      switch(a3)
      {
        case 0u:
          v3 = (const __CFString **)&kCAFilterSourceOver;
          break;
        case 0x10u:
          v3 = (const __CFString **)&kCAFilterClear;
          break;
        case 0x11u:
          v3 = (const __CFString **)&kCAFilterCopy;
          break;
        case 0x12u:
          v3 = (const __CFString **)&kCAFilterSourceIn;
          break;
        case 0x13u:
          v3 = (const __CFString **)&kCAFilterSourceOut;
          break;
        case 0x14u:
          v3 = (const __CFString **)&kCAFilterSourceAtop;
          break;
        case 0x15u:
          v3 = (const __CFString **)&kCAFilterDestOver;
          break;
        case 0x16u:
          v3 = (const __CFString **)&kCAFilterDestIn;
          break;
        case 0x17u:
          v3 = (const __CFString **)&kCAFilterDestOut;
          break;
        case 0x18u:
          v3 = (const __CFString **)&kCAFilterDestAtop;
          break;
        case 0x19u:
          v3 = (const __CFString **)&kCAFilterXor;
          break;
        case 0x1Au:
          v3 = (const __CFString **)&kCAFilterPlusD;
          break;
        case 0x1Bu:
          v3 = (const __CFString **)&kCAFilterPlusL;
          break;
        default:
          goto LABEL_62;
      }
      goto LABEL_62;
    }
    if ((int)a3 > 1684629093)
    {
      v7 = 1684629094;
      v8 = (const __CFString **)&kCAFilterDifferenceBlendMode;
      if (a3 == 1717856630)
        v3 = (const __CFString **)&kCAFilterDivideBlendMode;
      if (a3 == 1684633120)
        v3 = (const __CFString **)&kCAFilterColorDodgeBlendMode;
      goto LABEL_36;
    }
    if (a3 == 1668246642)
    {
      v6 = CFSTR("colorBlendMode");
      return +[CAFilter filterWithType:](CAFilter, "filterWithType:", v6);
    }
    v4 = a3 == 1684107883;
    v5 = (const __CFString **)&kCAFilterDarkenBlendMode;
    goto LABEL_43;
  }
  if ((int)a3 <= 1836411935)
  {
    if ((int)a3 > 1816947059)
    {
      if ((int)a3 > 1818518630)
      {
        if (a3 == 1818518631)
        {
          v3 = (const __CFString **)&kCAFilterLinearDodgeBlendMode;
          goto LABEL_62;
        }
        if (a3 == 1818850405)
        {
          v3 = (const __CFString **)&kCAFilterLightenBlendMode;
          goto LABEL_62;
        }
        if (a3 != 1819634976)
          goto LABEL_62;
        v6 = CFSTR("luminosityBlendMode");
        return +[CAFilter filterWithType:](CAFilter, "filterWithType:", v6);
      }
      v7 = 1816947060;
      v8 = (const __CFString **)&kCAFilterLinearLightBlendMode;
      v9 = a3 == 1818391150;
      v10 = (const __CFString **)&kCAFilterLinearBurnBlendMode;
LABEL_34:
      if (v9)
        v3 = v10;
LABEL_36:
      if (a3 == v7)
        v3 = v8;
      goto LABEL_62;
    }
    if ((int)a3 <= 1752524063)
    {
      v7 = 1718842722;
      v8 = (const __CFString **)&kCAFilterSubtractBlendMode;
      v9 = a3 == 1749838196;
      v10 = (const __CFString **)&kCAFilterHardLightBlendMode;
      goto LABEL_34;
    }
    if (a3 == 1752524064)
    {
      v6 = CFSTR("hueBlendMode");
      return +[CAFilter filterWithType:](CAFilter, "filterWithType:", v6);
    }
    v4 = a3 == 1768188278;
    v5 = (const __CFString **)&kCAFilterColorBurnBlendMode;
LABEL_43:
    if (v4)
      v3 = v5;
    goto LABEL_62;
  }
  if ((int)a3 <= 1935766559)
  {
    if ((int)a3 > 1884055923)
    {
      if (a3 == 1884055924)
      {
        v3 = (const __CFString **)&kCAFilterPinLightBlendMode;
        goto LABEL_62;
      }
      if (a3 == 1885434739)
        return 0;
      v4 = a3 == 1934387572;
      v5 = (const __CFString **)&kCAFilterSoftLightBlendMode;
      goto LABEL_43;
    }
    v7 = 1836411936;
    v8 = (const __CFString **)&kCAFilterMultiply;
    v9 = a3 == 1870030194;
    v10 = (const __CFString **)&kCAFilterOverlayBlendMode;
    goto LABEL_34;
  }
  if ((int)a3 <= 1936553315)
  {
    if (a3 == 1935766560)
    {
      v6 = CFSTR("saturationBlendMode");
      return +[CAFilter filterWithType:](CAFilter, "filterWithType:", v6);
    }
    v4 = a3 == 1935897198;
    v5 = (const __CFString **)&kCAFilterScreenBlendMode;
    goto LABEL_43;
  }
  switch(a3)
  {
    case 0x736D7564u:
      v3 = (const __CFString **)&kCAFilterExclusionBlendMode;
      break;
    case 0x76636D75u:
      v6 = CFSTR("vibrantColorMatrixMultiply");
      return +[CAFilter filterWithType:](CAFilter, "filterWithType:", v6);
    case 0x7663736Fu:
      v6 = CFSTR("vibrantColorMatrixSourceOver");
      return +[CAFilter filterWithType:](CAFilter, "filterWithType:", v6);
  }
LABEL_62:
  v6 = *v3;
  if (*v3)
    return +[CAFilter filterWithType:](CAFilter, "filterWithType:", v6);
  return 0;
}

+ (_CUIVibrantColorMatrixOptions)monochromeVibrantColorMatrixOptions
{
  retstr->var0[0] = 0.0;
  retstr->var0[1] = 0.0;
  retstr->var0[2] = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&retstr->var0[3] = _Q0;
  *(_OWORD *)&retstr->var2 = _Q0;
  retstr->var4 = 1.0;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  return result;
}

+ (_CUIVibrantColorMatrixOptions)standardVibrantColorMatrixOptionsForColor:(SEL)a3
{
  CGColorSpace *SRGB;
  uint64_t DisplayP3;
  CGColorSpaceRef ColorSpace;
  CGColor *CopyByMatchingToColorSpace;
  CGColor *v10;
  const CGFloat *Components;
  _CUIVibrantColorMatrixOptions *result;

  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  DisplayP3 = _CUIColorSpaceGetDisplayP3();
  ColorSpace = CGColorGetColorSpace(a4);
  if (ColorSpace == SRGB || ColorSpace == (CGColorSpaceRef)DisplayP3)
    CopyByMatchingToColorSpace = CGColorRetain(a4);
  else
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(SRGB, kCGRenderingIntentDefault, a4, 0);
  v10 = CopyByMatchingToColorSpace;
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  *(_OWORD *)retstr->var0 = *(_OWORD *)Components;
  retstr->var0[2] = Components[2];
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&retstr->var0[3] = _Q0;
  *(_OWORD *)&retstr->var2 = _Q0;
  retstr->var5 = 0.0;
  retstr->var6 = 0.0;
  retstr->var4 = 1.0;
  *(_OWORD *)&retstr->var7 = xmmword_19EC73190;
  *(_OWORD *)&retstr->var9 = xmmword_19EC731A0;
  CGColorRelease(v10);
  return result;
}

+ (_CUIVibrantColorMatrixOptions)vibrantColorMatrixOptionsWithColor:(SEL)a3 saturation:(CGColor *)a4 brightness:(double)a5
{
  _CUIVibrantColorMatrixOptions *result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)retstr->var0 = 0u;
  if (CGColorGetAlpha(a4) >= 1.0)
  {
    if (a2)
    {
      result = (_CUIVibrantColorMatrixOptions *)objc_msgSend(a2, "standardVibrantColorMatrixOptionsForColor:", a4);
      goto LABEL_7;
    }
LABEL_6:
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    goto LABEL_7;
  }
  if (!a2)
    goto LABEL_6;
  result = (_CUIVibrantColorMatrixOptions *)objc_msgSend(a2, "monochromeVibrantColorMatrixOptions");
LABEL_7:
  *(_OWORD *)&retstr->var5 = v16;
  *(_OWORD *)&retstr->var7 = v17;
  *(_OWORD *)&retstr->var9 = v18;
  *(_OWORD *)retstr->var0 = v12;
  *(_OWORD *)&retstr->var0[2] = v13;
  *(_OWORD *)&retstr->var1 = v14;
  *(_OWORD *)&retstr->var3 = v15;
  retstr->var3 = a6;
  retstr->var4 = a5;
  return result;
}

+ (void)configureVibrantColorMatrixFilter:(id)a3 withOptions:(_CUIVibrantColorMatrixOptions *)a4
{
  double var10;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double var6;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  double v32;
  double v33;
  double var1;
  double var2;
  double var4;
  double v37;
  double v38;
  double v39;
  float v40;
  unsigned int v41;
  unsigned int v42;
  __int128 v43;
  double v44;
  float v45;
  float v46;
  float v47;
  __int128 v48;
  float v49;
  NSValue *v50;
  int v51;
  int v52;
  __int128 v53;
  _BYTE v54[64];
  __int128 v55;
  _BYTE v56[32];
  _BYTE v57[32];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;

  if (a3)
  {
    var10 = a4->var10;
    v6 = 1.0 - var10;
    v8 = a4->var0[2];
    v7 = a4->var0[3];
    v9 = a4->var7 * v7;
    v10 = v7 * a4->var8;
    v11 = v7 * a4->var9;
    v12 = a4->var0[0];
    v13 = a4->var0[1];
    var6 = a4->var6;
    v15 = (1.0 - var10) * (a4->var5 + var6);
    v16 = (1.0 - var10) * (1.0 - (1.0 - a4->var0[0]) * v9 - a4->var0[0] * v11) - v15;
    v17 = (1.0 - var10) * (1.0 - (1.0 - v13) * v9 - v13 * v11) - v15;
    v18 = (1.0 - var10) * (1.0 - (1.0 - v8) * v9 - v8 * v11) - v15;
    v19 = (1.0 - var10) * (a4->var0[0] * v11) + a4->var0[0] * var10;
    v20 = (1.0 - var10) * (v11 * v13) + v13 * var10;
    v21 = (1.0 - var10) * (v11 * v8) + v8 * var10;
    v22 = v6 * var6;
    v23 = v19 + v6 * var6;
    v24 = v20 + v22;
    v25 = v21 + v22;
    v26 = v16;
    v27 = v23;
    v28 = v17;
    v29 = v24;
    v30 = v18;
    v31 = v25;
    if (v10 > 0.0)
    {
      v12 = v12 / v10;
      v13 = v13 / v10;
      v8 = v8 / v10;
    }
    v32 = v13 * -0.385428011 + v12 * -0.114572003 + v8 * 0.5 + v7 * 0.0 + 0.5;
    v33 = v13 * -0.454153001 + v12 * 0.5 + v8 * -0.0458469987 + v7 * 0.0 + 0.5;
    var1 = a4->var1;
    var2 = a4->var2;
    var4 = a4->var4;
    v37 = var4 * -0.5 + 0.5;
    v38 = v37 + (v10 * v32 + -0.5) * v10;
    v39 = v37 + (v10 * v33 + -0.5) * v10;
    v40 = var1;
    *(float *)&v41 = (1.0 - var1) * 0.5 + a4->var3 + -1.0;
    *(float *)&v42 = var4;
    *(float *)&v33 = v38;
    *(float *)&v39 = v39;
    v51 = LODWORD(v33);
    v52 = LODWORD(v39);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v63 = 0u;
    v43 = CAColorMatrixIdentity[3];
    v60 = CAColorMatrixIdentity[2];
    v61 = v43;
    v62 = CAColorMatrixIdentity[4];
    v44 = fmax(var2 + -1.0, 0.0);
    v45 = 1.0 - fabs(var2 + -1.0);
    v46 = v44 + -0.7874;
    v47 = v44 + 0.327724;
    v48 = CAColorMatrixIdentity[1];
    v58 = CAColorMatrixIdentity[0];
    v59 = v48;
    *(float *)&v55 = v26;
    *(_QWORD *)((char *)&v55 + 4) = 0;
    v49 = v44 + -0.9278;
    HIDWORD(v55) = 0;
    *(_QWORD *)v56 = LODWORD(v27);
    *(float *)&v56[8] = v28;
    *(_QWORD *)&v56[12] = 0;
    *(float *)&v56[20] = v29;
    *(_QWORD *)&v56[24] = 0;
    *(_QWORD *)v57 = LODWORD(v30);
    *(float *)&v57[8] = v31;
    *(_OWORD *)&v57[12] = xmmword_19EC731B0;
    *(_DWORD *)&v57[28] = 0;
    CAColorMatrixConcat(&v63, &v58, &v55);
    *(_OWORD *)&v56[16] = v65;
    *(_OWORD *)v57 = v66;
    *(_OWORD *)&v57[16] = v67;
    v55 = v63;
    *(_OWORD *)v56 = v64;
    *(float *)&v53 = v45;
    *(_QWORD *)((char *)&v53 + 4) = 0x3FC9930C00000000;
    HIDWORD(v53) = 0;
    *(float *)v54 = v46;
    *(float *)&v54[4] = v45;
    *(_QWORD *)&v54[8] = 0xBEEFADF3BE3FD1DDLL;
    *(_DWORD *)&v54[16] = 0;
    *(float *)&v54[20] = v47;
    *(float *)&v54[24] = v45;
    *(_QWORD *)&v54[28] = 1072530509;
    *(_DWORD *)&v54[36] = 0;
    *(float *)&v54[40] = v49;
    *(_OWORD *)&v54[44] = xmmword_19EC731B0;
    *(_DWORD *)&v54[60] = 0;
    CAColorMatrixConcat(&v58, &v55, &v53);
    v66 = v61;
    v67 = v62;
    v64 = v59;
    v65 = v60;
    v63 = v58;
    *(_OWORD *)&v56[16] = v60;
    *(_OWORD *)v57 = v61;
    *(_OWORD *)&v57[16] = v62;
    v55 = v58;
    *(_OWORD *)v56 = v59;
    *(float *)&v53 = v40;
    *(_QWORD *)((char *)&v53 + 4) = 0;
    HIDWORD(v53) = 0;
    *(_QWORD *)v54 = v41;
    *(_DWORD *)&v54[8] = v42;
    *(_QWORD *)&v54[12] = 0;
    *(_DWORD *)&v54[20] = v51;
    *(_QWORD *)&v54[24] = 0;
    *(_QWORD *)&v54[32] = v42;
    *(_DWORD *)&v54[40] = v52;
    *(_OWORD *)&v54[44] = xmmword_19EC731B0;
    *(_DWORD *)&v54[60] = 0;
    CAColorMatrixConcat(&v58, &v55, &v53);
    v66 = v61;
    v67 = v62;
    v64 = v59;
    v65 = v60;
    v63 = v58;
    *(_OWORD *)&v56[16] = v60;
    *(_OWORD *)v57 = v61;
    *(_OWORD *)&v57[16] = v62;
    v55 = v58;
    *(_OWORD *)v56 = v59;
    v53 = xmmword_19EC731C0;
    *(_OWORD *)v54 = xmmword_19EC731D0;
    *(_OWORD *)&v54[16] = xmmword_19EC731E0;
    *(_OWORD *)&v54[32] = xmmword_19EC731F0;
    *(_OWORD *)&v54[48] = xmmword_19EC73200;
    CAColorMatrixConcat(&v58, &v55, &v53);
    v66 = v61;
    v67 = v62;
    v64 = v59;
    v65 = v60;
    v63 = v58;
    v50 = +[NSValue valueWithCAColorMatrix:](NSValue, "valueWithCAColorMatrix:", &v58);
    objc_msgSend(a3, "setValue:forKey:", v50, kCAFilterInputColorMatrix);
    objc_msgSend(a3, "setEnabled:", 1);
  }
}

- (float)minimumShadowSpread
{
  return self->_minimumShadowSpread;
}

- (void)setMinimumShadowSpread:(float)a3
{
  self->_minimumShadowSpread = a3;
}

- (uint64_t)setScaleFactor:(uint64_t)result
{
  if (result)
    *(double *)(result + 2112) = a2;
  return result;
}

- (unint64_t)_parameterCount
{
  unint64_t result;

  result = -[CUIShapeEffectPreset effectCount](self, "effectCount");
  if (result)
    return *((unsigned int *)&self->_parameterList[124].effectValue.angleValue + result + 1);
  return result;
}

- (id)CUIEffectDataRepresentation
{
  unint64_t v3;
  _DWORD *v4;
  id v5;
  unint64_t v6;
  int v7;
  unsigned int *effectIndex;
  signed int v9;
  signed int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  $B1AB3EC4717F8C1868425D5654FD783D *p_effectValue;
  int v19;
  uint64_t v20;
  float floatValue;
  NSMutableData *v22;
  uint64_t v24;
  _DWORD v25[2];
  __int128 v26;
  int v27;

  v26 = xmmword_19EC73280;
  v3 = -[CUIShapeEffectPreset effectCount](self, "effectCount");
  v27 = v3;
  v4 = malloc_type_calloc(v3 + 1, 4uLL, 0x100004052888210uLL);
  v5 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", (8 * -[CUIShapeEffectPreset _parameterCount](self, "_parameterCount") + 8) * v3);
  if (v3)
  {
    v6 = 0;
    v7 = 0;
    effectIndex = self->_effectIndex;
    do
    {
      if (v7)
        v9 = effectIndex[v7 - 1];
      else
        v9 = 0;
      v10 = effectIndex[v6];
      v25[0] = self->_parameterList[v9].effectType;
      v25[1] = v10 - v9;
      v11 = v4[v6];
      v6 = (v7 + 1);
      v4[v6] = v11;
      objc_msgSend(v5, "appendBytes:length:", v25, 8);
      v4[v6] += 8;
      if (v10 > v9)
      {
        p_effectValue = &self->_parameterList[v9].effectValue;
        v19 = v10 - v9;
        do
        {
          v24 = 0;
          v20 = *((unsigned int *)&p_effectValue[-1].angleValue + 1);
          LODWORD(v24) = v20;
          if (v20 < 0xC)
          {
            switch((int)v20)
            {
              case 0:
              case 1:
                WORD2(v24) = p_effectValue->angleValue;
                BYTE6(v24) = p_effectValue->colorValue.b;
                break;
              case 2:
              case 3:
                floatValue = p_effectValue->floatValue;
                *((float *)&v24 + 1) = floatValue;
                break;
              case 4:
              case 5:
              case 7:
              case 8:
              case 9:
              case 10:
              case 11:
                HIDWORD(v24) = p_effectValue->intValue;
                break;
              case 6:
                WORD2(v24) = p_effectValue->angleValue;
                break;
              default:
                break;
            }
            objc_msgSend(v5, "appendBytes:length:", &v24, 8);
            v4[v6] += 8;
          }
          else
          {
            _CUILog(4, (uint64_t)"distill: Unrecognized effect parameter type %d for effect component %u", v12, v13, v14, v15, v16, v17, v20);
          }
          p_effectValue += 2;
          --v19;
        }
        while (v19);
      }
      v7 = v6;
    }
    while (v3 > v6);
  }
  v22 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)objc_msgSend(v5, "length") + 4 * v3 + 20);
  -[NSMutableData appendBytes:length:](v22, "appendBytes:length:", &v26, 20);
  -[NSMutableData appendBytes:length:](v22, "appendBytes:length:", v4, 4 * (v3 + 1));
  -[NSMutableData appendData:](v22, "appendData:", v5);
  free(v4);

  return v22;
}

- (CUIShapeEffectPreset)initWithConstantPreset:(id *)a3
{
  CUIShapeEffectPreset *result;
  uint64_t v5;
  int v6;
  int v7;
  double v8;
  unsigned int var0;
  unsigned int var1;
  unint64_t v12;
  $227A92AB6917B72AF7983ACE8C3D385D *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CUIShapeEffectPreset;
  result = -[CUIShapeEffectPreset init](&v14, sel_init);
  if (result)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 1.0;
    if (a3->var3 == 144)
      v8 = 2.0;
    result->_scaleFactor = v8;
    do
    {
      var0 = a3->var5[v5].var0;
      var1 = a3->var5[v5].var1;
      if (!*(_QWORD *)&a3->var5[v5].var0)
        break;
      if (var0 == -1 && var1 == 0)
      {
        result->_effectIndex[v7 + 1] = result->_effectIndex[v7];
        ++v7;
      }
      else
      {
        v12 = a3->var5[v5].var2.var1;
        v13 = &result->_parameterList[v6++];
        v13->effectType = var0;
        v13->effectParameter = var1;
        v13->effectValue.intValue = v12;
        ++result->_effectIndex[v7];
      }
      ++v5;
    }
    while (v5 != 125);
  }
  return result;
}

@end
