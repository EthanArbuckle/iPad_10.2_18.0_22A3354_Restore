@implementation HUAlarmTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUAlarmTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("HUAlarmTableViewController"), CFSTR("UITableViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HUAlarmTableViewControllerAccessibility;
  -[HUAlarmTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmTableViewControllerAccessibility;
  -[HUAlarmTableViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HUAlarmTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
