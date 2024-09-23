@implementation UITableViewAccessibility__Social__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v12.receiver = self;
  v12.super_class = (Class)UITableViewAccessibility__Social__UIKit;
  -[UITableViewAccessibility__Social__UIKit _accessibilitySupplementaryFooterViews](&v12, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableViewAccessibility__Social__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("SLFacebookLoginInfoTableView"));

  if (v7)
  {
    -[UITableViewAccessibility__Social__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __81__UITableViewAccessibility__Social__UIKit__accessibilitySupplementaryFooterViews__block_invoke;
    v10[3] = &unk_24FF2A518;
    v11 = v5;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
  return v5;
}

@end
