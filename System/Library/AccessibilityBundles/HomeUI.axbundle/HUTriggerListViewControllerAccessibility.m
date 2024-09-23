@implementation HUTriggerListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUTriggerListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUTriggerListViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUTriggerListViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTriggerListViewController"), CFSTR("navigationAddButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUTriggerListViewControllerAccessibility;
  -[HUTriggerListViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HUTriggerListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationAddButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityHomeLocalizedString(CFSTR("navBar.plus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
