@implementation PKSqueezePaletteMulticolorSwatchButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKSqueezePaletteMulticolorSwatchButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSqueezePaletteColorSwatchButton"), CFSTR("_swatch"), "PKPaletteColorSwatch");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PKSqueezePaletteMulticolorSwatchButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("swatch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PKSqueezePaletteMulticolorSwatchButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("swatch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
