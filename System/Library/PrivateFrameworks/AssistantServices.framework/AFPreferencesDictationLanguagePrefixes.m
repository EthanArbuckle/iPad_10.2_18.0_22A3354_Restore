@implementation AFPreferencesDictationLanguagePrefixes

void ___AFPreferencesDictationLanguagePrefixes_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = (void *)_AFPreferencesDictationLanguagePrefixes_sLanguagePrefixes;
  AFLanguagePrefixForLanguageCode(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void ___AFPreferencesDictationLanguagePrefixes_block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)_AFPreferencesDictationLanguagePrefixes_sLanguagePrefixes;
  _AFPreferencesDictationLanguagePrefixes_sLanguagePrefixes = (uint64_t)v0;

  AFPreferencesSupportedDictationLanguages();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_1477);

}

@end
