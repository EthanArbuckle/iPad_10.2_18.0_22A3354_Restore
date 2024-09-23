@implementation HUDashboardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUDashboardViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDashboardContext"), CFSTR("accessoryTypeGroup"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDashboardContext"), CFSTR("room"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDashboardContext"), CFSTR("home"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDashboardViewController"), CFSTR("navigationAnnounceButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUDashboardViewControllerAccessibility;
  -[HUDashboardViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HUDashboardViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationAnnounceButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)HUDashboardViewControllerAccessibility;
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF7408] | (unint64_t)-[HUDashboardViewControllerAccessibility accessibilityTraits](&v4, sel_accessibilityTraits));

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUDashboardViewControllerAccessibility;
  -[HUDashboardViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HUDashboardViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
