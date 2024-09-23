@implementation WFNoteGroupSubstituableState

+ (unint64_t)managedLevelForNotesAccounts
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t result;
  void *v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(MEMORY[0x24BE19570], "defaultProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v3 = (_QWORD *)getACAccountDataclassNotesSymbolLoc_ptr;
  v23 = getACAccountDataclassNotesSymbolLoc_ptr;
  v4 = MEMORY[0x24BDAC760];
  if (!getACAccountDataclassNotesSymbolLoc_ptr)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = (uint64_t)__getACAccountDataclassNotesSymbolLoc_block_invoke;
    v18 = &unk_24F8BB430;
    v19 = &v20;
    __getACAccountDataclassNotesSymbolLoc_block_invoke(&v15);
    v3 = (_QWORD *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (v3)
  {
    objc_msgSend(v2, "accountIdentifiersEnabledForDataclass:", *v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __60__WFNoteGroupSubstituableState_managedLevelForNotesAccounts__block_invoke;
    v13[3] = &unk_24F8B9220;
    v6 = v2;
    v14 = v6;
    objc_msgSend(v5, "if_compactMap:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = (uint64_t)&v15;
    v17 = 0x2020000000;
    LOBYTE(v18) = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    LOBYTE(v23) = 0;
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __60__WFNoteGroupSubstituableState_managedLevelForNotesAccounts__block_invoke_2;
    v12[3] = &unk_24F8B9248;
    v12[4] = &v15;
    v12[5] = &v20;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
    if (*(_BYTE *)(v16 + 24))
      v8 = 2 * (*((_BYTE *)v21 + 24) == 0);
    else
      v8 = *((unsigned __int8 *)v21 + 24);
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v15, 8);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getACAccountDataclassNotes(void)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("WFNoteGroupSubstituableState.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  WFEnforceClass(v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DisplayString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  WFEnforceClass(v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v19 = v18 == 0;
  else
    v19 = 1;
  if (v19)
  {
    v24.receiver = a1;
    v24.super_class = (Class)&OBJC_METACLASS___WFNoteGroupSubstituableState;
    objc_msgSendSuper2(&v24, sel_valueFromSerializedRepresentation_variableProvider_parameter_, v8, v9, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA1A0]), "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v18, v15, 0);
    WFNotesFolderLinkValueFromIntentsValue();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE600B0]), "initWithValue:indentationLevel:", v21, 0);

  }
  return v22;
}

uint64_t __60__WFNoteGroupSubstituableState_managedLevelForNotesAccounts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "accountWithIdentifier:", a2);
}

uint64_t __60__WFNoteGroupSubstituableState_managedLevelForNotesAccounts__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v7;
  char v8;

  result = objc_msgSend(a2, "MCIsManaged");
  v7 = 40;
  if ((_DWORD)result)
    v7 = 32;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + v7) + 8) + 24) = 1;
  v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v8)
    v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  *a4 = v8;
  return result;
}

- (id)legacySerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[WFVariableSubstitutableParameterState value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFNotesFolderIntentsValueFromLinkValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = CFSTR("DisplayString");
    objc_msgSend(v4, "spokenPhrase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = CFSTR("Identifier");
    v10[0] = v5;
    objc_msgSend(v4, "vocabularyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
