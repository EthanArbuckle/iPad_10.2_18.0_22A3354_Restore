@implementation DAAccountMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_1);
  return (id)sharedMonitor___sharedInstance;
}

void __33__DAAccountMonitor_sharedMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedMonitor___sharedInstance;
  sharedMonitor___sharedInstance = v0;

}

- (DAAccountMonitor)init
{
  DAAccountMonitor *v2;
  void *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DAAccountMonitor;
  v2 = -[DAAccountMonitor init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAccountMonitor setAccounts:](v2, "setAccounts:", v3);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.dataaccess.accountmonitor", v4);
    -[DAAccountMonitor setAccountsQueue:](v2, "setAccountsQueue:", v5);

  }
  return v2;
}

- (void)monitorAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DAAccountMonitor accountsQueue](self, "accountsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__DAAccountMonitor_monitorAccount___block_invoke;
  block[3] = &unk_1E7B923C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __35__DAAccountMonitor_monitorAccount___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "accounts");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)unmonitorAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DAAccountMonitor accountsQueue](self, "accountsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__DAAccountMonitor_unmonitorAccount___block_invoke;
  block[3] = &unk_1E7B923C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __37__DAAccountMonitor_unmonitorAccount___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "accounts");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (id)monitoredAccounts
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
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[DAAccountMonitor accountsQueue](self, "accountsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__DAAccountMonitor_monitoredAccounts__block_invoke;
  v6[3] = &unk_1E7B924A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__DAAccountMonitor_monitoredAccounts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "accounts");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSHashTable)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_accounts, a3);
}

- (OS_dispatch_queue)accountsQueue
{
  return self->_accountsQueue;
}

- (void)setAccountsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsQueue, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

@end
