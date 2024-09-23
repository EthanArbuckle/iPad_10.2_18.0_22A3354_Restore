@implementation AVMediaSelectionOption(AVPlayerController)

- (uint64_t)isAC3Only
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mediaSubTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "mediaSubTypes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "unsignedIntValue");
        if (v9 != 1885430579 && v9 != 1633889587)
        {
          v11 = 0;
          goto LABEL_16;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  v11 = 1;
LABEL_16:

  return v11;
}

- (id)avkit_persistentIdentifier
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "propertyList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "propertyList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MediaSelectionOptionsPersistentID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = &unk_1E5BF3528;
  v7 = v6;

  return v7;
}

- (uint64_t)isMain
{
  if ((objc_msgSend(a1, "isEasyReader") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "isAuxiliary") ^ 1;
}

- (uint64_t)isSDH
{
  uint64_t result;

  result = objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A780]);
  if ((_DWORD)result)
    return objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A720]);
  return result;
}

- (uint64_t)isCC
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "mediaType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8A7B8]);

  return v2;
}

- (uint64_t)isEasyReader
{
  return objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A738]);
}

- (uint64_t)isAuxiliary
{
  return objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A748]);
}

- (uint64_t)isAudio
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "mediaType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8A7A0]);

  return v2;
}

- (uint64_t)isOriginal
{
  return objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A758]);
}

- (id)avkit_recentLanguageCode
{
  if (objc_msgSend(a1, "isAudio"))
    objc_msgSend(MEMORY[0x1E0C8B200], "avkit_recentAudioLanguageCode");
  else
    objc_msgSend(MEMORY[0x1E0C8B200], "avkit_recentLegibleLanguageCode");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)audioLanguageCompare:()AVPlayerController
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;

  v4 = a3;
  v5 = objc_msgSend(a1, "isOriginal");
  v6 = objc_msgSend(v4, "isOriginal");
  if (v5)
    v7 = -1;
  else
    v7 = 1;
  if (v5 == v6)
  {
    v7 = objc_msgSend(a1, "languageCompare:", v4);
    if (!v7)
    {
      v8 = *MEMORY[0x1E0C8A748];
      if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A748]))
      {
        v9 = a1;
        v10 = v8;
LABEL_11:
        v7 = objc_msgSend(v9, "hasMediaCharacteristic:", v10) ^ 1;
        goto LABEL_15;
      }
      v11 = *MEMORY[0x1E0C8A728];
      v12 = objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A728]);
      v13 = objc_msgSend(v4, "hasMediaCharacteristic:", v8);
      if (v12)
      {
        if ((v13 & 1) == 0)
        {
          v9 = v4;
          v10 = v11;
          goto LABEL_11;
        }
      }
      else if ((v13 & 1) == 0 && !objc_msgSend(v4, "hasMediaCharacteristic:", v11))
      {
        v7 = 0;
        goto LABEL_15;
      }
      v7 = -1;
    }
  }
LABEL_15:

  return v7;
}

- (uint64_t)languageCompare:()AVPlayerController
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "extendedLanguageTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendedLanguageTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "avkit_preferredSortIndex");
  v8 = objc_msgSend(a1, "avkit_preferredSortIndex");
  if ((objc_msgSend(v6, "isEqualToString:", v5) & 1) != 0)
  {
    v9 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(a1, "isOriginal") && !objc_msgSend(v4, "isOriginal"))
  {
    v9 = -1;
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "isOriginal") && !objc_msgSend(a1, "isOriginal"))
    goto LABEL_17;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = objc_msgSend(a1, "avkit_isBestChoiceForRecentLanguage");
      if (v10 != objc_msgSend(v4, "avkit_isBestChoiceForRecentLanguage"))
      {
        if (objc_msgSend(a1, "avkit_isBestChoiceForRecentLanguage"))
          v9 = -1;
        else
          v9 = 1;
        goto LABEL_19;
      }
LABEL_16:
      objc_msgSend(a1, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "localizedCaseInsensitiveCompare:", v12);

      goto LABEL_19;
    }
LABEL_17:
    v9 = 1;
    goto LABEL_19;
  }
  v9 = -1;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 <= v8)
  {
    if (v7 == v8)
      goto LABEL_16;
    goto LABEL_17;
  }
LABEL_19:

  return v9;
}

- (void)avkit_setPreferredSortIndex:()AVPlayerController
{
  const void *v4;
  id v5;

  v4 = (const void *)_PreferredSortIndexKey;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_setAssociatedObject(object, (const void *)_PreferredSortIndexKey, 0, (void *)1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(object, v4, v5, (void *)1);

  }
}

- (uint64_t)avkit_preferredSortIndex
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)_PreferredSortIndexKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v1)
    v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)avkit_setBestChoiceForRecentLanguage:()AVPlayerController
{
  void *v3;

  if (a3)
    v3 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v3 = 0;
  objc_setAssociatedObject(a1, (const void *)_BestChoiceForRecentLanguageKey, v3, (void *)1);
}

- (uint64_t)avkit_isBestChoiceForRecentLanguage
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)_BestChoiceForRecentLanguageKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v1)
    v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (id)avkit_recentAudioLanguageCode
{
  void *v0;
  void *v1;

  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "mostRecentAudioLanguageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)avkit_recentLegibleLanguageCode
{
  void *v0;
  void *v1;

  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "mostRecentLegibleLanguageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)avkit_subtitleAutomaticallyEnabledState
{
  void *v0;
  uint64_t v1;

  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "subtitleAutomaticallyEnabledState");

  return v1;
}

@end
