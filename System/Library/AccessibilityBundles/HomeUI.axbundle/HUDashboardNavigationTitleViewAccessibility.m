@implementation HUDashboardNavigationTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUDashboardNavigationTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
