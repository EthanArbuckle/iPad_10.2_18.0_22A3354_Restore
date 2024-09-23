@implementation ASKStorefrontChangeProvider

- (ASKStorefrontChangeProvider)initWithBlock:(id)a3
{
  id v4;
  ASKStorefrontChangeProvider *v5;
  uint64_t v6;
  id block;
  dispatch_queue_t v8;
  OS_dispatch_queue *notifyQueue;
  uint64_t v10;
  ACAccountStore *accountStore;
  void *v12;
  uint64_t v13;
  ACAccount *activeAccount;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ASKStorefrontChangeProvider;
  v5 = -[ASKStorefrontChangeProvider init](&v26, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v8 = dispatch_queue_create("ASKStorefrontChangeProvider", 0);
    notifyQueue = v5->_notifyQueue;
    v5->_notifyQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v10 = objc_claimAutoreleasedReturnValue();
    accountStore = v5->_accountStore;
    v5->_accountStore = (ACAccountStore *)v10;

    -[ASKStorefrontChangeProvider accountStore](v5, "accountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_activeiTunesAccount");
    v13 = objc_claimAutoreleasedReturnValue();
    activeAccount = v5->_activeAccount;
    v5->_activeAccount = (ACAccount *)v13;

    -[ASKStorefrontChangeProvider accountStore](v5, "accountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ams_fetchLocaliTunesAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v5);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke;
    v23 = &unk_1E9DC1BC8;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v16, "addSuccessBlock:", &v20);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v20, v21, v22, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASKStorefrontChangeProvider accountStore](v5, "accountStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel_accountStoreDidChange_, *MEMORY[0x1E0C8F010], v18);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

void __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLocalAccount:", *(_QWORD *)(a1 + 32));

}

- (void)setLocalAccount:(id)a3
{
  objc_storeStrong((id *)&self->_localAccount, a3);
}

void __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ASKStorefrontChangeProvider_initWithBlock___block_invoke_2;
  v5[3] = &unk_1E9DC1BA0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C8F010];
  -[ASKStorefrontChangeProvider accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)ASKStorefrontChangeProvider;
  -[ASKStorefrontChangeProvider dealloc](&v6, sel_dealloc);
}

- (BOOL)hasStorefrontChangedFromAccount:(id)a3 toAccount:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v5 = a4;
  objc_msgSend(a3, "ams_storefront");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_storefront");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v6 | v7)
    v8 = objc_msgSend((id)v6, "isEqual:", v7) ^ 1;
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (BOOL)hasManagedStateChangedFromAccount:(id)a3 toAccount:(id)a4
{
  id v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  id v10;
  char v11;

  v5 = a4;
  objc_msgSend(a3, "accountPropertyForKey:", CFSTR("isManagedAppleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = objc_msgSend(v7, "BOOLValue");
  objc_msgSend(v5, "accountPropertyForKey:", CFSTR("isManagedAppleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  v11 = objc_msgSend(v10, "BOOLValue");
  return v8 ^ v11;
}

- (void)accountStoreDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  v4 = a3;
  -[ASKStorefrontChangeProvider accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_fetchLocaliTunesAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke;
  v7[3] = &unk_1E9DC1C40;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  objc_msgSend(v6, "addSuccessBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke_2;
  block[3] = &unk_1E9DC1C18;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "localAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  objc_msgSend(WeakRetained, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_activeiTunesAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "notifyQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke_3;
  block[3] = &unk_1E9DC1BF0;
  block[4] = WeakRetained;
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v7;
  v9 = v7;
  v10 = v5;
  v11 = v4;
  v12 = v3;
  dispatch_async(v8, block);

  objc_msgSend(WeakRetained, "setLocalAccount:", v11);
  objc_msgSend(WeakRetained, "setActiveAccount:", v9);

}

void __53__ASKStorefrontChangeProvider_accountStoreDidChange___block_invoke_3(uint64_t a1)
{
  void (**v2)(void);

  if ((objc_msgSend(*(id *)(a1 + 32), "hasStorefrontChangedFromAccount:toAccount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)) & 1) != 0|| objc_msgSend(*(id *)(a1 + 32), "hasManagedStateChangedFromAccount:toAccount:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)))
  {
    objc_msgSend(*(id *)(a1 + 32), "block");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (ACAccount)localAccount
{
  return self->_localAccount;
}

- (ACAccount)activeAccount
{
  return self->_activeAccount;
}

- (void)setActiveAccount:(id)a3
{
  objc_storeStrong((id *)&self->_activeAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_localAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
