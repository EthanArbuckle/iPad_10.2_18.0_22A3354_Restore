@implementation PUFeedCollectionViewLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUFeedCollectionViewLayout");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySortCollectionViewLogically
{
  return 0;
}

@end
