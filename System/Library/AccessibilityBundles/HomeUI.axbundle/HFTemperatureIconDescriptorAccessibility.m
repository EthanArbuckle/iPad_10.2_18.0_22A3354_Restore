@implementation HFTemperatureIconDescriptorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HFTemperatureIconDescriptor");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFTemperatureIconDescriptor"), CFSTR("formattedTemperature"), "@", 0);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[HFTemperatureIconDescriptorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("formattedTemperature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
