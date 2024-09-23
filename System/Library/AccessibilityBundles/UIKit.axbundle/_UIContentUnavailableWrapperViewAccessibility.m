@implementation _UIContentUnavailableWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIContentUnavailableWrapperView");
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
