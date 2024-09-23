@implementation UITableViewAccessibility__ScreenTimeUI__UIKit

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
  objc_msgSend(v3, "validateClass:", CFSTR("STUsageDetailListController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageDetailListController"), CFSTR("datePickerBar"), "@", 0);

}

- (id)_accessibilityHeaderElement
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  objc_super v8;

  -[UITableViewAccessibility__ScreenTimeUI__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491C610](CFSTR("STUsageDetailListController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UITableViewAccessibility__ScreenTimeUI__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("datePickerBar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewAccessibility__ScreenTimeUI__UIKit;
    -[UITableViewAccessibility__ScreenTimeUI__UIKit _accessibilityHeaderElement](&v8, sel__accessibilityHeaderElement);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
