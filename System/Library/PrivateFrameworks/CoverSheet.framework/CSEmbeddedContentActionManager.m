@implementation CSEmbeddedContentActionManager

- (CSEmbeddedContentActionManager)initWithDelegate:(id)a3
{
  id v4;
  CSEmbeddedContentActionManager *v5;
  CSEmbeddedContentActionManager *v6;
  uint64_t v7;
  NSMutableSet *activeActions;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSEmbeddedContentActionManager;
  v5 = -[CSEmbeddedContentActionManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    activeActions = v6->_activeActions;
    v6->_activeActions = (NSMutableSet *)v7;

  }
  return v6;
}

- (id)validActionWithIdentifierIfExists:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_activeActions;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isValid", (_QWORD)v13))
        {
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)setContentActionProvider:(id)a3
{
  SBFActionProviding *v5;
  SBFActionProviding *contentActionProvider;
  SBFActionProviding *v7;

  v5 = (SBFActionProviding *)a3;
  contentActionProvider = self->_contentActionProvider;
  if (contentActionProvider != v5)
  {
    v7 = v5;
    -[SBFActionProviding removeActionHandler:](contentActionProvider, "removeActionHandler:", self);
    objc_storeStrong((id *)&self->_contentActionProvider, a3);
    -[SBFActionProviding addActionHandler:](self->_contentActionProvider, "addActionHandler:", self);
    v5 = v7;
  }

}

- (BOOL)handlesActionWithClass:(Class)a3
{
  return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

- (BOOL)handleAction:(id)a3 forProvider:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  int v13;

  v5 = a3;
  if (objc_msgSend(v5, "isValid"))
  {
    v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    objc_msgSend(v10, "slot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DAB7C0]) & 1) != 0)
    {
      objc_msgSend(v10, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0DAB128]);

      if (v13)
      {
        v9 = -[CSEmbeddedContentActionManager _addAction:](self, "_addAction:", v10);
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {

    }
    v9 = 0;
    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)_addAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __45__CSEmbeddedContentActionManager__addAction___block_invoke;
  v11 = &unk_1E8E2DAE8;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  v5 = (void *)MEMORY[0x1D17E1614](&v8);
  objc_msgSend(v4, "setInvalidationHandler:", v5, v8, v9, v10, v11);
  -[NSMutableSet addObject:](self->_activeActions, "addObject:", v4);
  -[CSEmbeddedContentActionManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionManager:addedAction:", self, v4);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __45__CSEmbeddedContentActionManager__addAction___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__CSEmbeddedContentActionManager__addAction___block_invoke_2;
  v2[3] = &unk_1E8E2DAE8;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v3);
}

void __45__CSEmbeddedContentActionManager__addAction___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeAction:", v2);

}

- (void)_removeAction:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[NSMutableSet containsObject:](self->_activeActions, "containsObject:", v5))
  {
    -[NSMutableSet removeObject:](self->_activeActions, "removeObject:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "actionManager:removedAction:", self, v5);

  }
}

- (CSEmbeddedContentActionManagerDelegate)delegate
{
  return (CSEmbeddedContentActionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)activeActions
{
  return self->_activeActions;
}

- (void)setActiveActions:(id)a3
{
  objc_storeStrong((id *)&self->_activeActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeActions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentActionProvider, 0);
}

@end
