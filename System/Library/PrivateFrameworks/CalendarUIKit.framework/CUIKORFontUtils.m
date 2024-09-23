@implementation CUIKORFontUtils

+ (id)defaultOccurrencePrimaryTextFontForSizeClass:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "_primaryTextFontCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "cuik_preferredTightLeadingBoldFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd.%f"), a3, *(_QWORD *)&v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    CUIKRoundToScreenScale(v8);
    objc_msgSend(v5, "fontWithSize:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, v9);
  }

  return v10;
}

+ (id)_primaryTextFontCache
{
  if (_primaryTextFontCache_onceToken != -1)
    dispatch_once(&_primaryTextFontCache_onceToken, &__block_literal_global_37);
  return (id)_primaryTextFontCache_cache;
}

void __40__CUIKORFontUtils__primaryTextFontCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_primaryTextFontCache_cache;
  _primaryTextFontCache_cache = (uint64_t)v0;

}

+ (UIFont)defaultOccurrenceSecondaryTextFont
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "cuik_preferredTightLeadingFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  CUIKRoundToScreenScale(v5);
  objc_msgSend(v2, "fontWithSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v6;
}

+ (id)defaultOccurrenceSmallPrimaryTextFontForSizeClass:(int64_t)a3
{
  double v3;
  id *v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  if (a3 == 2)
    v3 = 13.0;
  else
    v3 = 11.0;
  v4 = (id *)MEMORY[0x1E0DC4AB8];
  if (a3 != 2)
    v4 = (id *)MEMORY[0x1E0DC4AA0];
  v5 = *v4;
  v6 = v3 / v3;
  objc_msgSend(MEMORY[0x1E0DC1350], "cuik_preferredTightLeadingBoldFontForTextStyle:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pointSize");
  v10 = v9;

  CUIKRoundToScreenScale(v6 * v10);
  objc_msgSend(v7, "fontWithSize:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (double)attributedStringMinimumLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  double v4;
  double v5;
  double result;

  if (a3)
    v4 = 8.0;
  else
    v4 = 9.0;
  objc_msgSend(a1, "_minimumPrimaryFontLineHeightUsingSmallText:sizeClass:");
  result = CUIKCeilToScreenScale(v5);
  if (v4 >= result)
    return v4;
  return result;
}

+ (double)minimumNaturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  _BOOL8 v5;
  double v7;
  double v8;
  double result;

  v5 = a3;
  objc_msgSend(a1, "_minimumPrimaryFontLineHeightUsingSmallText:sizeClass:");
  v8 = v7;
  objc_msgSend(a1, "attributedStringMinimumLineHeightUsingSmallText:sizeClass:", v5, a4);
  if (v8 >= result)
    return v8;
  return result;
}

+ (double)_minimumPrimaryFontLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v15;

  v9 = a3;
  CUIKMultiwindowAssert(a4 != 0, CFSTR("Unspecified size class"), a3, a4, v4, v5, v6, v7, v15);
  +[CUIKSemiConstantCache sharedInstance](CUIKSemiConstantCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (a4 == 1)
      objc_msgSend(v10, "dayOccurrenceMinimumCachedLineHeightSmallCompact");
    else
      objc_msgSend(v10, "dayOccurrenceMinimumCachedLineHeightSmallRegular");
  }
  else if (a4 == 1)
  {
    objc_msgSend(v10, "dayOccurrenceMinimumCachedLineHeightCompact");
  }
  else
  {
    objc_msgSend(v10, "dayOccurrenceMinimumCachedLineHeightRegular");
  }
  v13 = v12;

  return v13;
}

@end
