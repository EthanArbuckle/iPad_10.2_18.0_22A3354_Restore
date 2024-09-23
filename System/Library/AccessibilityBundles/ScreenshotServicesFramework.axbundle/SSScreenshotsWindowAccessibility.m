@implementation SSScreenshotsWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SSScreenshotsWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityCanBeConsideredAsMainWindow
{
  return 0;
}

@end
