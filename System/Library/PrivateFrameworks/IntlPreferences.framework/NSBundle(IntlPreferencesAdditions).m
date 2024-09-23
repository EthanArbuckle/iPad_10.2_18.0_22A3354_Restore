@implementation NSBundle(IntlPreferencesAdditions)

- (id)normalizedLocalizations
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  _BYTE *ISO3Language;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "localizations", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v8, "UTF8String");
        ISO3Language = (_BYTE *)uloc_getISO3Language();
        if (ISO3Language && *ISO3Language)
          objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "removeObject:", CFSTR("base"));
  objc_msgSend(v2, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
