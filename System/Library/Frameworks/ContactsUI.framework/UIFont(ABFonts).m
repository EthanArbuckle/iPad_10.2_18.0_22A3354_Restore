@implementation UIFont(ABFonts)

+ (BOOL)ab_preferredContentSizeCategoryIsAccessibilityCategory
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0DC48D8]) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0DC48D0]) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0DC48C8]) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0DC48C0]) & 1) != 0
    || objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0DC48B8]);

  return v1;
}

+ (id)ab_preferredFontForTextStyle:()ABFonts
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "_shouldUseDefaultFont"))
    objc_msgSend(a1, "defaultFontForTextStyle:", v4);
  else
    objc_msgSend(a1, "preferredFontForTextStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)_shouldUseDefaultFont
{
  return _ab_ignoreUserFontSize;
}

- (id)ab_boldFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "pointSize");
  objc_msgSend(v4, "fontWithDescriptor:size:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ab_italicFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "pointSize");
  objc_msgSend(v4, "fontWithDescriptor:size:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)ab_setIgnoreUserFontSize:()ABFonts
{
  _ab_ignoreUserFontSize = a3;
}

+ (id)ab_preferredRowFontForTextStyle:()ABFonts
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "_shouldUseDefaultFont"))
  {
    objc_msgSend(a1, "defaultFontForTextStyle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v4, 0, 2);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v6;
  }

  return v5;
}

+ (id)ab_preferredContentSizeCategoryName
{
  if (objc_msgSend(a1, "_shouldUseDefaultFont"))
    return (id)*MEMORY[0x1E0DC4918];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
