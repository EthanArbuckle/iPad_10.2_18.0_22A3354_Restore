@implementation HFSiriLanguageOptionsManager

- (HFSiriLanguageOptionsManager)initWithSettingsController:(id)a3 sourceItem:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HFSiriLanguageOptionsManager *v13;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HFSiriLanguageOptionsManager initWithSettingsController:accessoryIdentifier:home:](self, "initWithSettingsController:accessoryIdentifier:home:", v9, v12, v8);

  return v13;
}

- (HFSiriLanguageOptionsManager)initWithSettingsController:(id)a3 accessoryIdentifier:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFSiriLanguageOptionsManager *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSHashTable *observers;
  NAFuture *v17;
  NAFuture *availableLanguagesFuture;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HFSiriLanguageOptionsManager;
  v12 = -[HFSiriLanguageOptionsManager init](&v20, sel_init);
  if (v12)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessorySettingsDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:", v12);

    objc_storeStrong((id *)&v12->_settingsController, a3);
    objc_storeStrong((id *)&v12->_home, a5);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v15 = objc_claimAutoreleasedReturnValue();
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v15;

    objc_storeStrong((id *)&v12->_accessoryIdentifier, a4);
    v17 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    availableLanguagesFuture = v12->_availableLanguagesFuture;
    v12->_availableLanguagesFuture = v17;

    -[HFSiriLanguageOptionsManager _fetchAvailableLanguagesAndGenerateOptions](v12, "_fetchAvailableLanguagesAndGenerateOptions");
    -[HFSiriLanguageOptionsManager _subscribeToSiriLanguageSettings](v12, "_subscribeToSiriLanguageSettings");
  }

  return v12;
}

- (id)availableSiriLanguageOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFSiriLanguageOptionsManager availableLanguageOptions](self, "availableLanguageOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D519C0];
    -[HFSiriLanguageOptionsManager availableLanguageOptions](self, "availableLanguageOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFSiriLanguageOptionsManager availableLanguagesFuture](self, "availableLanguagesFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)preferredRecognitionLanguageOptionsForSelectedOption
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HFSiriLanguageOptionsManager availableLanguageOptions](self, "availableLanguageOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "voiceNameWithDefaultFallback");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "outputLanguage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (!v13)
        {
          objc_msgSend(v11, "stringByAppendingString:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  -[HFSiriLanguageOptionsManager availableSiriLanguageOptions](self, "availableSiriLanguageOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__HFSiriLanguageOptionsManager_preferredRecognitionLanguageOptionsForSelectedOption__block_invoke;
  v19[3] = &unk_1EA736118;
  v19[4] = self;
  v20 = v3;
  v16 = v3;
  objc_msgSend(v15, "flatMap:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __84__HFSiriLanguageOptionsManager_preferredRecognitionLanguageOptionsForSelectedOption__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  uint64_t v11;
  id v12;

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __84__HFSiriLanguageOptionsManager_preferredRecognitionLanguageOptionsForSelectedOption__block_invoke_2;
  v10 = &unk_1EA72A550;
  v3 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  objc_msgSend(a2, "na_filter:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4, v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __84__HFSiriLanguageOptionsManager_preferredRecognitionLanguageOptionsForSelectedOption__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedLanguageOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputVoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recognitionLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceSimilarToVoice:inSiriSessionLanguage:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12
    || (objc_msgSend(v10, "stringByAppendingString:", v9),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v13),
        v13,
        !v14))
  {
    HFLogForCategory(0x39uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "recognitionLanguage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v22;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Most similar voice %@ in recognition language %@ not available. Using default for recognition language", (uint8_t *)&v24, 0x16u);

    }
    v20 = objc_msgSend(v3, "isDefaultVoiceForRecognitionLanguage");
  }
  else
  {
    objc_msgSend(v3, "voiceNameWithDefaultFallback");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if (v17)
    {
      HFLogForCategory(0x39uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "selectedLanguageOption");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v3;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Option %@ most similar to current selected option %@", (uint8_t *)&v24, 0x16u);

      }
      v20 = 1;
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (id)preferredOutputVoiceAccentOptionsForSelectedOption
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFSiriLanguageOptionsManager availableSiriLanguageOptions](self, "availableSiriLanguageOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke;
  v6[3] = &unk_1EA736180;
  v6[4] = self;
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v22 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "recognitionLanguage", v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "selectedLanguageOption");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recognitionLanguage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if (v13)
        {
          objc_msgSend(v9, "outputLanguage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "na_objectForKey:withDefaultValue:", v14, &__block_literal_global_124);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  v16 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v22, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_3;
  v23[3] = &unk_1EA72A620;
  v23[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v17, "na_map:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

id __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_4;
  v6[3] = &unk_1EA72A578;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_9_10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "anyObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

uint64_t __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CFE900];
  v4 = a2;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedLanguageOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputVoice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voiceSimilarToVoice:inSiriSessionLanguage:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "voiceNameWithDefaultFallback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  return v12;
}

uint64_t __82__HFSiriLanguageOptionsManager_preferredOutputVoiceAccentOptionsForSelectedOption__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDefaultVoiceForRecognitionLanguage");
}

- (id)preferredOutputVoiceOptionsForSelectedOption
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFSiriLanguageOptionsManager availableSiriLanguageOptions](self, "availableSiriLanguageOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__HFSiriLanguageOptionsManager_preferredOutputVoiceOptionsForSelectedOption__block_invoke;
  v6[3] = &unk_1EA736180;
  v6[4] = self;
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __76__HFSiriLanguageOptionsManager_preferredOutputVoiceOptionsForSelectedOption__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__HFSiriLanguageOptionsManager_preferredOutputVoiceOptionsForSelectedOption__block_invoke_2;
  v5[3] = &unk_1EA72A578;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "na_filter:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __76__HFSiriLanguageOptionsManager_preferredOutputVoiceOptionsForSelectedOption__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "recognitionLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedLanguageOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recognitionLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v6))
  {
    objc_msgSend(v3, "outputLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "selectedLanguageOption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outputLanguage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFSiriLanguageOptionsManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFSiriLanguageOptionsManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)updateSelectedLanguageOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFSiriLanguageOptionsManager accessoryIdentifier](self, "accessoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOptionsManager updateSelectedLanguageOption:accessoryIdentifier:](self, "updateSelectedLanguageOption:accessoryIdentifier:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)updateSelectedLanguageOption:(id)a3 accessoryIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  HFSiriLanguageOptionsManager *v16;
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  -[HFSiriLanguageOptionsManager availableSiriLanguageOptions](self, "availableSiriLanguageOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke;
  v14[3] = &unk_1EA7361F8;
  v15 = v7;
  v16 = self;
  v17 = v8;
  v18 = a2;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v24;
  int8x16_t v25;
  _QWORD v26[4];
  int8x16_t v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__18;
  v39 = __Block_byref_object_dispose__18;
  objc_msgSend(*(id *)(a1 + 32), "settingLanguageValue");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  if (v36[5])
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 32), "allSerializedRepresentations");
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke_11;
  v32[3] = &unk_1EA7361A8;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  v34 = &v35;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v32);

  if (v36[5])
  {
LABEL_3:
    HFLogForCategory(0x25uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "accessoryIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v42 = v8;
      v43 = 2112;
      v44 = v9;
      v45 = 2112;
      v46 = v11;
      v47 = 2112;
      v48 = v12;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Now calling updateAccessorySettingWithHomeIdentifier: for HomeID %@ Accessory ID %@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "settingsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:settingValue:", v15, *(_QWORD *)(a1 + 48), HFSiriLanguageSettingKeyPath, v36[5]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke_14;
    v26[3] = &unk_1EA7361D0;
    v25 = *(int8x16_t *)(a1 + 32);
    v17 = (id)v25.i64[0];
    v27 = vextq_s8(v25, v25, 8uLL);
    v19 = *(void **)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    v30 = &v35;
    v31 = v18;
    v28 = v19;
    v20 = v4;
    v29 = v20;
    v21 = (id)objc_msgSend(v16, "addCompletionBlock:", v26);
    v22 = v20;

  }
  else
  {
    v24 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "futureWithError:", v16);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v35, 8);
  return v22;
}

void __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke_11(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v12 = v5;
  objc_msgSend(v5, "serializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObject:", v7);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v12, "settingLanguageValue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a3 = 1;
  }

}

void __81__HFSiriLanguageOptionsManager_updateSelectedLanguageOption_accessoryIdentifier___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedLanguageOption:", *(_QWORD *)(a1 + 40));
    HFLogForCategory(0x25uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");
      *(_DWORD *)buf = 138412802;
      v31 = v6;
      v32 = 2112;
      v33 = v7;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ self.observers: %@", buf, 0x20u);

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            HFLogForCategory(0x25uLL);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = *(_QWORD *)(a1 + 32);
              NSStringFromSelector(*(SEL *)(a1 + 72));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138412802;
              v31 = v18;
              v32 = 2112;
              v33 = v19;
              v34 = 2112;
              v35 = v20;
              _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying observers: %@", buf, 0x20u);

            }
            objc_msgSend(v16, "siriLanguageOptionsManager:selectedLanguageOptionDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accessorySettingsDataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateSettingValue:forKeyPath:accessoryIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), HFSiriLanguageSettingKeyPath, *(_QWORD *)(a1 + 48));

    v4 = 0;
  }
  v23 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4 == 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "finishWithResult:error:", v24, v4);

}

- (void)_fetchAvailableLanguagesAndGenerateOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HFSiriLanguageOptionsManager _settingKeyPaths](self, "_settingKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessorySettingsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOptionsManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOptionsManager accessoryIdentifier](self, "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_defaultSettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:", v7, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x25uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[HFSiriLanguageOptionsManager accessoryIdentifier](self, "accessoryIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v11;
    v14 = 2112;
    v15 = v3;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "defaultSettings for Siri language option for accessoryUUID [%@] - keyPaths [%@] = [%@]", (uint8_t *)&v12, 0x20u);

  }
  -[HFSiriLanguageOptionsManager _updateSettingsAndNotifyObservers:](self, "_updateSettingsAndNotifyObservers:", v9);

}

- (void)_subscribeToSiriLanguageSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessorySettingsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOptionsManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOptionsManager accessoryIdentifier](self, "accessoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOptionsManager _settingKeyPaths](self, "_settingKeyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__HFSiriLanguageOptionsManager__subscribeToSiriLanguageSettings__block_invoke;
  v9[3] = &unk_1EA726968;
  v9[4] = self;
  objc_msgSend(v4, "hf_subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:", v6, v7, v8, 0, v9);

}

void __64__HFSiriLanguageOptionsManager__subscribeToSiriLanguageSettings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory(0x25uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "_settingKeyPaths");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessoryIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Error subscribing to keyPaths [%@] for accessoryIdentifier [%@] - Error - [%@]", (uint8_t *)&v7, 0x20u);

    }
  }

}

- (void)_updateSettingsAndNotifyObservers:(id)a3
{
  HFSiriLanguageOption *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  HFSiriLanguageOption *v16;
  void *v17;
  void *v18;
  void *v19;
  HFSiriLanguageOption *v20;
  HFSiriLanguageOption *v21;
  int v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HFSiriLanguageOption *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  HFSiriLanguageOption *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  HFSiriLanguageOption *obj;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  HFSiriLanguageOption *v68;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  HFSiriLanguageOptionsManager *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  HFSiriLanguageOption *v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v4 = (HFSiriLanguageOption *)a3;
  HFLogForCategory(0x25uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSiriLanguageOptionsManager accessoryIdentifier](self, "accessoryIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v86 = self;
    v87 = 2112;
    v88 = v60;
    v89 = 2112;
    v90 = v4;
    v91 = 2112;
    v92 = v61;
    _os_log_debug_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEBUG, "%@:%@ Updating language settings and notifying observers: %@ for accessoryID [%@]", buf, 0x2Au);

  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v4;
  v6 = -[HFSiriLanguageOption countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  if (v6)
  {
    v7 = v6;
    v64 = *(_QWORD *)v79;
    do
    {
      v8 = 0;
      v62 = v7;
      do
      {
        if (*(_QWORD *)v79 != v64)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v8);
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v11 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        objc_opt_class();
        v14 = v11;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        v68 = v16;
        if (v13)
        {
          v65 = v8;
          v17 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v13, "na_map:", &__block_literal_global_23_2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setWithArray:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[HFSiriLanguageOptionsManager availableLanguageOptions](self, "availableLanguageOptions");
          v20 = (HFSiriLanguageOption *)(id)objc_claimAutoreleasedReturnValue();
          v21 = v19;
          if (v20 == v21)
          {
            v22 = 1;
          }
          else if (v20)
          {
            v22 = -[HFSiriLanguageOption isEqual:](v20, "isEqual:", v21);
          }
          else
          {
            v22 = 0;
          }

          -[HFSiriLanguageOptionsManager setAvailableLanguageOptions:](self, "setAvailableLanguageOptions:", v21);
          HFLogForCategory(0x25uLL);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v86 = self;
            v87 = 2112;
            v88 = v51;
            v89 = 1024;
            LODWORD(v90) = v22 ^ 1;
            v7 = v62;
            _os_log_debug_impl(&dword_1DD34E000, v39, OS_LOG_TYPE_DEBUG, "%@:%@ Available languages changed: %{BOOL}d", buf, 0x1Cu);

          }
          v66 = v14;
          v67 = v13;

          if ((v22 & 1) == 0)
          {
            HFLogForCategory(0x25uLL);
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              -[HFSiriLanguageOptionsManager observers](self, "observers");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = (HFSiriLanguageOption *)objc_msgSend(v53, "copy");
              *(_DWORD *)buf = 138412802;
              v86 = self;
              v87 = 2112;
              v88 = v52;
              v89 = 2112;
              v90 = v54;
              _os_log_debug_impl(&dword_1DD34E000, v40, OS_LOG_TYPE_DEBUG, "%@:%@ self.observers: %@", buf, 0x20u);

            }
            v76 = 0u;
            v77 = 0u;
            v74 = 0u;
            v75 = 0u;
            -[HFSiriLanguageOptionsManager observers](self, "observers");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(v41, "copy");

            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v75;
              do
              {
                for (i = 0; i != v44; ++i)
                {
                  if (*(_QWORD *)v75 != v45)
                    objc_enumerationMutation(v42);
                  v47 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    HFLogForCategory(0x25uLL);
                    v48 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                    {
                      NSStringFromSelector(a2);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v86 = self;
                      v87 = 2112;
                      v88 = v49;
                      v89 = 2112;
                      v90 = v21;
                      _os_log_debug_impl(&dword_1DD34E000, v48, OS_LOG_TYPE_DEBUG, "%@:%@ Notifying observers: %@", buf, 0x20u);

                    }
                    objc_msgSend(v47, "siriLanguageOptionsManager:availableLanguageOptionsDidChange:", self, v21);
                  }
                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
              }
              while (v44);
            }

            v7 = v62;
          }
          -[HFSiriLanguageOptionsManager availableLanguagesFuture](self, "availableLanguagesFuture");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFSiriLanguageOptionsManager availableLanguageOptions](self, "availableLanguageOptions");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "finishWithResult:", v50);

          goto LABEL_57;
        }
        if (v16)
        {
          objc_msgSend(v9, "keyPath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", HFSiriLanguageSettingKeyPath);

          if (v24)
          {
            HFLogForCategory(0x25uLL);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v86 = self;
              v87 = 2112;
              v88 = v55;
              v89 = 2112;
              v90 = v68;
              _os_log_debug_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_DEBUG, "%@:%@ siriLanguageSelection: %@", buf, 0x20u);

            }
            -[HFSiriLanguageOptionsManager selectedLanguageOption](self, "selectedLanguageOption");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "settingLanguageValue");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqual:", v68);

            if ((v28 & 1) == 0)
            {
              v66 = v14;
              v67 = 0;
              v21 = -[HFSiriLanguageOption initWithHomeKitSettingLanguageValue:]([HFSiriLanguageOption alloc], "initWithHomeKitSettingLanguageValue:", v68);
              -[HFSiriLanguageOptionsManager setSelectedLanguageOption:](self, "setSelectedLanguageOption:", v21);
              HFLogForCategory(0x25uLL);
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                NSStringFromSelector(a2);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                -[HFSiriLanguageOptionsManager observers](self, "observers");
                v57 = v8;
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = (HFSiriLanguageOption *)objc_msgSend(v58, "copy");
                *(_DWORD *)buf = 138412802;
                v86 = self;
                v87 = 2112;
                v88 = v56;
                v89 = 2112;
                v90 = v59;
                _os_log_debug_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_DEBUG, "%@:%@ self.observers: %@", buf, 0x20u);

                v8 = v57;
              }

              v72 = 0u;
              v73 = 0u;
              v70 = 0u;
              v71 = 0u;
              -[HFSiriLanguageOptionsManager observers](self, "observers");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (void *)objc_msgSend(v30, "copy");

              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
              if (v32)
              {
                v33 = v32;
                v65 = v8;
                v34 = *(_QWORD *)v71;
                do
                {
                  for (j = 0; j != v33; ++j)
                  {
                    if (*(_QWORD *)v71 != v34)
                      objc_enumerationMutation(v31);
                    v36 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                    {
                      HFLogForCategory(0x25uLL);
                      v37 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                      {
                        NSStringFromSelector(a2);
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        v86 = self;
                        v87 = 2112;
                        v88 = v38;
                        v89 = 2112;
                        v90 = v21;
                        _os_log_debug_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_DEBUG, "%@:%@ Notifying observers: %@", buf, 0x20u);

                      }
                      objc_msgSend(v36, "siriLanguageOptionsManager:selectedLanguageOptionDidChange:", self, v21);
                    }
                  }
                  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
                }
                while (v33);
                v7 = v62;
LABEL_57:
                v8 = v65;
              }

              v14 = v66;
              v13 = v67;
            }
          }
        }

        ++v8;
      }
      while (v8 != v7);
      v7 = -[HFSiriLanguageOption countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    }
    while (v7);
  }

}

HFSiriLanguageOption *__66__HFSiriLanguageOptionsManager__updateSettingsAndNotifyObservers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HFSiriLanguageOption *v3;

  v2 = a2;
  v3 = -[HFSiriLanguageOption initWithHomeKitSettingLanguageValue:]([HFSiriLanguageOption alloc], "initWithHomeKitSettingLanguageValue:", v2);

  return v3;
}

- (id)_settingKeyPaths
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = HFSiriAvailableLanguagesSettingKeyPath;
  v3[1] = HFSiriLanguageSettingKeyPath;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  BOOL v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("root.siri.recognitionLanguage"));

  if (v6)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    -[HFSiriLanguageOptionsManager preferredRecognitionLanguageOptionsForSelectedOption](self, "preferredRecognitionLanguageOptionsForSelectedOption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke;
    v19[3] = &unk_1EA736260;
    v19[4] = &v20;
    v8 = (id)objc_msgSend(v7, "flatMap:", v19);
  }
  else
  {
    objc_msgSend(v4, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("root.siri.outputVoice"));

    if (!v10)
    {
      v15 = 1;
      goto LABEL_7;
    }
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    -[HFSiriLanguageOptionsManager preferredOutputVoiceOptionsForSelectedOption](self, "preferredOutputVoiceOptionsForSelectedOption");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke_2;
    v18[3] = &unk_1EA736260;
    v18[4] = &v20;
    v13 = (id)objc_msgSend(v11, "flatMap:", v18);

    -[HFSiriLanguageOptionsManager preferredOutputVoiceAccentOptionsForSelectedOption](self, "preferredOutputVoiceAccentOptionsForSelectedOption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke_3;
    v17[3] = &unk_1EA736260;
    v17[4] = &v20;
    v14 = (id)objc_msgSend(v7, "flatMap:", v17);
  }

  v15 = *((_BYTE *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);
LABEL_7:

  return v15;
}

uint64_t __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (unint64_t)objc_msgSend(a2, "count") > 1;
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

uint64_t __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke_2(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (unint64_t)objc_msgSend(a2, "count") > 1;
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

uint64_t __57__HFSiriLanguageOptionsManager_shouldShowSettingsEntity___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  BOOL v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    v3 = 1;
  }
  else
  {
    v3 = (unint64_t)objc_msgSend(a2, "count") > 1;
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = v3;
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[HFSiriLanguageOptionsManager accessoryIdentifier](self, "accessoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);

  if (v8)
    -[HFSiriLanguageOptionsManager _updateSettingsAndNotifyObservers:](self, "_updateSettingsAndNotifyObservers:", v9);

}

- (HFSiriLanguageOption)selectedLanguageOption
{
  return self->_selectedLanguageOption;
}

- (void)setSelectedLanguageOption:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLanguageOption, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSUUID)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsController, a3);
}

- (NSSet)availableLanguageOptions
{
  return self->_availableLanguageOptions;
}

- (void)setAvailableLanguageOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NAFuture)availableLanguagesFuture
{
  return self->_availableLanguagesFuture;
}

- (void)setAvailableLanguagesFuture:(id)a3
{
  objc_storeStrong((id *)&self->_availableLanguagesFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableLanguagesFuture, 0);
  objc_storeStrong((id *)&self->_availableLanguageOptions, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_selectedLanguageOption, 0);
}

@end
