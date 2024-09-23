@implementation SBHStyleTintButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHStyleTintButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("home.screen.open.wallpaper.color.picker"));
}

@end
