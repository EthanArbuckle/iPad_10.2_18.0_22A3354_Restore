@implementation HUAlarmEditSettingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUAlarmEditSettingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUAlarmEditSettingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAlarmEditSettingViewController"), CFSTR("tableView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HUAlarmEditSettingViewControllerAccessibility;
  -[HUAlarmEditSettingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmEditSettingViewControllerAccessibility;
  -[HUAlarmEditSettingViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HUAlarmEditSettingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
