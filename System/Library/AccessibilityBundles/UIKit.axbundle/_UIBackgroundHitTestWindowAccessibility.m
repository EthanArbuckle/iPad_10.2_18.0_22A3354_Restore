@implementation _UIBackgroundHitTestWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBackgroundHitTestWindow");
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
