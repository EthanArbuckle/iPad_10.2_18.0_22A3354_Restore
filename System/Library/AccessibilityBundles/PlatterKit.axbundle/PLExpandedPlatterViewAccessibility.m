@implementation PLExpandedPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLExpandedPlatterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("PLExpandedPlatter"), CFSTR("dismissControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLExpandedPlatterView"), CFSTR("layoutSubviews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLExpandedPlatterViewAccessibility;
  -[PLExpandedPlatterViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PLExpandedPlatterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("dismiss"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLExpandedPlatterViewAccessibility;
  -[PLExpandedPlatterViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PLExpandedPlatterViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
