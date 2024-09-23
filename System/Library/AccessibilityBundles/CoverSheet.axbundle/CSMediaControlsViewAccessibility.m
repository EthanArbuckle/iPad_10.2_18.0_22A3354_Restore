@implementation CSMediaControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSMediaControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

@end
