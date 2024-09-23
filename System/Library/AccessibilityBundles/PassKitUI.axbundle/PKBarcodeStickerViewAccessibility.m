@implementation PKBarcodeStickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKBarcodeStickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKBarcodeStickerView"), CFSTR("_drawBarcode"), "B");
}

- (BOOL)isAccessibilityElement
{
  return -[PKBarcodeStickerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_drawBarcode"));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  -[PKBarcodeStickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_altTextLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("barcode.image"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
