@implementation WFAutomationTypeExplanationPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFAutomationTypeExplanationPlatterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFAutomationTypeExplanationPlatterView"), CFSTR("button"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WFAutomationTypeExplanationPlatterView"), CFSTR("_explanationTextLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[WFAutomationTypeExplanationPlatterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("button"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[WFAutomationTypeExplanationPlatterViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("button.configuration.title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationTypeExplanationPlatterViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_explanationTextLabel.text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
