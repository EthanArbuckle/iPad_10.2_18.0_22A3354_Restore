@implementation ReviewsContainerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.ReviewsContainerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

@end
