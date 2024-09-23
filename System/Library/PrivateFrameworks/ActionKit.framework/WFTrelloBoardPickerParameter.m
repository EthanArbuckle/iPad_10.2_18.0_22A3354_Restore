@implementation WFTrelloBoardPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
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
  v12.super_class = (Class)WFTrelloBoardPickerParameter;
  -[WFTrelloBoardPickerParameter wasAddedToWorkflow](&v12, sel_wasAddedToWorkflow);
  -[WFTrelloBoardPickerParameter updateBoards](self, "updateBoards");
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __50__WFTrelloBoardPickerParameter_wasAddedToWorkflow__block_invoke;
  v9 = &unk_24F8B76C8;
  objc_copyWeak(&v10, &location);
  +[WFAccount addAccountObserver:](WFTrelloAccount, "addAccountObserver:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  observer = self->_observer;
  self->_observer = v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_possibleStatesDidChange, CFSTR("WFTrelloBoardParameterNeedsUpdateNotification"), 0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)wasRemovedFromWorkflow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTrelloBoardPickerParameter;
  -[WFTrelloBoardPickerParameter wasRemovedFromWorkflow](&v4, sel_wasRemovedFromWorkflow);
  +[WFAccount removeAccountObserver:](WFTrelloAccount, "removeAccountObserver:", self->_observer);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("WFTrelloBoardParameterNeedsUpdateNotification"), 0);

}

- (void)updateBoards
{
  void *v3;
  void *v4;
  WFTrelloSessionManager *v5;
  void *v6;
  WFTrelloSessionManager *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  WFTrelloBoardPickerParameter *v11;

  +[WFAccount accounts](WFTrelloAccount, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isValid") & 1) != 0)
  {
    v5 = [WFTrelloSessionManager alloc];
    objc_msgSend(v4, "token");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFTrelloSessionManager initWithConfiguration:token:](v5, "initWithConfiguration:token:", 0, v6);

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke;
    v9[3] = &unk_24F8BA068;
    v10 = v4;
    v11 = self;
    -[WFTrelloSessionManager getOpenBoardsWithCompletionHandler:](v7, "getOpenBoardsWithCompletionHandler:", v9);

  }
  else
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:completion:", CFSTR("WFTrelloBoards"), 0);

  }
}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFTrelloBoardPickerParameter;
  -[WFTrelloBoardPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
  -[WFTrelloBoardPickerParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  -[WFTrelloBoardPickerParameter possibleStates](self, "possibleStates");
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
    objc_msgSend(v4, "objectOfClasses:forKey:", v7, CFSTR("WFTrelloBoards"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "if_compactMap:", &__block_literal_global_27643);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_possibleStates;
    self->_possibleStates = v9;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
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
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

WFTrelloBoardSubstitutableState *__46__WFTrelloBoardPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFTrelloBoardSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFTrelloBoardSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

void __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
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
    v11[2] = __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke_2;
    v11[3] = &unk_24F8BB638;
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "setObject:forKey:completion:", v5, CFSTR("WFTrelloBoards"), v11);
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("WFTrelloErrorDomain")))
    goto LABEL_6;
  v9 = objc_msgSend(v7, "code");

  if (v9 == 100)
  {
    +[WFAccount deleteAccount:](WFTrelloAccount, "deleteAccount:", *(_QWORD *)(a1 + 32));
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:completion:", CFSTR("WFTrelloBoards"), 0);

  }
LABEL_7:

}

void __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke_3;
  block[3] = &unk_24F8BB638;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "possibleStatesDidChange");
}

void __50__WFTrelloBoardPickerParameter_wasAddedToWorkflow__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateBoards");

}

@end
