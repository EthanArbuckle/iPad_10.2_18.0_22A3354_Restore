@implementation SBUIPasscodeBiometricAuthenticationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIPasscodeBiometricAuthenticationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeBiometricAuthenticationView"), CFSTR("_invisibleUsePasscodeButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeBiometricAuthenticationView"), CFSTR("_backgroundCancelButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeBiometricAuthenticationView"), CFSTR("_updateSubviews"), "v", 0);

}

- (void)_updateSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeBiometricAuthenticationViewAccessibility;
  -[SBUIPasscodeBiometricAuthenticationViewAccessibility _updateSubviews](&v3, sel__updateSubviews);
  -[SBUIPasscodeBiometricAuthenticationViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeBiometricAuthenticationViewAccessibility;
  -[SBUIPasscodeBiometricAuthenticationViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SBUIPasscodeBiometricAuthenticationViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_invisibleUsePasscodeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElementsHidden:", 1);

  -[SBUIPasscodeBiometricAuthenticationViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_backgroundCancelButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", 1);

}

@end
