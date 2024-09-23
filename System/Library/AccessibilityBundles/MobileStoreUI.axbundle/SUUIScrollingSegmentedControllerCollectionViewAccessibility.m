@implementation SUUIScrollingSegmentedControllerCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIScrollingSegmentedControllerCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return 0;
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  return 1;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

@end
