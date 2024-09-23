@implementation InformativeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.InformativeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
