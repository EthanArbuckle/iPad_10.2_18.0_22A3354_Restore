@implementation _SFBrowserNavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFBrowserNavigationBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

@end
