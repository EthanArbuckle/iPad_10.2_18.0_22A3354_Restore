@implementation HUQuickControlContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlContainerView"), CFSTR("detailsButton"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUQuickControlContainerView"), CFSTR("UIView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlContainerViewAccessibility;
  -[HUQuickControlContainerViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  accessibilityHomeUILocalizedString(CFSTR("settings.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlContainerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("detailsButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlContainerViewAccessibility;
  -[HUQuickControlContainerViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[HUQuickControlContainerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
