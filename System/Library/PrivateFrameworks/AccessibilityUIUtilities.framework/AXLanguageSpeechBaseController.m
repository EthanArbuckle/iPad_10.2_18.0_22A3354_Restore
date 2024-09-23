@implementation AXLanguageSpeechBaseController

- (AXLanguageSpeechBaseController)init
{
  AXLanguageSpeechBaseController *v2;
  AXSpeechSettingsModelController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXLanguageSpeechBaseController;
  v2 = -[AXUISettingsSetupCapableListController init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AXSpeechSettingsModelController);
    -[AXLanguageSpeechBaseController setSpeechModelController:](v2, "setSpeechModelController:", v3);

  }
  return v2;
}

- (id)specifiersForLanguagesAndAccents
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!AXDeviceSupportsVoiceBankingSpeech()
    || (v3 = (void *)MEMORY[0x1E0D804E8],
        AXUILocalizedStringForKey(CFSTR("SYSTEM_VOICES_TITLE")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "groupSpecifierWithName:", v4),
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v5;
  v27 = v2;
  objc_msgSend(v2, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourcesWithType:subType:", 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    v28 = *MEMORY[0x1E0D80868];
    v29 = *MEMORY[0x1E0D80990];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v12), "primaryLanguage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        AXCLanguageCanonicalFormToGeneralLanguage();
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(v31, "dialectForLanguageID:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0D804E8];
          objc_msgSend(v16, "languageNameInCurrentLocale");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, 0, sel__selectedDialect_, objc_opt_class(), 2, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "languageNameAndLocaleInCurrentLocale");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setProperty:forKey:", v20, v29);

          objc_msgSend(v19, "setProperty:forKey:", v14, v28);
          objc_msgSend(v16, "langMap");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setProperty:forKey:", v21, CFSTR("kAXPSLangMapKey"));

          objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v14);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObjectsFromArray:", v22);

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __66__AXLanguageSpeechBaseController_specifiersForLanguagesAndAccents__block_invoke;
  v32[3] = &unk_1E76ABE08;
  v33 = v31;
  v23 = v31;
  objc_msgSend(v25, "sortUsingComparator:", v32);
  objc_msgSend(v27, "addObjectsFromArray:", v25);

  return v27;
}

uint64_t __66__AXLanguageSpeechBaseController_specifiersForLanguagesAndAccents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;

  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0D80868];
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x1E0D80868]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dialectForSystemLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "langMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generalLanguageID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
  {
    v13 = -1;
  }
  else
  {
    objc_msgSend(v6, "propertyForKey:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dialectForSystemLanguage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "langMap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "generalLanguageID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "isEqualToString:", v17);

    if ((v18 & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      objc_msgSend(v5, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v19, "localizedStandardCompare:", v20);

    }
  }

  return v13;
}

- (id)_selectedDialect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[AXLanguageSpeechBaseController showsSelectedVoiceVariantForLanguage](self, "showsSelectedVoiceVariantForLanguage"))
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("kAXPSLangMapKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLanguageSpeechBaseController speechModelController](self, "speechModelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLanguageSpeechBaseController speechSourceKey](self, "speechSourceKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "generalLanguageID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedVoiceIdentifierForSpeechSourceKey:languageCode:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXLanguageSpeechBaseController includeLocaleInSelectorDialog](self, "includeLocaleInSelectorDialog");
    AXVoiceNameForVoiceId();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)includeLocaleInSelectorDialog
{
  return 1;
}

- (AXSpeechSettingsModelController)speechModelController
{
  return self->_speechModelController;
}

- (void)setSpeechModelController:(id)a3
{
  objc_storeStrong((id *)&self->_speechModelController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechModelController, 0);
}

- (NSString)speechSourceKey
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0();
  return (NSString *)(id)*MEMORY[0x1E0CF37D8];
}

- (BOOL)showsSelectedVoiceVariantForLanguage
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

@end
