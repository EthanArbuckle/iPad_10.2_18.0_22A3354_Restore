@implementation AlertDeliveryLocationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AlertDeliveryLocationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AlertDeliveryLocationView"), CFSTR("_typeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AlertDeliveryLocationView"), CFSTR("selected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AlertDeliveryLocationView"), CFSTR("type"), "Q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v2;

  v2 = -[AlertDeliveryLocationViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("type"));
  if (v2 > 2)
    return accessibilityLocalizedString(&stru_2502DB560);
  else
    return accessibilityLocalizedString(off_2502DB520[v2]);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[AlertDeliveryLocationViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("selected"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;

  -[AlertDeliveryLocationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_typeLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
