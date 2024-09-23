@implementation BuddyTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyTableViewController"), CFSTR("tableView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BuddyTableViewController"), CFSTR("_tableView"), "UITableView");

}

- (void)_accessibilityMarkTableViewAsNotAXElement
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[BuddyTableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BuddyTableViewControllerAccessibility;
  -[BuddyTableViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[BuddyTableViewControllerAccessibility _accessibilityMarkTableViewAsNotAXElement](self, "_accessibilityMarkTableViewAsNotAXElement");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BuddyTableViewControllerAccessibility;
  -[BuddyTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[BuddyTableViewControllerAccessibility _accessibilityMarkTableViewAsNotAXElement](self, "_accessibilityMarkTableViewAsNotAXElement");
}

- (BuddyTableViewControllerAccessibility)init
{
  BuddyTableViewControllerAccessibility *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BuddyTableViewControllerAccessibility;
  v2 = -[BuddyTableViewControllerAccessibility init](&v7, sel_init);
  -[BuddyTableViewControllerAccessibility safeValueForKey:](v2, "safeValueForKey:", CFSTR("_containerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("BuddyContainerView"));

  -[BuddyTableViewControllerAccessibility safeValueForKey:](v2, "safeValueForKey:", CFSTR("_tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("BuddyTableView"));

  -[BuddyTableViewControllerAccessibility safeValueForKey:](v2, "safeValueForKey:", CFSTR("_tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", &stru_2503440B0);

  return v2;
}

@end
