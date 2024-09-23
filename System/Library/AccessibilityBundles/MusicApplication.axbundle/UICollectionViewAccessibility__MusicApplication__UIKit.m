@implementation UICollectionViewAccessibility__MusicApplication__UIKit

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
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.ShelfCollectionViewLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.NowPlayingViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.PlaylistDetailSongsViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.SocialProfilesShelfCollectionViewLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.ShelfCollectionViewLayout"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("collectionViewLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.JSShelfViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("_accessibilitySupplementaryViewSectionHeaderIdentifiers"), "@", 0);

}

- (BOOL)accessibilityShouldSpeakItemReorderEvents
{
  void *v2;
  BOOL v3;

  -[UICollectionViewAccessibility__MusicApplication__UIKit _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[UICollectionViewAccessibility__MusicApplication__UIKit _accessibilityIsShelfCollectionView](self, "_accessibilityIsShelfCollectionView"))
  {
    v3 = *MEMORY[0x24BDF7718];
    v4 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v5 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v6 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UICollectionViewAccessibility__MusicApplication__UIKit;
    -[UICollectionViewAccessibility__MusicApplication__UIKit _accessibilityVisibleContentInset](&v7, sel__accessibilityVisibleContentInset);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)accessibilityScrollUpPage
{
  objc_super v4;

  if (-[UICollectionViewAccessibility__MusicApplication__UIKit _accessibilityIsShelfCollectionView](self, "_accessibilityIsShelfCollectionView"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewAccessibility__MusicApplication__UIKit;
  return -[UICollectionViewAccessibility__MusicApplication__UIKit accessibilityScrollUpPage](&v4, sel_accessibilityScrollUpPage);
}

- (BOOL)accessibilityScrollDownPage
{
  objc_super v4;

  if (-[UICollectionViewAccessibility__MusicApplication__UIKit _accessibilityIsShelfCollectionView](self, "_accessibilityIsShelfCollectionView"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewAccessibility__MusicApplication__UIKit;
  return -[UICollectionViewAccessibility__MusicApplication__UIKit accessibilityScrollDownPage](&v4, sel_accessibilityScrollDownPage);
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
  v8.super_class = (Class)UICollectionViewAccessibility__MusicApplication__UIKit;
  -[UICollectionViewAccessibility__MusicApplication__UIKit _accessibilitySupplementaryViewSectionHeaderIdentifiers](&v8, sel__accessibilitySupplementaryViewSectionHeaderIdentifiers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("MusicApplication.JSShelfViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x234917594](CFSTR("MusicApplication.JSFlowcaseViewController")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_207);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v2;
  }
  v6 = v5;

  return v6;
}

- (BOOL)_accessibilityIsShelfCollectionView
{
  void *v2;
  char isKindOfClass;

  -[UICollectionViewAccessibility__MusicApplication__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionViewLayout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("MusicApplication.SocialProfilesShelfCollectionViewLayout"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x234917594](CFSTR("MusicApplication.ShelfCollectionViewLayout"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end
