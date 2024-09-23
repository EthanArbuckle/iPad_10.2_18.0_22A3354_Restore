@implementation UITableViewAccessibility__MobileMail__UIKit

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
  objc_msgSend(a3, "validateClass:", CFSTR("MFVIPSendersListTableViewController"));
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char isKindOfClass;
  objc_super v6;

  -[UITableViewAccessibility__MobileMail__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MFVIPSendersListTableViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewAccessibility__MobileMail__UIKit;
  return -[UITableViewAccessibility__MobileMail__UIKit isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

@end
