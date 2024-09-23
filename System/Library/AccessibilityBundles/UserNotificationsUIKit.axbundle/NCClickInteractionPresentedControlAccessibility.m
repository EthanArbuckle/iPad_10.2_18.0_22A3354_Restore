@implementation NCClickInteractionPresentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCClickInteractionPresentedControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCClickInteractionPresentedControl"), CFSTR("_presentedView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCClickInteractionPresentedView"), CFSTR("_titleLabel"), "UILabel");
  if (AXProcessIsSpringBoard())
    objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSCombinedListViewController"), CFSTR("_structuredListViewController"), "NCNotificationStructuredListViewController");

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCClickInteractionPresentedControlAccessibility;
  return *MEMORY[0x24BDF73B0] | -[NCClickInteractionPresentedControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[NCClickInteractionPresentedControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_presentedView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[NCClickInteractionPresentedControlAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_structuredListViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityPerformEscape");

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return v5;
}

uint64_t __77__NCClickInteractionPresentedControlAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("CSCombinedListViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
