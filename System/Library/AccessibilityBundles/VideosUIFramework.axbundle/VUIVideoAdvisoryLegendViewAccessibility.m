@implementation VUIVideoAdvisoryLegendViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIVideoAdvisoryLegendView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIVideoAdvisoryLegendView"), CFSTR("legendDescriptionLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[VUIVideoAdvisoryLegendViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("legendDescriptionLabel"));
}

@end
