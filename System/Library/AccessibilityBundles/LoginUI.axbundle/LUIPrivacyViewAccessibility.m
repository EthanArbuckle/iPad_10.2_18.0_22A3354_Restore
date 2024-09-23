@implementation LUIPrivacyViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LUIPrivacyView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LUIPrivacyView"), CFSTR("setButtonTitle:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LUIPrivacyView"), CFSTR("_moreInfoButton"), "UIButton");

}

- (void)_accessibilityMungeMoreButtonLabel
{
  void *v2;
  id v3;

  -[LUIPrivacyViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_moreInfoButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("learn.more.label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIPrivacyViewAccessibility;
  -[LUIPrivacyViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[LUIPrivacyViewAccessibility _accessibilityMungeMoreButtonLabel](self, "_accessibilityMungeMoreButtonLabel");
}

- (void)setButtonTitle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LUIPrivacyViewAccessibility;
  -[LUIPrivacyViewAccessibility setButtonTitle:](&v4, sel_setButtonTitle_, a3);
  -[LUIPrivacyViewAccessibility _accessibilityMungeMoreButtonLabel](self, "_accessibilityMungeMoreButtonLabel");
}

@end
