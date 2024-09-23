@implementation MKPhotoSmallAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPhotoSmallAttributionView");
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
