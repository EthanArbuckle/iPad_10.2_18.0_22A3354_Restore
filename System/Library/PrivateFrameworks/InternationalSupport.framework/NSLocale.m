@implementation NSLocale

void __60__NSLocale_InternationalSupportExtensions___deviceLanguages__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v0, "localizations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(v1, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(v1, "array");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_deviceLanguages___deviceLanguages;
  _deviceLanguages___deviceLanguages = v8;

}

void __63__NSLocale_InternationalSupportExtensions__baseSystemLanguages__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "baseLanguageFromLanguage:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "array");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)baseSystemLanguages___baseSystemLanguages;
  baseSystemLanguages___baseSystemLanguages = v9;

}

void __60__NSLocale_InternationalSupportExtensions__supportedRegions__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA16AA80);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minusSet:", v3);

  v4 = (void *)supportedRegions___supportedRegions;
  supportedRegions___supportedRegions = (uint64_t)v2;

}

void __72__NSLocale_InternationalSupportExtensions__relatedLanguagesForLanguage___block_invoke()
{
  void *v0;

  v0 = (void *)relatedLanguagesForLanguage____relatedLanguages;
  relatedLanguagesForLanguage____relatedLanguages = (uint64_t)&unk_1EA168F58;

}

void __68__NSLocale_InternationalSupportExtensions__availableSpokenLanguages__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "availableLocaleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8), (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "languageIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "spokenLanguagesForLanguage:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)availableSpokenLanguages___availableSpokenLanguages;
  availableSpokenLanguages___availableSpokenLanguages = v12;

}

id __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  if (a4 == 2)
  {
    v8 = CFSTR("popular.");
  }
  else
  {
    if (a4 != 1)
    {
LABEL_7:
      v11 = 0;
      goto LABEL_8;
    }
    v8 = CFSTR("minimum.");
  }
  -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_7;
  v10 = (void *)v9;
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v11;
}

uint64_t __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

@end
