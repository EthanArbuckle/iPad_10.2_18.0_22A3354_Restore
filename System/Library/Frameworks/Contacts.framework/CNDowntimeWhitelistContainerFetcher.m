@implementation CNDowntimeWhitelistContainerFetcher

- (CNDowntimeWhitelistContainerFetcher)initWithContactStore:(id)a3 accountStore:(id)a4 notificationCenter:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNDowntimeWhitelistContainerFetcher *v12;
  CNDowntimeWhitelistContainerFetcher *v13;
  CNDowntimeWhitelistContainerFetcher *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNDowntimeWhitelistContainerFetcher;
  v12 = -[CNDowntimeWhitelistContainerFetcher init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contactStore, a3);
    objc_storeStrong((id *)&v13->_accountStore, a4);
    objc_storeStrong((id *)&v13->_notificationCenter, a5);
    -[CNDowntimeWhitelistContainerFetcher beginObservingChangeNotifications](v13, "beginObservingChangeNotifications");
    v14 = v13;
  }

  return v13;
}

- (void)beginObservingChangeNotifications
{
  NSNotificationCenter *notificationCenter;
  uint64_t v4;
  NSObject *v5;
  NSObject *accountStoreDidChangeNotificationToken;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  v4 = *MEMORY[0x1E0C8F1C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__CNDowntimeWhitelistContainerFetcher_beginObservingChangeNotifications__block_invoke;
  v7[3] = &unk_1E29F8880;
  objc_copyWeak(&v8, &location);
  -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](notificationCenter, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
  v5 = objc_claimAutoreleasedReturnValue();
  accountStoreDidChangeNotificationToken = self->_accountStoreDidChangeNotificationToken;
  self->_accountStoreDidChangeNotificationToken = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_0_4 != -1)
    dispatch_once(&os_log_cn_once_token_0_4, &__block_literal_global_23);
  return (OS_os_log *)(id)os_log_cn_once_object_0_4;
}

void __45__CNDowntimeWhitelistContainerFetcher_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "whitelist");
  v1 = (void *)os_log_cn_once_object_0_4;
  os_log_cn_once_object_0_4 = (uint64_t)v0;

}

- (CNDowntimeWhitelistContainerFetcher)init
{
  CNContactStore *v3;
  void *v4;
  void *v5;
  CNDowntimeWhitelistContainerFetcher *v6;

  v3 = objc_alloc_init(CNContactStore);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNDowntimeWhitelistContainerFetcher initWithContactStore:accountStore:notificationCenter:](self, "initWithContactStore:accountStore:notificationCenter:", v3, v4, v5);

  return v6;
}

void __72__CNDowntimeWhitelistContainerFetcher_beginObservingChangeNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F8BD000, v2, OS_LOG_TYPE_INFO, "will clear primary iCloud CardDAV container identifier", buf, 2u);
    }

    cn_runWithObjectLock();
  }

}

void __72__CNDowntimeWhitelistContainerFetcher_beginObservingChangeNotifications__block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:", self->_accountStoreDidChangeNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)CNDowntimeWhitelistContainerFetcher;
  -[CNDowntimeWhitelistContainerFetcher dealloc](&v3, sel_dealloc);
}

- (CNContainer)primaryiCloudContainer
{
  cn_objectResultWithObjectLock();
  return (CNContainer *)(id)objc_claimAutoreleasedReturnValue();
}

id __61__CNDowntimeWhitelistContainerFetcher_primaryiCloudContainer__block_invoke(uint64_t a1)
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
    objc_msgSend(v2, "fetchPrimaryiCloudCardDAVContainer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  return v3;
}

- (id)fetchPrimaryiCloudCardDAVContainer
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F8BD000, v3, OS_LOG_TYPE_INFO, "will fetch primary iCloud CardDAV container", buf, 2u);
  }

  -[CNDowntimeWhitelistContainerFetcher fetchPrimaryiCloudCardDAVAccountIdentifier](self, "fetchPrimaryiCloudCardDAVAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContainer predicateForContainersInAccountWithExternalIdentifier:](CNContainer, "predicateForContainersInAccountWithExternalIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDowntimeWhitelistContainerFetcher contactStore](self, "contactStore");
  v6 = objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend((id)v6, "containersMatchingPredicate:error:", v5, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  LOBYTE(v6) = (*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))();
  objc_msgSend((id)objc_opt_class(), "os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CNDowntimeWhitelistContainerFetcher fetchPrimaryiCloudCardDAVContainer].cold.1((uint64_t)v4, (uint64_t)v8, v10);

    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_INFO, "found primary CardDAV container with identifier %{public}@ for primary CardDAV account with identifier %{public}@", buf, 0x16u);

    }
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)fetchPrimaryiCloudCardDAVAccountIdentifier
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  __CFString *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CNDowntimeWhitelistContainerFetcher accountStore](self, "accountStore");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childCardDAVAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))();
  objc_msgSend((id)objc_opt_class(), "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CNDowntimeWhitelistContainerFetcher fetchPrimaryiCloudCardDAVAccountIdentifier].cold.1(v6);

    v7 = &stru_1E29FF900;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_INFO, "found primary CardDAV account identifier %{public}@", (uint8_t *)&v9, 0xCu);
    }

    v7 = v4;
  }

  return v7;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSObject)accountStoreDidChangeNotificationToken
{
  return self->_accountStoreDidChangeNotificationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStoreDidChangeNotificationToken, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_primaryiCloudContainer, 0);
}

- (void)fetchPrimaryiCloudCardDAVContainer
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "error fetching primary CardDAV container for account with identifier %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)fetchPrimaryiCloudCardDAVAccountIdentifier
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "error fetching primary CardDAV account identifier", v1, 2u);
}

@end
