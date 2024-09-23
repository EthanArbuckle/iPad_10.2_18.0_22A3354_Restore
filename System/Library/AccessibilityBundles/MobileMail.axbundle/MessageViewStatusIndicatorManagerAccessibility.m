@implementation MessageViewStatusIndicatorManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MessageViewStatusIndicatorManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageViewStatusIndicatorManager"), CFSTR("updateImageViews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageViewStatusIndicatorManager"), CFSTR("statusIndicatorImageViews"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MessageViewStatusIndicatorManagerAccessibility;
  -[MessageViewStatusIndicatorManagerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[MessageViewStatusIndicatorManagerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("statusIndicatorImageViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_11);
}

void __92__MessageViewStatusIndicatorManagerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsAccessibilityElement:", 1);
  objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BDF73E0]);

}

- (void)updateImageViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MessageViewStatusIndicatorManagerAccessibility;
  -[MessageViewStatusIndicatorManagerAccessibility updateImageViews](&v3, sel_updateImageViews);
  -[MessageViewStatusIndicatorManagerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
