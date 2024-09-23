@implementation LUIAppleIDSignInViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LUIAppleIDSignInViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LUIAppleIDSignInViewController"), CFSTR("usernameCell"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUIAppleIDSignInViewControllerAccessibility;
  -[LUIAppleIDSignInViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[LUIAppleIDSignInViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("usernameCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilitySetIdentification:", CFSTR("AXLUITableViewCellTextFieldOnlyTag"));
}

@end
