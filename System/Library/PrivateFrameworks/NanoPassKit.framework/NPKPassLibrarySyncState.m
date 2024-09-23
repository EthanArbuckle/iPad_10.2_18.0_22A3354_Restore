@implementation NPKPassLibrarySyncState

- (NPKPassLibrarySyncState)initWithStateVersionSyncStates:(id)a3
{
  id v4;
  NPKPassLibrarySyncState *v5;
  uint64_t v6;
  NSDictionary *syncStates;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPassLibrarySyncState;
  v5 = -[NPKPassLibrarySyncState init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    syncStates = v5->_syncStates;
    v5->_syncStates = (NSDictionary *)v6;

  }
  return v5;
}

- (NPKPassLibrarySyncState)initWithPasses:(id)a3 device:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  char v10;
  uint64_t v11;
  NPKPassLibrarySyncState *v12;
  id v13;
  id v14;
  NPKPassLibrarySyncState *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  NPKPassLibrarySyncState *v22;
  char v23;
  char v24;

  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  LOBYTE(v6) = NPKIsTinkerDevice(v7);
  v10 = NPKPairedOrPairingDeviceSupportsHealthPass(v7);

  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke;
  v19[3] = &unk_24CFE9478;
  v20 = &unk_24D056488;
  v21 = v9;
  v12 = self;
  v22 = v12;
  v23 = (char)v6;
  v24 = v10;
  v13 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v19);

  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke_3;
  v17[3] = &unk_24CFE94A0;
  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14 = v18;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v17);
  v15 = -[NPKPassLibrarySyncState initWithStateVersionSyncStates:](v12, "initWithStateVersionSyncStates:", v14);

  return v15;
}

void __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NPKPassSyncStateItem *v4;
  void *v5;
  NPKPassSyncStateItem *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  NPKPassSyncStateItem *v12;
  __int16 v13;

  v3 = a2;
  v4 = -[NPKPassSyncStateItem initWithPass:]([NPKPassSyncStateItem alloc], "initWithPass:", v3);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke_2;
  v8[3] = &unk_24CFE9450;
  v5 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v13 = *(_WORD *)(a1 + 56);
  v12 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

void __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  }
  if (objc_msgSend((id)objc_opt_class(), "_shouldAddPass:withDeviceIsTinker:supportHealthPass:stateVersion:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), objc_msgSend(v4, "unsignedIntegerValue")))objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 56));

}

void __49__NPKPassLibrarySyncState_initWithPasses_device___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NPKPassSyncState *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[NPKPassSyncState initWithSyncStateItems:version:]([NPKPassSyncState alloc], "initWithSyncStateItems:version:", v5, objc_msgSend(v6, "unsignedIntegerValue"));

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

- (id)passSyncStateWithVersion:(unint64_t)a3
{
  NSDictionary *syncStates;
  void *v5;
  void *v6;
  void *v7;
  NPKPassSyncState *v8;
  NPKPassSyncState *v9;
  void *v10;

  syncStates = self->_syncStates;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](syncStates, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = [NPKPassSyncState alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NPKPassSyncState initWithSyncStateItems:version:](v9, "initWithSyncStateItems:version:", v10, a3);

  }
  return v8;
}

- (id)mergeWithPassLibrarySyncState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NPKPassLibrarySyncState *v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__NPKPassLibrarySyncState_mergeWithPassLibrarySyncState___block_invoke;
  v10[3] = &unk_24CFE94C8;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(&unk_24D056488, "enumerateObjectsUsingBlock:", v10);
  v8 = -[NPKPassLibrarySyncState initWithStateVersionSyncStates:]([NPKPassLibrarySyncState alloc], "initWithStateVersionSyncStates:", v6);

  return v8;
}

void __57__NPKPassLibrarySyncState_mergeWithPassLibrarySyncState___block_invoke(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NPKPassSyncState *v12;
  id v13;

  v3 = a2;
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  v5 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(a1[4], "passSyncStateWithVersion:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncStateItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "passSyncStateWithVersion:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncStateItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v11);

  v12 = -[NPKPassSyncState initWithSyncStateItems:version:]([NPKPassSyncState alloc], "initWithSyncStateItems:version:", v13, v4);
  objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v12, v3);

}

+ (BOOL)_shouldAddPass:(id)a3 withDeviceIsTinker:(BOOL)a4 supportHealthPass:(BOOL)a5 stateVersion:(unint64_t)a6
{
  return NPKShouldUseStandaloneSyncForPassWithDevice(a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStates, 0);
}

- (id)updateReconcileState:(id)a3 expectedVersion:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NPKPassSyncState *v17;
  void *v18;
  void *v19;
  void *v20;
  NPKPassSyncState *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v6 = a3;
  -[NPKPassLibrarySyncState passSyncStateWithVersion:](self, "passSyncStateWithVersion:", objc_msgSend(v6, "version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncStateItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPassLibrarySyncState passSyncStateWithVersion:](self, "passSyncStateWithVersion:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncStateItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "syncStateItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v6, "syncStateItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __81__NPKPassLibrarySyncState_ReconciledState__updateReconcileState_expectedVersion___block_invoke;
  v23[3] = &unk_24CFEBE68;
  v24 = v8;
  v25 = v10;
  v26 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v8;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v23);

  v17 = [NPKPassSyncState alloc];
  v18 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v14, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[NPKPassSyncState initWithSyncStateItems:version:](v17, "initWithSyncStateItems:version:", v20, a4);

  return v21;
}

void __81__NPKPassLibrarySyncState_ReconciledState__updateReconcileState_expectedVersion___block_invoke(id *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(a1[6], "removeObjectForKey:", v6);
  }

}

@end
