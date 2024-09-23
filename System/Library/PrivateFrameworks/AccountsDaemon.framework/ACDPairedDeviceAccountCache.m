@implementation ACDPairedDeviceAccountCache

+ (ACDPairedDeviceAccountCache)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  return (ACDPairedDeviceAccountCache *)(id)sharedInstance_sharedInstance_0;
}

void __45__ACDPairedDeviceAccountCache_sharedInstance__block_invoke()
{
  ACDPairedDeviceAccountCache *v0;
  void *v1;

  v0 = objc_alloc_init(ACDPairedDeviceAccountCache);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (ACDPairedDeviceAccountCache)init
{
  ACDPairedDeviceAccountCache *v2;
  ACDPairedDeviceAccountCache *v3;
  NSArray *accounts;
  NSMutableArray *completions;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *synchronizationQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ACDPairedDeviceAccountCache;
  v2 = -[ACDPairedDeviceAccountCache init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accountsIsValid = 0;
    accounts = v2->_accounts;
    v2->_accounts = 0;

    completions = v3->_completions;
    v3->_completions = 0;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.accounts.ACDPairedDeviceAccountCache", v7);
    synchronizationQueue = v3->_synchronizationQueue;
    v3->_synchronizationQueue = (OS_dispatch_queue *)v8;

  }
  return v3;
}

- (void)accountsFromRemoteDeviceProxy:(id)a3 ignoreCache:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *synchronizationQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  synchronizationQueue = self->_synchronizationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__ACDPairedDeviceAccountCache_accountsFromRemoteDeviceProxy_ignoreCache_options_completion___block_invoke;
  block[3] = &unk_24C7E32D8;
  v21 = a4;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(synchronizationQueue, block);

}

void __92__ACDPairedDeviceAccountCache_accountsFromRemoteDeviceProxy_ignoreCache_options_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = v3;
    v20 = 2112;
    v21 = v4;
    v22 = 2112;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_20D8CB000, v2, OS_LOG_TYPE_DEFAULT, "\"_accountsIsValid %@ ignoreCache %@ _accounts.count %@ _completions.count %@\", (uint8_t *)&v18, 0x2Au);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 16) && !*(_BYTE *)(a1 + 64))
  {
    v17 = *(_QWORD *)(a1 + 56);
    if (v17)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v17 + 16))(v17, *(_QWORD *)(v7 + 24), 0);
  }
  else
  {
    v8 = *(void **)(v7 + 32);
    if (v8)
    {
      v9 = _Block_copy(*(const void **)(a1 + 56));
      objc_msgSend(v8, "addObject:", v9);

    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 32);
      *(_QWORD *)(v11 + 32) = v10;

      v13 = *(const void **)(a1 + 56);
      if (v13)
      {
        v14 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        v15 = _Block_copy(v13);
        objc_msgSend(v14, "addObject:", v15);

      }
      _ACDLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEFAULT, "\"will fetch from remote device\", (uint8_t *)&v18, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "sendCommand:withAccount:options:completion:", *MEMORY[0x24BDB4318], 0, *(_QWORD *)(a1 + 48), &__block_literal_global_6);
    }
  }
}

void __92__ACDPairedDeviceAccountCache_accountsFromRemoteDeviceProxy_ignoreCache_options_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  +[ACDPairedDeviceAccountCache sharedInstance](ACDPairedDeviceAccountCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_didFetchAccounts:error:", v7, v5);

}

- (void)_didFetchAccounts:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *synchronizationQueue;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  id v24;
  _BYTE *v25;
  uint8_t v26[128];
  uint8_t v27[4];
  void *v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ACDLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_20D8CB000, v8, OS_LOG_TYPE_DEFAULT, "\"fetched accounts.count %@ error %@\", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__8;
  v31 = __Block_byref_object_dispose__8;
  v32 = 0;
  synchronizationQueue = self->_synchronizationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ACDPairedDeviceAccountCache__didFetchAccounts_error___block_invoke;
  block[3] = &unk_24C7E20E0;
  block[4] = self;
  v11 = v6;
  v24 = v11;
  v25 = buf;
  dispatch_sync(synchronizationQueue, block);
  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v27 = 138412290;
    v28 = v13;
    _os_log_impl(&dword_20D8CB000, v12, OS_LOG_TYPE_DEFAULT, "\"calling %@ completions\", v27, 0xCu);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17);
        if (v18)
          (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v11, v7);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    }
    while (v15);
  }

  _Block_object_dispose(buf, 8);
}

void __55__ACDPairedDeviceAccountCache__didFetchAccounts_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 40) != 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

- (void)invalidate
{
  NSObject *synchronizationQueue;
  _QWORD block[5];

  synchronizationQueue = self->_synchronizationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ACDPairedDeviceAccountCache_invalidate__block_invoke;
  block[3] = &unk_24C7E2130;
  block[4] = self;
  dispatch_async(synchronizationQueue, block);
}

void __41__ACDPairedDeviceAccountCache_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D8CB000, v2, OS_LOG_TYPE_DEFAULT, "\"will invalidate\", v5, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
}

@end
