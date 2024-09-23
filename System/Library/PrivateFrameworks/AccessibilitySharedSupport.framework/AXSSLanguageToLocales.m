@implementation AXSSLanguageToLocales

void __AXSSLanguageToLocales_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_allocWithZone(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("AXLanguageToLocale"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithContentsOfFile:", v1);
  v3 = (void *)AXSSLanguageToLocales_LanguageToLangLocale;
  AXSSLanguageToLocales_LanguageToLangLocale = v2;

}

@end
