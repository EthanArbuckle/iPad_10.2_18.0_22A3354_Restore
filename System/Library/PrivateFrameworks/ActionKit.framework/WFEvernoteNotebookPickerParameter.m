@implementation WFEvernoteNotebookPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)setActionResources:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315906;
      v11 = "WFEnforceClass";
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v5;
      v9 = v15;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v10, 0x2Au);

    }
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  -[WFEvernoteNotebookPickerParameter setEvernoteAccessResource:](self, "setEvernoteAccessResource:", v7);
}

- (void)setEvernoteAccessResource:(id)a3
{
  WFEvernoteAccessResource **p_evernoteAccessResource;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_evernoteAccessResource = &self->_evernoteAccessResource;
  v6 = (_QWORD *)MEMORY[0x24BEC4628];
  if (self->_evernoteAccessResource)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *v6, *p_evernoteAccessResource);

  }
  objc_storeStrong((id *)&self->_evernoteAccessResource, a3);
  if (*p_evernoteAccessResource)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_updateNotebooks, *v6, *p_evernoteAccessResource);

  }
}

- (void)wasAddedToWorkflow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFEvernoteNotebookPickerParameter;
  -[WFEvernoteNotebookPickerParameter wasAddedToWorkflow](&v3, sel_wasAddedToWorkflow);
  -[WFEvernoteNotebookPickerParameter updateNotebooks](self, "updateNotebooks");
}

- (void)updateNotebooks
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAuthenticated");

  if ((v4 & 1) != 0)
  {
    +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke;
    v7[3] = &unk_24F8BB6B0;
    v7[4] = self;
    objc_msgSend(v5, "listWritableNotebooksWithCompletion:", v7);

  }
  else
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:completion:", CFSTR("WFEvernoteNotebooks"), 0);

  }
}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFEvernoteNotebookPickerParameter;
  -[WFEvernoteNotebookPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
  -[WFEvernoteNotebookPickerParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
}

- (NSArray)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectOfClasses:forKey:", v7, CFSTR("WFEvernoteNotebooks"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "if_compactMap:", &__block_literal_global_199);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_possibleStates;
    self->_possibleStates = v9;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)objc_msgSend(a3, "value");
}

- (WFEvernoteAccessResource)evernoteAccessResource
{
  return self->_evernoteAccessResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evernoteAccessResource, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __51__WFEvernoteNotebookPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithValue:", v5);
  return v6;
}

void __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];

  v5 = a3;
  v6 = v5;
  if (!a2)
  {
    objc_msgSend(v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("ENErrorDomain")))
    {
      v10 = objc_msgSend(v6, "code");

      if (v10 != 2)
        goto LABEL_7;
      +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:completion:", CFSTR("WFEvernoteNotebooks"), 0);
    }

    goto LABEL_7;
  }
  objc_msgSend(a2, "if_map:", &__block_literal_global_41383);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke_3;
  v11[3] = &unk_24F8BB638;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "setObject:forKey:completion:", v7, CFSTR("WFEvernoteNotebooks"), v11);

LABEL_7:
}

void __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke_4;
  block[3] = &unk_24F8BB638;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "possibleStatesDidChange");
}

WFEvernoteNotebook *__52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFEvernoteNotebook *v3;

  v2 = a2;
  v3 = -[WFEvernoteNotebook initWithNotebook:]([WFEvernoteNotebook alloc], "initWithNotebook:", v2);

  return v3;
}

+ (id)referencedActionResourceClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

@end
