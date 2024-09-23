@implementation UICollectionViewListCellAccessibility__MusicUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionViewListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.ArtistListViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.SidebarMenuViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.ArtistListViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.SidebarMenuViewController"), CFSTR("UIViewController"));

}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[UICollectionViewListCellAccessibility__MusicUI__UIKit _axIsListCellAccessibleInMusicApp](self, "_axIsListCellAccessibleInMusicApp"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewListCellAccessibility__MusicUI__UIKit;
  return -[UICollectionViewListCellAccessibility__MusicUI__UIKit isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (-[UICollectionViewListCellAccessibility__MusicUI__UIKit _axIsListCellAccessibleInMusicApp](self, "_axIsListCellAccessibleInMusicApp")&& (-[UICollectionViewListCellAccessibility__MusicUI__UIKit _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class()), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UICollectionViewListCellAccessibility__MusicUI__UIKit;
    -[UICollectionViewListCellAccessibility__MusicUI__UIKit accessibilityLabel](&v7, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewListCellAccessibility__MusicUI__UIKit;
  v3 = -[UICollectionViewListCellAccessibility__MusicUI__UIKit accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[UICollectionViewListCellAccessibility__MusicUI__UIKit _axIsListCellAccessibleInMusicApp](self, "_axIsListCellAccessibleInMusicApp");
  v5 = *MEMORY[0x24BDF73B0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (BOOL)_axIsListCellAccessibleInMusicApp
{
  return -[UICollectionViewListCellAccessibility__MusicUI__UIKit _axIsInViewControllerClass:](self, "_axIsInViewControllerClass:", CFSTR("MusicApplication.ArtistListViewController"))|| -[UICollectionViewListCellAccessibility__MusicUI__UIKit _axIsInViewControllerClass:](self, "_axIsInViewControllerClass:", CFSTR("MusicApplication.SidebarMenuViewController"));
}

- (BOOL)_axIsInViewControllerClass:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__UICollectionViewListCellAccessibility__MusicUI__UIKit__axIsInViewControllerClass___block_invoke;
  v8[3] = &unk_2502C9120;
  v9 = v4;
  v5 = v4;
  -[UICollectionViewListCellAccessibility__MusicUI__UIKit _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v6 != 0;

  return (char)self;
}

@end
