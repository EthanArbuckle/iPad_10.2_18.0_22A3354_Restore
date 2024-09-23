@implementation WFTrelloListPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)setAction:(id)a3
{
  WFAction **p_action;
  id WeakRetained;
  id v6;
  id obj;

  p_action = &self->_action;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_action);
  objc_msgSend(WeakRetained, "removeEventObserver:", self);

  v6 = objc_storeWeak((id *)p_action, obj);
  objc_msgSend(obj, "addEventObserver:", self);

}

- (void)wasAddedToWorkflow
{
  void *v3;
  id observer;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFTrelloListPickerParameter;
  -[WFTrelloListPickerParameter wasAddedToWorkflow](&v12, sel_wasAddedToWorkflow);
  -[WFTrelloListPickerParameter updateLists](self, "updateLists");
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __49__WFTrelloListPickerParameter_wasAddedToWorkflow__block_invoke;
  v9 = &unk_24F8B76C8;
  objc_copyWeak(&v10, &location);
  +[WFAccount addAccountObserver:](WFTrelloAccount, "addAccountObserver:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  observer = self->_observer;
  self->_observer = v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_possibleStatesDidChange, CFSTR("WFTrelloListParameterNeedsUpdate"), 0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)wasRemovedFromWorkflow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTrelloListPickerParameter;
  -[WFTrelloListPickerParameter wasRemovedFromWorkflow](&v4, sel_wasRemovedFromWorkflow);
  +[WFAccount removeAccountObserver:](WFTrelloAccount, "removeAccountObserver:", self->_observer);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("WFTrelloListParameterNeedsUpdate"), 0);

}

- (void)updateLists
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  WFTrelloSessionManager *v20;
  void *v21;
  WFTrelloSessionManager *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  WFTrelloListPickerParameter *v29;

  +[WFAccount accounts](WFTrelloAccount, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isValid") & 1) != 0)
  {
    -[WFTrelloListPickerParameter action](self, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTrelloListPickerParameter definition](self, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("BoardKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parameterStateForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      WFDiskCacheKey(v11, v12, v13, v14, v15, v16, v17, v18, CFSTR("WFTrelloLists"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = [WFTrelloSessionManager alloc];
      objc_msgSend(v4, "token");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[WFTrelloSessionManager initWithConfiguration:token:](v20, "initWithConfiguration:token:", 0, v21);

      objc_msgSend(v8, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __42__WFTrelloListPickerParameter_updateLists__block_invoke;
      v26[3] = &unk_24F8BB348;
      v27 = v4;
      v28 = v19;
      v29 = self;
      v24 = v19;
      -[WFTrelloSessionManager getListsForBoard:completionHandler:](v22, "getListsForBoard:completionHandler:", v23, v26);

    }
  }
  else
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObjectForKey:completion:", CFSTR("WFTrelloLists"), 0);

  }
}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFTrelloListPickerParameter;
  -[WFTrelloListPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
  -[WFTrelloListPickerParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  -[WFTrelloListPickerParameter possibleStates](self, "possibleStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    -[WFTrelloListPickerParameter action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTrelloListPickerParameter definition](self, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("BoardKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterStateForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {

      v18 = 0;
      return v18;
    }
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectOfClasses:forKeyComponents:", v12, v14, CFSTR("WFTrelloLists"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "if_compactMap:", &__block_literal_global_37014);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_possibleStates;
    self->_possibleStates = v16;

    possibleStates = self->_possibleStates;
  }
  v18 = possibleStates;
  return v18;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[WFTrelloListPickerParameter definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("BoardKey"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v5, "isEqualToString:", v7);
  if ((_DWORD)v6)
  {
    -[WFTrelloListPickerParameter possibleStatesDidChange](self, "possibleStatesDidChange");
    -[WFTrelloListPickerParameter updateLists](self, "updateLists");
  }

}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (id)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong(&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

WFTrelloListSubstitutableState *__45__WFTrelloListPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFTrelloListSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFTrelloListSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

void __42__WFTrelloListPickerParameter_updateLists__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__WFTrelloListPickerParameter_updateLists__block_invoke_2;
    v11[3] = &unk_24F8BB638;
    v9 = a1[5];
    v11[4] = a1[6];
    objc_msgSend(v8, "setObject:forKey:completion:", v5, v9, v11);
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("WFTrelloErrorDomain")))
    goto LABEL_6;
  v10 = objc_msgSend(v7, "code");

  if (v10 == 100)
  {
    +[WFAccount deleteAccount:](WFTrelloAccount, "deleteAccount:", a1[4]);
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:completion:", a1[5], 0);
    goto LABEL_6;
  }
LABEL_7:

}

void __42__WFTrelloListPickerParameter_updateLists__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__WFTrelloListPickerParameter_updateLists__block_invoke_3;
  block[3] = &unk_24F8BB638;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __42__WFTrelloListPickerParameter_updateLists__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "possibleStatesDidChange");
}

void __49__WFTrelloListPickerParameter_wasAddedToWorkflow__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateLists");

}

@end
