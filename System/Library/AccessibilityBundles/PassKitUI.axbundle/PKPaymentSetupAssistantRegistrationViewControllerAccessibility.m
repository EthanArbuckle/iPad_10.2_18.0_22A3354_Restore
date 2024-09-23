@implementation PKPaymentSetupAssistantRegistrationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentSetupAssistantRegistrationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPaymentSetupAssistantRegistrationViewController"), CFSTR("PKExplanationViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKExplanationViewController"), CFSTR("explanationView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKExplanationView"), CFSTR("_logoImageView"), "UIImageView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupAssistantRegistrationViewControllerAccessibility;
  -[PKPaymentSetupAssistantRegistrationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[PKPaymentSetupAssistantRegistrationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("explanationView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_logoImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("apple.pay.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupAssistantRegistrationViewControllerAccessibility;
  -[PKPaymentSetupAssistantRegistrationViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PKPaymentSetupAssistantRegistrationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
