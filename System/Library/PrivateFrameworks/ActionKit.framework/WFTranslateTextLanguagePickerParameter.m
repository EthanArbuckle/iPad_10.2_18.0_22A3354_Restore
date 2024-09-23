@implementation WFTranslateTextLanguagePickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFTranslateTextLanguagePickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFTranslateTextLanguagePickerParameter *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  WFTranslateTextLanguagePickerParameter *v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFTranslateTextLanguagePickerParameter;
  v5 = -[WFTranslateTextLanguagePickerParameter initWithDefinition:](&v15, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("LanguageDetection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v17 = "WFEnforceClass";
        v18 = 2114;
        v19 = v8;
        v20 = 2114;
        v21 = v11;
        v22 = 2114;
        v23 = v7;
        v12 = v11;
        _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = v8;
    }

    v5->_supportsLanguageDetection = objc_msgSend(v9, "BOOLValue");
    v13 = v5;
  }

  return v5;
}

- (void)wasAddedToWorkflow
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTranslateTextLanguagePickerParameter;
  -[WFTranslateTextLanguagePickerParameter wasAddedToWorkflow](&v4, sel_wasAddedToWorkflow);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke;
  v3[3] = &unk_24F8BAC58;
  v3[4] = self;
  -[WFTranslateTextLanguagePickerParameter getAvailableLanguagesWithCompletionHandler:](self, "getAvailableLanguagesWithCompletionHandler:", v3);
}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFTranslateTextLanguagePickerParameter;
  -[WFTranslateTextLanguagePickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
}

- (id)defaultSerializedRepresentation
{
  const __CFString *v2;

  if (-[WFTranslateTextLanguagePickerParameter supportsLanguageDetection](self, "supportsLanguageDetection"))
    v2 = CFSTR("Detect Language");
  else
    v2 = CFSTR("en_US");
  return +[WFStringSubstitutableState serializedRepresentationFromValue:](WFLanguageSubstitutableState, "serializedRepresentationFromValue:", v2);
}

- (NSArray)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  void *v13;
  WFLanguageSubstitutableState *v14;
  uint64_t v15;
  NSArray *v16;
  NSArray *v17;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectOfClasses:forKey:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v17 = 0;
      return v17;
    }
    objc_msgSend(v10, "keysSortedByValueUsingComparator:", &__block_literal_global_47162);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "if_compactMap:", &__block_literal_global_130);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (-[WFTranslateTextLanguagePickerParameter supportsLanguageDetection](self, "supportsLanguageDetection"))
    {
      v13 = (void *)-[NSArray mutableCopy](v12, "mutableCopy");
      v14 = -[WFVariableSubstitutableParameterState initWithValue:]([WFLanguageSubstitutableState alloc], "initWithValue:", CFSTR("Detect Language"));
      objc_msgSend(v13, "insertObject:atIndex:", v14, 0);

      v15 = objc_msgSend(v13, "copy");
      v12 = (NSArray *)v15;
    }
    v16 = self->_possibleStates;
    self->_possibleStates = v12;

    possibleStates = self->_possibleStates;
  }
  v17 = possibleStates;
  return v17;
}

- (id)possibleStatesForLocalization
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectOfClasses:forKey:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Detect Language")) & 1) != 0)
    WFLocalizedString(CFSTR("Detected Language"));
  else
    objc_msgSend(v10, "objectForKey:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)getAvailableLanguagesWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)get_LTTranslatorClass_softClass_47136;
  v14 = get_LTTranslatorClass_softClass_47136;
  v5 = MEMORY[0x24BDAC760];
  if (!get_LTTranslatorClass_softClass_47136)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __get_LTTranslatorClass_block_invoke_47137;
    v10[3] = &unk_24F8BB430;
    v10[4] = &v11;
    __get_LTTranslatorClass_block_invoke_47137((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __85__WFTranslateTextLanguagePickerParameter_getAvailableLanguagesWithCompletionHandler___block_invoke;
  v8[3] = &unk_24F8BAD00;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "availableLocalePairsForTask:completion:", 5, v8);

}

- (BOOL)supportsLanguageDetection
{
  return self->_supportsLanguageDetection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

void __85__WFTranslateTextLanguagePickerParameter_getAvailableLanguagesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "sourceLocale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        objc_msgSend(v10, "targetLocale");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v19, "wf_displayName", (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localeIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v20, v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

  v22 = *(_QWORD *)(a1 + 32);
  v23 = (void *)objc_msgSend(v13, "copy");
  (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

}

WFLanguageSubstitutableState *__56__WFTranslateTextLanguagePickerParameter_possibleStates__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFLanguageSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFLanguageSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

uint64_t __56__WFTranslateTextLanguagePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCaseInsensitiveCompare:");
}

void __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke_118;
    v8[3] = &unk_24F8BB638;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "setObject:forKey:completion:", v3, v6, v8);

  }
  else
  {
    getWFActionsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[WFTranslateTextLanguagePickerParameter wasAddedToWorkflow]_block_invoke";
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_ERROR, "%s Unable to get available languages for translation", buf, 0xCu);
    }

  }
}

void __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke_118(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke_2;
  block[3] = &unk_24F8BB638;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "possibleStatesDidChange");
}

@end
