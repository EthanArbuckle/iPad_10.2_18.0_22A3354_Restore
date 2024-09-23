@implementation AFPreferencesSupportedDictationLanguages

void __AFPreferencesSupportedDictationLanguages_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  AFPreferencesSupportedLanguages();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", &unk_1E3AAA808);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFPreferencesSupportedDictationLanguages_sSupportedDictationLanguages;
  AFPreferencesSupportedDictationLanguages_sSupportedDictationLanguages = v0;

}

@end
