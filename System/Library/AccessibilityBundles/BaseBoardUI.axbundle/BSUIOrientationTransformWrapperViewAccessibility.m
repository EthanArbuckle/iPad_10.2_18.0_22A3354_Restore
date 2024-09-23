@implementation BSUIOrientationTransformWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BSUIOrientationTransformWrapperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  return 0;
}

@end
