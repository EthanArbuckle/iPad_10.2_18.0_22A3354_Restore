@implementation NSString(CNUI)

- (uint64_t)cnui_firstUTF32Character
{
  uint64_t result;
  int v3;
  int v4;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    if (result != 1
      && (v3 = objc_msgSend(a1, "characterAtIndex:", 0),
          v4 = objc_msgSend(a1, "characterAtIndex:", 1),
          (v3 & 0xFC00) == 0xD800)
      && (v4 & 0xFC00) == 0xDC00)
    {
      return (v4 + (v3 << 10) - 56613888);
    }
    else
    {
      return objc_msgSend(a1, "characterAtIndex:", 0);
    }
  }
  return result;
}

- (id)cnui_stringByTransliteratingToKanaAsName:()CNUI
{
  __CFString *v5;
  __CFStringTokenizer *v6;
  CFOptionFlags v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  _QWORD block[5];
  CFRange v13;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__NSString_CNUI__cnui_stringByTransliteratingToKanaAsName___block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = a1;
  if (cnui_stringByTransliteratingToKanaAsName____onceToken != -1)
    dispatch_once(&cnui_stringByTransliteratingToKanaAsName____onceToken, block);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFStringTokenizer *)cnui_stringByTransliteratingToKanaAsName____japaneseTokenizer;
  v13.length = -[__CFString length](a1, "length");
  v13.location = 0;
  CFStringTokenizerSetString(v6, a1, v13);
  if (a3)
    v7 = 0x1000000;
  else
    v7 = 0x400000;
  while (CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)cnui_stringByTransliteratingToKanaAsName____japaneseTokenizer))
  {
    v8 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute((CFStringTokenizerRef)cnui_stringByTransliteratingToKanaAsName____japaneseTokenizer, v7);
    if (v8)
    {
      v9 = v8;
      if (CFStringGetLength(v8) >= 1)
        CFStringAppend(v5, v9);
      CFRelease(v9);
    }
  }
  -[__CFString stringByApplyingTransform:reverse:](v5, "stringByApplyingTransform:reverse:", CFSTR("Hiragana-Katakana"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)cnui_shouldUseJapaneseTransliteration
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v12;
    v4 = *MEMORY[0x1E0C997E8];
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v12 != v3)
          objc_enumerationMutation(v0);
        objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "isEqualToString:", CFSTR("ja")))
        {

          v9 = 1;
          goto LABEL_13;
        }
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("zh"));

        if ((v8 & 1) != 0)
          goto LABEL_11;
      }
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v2)
        continue;
      break;
    }
  }
  else
  {
LABEL_11:
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (uint64_t)cnui_shouldUseZhuyinTransliteration
{
  void *v0;
  void *v1;
  char v2;
  char v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  UIKeyboardGetCurrentInputMode();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x18D776E34]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("Zhuyin"));

  if ((v2 & 1) != 0)
  {
    v3 = 1;
    return v3 & 1;
  }
  UIKeyboardGetActiveInputModes();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_17;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v4);
      v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
      MEMORY[0x18D776E34](v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Zhuyin"), (_QWORD)v17);

      if ((v13 & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        MEMORY[0x18D776E34](v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Pinyin"));

        v7 |= v15;
        if ((v8 & 1) == 0)
          continue;
      }
      if ((v7 & 1) != 0)
      {
        v7 = 1;
        v8 = 1;
        goto LABEL_17;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
      continue;
    break;
  }
LABEL_17:

  v3 = v8 & (v7 ^ 1);
  return v3 & 1;
}

- (uint64_t)cnui_shouldTransliterateToLatin
{
  uint64_t result;

  if (cnui_shouldTransliterateToLatin___onceToken != -1)
    dispatch_once(&cnui_shouldTransliterateToLatin___onceToken, &__block_literal_global_58272);
  result = objc_msgSend((id)cnui_shouldTransliterateToLatin___supportedScripts, "containsIndex:", 25);
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "cnui_firstUTF32Character");
    return objc_msgSend((id)cnui_shouldTransliterateToLatin___supportedScripts, "containsIndex:", (int)uscript_getScript()) ^ 1;
  }
  return result;
}

- (id)cnui_stringByTransliteratingToPhoneticCharactersForProperty:()CNUI
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C967E0];
  v14 = (void *)*MEMORY[0x1E0C967D0];
  v4 = v14;
  v15 = v5;
  v16 = *MEMORY[0x1E0C967D8];
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqualToString:", v7, v14, v15, v16, v17);
  v10 = objc_msgSend(v8, "containsObject:", v7);

  if (!objc_msgSend(a1, "cnui_shouldUseJapaneseTransliteration"))
  {
    if (objc_msgSend(a1, "_isOnlyIdeographs"))
    {
      if (objc_msgSend(a1, "cnui_shouldUseZhuyinTransliteration"))
      {
        if (v9)
          objc_msgSend(a1, "_stringByTransliteratingToZhuyinAsFamilyName");
        else
          objc_msgSend(a1, "_stringByTransliteratingToZhuyin");
LABEL_7:
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if ((objc_msgSend(a1, "cnui_shouldTransliterateToLatin") & 1) != 0)
      {
        if (v9)
          objc_msgSend(a1, "_stringByTransliteratingToPinyinAsFamilyName");
        else
          objc_msgSend(a1, "_stringByTransliteratingToPinyin");
        goto LABEL_7;
      }
    }
    else if ((objc_msgSend(a1, "cnui_shouldTransliterateToLatin") & 1) != 0)
    {
      objc_msgSend(a1, "_stringByApplyingTransform:", CFSTR("Any-Latin; Any-Title; NFD"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v11 = a1;
    goto LABEL_16;
  }
  objc_msgSend(a1, "cnui_stringByTransliteratingToKanaAsName:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v12 = v11;

  return v12;
}

@end
