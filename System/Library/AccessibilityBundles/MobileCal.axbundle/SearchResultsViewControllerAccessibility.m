@implementation SearchResultsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchResultsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SearchResultsViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SearchResultsViewController"), CFSTR("ListViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ListViewController"), CFSTR("tableView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchResultsViewControllerAccessibility;
  -[SearchResultsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SearchResultsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityUIKitLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchResultsViewControllerAccessibility;
  -[SearchResultsViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SearchResultsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
