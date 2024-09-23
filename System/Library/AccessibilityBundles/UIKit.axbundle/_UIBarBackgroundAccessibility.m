@implementation _UIBarBackgroundAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBarBackground");
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
