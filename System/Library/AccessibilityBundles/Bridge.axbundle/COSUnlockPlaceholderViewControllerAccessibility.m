@implementation COSUnlockPlaceholderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSUnlockPlaceholderViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("COSUnlockPlaceholderViewController"), CFSTR("BPSWelcomeOptinViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("COSUnlockPlaceholderViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BPSWelcomeOptinViewController"), CFSTR("watchView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)COSUnlockPlaceholderViewControllerAccessibility;
  -[COSUnlockPlaceholderViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("phone.with.watch.picture.unlock.passcode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COSUnlockPlaceholderViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("watchView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COSUnlockPlaceholderViewControllerAccessibility;
  -[COSUnlockPlaceholderViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[COSUnlockPlaceholderViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
