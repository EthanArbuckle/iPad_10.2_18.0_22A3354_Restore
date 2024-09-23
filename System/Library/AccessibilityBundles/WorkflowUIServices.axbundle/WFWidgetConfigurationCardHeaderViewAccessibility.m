@implementation WFWidgetConfigurationCardHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFWidgetConfigurationCardHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFWidgetConfigurationCardHeaderView"), CFSTR("labelsStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFWidgetConfigurationCardHeaderView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFWidgetConfigurationCardHeaderView"), CFSTR("subtitleLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWidgetConfigurationCardHeaderViewAccessibility;
  -[WFWidgetConfigurationCardHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[WFWidgetConfigurationCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelsStackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  -[WFWidgetConfigurationCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v6, v5, CFSTR("__AXStringForVariablesSentinel"));

}

@end
