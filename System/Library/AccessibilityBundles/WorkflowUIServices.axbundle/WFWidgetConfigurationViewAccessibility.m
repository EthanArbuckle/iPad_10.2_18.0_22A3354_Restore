@implementation WFWidgetConfigurationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFWidgetConfigurationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFWidgetConfigurationView"), CFSTR("containerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFWidgetConfigurationContainerView"), CFSTR("requestDismissal"), "v", 0);

}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

void __68__WFWidgetConfigurationViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("containerView"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestDismissal");

}

@end
