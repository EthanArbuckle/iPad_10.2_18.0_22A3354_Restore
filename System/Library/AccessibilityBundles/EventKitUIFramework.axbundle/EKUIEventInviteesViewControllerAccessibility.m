@implementation EKUIEventInviteesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKUIEventInviteesViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIEventInviteesViewController"), CFSTR("loadView"), "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIEventInviteesViewControllerAccessibility;
  -[EKUIEventInviteesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[EKUIEventInviteesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("rightBarButtonItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("email.invitees"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKUIEventInviteesViewControllerAccessibility;
  -[EKUIEventInviteesViewControllerAccessibility loadView](&v3, sel_loadView);
  -[EKUIEventInviteesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
