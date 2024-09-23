@implementation SUIKSearchResultCollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUIKSearchResultCollectionViewListCell");
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
