@implementation SFDefaultStartPageVisualStyleProvider

- (NSDirectionalEdgeInsets)sectionContentInsetsWithViewLayoutMargins:(NSDirectionalEdgeInsets)result
{
  double v3;
  double v4;

  v3 = 0.0;
  v4 = 10.0;
  result.bottom = v4;
  result.top = v3;
  return result;
}

- (int64_t)numberOfColumnsForSectionItemType:(int64_t)a3 sectionWidth:(double)a4 traitCollection:(id)a5
{
  NSString *v7;
  _BOOL4 IsAccessibilityCategory;
  int v9;
  double v10;
  int v11;
  double v12;
  int64_t result;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;

  objc_msgSend(a5, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  v9 = objc_msgSend(MEMORY[0x1E0D89BE8], "is2024FavoritesEnabled");
  v10 = 1010.0;
  if (!v9)
    v10 = 900.0;
  if (v10 <= a4)
  {
    v15 = (uint64_t)(a4 / 350.0);
    v16 = 4 * v15;
    v14 = 6;
    result = 6;
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E0D89BE8], "is2024FavoritesEnabled");
    v12 = 700.0;
    if (!v11)
      v12 = 900.0;
    if (v12 <= a4)
    {
      if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024FavoritesEnabled"))
        v16 = 8;
      else
        v16 = 6;
      result = 5;
      v14 = 4;
      v15 = 2;
    }
    else if (a4 >= 500.0)
    {
      v14 = 3;
      v15 = 2;
      v16 = 6;
      result = 3;
    }
    else if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
    {
      result = 2;
      if (a4 < 300.0)
        v14 = 1;
      else
        v14 = 2;
      v15 = 1;
      v16 = 4;
    }
    else
    {
      v14 = 2;
      v15 = 1;
      v16 = 4;
      result = 2;
    }
  }
  switch(a3)
  {
    case 2:
      if (v16 - IsAccessibilityCategory <= 1)
        result = 1;
      else
        result = v16 - IsAccessibilityCategory;
      break;
    case 3:
    case 5:
      result = v15;
      break;
    case 4:
      v17 = v14 - IsAccessibilityCategory;
      if (v17 <= 1)
        result = 1;
      else
        result = v17;
      break;
    case 6:
      return result;
    default:
      result = 1;
      break;
  }
  return result;
}

- (double)rowSpacingForSectionItemType:(int64_t)a3 containerSize:(CGSize)a4
{
  double result;

  result = 20.0;
  if ((unint64_t)(a3 - 2) <= 4)
    return dbl_18BAD4CD0[a3 - 2];
  return result;
}

- (double)siteIconSizeForContainerSize:(CGSize)a3
{
  double width;
  double v4;

  width = a3.width;
  if (a3.width > 500.0 && a3.height > 428.0)
    goto LABEL_6;
  if (deviceUsesLargeIcons_onceToken != -1)
    dispatch_once(&deviceUsesLargeIcons_onceToken, &__block_literal_global_82);
  if (deviceUsesLargeIcons_result)
  {
LABEL_6:
    v4 = 76.0;
  }
  else
  {
    v4 = 60.0;
    if (width <= 300.0)
      return v4;
  }
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024FavoritesEnabled"))
    return 72.0;
  return v4;
}

- (double)defaultRowSpacing
{
  return 20.0;
}

- (UIEdgeInsets)collectionViewContentInsetsWithNavigationBarPosition:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 20.0;
  if (a3 == 3)
    v3 = 4.0;
  v4 = 0.0;
  v5 = 20.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

void __55__SFDefaultStartPageVisualStyleProvider_sharedProvider__block_invoke()
{
  SFDefaultStartPageVisualStyleProvider *v0;
  void *v1;

  v0 = objc_alloc_init(SFDefaultStartPageVisualStyleProvider);
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;

}

+ (SFDefaultStartPageVisualStyleProvider)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_3);
  return (SFDefaultStartPageVisualStyleProvider *)(id)sharedProvider_sharedProvider;
}

- (double)sectionHeaderBottomGapForSectionItemType:(int64_t)a3
{
  return 10.0;
}

- (id)interItemSpacingForSectionItemType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v5 = 0;
  if ((unint64_t)a3 <= 6 && ((1 << a3) & 0x58) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 8.0, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)numberOfRowsForSection:(int64_t)a3 traitCollectionIsHorizontalCompact:(BOOL)a4
{
  int64_t result;

  switch(a3)
  {
    case 3:
      if (a4)
        result = 3;
      else
        result = 2;
      break;
    case 4:
      result = 2;
      break;
    case 5:
    case 6:
      result = 3;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

- (UIFont)sectionHeaderLargeTitleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AE8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v4, "fontWithDescriptor:size:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v5;
}

- (id)tintColorForSupplementaryActions
{
  return 0;
}

- (id)backgroundEffectForSupplementaryActions
{
  return 0;
}

@end
