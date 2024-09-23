@implementation EKEventViewControllerDefaultImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventViewControllerDefaultImpl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventViewControllerDefaultImpl"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventViewControllerDefaultImpl"), CFSTR("_tableView"), "UITableView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerDefaultImplAccessibility;
  -[EKEventViewControllerDefaultImplAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[EKEventViewControllerDefaultImplAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("EventDetailsContainer"));
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventViewControllerDefaultImplAccessibility;
  -[EKEventViewControllerDefaultImplAccessibility loadView](&v3, sel_loadView);
  -[EKEventViewControllerDefaultImplAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
