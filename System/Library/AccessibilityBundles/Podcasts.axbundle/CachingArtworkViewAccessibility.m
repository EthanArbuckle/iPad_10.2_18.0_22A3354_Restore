@implementation CachingArtworkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.CachingArtworkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ShelfKitCollectionViews.ArtworkWithPlaybackStatusView"));
  objc_msgSend(v3, "validateClass:", CFSTR("ShelfKitCollectionViews.EpisodeHeaderCollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("ShelfKitCollectionViews.ChevronButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ShelfKitCollectionViews.CachingArtworkView"), CFSTR("UIView"));

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[CachingArtworkViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v5 = 1;
  if (v2)
  {
    objc_msgSend(v2, "_accessibilityFindSubviewDescendant:", &__block_literal_global_190);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = 0;
  }

  return v5;
}

uint64_t __57__CachingArtworkViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234919BBC](CFSTR("ShelfKitCollectionViews.EpisodeHeaderCollectionViewCell"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__CachingArtworkViewAccessibility_isAccessibilityElement__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234919BBC](CFSTR("ShelfKitCollectionViews.ArtworkWithPlaybackStatusView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CachingArtworkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v2, "_accessibilityFindSubviewDescendant:", &__block_literal_global_194);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {

LABEL_5:
    accessibilityLocalizedString(CFSTR("artwork"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("artwork.title.view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

uint64_t __53__CachingArtworkViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234919BBC](CFSTR("ShelfKitCollectionViews.ChevronButton"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
