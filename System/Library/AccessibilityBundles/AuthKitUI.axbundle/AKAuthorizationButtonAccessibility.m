@implementation AKAuthorizationButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKAuthorizationButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAuthorizationButton"), CFSTR("buttonText"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKAuthorizationButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[AKAuthorizationButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return (id)-[AKAuthorizationButtonAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("buttonText"));
}

@end
