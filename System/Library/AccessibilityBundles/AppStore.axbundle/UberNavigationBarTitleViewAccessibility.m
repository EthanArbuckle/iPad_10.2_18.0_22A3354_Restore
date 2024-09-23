@implementation UberNavigationBarTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.UberNavigationBarTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.UberNavigationBarTitleView"), CFSTR("accessibilityNonStandardDismissButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.UberNavigationBarTitleView"), CFSTR("layoutSubviews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  -[UberNavigationBarTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityNonStandardDismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &__block_literal_global_4);
  v4.receiver = self;
  v4.super_class = (Class)UberNavigationBarTitleViewAccessibility;
  -[UberNavigationBarTitleViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);

}

id __85__UberNavigationBarTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityAppStoreLocalizedString(CFSTR("back.button"));
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UberNavigationBarTitleViewAccessibility;
  -[UberNavigationBarTitleViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[UberNavigationBarTitleViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
