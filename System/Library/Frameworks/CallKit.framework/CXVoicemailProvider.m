@implementation CXVoicemailProvider

- (CXVoicemailProvider)init
{
  CXVoicemailProvider *v2;
  CXAbstractProvider *v3;
  CXAbstractProvider *abstractProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXVoicemailProvider;
  v2 = -[CXVoicemailProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CXAbstractProvider);
    abstractProvider = v2->_abstractProvider;
    v2->_abstractProvider = v3;

    -[CXAbstractProvider setInternalActionDelegate:](v2->_abstractProvider, "setInternalActionDelegate:", v2);
  }
  return v2;
}

- (CXVoicemailProviderDelegate)delegate
{
  void *v2;
  void *v3;
  void *v4;
  CXVoicemailProviderDelegate *v5;

  -[CXVoicemailProvider abstractProvider](self, "abstractProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE715F28))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (CXVoicemailProviderHostProtocol)voicemailProviderHostDelegate
{
  void *v2;
  void *v3;
  CXVoicemailProviderHostProtocol *v4;

  -[CXVoicemailProvider hostProtocolDelegate](self, "hostProtocolDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE70D0D0))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)pendingVoicemailActionsOfClass:(Class)a3 withVoicemailUUID:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[CXVoicemailProvider pendingTransactions](self, "pendingTransactions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v22)
    {
      v21 = *(_QWORD *)v29;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(obj);
          v23 = v8;
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v9, "actions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v15, "voicemailUUID");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = objc_msgSend(v16, "isEqual:", v6);

                  if (v17)
                    objc_msgSend(v7, "addObject:", v15);
                }
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v12);
          }

          v8 = v23 + 1;
        }
        while (v23 + 1 != v22);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v22);
    }

  }
  v18 = (void *)objc_msgSend(v7, "copy");

  return v18;
}

- (void)reportNewVoicemailWithUpdate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXVoicemailProvider reportNewVoicemailsWithUpdates:](self, "reportNewVoicemailsWithUpdates:", v6, v7, v8);
}

- (void)reportNewVoicemailsWithUpdates:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CXVoicemailProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CXVoicemailProvider_reportNewVoicemailsWithUpdates___block_invoke;
  v8[3] = &unk_1E4B88A20;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __54__CXVoicemailProvider_reportNewVoicemailsWithUpdates___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemailProviderHostDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportNewVoicemailsWithUpdates:", *(_QWORD *)(a1 + 40));

}

- (void)reportVoicemailUpdated:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXVoicemailProvider reportVoicemailsUpdated:](self, "reportVoicemailsUpdated:", v6, v7, v8);
}

- (void)reportVoicemailsUpdated:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CXVoicemailProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__CXVoicemailProvider_reportVoicemailsUpdated___block_invoke;
  v8[3] = &unk_1E4B88A20;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __47__CXVoicemailProvider_reportVoicemailsUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemailProviderHostDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportVoicemailsUpdated:", *(_QWORD *)(a1 + 40));

}

- (void)reportVoicemailRemovedWithUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXVoicemailProvider reportVoicemailsRemovedWithUUIDs:](self, "reportVoicemailsRemovedWithUUIDs:", v6, v7, v8);
}

- (void)reportVoicemailsRemovedWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CXVoicemailProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CXVoicemailProvider_reportVoicemailsRemovedWithUUIDs___block_invoke;
  v8[3] = &unk_1E4B88A20;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __56__CXVoicemailProvider_reportVoicemailsRemovedWithUUIDs___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemailProviderHostDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportVoicemailsRemovedWithUUIDs:", *(_QWORD *)(a1 + 40));

}

- (id)hostProtocolDelegate
{
  return 0;
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXVoicemailProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[CXVoicemailProvider delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performSetPlayedVoicemailAction:", self, v8);
      goto LABEL_20;
    }
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetPlayedVoicemailAction_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
LABEL_18:
      _os_log_impl(&dword_1A402D000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Delegate does not respond to %@. Action will not be performed", (uint8_t *)&v11, 0xCu);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performSetTrashedVoicemailAction:", self, v8);
      goto LABEL_20;
    }
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performSetTrashedVoicemailAction_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "provider:performRemoveVoicemailAction:", self, v8);
      goto LABEL_20;
    }
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(sel_provider_performRemoveVoicemailAction_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CXVoicemailProvider performAction:].cold.1((uint64_t)v4, v8);
LABEL_20:

}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXVoicemailProvider abstractProvider](self, "abstractProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:queue:", v7, v6);

}

- (NSArray)pendingTransactions
{
  void *v2;
  void *v3;

  -[CXVoicemailProvider abstractProvider](self, "abstractProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pendingTransactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)invalidate
{
  id v2;

  -[CXVoicemailProvider abstractProvider](self, "abstractProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)commitTransaction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXVoicemailProvider abstractProvider](self, "abstractProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:commitTransaction:", self, v4);

}

- (void)handleActionTimeout:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXVoicemailProvider abstractProvider](self, "abstractProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider:handleTimeoutForAction:", self, v4);

}

- (CXAbstractProvider)abstractProvider
{
  return self->_abstractProvider;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_abstractProvider, 0);
}

- (void)performAction:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Unknown action class in transaction: %@", (uint8_t *)&v2, 0xCu);
}

@end
