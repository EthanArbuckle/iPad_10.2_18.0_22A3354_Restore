@implementation AFIsGoldLocale

void __AFIsGoldLocale_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ar-SA"), CFSTR("de-DE"), CFSTR("en-AU"), CFSTR("en-CA"), CFSTR("en-GB"), CFSTR("en-IN"), CFSTR("en-SG"), CFSTR("en-US"), CFSTR("es-ES"), CFSTR("es-MX"), CFSTR("es-US"), CFSTR("fr-FR"), CFSTR("it-IT"), CFSTR("ja-JP"), CFSTR("ko-KR"), CFSTR("ru-RU"), CFSTR("tr-TR"),
    CFSTR("yue-CN"),
    CFSTR("zh-CN"),
    CFSTR("zh-HK"),
    CFSTR("zh-TW"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFIsGoldLocale_goldLocales;
  AFIsGoldLocale_goldLocales = v0;

}

@end
