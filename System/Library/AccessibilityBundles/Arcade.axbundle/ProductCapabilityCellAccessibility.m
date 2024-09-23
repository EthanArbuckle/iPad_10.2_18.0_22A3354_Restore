@implementation ProductCapabilityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.ProductCapabilityCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.ProductCapabilityCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.ProductCapabilityCell"), CFSTR("accessibilityCaptionLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[ProductCapabilityCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilityCaptionLabel"));
}

@end
