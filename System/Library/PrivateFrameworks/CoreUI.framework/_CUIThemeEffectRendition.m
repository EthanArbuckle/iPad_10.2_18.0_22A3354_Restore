@implementation _CUIThemeEffectRendition

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  _QWORD *v5;
  CUIThemeDataEffectPreset *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CUIThemeEffectRendition;
  v5 = -[CUIThemeRendition _initWithCSIHeader:version:](&v9, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  v5[27] = (char *)&a3->var11.var1[a3->var11.var0 + 1] + a3->var10;
  v6 = -[CUIThemeDataEffectPreset initWithEffectData:forScaleFactor:]([CUIThemeDataEffectPreset alloc], "initWithEffectData:forScaleFactor:", v5[27], (double)objc_msgSend(v5, "internalScale"));
  v5[28] = v6;
  LODWORD(v7) = *((_DWORD *)v5 + 58);
  -[CUIShapeEffectPreset setMinimumShadowSpread:](v6, "setMinimumShadowSpread:", v7);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeEffectRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (id)effectPreset
{
  return self->_effectPreset;
}

- (void)_setStructuredThemeStore:(id)a3
{
  if (objc_msgSend(a3, "distilledInCoreUIVersion") <= 0x192)
    -[CUIThemeRendition setInternalScale:](self, "setInternalScale:", 2);
  self->_minimumShadowSpread = 0.0;
  if (objc_msgSend(a3, "distilledInCoreUIVersion") <= 0x1CE)
    self->_minimumShadowSpread = 2.0;
}

@end
