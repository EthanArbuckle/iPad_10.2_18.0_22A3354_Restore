@implementation IFGraphicSymbolDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  return (id)sharedInstance_sharedInstance_0;
}

void __41__IFGraphicSymbolDefaults_sharedInstance__block_invoke()
{
  IFGraphicSymbolDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(IFGraphicSymbolDefaults);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (IFGraphicSymbolDefaults)init
{
  IFGraphicSymbolDefaults *v2;
  IFGraphicSymbolDefaults *v3;
  NSString *symbolName;
  double v5;
  IFColor *v6;
  IFColor *borderColorLightMode;
  void *v8;
  IFColor *v9;
  IFColor *borderColorDarkMode;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IFGraphicSymbolDefaults;
  v2 = -[IFGraphicSymbolDefaults init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    symbolName = v2->_symbolName;
    v2->_symbolName = (NSString *)CFSTR("questionmark.app.dashed");

    *(int64x2_t *)&v3->_shape = vdupq_n_s64(1uLL);
    *(_OWORD *)&v3->_symbolColor = xmmword_1D4139730;
    *(_OWORD *)&v3->_enclosureColor = xmmword_1D4139740;
    v3->_fill = 1;
    objc_msgSend(MEMORY[0x1E0D1A6F0], "defaultSymbolPointSizeRatio");
    v3->_enclosureSizeMultiplier = v5;
    v3->_borderWidth = 1.0;
    v6 = -[IFColor initWithWhite:alpha:]([IFColor alloc], "initWithWhite:alpha:", 0.0, 0.1);
    borderColorLightMode = v3->_borderColorLightMode;
    v3->_borderColorLightMode = v6;

    objc_msgSend(MEMORY[0x1E0D1A6B0], "colorWithName:designSystem:palette:colorScheme:contrast:styling:displayGamut:error:", 17, 0, 0, 1, 0, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[IFColor initWithCGColor:]([IFColor alloc], "initWithCGColor:", objc_msgSend(v8, "cgColor"));
    borderColorDarkMode = v3->_borderColorDarkMode;
    v3->_borderColorDarkMode = v9;

  }
  return v3;
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)shape
{
  return self->_shape;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (int64_t)symbolColor
{
  return self->_symbolColor;
}

- (int64_t)symbolColorAlternate
{
  return self->_symbolColorAlternate;
}

- (int64_t)enclosureColor
{
  return self->_enclosureColor;
}

- (int64_t)enclosureColorAlternate
{
  return self->_enclosureColorAlternate;
}

- (int64_t)fill
{
  return self->_fill;
}

- (double)enclosureSizeMultiplier
{
  return self->_enclosureSizeMultiplier;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (IFColor)borderColorLightMode
{
  return (IFColor *)objc_getProperty(self, a2, 88, 1);
}

- (IFColor)borderColorDarkMode
{
  return (IFColor *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColorDarkMode, 0);
  objc_storeStrong((id *)&self->_borderColorLightMode, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
