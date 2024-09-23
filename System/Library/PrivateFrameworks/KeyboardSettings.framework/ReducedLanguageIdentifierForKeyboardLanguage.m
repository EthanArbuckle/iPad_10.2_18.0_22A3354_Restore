@implementation ReducedLanguageIdentifierForKeyboardLanguage

uint64_t ___ReducedLanguageIdentifierForKeyboardLanguage_block_invoke()
{
  void *SupportedLanguages;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ReducedLanguageIdentifierForKeyboardLanguage___languageCounts = (uint64_t)objc_alloc_init(MEMORY[0x24BDD14E0]);
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  SupportedLanguages = (void *)UIKeyboardGetSupportedLanguages();
  result = objc_msgSend(SupportedLanguages, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
  if (result)
  {
    v2 = result;
    v3 = *(_QWORD *)v6;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v6 != v3)
          objc_enumerationMutation(SupportedLanguages);
        objc_msgSend((id)_ReducedLanguageIdentifierForKeyboardLanguage___languageCounts, "addObject:", objc_msgSend(MEMORY[0x24BDBCEA0], "baseLanguageFromLanguage:", *(_QWORD *)(*((_QWORD *)&v5 + 1) + 8 * v4++), (_QWORD)v5));
      }
      while (v2 != v4);
      result = objc_msgSend(SupportedLanguages, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
      v2 = result;
    }
    while (result);
  }
  return result;
}

@end
