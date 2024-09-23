@implementation CESRSpeechProfileSettings

- (CESRSpeechProfileSettings)initWithAssistantLocale:(id)a3 dictationLocales:(id)a4
{
  id v7;
  id v8;
  CESRSpeechProfileSettings *v9;
  CESRSpeechProfileSettings *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CESRSpeechProfileSettings;
  v9 = -[CESRSpeechProfileSettings init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assistantLocale, a3);
    objc_storeStrong((id *)&v10->_dictationLocales, a4);
  }

  return v10;
}

- (void)refresh
{
  NSObject *v3;
  NSLocale *v4;
  NSLocale *assistantLocale;
  NSSet *v6;
  NSSet *dictationLocales;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[CESRSpeechProfileSettings refresh]";
    _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s Refreshing Settings", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "_currentAssistantLocale");
  v4 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  assistantLocale = self->_assistantLocale;
  self->_assistantLocale = v4;

  objc_msgSend((id)objc_opt_class(), "_currentDictationLocales");
  v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  dictationLocales = self->_dictationLocales;
  self->_dictationLocales = v6;

}

- (void)enumerateRequiredInstances:(id)a3
{
  void (**v4)(id, NSLocale *, uint64_t);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSLocale *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, NSLocale *, uint64_t))a3;
  if (self->_assistantLocale)
  {
    if (-[NSSet containsObject:](self->_dictationLocales, "containsObject:"))
      v5 = 3;
    else
      v5 = 1;
    v4[2](v4, self->_assistantLocale, v5);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSSet allObjects](self->_dictationLocales, "allObjects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(NSLocale **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((-[NSLocale isEqual:](v11, "isEqual:", self->_assistantLocale) & 1) == 0)
          v4[2](v4, v11, 2);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (BOOL)isSupportedSet:(id)a3 instanceOptions:(unsigned __int8)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  char v12;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "itemType");
  if (+[CESRUtilities isCustomerInstall](CESRUtilities, "isCustomerInstall"))
  {
LABEL_2:
    if ((int)v6 <= 19667)
    {
      if ((int)v6 > 13883)
      {
        if ((int)v6 > 15571)
        {
          if ((_DWORD)v6 == 15572 || (_DWORD)v6 == 16251)
            goto LABEL_43;
          v7 = 18540;
        }
        else
        {
          if ((_DWORD)v6 == 13884 || (_DWORD)v6 == 14706)
            goto LABEL_43;
          v7 = 14816;
        }
      }
      else
      {
        if ((int)v6 > 7718)
        {
          if ((_DWORD)v6 != 7719)
          {
            if ((_DWORD)v6 != 12010 && (_DWORD)v6 != 12996)
            {
LABEL_48:
              objc_msgSend(MEMORY[0x1E0D3E4C0], "descriptionForTypeIdentifier:", v6);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = *MEMORY[0x1E0CFE6C0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v17 = "-[CESRSpeechProfileSettings isSupportedSet:instanceOptions:]";
                v18 = 2112;
                v19 = v14;
                _os_log_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_INFO, "%s Set itemType: %@ ignored on this OS platform", buf, 0x16u);
              }

              v11 = 0;
              goto LABEL_47;
            }
            goto LABEL_33;
          }
          goto LABEL_43;
        }
        if ((_DWORD)v6 == 800 || (_DWORD)v6 == 5595)
          goto LABEL_43;
        v7 = 7690;
      }
    }
    else if ((int)v6 <= 38250)
    {
      if ((int)v6 > 30597)
      {
        if ((_DWORD)v6 == 30598 || (_DWORD)v6 == 32965)
          goto LABEL_43;
        v7 = 36434;
      }
      else
      {
        if ((_DWORD)v6 == 19668 || (_DWORD)v6 == 25883)
          goto LABEL_43;
        v7 = 26512;
      }
    }
    else
    {
      if ((int)v6 > 49065)
      {
        if ((int)v6 <= 61351)
        {
          if ((_DWORD)v6 != 49066)
          {
            v7 = 53482;
            goto LABEL_42;
          }
LABEL_33:
          v12 = objc_msgSend((id)objc_opt_class(), "_instanceSupportsAssistant:", v4);
          goto LABEL_46;
        }
        if ((_DWORD)v6 != 63369)
        {
          v7 = 61352;
          goto LABEL_42;
        }
LABEL_43:
        if ((objc_msgSend((id)objc_opt_class(), "_instanceSupportsAssistant:", v4) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_47;
        }
        v12 = objc_msgSend((id)objc_opt_class(), "_instanceSupportsDictation:", v4);
LABEL_46:
        v11 = v12;
        goto LABEL_47;
      }
      if ((_DWORD)v6 == 38251 || (_DWORD)v6 == 42184)
        goto LABEL_43;
      v7 = 44935;
    }
LABEL_42:
    if ((_DWORD)v6 == v7)
      goto LABEL_43;
    goto LABEL_48;
  }
  objc_msgSend(MEMORY[0x1E0D3E4C0], "descriptionForTypeIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _BOOLValueForKey((const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accept %@"), CFSTR("*")));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _BOOLValueForKey((const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accept %@"), v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {

      goto LABEL_2;
    }
  }
  v10 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[CESRSpeechProfileSettings isSupportedSet:instanceOptions:]";
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_INFO, "%s Using settings override: (%@) for set: %@", buf, 0x20u);
  }
  v11 = objc_msgSend(v9, "BOOLValue");

LABEL_47:
  return v11;
}

- (BOOL)isUserExclusiveSet:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationLocales, 0);
  objc_storeStrong((id *)&self->_assistantLocale, 0);
}

+ (id)defaultSettings
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend((id)objc_opt_class(), "_currentAssistantLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_currentDictationLocales");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithAssistantLocale:dictationLocales:", v3, v4);

  return v5;
}

+ (id)_mapToSpeechProfileLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRSpeechProfileBuilder getSpeechLocaleForLocale:](CESRSpeechProfileBuilder, "getSpeechLocaleForLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315650;
      v10 = "+[CESRSpeechProfileSettings _mapToSpeechProfileLocale:]";
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_ERROR, "%s Failed to resolve Speech locale for languageCode: %@ locale: %@", (uint8_t *)&v9, 0x20u);
    }
  }

  return v6;
}

+ (id)_currentAssistantLocale
{
  NSObject *v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!+[CESRUtilities isSiriUODSupported](CESRUtilities, "isSiriUODSupported"))
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CESRSpeechProfileSettings _currentAssistantLocale]";
      v4 = "%s Siri UOD Not supported";
      goto LABEL_12;
    }
LABEL_13:
    v11 = 0;
    return v11;
  }
  if (+[CESRUtilities isSiriUODwithASROnServerSupported](CESRUtilities, "isSiriUODwithASROnServerSupported"))
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CESRSpeechProfileSettings _currentAssistantLocale]";
      v4 = "%s Siri UOD with ASR on Server supported";
LABEL_12:
      _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v14, 0xCu);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (!+[CESRUtilities isAssistantEnabled](CESRUtilities, "isAssistantEnabled"))
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CESRSpeechProfileSettings _currentAssistantLocale]";
      v4 = "%s Siri Assistant disabled in settings";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  +[CESRUtilities currentSiriLanguageCode](CESRUtilities, "currentSiriLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mapToSpeechProfileLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CESRUtilities languageCodeForLocale:](CESRUtilities, "languageCodeForLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7F38]), "initWithLanguage:assetType:", v7, 3);
  objc_msgSend(MEMORY[0x1E0CD7F48], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "installedAssetWithConfig:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v6;
  }
  else
  {
    v13 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "+[CESRSpeechProfileSettings _currentAssistantLocale]";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_INFO, "%s No asset available for locale: %@", (uint8_t *)&v14, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)_currentDictationLocales
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  const char *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!+[CESRUtilities isOfflineDictationSupported](CESRUtilities, "isOfflineDictationSupported"))
  {
    v11 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "+[CESRSpeechProfileSettings _currentDictationLocales]";
      v12 = "%s Offline dictation not supported";
LABEL_17:
      _os_log_impl(&dword_1B3E5F000, v11, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
    }
LABEL_18:
    v3 = 0;
    return v3;
  }
  if (!+[CESRUtilities isDictationEnabled](CESRUtilities, "isDictationEnabled"))
  {
    v11 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "+[CESRSpeechProfileSettings _currentDictationLocales]";
      v12 = "%s Dictation disabled in settings";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[CESRUtilities currentDictationLanguageCodes](CESRUtilities, "currentDictationLanguageCodes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(a1, "_mapToSpeechProfileLocale:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v3;
}

+ (BOOL)_instanceSupportsAssistant:(unsigned __int8)a3
{
  return a3 & 1;
}

+ (BOOL)_instanceSupportsDictation:(unsigned __int8)a3
{
  return (a3 >> 1) & 1;
}

+ (void)enableOverrideAcceptAllSets
{
  const __CFString *v2;

  v2 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accept %@"), CFSTR("*"));
  CFPreferencesSetAppValue(v2, MEMORY[0x1E0C9AAB0], CFSTR("com.apple.SpeechProfile"));
}

+ (void)disableOverrideAcceptAllSets
{
  CFPreferencesSetAppValue((CFStringRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accept %@"), CFSTR("*")), 0, CFSTR("com.apple.SpeechProfile"));
}

@end
