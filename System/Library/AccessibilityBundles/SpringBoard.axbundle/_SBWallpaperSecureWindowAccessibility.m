@implementation _SBWallpaperSecureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SBWallpaperSecureWindow");
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
