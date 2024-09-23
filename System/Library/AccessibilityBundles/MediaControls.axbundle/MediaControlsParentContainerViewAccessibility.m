@implementation MediaControlsParentContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsParentContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
