@implementation UITableViewCellAccessibility__PhotoLibrary__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  void *v2;
  char v3;

  -[UITableViewCellAccessibility__PhotoLibrary__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("CloudCreateCell"));

  return v3;
}

@end
