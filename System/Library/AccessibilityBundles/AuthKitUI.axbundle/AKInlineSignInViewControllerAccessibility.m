@implementation AKInlineSignInViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKInlineSignInViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKInlineSignInViewController"), CFSTR("viewDidLoad"), "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AKInlineSignInViewControllerAccessibility;
  -[AKInlineSignInViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKInlineSignInViewControllerAccessibility;
  -[AKInlineSignInViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[AKInlineSignInViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
