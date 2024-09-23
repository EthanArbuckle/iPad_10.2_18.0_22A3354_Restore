@implementation HUOLDAlarmTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUOLDAlarmTableViewController");
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
  v2.super_class = (Class)HUOLDAlarmTableViewControllerAccessibility;
  -[HUOLDAlarmTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUOLDAlarmTableViewControllerAccessibility;
  -[HUOLDAlarmTableViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HUOLDAlarmTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
