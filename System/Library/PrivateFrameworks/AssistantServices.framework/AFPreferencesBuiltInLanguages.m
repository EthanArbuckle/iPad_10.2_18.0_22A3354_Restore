@implementation AFPreferencesBuiltInLanguages

void ___AFPreferencesBuiltInLanguages_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[40];

  v4[39] = *MEMORY[0x1E0C80C00];
  if (AFIsHorseman_onceToken != -1)
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
  if (AFIsHorseman_isHorseman)
  {
    v4[0] = CFSTR("en-US");
    v4[1] = CFSTR("en-GB");
    v4[2] = CFSTR("en-AU");
    v4[3] = CFSTR("en-CA");
    v4[4] = CFSTR("fr-FR");
    v4[5] = CFSTR("de-DE");
    v4[6] = CFSTR("fr-CA");
    v4[7] = CFSTR("es-US");
    v4[8] = CFSTR("es-MX");
    v4[9] = CFSTR("es-ES");
    v4[10] = CFSTR("zh-CN");
    v4[11] = CFSTR("yue-CN");
    v4[12] = CFSTR("zh-HK");
    v4[13] = CFSTR("ja-JP");
    v4[14] = CFSTR("zh-TW");
    v4[15] = CFSTR("en-IN");
    v4[16] = CFSTR("en-IE");
    v4[17] = CFSTR("en-NZ");
    v4[18] = CFSTR("de-AT");
    v4[19] = CFSTR("it-IT");
    v4[20] = CFSTR("ru-RU");
    v4[21] = CFSTR("nl-NL");
    v4[22] = CFSTR("nl-BE");
    v4[23] = CFSTR("fr-BE");
    v4[24] = CFSTR("fr-CH");
    v4[25] = CFSTR("de-CH");
    v4[26] = CFSTR("it-CH");
    v4[27] = CFSTR("nb-NO");
    v4[28] = CFSTR("sv-SE");
    v4[29] = CFSTR("en-ZA");
    v4[30] = CFSTR("es-CL");
    v4[31] = CFSTR("fi-FI");
    v4[32] = CFSTR("en-SG");
    v4[33] = CFSTR("da-DK");
    v4[34] = CFSTR("he-IL");
    v4[35] = CFSTR("th-TH");
    v4[36] = CFSTR("ar-SA");
    v4[37] = CFSTR("tr-TR");
    v4[38] = CFSTR("ms-MY");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 39);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)_AFPreferencesBuiltInLanguages_sStaticLanguages;
    _AFPreferencesBuiltInLanguages_sStaticLanguages = v0;

  }
  else
  {
    _AFPreferencesBuiltIniOSLanguages();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_AFPreferencesBuiltInLanguages_sStaticLanguages;
    _AFPreferencesBuiltInLanguages_sStaticLanguages = v2;

  }
}

@end
