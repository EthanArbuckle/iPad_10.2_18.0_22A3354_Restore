@implementation ECAccountsObserver

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__ECAccountsObserver_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (OS_os_log *)(id)log_log_0;
}

void __25__ECAccountsObserver_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

- (ECAccountsObserver)initWithAccountStore:(id)a3
{
  id v6;
  ECAccountsObserver *v7;
  ECAccountsObserver *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECAccountsObserver.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accountStore"));

  }
  v12.receiver = self;
  v12.super_class = (Class)ECAccountsObserver;
  v7 = -[ECAccountsObserver init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_accountStore, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__accountStoreDidChange_, *MEMORY[0x1E0C8F010], v8->_accountStore);
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__credentialsDidChange_, *MEMORY[0x1E0C8EE10], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__mailAccountsChanged_, CFSTR("ECMailAccountsChangedNotification"), 0);

  }
  return v8;
}

- (void)_accountStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ECAccountsObserver log](ECAccountsObserver, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1B9ADE000, v5, OS_LOG_TYPE_DEFAULT, "Received account store did change notification: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (-[ECAccountsObserver _shouldNotifyOnAccountChangeForNotification:](self, "_shouldNotifyOnAccountChangeForNotification:", v4))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF30]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ECAccountsObserver handleAccountStoreChangeForAccountIdentifier:](self, "handleAccountStoreChangeForAccountIdentifier:", v7);
  }

}

- (void)_credentialsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ECAccountsObserver log](ECAccountsObserver, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1B9ADE000, v5, OS_LOG_TYPE_DEFAULT, "Received account credentials did change notification: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (-[ECAccountsObserver _shouldNotifyOnAccountChangeForNotification:](self, "_shouldNotifyOnAccountChangeForNotification:", v4))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF30]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ECAccountsObserver handleCredentialChangeForAccountIdentifier:](self, "handleCredentialChangeForAccountIdentifier:", v7);
  }

}

- (void)_mailAccountsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ECAccountsObserver log](ECAccountsObserver, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1B9ADE000, v5, OS_LOG_TYPE_DEFAULT, "Received accounts did change notification: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ECMailAccountInitialization"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  -[ECAccountsObserver handleMailAccountsHaveChanged:accountsNeedInitialization:](self, "handleMailAccountsHaveChanged:accountsNeedInitialization:", v6, v9);
}

- (BOOL)_shouldNotifyOnAccountChangeForNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F0F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[ECAccountsObserver observedAccountTypes](ECAccountsObserver, "observedAccountTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (id)observedAccountTypes
{
  if (observedAccountTypes_onceToken != -1)
    dispatch_once(&observedAccountTypes_onceToken, &__block_literal_global);
  return (id)observedAccountTypes_sObservedAccountTypes;
}

void __42__ECAccountsObserver_observedAccountTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[15];

  v9[14] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C8F0D8];
  v9[0] = *MEMORY[0x1E0C8F0D0];
  v9[1] = v0;
  v1 = *MEMORY[0x1E0C8F118];
  v9[2] = *MEMORY[0x1E0C8F080];
  v9[3] = v1;
  v2 = *MEMORY[0x1E0C8F110];
  v9[4] = *MEMORY[0x1E0C8F138];
  v9[5] = v2;
  v3 = *MEMORY[0x1E0C8F030];
  v9[6] = *MEMORY[0x1E0C8F028];
  v9[7] = v3;
  v4 = *MEMORY[0x1E0C8F0A8];
  v9[8] = *MEMORY[0x1E0C8F160];
  v9[9] = v4;
  v5 = *MEMORY[0x1E0C8F018];
  v9[10] = *MEMORY[0x1E0C8F0B8];
  v9[11] = v5;
  v6 = *MEMORY[0x1E0C8F128];
  v9[12] = *MEMORY[0x1E0C8F020];
  v9[13] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 14);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)observedAccountTypes_sObservedAccountTypes;
  observedAccountTypes_sObservedAccountTypes = v7;

}

- (void)handleAccountStoreChangeForAccountIdentifier:(id)a3
{
  id v5;

  v5 = a3;
  -[ECAccountsObserver doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ECAccountsObserver handleAccountStoreChangeForAccountIdentifier:]", "ECAccountsObserver.m", 105, "0");
}

- (void)handleCredentialChangeForAccountIdentifier:(id)a3
{
  id v5;

  v5 = a3;
  -[ECAccountsObserver doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ECAccountsObserver handleCredentialChangeForAccountIdentifier:]", "ECAccountsObserver.m", 109, "0");
}

- (void)handleMailAccountsHaveChanged:(id)a3 accountsNeedInitialization:(BOOL)a4
{
  id v6;

  v6 = a3;
  -[ECAccountsObserver doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ECAccountsObserver handleMailAccountsHaveChanged:accountsNeedInitialization:]", "ECAccountsObserver.m", 113, "0");
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
