@implementation SBFWallpaperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFWallpaperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end
