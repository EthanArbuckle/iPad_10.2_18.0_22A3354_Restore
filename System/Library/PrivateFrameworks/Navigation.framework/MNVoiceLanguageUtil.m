@implementation MNVoiceLanguageUtil

+ (id)systemDefaultVoiceLanguage
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v17;
  NSObject *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_uiVoiceLanguage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assistantIsEnabled");

  if (!v4)
  {
    GetAudioLogForMNVoiceLanguageUtilCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v17 = 138543362;
      v18 = v2;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "ⓥ Using UI language %{public}@ (Siri disabled)", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CFE858], "outputVoice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v6 = objc_claimAutoreleasedReturnValue();

  GetAudioLogForMNVoiceLanguageUtilCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138543362;
    v18 = v6;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEBUG, "ⓥ siriVoiceLanguage = %{public}@", (uint8_t *)&v17, 0xCu);
  }

  if (!v6)
  {
LABEL_15:
    v13 = v2;
    goto LABEL_20;
  }
  v8 = objc_msgSend(MEMORY[0x1E0CFE858], "assistantIsSupportedForLanguageCode:error:", v2, 0);
  GetAudioLogForMNVoiceLanguageUtilCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = CFSTR("No");
    if (v8)
      v10 = CFSTR("Yes");
    v17 = 138543362;
    v18 = v10;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEBUG, "ⓥ uiLanguageAvailableInSiri = %{public}@", (uint8_t *)&v17, 0xCu);
  }

  GetAudioLogForMNVoiceLanguageUtilCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      v17 = 138543618;
      v18 = v6;
      v19 = 2114;
      v20 = v2;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "ⓥ Using Siri language %{public}@ (UI-based language is %{public}@)", (uint8_t *)&v17, 0x16u);
    }

    v13 = v6;
    v11 = v2;
  }
  else
  {
    if (v12)
    {
      v17 = 138543618;
      v18 = v2;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "ⓥ Using UI language %{public}@ (Siri language is %{public}@)", (uint8_t *)&v17, 0x16u);
    }
    v13 = v2;
  }

LABEL_20:
  objc_msgSend(MEMORY[0x1E0D27150], "supportedPhoneticTypesForPhoneticLocaleID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  GEOConfigSetArray();
  v15 = v13;

  return v15;
}

+ (id)_uiVoiceLanguage
{
  void *v2;
  void *v3;
  id v4;
  __int128 v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  int v18;
  __CFString *v19;
  char v20;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = v3;
  v24 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (!v24)
  {

LABEL_20:
    v6 = CFSTR("en-US");
    goto LABEL_21;
  }
  v6 = 0;
  v23 = *(_QWORD *)v26;
  v7 = *MEMORY[0x1E0C997E8];
  *(_QWORD *)&v5 = 138543874;
  v22 = v5;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v26 != v23)
      objc_enumerationMutation(v4);
    v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8);
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v9, v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA78C8], "fallbackLanguageFor:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    GetAudioLogForMNVoiceLanguageUtilCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v22;
      v30 = v9;
      v31 = 2114;
      v32 = v10;
      v33 = 2114;
      v34 = v13;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_DEBUG, "ⓥ UI language %{public}@ (%{public}@) falls back to %{public}@", buf, 0x20u);
    }

    v17 = objc_msgSend(v12, "isEqualToString:", CFSTR("yue"));
    v18 = objc_msgSend(v13, "isEqualToString:", CFSTR("zh-HK"));
    if (!v6)
      v6 = v13;
    if ((v17 & v18 & 1) != 0 || objc_msgSend(v15, "isEqual:", v12))
    {
      v19 = v13;

      v20 = 1;
      v6 = v19;
    }
    else
    {
      v20 = 0;
    }

    if ((v20 & 1) != 0)
      break;
    if (v24 == ++v8)
    {
      v24 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      if (v24)
        goto LABEL_3;
      break;
    }
  }

  if (!v6)
    goto LABEL_20;
LABEL_21:

  return v6;
}

@end
