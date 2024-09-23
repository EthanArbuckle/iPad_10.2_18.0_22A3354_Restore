@implementation UITableViewAccessibility__Preferences__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("UITableViewCellAccessibilityElement"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCellAccessibilityElement"), CFSTR("realTableViewCell"), "@", 0);

}

- (BOOL)_axIsDynamicTypeTable
{
  void *v2;
  char v3;

  -[UITableViewAccessibility__Preferences__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("DynamicTypeTable"));

  return v3;
}

- (int64_t)accessibilityElementCount
{
  objc_super v4;

  if (-[UITableViewAccessibility__Preferences__UIKit _axIsDynamicTypeTable](self, "_axIsDynamicTypeTable"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewAccessibility__Preferences__UIKit;
  return -[UITableViewAccessibility__Preferences__UIKit accessibilityElementCount](&v4, sel_accessibilityElementCount);
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[UITableViewAccessibility__Preferences__UIKit _axIsDynamicTypeTable](self, "_axIsDynamicTypeTable"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewAccessibility__Preferences__UIKit;
  return -[UITableViewAccessibility__Preferences__UIKit isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITableViewAccessibility__Preferences__UIKit;
  -[UITableViewAccessibility__Preferences__UIKit _accessibilityHitTest:withEvent:](&v8, sel__accessibilityHitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITableViewAccessibility__Preferences__UIKit _axIsDynamicTypeTable](self, "_axIsDynamicTypeTable"))
  {
    NSClassFromString(CFSTR("UITableViewCellAccessibilityElement"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "safeValueForKey:", CFSTR("realTableViewCell"));
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
  }
  return v5;
}

- (id)_accessibilityFooterElement
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[UITableViewAccessibility__Preferences__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("KeychainSynchTable"));

  if (!v4)
    goto LABEL_4;
  -[UITableViewAccessibility__Preferences__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("Footer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "_accessibilityViewIsVisible") & 1) == 0)
  {

LABEL_4:
    v7.receiver = self;
    v7.super_class = (Class)UITableViewAccessibility__Preferences__UIKit;
    -[UITableViewAccessibility__Preferences__UIKit _accessibilityFooterElement](&v7, sel__accessibilityFooterElement);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
