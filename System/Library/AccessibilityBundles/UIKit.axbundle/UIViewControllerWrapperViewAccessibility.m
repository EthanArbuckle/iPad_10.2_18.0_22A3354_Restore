@implementation UIViewControllerWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIViewControllerWrapperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 0;
}

@end
