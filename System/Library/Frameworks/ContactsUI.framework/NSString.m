@implementation NSString

void __49__NSString_CNUI__cnui_shouldTransliterateToLatin__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int Script;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "collation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "rangeOfCharacterFromSet:", v5) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "cnui_firstUTF32Character");
          Script = uscript_getScript();
          objc_msgSend(v0, "addIndex:", Script);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v13 = (void *)cnui_shouldTransliterateToLatin___supportedScripts;
  cnui_shouldTransliterateToLatin___supportedScripts = (uint64_t)v0;

}

void __59__NSString_CNUI__cnui_stringByTransliteratingToKanaAsName___block_invoke(uint64_t a1)
{
  const __CFLocale *v2;
  CFRange v3;

  v2 = CFLocaleCreate(0, CFSTR("ja"));
  v3.length = CFStringGetLength(*(CFStringRef *)(a1 + 32));
  v3.location = 0;
  cnui_stringByTransliteratingToKanaAsName____japaneseTokenizer = (uint64_t)CFStringTokenizerCreate(0, 0, v3, 0, v2);
  CFRelease(v2);
}

@end
