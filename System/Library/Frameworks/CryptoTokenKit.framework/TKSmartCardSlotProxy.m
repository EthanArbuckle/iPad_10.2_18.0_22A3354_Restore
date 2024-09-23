@implementation TKSmartCardSlotProxy

- (void)processNotificationParameters:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  BOOL v10;
  id v11;
  void *v12;
  BOOL v13;
  TKSmartCardATR *v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  TKSmartCardSlot **p_slot;
  id v22;
  BOOL v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  BOOL v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  BOOL v35;
  id v36;
  id v37;
  BOOL v38;
  id v39;
  id v40;
  id WeakRetained;
  int v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("atr"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TK_LOG_smartcard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_slot);
    v42 = 138543874;
    v43 = WeakRetained;
    v44 = 2048;
    v45 = v6;
    v46 = 2114;
    v47 = v7;
    _os_log_debug_impl(&dword_1B9768000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: stateChangedTo:%ld atr:%{public}@", (uint8_t *)&v42, 0x20u);

  }
  if (v7)
    v9 = v6 == 4;
  else
    v9 = 0;
  if (v9)
  {
    v15 = objc_loadWeakRetained((id *)&self->_slot);
    objc_msgSend(v15, "ATR");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v7);

    if ((v17 & 1) != 0)
      goto LABEL_16;
    v14 = -[TKSmartCardATR initWithBytes:]([TKSmartCardATR alloc], "initWithBytes:", v7);
    v18 = objc_loadWeakRetained((id *)&self->_slot);
    objc_msgSend(v18, "setATR:", v14);

    goto LABEL_15;
  }
  if (v7)
    v10 = 1;
  else
    v10 = v6 == 4;
  if (!v10)
  {
    v11 = objc_loadWeakRetained((id *)&self->_slot);
    objc_msgSend(v11, "ATR");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      v14 = (TKSmartCardATR *)objc_loadWeakRetained((id *)&self->_slot);
      -[TKSmartCardATR setATR:](v14, "setATR:", 0);
LABEL_15:

    }
  }
LABEL_16:
  objc_msgSend(v4, "objectForKey:", CFSTR("power"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "integerValue");

  p_slot = &self->_slot;
  v22 = objc_loadWeakRetained((id *)p_slot);
  v23 = v20 == objc_msgSend(v22, "powerState");

  if (!v23)
  {
    v24 = objc_loadWeakRetained((id *)p_slot);
    objc_sync_enter(v24);
    v25 = objc_loadWeakRetained((id *)p_slot);
    objc_msgSend(v25, "setPowerState:", v20);

    objc_sync_exit(v24);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("share"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "integerValue");

  v28 = objc_loadWeakRetained((id *)p_slot);
  v29 = v27 == objc_msgSend(v28, "shareState");

  if (!v29)
  {
    v30 = objc_loadWeakRetained((id *)p_slot);
    objc_sync_enter(v30);
    v31 = objc_loadWeakRetained((id *)p_slot);
    objc_msgSend(v31, "setShareState:", v27);

    objc_sync_exit(v30);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("prevstate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "integerValue");

  v34 = objc_loadWeakRetained((id *)p_slot);
  v35 = v33 == objc_msgSend(v34, "previousState");

  if (!v35)
  {
    v36 = objc_loadWeakRetained((id *)p_slot);
    objc_msgSend(v36, "setPreviousState:", v33);

  }
  v37 = objc_loadWeakRetained((id *)p_slot);
  v38 = objc_msgSend(v37, "state") == v6;

  if (!v38)
  {
    v39 = objc_loadWeakRetained((id *)p_slot);
    objc_sync_enter(v39);
    v40 = objc_loadWeakRetained((id *)p_slot);
    objc_msgSend(v40, "setState:", v6);

    objc_sync_exit(v39);
  }

}

- (void)notifyWithParameters:(id)a3 reply:(id)a4
{
  void (**v6)(_QWORD);
  TKSmartCardSlotProxy *v7;
  NSMutableArray *queuedParameters;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = self;
  objc_sync_enter(v7);
  queuedParameters = v7->_queuedParameters;
  if (queuedParameters)
  {
    -[NSMutableArray addObject:](queuedParameters, "addObject:", v9);
    objc_sync_exit(v7);

  }
  else
  {
    objc_sync_exit(v7);

    -[TKSmartCardSlotProxy processNotificationParameters:](v7, "processNotificationParameters:", v9);
  }
  v6[2](v6);

}

- (void)cardSessionRequested
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[TKSmartCardSlotProxy cards](self, "cards", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "sessionRequested");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (TKSmartCardSlotProxy)initWithSlot:(id)a3
{
  id v4;
  TKSmartCardSlotProxy *v5;
  TKSmartCardSlotProxy *v6;
  uint64_t v7;
  NSHashTable *cards;
  NSMutableArray *v9;
  NSMutableArray *queuedParameters;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TKSmartCardSlotProxy;
  v5 = -[TKSmartCardSlotProxy init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_slot, v4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    cards = v6->_cards;
    v6->_cards = (NSHashTable *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    queuedParameters = v6->_queuedParameters;
    v6->_queuedParameters = v9;

  }
  return v6;
}

- (void)slotInitialized
{
  TKSmartCardSlot **p_slot;
  TKSmartCardSlotProxy *v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  int v8;
  NSMutableArray *queuedParameters;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_slot = &self->_slot;
  while (1)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!-[NSMutableArray count](self->_queuedParameters, "count"))
      break;
    TK_LOG_smartcard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained((id *)p_slot);
      v8 = -[NSMutableArray count](self->_queuedParameters, "count");
      *(_DWORD *)buf = 138412546;
      v11 = WeakRetained;
      v12 = 1024;
      v13 = v8;
      _os_log_debug_impl(&dword_1B9768000, v5, OS_LOG_TYPE_DEBUG, "%@: processing accumulated state changes, %d remain", buf, 0x12u);

    }
    -[NSMutableArray firstObject](self->_queuedParameters, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_queuedParameters, "removeObjectAtIndex:", 0);
    objc_sync_exit(v4);

    -[TKSmartCardSlotProxy processNotificationParameters:](v4, "processNotificationParameters:", v6);
  }
  queuedParameters = self->_queuedParameters;
  self->_queuedParameters = 0;

  objc_sync_exit(v4);
}

- (NSHashTable)cards
{
  return (NSHashTable *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cards, 0);
  objc_storeStrong((id *)&self->_queuedParameters, 0);
  objc_destroyWeak((id *)&self->_slot);
}

@end
