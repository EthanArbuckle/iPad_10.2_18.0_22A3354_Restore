@implementation WFSpeakTextLanguagePickerParameter

- (WFSpeakTextLanguagePickerParameter)initWithDefinition:(id)a3
{
  WFSpeakTextLanguagePickerParameter *v3;
  WFSpeakTextLanguagePickerParameter *v4;
  WFSpeakTextLanguagePickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSpeakTextLanguagePickerParameter;
  v3 = -[WFSpeakTextLanguagePickerParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (id)defaultLanguageCode
{
  void *v2;
  void *v3;

  +[WFSpeechSynthesisVoice defaultVoiceForLanguageCode:](WFSpeechSynthesisVoice, "defaultVoiceForLanguageCode:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSArray *v11;
  NSArray *possibleStates;
  void *v13;
  void *v14;
  void (**v15)(id, void *, _QWORD);
  _QWORD v16[4];
  id v17;

  v15 = (void (**)(id, void *, _QWORD))a5;
  if (!self->_possibleStates)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFSpeechSynthesisVoice availableLanguageCodes](WFSpeechSynthesisVoice, "availableLanguageCodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __100__WFSpeakTextLanguagePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
    v16[3] = &unk_24F8B83E8;
    v17 = v6;
    v9 = v6;
    objc_msgSend(v8, "sortedArrayUsingComparator:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "if_map:", &__block_literal_global_40561);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    possibleStates = self->_possibleStates;
    self->_possibleStates = v11;

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9ED0]), "initWithItems:", self->_possibleStates);
    v15[2](v15, v13, 0);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9ED0]), "initWithItems:", self->_possibleStates);
  v15[2](v15, v14, 0);

}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForLocaleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "capitalizedStringWithLocale:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = v7;
  }
  else
  {
    getWFActionsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315650;
      v12 = "-[WFSpeakTextLanguagePickerParameter enumeration:localizedLabelForPossibleState:]";
      v13 = 2114;
      v14 = v4;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_FAULT, "%s getting localized string for language code %{public}@ failed, current locale: %{public}@", (uint8_t *)&v11, 0x20u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *, _QWORD))a4;
  +[WFSpeechSynthesisVoice currentLanguageCode](WFSpeechSynthesisVoice, "currentLanguageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC40C8]), "initWithValue:", v6);
  -[WFSpeakTextLanguagePickerParameter possibleStates](self, "possibleStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    objc_msgSend(v7, "serializedRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v10, 0);
  }
  else
  {
    v24 = v7;
    v25 = v6;
    getWFActionsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[WFSpeakTextLanguagePickerParameter loadDefaultSerializedRepresentationForEnumeration:completionHandler:]";
      _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_DEFAULT, "%s [Speak Text] Unable to get default language from -[AVSpeechSynthesisVoice currentLanguageCode]", buf, 0xCu);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC40C8]), "initWithValue:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v16));
          -[WFSpeakTextLanguagePickerParameter possibleStates](self, "possibleStates");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "containsObject:", v17);

          if (v19)
          {
            objc_msgSend(v17, "serializedRepresentation");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v5[2](v5, v22, 0);

            v7 = v24;
            v6 = v25;
            goto LABEL_21;
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v14)
          continue;
        break;
      }
    }

    getWFActionsLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[WFSpeakTextLanguagePickerParameter loadDefaultSerializedRepresentationForEnumeration:completionHandler:]";
      _os_log_impl(&dword_22D353000, v20, OS_LOG_TYPE_DEFAULT, "%s [Speak Text] Unable to get default language from -[NSLocale preferredLanguages]", buf, 0xCu);
    }

    -[WFSpeakTextLanguagePickerParameter defaultLanguageCode](self, "defaultLanguageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;
    v6 = v25;
    if (objc_msgSend(v10, "length"))
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC40C8]), "initWithValue:", v10);
    else
      v21 = 0;
    objc_msgSend(v21, "serializedRepresentation", v24, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v23, 0);

  }
LABEL_21:

}

- (id)possibleStates
{
  return self->_possibleStates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

uint64_t __100__WFSpeakTextLanguagePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "localizedStringForLocaleIdentifier:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capitalizedStringWithLocale:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "localizedStringForLocaleIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "capitalizedStringWithLocale:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "localizedStandardCompare:", v10);
  return v11;
}

id __100__WFSpeakTextLanguagePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

@end
