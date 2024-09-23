@implementation PKPaletteInkingToolViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteInkingToolView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteInkingToolView"), CFSTR("ink"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKInk"), CFSTR("color"), "@", 0);

}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPaletteInkingToolViewAccessibility;
  -[PKPaletteInkingToolViewAccessibility accessibilityValue](&v14, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInkingToolViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("toolIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3410]))
  {
    v5 = v3;
  }
  else
  {
    -[PKPaletteInkingToolViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("ink.color"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "alphaComponent");
      accessibilityPencilKitLocalizedString(CFSTR("tool.color"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXColorStringForColor();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityPencilKitLocalizedString(CFSTR("tool.opacity"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AXFormatFloatWithPercentage();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v11;
    }
    v5 = v3;

  }
  return v5;
}

@end
