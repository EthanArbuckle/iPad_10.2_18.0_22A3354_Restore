@implementation UITableViewCellAccessibility

uint64_t __72__UITableViewCellAccessibility__PassKitUI__UIKit__accessibilityChildren__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  NSClassFromString(CFSTR("UITableTextAccessibilityElement"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a4 = 1;
  return isKindOfClass & 1;
}

@end
