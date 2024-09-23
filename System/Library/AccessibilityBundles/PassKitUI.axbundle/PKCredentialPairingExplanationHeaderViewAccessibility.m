@implementation PKCredentialPairingExplanationHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKCredentialPairingExplanationHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKCredentialPairingExplanationHeaderView"), CFSTR("_imageView"), "UIImageView");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCredentialPairingExplanationHeaderViewAccessibility;
  -[PKCredentialPairingExplanationHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[PKCredentialPairingExplanationHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

  accessibilityLocalizedStringAlisha(CFSTR("car.pairing.instructions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCredentialPairingExplanationHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_imageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

@end
