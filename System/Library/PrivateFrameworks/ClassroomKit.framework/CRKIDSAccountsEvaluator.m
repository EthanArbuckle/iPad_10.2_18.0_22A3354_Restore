@implementation CRKIDSAccountsEvaluator

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CRKIDSAccountsEvaluator endObservingKnownAccountChanges](self, "endObservingKnownAccountChanges");
  -[CRKIDSAccountsEvaluator observedAccounts](self, "observedAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKIDSAccountsEvaluator endObservingAccounts:](self, "endObservingAccounts:", v3);

  v4.receiver = self;
  v4.super_class = (Class)CRKIDSAccountsEvaluator;
  -[CRKIDSAccountsEvaluator dealloc](&v4, sel_dealloc);
}

- (CRKIDSAccountsEvaluator)initWithIDSLocalPrimitives:(id)a3
{
  id v5;
  CRKIDSAccountsEvaluator *v6;
  CRKIDSAccountsEvaluator *v7;
  NSArray *observedAccounts;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKIDSAccountsEvaluator;
  v6 = -[CRKIDSAccountsEvaluator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_IDSLocalPrimitives, a3);
    observedAccounts = v7->_observedAccounts;
    v7->_observedAccounts = (NSArray *)MEMORY[0x24BDBD1A8];

    -[CRKIDSAccountsEvaluator beginObservingKnownAccountChanges](v7, "beginObservingKnownAccountChanges");
    -[CRKIDSAccountsEvaluator knownAccountsDidChange](v7, "knownAccountsDidChange");
  }

  return v7;
}

- (void)knownAccountsDidChange
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKIDSAccountsEvaluator.m"), 62, CFSTR("%@ must be called from the main thread"), v7);

  }
  -[CRKIDSAccountsEvaluator IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accounts");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CRKIDSAccountsEvaluator observedAccounts](self, "observedAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKIDSAccountsEvaluator endObservingAccounts:](self, "endObservingAccounts:", v5);

  -[CRKIDSAccountsEvaluator beginObservingAccounts:](self, "beginObservingAccounts:", v8);
  -[CRKIDSAccountsEvaluator setObservedAccounts:](self, "setObservedAccounts:", v8);
  -[CRKIDSAccountsEvaluator updateState](self, "updateState");

}

- (void)observedAccountDidChange:(id)a3
{
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKIDSAccountsEvaluator.m"), 75, CFSTR("%@ must be called from the main thread"), v6);

  }
  -[CRKIDSAccountsEvaluator updateState](self, "updateState");
}

- (void)beginObservingKnownAccountChanges
{
  id v3;

  -[CRKIDSAccountsEvaluator IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("accounts"), 0, CFSTR("CRKIDSAccountsEvaluatorContext"));

}

- (void)endObservingKnownAccountChanges
{
  id v3;

  -[CRKIDSAccountsEvaluator IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("accounts"), CFSTR("CRKIDSAccountsEvaluatorContext"));

}

- (void)beginObservingAccounts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "addObserver:forKeyPath:options:context:", self, CFSTR("active"), 0, CFSTR("CRKIDSAccountsEvaluatorContext"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)endObservingAccounts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeObserver:forKeyPath:context:", self, CFSTR("active"), CFSTR("CRKIDSAccountsEvaluatorContext"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;

  v10 = a3;
  v11 = v10;
  if (a6 == CFSTR("CRKIDSAccountsEvaluatorContext"))
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("accounts")))
    {
      -[CRKIDSAccountsEvaluator knownAccountsDidChange](self, "knownAccountsDidChange");
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("active")))
    {
      -[CRKIDSAccountsEvaluator updateState](self, "updateState");
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRKIDSAccountsEvaluator;
    -[CRKIDSAccountsEvaluator observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (void)updateState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;

  -[CRKIDSAccountsEvaluator IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKIDSAccountsState stateForAccounts:](CRKIDSAccountsState, "stateForAccounts:", v4);
  v8 = objc_claimAutoreleasedReturnValue();

  -[CRKIDSAccountsEvaluator state](self, "state");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 | v8)
  {
    -[CRKIDSAccountsEvaluator state](self, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v8);

    if ((v7 & 1) == 0)
      -[CRKIDSAccountsEvaluator setState:](self, "setState:", v8);
  }

}

- (CRKIDSAccountsState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  return self->_IDSLocalPrimitives;
}

- (NSArray)observedAccounts
{
  return self->_observedAccounts;
}

- (void)setObservedAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedAccounts, 0);
  objc_storeStrong((id *)&self->_IDSLocalPrimitives, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
