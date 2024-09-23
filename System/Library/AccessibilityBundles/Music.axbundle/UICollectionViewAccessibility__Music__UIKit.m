@implementation UICollectionViewAccessibility__Music__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("Music.NowPlayingViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryMainViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.PlaylistEditingViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("collectionViewLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("_accessibilitySupplementaryViewSectionHeaderIdentifiers"), "@", 0);

}

- (BOOL)accessibilityShouldSpeakItemReorderEvents
{
  void *v2;
  BOOL v3;

  -[UICollectionViewAccessibility__Music__UIKit _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAccessibility__Music__UIKit;
  -[UICollectionViewAccessibility__Music__UIKit _accessibilityVisibleContentInset](&v6, sel__accessibilityVisibleContentInset);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)accessibilityScrollUpPage
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewAccessibility__Music__UIKit;
  return -[UICollectionViewAccessibility__Music__UIKit accessibilityScrollUpPage](&v3, sel_accessibilityScrollUpPage);
}

- (BOOL)accessibilityScrollDownPage
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewAccessibility__Music__UIKit;
  return -[UICollectionViewAccessibility__Music__UIKit accessibilityScrollDownPage](&v3, sel_accessibilityScrollDownPage);
}

- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewAccessibility__Music__UIKit;
  -[UICollectionViewAccessibility__Music__UIKit _accessibilitySupplementaryViewSectionHeaderIdentifiers](&v8, sel__accessibilitySupplementaryViewSectionHeaderIdentifiers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917228](CFSTR("Music.JSFlowcaseViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_203);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v2;
  }
  v6 = v5;

  return v6;
}

@end
