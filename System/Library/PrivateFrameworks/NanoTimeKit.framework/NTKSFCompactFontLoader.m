@implementation NTKSFCompactFontLoader

+ (id)sfCompactNumericFontDescriptor
{
  if (sfCompactNumericFontDescriptor_onceToken != -1)
    dispatch_once(&sfCompactNumericFontDescriptor_onceToken, &__block_literal_global_19);
  return (id)sfCompactNumericFontDescriptor_descriptor;
}

void __56__NTKSFCompactFontLoader_sfCompactNumericFontDescriptor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NTKSFCompactFontLoader _loadFontDescriptorForFontWithName:](NTKSFCompactFontLoader, "_loadFontDescriptorForFontWithName:", CFSTR("SFCompactNumeric"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sfCompactNumericFontDescriptor_descriptor;
  sfCompactNumericFontDescriptor_descriptor = v0;

}

+ (id)sfCompactNumericSoftFontDescriptor
{
  if (sfCompactNumericSoftFontDescriptor_onceToken != -1)
    dispatch_once(&sfCompactNumericSoftFontDescriptor_onceToken, &__block_literal_global_22);
  return (id)sfCompactNumericSoftFontDescriptor_descriptor;
}

void __60__NTKSFCompactFontLoader_sfCompactNumericSoftFontDescriptor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NTKSFCompactFontLoader _loadFontDescriptorForFontWithName:](NTKSFCompactFontLoader, "_loadFontDescriptorForFontWithName:", CFSTR("SFCompactSoft"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sfCompactNumericSoftFontDescriptor_descriptor;
  sfCompactNumericSoftFontDescriptor_descriptor = v0;

}

+ (id)sfCompactNumericRoundedFontDescriptor
{
  if (sfCompactNumericRoundedFontDescriptor_onceToken != -1)
    dispatch_once(&sfCompactNumericRoundedFontDescriptor_onceToken, &__block_literal_global_25_1);
  return (id)sfCompactNumericRoundedFontDescriptor_descriptor;
}

void __63__NTKSFCompactFontLoader_sfCompactNumericRoundedFontDescriptor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NTKSFCompactFontLoader _loadFontDescriptorForFontWithName:](NTKSFCompactFontLoader, "_loadFontDescriptorForFontWithName:", CFSTR("SFCompactRoundedNumeric"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sfCompactNumericRoundedFontDescriptor_descriptor;
  sfCompactNumericRoundedFontDescriptor_descriptor = v0;

}

+ (id)_loadFontDescriptorForFontWithName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFURL *v7;
  const __CFData *v8;
  void *FontDescriptorFromData;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("ttf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    CTFontManagerRegisterFontsForURL(v7, kCTFontManagerScopeProcess, 0);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v7);
    v8 = (const __CFData *)(id)objc_claimAutoreleasedReturnValue();
    FontDescriptorFromData = CTFontManagerCreateFontDescriptorFromData(v8);
    CFRelease(v8);
    CFRelease(v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "fontDescriptorWithName:size:", CFSTR("SF Compact"), 12.0);
    FontDescriptorFromData = (void *)objc_claimAutoreleasedReturnValue();
  }

  return FontDescriptorFromData;
}

@end
