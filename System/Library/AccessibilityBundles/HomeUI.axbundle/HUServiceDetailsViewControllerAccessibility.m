@implementation HUServiceDetailsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUServiceDetailsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("HUServiceDetailsViewController"), CFSTR("UITableViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUServiceDetailsViewControllerAccessibility;
  -[HUServiceDetailsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[HUServiceDetailsViewControllerAccessibility _axModifyTableView](self, "_axModifyTableView");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUServiceDetailsViewControllerAccessibility;
  -[HUServiceDetailsViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HUServiceDetailsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
