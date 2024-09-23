@implementation AXCLanguageToLocales

void __AXCLanguageToLocales_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_allocWithZone(MEMORY[0x1E0C99D80]);
  AXCLanguageToCanonicalPlistPath();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithContentsOfFile:", v3);
  v2 = (void *)AXCLanguageToLocales_LanguageToLangLocale;
  AXCLanguageToLocales_LanguageToLangLocale = v1;

}

@end
