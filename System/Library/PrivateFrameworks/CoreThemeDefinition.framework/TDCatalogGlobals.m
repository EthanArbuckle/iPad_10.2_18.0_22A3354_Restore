@implementation TDCatalogGlobals

- (unint64_t)defaultBlendMode
{
  unint64_t defaultBlendMode;

  -[TDCatalogGlobals willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("defaultBlendMode"));
  defaultBlendMode = self->_defaultBlendMode;
  -[TDCatalogGlobals didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("defaultBlendMode"));
  return defaultBlendMode;
}

- (void)setDefaultBlendMode:(unint64_t)a3
{
  -[TDCatalogGlobals willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("defaultBlendMode"));
  self->_defaultBlendMode = a3;
  -[TDCatalogGlobals didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("defaultBlendMode"));
}

- (BOOL)allowsVibrancy
{
  BOOL allowsVibrancy;

  -[TDCatalogGlobals willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("allowsVibrancy"));
  allowsVibrancy = self->_allowsVibrancy;
  -[TDCatalogGlobals didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("allowsVibrancy"));
  return allowsVibrancy;
}

- (void)setAllowsVibrancy:(BOOL)a3
{
  -[TDCatalogGlobals willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("allowsVibrancy"));
  self->_allowsVibrancy = a3;
  -[TDCatalogGlobals didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("allowsVibrancy"));
}

- (BOOL)supportsWhitePointAdjustments
{
  BOOL supportsBrightnessAdjustments;

  -[TDCatalogGlobals willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("supportsWhitePointAdjustments"));
  supportsBrightnessAdjustments = self->_supportsBrightnessAdjustments;
  -[TDCatalogGlobals didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("supportsWhitePointAdjustments"));
  return supportsBrightnessAdjustments;
}

- (void)setSupportsWhitePointAdjustments:(BOOL)a3
{
  -[TDCatalogGlobals willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supportsWhitePointAdjustments"));
  self->_supportsBrightnessAdjustments = a3;
  -[TDCatalogGlobals didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supportsWhitePointAdjustments"));
}

- (BOOL)supportsBrightnessAdjustments
{
  BOOL supportsBrightnessAdjustments;

  -[TDCatalogGlobals willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("supportsBrightnessAdjustments"));
  supportsBrightnessAdjustments = self->_supportsBrightnessAdjustments;
  -[TDCatalogGlobals didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("supportsBrightnessAdjustments"));
  return supportsBrightnessAdjustments;
}

- (void)setSupportsBrightnessAdjustments:(BOOL)a3
{
  -[TDCatalogGlobals willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supportsBrightnessAdjustments"));
  self->_supportsBrightnessAdjustments = a3;
  -[TDCatalogGlobals didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supportsBrightnessAdjustments"));
}

- (BOOL)allowsSystemTintColors
{
  BOOL allowsSystemTintColors;

  -[TDCatalogGlobals willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("allowsSystemTintColors"));
  allowsSystemTintColors = self->_allowsSystemTintColors;
  -[TDCatalogGlobals didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("allowsSystemTintColors"));
  return allowsSystemTintColors;
}

- (void)setAllowsSystemTintColors:(BOOL)a3
{
  -[TDCatalogGlobals willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("allowsSystemTintColors"));
  self->_allowsSystemTintColors = a3;
  -[TDCatalogGlobals didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("allowsSystemTintColors"));
}

- (BOOL)allowsCustomTintColors
{
  BOOL allowsCustomTintColors;

  -[TDCatalogGlobals willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("allowsCustomTintColors"));
  allowsCustomTintColors = self->_allowsCustomTintColors;
  -[TDCatalogGlobals didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("allowsCustomTintColors"));
  return allowsCustomTintColors;
}

- (void)setAllowsCustomTintColors:(BOOL)a3
{
  -[TDCatalogGlobals willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("allowsCustomTintColors"));
  self->_allowsCustomTintColors = a3;
  -[TDCatalogGlobals didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("allowsCustomTintColors"));
}

- (BOOL)supportsMultipleAppearancesForEffects
{
  BOOL supportsMultipleAppearancesForEffects;

  -[TDCatalogGlobals willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("supportsMultipleAppearancesForEffects"));
  supportsMultipleAppearancesForEffects = self->_supportsMultipleAppearancesForEffects;
  -[TDCatalogGlobals didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("supportsMultipleAppearancesForEffects"));
  return supportsMultipleAppearancesForEffects;
}

- (void)setSupportsMultipleAppearancesForEffects:(BOOL)a3
{
  -[TDCatalogGlobals willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supportsMultipleAppearancesForEffects"));
  self->_supportsMultipleAppearancesForEffects = a3;
  -[TDCatalogGlobals didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supportsMultipleAppearancesForEffects"));
}

- (id)dictionaryForArchiving
{
  _QWORD v4[7];
  _QWORD v5[8];

  v5[7] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("defaultBlendMode");
  v5[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TDCatalogGlobals defaultBlendMode](self, "defaultBlendMode"));
  v4[1] = CFSTR("allowsVibrancy");
  v5[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TDCatalogGlobals allowsVibrancy](self, "allowsVibrancy"));
  v4[2] = CFSTR("supportsWhitePointAdjustments");
  v5[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TDCatalogGlobals supportsWhitePointAdjustments](self, "supportsWhitePointAdjustments"));
  v4[3] = CFSTR("supportsBrightnessAdjustments");
  v5[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TDCatalogGlobals supportsBrightnessAdjustments](self, "supportsBrightnessAdjustments"));
  v4[4] = CFSTR("allowsSystemTintColors");
  v5[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TDCatalogGlobals allowsSystemTintColors](self, "allowsSystemTintColors"));
  v4[5] = CFSTR("allowsCustomTintColors");
  v5[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TDCatalogGlobals allowsCustomTintColors](self, "allowsCustomTintColors"));
  v4[6] = CFSTR("supportsMultipleAppearancesForEffects");
  v5[6] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TDCatalogGlobals supportsMultipleAppearancesForEffects](self, "supportsMultipleAppearancesForEffects"));
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 7);
}

@end
