@implementation AFIsTop13Locale

void __AFIsTop13Locale_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("en-US"), CFSTR("zh-CN"), CFSTR("en-GB"), CFSTR("en-CA"), CFSTR("en-AU"), CFSTR("zh-HK"), CFSTR("ja-JP"), CFSTR("fr-FR"), CFSTR("de-DE"), CFSTR("es-ES"), CFSTR("es-MX"), CFSTR("es-US"), CFSTR("en-IN"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFIsTop13Locale_top13Locales;
  AFIsTop13Locale_top13Locales = v0;

}

@end
