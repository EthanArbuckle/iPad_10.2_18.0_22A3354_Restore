@implementation AFPreferenceAdditionalGoodFitSystemLocales

void ___AFPreferenceAdditionalGoodFitSystemLocales_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", &unk_1E3AAA820);
  _AFPreferencesAlternativeLocaleLanguages();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v2);

  objc_msgSend(&unk_1E3AA9AF8, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v3);

  objc_msgSend(v0, "removeObject:", CFSTR("hi-IN"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_msgSend(v0, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v0, "copy");
  v11 = (void *)_AFPreferenceAdditionalGoodFitSystemLocales_sSpecialCases;
  _AFPreferenceAdditionalGoodFitSystemLocales_sSpecialCases = v10;

}

@end
