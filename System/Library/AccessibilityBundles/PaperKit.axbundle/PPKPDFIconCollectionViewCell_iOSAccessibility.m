@implementation PPKPDFIconCollectionViewCell_iOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PPKPDFIconCollectionViewCell_iOS");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
