@implementation AppStore_UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_accessibilityVisibleItemDenominator
{
  void *v3;
  char v4;
  double result;
  objc_super v6;

  -[AppStore_UICollectionViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXArticlePageViewCollectionView"));

  result = 6.0;
  if ((v4 & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)AppStore_UICollectionViewAccessibility;
    -[AppStore_UICollectionViewAccessibility _accessibilityVisibleItemDenominator](&v6, sel__accessibilityVisibleItemDenominator, 6.0);
  }
  return result;
}

@end
