@implementation AFShouldRunAsrOnServerForUODLanguage

void __AFShouldRunAsrOnServerForUODLanguage_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("en-US"), CFSTR("en-GB"), CFSTR("en-CA"), CFSTR("en-AU"), CFSTR("zh-CN"), CFSTR("zh-HK"), CFSTR("ja-JP"), CFSTR("fr-FR"), CFSTR("de-DE"), CFSTR("es-ES"), CFSTR("es-MX"), CFSTR("es-US"), CFSTR("en-IN"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)AFShouldRunAsrOnServerForUODLanguage_supportedLanguageCodesForFullUOD;
  AFShouldRunAsrOnServerForUODLanguage_supportedLanguageCodesForFullUOD = v2;

  _AFTop41Locales();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)AFShouldRunAsrOnServerForUODLanguage_supportedLanguageCodesForNL;
  AFShouldRunAsrOnServerForUODLanguage_supportedLanguageCodesForNL = v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)AFShouldRunAsrOnServerForUODLanguage_unsupportedProductTypesForNL;
  AFShouldRunAsrOnServerForUODLanguage_unsupportedProductTypesForNL = v6;

}

@end
