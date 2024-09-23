@implementation DNDSContactMonitor

- (DNDSContactMonitor)initWithContactStore:(id)a3 contactProvider:(id)a4
{
  id v7;
  id v8;
  DNDSContactMonitor *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *fetchQueue;
  uint64_t v13;
  NSHashTable *listeners;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DNDSContactMonitor;
  v9 = -[DNDSContactMonitor init](&v17, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.donotdisturb.server.ContactMonitor", v10);
    fetchQueue = v9->_fetchQueue;
    v9->_fetchQueue = (OS_dispatch_queue *)v11;

    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v9->_contactProvider, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v13 = objc_claimAutoreleasedReturnValue();
    listeners = v9->_listeners;
    v9->_listeners = (NSHashTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel__contactStoreChanged_, *MEMORY[0x1E0C96870], 0);

  }
  return v9;
}

- (void)addListener:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_listeners, "addObject:", v4);
  objc_msgSend(v4, "monitoredContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v4, "contactHistoryToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__DNDSContactMonitor_addListener___block_invoke;
  v8[3] = &unk_1E86A5ED0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[DNDSContactMonitor _fetchUpdatesWithContactHistoryToken:monitoredContacts:handler:](self, "_fetchUpdatesWithContactHistoryToken:monitoredContacts:handler:", v6, v5, v8);

}

void __34__DNDSContactMonitor_addListener___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "_contactsWithCNContacts:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contactMonitor:didReceiveUpdatedContacts:deletedContactIdentifiers:withContactHistoryToken:", *(_QWORD *)(a1 + 32), v10, v9, v8);

}

- (void)removeListener:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_listeners, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)_contactsWithCNContacts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0D1D5C0], "contactWithCNContact:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_contactStoreChanged:(id)a3
{
  NSObject *fetchQueue;
  _QWORD block[5];

  fetchQueue = self->_fetchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__DNDSContactMonitor__contactStoreChanged___block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(fetchQueue, block);
}

uint64_t __43__DNDSContactMonitor__contactStoreChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = DNDSLogSettings;
  if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "Contacts store changed", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateContactsWithIdentifiers");
  return objc_msgSend(*(id *)(a1 + 32), "_updateContactsWithoutIdentifiers");
}

- (void)_updateContactsWithIdentifiers
{
  void *v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id obj;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fetchQueue);
  os_unfair_lock_lock(&self->_lock);
  -[DNDSContactMonitor _lock_listenersByContactHistoryToken](self, "_lock_listenersByContactHistoryToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSContactMonitor _lock_monitoredContactsByContactHistoryToken](self, "_lock_monitoredContactsByContactHistoryToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  v27 = 0u;
  obj = v3;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v13, "contactIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14)
                objc_msgSend(v7, "addObject:", v13);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v10);
        }

        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __52__DNDSContactMonitor__updateContactsWithIdentifiers__block_invoke;
        v20[3] = &unk_1E86A5EF8;
        v20[4] = self;
        v15 = obj;
        v21 = v15;
        v22 = v5;
        -[DNDSContactMonitor _queue_fetchUpdatesWithContactHistoryToken:monitoredContacts:handler:](self, "_queue_fetchUpdatesWithContactHistoryToken:monitoredContacts:handler:", v5, v7, v20);

      }
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v18);
  }

}

void __52__DNDSContactMonitor__updateContactsWithIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_contactsWithCNContacts:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "contactMonitor:didReceiveUpdatedContacts:deletedContactIdentifiers:withContactHistoryToken:", *(_QWORD *)(a1 + 32), v9, v7, v8);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)_updateContactsWithoutIdentifiers
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fetchQueue);
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_listeners, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "monitoredContacts");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v19 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              objc_msgSend(v12, "contactIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v13)
              {
                -[DNDSContactProviding contactForContact:](self->_contactProvider, "contactForContact:", v12);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (v14)
                  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v9);
        }
        if (objc_msgSend(v7, "count"))
          objc_msgSend(v5, "contactMonitor:didReceiveUpdatedContactsForContactsWithoutIdentifiers:", self, v6);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v17);
  }

}

- (void)_fetchContactsForMonitoredContacts:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "contactIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke;
  v17[3] = &unk_1E86A5F48;
  v17[4] = self;
  v18 = v7;
  v16 = v7;
  objc_msgSend(v15, "enumerateBatchesOfSize:handler:", 10, v17);

}

void __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *context;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  context = (void *)MEMORY[0x1D17A0B90]();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C97210]);
  objc_msgSend(MEMORY[0x1E0D1D5C0], "keysToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKeysToFetch:", v9);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(v10, "setUnifyResults:", 1);
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v35 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke_2;
  v32[3] = &unk_1E86A5F20;
  v13 = v7;
  v33 = v13;
  v14 = v6;
  v34 = v14;
  v15 = objc_msgSend(v12, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, &v35, v32);
  v16 = v35;
  v17 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v17, "minusSet:", v14);
  v18 = DNDSLogSettings;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134349056;
      v37 = v20;
      _os_log_impl(&dword_1CB895000, v19, OS_LOG_TYPE_DEFAULT, "Fetched %{public}lld contacts", buf, 0xCu);

    }
    v21 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v17, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "currentHistoryToken");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, void *))(v21 + 16))(v21, v13, v22, v23);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
      __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke_cold_1((uint64_t)v16, v18, v24, v25, v26, v27, v28, v29);
    *a3 = 1;
  }

  objc_autoreleasePoolPop(context);
}

void __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v6);
}

- (BOOL)_fetchContactHistoryWithToken:(id)a3 monitoredContacts:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, void *, void *, void *);
  id v11;
  void *v12;
  CNContactStore *contactStore;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  DNDSContactMonitorChangeCollector *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void (**v48)(_QWORD, void *, void *, void *);
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD, void *, void *, void *))a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C971E8]);
  objc_msgSend(v11, "setStartingToken:", v8);
  objc_msgSend(MEMORY[0x1E0D1D5C0], "keysToFetch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAdditionalContactKeyDescriptors:", v12);

  contactStore = self->_contactStore;
  v59 = 0;
  -[CNContactStore enumeratorForChangeHistoryFetchRequest:error:](contactStore, "enumeratorForChangeHistoryFetchRequest:error:", v11, &v59);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v59;
  if (v15)
  {
    v16 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
      __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke_cold_1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    v48 = v10;
    v50 = v8;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v49 = v9;
    v24 = v9;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v56 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v29, "contactIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(v29, "contactIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v31);

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v26);
    }

    v32 = -[DNDSContactMonitorChangeCollector initWithMonitoredContactIdentifiers:]([DNDSContactMonitorChangeCollector alloc], "initWithMonitoredContactIdentifiers:", v23);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v14, "value");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v52 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "acceptEventVisitor:", v32);
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      }
      while (v35);
    }

    v38 = (void *)DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      -[DNDSContactMonitorChangeCollector updatedContacts](v32, "updatedContacts");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");
      -[DNDSContactMonitorChangeCollector deletedContactIdentifiers](v32, "deletedContactIdentifiers");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");
      *(_DWORD *)buf = 134349312;
      v61 = v41;
      v62 = 2050;
      v63 = v43;
      _os_log_impl(&dword_1CB895000, v39, OS_LOG_TYPE_DEFAULT, "Collected %{public}lld changed contacts and %{public}lld", buf, 0x16u);

    }
    -[DNDSContactMonitorChangeCollector updatedContacts](v32, "updatedContacts");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSContactMonitorChangeCollector deletedContactIdentifiers](v32, "deletedContactIdentifiers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentHistoryToken");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v48;
    v48[2](v48, v44, v45, v46);

    v9 = v49;
    v8 = v50;
  }

  return v15 == 0;
}

- (void)_fetchUpdatesWithContactHistoryToken:(id)a3 monitoredContacts:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *fetchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  fetchQueue = self->_fetchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__DNDSContactMonitor__fetchUpdatesWithContactHistoryToken_monitoredContacts_handler___block_invoke;
  v15[3] = &unk_1E86A5F70;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(fetchQueue, v15);

}

uint64_t __85__DNDSContactMonitor__fetchUpdatesWithContactHistoryToken_monitoredContacts_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchUpdatesWithContactHistoryToken:monitoredContacts:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_queue_fetchUpdatesWithContactHistoryToken:(id)a3 monitoredContacts:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  CNContactStore *contactStore;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fetchQueue);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToData:", v11);

    if (v12)
    {

      v8 = 0;
    }
    v13 = objc_alloc_init(MEMORY[0x1E0C971E8]);
    objc_msgSend(v13, "setStartingToken:", v8);
    objc_msgSend(MEMORY[0x1E0D1D5C0], "keysToFetch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAdditionalContactKeyDescriptors:", v14);

    contactStore = self->_contactStore;
    v28 = 0;
    -[CNContactStore countForFetchRequest:error:](contactStore, "countForFetchRequest:error:", v13, &v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v28;
    if (v17)
    {
      v18 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
        -[DNDSContactMonitor _queue_fetchUpdatesWithContactHistoryToken:monitoredContacts:handler:].cold.1((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
    }
    else
    {
      objc_msgSend(v16, "value");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");

      v27 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        v30 = v26;
        _os_log_impl(&dword_1CB895000, v27, OS_LOG_TYPE_DEFAULT, "History contains %{public}lld events", buf, 0xCu);
      }
      if (v26 < 1
        || (unint64_t)v26 <= 9
        && -[DNDSContactMonitor _fetchContactHistoryWithToken:monitoredContacts:handler:](self, "_fetchContactHistoryWithToken:monitoredContacts:handler:", v8, v9, v10))
      {
        goto LABEL_8;
      }
    }
    -[DNDSContactMonitor _fetchContactsForMonitoredContacts:handler:](self, "_fetchContactsForMonitoredContacts:handler:", v9, v10);
LABEL_8:

  }
}

- (id)_lock_listenersByContactHistoryToken
{
  void *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_listeners;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "contactHistoryToken", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        objc_msgSend(v3, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "addObject:", v9);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v13);

      }
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_lock_monitoredContactsByContactHistoryToken
{
  void *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_listeners;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "contactHistoryToken", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        objc_msgSend(v3, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "monitoredContacts");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "unionSet:", v15);

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v13);
      }
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_contactProvider, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __65__DNDSContactMonitor__fetchContactsForMonitoredContacts_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Unable to fetch contact change history: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_fetchUpdatesWithContactHistoryToken:(uint64_t)a3 monitoredContacts:(uint64_t)a4 handler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Unable to fetch contact change history count: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
