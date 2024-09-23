@implementation NSLocale

void __63__NSLocale_IconServicesAdditions___IS_currentLanguageDirection__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _IS_currentLanguageDirection_direction = objc_msgSend(v0, "characterDirectionForLanguage:", v1);

}

@end
