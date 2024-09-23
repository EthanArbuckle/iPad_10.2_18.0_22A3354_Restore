@implementation InteractiveTimelineDateIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.InteractiveTimelineDateIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)InteractiveTimelineDateIndicatorAccessibility;
  -[InteractiveTimelineDateIndicatorAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[InteractiveTimelineDateIndicatorAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

uint64_t __91__InteractiveTimelineDateIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
