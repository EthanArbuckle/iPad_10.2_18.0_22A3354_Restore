@implementation _UIBackdropViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBackdropView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 0;
}

@end
