@implementation CNContainerCache

+ (id)os_log
{
  if (os_log_cn_once_token_0_20 != -1)
    dispatch_once(&os_log_cn_once_token_0_20, &__block_literal_global_129);
  return (id)os_log_cn_once_object_0_20;
}

void __26__CNContainerCache_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNContainerCache");
  v1 = (void *)os_log_cn_once_object_0_20;
  os_log_cn_once_object_0_20 = (uint64_t)v0;

}

- (CNContainerCache)initWithContactStore:(id)a3
{
  id v4;
  CNContainerCache *v5;
  CNContainerCache *v6;
  ACAccountStore *accountStore;
  CNCache *v8;
  CNCache *cachedAccounts;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  void *v12;
  void *v13;
  CNContainerCache *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNContainerCache;
  v5 = -[CNContainerCache init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_contactStore, v4);
    accountStore = v6->_accountStore;
    v6->_accountStore = 0;

    v8 = (CNCache *)objc_alloc_init(MEMORY[0x1E0D139B0]);
    cachedAccounts = v6->_cachedAccounts;
    v6->_cachedAccounts = v8;

    v10 = dispatch_queue_create("com.apple.Contacts.CNContainerCache", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel_accountStoreDidChange, *MEMORY[0x1E0C8F1C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_contactStoreDidChange, CFSTR("CNContactStoreDidChangeNotification"), 0);

    v14 = v6;
  }

  return v6;
}

- (void)accountStoreDidChange
{
  NSObject *v3;
  _QWORD block[5];

  -[CNContainerCache workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CNContainerCache_accountStoreDidChange__block_invoke;
  block[3] = &unk_1E29F8508;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __41__CNContainerCache_accountStoreDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetAccountCache");
}

- (void)contactStoreDidChange
{
  NSObject *v3;
  _QWORD block[5];

  -[CNContainerCache workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CNContainerCache_contactStoreDidChange__block_invoke;
  block[3] = &unk_1E29F8508;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __41__CNContainerCache_contactStoreDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetPrimaryiCloudContainer");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNContainerCache;
  -[CNContainerCache dealloc](&v4, sel_dealloc);
}

- (ACAccountStore)accountStore
{
  ACAccountStore *accountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (CNContainer)primaryiCloudContainer
{
  NSObject *v3;
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
  v10 = __Block_byref_object_copy__31;
  v11 = __Block_byref_object_dispose__31;
  v12 = 0;
  -[CNContainerCache workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CNContainerCache_primaryiCloudContainer__block_invoke;
  v6[3] = &unk_1E29FCCB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CNContainer *)v4;
}

void __42__CNContainerCache_primaryiCloudContainer__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "onWorkQueue_findPrimaryiCloudContainer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (id)onWorkQueue_findPrimaryiCloudContainer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  +[CNContainer predicateForContainersIncludingDisabled:](CNContainer, "predicateForContainersIncludingDisabled:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContainerCache contactStore](self, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "containersMatchingPredicate:error:", v3, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CNContainerCache onWorkQueue_findPrimaryiCloudContainer].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    v14 = 0;
  }
  else
  {
    objc_msgSend(v5, "_cn_filter:", &__block_literal_global_14_3);
    v7 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__CNContainerCache_onWorkQueue_findPrimaryiCloudContainer__block_invoke_2;
    v16[3] = &unk_1E29FDB50;
    v16[4] = self;
    -[NSObject _cn_firstObjectPassingTest:](v7, "_cn_firstObjectPassingTest:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

BOOL __58__CNContainerCache_onWorkQueue_findPrimaryiCloudContainer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 3;
}

uint64_t __58__CNContainerCache_onWorkQueue_findPrimaryiCloudContainer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  unsigned int v6;

  objc_msgSend(*(id *)(a1 + 32), "accountForContainer:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_cn_isPrimaryAccount");
  objc_msgSend(v2, "accountType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  return v3 & v6;
}

- (id)accountForContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  if (v4)
  {
    -[CNContainerCache cachedAccounts](self, "cachedAccounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__CNContainerCache_accountForContainer___block_invoke;
    v13[3] = &unk_1E29FDB78;
    v13[4] = self;
    v14 = v4;
    objc_msgSend(v5, "objectForKey:onCacheMiss:", v6, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E0D13880] + 16))(*MEMORY[0x1E0D13880], v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __40__CNContainerCache_accountForContainer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  objc_msgSend(*(id *)(a1 + 32), "cnAccountForContainer:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalIdentifierString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "displayAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __40__CNContainerCache_accountForContainer___block_invoke_cold_1(v8);

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)cnAccountForContainer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAccount predicateForAccountForContainerWithIdentifier:](CNAccount, "predicateForAccountForContainerWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContainerCache contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "accountsMatchingPredicate:error:", v5, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;

  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CNContainerCache cnAccountForContainer:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

    v16 = 0;
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)resetAccountCache
{
  -[CNContainerCache setCachedAccounts:](self, "setCachedAccounts:", 0);
}

- (void)resetPrimaryiCloudContainer
{
  -[CNContainerCache setPrimaryiCloudContainer:](self, "setPrimaryiCloudContainer:", 0);
}

- (void)setPrimaryiCloudContainer:(id)a3
{
  objc_storeStrong((id *)&self->_primaryiCloudContainer, a3);
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_loadWeakRetained((id *)&self->_contactStore);
}

- (void)setContactStore:(id)a3
{
  objc_storeWeak((id *)&self->_contactStore, a3);
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (CNCache)cachedAccounts
{
  return self->_cachedAccounts;
}

- (void)setCachedAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAccounts, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_destroyWeak((id *)&self->_contactStore);
  objc_storeStrong((id *)&self->_primaryiCloudContainer, 0);
}

- (void)onWorkQueue_findPrimaryiCloudContainer
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Error when fetching CNContainers: %{public}@", a5, a6, a7, a8, 2u);
}

void __40__CNContainerCache_accountForContainer___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Error when fetching expected ACAccount, received nil", v1, 2u);
}

- (void)cnAccountForContainer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Error when fetching CNAccounts: %{public}@", a5, a6, a7, a8, 2u);
}

@end
