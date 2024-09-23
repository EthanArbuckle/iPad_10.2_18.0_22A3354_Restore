@implementation CUIThemeSchemaEffectRendition

- (CUIThemeSchemaEffectRendition)initWithCoreUIOptions:(id)a3 forKey:(const _renditionkeytoken *)a4
{
  CUIThemeSchemaEffectRendition *v6;
  CUIThemeSchemaEffectRendition *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIThemeSchemaEffectRendition;
  v6 = -[CUIThemeSchemaEffectRendition init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CUIThemeRendition _initializeRenditionKey:](v6, "_initializeRenditionKey:", a4);
    -[CUIThemeRendition setOpacity:](v7, "setOpacity:", 1.0);
    -[CUIThemeRendition setBlendMode:](v7, "setBlendMode:", 0);
    if (+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.systemappearance")))
    {
      -[CUIThemeSchemaEffectRendition _initializeCoreUIOptions:](v7, "_initializeCoreUIOptions:", a3);
    }
    if (!v7->_effectPreset)
    {

      return 0;
    }
  }
  return v7;
}

- (id)_rendererInitializationDictionary
{
  return &unk_1E41DDE00;
}

- (void)_initializeCoreUIOptions:(id)a3
{
  self->_cuiInfo = (NSDictionary *)a3;
}

- (id)coreUIOptions
{
  return self->_cuiInfo;
}

- (void)dealloc
{
  NSDictionary *cuiInfo;
  CUIShapeEffectPreset *effectPreset;
  CUIImage *referenceImage;
  objc_super v6;

  cuiInfo = self->_cuiInfo;
  if (cuiInfo)

  effectPreset = self->_effectPreset;
  if (effectPreset)

  referenceImage = self->_referenceImage;
  if (referenceImage)

  v6.receiver = self;
  v6.super_class = (Class)CUIThemeSchemaEffectRendition;
  -[CUIThemeRendition dealloc](&v6, sel_dealloc);
}

- (BOOL)_generateReferenceImage
{
  return 0;
}

- (id)referenceImage
{
  id result;

  result = self->_referenceImage;
  if (!result)
  {
    -[CUIThemeSchemaEffectRendition _generateReferenceImage](self, "_generateReferenceImage");
    return self->_referenceImage;
  }
  return result;
}

- (id)effectPreset
{
  return self->_effectPreset;
}

@end
