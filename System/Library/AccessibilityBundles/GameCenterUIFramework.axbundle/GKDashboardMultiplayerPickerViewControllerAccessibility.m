@implementation GKDashboardMultiplayerPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKDashboardMultiplayerPickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKDashboardMultiplayerPickerViewController"), CFSTR("showContactPickerButton"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("GKDashboardMultiplayerPickerViewController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardMultiplayerPickerViewControllerAccessibility;
  -[GKDashboardMultiplayerPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[GKDashboardMultiplayerPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("showContactPickerButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &__block_literal_global_0);

}

id __101__GKDashboardMultiplayerPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return AXGameCenterUIFrameworkLocString(CFSTR("ADD_FROM_CONTACTS"));
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDashboardMultiplayerPickerViewControllerAccessibility;
  -[GKDashboardMultiplayerPickerViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[GKDashboardMultiplayerPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
