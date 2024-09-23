@implementation PKPaletteReturnKeyButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteReturnKeyButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPaletteReturnKeyButton"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteReturnKeyButton"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteReturnKeyButtonContentView"), CFSTR("text"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  -[PKPaletteReturnKeyButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPaletteReturnKeyButtonAccessibility;
    -[PKPaletteReturnKeyButtonAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteReturnKeyButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PKPaletteReturnKeyButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
