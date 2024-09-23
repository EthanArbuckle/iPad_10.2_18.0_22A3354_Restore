@implementation SGAccountsAdapter

- (id)primaryICloudCalendarAccount
{
  SGAccountsAdapter *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cachedPrimaryICloudAccount;
  objc_sync_exit(v2);

  return v3;
}

+ (SGAccountsAdapter)sharedInstance
{
  if (sharedInstance__pasOnceToken2_5605 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_5605, &__block_literal_global_5606);
  return (SGAccountsAdapter *)(id)sharedInstance__pasExprOnceResult_5607;
}

- (SGAccountsAdapter)init
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  dispatch_queue_t v8;
  void *v9;
  dispatch_source_t v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  id v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_source_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  _QWORD handler[4];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SGAccountsAdapter;
  v2 = -[SGAccountsAdapter init](&v29, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), v5);
    v9 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v8;

    v10 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v2 + 4));
    v11 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v10;

    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_retainAutorelease((id)objc_msgSend(v12, "initWithFormat:", CFSTR("%@-timer"), v14));
    v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), v5);
    v17 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v16;

    v18 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 7));
    v19 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v18;

    location = 0;
    objc_initWeak(&location, v2);
    v20 = *((_QWORD *)v2 + 5);
    v21 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __25__SGAccountsAdapter_init__block_invoke;
    handler[3] = &unk_1E7DB7010;
    objc_copyWeak(&v27, &location);
    dispatch_source_set_event_handler(v20, handler);
    v22 = *((_QWORD *)v2 + 8);
    v24[0] = v21;
    v24[1] = 3221225472;
    v24[2] = __25__SGAccountsAdapter_init__block_invoke_2;
    v24[3] = &unk_1E7DB7010;
    objc_copyWeak(&v25, &location);
    dispatch_source_set_event_handler(v22, v24);
    if ((objc_msgSend(v2, "readCachedAccounts") & 1) == 0)
      objc_msgSend(v2, "refreshCacheFromAccountsService");
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    objc_msgSend(v2, "registerNotificationObserver");
    objc_msgSend(v2, "setUpdateTimerWithDelaySeconds:", 10);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return (SGAccountsAdapter *)v2;
}

- (BOOL)readCachedAccounts
{
  void *v3;
  SGAccountsAdapter *v4;
  uint64_t v5;
  NSString *cachedPrimaryICloudAccount;
  id v7;
  void *v8;
  uint64_t v9;
  NSSet *usernamesCache;
  NSString *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0D198F0], "userAccountsPersistedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    cachedPrimaryICloudAccount = v4->_cachedPrimaryICloudAccount;
    v4->_cachedPrimaryICloudAccount = (NSString *)v5;

    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithArray:", v8);
    usernamesCache = v4->_usernamesCache;
    v4->_usernamesCache = (NSSet *)v9;

  }
  else
  {
    v11 = v4->_cachedPrimaryICloudAccount;
    v4->_cachedPrimaryICloudAccount = 0;

    v12 = objc_opt_new();
    v8 = v4->_usernamesCache;
    v4->_usernamesCache = (NSSet *)v12;
  }

  objc_sync_exit(v4);
  return v3 != 0;
}

- (void)setCachedAccounts
{
  SGAccountsAdapter *v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new();
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_cachedPrimaryICloudAccount && v3->_usernamesCache)
  {
    objc_msgSend(v5, "addObject:");
    -[NSSet allObjects](v3->_usernamesCache, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v4);

  }
  objc_msgSend(MEMORY[0x1E0D198F0], "setUserAccountsPersistedState:", v5);
  objc_sync_exit(v3);

}

- (void)accountsStoreDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F0F8]);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7 && -[NSObject isEqual:](v7, "isEqual:", *MEMORY[0x1E0C8F058]))
    {
      sgLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "userInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "Refreshing due to account change: %@", (uint8_t *)&v11, 0xCu);

      }
      dispatch_source_merge_data((dispatch_source_t)self->_updateSource, 1uLL);
      goto LABEL_10;
    }

  }
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "Filtering account change that we don't care about: %@", (uint8_t *)&v11, 0xCu);

  }
LABEL_10:

}

- (void)refreshCacheFromAccountsService
{
  ACAccountStore *accountStore;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  id *v23;
  void *v24;
  id *v25;
  id *location;
  NSString *v27;
  SGAccountsAdapter *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  _QWORD v39[4];

  v39[1] = *MEMORY[0x1E0C80C00];
  -[SGAccountsAdapter cancelUpdateTimer](self, "cancelUpdateTimer");
  accountStore = self->_accountStore;
  v39[0] = *MEMORY[0x1E0C8F058];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  -[ACAccountStore accountsWithAccountTypeIdentifiers:error:](accountStore, "accountsWithAccountTypeIdentifiers:error:", v4, &v35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v35;

  if (v6)
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch CalDAV accounts: %@", buf, 0xCu);
    }

    -[SGAccountsAdapter setUpdateTimerWithDelaySeconds:](self, "setUpdateTimerWithDelaySeconds:", 3600);
    goto LABEL_25;
  }
  obj = (id)objc_opt_new();
  v28 = self;
  location = (id *)&self->_cachedPrimaryICloudAccount;
  v27 = self->_cachedPrimaryICloudAccount;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v29 = v5;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v9)
  {
    v11 = 0;
    goto LABEL_19;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v32;
  v13 = *MEMORY[0x1E0C8F378];
  v14 = *MEMORY[0x1E0CFAAE8];
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v8);
      v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      objc_msgSend(v16, "enabledDataclasses", location);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "containsObject:", v13))
        goto LABEL_14;
      objc_msgSend(v16, "username");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v16, "username");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "addObject:", v19);

        objc_msgSend(v16, "parentAccount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "aa_isAccountClass:", v14);

        if (v21)
        {
          objc_msgSend(v16, "identifier");
          v17 = v11;
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_14:

          continue;
        }
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  }
  while (v10);
LABEL_19:

  sgPrivateLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v38 = obj;
    _os_log_debug_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEBUG, "Calendar accounts updated: %@", buf, 0xCu);
  }

  v23 = v28;
  objc_sync_enter(v23);
  objc_storeStrong(v23 + 1, obj);
  objc_sync_exit(v23);

  if (v11 != v27 && (-[NSString isEqual:](v11, "isEqual:", v27) & 1) == 0)
  {
    NSStringFromSelector(sel_primaryICloudCalendarAccount);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "willChangeValueForKey:", v24);
    v25 = v23;
    objc_sync_enter(v25);
    objc_storeStrong(location, v11);
    objc_sync_exit(v25);

    objc_msgSend(v25, "didChangeValueForKey:", v24);
  }
  objc_msgSend(v23, "setCachedAccounts", location);

  v6 = 0;
  v5 = v29;
LABEL_25:

}

- (void)cancelUpdateTimer
{
  SGAccountsAdapter *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_updateTimerIsSet)
  {
    dispatch_suspend((dispatch_object_t)obj->_updateTimerSource);
    obj->_updateTimerIsSet = 0;
  }
  objc_sync_exit(obj);

}

- (void)setUpdateTimerWithDelaySeconds:(unint64_t)a3
{
  SGAccountsAdapter *v4;
  NSObject *updateTimerSource;
  double v6;
  dispatch_time_t v7;
  SGAccountsAdapter *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_updateTimerIsSet)
  {
    dispatch_suspend((dispatch_object_t)obj->_updateTimerSource);
    v4 = obj;
  }
  updateTimerSource = v4->_updateTimerSource;
  v6 = (double)a3;
  if (a3)
  {
    if (a3 <= 0x225C17D04)
      v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    else
      v7 = -1;
  }
  else
  {
    v7 = 0;
  }
  dispatch_source_set_timer(updateTimerSource, v7, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v6 * 0.1 * 1000000000.0));
  dispatch_resume((dispatch_object_t)obj->_updateTimerSource);
  obj->_updateTimerIsSet = 1;
  objc_sync_exit(obj);

}

- (void)registerNotificationObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_accountsStoreDidChange_, *MEMORY[0x1E0C8F1C0], self->_accountStore);

}

- (void)dealloc
{
  objc_super v3;

  -[SGAccountsAdapter removeNotificationObserver](self, "removeNotificationObserver");
  v3.receiver = self;
  v3.super_class = (Class)SGAccountsAdapter;
  -[SGAccountsAdapter dealloc](&v3, sel_dealloc);
}

- (void)removeNotificationObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (BOOL)hasCalendarAccount:(id)a3
{
  SGAccountsAdapter *v4;
  id v5;
  NSSet *v6;

  v4 = self;
  v5 = a3;
  objc_sync_enter(v4);
  v6 = v4->_usernamesCache;
  objc_sync_exit(v4);

  LOBYTE(v4) = -[NSSet containsObject:](v6, "containsObject:", v5);
  return (char)v4;
}

- (id)serverIdentifierForAccount:(id)a3
{
  id v4;
  SGAccountsAdapter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ACAccountStore accountWithIdentifier:](v5->_accountStore, "accountWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v19 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "parentAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "parentAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0C8F030];
    v13 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C8F030]);

    if (v13)
    {
      v14 = v12;
LABEL_7:
      v19 = (uint64_t)v14;
LABEL_9:
      LODWORD(v20) = 1;
      goto LABEL_14;
    }
  }
  objc_msgSend(v7, "accountType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)*MEMORY[0x1E0C8F0A8];
  v18 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C8F0A8]);

  if (v18)
  {
    v14 = v17;
    goto LABEL_7;
  }
  objc_msgSend(v7, "accountProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0C8EF90];
  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF90]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22
    || (v19 = *MEMORY[0x1E0C8EF98],
        objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF98]),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", v19);
    v19 = objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = 1;
  }

LABEL_14:
  objc_sync_exit(v5);

  if ((_DWORD)v20)
    v23 = (void *)v19;
  else
    v23 = 0;

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimerSource, 0);
  objc_storeStrong((id *)&self->_updateTimerQueue, 0);
  objc_storeStrong((id *)&self->_updateSource, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_cachedPrimaryICloudAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_usernamesCache, 0);
}

void __25__SGAccountsAdapter_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshCacheFromAccountsService");

}

void __25__SGAccountsAdapter_init__block_invoke_2(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t *v2;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    dispatch_source_merge_data(WeakRetained[5], 1uLL);
    WeakRetained = v2;
  }

}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  NSStringFromSelector(sel_primaryICloudCalendarAccount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___SGAccountsAdapter;
    v7 = objc_msgSendSuper2(&v9, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v7;
}

void __35__SGAccountsAdapter_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_5607;
  sharedInstance__pasExprOnceResult_5607 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
