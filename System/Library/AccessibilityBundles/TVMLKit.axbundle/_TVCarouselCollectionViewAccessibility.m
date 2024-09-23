@implementation _TVCarouselCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVCarouselCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityRepresentsInfiniteCollection
{
  return 1;
}

@end
