@implementation UIViewAccessibility__MusicApplication__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.LibraryRecommendationBannerViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LibraryRecommendationBannerViewController"), CFSTR("accessibilityCloseButton"), "@", 0);

}

- (id)_axViewContainsSwitch
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[UIViewAccessibility__MusicApplication__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXPublicPlaylistSwitchContainerView"));

  if (!v4)
    return 0;
  -[UIViewAccessibility__MusicApplication__UIKit subviews](self, "subviews");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        MEMORY[0x234917594](CFSTR("UISwitch"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  objc_super v6;

  -[UIViewAccessibility__MusicApplication__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXPublicPlaylistSwitchContainerView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__MusicApplication__UIKit;
  return -[UIViewAccessibility__MusicApplication__UIKit isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[UIViewAccessibility__MusicApplication__UIKit _axViewContainsSwitch](self, "_axViewContainsSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIViewAccessibility__MusicApplication__UIKit _axViewContainsSwitch](self, "_axViewContainsSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewAccessibility__MusicApplication__UIKit;
    -[UIViewAccessibility__MusicApplication__UIKit accessibilityValue](&v7, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  -[UIViewAccessibility__MusicApplication__UIKit _axViewContainsSwitch](self, "_axViewContainsSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIViewAccessibility__MusicApplication__UIKit _axViewContainsSwitch](self, "_axViewContainsSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityActivationPoint");
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIViewAccessibility__MusicApplication__UIKit;
    -[UIViewAccessibility__MusicApplication__UIKit accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  -[UIViewAccessibility__MusicApplication__UIKit _axViewContainsSwitch](self, "_axViewContainsSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIViewAccessibility__MusicApplication__UIKit _axViewContainsSwitch](self, "_axViewContainsSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "accessibilityTraits");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewAccessibility__MusicApplication__UIKit;
    return -[UIViewAccessibility__MusicApplication__UIKit accessibilityTraits](&v7, sel_accessibilityTraits);
  }
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewAccessibility__MusicApplication__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AXRecommendationBannerView"));

  if (v5)
  {
    -[UIViewAccessibility__MusicApplication__UIKit _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilityViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "safeValueForKey:", CFSTR("accessibilityCloseButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityMusicLocalizedString(CFSTR("close.recommendation.button"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v9);

    if (v8)
      objc_msgSend(v3, "axSafelyAddObject:", v8);

  }
  return v3;
}

@end
