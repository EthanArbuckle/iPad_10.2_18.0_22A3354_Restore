@implementation SBIsolatedSceneOrientationFollowingWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIsolatedSceneOrientationFollowingWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowVisible
{
  return 0;
}

@end
