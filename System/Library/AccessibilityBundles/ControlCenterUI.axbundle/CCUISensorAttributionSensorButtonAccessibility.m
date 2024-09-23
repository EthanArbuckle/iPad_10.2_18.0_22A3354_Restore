@implementation CCUISensorAttributionSensorButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUISensorAttributionSensorButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISensorAttributionSensorButton"), CFSTR("descriptionLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CCUISensorAttributionSensorButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("descriptionLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7410];
}

@end
