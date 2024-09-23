@implementation MusicApplicationUIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.JSVerticalStackViewModelViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.NowPlayingLyricsViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.NowPlayingLyricsViewController"), CFSTR("cardHeight"), "d", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MusicCoreUI.SyncedLyricsViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicCoreUI.SyncedLyricsViewController"), CFSTR("scrollView"), "UIScrollView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicCoreUI.SyncedLyricsViewController"), CFSTR("lineViews"), "Array<SyncedLyricsLineView>");

}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  void *v2;
  BOOL v3;

  -[MusicApplicationUIScrollViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_17, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __92__MusicApplicationUIScrollViewAccessibility__accessibilityDrawsFocusRingWhenChildrenFocused__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("MusicApplication.JSVerticalStackViewModelViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[MusicApplicationUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXSyncedLyricsScrollView"));

  if (!v4)
    goto LABEL_16;
  -[MusicApplicationUIScrollViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_198, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_15:

LABEL_16:
    v24.receiver = self;
    v24.super_class = (Class)MusicApplicationUIScrollViewAccessibility;
    -[MusicApplicationUIScrollViewAccessibility _accessibilityScrollStatus](&v24, sel__accessibilityScrollStatus);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    return v22;
  }
  v29 = 0;
  objc_opt_class();
  objc_msgSend(v6, "safeSwiftValueForKey:", CFSTR("scrollView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeSwiftArrayForKey:", CFSTR("lineViews"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (!v10)
    goto LABEL_14;
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v26;
  v14 = INFINITY;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v8, "contentOffset");
      v18 = v17;
      objc_msgSend(v16, "frame");
      v20 = vabdd_f64(v18, v19);
      if (v20 < v14)
      {
        v21 = v16;

        v12 = v21;
        v14 = v20;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  }
  while (v11);
  if (!v12)
  {
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v12, "accessibilityLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __71__MusicApplicationUIScrollViewAccessibility__accessibilityScrollStatus__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("MusicCoreUI.SyncedLyricsViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)_accessibilityScrollHeightDistance
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  objc_super v15;

  -[MusicApplicationUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXSyncedLyricsScrollView"));

  if (v4
    && (-[MusicApplicationUIScrollViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_201, 1), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "_accessibilityViewController"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v5, v6))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MusicApplicationUIScrollViewAccessibility contentOffset](self, "contentOffset");
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");

    objc_msgSend(v7, "safeSwiftCGFloatForKey:", CFSTR("containerHeight"));
    v10 = v9;
    if (v9 <= 0.0)
    {
      objc_msgSend(v7, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v10 = v12;

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MusicApplicationUIScrollViewAccessibility;
    -[MusicApplicationUIScrollViewAccessibility _accessibilityScrollHeightDistance](&v15, sel__accessibilityScrollHeightDistance);
    return v13;
  }
  return v10;
}

uint64_t __79__MusicApplicationUIScrollViewAccessibility__accessibilityScrollHeightDistance__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("MusicCoreUI.SyncedLyricsViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
