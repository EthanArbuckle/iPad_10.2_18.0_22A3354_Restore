@implementation CrossLinkLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.CrossLinkLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.CrossLinkLockupView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.CrossLinkLockupView"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.CrossLinkLockupView"), CFSTR("accessibilityLockupView"), "@", 0);

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
  void *v7;

  -[CrossLinkLockupViewAccessibility _axLockupView](self, "_axLockupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CrossLinkLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CrossLinkLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
    objc_msgSend(v6, "axSafelyAddObject:", v3);
  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
    objc_msgSend(v6, "axSafelyAddObject:", v4);
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v6, "axSafelyAddObject:", v5);
  AXLabelForElements();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;

  -[CrossLinkLockupViewAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySupplementaryFooterViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axLockupView
{
  return (id)-[CrossLinkLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLockupView"));
}

@end
