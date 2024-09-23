@implementation AFLanguageDetectionUserContext

- (AFLanguageDetectionUserContext)init
{
  AFLanguageDetectionUserContext *v2;
  AFLanguageDetectionUserContext *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *lidUserContext;
  NSMutableDictionary *v6;
  NSMutableDictionary *dictationLanguageMappingCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AFLanguageDetectionUserContext;
  v2 = -[AFLanguageDetectionUserContext init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_userContextChangeBit = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lidUserContext = v3->_lidUserContext;
    v3->_lidUserContext = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictationLanguageMappingCache = v3->_dictationLanguageMappingCache;
    v3->_dictationLanguageMappingCache = v6;

  }
  return v3;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("Language toggled = %d,\n"), self->_languageToggled);
  objc_msgSend(v3, "appendFormat:", CFSTR("Current keyboard = %@,\n"), self->_currentKeyboard);
  objc_msgSend(v3, "appendFormat:", CFSTR("Previous message language = %@,\n"), self->_prevMessageLanguage);
  objc_msgSend(v3, "appendFormat:", CFSTR("Last used keyboard = %@,\n"), self->_globalLastUsedKeyboard);
  objc_msgSend(v3, "appendFormat:", CFSTR("Multilingual keyboard languages = %@,\n"), self->_multiLingualKeyboardLanguages);
  objc_msgSend(v3, "appendFormat:", CFSTR("Primary language = %@,\n"), self->_primaryLanguageCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("Dictation languages = %@,\n"), self->_dictationLanguages);
  objc_msgSend(v3, "appendFormat:", CFSTR("Global Conversational Language Priors = %@,\n"), self->_keyboardConversationLanguagePriors);
  objc_msgSend(v3, "appendFormat:", CFSTR("Global Keyboard Language Priors = %@,\n"), self->_keyboardGlobalLanguagePriors);
  objc_msgSend(v3, "appendFormat:", CFSTR("Dictation input origin = %@.\n\n"), self->_dictationInputOrigin);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 languageToggled;
  id v5;

  languageToggled = self->_languageToggled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", languageToggled, CFSTR("_languageToggled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_simulateLanguageDetectorAssetsAvailability, CFSTR("_simulateLanguageDetectorAssetsAvailability"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentKeyboard, CFSTR("_currentKeyboard"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryLanguageCode, CFSTR("_primaryLanguageCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_prevMessageLanguage, CFSTR("_prevMessageLanguage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_globalLastUsedKeyboard, CFSTR("_globalLastUsedKeyboard"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_userContextChangeBit, CFSTR("_userContextChangeBit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_multiLingualKeyboardLanguages, CFSTR("_multiLingualKeyboardLanguages"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyboardConvoRecentMessages, CFSTR("_keyboardConvoRecentMessages"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dictationLanguages, CFSTR("_dictationLanguages"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_simulatingLanguageCodes, CFSTR("_simulatingLanguageCodes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_finalDictationLanguages, CFSTR("_finalDictationLanguages"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyboardConversationLanguagePriors, CFSTR("_keyboardConversationLanguagePriors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyboardGlobalLanguagePriors, CFSTR("_keyboardGlobalLanguagePriors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_languageCodeOverrides, CFSTR("_languageCodeOverrides"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lidUserContext, CFSTR("_lidUserContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dictationLanguageMappingCache, CFSTR("_dictationLanguageMappingCache"));

}

- (AFLanguageDetectionUserContext)initWithCoder:(id)a3
{
  id v4;
  AFLanguageDetectionUserContext *v5;
  uint64_t v6;
  NSString *currentKeyboard;
  uint64_t v8;
  NSString *primaryLanguageCode;
  uint64_t v10;
  NSString *prevMessageLanguage;
  uint64_t v12;
  NSString *globalLastUsedKeyboard;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *multiLingualKeyboardLanguages;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *keyboardConvoRecentMessages;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *dictationLanguages;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *simulatingLanguageCodes;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *finalDictationLanguages;
  uint64_t v39;
  NSDictionary *keyboardConversationLanguagePriors;
  uint64_t v41;
  NSDictionary *keyboardGlobalLanguagePriors;
  uint64_t v43;
  NSDictionary *languageCodeOverrides;
  uint64_t v45;
  NSMutableDictionary *lidUserContext;
  uint64_t v47;
  NSMutableDictionary *dictationLanguageMappingCache;
  objc_super v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)AFLanguageDetectionUserContext;
  v5 = -[AFLanguageDetectionUserContext init](&v50, sel_init);
  if (v5)
  {
    v5->_languageToggled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_languageToggled"));
    v5->_simulateLanguageDetectorAssetsAvailability = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_simulateLanguageDetectorAssetsAvailability"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_currentKeyboard"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentKeyboard = v5->_currentKeyboard;
    v5->_currentKeyboard = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryLanguageCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryLanguageCode = v5->_primaryLanguageCode;
    v5->_primaryLanguageCode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_prevMessageLanguage"));
    v10 = objc_claimAutoreleasedReturnValue();
    prevMessageLanguage = v5->_prevMessageLanguage;
    v5->_prevMessageLanguage = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_globalLastUsedKeyboard"));
    v12 = objc_claimAutoreleasedReturnValue();
    globalLastUsedKeyboard = v5->_globalLastUsedKeyboard;
    v5->_globalLastUsedKeyboard = (NSString *)v12;

    v5->_userContextChangeBit = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_userContextChangeBit"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v55[0] = objc_opt_class();
    v55[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_multiLingualKeyboardLanguages"));
    v17 = objc_claimAutoreleasedReturnValue();
    multiLingualKeyboardLanguages = v5->_multiLingualKeyboardLanguages;
    v5->_multiLingualKeyboardLanguages = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v54[0] = objc_opt_class();
    v54[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("_keyboardConvoRecentMessages"));
    v22 = objc_claimAutoreleasedReturnValue();
    keyboardConvoRecentMessages = v5->_keyboardConvoRecentMessages;
    v5->_keyboardConvoRecentMessages = (NSArray *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("_dictationLanguages"));
    v27 = objc_claimAutoreleasedReturnValue();
    dictationLanguages = v5->_dictationLanguages;
    v5->_dictationLanguages = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("_simulatingLanguageCodes"));
    v32 = objc_claimAutoreleasedReturnValue();
    simulatingLanguageCodes = v5->_simulatingLanguageCodes;
    v5->_simulatingLanguageCodes = (NSArray *)v32;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithArray:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("_finalDictationLanguages"));
    v37 = objc_claimAutoreleasedReturnValue();
    finalDictationLanguages = v5->_finalDictationLanguages;
    v5->_finalDictationLanguages = (NSArray *)v37;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_keyboardConversationLanguagePriors"));
    v39 = objc_claimAutoreleasedReturnValue();
    keyboardConversationLanguagePriors = v5->_keyboardConversationLanguagePriors;
    v5->_keyboardConversationLanguagePriors = (NSDictionary *)v39;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_keyboardGlobalLanguagePriors"));
    v41 = objc_claimAutoreleasedReturnValue();
    keyboardGlobalLanguagePriors = v5->_keyboardGlobalLanguagePriors;
    v5->_keyboardGlobalLanguagePriors = (NSDictionary *)v41;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_languageCodeOverrides"));
    v43 = objc_claimAutoreleasedReturnValue();
    languageCodeOverrides = v5->_languageCodeOverrides;
    v5->_languageCodeOverrides = (NSDictionary *)v43;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_lidUserContext"));
    v45 = objc_claimAutoreleasedReturnValue();
    lidUserContext = v5->_lidUserContext;
    v5->_lidUserContext = (NSMutableDictionary *)v45;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_dictationLanguageMappingCache"));
    v47 = objc_claimAutoreleasedReturnValue();
    dictationLanguageMappingCache = v5->_dictationLanguageMappingCache;
    v5->_dictationLanguageMappingCache = (NSMutableDictionary *)v47;

  }
  return v5;
}

- (void)_removeContextValueForKey:(id)a3 context:(id)a4
{
  if (a3)
    objc_msgSend(a4, "removeObjectForKey:");
}

- (void)_updateContextValue:(id)a3 forKey:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a5;
  v9 = a4;
  -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", v9, v8);
  if (v10)
    objc_msgSend(v8, "setObject:forKey:", v10, v9);

}

- (void)_setContextValue:(id)a3 forKey:(id)a4 context:(id)a5
{
  if (a3)
    -[AFLanguageDetectionUserContext _updateContextValue:forKey:context:](self, "_updateContextValue:forKey:context:", a3, a4, a5);
  else
    -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", a4, a5);
}

- (void)setWasLanguageToggled:(BOOL)a3
{
  self->_languageToggled = a3;
  self->_userContextChangeBit |= 1u;
}

- (void)setCurrentKeyboard:(id)a3
{
  NSString *v4;
  NSString *currentKeyboard;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  currentKeyboard = self->_currentKeyboard;
  self->_currentKeyboard = v4;

  self->_userContextChangeBit |= 2u;
}

- (void)setPrevMessageLanguage:(id)a3
{
  NSString *v4;
  NSString *prevMessageLanguage;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  prevMessageLanguage = self->_prevMessageLanguage;
  self->_prevMessageLanguage = v4;

  self->_userContextChangeBit |= 4u;
}

- (void)setGlobalLastUsedKeyboard:(id)a3
{
  NSString *v4;
  NSString *globalLastUsedKeyboard;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  globalLastUsedKeyboard = self->_globalLastUsedKeyboard;
  self->_globalLastUsedKeyboard = v4;

  self->_userContextChangeBit |= 8u;
}

- (void)setMultiLingualKeyboardLanguages:(id)a3
{
  NSArray *v4;
  NSArray *multiLingualKeyboardLanguages;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  multiLingualKeyboardLanguages = self->_multiLingualKeyboardLanguages;
  self->_multiLingualKeyboardLanguages = v4;

  self->_userContextChangeBit |= 0x10u;
}

- (void)setKeyboardConvoRecentMessages:(id)a3
{
  NSArray *v4;
  NSArray *keyboardConvoRecentMessages;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  keyboardConvoRecentMessages = self->_keyboardConvoRecentMessages;
  self->_keyboardConvoRecentMessages = v4;

  self->_userContextChangeBit |= 0x20u;
}

- (void)setDictationLanguages:(id)a3
{
  NSArray *v4;
  NSArray *dictationLanguages;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  dictationLanguages = self->_dictationLanguages;
  self->_dictationLanguages = v4;

  self->_userContextChangeBit |= 0x40u;
}

- (void)setKeyboardConversationLanguagePriors:(id)a3
{
  NSDictionary *v4;
  NSDictionary *keyboardConversationLanguagePriors;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  keyboardConversationLanguagePriors = self->_keyboardConversationLanguagePriors;
  self->_keyboardConversationLanguagePriors = v4;

  self->_userContextChangeBit |= 0x80u;
}

- (void)setKeyboardGlobalLanguagePriors:(id)a3
{
  NSDictionary *v4;
  NSDictionary *keyboardGlobalLanguagePriors;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  keyboardGlobalLanguagePriors = self->_keyboardGlobalLanguagePriors;
  self->_keyboardGlobalLanguagePriors = v4;

  self->_userContextChangeBit |= 0x100u;
}

- (void)setPrimaryLanguageCode:(id)a3
{
  NSString *v4;
  NSString *primaryLanguageCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  primaryLanguageCode = self->_primaryLanguageCode;
  self->_primaryLanguageCode = v4;

  self->_userContextChangeBit |= 2u;
}

- (id)siriDictationLanguageForLanguage:(id)a3
{
  return -[AFLanguageDetectionUserContext userContextLanguageCodeForKeyboardLangauge:overrideLanguageCode:](self, "userContextLanguageCodeForKeyboardLangauge:overrideLanguageCode:", a3, 0);
}

- (id)getSiriDictationLanguagesFromLanguages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  AFLanguageDetectionUserContext *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __73__AFLanguageDetectionUserContext_getSiriDictationLanguagesFromLanguages___block_invoke;
    v14 = &unk_1E3A2DC28;
    v15 = self;
    v16 = v6;
    v7 = v6;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v11);
    if (objc_msgSend(v7, "count", v11, v12, v13, v14, v15))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)priorsByReplacingKeyboardLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFLanguageDetectionUserContext getSiriDictationLanguagesFromLanguages:](self, "getSiriDictationLanguagesFromLanguages:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__AFLanguageDetectionUserContext_priorsByReplacingKeyboardLanguage___block_invoke;
    v12[3] = &unk_1E3A2DC50;
    v13 = v4;
    v8 = v7;
    v14 = v8;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
    v9 = v14;
    v10 = v8;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isUpdateAvailableForLanguageDetectorContext
{
  return self->_userContextChangeBit != 0;
}

- (unsigned)languageDetectorContextChangeBits
{
  return self->_userContextChangeBit;
}

- (void)_setUserContextChangeBit:(unsigned int)a3
{
  self->_userContextChangeBit = a3;
}

- (void)_setLanguageDetectorContext:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *lidUserContext;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  lidUserContext = self->_lidUserContext;
  self->_lidUserContext = v4;

}

- (void)_setFinalFilteredDictationLanguages:(id)a3
{
  NSArray *v4;
  NSArray *finalDictationLanguages;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  finalDictationLanguages = self->_finalDictationLanguages;
  self->_finalDictationLanguages = v4;

}

- (void)_setDictationLanguageCodeMappingCache:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *dictationLanguageMappingCache;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  dictationLanguageMappingCache = self->_dictationLanguageMappingCache;
  self->_dictationLanguageMappingCache = v4;

}

- (id)context
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_languageToggled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFLanguageDetectionUserContext _setContextValue:forKey:context:](self, "_setContextValue:forKey:context:", v4, CFSTR("WasLanguageToggled"), v3);

  -[AFLanguageDetectionUserContext _setContextValue:forKey:context:](self, "_setContextValue:forKey:context:", self->_currentKeyboard, CFSTR("CurrentKeyboard"), v3);
  -[AFLanguageDetectionUserContext _setContextValue:forKey:context:](self, "_setContextValue:forKey:context:", self->_prevMessageLanguage, CFSTR("LastMessageLanguage"), v3);
  -[AFLanguageDetectionUserContext _setContextValue:forKey:context:](self, "_setContextValue:forKey:context:", self->_globalLastUsedKeyboard, CFSTR("GlobalLastUsedKeyboard"), v3);
  -[AFLanguageDetectionUserContext _setContextValue:forKey:context:](self, "_setContextValue:forKey:context:", self->_multiLingualKeyboardLanguages, CFSTR("MultilingualKeyboardLanguages"), v3);
  -[AFLanguageDetectionUserContext _setContextValue:forKey:context:](self, "_setContextValue:forKey:context:", self->_keyboardConvoRecentMessages, CFSTR("RecentConversationalMessages"), v3);
  -[AFLanguageDetectionUserContext _setContextValue:forKey:context:](self, "_setContextValue:forKey:context:", self->_dictationLanguages, CFSTR("DictationLanguages"), v3);
  -[AFLanguageDetectionUserContext _setContextValue:forKey:context:](self, "_setContextValue:forKey:context:", self->_keyboardConversationLanguagePriors, CFSTR("KeyboardConversationLanguagePriors"), v3);
  -[AFLanguageDetectionUserContext _setContextValue:forKey:context:](self, "_setContextValue:forKey:context:", self->_keyboardGlobalLanguagePriors, CFSTR("KeyboardGlobalLanguagePriors"), v3);
  -[AFLanguageDetectionUserContext _setContextValue:forKey:context:](self, "_setContextValue:forKey:context:", self->_primaryLanguageCode, CFSTR("CurrentKeyboard"), v3);
  return v3;
}

- (id)languageDetectorUserContext
{
  char isKindOfClass;
  NSMutableDictionary *lidUserContext;
  NSMutableDictionary *v5;
  void *v6;
  NSMutableDictionary *v7;
  unsigned int userContextChangeBit;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *keyboardConvoRecentMessages;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;

  if (self->_userContextChangeBit)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    lidUserContext = self->_lidUserContext;
    if ((isKindOfClass & 1) != 0)
      v5 = lidUserContext;
    else
      v5 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](lidUserContext, "mutableCopy");
    v7 = v5;
    userContextChangeBit = self->_userContextChangeBit;
    if ((userContextChangeBit & 1) != 0)
    {
      self->_userContextChangeBit = userContextChangeBit & 0xFFFFFFFE;
      -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", CFSTR("WasLanguageToggled"), v5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_languageToggled);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v9, CFSTR("WasLanguageToggled"));

      userContextChangeBit = self->_userContextChangeBit;
      if ((userContextChangeBit & 2) == 0)
      {
LABEL_8:
        if ((userContextChangeBit & 4) == 0)
          goto LABEL_9;
        goto LABEL_20;
      }
    }
    else if ((userContextChangeBit & 2) == 0)
    {
      goto LABEL_8;
    }
    self->_userContextChangeBit = userContextChangeBit & 0xFFFFFFFD;
    -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", CFSTR("CurrentKeyboard"), v7);
    -[AFLanguageDetectionUserContext siriDictationLanguageForLanguage:](self, "siriDictationLanguageForLanguage:", self->_primaryLanguageCode);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v10, CFSTR("CurrentKeyboard"));

    userContextChangeBit = self->_userContextChangeBit;
    if ((userContextChangeBit & 4) == 0)
    {
LABEL_9:
      if ((userContextChangeBit & 8) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
LABEL_20:
    self->_userContextChangeBit = userContextChangeBit & 0xFFFFFFFB;
    -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", CFSTR("LastMessageLanguage"), v7);
    -[AFLanguageDetectionUserContext siriDictationLanguageForLanguage:](self, "siriDictationLanguageForLanguage:", self->_prevMessageLanguage);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v11, CFSTR("LastMessageLanguage"));

    userContextChangeBit = self->_userContextChangeBit;
    if ((userContextChangeBit & 8) == 0)
    {
LABEL_10:
      if ((userContextChangeBit & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_26;
    }
LABEL_23:
    self->_userContextChangeBit = userContextChangeBit & 0xFFFFFFF7;
    -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", CFSTR("GlobalLastUsedKeyboard"), v7);
    -[AFLanguageDetectionUserContext siriDictationLanguageForLanguage:](self, "siriDictationLanguageForLanguage:", self->_globalLastUsedKeyboard);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v12, CFSTR("GlobalLastUsedKeyboard"));

    userContextChangeBit = self->_userContextChangeBit;
    if ((userContextChangeBit & 0x10) == 0)
    {
LABEL_11:
      if ((userContextChangeBit & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_29;
    }
LABEL_26:
    self->_userContextChangeBit = userContextChangeBit & 0xFFFFFFEF;
    -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", CFSTR("MultilingualKeyboardLanguages"), v7);
    -[AFLanguageDetectionUserContext getSiriDictationLanguagesFromLanguages:](self, "getSiriDictationLanguagesFromLanguages:", self->_multiLingualKeyboardLanguages);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v14, CFSTR("MultilingualKeyboardLanguages"));

    userContextChangeBit = self->_userContextChangeBit;
    if ((userContextChangeBit & 0x20) == 0)
    {
LABEL_12:
      if ((userContextChangeBit & 0x40) == 0)
        goto LABEL_13;
      goto LABEL_32;
    }
LABEL_29:
    self->_userContextChangeBit = userContextChangeBit & 0xFFFFFFDF;
    -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", CFSTR("RecentConversationalMessages"), v7);
    keyboardConvoRecentMessages = self->_keyboardConvoRecentMessages;
    if (keyboardConvoRecentMessages)
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", keyboardConvoRecentMessages, CFSTR("RecentConversationalMessages"));
    userContextChangeBit = self->_userContextChangeBit;
    if ((userContextChangeBit & 0x40) == 0)
    {
LABEL_13:
      if ((userContextChangeBit & 0x80) == 0)
        goto LABEL_14;
      goto LABEL_35;
    }
LABEL_32:
    self->_userContextChangeBit = userContextChangeBit & 0xFFFFFFBF;
    -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", CFSTR("DictationLanguages"), v7);
    -[AFLanguageDetectionUserContext getSiriDictationLanguagesFromLanguages:](self, "getSiriDictationLanguagesFromLanguages:", self->_dictationLanguages);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v17, CFSTR("DictationLanguages"));

    userContextChangeBit = self->_userContextChangeBit;
    if ((userContextChangeBit & 0x80) == 0)
    {
LABEL_14:
      if ((userContextChangeBit & 0x100) == 0)
      {
LABEL_41:
        v20 = self->_lidUserContext;
        self->_lidUserContext = v7;
        v21 = v7;

        v6 = (void *)-[NSMutableDictionary copy](v21, "copy");
        return v6;
      }
LABEL_38:
      self->_userContextChangeBit = userContextChangeBit & 0xFFFFFEFF;
      -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", CFSTR("KeyboardGlobalLanguagePriors"), v7);
      -[AFLanguageDetectionUserContext priorsByReplacingKeyboardLanguage:](self, "priorsByReplacingKeyboardLanguage:", self->_keyboardGlobalLanguagePriors);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v19, CFSTR("KeyboardGlobalLanguagePriors"));

      goto LABEL_41;
    }
LABEL_35:
    self->_userContextChangeBit = userContextChangeBit & 0xFFFFFF7F;
    -[AFLanguageDetectionUserContext _removeContextValueForKey:context:](self, "_removeContextValueForKey:context:", CFSTR("KeyboardConversationLanguagePriors"), v7);
    -[AFLanguageDetectionUserContext priorsByReplacingKeyboardLanguage:](self, "priorsByReplacingKeyboardLanguage:", self->_keyboardConversationLanguagePriors);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v18, CFSTR("KeyboardConversationLanguagePriors"));

    userContextChangeBit = self->_userContextChangeBit;
    if ((userContextChangeBit & 0x100) == 0)
      goto LABEL_41;
    goto LABEL_38;
  }
  v6 = (void *)-[NSMutableDictionary copy](self->_lidUserContext, "copy");
  return v6;
}

- (id)getContextForAnalytics
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AFLanguageDetectionUserContext languageDetectorUserContext](self, "languageDetectorUserContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  objc_msgSend(v3, "removeObjectForKey:", CFSTR("RecentConversationalMessages"));
  if (objc_msgSend(v3, "count"))
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)getDictationLanguagesForSupportedLocales:(id)a3 error:(id *)a4
{
  id v7;
  NSArray *v8;
  char isKindOfClass;
  NSArray *dictationLanguages;
  void *v11;
  NSArray *v12;
  id v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  id v28;
  id v29;
  NSObject *v30;
  id *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[AFLanguageDetectionUserContext languageDetectorUserContext](self, "languageDetectorUserContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKey:", CFSTR("DictationLanguages"));
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    dictationLanguages = v8;
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFLanguageDetectionUserContext.m"), 409, CFSTR("The cached dictation languages is not a instance of NSArray"));

      dictationLanguages = v8;
    }
  }
  else
  {
    dictationLanguages = self->_dictationLanguages;
  }
  v32 = a4;
  v12 = dictationLanguages;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v14 = v12;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_languageCodeOverrides, "objectForKey:", v19, v32);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFLanguageDetectionUserContext userContextLanguageCodeForKeyboardLangauge:overrideLanguageCode:](self, "userContextLanguageCodeForKeyboardLangauge:overrideLanguageCode:", v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 && objc_msgSend(v7, "containsObject:", v21))
          objc_msgSend(v13, "addObject:", v21);

      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v16);
  }

  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = v13;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v22, "addObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v32);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v25);
  }

  if (!objc_msgSend(v22, "count"))
  {
    if (v32)
    {
      +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", 2802, CFSTR("The input dictation languages are not supported by language detector. This is a critical error."), 0);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      *v32 = v29;
      v30 = AFSiriLogContextUtility;
      v28 = 0;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_DWORD *)buf = 136315394;
      v43 = "-[AFLanguageDetectionUserContext getDictationLanguagesForSupportedLocales:error:]";
      v44 = 2112;
      v45 = v29;
      _os_log_error_impl(&dword_19AF50000, v30, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    v28 = 0;
    goto LABEL_28;
  }
  -[AFLanguageDetectionUserContext _setFinalFilteredDictationLanguages:](self, "_setFinalFilteredDictationLanguages:", v22);
  v28 = v22;
LABEL_28:

  return v28;
}

- (id)userContextLanguageCodeForKeyboardLangauge:(id)a3 overrideLanguageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[AFLanguageDetectionUserContext _setDictationLanguageCodeMappingCache:](self, "_setDictationLanguageCodeMappingCache:", self->_dictationLanguageMappingCache);
    -[NSMutableDictionary objectForKey:](self->_dictationLanguageMappingCache, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      AFOverrideLanguageCode(v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        -[NSMutableDictionary setObject:forKey:](self->_dictationLanguageMappingCache, "setObject:forKey:", v8, v6);
    }
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v11 = 136315906;
      v12 = "-[AFLanguageDetectionUserContext userContextLanguageCodeForKeyboardLangauge:overrideLanguageCode:]";
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s User context language code mapping %@ -> %@ (override: %@)", (uint8_t *)&v11, 0x2Au);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)finalFilteredDictationLanguages
{
  return self->_finalDictationLanguages;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setWasLanguageToggled:", self->_languageToggled);
  objc_msgSend(v4, "setCurrentKeyboard:", self->_currentKeyboard);
  objc_msgSend(v4, "setPrimaryLanguageCode:", self->_primaryLanguageCode);
  objc_msgSend(v4, "setPrevMessageLanguage:", self->_prevMessageLanguage);
  objc_msgSend(v4, "setGlobalLastUsedKeyboard:", self->_globalLastUsedKeyboard);
  objc_msgSend(v4, "setMultiLingualKeyboardLanguages:", self->_multiLingualKeyboardLanguages);
  objc_msgSend(v4, "setKeyboardConvoRecentMessages:", self->_keyboardConvoRecentMessages);
  objc_msgSend(v4, "setDictationLanguages:", self->_dictationLanguages);
  objc_msgSend(v4, "setKeyboardConversationLanguagePriors:", self->_keyboardConversationLanguagePriors);
  objc_msgSend(v4, "setKeyboardGlobalLanguagePriors:", self->_keyboardGlobalLanguagePriors);
  objc_msgSend(v4, "setLanguageCodeOverrides:", self->_languageCodeOverrides);
  objc_msgSend(v4, "setSimulatingLanguageCodes:", self->_simulatingLanguageCodes);
  objc_msgSend(v4, "setShouldSimulateLanguageDetectorAssetsAvailability:", self->_simulateLanguageDetectorAssetsAvailability);
  objc_msgSend(v4, "_setUserContextChangeBit:", self->_userContextChangeBit);
  objc_msgSend(v4, "_setLanguageDetectorContext:", self->_lidUserContext);
  objc_msgSend(v4, "_setFinalFilteredDictationLanguages:", self->_finalDictationLanguages);
  objc_msgSend(v4, "_setDictationLanguageCodeMappingCache:", self->_dictationLanguageMappingCache);
  return v4;
}

- (void)setShouldSimulateLanguageDetectorAssetsAvailability:(BOOL)a3
{
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
    self->_simulateLanguageDetectorAssetsAvailability = a3;
}

- (BOOL)shouldSimulateLanguageDetectorAssetsAvailability
{
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  return AFIsInternalInstall_isInternal && self->_simulateLanguageDetectorAssetsAvailability;
}

- (void)setSimulatingLanguageCodes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *simulatingLanguageCodes;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (AFIsInternalInstall_onceToken == -1)
  {
    if (!v4)
      goto LABEL_6;
  }
  else
  {
    v10 = v4;
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
    v5 = v10;
    if (!v10)
      goto LABEL_6;
  }
  if (AFIsInternalInstall_isInternal)
  {
    v9 = v5;
    v6 = objc_msgSend(v5, "count");
    v5 = v9;
    if (v6)
    {
      v7 = (NSArray *)objc_msgSend(v9, "copy");
      simulatingLanguageCodes = self->_simulatingLanguageCodes;
      self->_simulatingLanguageCodes = v7;

      v5 = v9;
    }
  }
LABEL_6:

}

- (id)simulatingLanguageCodes
{
  NSArray *v3;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
    v3 = self->_simulatingLanguageCodes;
  else
    v3 = 0;
  return v3;
}

- (NSString)currentKeyboard
{
  return self->_currentKeyboard;
}

- (NSString)primaryLanguageCode
{
  return self->_primaryLanguageCode;
}

- (NSDictionary)languageCodeOverrides
{
  return self->_languageCodeOverrides;
}

- (void)setLanguageCodeOverrides:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)wasLanguageToggled
{
  return self->_languageToggled;
}

- (NSString)prevMessageLanguage
{
  return self->_prevMessageLanguage;
}

- (NSString)globalLastUsedKeyboard
{
  return self->_globalLastUsedKeyboard;
}

- (NSArray)multiLingualKeyboardLanguages
{
  return self->_multiLingualKeyboardLanguages;
}

- (NSArray)keyboardConvoRecentMessages
{
  return self->_keyboardConvoRecentMessages;
}

- (NSArray)dictationLanguages
{
  return self->_dictationLanguages;
}

- (NSDictionary)keyboardConversationLanguagePriors
{
  return self->_keyboardConversationLanguagePriors;
}

- (NSDictionary)keyboardGlobalLanguagePriors
{
  return self->_keyboardGlobalLanguagePriors;
}

- (NSNumber)dictationInputOrigin
{
  return self->_dictationInputOrigin;
}

- (void)setDictationInputOrigin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationInputOrigin, 0);
  objc_storeStrong((id *)&self->_keyboardGlobalLanguagePriors, 0);
  objc_storeStrong((id *)&self->_keyboardConversationLanguagePriors, 0);
  objc_storeStrong((id *)&self->_dictationLanguages, 0);
  objc_storeStrong((id *)&self->_keyboardConvoRecentMessages, 0);
  objc_storeStrong((id *)&self->_multiLingualKeyboardLanguages, 0);
  objc_storeStrong((id *)&self->_globalLastUsedKeyboard, 0);
  objc_storeStrong((id *)&self->_prevMessageLanguage, 0);
  objc_storeStrong((id *)&self->_languageCodeOverrides, 0);
  objc_storeStrong((id *)&self->_primaryLanguageCode, 0);
  objc_storeStrong((id *)&self->_currentKeyboard, 0);
  objc_storeStrong((id *)&self->_dictationLanguageMappingCache, 0);
  objc_storeStrong((id *)&self->_finalDictationLanguages, 0);
  objc_storeStrong((id *)&self->_simulatingLanguageCodes, 0);
  objc_storeStrong((id *)&self->_lidUserContext, 0);
}

void __68__AFLanguageDetectionUserContext_priorsByReplacingKeyboardLanguage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  BOOL v7;
  float v8;
  float v9;
  float v10;
  double v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend(v5, "floatValue");
    v9 = v8;
    objc_msgSend(v6, "floatValue");
    *(float *)&v11 = v9 + v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v13);

}

void __73__AFLanguageDetectionUserContext_getSiriDictationLanguagesFromLanguages___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userContextLanguageCodeForKeyboardLangauge:overrideLanguageCode:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v3, v4);

}

+ (id)defaultContextWithPrimaryLanguage:(id)a3
{
  id v3;
  AFLanguageDetectionUserContext *v4;
  AFLanguageDetectionUserContext *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(AFLanguageDetectionUserContext);
  v5 = v4;
  if (v3)
  {
    -[AFLanguageDetectionUserContext setPrimaryLanguageCode:](v4, "setPrimaryLanguageCode:", v3);
    -[AFLanguageDetectionUserContext primaryLanguageCode](v5, "primaryLanguageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFLanguageDetectionUserContext setDictationLanguages:](v5, "setDictationLanguages:", v7);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
