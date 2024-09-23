@implementation VSAccountMonitor

void __34__VSAccountMonitor_sharedInstance__block_invoke()
{
  VSAccountMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(VSAccountMonitor);
  v1 = (void *)sharedInstance___vs_lazy_init_variable_1;
  sharedInstance___vs_lazy_init_variable_1 = (uint64_t)v0;

}

void __24__VSAccountMonitor_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "VSAccountMonitor - ACMonitoredAccountStore registration found accounts: %@ with error: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (VSAccountMonitor)init
{
  VSAccountMonitor *v2;
  void *v3;
  uint64_t v4;
  ACMonitoredAccountStore *monitoredAccountStore;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSAccountMonitor;
  v2 = -[VSAccountMonitor init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0C8F170]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2D8]), "initWithAccountTypes:delegate:", v3, v2);
    monitoredAccountStore = v2->_monitoredAccountStore;
    v2->_monitoredAccountStore = (ACMonitoredAccountStore *)v4;

    -[ACMonitoredAccountStore registerWithCompletion:](v2->_monitoredAccountStore, "registerWithCompletion:", &__block_literal_global_5);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___vs_lazy_init_predicate_1 != -1)
    dispatch_once(&sharedInstance___vs_lazy_init_predicate_1, &__block_literal_global_47);
  return (id)sharedInstance___vs_lazy_init_variable_1;
}

- (void)_sendNotification
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VSAccountMonitorAccountDidChange"), 0);

}

- (void)accountWasAdded:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "VSAccountMonitor - accountWasAdded: %@", (uint8_t *)&v6, 0xCu);
  }

  -[VSAccountMonitor _sendNotification](self, "_sendNotification");
}

- (void)accountWasModified:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "VSAccountMonitor - accountWasModified: %@", (uint8_t *)&v6, 0xCu);
  }

  -[VSAccountMonitor _sendNotification](self, "_sendNotification");
}

- (void)accountWasRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "VSAccountMonitor - accountWasRemoved: %@", (uint8_t *)&v6, 0xCu);
  }

  -[VSAccountMonitor _sendNotification](self, "_sendNotification");
}

- (void)accountCredentialChanged:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "VSAccountMonitor - accountCredentialChanged: %@", (uint8_t *)&v6, 0xCu);
  }

  -[VSAccountMonitor _sendNotification](self, "_sendNotification");
}

- (ACMonitoredAccountStore)monitoredAccountStore
{
  return self->_monitoredAccountStore;
}

- (void)setMonitoredAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredAccountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredAccountStore, 0);
}

@end
