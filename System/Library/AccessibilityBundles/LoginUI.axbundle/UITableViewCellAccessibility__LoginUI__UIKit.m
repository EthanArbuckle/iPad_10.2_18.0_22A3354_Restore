@implementation UITableViewCellAccessibility__LoginUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)didMoveToWindow
{
  void *v3;
  int v4;
  objc_super v5;

  -[UITableViewCellAccessibility__LoginUI__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXLUITableViewCellTextFieldOnlyTag"));

  if (v4)
    -[UITableViewCellAccessibility__LoginUI__UIKit _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellAccessibility__LoginUI__UIKit;
  -[UITableViewCellAccessibility__LoginUI__UIKit didMoveToWindow](&v5, sel_didMoveToWindow);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITableViewCellAccessibility__LoginUI__UIKit;
  -[UITableViewCellAccessibility__LoginUI__UIKit _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[UITableViewCellAccessibility__LoginUI__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXLUITableViewCellTextFieldOnlyTag"));

  if (v4)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v7);

  }
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  void *v3;
  char v4;
  objc_super v6;

  -[UITableViewCellAccessibility__LoginUI__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXLUITableViewCellTextFieldOnlyTag"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCellAccessibility__LoginUI__UIKit;
  return -[UITableViewCellAccessibility__LoginUI__UIKit _accessibilityIgnoreInternalLabels](&v6, sel__accessibilityIgnoreInternalLabels);
}

@end
