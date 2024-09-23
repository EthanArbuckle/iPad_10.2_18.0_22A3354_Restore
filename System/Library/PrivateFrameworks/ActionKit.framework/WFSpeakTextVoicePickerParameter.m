@implementation WFSpeakTextVoicePickerParameter

- (WFSpeakTextVoicePickerParameter)initWithDefinition:(id)a3
{
  WFSpeakTextVoicePickerParameter *v3;
  WFSpeakTextVoicePickerParameter *v4;
  WFSpeakTextVoicePickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSpeakTextVoicePickerParameter;
  v3 = -[WFSpeakTextVoicePickerParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (void)setAction:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_action);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_action);
    objc_msgSend(v5, "removeEventObserver:", self);

    v6 = objc_storeWeak((id *)&self->_action, obj);
    objc_msgSend(obj, "addEventObserver:", self);

  }
}

- (id)selectedLanguageCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFSpeakTextVoicePickerParameter definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WFSpeakTextLanguageKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSpeakTextVoicePickerParameter action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parameterStateForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isHidden
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") < 2;

  return v5;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a4;
  -[WFSpeakTextVoicePickerParameter definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("WFSpeakTextLanguageKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    -[WFDynamicEnumerationParameter reloadPossibleStates](self, "reloadPossibleStates");
    -[WFDynamicEnumerationParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
  }
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  -[WFSpeakTextVoicePickerParameter selectedLanguageCode](self, "selectedLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFSpeechSynthesisVoice defaultVoiceForLanguageCode:](WFSpeechSynthesisVoice, "defaultVoiceForLanguageCode:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = objc_alloc(MEMORY[0x24BEC40C8]);
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithValue:", v10);
    v12 = objc_msgSend(v8, "containsObject:", v11);

    if (!v12)
    {
      (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
      goto LABEL_7;
    }
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v15 + 2))(v15, v13, 0);
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v15 + 2))(v15, v14, 0);

  }
LABEL_7:

}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFSpeechSynthesisVoice voiceForIdentifier:](WFSpeechSynthesisVoice, "voiceForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[2];
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, _QWORD))a5;
  -[WFSpeakTextVoicePickerParameter selectedLanguageCode](self, "selectedLanguageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v33 = v7;
    +[WFSpeechSynthesisVoice voicesForLanguageCode:](WFSpeechSynthesisVoice, "voicesForLanguageCode:", v7);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          v14 = v9;
          v15 = v8;
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v17 = objc_alloc(MEMORY[0x24BEC40C8]);
          objc_msgSend(v16, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithValue:", v18);

          objc_msgSend(v16, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v18) = objc_msgSend(v20, "hasPrefix:", CFSTR("com.apple.ttsbundle.gryphon"));

          v21 = (_DWORD)v18 == 0;
          v8 = v15;
          v9 = v14;
          if (v21)
            v22 = v14;
          else
            v22 = v8;
          objc_msgSend(v22, "addObject:", v19);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      v23 = objc_alloc(MEMORY[0x24BDD9ED8]);
      WFLocalizedString(CFSTR("Siri"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithTitle:items:", v24, v8);

      v26 = objc_alloc(MEMORY[0x24BDD9ED8]);
      WFLocalizedString(CFSTR("Other"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithTitle:items:", v27, v9);

      v29 = objc_alloc(MEMORY[0x24BDD9ED0]);
      v39[0] = v25;
      v39[1] = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "initWithSections:", v30);
      v6[2](v6, v31, 0);

    }
    else
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9ED0]), "initWithItems:", v9);
      v6[2](v6, v25, 0);
    }

    v7 = v33;
  }
  else
  {
    getWFActionsLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[WFSpeakTextVoicePickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]";
      _os_log_impl(&dword_22D353000, v32, OS_LOG_TYPE_DEBUG, "%s No language code.", buf, 0xCu);
    }

    v6[2](v6, 0, 0);
  }

}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
}

@end
