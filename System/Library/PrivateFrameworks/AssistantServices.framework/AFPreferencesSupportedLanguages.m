@implementation AFPreferencesSupportedLanguages

void __AFPreferencesSupportedLanguages_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  _AFPreferencesValueForKeyWithContext(CFSTR("Additional Languages"), CFSTR("com.apple.assistant.backedup"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (_IsArrayOfStrings(v0))
    v1 = v0;
  else
    v1 = 0;
  v2 = v1;

  AFInternalConfigValueForKey(CFSTR("Additional Languages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_IsArrayOfStrings(v3))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (objc_msgSend(v2, "count") || objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_opt_new();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "addObjectsFromArray:", v5);
    if (v2)
      objc_msgSend(v7, "addObjectsFromArray:", v2);
    objc_msgSend(v7, "allObjects");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  if (objc_msgSend(v13, "count"))
  {
    v8 = (void *)objc_opt_new();
    _AFPreferencesBuiltInLanguages();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "addObjectsFromArray:", v9);
    objc_msgSend(v8, "addObjectsFromArray:", v13);
    objc_msgSend(v8, "allObjects");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)AFPreferencesSupportedLanguages_stAllLanguageCodes;
    AFPreferencesSupportedLanguages_stAllLanguageCodes = v10;

  }
  else
  {
    _AFPreferencesBuiltInLanguages();
    v12 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)AFPreferencesSupportedLanguages_stAllLanguageCodes;
    AFPreferencesSupportedLanguages_stAllLanguageCodes = v12;
  }

}

@end
