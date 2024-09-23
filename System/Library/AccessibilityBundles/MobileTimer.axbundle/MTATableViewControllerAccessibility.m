@implementation MTATableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTATableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MTATableViewController"), CFSTR("UITableViewController"));
}

- (void)_numberOfItemsDidChangeAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTATableViewControllerAccessibility;
  -[MTATableViewControllerAccessibility _numberOfItemsDidChangeAnimated:](&v7, sel__numberOfItemsDidChangeAnimated_, a3);
  -[MTATableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_noItemsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MTATableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v4, "setIsAccessibilityElement:", 0);
      objc_msgSend(v5, "setAccessibilityLabel:", v6);
    }

  }
}

@end
