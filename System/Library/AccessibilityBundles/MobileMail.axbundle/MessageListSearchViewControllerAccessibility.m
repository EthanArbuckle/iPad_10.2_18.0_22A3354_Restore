@implementation MessageListSearchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MessageListSearchViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListSearchViewController"), CFSTR("setSearchSuggestionsVisible:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListSearchViewController"), CFSTR("isSearchSuggestionsVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MessageListSearchViewController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MessageListSearchViewControllerAccessibility;
  -[MessageListSearchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[MessageListSearchViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MessageListSearchViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSearchSuggestionsVisible")))
  {
    v5 = &__block_literal_global_195;
    v6 = v4;
  }
  else
  {
    v6 = v4;
    v5 = 0;
  }
  objc_msgSend(v6, "_setIsAccessibilityElementBlock:", v5);

}

uint64_t __90__MessageListSearchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AXUISearchControllerDimmingView"));

  return v3;
}

uint64_t __90__MessageListSearchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return 0;
}

- (void)setSearchSuggestionsVisible:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MessageListSearchViewControllerAccessibility;
  -[MessageListSearchViewControllerAccessibility setSearchSuggestionsVisible:](&v4, sel_setSearchSuggestionsVisible_, a3);
  -[MessageListSearchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
