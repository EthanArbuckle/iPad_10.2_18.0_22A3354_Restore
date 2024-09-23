@implementation _SFAccountManagerAppearanceValues

+ (UIColor)defaultMonogramBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (id)titleFontForNarrowCell
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 17.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledFontForFont:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)subtitleFontForNarrowCellWithText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "_excessiveLineHeightCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5);

  v7 = *MEMORY[0x1E0DC4A88];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 15.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scaledFontForFont:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

+ (id)titleFontForLargerCell
{
  return (id)objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)subtitleFontForLargerCell
{
  return (id)objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

+ (id)titleFontForStackViewLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 32770);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v4, "fontWithDescriptor:size:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)subtitleFontForStackViewLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v4, "fontWithDescriptor:size:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)preferencesTableViewStyle
{
  id v2;
  void *v3;
  int64_t v4;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (PSShouldInsetListView())
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

+ (UIColor)buttonCellTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

+ (CGRect)chicletSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 32.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 32.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (double)chicletCornerRadius
{
  return 6.0;
}

+ (NSDirectionalEdgeInsets)edgeInsetsForTopLevelCells
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 8.0;
  v3 = 0.0;
  v4 = 8.0;
  v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (id)_excessiveLineHeightCharacterSet
{
  if (_excessiveLineHeightCharacterSet_onceToken != -1)
    dispatch_once(&_excessiveLineHeightCharacterSet_onceToken, &__block_literal_global_10);
  return (id)_excessiveLineHeightCharacterSet_excessiveLineHeightCharacterSet;
}

+ (CGSize)preferredFormSheetContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

@end
