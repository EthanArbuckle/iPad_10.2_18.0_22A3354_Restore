@implementation UICollectionViewListCellAccessibility__Music__UIKit

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
  objc_msgSend(v3, "validateClass:", CFSTR("Music.LibraryMainViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.NowPlayingViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.PlaylistEditingViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Music.LibraryMainViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Music.NowPlayingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Music.PlaylistEditingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UICollectionViewListCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCell"), CFSTR("contentView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[UICollectionViewListCellAccessibility__Music__UIKit _axIsListCellAccessibleInMusicApp](self, "_axIsListCellAccessibleInMusicApp"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewListCellAccessibility__Music__UIKit;
  return -[UICollectionViewListCellAccessibility__Music__UIKit isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[UICollectionViewListCellAccessibility__Music__UIKit _axIsListCellAccessibleInMusicApp](self, "_axIsListCellAccessibleInMusicApp"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "accessibilityLabel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "axSafelyAddObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }

    MEMORY[0x23491724C](v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)UICollectionViewListCellAccessibility__Music__UIKit;
    -[UICollectionViewListCellAccessibility__Music__UIKit accessibilityLabel](&v15, sel_accessibilityLabel);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewListCellAccessibility__Music__UIKit;
  v3 = -[UICollectionViewListCellAccessibility__Music__UIKit accessibilityTraits](&v8, sel_accessibilityTraits);
  if (-[UICollectionViewListCellAccessibility__Music__UIKit _axIsListCellAccessibleInMusicApp](self, "_axIsListCellAccessibleInMusicApp"))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 |= *MEMORY[0x24BDF73B0];
    if (objc_msgSend(v4, "isSelected"))
    {
      objc_msgSend(v4, "configurationState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEditing");

      if (v6)
        v3 |= *MEMORY[0x24BDF7400];
      else
        v3 &= ~*MEMORY[0x24BDF7400];
    }

  }
  return v3;
}

- (BOOL)_axIsListCellAccessibleInMusicApp
{
  return -[UICollectionViewListCellAccessibility__Music__UIKit _axIsInViewControllerClass:](self, "_axIsInViewControllerClass:", CFSTR("Music.LibraryMainViewController"))|| -[UICollectionViewListCellAccessibility__Music__UIKit _axIsInViewControllerClass:](self, "_axIsInViewControllerClass:", CFSTR("Music.NowPlayingViewController"))|| -[UICollectionViewListCellAccessibility__Music__UIKit _axIsInViewControllerClass:](self, "_axIsInViewControllerClass:", CFSTR("Music.PlaylistEditingViewController"));
}

- (BOOL)_axIsInViewControllerClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v4 = a3;
  -[UICollectionViewListCellAccessibility__Music__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("_axIsInViewControllerClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    v9 = MEMORY[0x234917228](v4);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __82__UICollectionViewListCellAccessibility__Music__UIKit__axIsInViewControllerClass___block_invoke;
    v13[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
    v13[4] = v9;
    -[UICollectionViewListCellAccessibility__Music__UIKit _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewListCellAccessibility__Music__UIKit _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("_axIsInViewControllerClass"));
    }
    v8 = v10 != 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10 != 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v4);

  }
  return v8;
}

@end
