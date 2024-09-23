@implementation EDConversationRemoteCloudKitStorage

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EDConversationRemoteCloudKitStorage_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_26 != -1)
    dispatch_once(&log_onceToken_26, block);
  return (OS_os_log *)(id)log_log_26;
}

void __42__EDConversationRemoteCloudKitStorage_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_26;
  log_log_26 = (uint64_t)v1;

}

- (EDConversationRemoteCloudKitStorage)initWithDelegate:(id)a3
{
  id v4;
  EDConversationRemoteCloudKitStorage *v5;
  EDConversationRemoteCloudKitStorage *v6;
  NSObject *v7;
  EDTransactionService *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  EDTransactionService *v13;
  EDTransactionService *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  EDTransactionService *v19;
  void *v20;
  EDCloudMirroringPersistentStore *v21;
  EDCloudMirroringPersistentStore *mirroringPersistentStore;
  uint8_t buf[16];
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EDConversationRemoteCloudKitStorage;
  v5 = -[EDConversationRemoteCloudKitStorage init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Initializing Conversation CloudKit Storage", buf, 2u);
    }

    v8 = [EDTransactionService alloc];
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-Export"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[EDTransactionService initWithServiceName:](v8, "initWithServiceName:", v12);
    -[EDConversationRemoteCloudKitStorage setExportTransaction:](v6, "setExportTransaction:", v13);

    v14 = [EDTransactionService alloc];
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@-Import"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[EDTransactionService initWithServiceName:](v14, "initWithServiceName:", v18);
    -[EDConversationRemoteCloudKitStorage setImportTransaction:](v6, "setImportTransaction:", v19);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel__handleWillResetSyncDataNotification_, *MEMORY[0x1E0C97828], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel__handleDidResetSyncDataNotification_, *MEMORY[0x1E0C97818], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel__handlePushNotification_, CFSTR("EDConversationRemoteCloudKitStoragePushNotificationName"), 0);
    v21 = objc_alloc_init(EDCloudMirroringPersistentStore);
    mirroringPersistentStore = v6->_mirroringPersistentStore;
    v6->_mirroringPersistentStore = v21;

    -[EDConversationRemoteCloudKitStorage _initialSetup](v6, "_initialSetup");
  }

  return v6;
}

- (void)_initialSetup
{
  void *v3;
  _QWORD v4[5];

  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke;
  v4[3] = &unk_1E949BF98;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

void __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "exportTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPendingTransactions");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "exportTransaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetPendingTransactions");

    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_cold_2(v7, v8, v9);

    objc_msgSend(*(id *)(a1 + 32), "mirroringPersistentStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_28;
    v29[3] = &unk_1E949BF98;
    v29[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "performBlock:", v29);

  }
  objc_msgSend(*(id *)(a1 + 32), "importTransaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasPendingTransactions");

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "importTransaction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resetPendingTransactions");

    objc_msgSend((id)objc_opt_class(), "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_cold_1(v14, v15, v16);

    objc_msgSend(*(id *)(a1 + 32), "mirroringPersistentStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_30;
    v28[3] = &unk_1E949BF98;
    v28[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v17, "performBlock:", v28);

  }
  objc_msgSend(*(id *)(a1 + 32), "_controlInManagedObjectContext:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "migratedFromKVSStorage");

  v20 = *(void **)(a1 + 32);
  if (v19)
  {
    objc_msgSend(v20, "setInitialized:", 1);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) == 0)
      goto LABEL_14;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "conversationRemoteStorageDidInitialize:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v20, "mirroringPersistentStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_2;
    v27[3] = &unk_1E949BF98;
    v27[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v23, "performBlock:", v27);
  }

LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "_recoverHistoryToken");
  objc_msgSend(*(id *)(a1 + 32), "historyToken");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_msgSend(*(id *)(a1 + 32), "mirroringPersistentStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_3;
    v26[3] = &unk_1E949BF98;
    v26[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v25, "performBlock:", v26);

  }
}

uint64_t __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestExportWithManagedObjectContext:", a2);
}

uint64_t __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_30(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestImportWithManagedObjectContext:", a2);
}

uint64_t __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestFirstSyncWithManagedObjectContext:", a2);
}

uint64_t __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestImportWithManagedObjectContext:", a2);
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__EDConversationRemoteCloudKitStorage_setDictionary_forKey___block_invoke;
  v11[3] = &unk_1E949BFC0;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

void __60__EDConversationRemoteCloudKitStorage_setDictionary_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "entityForConversationDictionary:key:managedObjectContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "conversationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleDuplicationsForConversationUUIDs:managedObjectContext:", v7, v3);

  objc_msgSend(*(id *)(a1 + 32), "_addOrUpdateConversationInfo:managedObjectContext:", v4, v3);
}

- (void)removeDictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__EDConversationRemoteCloudKitStorage_removeDictionaryForKey___block_invoke;
  v7[3] = &unk_1E949BFE8;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

uint64_t __62__EDConversationRemoteCloudKitStorage_removeDictionaryForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeConversationInfoWithId:managedObjectContext:", *(_QWORD *)(a1 + 40), a2);
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__EDConversationRemoteCloudKitStorage_dictionaryForKey___block_invoke;
  v9[3] = &unk_1E949C010;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__EDConversationRemoteCloudKitStorage_dictionaryForKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_conversationInfoWithUUID:managedObjectContext:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dictionaryForConversationInfo:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)dictionaryRepresentation
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__EDConversationRemoteCloudKitStorage_dictionaryRepresentation__block_invoke;
  v6[3] = &unk_1E949C038;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __63__EDConversationRemoteCloudKitStorage_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allConversationInfosInManagedObjectContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "dictionaryForConversationInfo:", v12, (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "conversationUUID");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13)
          v16 = v14 == 0;
        else
          v16 = 1;
        if (!v16)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v13, v14);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (BOOL)synchronize
{
  void *v3;
  _QWORD v5[5];

  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__EDConversationRemoteCloudKitStorage_synchronize__block_invoke;
  v5[3] = &unk_1E949BF98;
  v5[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  return 1;
}

uint64_t __50__EDConversationRemoteCloudKitStorage_synchronize__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestExportWithManagedObjectContext:", a2);
}

- (void)refresh
{
  void *v3;
  _QWORD v4[5];

  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__EDConversationRemoteCloudKitStorage_refresh__block_invoke;
  v4[3] = &unk_1E949BF98;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

uint64_t __46__EDConversationRemoteCloudKitStorage_refresh__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestImportWithManagedObjectContext:", a2);
}

- (void)_requestExportWithManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  -[EDConversationRemoteCloudKitStorage exportTransaction](self, "exportTransaction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__EDConversationRemoteCloudKitStorage__requestExportWithManagedObjectContext___block_invoke;
  v8[3] = &unk_1E949C060;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "requestExportWithCompletionBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __78__EDConversationRemoteCloudKitStorage__requestExportWithManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "exportTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTransaction:", *(_QWORD *)(a1 + 32));

}

- (void)_requestImportWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (-[EDConversationRemoteCloudKitStorage isInitialized](self, "isInitialized"))
  {
    -[EDConversationRemoteCloudKitStorage importTransaction](self, "importTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startTransaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__EDConversationRemoteCloudKitStorage__requestImportWithManagedObjectContext___block_invoke;
    v9[3] = &unk_1E949C060;
    objc_copyWeak(&v11, &location);
    v8 = v6;
    v10 = v8;
    objc_msgSend(v7, "requestImportWithCompletionBlock:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  else
  {
    -[EDConversationRemoteCloudKitStorage _requestFirstSyncWithManagedObjectContext:](self, "_requestFirstSyncWithManagedObjectContext:", v4);
  }

}

void __78__EDConversationRemoteCloudKitStorage__requestImportWithManagedObjectContext___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mirroringPersistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__EDConversationRemoteCloudKitStorage__requestImportWithManagedObjectContext___block_invoke_2;
  v6[3] = &unk_1E949C088;
  v6[4] = WeakRetained;
  v7 = *(id *)(a1 + 32);
  v8 = a2;
  objc_msgSend(v5, "performBlock:", v6);

}

void __78__EDConversationRemoteCloudKitStorage__requestImportWithManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "importTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endTransaction:", *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_retrieveChangesSinceLastRequestInManagedObjectContext:", v4);

}

- (void)_requestFirstSyncWithManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[EDConversationRemoteCloudKitStorage importTransaction](self, "importTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__EDConversationRemoteCloudKitStorage__requestFirstSyncWithManagedObjectContext___block_invoke;
  v8[3] = &unk_1E949C060;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "requestImportWithCompletionBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __81__EDConversationRemoteCloudKitStorage__requestFirstSyncWithManagedObjectContext___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "importTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endTransaction:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "mirroringPersistentStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__EDConversationRemoteCloudKitStorage__requestFirstSyncWithManagedObjectContext___block_invoke_2;
  v7[3] = &unk_1E949C0B0;
  v7[4] = WeakRetained;
  v8 = a2;
  objc_msgSend(v6, "performBlock:", v7);

}

void __81__EDConversationRemoteCloudKitStorage__requestFirstSyncWithManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(unsigned __int8 *)(a1 + 40);
    v9 = 134217984;
    v10 = v5;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "First request import arrived. Success: %lu", (uint8_t *)&v9, 0xCu);
  }

  if (*(_BYTE *)(a1 + 40) && (objc_msgSend(*(id *)(a1 + 32), "isInitialized") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInitialized:", 1);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "conversationRemoteStorageDidInitialize:", *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(*(id *)(a1 + 32), "_retrieveChangesSinceLastRequestInManagedObjectContext:", v3);
  }

}

- (void)_handlePushNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  EDConversationRemoteCloudKitStorage *v9;

  v4 = a3;
  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__EDConversationRemoteCloudKitStorage__handlePushNotification___block_invoke;
  v7[3] = &unk_1E949BFE8;
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_msgSend(v5, "performBlock:", v7);

}

void __63__EDConversationRemoteCloudKitStorage__handlePushNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C94F40];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationFromRemoteNotificationDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "APS Push received - %{public}@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_requestImportWithManagedObjectContext:", v3);
}

- (id)storageName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isMigratedFromKVSStorage
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__EDConversationRemoteCloudKitStorage_isMigratedFromKVSStorage__block_invoke;
  v5[3] = &unk_1E949C0D8;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v3) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

void __63__EDConversationRemoteCloudKitStorage_isMigratedFromKVSStorage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_controlInManagedObjectContext:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "migratedFromKVSStorage");

}

- (void)setMigratedFromKVSStorage:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__EDConversationRemoteCloudKitStorage_setMigratedFromKVSStorage___block_invoke;
  v6[3] = &unk_1E949C0B0;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

void __65__EDConversationRemoteCloudKitStorage_setMigratedFromKVSStorage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8[5];

  v8[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_controlInManagedObjectContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("CloudKitControl"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setMigratedFromKVSStorage:", *(unsigned __int8 *)(a1 + 40));
  v8[0] = 0;
  v5 = objc_msgSend(v3, "save:", v8);
  v6 = v8[0];
  if ((v5 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __65__EDConversationRemoteCloudKitStorage_setMigratedFromKVSStorage___block_invoke_cold_1();
    }

  }
}

+ (id)cloudKitAPSTopics
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)cloudKitAPSTopics_cloudKitAPSTopics;
  if (!cloudKitAPSTopics_cloudKitAPSTopics)
  {
    v6[0] = CFSTR("com.apple.icloud-container.com.apple.mobilemail");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)cloudKitAPSTopics_cloudKitAPSTopics;
    cloudKitAPSTopics_cloudKitAPSTopics = v3;

    v2 = (void *)cloudKitAPSTopics_cloudKitAPSTopics;
  }
  return v2;
}

- (id)entityForConversationDictionary:(id)a3 key:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EDConversationRemoteCloudKitStorage _conversationInfoWithUUID:managedObjectContext:](self, "_conversationInfoWithUUID:managedObjectContext:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ConversationInfo"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "setConversationUUID:", v9);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flags"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongLongValue");

  objc_msgSend(v11, "setNotifyMe:", v13 & 1);
  objc_msgSend(v11, "setMuted:", (v13 >> 2) & 1);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("message-ids"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMessageIds:", v14);

  v15 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("last-modified"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLastModified:", v17);

  return v11;
}

- (id)dictionaryForConversationInfo:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if ((objc_msgSend(v3, "muted") & 1) != 0)
      v5 = 4;
    else
      v5 = objc_msgSend(v3, "notifyMe");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("flags"));

    objc_msgSend(v3, "messageIds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("message-ids"));

    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "lastModified");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("last-modified"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)persistHistoryToken
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to archive history token - Error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_recoverHistoryToken
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to unarchive history token - Error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_handleDuplicationsForConversationUUIDs:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t i;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = v6;
  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (!v9)
  {
LABEL_24:

    goto LABEL_25;
  }
  v10 = 0;
  v23 = *(_QWORD *)v33;
  v24 = v9;
  do
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v33 != v23)
        objc_enumerationMutation(obj);
      -[EDConversationRemoteCloudKitStorage _conversationInfosWithUUID:managedObjectContext:](self, "_conversationInfosWithUUID:managedObjectContext:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v25, "count") >= 2)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v25, "subarrayWithRange:", 1, objc_msgSend(v25, "count") - 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v29;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v29 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
              objc_msgSend((id)objc_opt_class(), "log");
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v15, "conversationUUID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectID");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v37 = v18;
                v38 = 2114;
                v39 = v19;
                _os_log_error_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_ERROR, "Deleting duplicated object. %{public}@, %{public}@", buf, 0x16u);

              }
              objc_msgSend(v15, "objectID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[EDConversationRemoteCloudKitStorage _removeConversationInfoWithObjectId:save:managedObjectContext:](self, "_removeConversationInfoWithObjectId:save:managedObjectContext:", v17, 0, v7);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          }
          while (v12);
        }

        v10 = 1;
      }

    }
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  }
  while (v24);

  if ((v10 & 1) != 0)
  {
    v27 = 0;
    v20 = objc_msgSend(v7, "save:", &v27);
    v8 = v27;
    if ((v20 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDConversationRemoteCloudKitStorage _handleDuplicationsForConversationUUIDs:managedObjectContext:].cold.1();
      }

    }
    goto LABEL_24;
  }
LABEL_25:

}

- (id)_conversationInfoWithUUID:(id)a3 managedObjectContext:(id)a4
{
  void *v4;
  void *v5;

  -[EDConversationRemoteCloudKitStorage _conversationInfosWithUUID:managedObjectContext:](self, "_conversationInfosWithUUID:managedObjectContext:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_conversationInfosWithUUID:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[EDConversationInfo fetchRequest](EDConversationInfo, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("conversationUUID == %@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("lastModified"), 0);
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  v15 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _conversationInfosWithUUID:managedObjectContext:].cold.1();
    }

  }
  return v11;
}

- (void)_addOrUpdateConversationInfo:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9[5];

  v9[4] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  v9[0] = 0;
  v6 = objc_msgSend(a4, "save:", v9);
  v7 = v9[0];
  if ((v6 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "conversationUUID");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _addOrUpdateConversationInfo:managedObjectContext:].cold.1();
    }

  }
}

- (void)_updateConversationInfo:(id)a3 withAnotherConversationInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "setNotifyMe:", objc_msgSend(v5, "notifyMe"));
  objc_msgSend(v8, "setMuted:", objc_msgSend(v5, "muted"));
  objc_msgSend(v5, "messageIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMessageIds:", v6);

  objc_msgSend(v5, "lastModified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastModified:", v7);

}

- (void)_removeConversationInfoWithId:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12[5];

  v12[4] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDConversationRemoteCloudKitStorage _conversationInfoWithUUID:managedObjectContext:](self, "_conversationInfoWithUUID:managedObjectContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "deleteObject:", v8);
    v12[0] = 0;
    v9 = objc_msgSend(v7, "save:", v12);
    v10 = v12[0];
    if ((v9 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDConversationRemoteCloudKitStorage _removeConversationInfoWithId:managedObjectContext:].cold.1();
      }

    }
  }

}

- (void)_removeConversationInfoWithObjectId:(id)a3 save:(BOOL)a4 managedObjectContext:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16[9];

  v6 = a4;
  v16[8] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v16[0] = 0;
  objc_msgSend(v8, "existingObjectWithID:error:", v7, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16[0];
  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _removeConversationInfoWithObjectId:save:managedObjectContext:].cold.2();
    }

  }
  if (v9)
  {
    objc_msgSend(v8, "deleteObject:", v9);
    if (v6)
    {
      v15 = 0;
      v12 = objc_msgSend(v8, "save:", &v15);
      v13 = v15;
      if ((v12 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[EDConversationRemoteCloudKitStorage _removeConversationInfoWithId:managedObjectContext:].cold.1();
        }

      }
    }
  }

}

- (id)allConversationInfosInManagedObjectContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9[5];

  v9[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  +[EDConversationInfo fetchRequest](EDConversationInfo, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9[0];
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage allConversationInfosInManagedObjectContext:].cold.1();
    }

  }
  return v5;
}

- (id)_controlInManagedObjectContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10[5];

  v10[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  +[EDCloudKitControl fetchRequest](EDCloudKitControl, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10[0];
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _controlInManagedObjectContext:].cold.1();
    }

  }
  return v7;
}

- (void)_handleWillResetSyncDataNotification:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__EDConversationRemoteCloudKitStorage__handleWillResetSyncDataNotification___block_invoke;
  v5[3] = &unk_1E949BF98;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

void __76__EDConversationRemoteCloudKitStorage__handleWillResetSyncDataNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  void *v5;
  uint8_t v6[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "CoreData will reset sync couldKit data", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationRemoteStorageWillResetData:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_handleDidResetSyncDataNotification:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[EDConversationRemoteCloudKitStorage mirroringPersistentStore](self, "mirroringPersistentStore", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__EDConversationRemoteCloudKitStorage__handleDidResetSyncDataNotification___block_invoke;
  v5[3] = &unk_1E949BF98;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

void __75__EDConversationRemoteCloudKitStorage__handleDidResetSyncDataNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  void *v5;
  uint8_t v6[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "CoreData did reset sync couldKit data", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationRemoteStorageDidResetData:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_retrieveChangesSinceLastRequestInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  EDConversationRemoteCloudKitStorage *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  -[EDConversationRemoteCloudKitStorage historyToken](self, "historyToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = 2;
  else
    v6 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[EDConversationRemoteCloudKitStorage historyToken](self, "historyToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke;
  v14[3] = &unk_1E949C100;
  v8 = v4;
  v15 = v8;
  v16 = self;
  v17 = &v18;
  -[EDConversationRemoteCloudKitStorage enumerateChangeHistorySinceToken:managedObjectContext:usingBlock:](self, "enumerateChangeHistorySinceToken:managedObjectContext:usingBlock:", v7, v8, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDConversationRemoteCloudKitStorage setHistoryToken:](self, "setHistoryToken:", v9);

  if (objc_msgSend((id)v19[5], "count"))
  {
    objc_msgSend((id)v19[5], "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDConversationRemoteCloudKitStorage _handleDuplicationsForConversationUUIDs:managedObjectContext:](self, "_handleDuplicationsForConversationUUIDs:managedObjectContext:", v10, v8);

    objc_msgSend((id)objc_opt_class(), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_INFO, "Finished handling core data changes", v13, 2u);
    }

    -[EDConversationRemoteCloudKitStorage delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversationRemoteStorage:didChangeEntries:reason:", self, v19[5], v6);

  }
  -[EDConversationRemoteCloudKitStorage persistHistoryToken](self, "persistHistoryToken");

  _Block_object_dispose(&v18, 8);
}

void __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  _BYTE v29[15];
  char v30;
  _BYTE v31[15];
  char v32;
  _BYTE v33[15];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  objc_msgSend(v27, "author");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v4 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v4;
  objc_msgSend((id)v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transactionAuthor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v4 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "Started handling core data changes", buf, 2u);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v27, "changes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v35;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1D824B334]();
          v14 = objc_msgSend(v12, "changeType");
          if (!v14)
          {
            v24 = *(void **)(a1 + 40);
            objc_msgSend(v12, "changedObjectID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "_conversationInfoWithObjectId:managedObjectContext:", v25, *(_QWORD *)(a1 + 32));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
            {
              objc_msgSend((id)objc_opt_class(), "log");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_1(&v32, v33);
              goto LABEL_30;
            }
            objc_msgSend((id)objc_opt_class(), "log");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v39 = v17;
              _os_log_debug_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEBUG, "EDConversationInfo added. %{public}@", buf, 0xCu);
            }
LABEL_19:

            objc_msgSend(*(id *)(a1 + 40), "dictionaryForConversationInfo:", v17);
            v18 = objc_claimAutoreleasedReturnValue();
            v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            objc_msgSend(v17, "conversationUUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, v23);

            goto LABEL_30;
          }
          if (v14 == 1)
          {
            v19 = *(void **)(a1 + 40);
            objc_msgSend(v12, "changedObjectID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "_conversationInfoWithObjectId:managedObjectContext:", v20, *(_QWORD *)(a1 + 32));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
            {
              objc_msgSend((id)objc_opt_class(), "log");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_2(&v30, v31);
              goto LABEL_30;
            }
            objc_msgSend((id)objc_opt_class(), "log");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v39 = v17;
              _os_log_debug_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEBUG, "EDConversationInfo updated/inserted. %{public}@", buf, 0xCu);
            }
            goto LABEL_19;
          }
          if (v14 != 2)
            goto LABEL_31;
          objc_msgSend((id)objc_opt_class(), "log");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "changedObjectID");
            objc_claimAutoreleasedReturnValue();
            __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_4();
          }

          objc_msgSend(v12, "tombstone");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("conversationUUID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v18, v17);
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "log");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_3(&v28, v29);
          }
LABEL_30:

LABEL_31:
          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v9);
    }

  }
}

- (id)enumerateChangeHistorySinceToken:(id)a3 managedObjectContext:(id)a4 usingBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *, _BYTE *);
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, _BYTE *))a5;
  v10 = v8;
  v27 = 0;
  -[EDConversationRemoteCloudKitStorage _transactionHistorySinceToken:managedObjectContext:error:](self, "_transactionHistorySinceToken:managedObjectContext:error:", v10, a4, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;
  v13 = v10;
  if (v11)
  {
    v13 = v10;
    if (objc_msgSend(v11, "count"))
    {
      v26 = 0;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      v13 = v10;
      if (v15)
      {
        v16 = *(_QWORD *)v23;
        v13 = v10;
LABEL_5:
        v17 = 0;
        v18 = v13;
        while (1)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v17);
          v9[2](v9, v19, &v26);
          objc_msgSend(v19, "token", (_QWORD)v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            break;
          ++v17;
          v18 = v13;
          if (v15 == v17)
          {
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
            if (v15)
              goto LABEL_5;
            break;
          }
        }
      }

    }
  }
  if (v12 && objc_msgSend(v12, "code") == 134301)
    v20 = 0;
  else
    v20 = v13;

  return v20;
}

- (id)_transactionHistorySinceToken:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v16[5];

  v16[4] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterToken:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultType:", 5);
  v16[0] = 0;
  objc_msgSend(v8, "executeRequest:error:", v9, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16[0];
  v12 = v11;
  if (a5)
    *a5 = objc_retainAutorelease(v11);
  if (!v10 || objc_msgSend(v10, "resultType") != 5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _transactionHistorySinceToken:managedObjectContext:error:].cold.1();
    }
    goto LABEL_11;
  }
  objc_msgSend(v10, "result");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[EDConversationRemoteCloudKitStorage _transactionHistorySinceToken:managedObjectContext:error:].cold.2((uint64_t)v13, v14);

LABEL_11:
    v13 = 0;
  }

  return v13;
}

- (id)_conversationInfoWithObjectId:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v14[5];

  v14[4] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  v14[0] = 0;
  objc_msgSend(a4, "existingObjectWithID:error:", v5, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14[0];
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDConversationRemoteCloudKitStorage _conversationInfoWithObjectId:managedObjectContext:].cold.1();
    }

  }
  if (v6
    && (objc_msgSend(v6, "entity"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "name"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ConversationInfo")),
        v10,
        v9,
        v11))
  {
    v12 = v6;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (EDCloudMirroringPersistentStore)mirroringPersistentStore
{
  return self->_mirroringPersistentStore;
}

- (EDConversationRemoteStorageDelegate)delegate
{
  return (EDConversationRemoteStorageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (NSPersistentHistoryToken)historyToken
{
  return self->_historyToken;
}

- (void)setHistoryToken:(id)a3
{
  objc_storeStrong((id *)&self->_historyToken, a3);
}

- (EDTransactionService)exportTransaction
{
  return self->_exportTransaction;
}

- (void)setExportTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_exportTransaction, a3);
}

- (EDTransactionService)importTransaction
{
  return self->_importTransaction;
}

- (void)setImportTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_importTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importTransaction, 0);
  objc_storeStrong((id *)&self->_exportTransaction, 0);
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mirroringPersistentStore, 0);
}

void __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_8_0(&dword_1D2F2C000, a1, a3, "Found pending import transaction. Retrying request import", v3);
}

void __52__EDConversationRemoteCloudKitStorage__initialSetup__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_8_0(&dword_1D2F2C000, a1, a3, "Found pending export transaction. Retrying request export", v3);
}

void __65__EDConversationRemoteCloudKitStorage_setMigratedFromKVSStorage___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to save Control - Error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_handleDuplicationsForConversationUUIDs:managedObjectContext:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to save _handleDuplicationsForConversationUUIDs - Error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_conversationInfosWithUUID:managedObjectContext:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to fetching EDConversationInfo with ID: %{public}@ - Error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_addOrUpdateConversationInfo:managedObjectContext:.cold.1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_4_0();
  v2 = (void *)v1;
  OUTLINED_FUNCTION_1_1(v1, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to save EDConversationInfo %{public}@ - Error: %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_removeConversationInfoWithId:managedObjectContext:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to delete EDConversationInfo %{public}@ - Error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_removeConversationInfoWithObjectId:save:managedObjectContext:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed fetching EDConversationInfo to remove. ObjectId: %{public}@ - Error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)allConversationInfosInManagedObjectContext:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to fetching allConversationInfos- Error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_controlInManagedObjectContext:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to fetching cloudKitControl: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9_0(a1, a2);
  OUTLINED_FUNCTION_8_1(&dword_1D2F2C000, v2, v3, "Ignoring insert because object does not exist.", v4);
}

void __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9_0(a1, a2);
  OUTLINED_FUNCTION_8_1(&dword_1D2F2C000, v2, v3, "Ignoring update because objecvt does not exist.", v4);
}

void __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9_0(a1, a2);
  OUTLINED_FUNCTION_8_0(&dword_1D2F2C000, v2, (uint64_t)v2, "Deletion operation does not have ConversationUUID.", v3);
}

void __94__EDConversationRemoteCloudKitStorage__retrieveChangesSinceLastRequestInManagedObjectContext___block_invoke_cold_4()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  os_log_t v5;

  OUTLINED_FUNCTION_8();
  *v1 = 138543362;
  *v3 = v2;
  _os_log_debug_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEBUG, "EDConversationInfo deleted. %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

- (void)_transactionHistorySinceToken:managedObjectContext:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to fetch change history (%{public}@.)", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_transactionHistorySinceToken:(uint64_t)a1 managedObjectContext:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_ERROR, "persistentHistoryResult.result is not an array. Ignoring it %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_conversationInfoWithObjectId:managedObjectContext:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed fetching EDConversationInfo. ObjectId: %{public}@ - Error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

@end
