@implementation CSFixedFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSFixedFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSFixedFooterView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSFixedFooterView"), CFSTR("callToActionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSFixedFooterView"), CFSTR("alternateCallToActionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSFixedFooterView"), CFSTR("statusTextView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSFixedFooterViewAccessibility;
  -[CSFixedFooterViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CSFixedFooterViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("callToActionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityRespondsToUserInteraction:", 0);
  -[CSFixedFooterViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("alternateCallToActionLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityRespondsToUserInteraction:", 0);
  -[CSFixedFooterViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("statusTextView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityRespondsToUserInteraction:", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSFixedFooterViewAccessibility;
  -[CSFixedFooterViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[CSFixedFooterViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
