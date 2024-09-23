@implementation PKNavigationDashboardPassViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKNavigationDashboardPassViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PKNavigationDashboardPassViewController"), CFSTR("dashboardVC"), "@");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKDashboardPassViewController"), CFSTR("UIViewController"));

}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  void *v3;
  id v5;

  -[PKNavigationDashboardPassViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dashboardVC"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v5 = v2;
    AXPerformSafeBlock();

  }
  return v3 != 0;
}

void __82__PKNavigationDashboardPassViewControllerAccessibility_accessibilityPerformEscape__block_invoke()
{
  void *v0;
  void *v1;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
