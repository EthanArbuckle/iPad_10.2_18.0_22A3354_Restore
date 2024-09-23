@implementation CARDNDLearnMoreViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CARDNDLearnMoreViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("_CARLearnMoreViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CARDNDLearnMoreViewController"), CFSTR("_CARLearnMoreViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_CARLearnMoreViewController"), CFSTR("textView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CARDNDLearnMoreViewControllerAccessibility;
  -[CARDNDLearnMoreViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[CARDNDLearnMoreViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 1);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CARDNDLearnMoreViewControllerAccessibility;
  -[CARDNDLearnMoreViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CARDNDLearnMoreViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
