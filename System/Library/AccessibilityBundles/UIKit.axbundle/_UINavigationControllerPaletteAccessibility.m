@implementation _UINavigationControllerPaletteAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UINavigationControllerPalette");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
