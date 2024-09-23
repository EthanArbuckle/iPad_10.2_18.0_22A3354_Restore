@implementation WFAccount

- (WFAccount)init
{
  WFAccount *v2;
  void *v3;
  uint64_t v4;
  NSString *accountID;
  uint64_t v6;
  NSDate *createdAt;
  uint64_t v8;
  NSDate *updatedAt;
  WFAccount *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFAccount;
  v2 = -[MTLModel init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    accountID = v2->_accountID;
    v2->_accountID = (NSString *)v4;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    createdAt = v2->_createdAt;
    v2->_createdAt = (NSDate *)v6;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    updatedAt = v2->_updatedAt;
    v2->_updatedAt = (NSDate *)v8;

    v10 = v2;
  }

  return v2;
}

- (NSString)localizedName
{
  return 0;
}

- (BOOL)isValid
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("-[WFAccount isValid] must be overridden"));
  return 0;
}

- (void)refreshWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)invalidateWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)serviceID
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("+[WFAccount serviceID] must be overridden"));
  return 0;
}

+ (id)serviceName
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("+[WFAccount serviceName] must be overridden"));
  return 0;
}

+ (id)localizedServiceName
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("+[WFAccount localizedServiceName] must be overridden"));
  return 0;
}

+ (BOOL)allowsMultipleAccounts
{
  return 0;
}

+ (id)migrate:(id)a3
{
  return 0;
}

+ (id)accountCache
{
  if (accountCache_onceToken != -1)
    dispatch_once(&accountCache_onceToken, &__block_literal_global_20761);
  return (id)accountCache_accountCache;
}

+ (id)pendingIgnoredNotifications
{
  if (pendingIgnoredNotifications_onceToken != -1)
    dispatch_once(&pendingIgnoredNotifications_onceToken, &__block_literal_global_32);
  return (id)pendingIgnoredNotifications_pendingIgnoredNotifications;
}

+ (void)useAccountObservers:(id)a3
{
  uint64_t v3;
  void (**v4)(id, uint64_t);
  NSObject *v5;
  dispatch_time_t v6;

  v3 = useAccountObservers__onceToken[0];
  v4 = (void (**)(id, uint64_t))a3;
  if (v3 != -1)
    dispatch_once(useAccountObservers__onceToken, &__block_literal_global_34);
  v5 = useAccountObservers__accountObserversLock;
  v6 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v5, v6);
  v4[2](v4, useAccountObservers__accountObservers);

  dispatch_semaphore_signal((dispatch_semaphore_t)useAccountObservers__accountObserversLock);
}

+ (BOOL)shouldIgnoreNotificationForService:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "pendingIgnoredNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForObject:", v4);
  if (v6)
    objc_msgSend(v5, "removeObject:", v4);

  return v6 != 0;
}

+ (void)setShouldIgnoreNotificationForService:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "pendingIgnoredNotifications");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

+ (void)addAccountObserver:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__WFAccount_Persistence__addAccountObserver_forService___block_invoke;
  v10[3] = &unk_24F8B4680;
  v12 = v6;
  v13 = a1;
  v11 = v7;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "useAccountObservers:", v10);

}

+ (void)handleChangeForService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "accountCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCacheForService:", v4);

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__20758;
  v23 = __Block_byref_object_dispose__20759;
  v24 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __49__WFAccount_Persistence__handleChangeForService___block_invoke;
  v16[3] = &unk_24F8B46A8;
  v18 = &v19;
  v6 = v4;
  v17 = v6;
  objc_msgSend(a1, "useAccountObservers:", v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (id)v20[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    v10 = MEMORY[0x24BDAC9B8];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        dispatch_async(v10, *(dispatch_block_t *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v8 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v25, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v19, 8);
}

+ (unint64_t)numberOfAccounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  objc_msgSend(a1, "accountCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberOfAccountsForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  }
  else
  {
    v7 = objc_msgSend(a1, "_numberOfAccounts");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNumberOfAccounts:forService:", v8, v4);

    objc_msgSend(a1, "addAccountObserver:forService:", 0, v4);
  }

  return v7;
}

+ (id)accounts
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "accountCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountsForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "_accounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccounts:forService:", v5, v4);
    objc_msgSend(a1, "addAccountObserver:forService:", 0, v4);
  }

  return v5;
}

+ (unint64_t)_numberOfAccounts
{
  WFKeychain *v3;
  void *v4;
  WFKeychain *v5;
  unint64_t v6;

  v3 = [WFKeychain alloc];
  objc_msgSend(a1, "serviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFKeychain initWithService:](v3, "initWithService:", v4);

  v6 = -[WFKeychain numberOfItems](v5, "numberOfItems");
  return v6;
}

+ (id)_accounts
{
  WFKeychain *v3;
  void *v4;
  WFKeychain *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = [WFKeychain alloc];
  objc_msgSend(a1, "serviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFKeychain initWithService:](v3, "initWithService:", v4);

  -[WFKeychain items](v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __35__WFAccount_Persistence___accounts__block_invoke;
  v18 = &unk_24F8B46D0;
  v19 = v7;
  v20 = a1;
  v8 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v15);
  v9 = (void *)MEMORY[0x24BDD17C0];
  NSStringFromSelector(sel_createdAt);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortDescriptorWithKey:ascending:", v10, 1, v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)saveAccount:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  WFKeychain *v8;
  void *v9;
  WFKeychain *v10;
  void *v11;
  BOOL v12;
  void *v14;

  v5 = a3;
  objc_msgSend(v5, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFAccount+Persistence.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account.accountID"));

  }
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = [WFKeychain alloc];
    objc_msgSend((id)objc_opt_class(), "serviceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFKeychain initWithService:](v8, "initWithService:", v9);

    objc_msgSend(v5, "accountID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFKeychain setData:forKey:](v10, "setData:forKey:", v7, v11);

    objc_msgSend((id)objc_opt_class(), "notifyAccountsChanged");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)deleteAccount:(id)a3
{
  id v5;
  void *v6;
  WFKeychain *v7;
  void *v8;
  WFKeychain *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v14;

  v5 = a3;
  objc_msgSend(v5, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFAccount+Persistence.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account.accountID"));

  }
  v7 = [WFKeychain alloc];
  objc_msgSend((id)objc_opt_class(), "serviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFKeychain initWithService:](v7, "initWithService:", v8);

  objc_msgSend(v5, "accountID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFKeychain setData:forKey:](v9, "setData:forKey:", 0, v10);

  v12 = (void *)objc_opt_class();
  objc_msgSend(v12, "notifyAccountsChanged");

  return v11;
}

+ (void)notifyAccountsChanged
{
  id v3;
  id v4;

  objc_msgSend(a1, "serviceID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "handleChangeForService:", v4);
  objc_msgSend(a1, "setShouldIgnoreNotificationForService:", v4);
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".notification"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v3, "UTF8String"));

}

+ (id)addAccountObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "serviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addAccountObserver:forService:", v4, v5);

  v6 = _Block_copy(v4);
  return v6;
}

+ (void)removeAccountObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WFAccount_Persistence__removeAccountObserver___block_invoke;
  v6[3] = &unk_24F8B46F8;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  objc_msgSend(a1, "useAccountObservers:", v6);

}

void __48__WFAccount_Persistence__removeAccountObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "serviceID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = _Block_copy(*(const void **)(a1 + 32));
  objc_msgSend(v5, "removeObject:", v6);

}

void __35__WFAccount_Persistence___accounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 40), "migrate:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && !v7)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
  }
  if (v5)
    objc_msgSend(v8, "setValue:forKey:", v5, CFSTR("accountID"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void __49__WFAccount_Persistence__handleChangeForService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __56__WFAccount_Persistence__addAccountObserver_forService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  const void *v7;
  void *v8;
  _QWORD handler[4];
  id v10;
  uint64_t v11;
  int out_token;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 32));
    out_token = 0;
    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR(".notification"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __56__WFAccount_Persistence__addAccountObserver_forService___block_invoke_2;
    handler[3] = &unk_24F8B4658;
    v11 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 32);
    notify_register_dispatch(v6, &out_token, MEMORY[0x24BDAC9B8], handler);

  }
  v7 = *(const void **)(a1 + 40);
  if (v7)
  {
    v8 = _Block_copy(v7);
    objc_msgSend(v4, "addObject:", v8);

  }
}

uint64_t __56__WFAccount_Persistence__addAccountObserver_forService___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "shouldIgnoreNotificationForService:", *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "handleChangeForService:", *(_QWORD *)(a1 + 32));
  return result;
}

void __46__WFAccount_Persistence__useAccountObservers___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_semaphore_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)useAccountObservers__accountObservers;
  useAccountObservers__accountObservers = v0;

  v2 = dispatch_semaphore_create(1);
  v3 = (void *)useAccountObservers__accountObserversLock;
  useAccountObservers__accountObserversLock = (uint64_t)v2;

}

void __53__WFAccount_Persistence__pendingIgnoredNotifications__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)pendingIgnoredNotifications_pendingIgnoredNotifications;
  pendingIgnoredNotifications_pendingIgnoredNotifications = v0;

}

void __38__WFAccount_Persistence__accountCache__block_invoke()
{
  WFAccountCache *v0;
  void *v1;

  v0 = objc_alloc_init(WFAccountCache);
  v1 = (void *)accountCache_accountCache;
  accountCache_accountCache = (uint64_t)v0;

}

@end
