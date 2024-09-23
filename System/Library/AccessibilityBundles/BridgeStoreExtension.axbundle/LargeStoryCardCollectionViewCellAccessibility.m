@implementation LargeStoryCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.LargeStoryCardCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeStoryCardCollectionViewCellAccessibility;
  return -[LargeStoryCardCollectionViewCellAccessibility isAccessibilityElement](&v3, sel_isAccessibilityElement);
}

@end
