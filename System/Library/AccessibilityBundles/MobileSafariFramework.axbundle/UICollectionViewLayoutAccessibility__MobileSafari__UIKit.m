@implementation UICollectionViewLayoutAccessibility__MobileSafari__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionViewLayout");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySortCollectionViewLogically
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UICollectionViewLayoutAccessibility__MobileSafari__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

@end
