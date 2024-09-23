@implementation CUICatalog

void __60__CUICatalog_IconServicesAdditions___IS_coreGlyphsBundleURL__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/CoreGlyphs.bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_IS_coreGlyphsBundleURL_url;
  _IS_coreGlyphsBundleURL_url = v0;

}

void *__55__CUICatalog_IconServicesAdditions__idiomsForPlatform___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 > 7)
  {
    switch(a2)
    {
      case 8:
        return &unk_1E58165C8;
      case 16:
        return &unk_1E58165E0;
      case 32:
        return &unk_1E58165F8;
    }
    return (void *)MEMORY[0x1E0C9AA60];
  }
  if ((unint64_t)(a2 - 1) < 2)
    return &unk_1E5816580;
  if (a2 != 4)
    return (void *)MEMORY[0x1E0C9AA60];
  if (objc_msgSend(*(id *)(a1 + 32), "nativeIdiom", v2, v3) == 1)
    return &unk_1E5816598;
  else
    return &unk_1E58165B0;
}

@end
