@implementation ReadingListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ReadingListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ReadingListViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ReadingListViewController"), CFSTR("_searchBar"), "UISearchBar");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ReadingListViewController"), CFSTR("_tableView"), "UITableView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ReadingListViewControllerAccessibility;
  -[ReadingListViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[ReadingListViewControllerAccessibility _axUnhideSearchBar](self, "_axUnhideSearchBar");
}

- (void)_axUnhideSearchBar
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ReadingListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    -[ReadingListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_searchBar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v4, "setContentInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ReadingListViewControllerAccessibility;
  -[ReadingListViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[ReadingListViewControllerAccessibility _axUnhideSearchBar](self, "_axUnhideSearchBar");
}

@end
