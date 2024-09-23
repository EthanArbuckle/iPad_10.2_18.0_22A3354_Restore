@implementation UITableViewCountViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCountView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return -[UITableViewCountViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible", a2, self) & 1;
}

@end
