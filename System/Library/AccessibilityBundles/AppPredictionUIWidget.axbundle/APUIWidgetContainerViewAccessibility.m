@implementation APUIWidgetContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("APUIWidgetContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("APUIWidgetContainerView"), CFSTR("_stackView"), "UIStackView");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[APUIWidgetContainerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_stackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __58__APUIWidgetContainerViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
