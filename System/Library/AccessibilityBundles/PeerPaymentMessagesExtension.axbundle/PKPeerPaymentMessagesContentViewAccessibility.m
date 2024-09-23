@implementation PKPeerPaymentMessagesContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPeerPaymentMessagesContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPeerPaymentMessagesContentView"), CFSTR("_imageView"), "UIImageView");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentMessagesContentViewAccessibility;
  -[PKPeerPaymentMessagesContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[PKPeerPaymentMessagesContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", v4 & ~*MEMORY[0x24BDF73C8]);
  accessibilityPeerPaymentLocalizedString(CFSTR("apple.pay.logo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

}

@end
