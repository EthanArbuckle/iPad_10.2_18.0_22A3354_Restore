@implementation ACMonitoredAccountStore

void __49__ACMonitoredAccountStore__registerNotifyReaders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_reregisterForAccountType:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_registerNotifyReaders
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  ACNotifyReader *v10;
  void *v11;
  ACNotifyReader *v12;
  NSSet *monitoringReaders;
  NSSet *obj;
  _QWORD v15[5];
  id v16;
  id location;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_accountTypesToMonitor;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        +[ACNotifyAccountCache suffixForAccountsForAccountType:fetchOptions:](ACNotifyAccountCache, "suffixForAccountsForAccountType:fetchOptions:", v7, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[ACNotifyAccountCache cacheKeyForSuffix:](ACNotifyAccountCache, "cacheKeyForSuffix:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, self);
        v10 = [ACNotifyReader alloc];
        -[ACAccountStore replyQueue](self, "replyQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __49__ACMonitoredAccountStore__registerNotifyReaders__block_invoke;
        v15[3] = &unk_1E48924F0;
        objc_copyWeak(&v16, &location);
        v15[4] = v7;
        v12 = -[ACNotifyReader initWithKey:updateQueue:updateBlock:](v10, "initWithKey:updateQueue:updateBlock:", v9, v11, v15);
        -[NSSet addObject:](v3, "addObject:", v12);

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);

      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  monitoringReaders = self->_monitoringReaders;
  self->_monitoringReaders = v3;

}

- (NSArray)monitoredAccounts
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_accountsByID;
  objc_sync_enter(v3);
  -[NSMutableDictionary allValues](self->_accountsByID, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (id)monitoredAccountWithIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_accountsByID;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accountsByID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

uint64_t __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "registerMonitorForAccountsOfTypes:propertiesToPrefetch:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), *(_QWORD *)(a1 + 40));
}

uint64_t __78__ACMonitoredAccountStore__registerAccountMonitorSynchronouslyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "registerMonitorForAccountsOfTypes:propertiesToPrefetch:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), *(_QWORD *)(a1 + 40));
}

- (ACMonitoredAccountStore)initWithAccountTypes:(id)a3 delegate:(id)a4
{
  return -[ACMonitoredAccountStore initWithAccountTypes:propertiesToPrefetch:delegate:](self, "initWithAccountTypes:propertiesToPrefetch:delegate:", a3, 0, a4);
}

uint64_t __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (ACMonitoredAccountStore)initWithAccountTypes:(id)a3 propertiesToPrefetch:(id)a4 delegate:(id)a5
{
  return -[ACMonitoredAccountStore initWithWithRemoteEndpoint:effectiveBundleID:accountTypes:propertiesToPrefetch:delegate:](self, "initWithWithRemoteEndpoint:effectiveBundleID:accountTypes:propertiesToPrefetch:delegate:", 0, 0, a3, a4, a5);
}

- (ACMonitoredAccountStore)initWithWithRemoteEndpoint:(id)a3 effectiveBundleID:(id)a4 accountTypes:(id)a5 propertiesToPrefetch:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  ACMonitoredAccountStore *v16;
  uint64_t v17;
  NSMutableDictionary *accountsByID;
  uint64_t v19;
  NSHashTable *delegates;
  objc_super v22;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ACMonitoredAccountStore;
  v16 = -[ACAccountStore initWithRemoteEndpoint:effectiveBundleID:](&v22, sel_initWithRemoteEndpoint_effectiveBundleID_, a3, a4);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    accountsByID = v16->_accountsByID;
    v16->_accountsByID = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v19 = objc_claimAutoreleasedReturnValue();
    delegates = v16->_delegates;
    v16->_delegates = (NSHashTable *)v19;

    -[NSHashTable addObject:](v16->_delegates, "addObject:", v15);
    objc_storeStrong((id *)&v16->_accountTypesToMonitor, a5);
    objc_storeStrong((id *)&v16->_propertiesToPrefetch, a6);
    -[ACMonitoredAccountStore _registerForApplicationStateDidChangeNotification](v16, "_registerForApplicationStateDidChangeNotification");
  }

  return v16;
}

void __58__ACMonitoredAccountStore_registerSynchronouslyWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  const __CFString *v11;
  NSObject *v12;
  id *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  int v25;
  id v26;
  __int16 v27;
  double v28;
  __int16 v29;
  id v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = &stru_1E4894AE8;
    if (v6)
      v11 = v6;
    v25 = 138412546;
    v26 = v5;
    v27 = 2112;
    v28 = *(double *)&v11;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v9, OS_SIGNPOST_INTERVAL_END, v10, "RegisterTypesToMonitorSync", "%@%@", (uint8_t *)&v25, 0x16u);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v23 = *(void **)(a1 + 48);
    v25 = 134218754;
    v26 = v23;
    v24 = &stru_1E4894AE8;
    v27 = 2048;
    v28 = (double)Nanoseconds / 1000000000.0;
    v29 = 2112;
    v30 = v5;
    if (v6)
      v24 = v6;
    v31 = 2112;
    v32 = v24;
    _os_log_debug_impl(&dword_1A2BCD000, v12, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RegisterTypesToMonitorSync %@%@", (uint8_t *)&v25, 0x2Au);
  }

  v13 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_registerNotifyReaders");
  if (v6 && -[__CFString code](v6, "code") == 7)
  {
    _ACLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __58__ACMonitoredAccountStore_registerSynchronouslyWithError___block_invoke_cold_1(a1 + 32, v14, v15, v16, v17, v18, v19, v20);

  }
  else if (v5)
  {
    objc_msgSend(*v13, "_accountsListPopulated:", v5);
    objc_msgSend(*v13, "_registerForCredentialChangedNotifications");
  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v6;

}

- (void)_registerForCredentialChangedNotifications
{
  void *v3;
  NSObject *v4;
  NSObject *credentialsDidChangeObserver;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__ACMonitoredAccountStore__registerForCredentialChangedNotifications__block_invoke;
  v6[3] = &unk_1E4892568;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("ACAccountCredentialsDidChangeNotification"), 0, 0, v6);
  v4 = objc_claimAutoreleasedReturnValue();
  credentialsDidChangeObserver = self->_credentialsDidChangeObserver;
  self->_credentialsDidChangeObserver = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_accountsListPopulated:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *accountsByID;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_accountsByID;
  objc_sync_enter(v5);
  -[NSMutableDictionary removeAllObjects](self->_accountsByID, "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "_setAccountStore:", self, (_QWORD)v13);
        accountsByID = self->_accountsByID;
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](accountsByID, "setObject:forKeyedSubscript:", v10, v12);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
  -[ACMonitoredAccountStore _sendNotificationOfChange](self, "_sendNotificationOfChange");

}

- (void)_sendNotificationOfChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ACMonitoredAccountStoreDidChangeNotification"), self);

}

void __50__ACMonitoredAccountStore_registerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  const __CFString *v11;
  NSObject *v12;
  id WeakRetained;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  int v24;
  id v25;
  __int16 v26;
  double v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _ACSignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _ACSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = &stru_1E4894AE8;
    if (v6)
      v11 = v6;
    v24 = 138412546;
    v25 = v5;
    v26 = 2112;
    v27 = *(double *)&v11;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v9, OS_SIGNPOST_INTERVAL_END, v10, "RegisterTypesToMonitor", "%@%@", (uint8_t *)&v24, 0x16u);
  }

  _ACSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(void **)(a1 + 56);
    v24 = 134218754;
    v25 = v22;
    v23 = &stru_1E4894AE8;
    v26 = 2048;
    v27 = (double)Nanoseconds / 1000000000.0;
    v28 = 2112;
    v29 = v5;
    if (v6)
      v23 = v6;
    v30 = 2112;
    v31 = v23;
    _os_log_debug_impl(&dword_1A2BCD000, v12, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RegisterTypesToMonitor %@%@", (uint8_t *)&v24, 0x2Au);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_registerNotifyReaders");
    if (v6 && -[__CFString code](v6, "code") == 7)
    {
      _ACLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __50__ACMonitoredAccountStore_registerWithCompletion___block_invoke_cold_1(a1, v15, v16, v17, v18, v19, v20, v21);

    }
    else if (v5)
    {
      objc_msgSend(v14, "_accountsListPopulated:", v5);
      objc_msgSend(v14, "_registerForCredentialChangedNotifications");
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_2;
  block[3] = &unk_1E4892450;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

- (void)registerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSSet *accountTypesToMonitor;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17[3];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  NSSet *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/register-types-to-monitor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (char *)_ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    accountTypesToMonitor = self->_accountTypesToMonitor;
    *(_DWORD *)buf = 138412290;
    v20 = accountTypesToMonitor;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "RegisterTypesToMonitor", "%@", buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACMonitoredAccountStore registerWithCompletion:].cold.1();

  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__ACMonitoredAccountStore_registerWithCompletion___block_invoke;
  v15[3] = &unk_1E4892400;
  v17[1] = v7;
  v17[2] = v9;
  objc_copyWeak(v17, (id *)buf);
  v15[4] = self;
  v14 = v4;
  v16 = v14;
  -[ACMonitoredAccountStore _registerAccountMonitorWithCompletion:](self, "_registerAccountMonitorWithCompletion:", v15);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);

}

- (void)_registerAccountMonitorWithCompletion:(id)a3
{
  id v4;
  NSSet *accountTypesToMonitor;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  accountTypesToMonitor = self->_accountTypesToMonitor;
  if (!accountTypesToMonitor)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("_accountTypesToMonitor must be non-nil");
    goto LABEL_6;
  }
  if (!-[NSSet count](accountTypesToMonitor, "count"))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("_accountTypesToMonitor must not be empty");
LABEL_6:
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke;
  v19[3] = &unk_1E4892478;
  v19[4] = self;
  v20 = v4;
  v7 = v4;
  v8 = (void *)MEMORY[0x1A858A038](v19);
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_3;
  v17[3] = &unk_1E48924A0;
  v17[4] = self;
  v18 = v8;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_4;
  v15[3] = &unk_1E48924C8;
  v15[4] = self;
  v16 = v18;
  v10 = v18;
  ac_dispatch_remote(v9, v17, v15);

}

- (void)registerSynchronouslyWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSSet *accountTypesToMonitor;
  NSObject *v13;
  _QWORD v14[8];
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_1A2BCD000, "accounts/register-types-to-monitor-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _ACSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _ACSignpostCreate(v6);
  v9 = v8;

  _ACSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    accountTypesToMonitor = self->_accountTypesToMonitor;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = accountTypesToMonitor;
    _os_signpost_emit_with_name_impl(&dword_1A2BCD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RegisterTypesToMonitorSync", "%@", (uint8_t *)&buf, 0xCu);
  }

  _ACSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACMonitoredAccountStore registerSynchronouslyWithError:].cold.1();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__ACMonitoredAccountStore_registerSynchronouslyWithError___block_invoke;
  v14[3] = &unk_1E4892428;
  v14[6] = v7;
  v14[7] = v9;
  v14[4] = self;
  v14[5] = &buf;
  -[ACMonitoredAccountStore _registerAccountMonitorSynchronouslyWithCompletion:](self, "_registerAccountMonitorSynchronouslyWithCompletion:", v14);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

- (void)_registerAccountMonitorSynchronouslyWithCompletion:(id)a3
{
  id v4;
  NSSet *accountTypesToMonitor;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  accountTypesToMonitor = self->_accountTypesToMonitor;
  if (!accountTypesToMonitor)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = CFSTR("_accountTypesToMonitor must be non-nil");
    goto LABEL_6;
  }
  if (!-[NSSet count](accountTypesToMonitor, "count"))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = CFSTR("_accountTypesToMonitor must not be empty");
LABEL_6:
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  -[ACAccountStore remoteAccountStoreSession](self, "remoteAccountStoreSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__ACMonitoredAccountStore__registerAccountMonitorSynchronouslyWithCompletion___block_invoke;
  v15[3] = &unk_1E48924A0;
  v15[4] = self;
  v16 = v4;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __78__ACMonitoredAccountStore__registerAccountMonitorSynchronouslyWithCompletion___block_invoke_2;
  v13[3] = &unk_1E48924C8;
  v13[4] = self;
  v14 = v16;
  v8 = v16;
  ac_dispatch_remote_sync(v6, v15, v13);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_credentialsDidChangeObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_credentialsDidChangeObserver);

  }
  if (self->_remoteAccountDidChangeObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_remoteAccountDidChangeObserver);

  }
  if (self->_didBecomeActiveObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self->_didBecomeActiveObserver);

  }
  v6.receiver = self;
  v6.super_class = (Class)ACMonitoredAccountStore;
  -[ACAccountStore dealloc](&v6, sel_dealloc);
}

- (void)addDelegate:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_delegates;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_delegates, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeDelegate:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_delegates;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);
  objc_sync_exit(v4);

}

void __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __78__ACMonitoredAccountStore__registerAccountMonitorSynchronouslyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_connectionFailureError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)_reregisterForAccountType:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSArray *propertiesToPrefetch;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2BCD000, v5, OS_LOG_TYPE_DEFAULT, "\"ACMonitoredAccountStore: Attempting to reconnect to accountsd...\", buf, 2u);
  }

  if (v4)
  {
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    propertiesToPrefetch = self->_propertiesToPrefetch;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke;
    v9[3] = &unk_1E4892518;
    v9[4] = self;
    v10 = v4;
    -[ACAccountStore accountsWithAccountTypeIdentifiers:preloadedProperties:completion:](self, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", v6, propertiesToPrefetch, v9);

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke_2;
    v8[3] = &unk_1E4892540;
    v8[4] = self;
    -[ACMonitoredAccountStore _registerAccountMonitorWithCompletion:](self, "_registerAccountMonitorWithCompletion:", v8);
  }

}

uint64_t __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processAccountsListForNotifications:forType:", a2, *(_QWORD *)(a1 + 40));
}

void __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  _ACLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke_2_cold_1((uint64_t)v6, v8);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEFAULT, "\"ACMonitoredAccountStore: Reconnected to accountsd\", v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_processAccountsListForNotifications:forType:", v5, 0);
  }

}

- (void)_processAccountsListForNotifications:(id)a3 forType:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  char v29;
  void *v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACMonitoredAccountStore monitoredAccounts](self, "monitoredAccounts");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACMonitoredAccountStore monitoredAccountWithIdentifier:](self, "monitoredAccountWithIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "modificationID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "modificationID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if ((v17 & 1) == 0)
            -[ACMonitoredAccountStore accountWasModified:](self, "accountWasModified:", v12);
        }
        else
        {
          -[ACMonitoredAccountStore accountWasAdded:](self, "accountWasAdded:", v12);
        }
        objc_msgSend(v12, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v18);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = v30;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        if (v32)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "accountType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v32, "isEqualToString:", v26);

          if (!v27)
            continue;
        }
        objc_msgSend(v24, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v7, "containsObject:", v28);

        if ((v29 & 1) == 0)
          -[ACMonitoredAccountStore accountWasRemoved:](self, "accountWasRemoved:", v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v21);
  }

}

void __69__ACMonitoredAccountStore__registerForCredentialChangedNotifications__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "credentialsChangedNotification:", v3);

}

- (void)_registerForApplicationStateDidChangeNotification
{
  void *v3;
  NSObject *v4;
  NSObject *didBecomeActiveObserver;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__ACMonitoredAccountStore__registerForApplicationStateDidChangeNotification__block_invoke;
  v6[3] = &unk_1E4892590;
  v6[4] = self;
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillResignActiveNotification"), 0, 0, v6);
  v4 = objc_claimAutoreleasedReturnValue();
  didBecomeActiveObserver = self->_didBecomeActiveObserver;
  self->_didBecomeActiveObserver = v4;

}

uint64_t __76__ACMonitoredAccountStore__registerForApplicationStateDidChangeNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reregisterForAccountType:", 0);
}

- (void)credentialsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACMonitoredAccountStore *v9;

  v4 = a3;
  -[ACAccountStore replyQueue](self, "replyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ACMonitoredAccountStore_credentialsChangedNotification___block_invoke;
  v7[3] = &unk_1E48925B8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__ACMonitoredAccountStore_credentialsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ACAccountIdentifierKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "monitoredAccountWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "_allDelegates", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "accountCredentialChanged:", v4);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (id)_allDelegates
{
  NSHashTable *v3;
  void *v4;

  v3 = self->_delegates;
  objc_sync_enter(v3);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (void)accountWasAdded:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *accountsByID;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1A2BCD000, v5, OS_LOG_TYPE_DEFAULT, "\"ACMonitoredAccountStore: account was added: %@\", buf, 0xCu);
  }

  v6 = self->_accountsByID;
  objc_sync_enter(v6);
  objc_msgSend(v4, "_setAccountStore:", self);
  accountsByID = self->_accountsByID;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](accountsByID, "setObject:forKeyedSubscript:", v4, v8);

  objc_sync_exit(v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ACMonitoredAccountStore _allDelegates](self, "_allDelegates", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "accountWasAdded:", v4);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[ACMonitoredAccountStore _sendNotificationOfChange](self, "_sendNotificationOfChange");
}

- (void)accountWasModified:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *accountsByID;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1A2BCD000, v5, OS_LOG_TYPE_DEFAULT, "\"ACMonitoredAccountStore: account was modified: %@\", buf, 0xCu);
  }

  v6 = self->_accountsByID;
  objc_sync_enter(v6);
  objc_msgSend(v4, "_setAccountStore:", self);
  accountsByID = self->_accountsByID;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](accountsByID, "setObject:forKeyedSubscript:", v4, v8);

  objc_sync_exit(v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ACMonitoredAccountStore _allDelegates](self, "_allDelegates", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "accountWasModified:", v4);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[ACMonitoredAccountStore _sendNotificationOfChange](self, "_sendNotificationOfChange");
}

- (void)accountWasRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *accountsByID;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1A2BCD000, v5, OS_LOG_TYPE_DEFAULT, "\"ACMonitoredAccountStore: account was removed: %@\", buf, 0xCu);
  }

  v6 = self->_accountsByID;
  objc_sync_enter(v6);
  objc_msgSend(v4, "_setAccountStore:", self);
  accountsByID = self->_accountsByID;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](accountsByID, "setObject:forKeyedSubscript:", 0, v8);

  objc_sync_exit(v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ACMonitoredAccountStore _allDelegates](self, "_allDelegates", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "accountWasRemoved:", v4);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[ACMonitoredAccountStore _sendNotificationOfChange](self, "_sendNotificationOfChange");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didBecomeActiveObserver, 0);
  objc_storeStrong((id *)&self->_remoteAccountDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_credentialsDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_accountsByID, 0);
  objc_storeStrong((id *)&self->_propertiesToPrefetch, 0);
  objc_storeStrong((id *)&self->_monitoringReaders, 0);
  objc_storeStrong((id *)&self->_accountTypesToMonitor, 0);
}

- (void)registerWithCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: RegisterTypesToMonitor %@");
  OUTLINED_FUNCTION_0();
}

void __50__ACMonitoredAccountStore_registerWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2BCD000, a2, a3, "Attempted to register account monitor for types client is not authorized to access: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)registerSynchronouslyWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A2BCD000, v0, v1, "BEGIN [%lld]: RegisterTypesToMonitorSync %@");
  OUTLINED_FUNCTION_0();
}

void __58__ACMonitoredAccountStore_registerSynchronouslyWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2BCD000, a2, a3, "Attempted to register account monitor for types client is not authorized to access: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A2BCD000, a2, OS_LOG_TYPE_ERROR, "\"ACMonitoredAccountStore: Failed to reconnect to accountsd: %@\", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end
