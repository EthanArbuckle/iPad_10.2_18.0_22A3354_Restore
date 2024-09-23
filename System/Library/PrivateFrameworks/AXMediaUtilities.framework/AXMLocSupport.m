@implementation AXMLocSupport

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_15);
  return (id)sharedInstance__Shared_0;
}

void __31__AXMLocSupport_sharedInstance__block_invoke()
{
  AXMLocSupport *v0;
  void *v1;

  v0 = objc_alloc_init(AXMLocSupport);
  v1 = (void *)sharedInstance__Shared_0;
  sharedInstance__Shared_0 = (uint64_t)v0;

}

- (NSLocale)en_USLocale
{
  NSLocale *en_USLocale;
  NSLocale *v4;
  NSLocale *v5;

  en_USLocale = self->_en_USLocale;
  if (!en_USLocale)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v4 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    v5 = self->_en_USLocale;
    self->_en_USLocale = v4;

    en_USLocale = self->_en_USLocale;
  }
  return en_USLocale;
}

- (id)localeForLanguageCode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)baseLanguageForLocale:(id)a3
{
  return (id)objc_msgSend(a3, "languageCode");
}

- (BOOL)localeBaseLanguageIsEnglish:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("en"));

  return v4;
}

- (id)localeMatchingBaseLanguageOfLocale:(id)a3 fromLocales:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v5, "languageCode", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "languageCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)setEn_USLocale:(id)a3
{
  objc_storeStrong((id *)&self->_en_USLocale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_en_USLocale, 0);
}

@end
