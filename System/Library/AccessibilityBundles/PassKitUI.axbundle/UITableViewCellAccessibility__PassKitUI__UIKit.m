@implementation UITableViewCellAccessibility__PassKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityChildren
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  if ((-[UITableViewCellAccessibility__PassKitUI__UIKit _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", kAXManualEntryCellIdentifier) & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITableViewCellAccessibility__PassKitUI__UIKit;
    -[UITableViewCellAccessibility__PassKitUI__UIKit _accessibilityChildren](&v7, sel__accessibilityChildren);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_7);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v3, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setIsAccessibilityElement:", 0);

    return v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellAccessibility__PassKitUI__UIKit;
    -[UITableViewCellAccessibility__PassKitUI__UIKit _accessibilityChildren](&v8, sel__accessibilityChildren);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
