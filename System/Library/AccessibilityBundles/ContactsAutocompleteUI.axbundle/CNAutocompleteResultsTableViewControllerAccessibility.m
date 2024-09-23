@implementation CNAutocompleteResultsTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAutocompleteResultsTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAutocompleteResultsTableViewController"), CFSTR("selectRowAtIndexPath:"), "v", "@", 0);
}

- (void)selectRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteResultsTableViewControllerAccessibility;
  -[CNAutocompleteResultsTableViewControllerAccessibility selectRowAtIndexPath:](&v9, sel_selectRowAtIndexPath_, v4);
  objc_opt_class();
  -[CNAutocompleteResultsTableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellForRowAtIndexPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = *MEMORY[0x24BDF71E8];
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v5, v8);

}

@end
