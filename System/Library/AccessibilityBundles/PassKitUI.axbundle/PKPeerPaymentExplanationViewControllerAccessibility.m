@implementation PKPeerPaymentExplanationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPeerPaymentExplanationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKExplanationViewController"), CFSTR("explanationView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPeerPaymentExplanationViewController"), CFSTR("PKExplanationViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKExplanationView"), CFSTR("imageView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentExplanationViewControllerAccessibility;
  -[PKPeerPaymentExplanationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[PKPeerPaymentExplanationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("explanationView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("card.snapshot.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentExplanationViewControllerAccessibility;
  -[PKPeerPaymentExplanationViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PKPeerPaymentExplanationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
