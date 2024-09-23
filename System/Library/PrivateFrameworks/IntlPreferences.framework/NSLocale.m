@implementation NSLocale

uint64_t __68__NSLocale_IntlPreferencesAdditions__supportedCJLanguageIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("zh")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ja"));

  return v4;
}

void __59__NSLocale_IntlPreferencesAdditions__renderableUILanguages__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("RenderableUILanguages"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithContentsOfURL:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)renderableUILanguages___renderableLanguages;
  renderableUILanguages___renderableLanguages = v2;

}

void __63__NSLocale_IntlPreferencesAdditions__renderableLocaleLanguages__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
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
  objc_msgSend(MEMORY[0x1E0C99DC8], "availableLocaleIdentifiers");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6), (_QWORD)v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  v8 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v1, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderableLanguagesFromList:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)renderableLocaleLanguages___renderableLanguages;
  renderableLocaleLanguages___renderableLanguages = v10;

}

uint64_t __66__NSLocale_IntlPreferencesAdditions__renderableLanguagesFromList___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  +[IntlUtility sharedIntlUtility](IntlUtility, "sharedIntlUtility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canRenderLanguage:", v2);

  return v4;
}

void __86__NSLocale_IntlPreferencesAdditions__archivedPreferencesWithHashesForBundleIDs_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_hashesFromAppPreferences:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __59__NSLocale_IntlPreferencesAdditions__selectableScriptCodes__block_invoke()
{
  void *v0;

  v0 = (void *)selectableScriptCodes_selectableScriptCodes;
  selectableScriptCodes_selectableScriptCodes = (uint64_t)&unk_1E706DE58;

}

@end
