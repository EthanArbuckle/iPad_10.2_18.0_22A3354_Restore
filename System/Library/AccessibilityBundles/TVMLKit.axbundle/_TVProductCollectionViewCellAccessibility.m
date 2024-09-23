@implementation _TVProductCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVProductCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsSemanticContext
{
  return 0;
}

@end
