@implementation EMDaemonBooster

- (EMDaemonBooster)initWithConnection:(id)a3 description:(id)a4
{
  id v7;
  id v8;
  EMDaemonBooster *v9;
  EMDaemonBooster *v10;
  uint64_t v11;
  NSProgress *remoteBoost;
  EMRemoteConnection *connection;
  uint64_t v14;
  EMRemoteConnection *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)EMDaemonBooster;
  v9 = -[EMDaemonBooster init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_loggingDescription, a4);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    v11 = -[EMDaemonBooster _newRemoteBoost](v10, "_newRemoteBoost");
    remoteBoost = v10->_remoteBoost;
    v10->_remoteBoost = (NSProgress *)v11;

    connection = v10->_connection;
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__EMDaemonBooster_initWithConnection_description___block_invoke;
    v19[3] = &unk_1E70F1F78;
    objc_copyWeak(&v20, &location);
    -[EMRemoteConnection addResetHandler:](connection, "addResetHandler:", v19);
    v15 = v10->_connection;
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __50__EMDaemonBooster_initWithConnection_description___block_invoke_2;
    v17[3] = &unk_1E70F1F78;
    objc_copyWeak(&v18, &location);
    -[EMRemoteConnection addRecoveryHandler:](v15, "addRecoveryHandler:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)_newRemoteBoost
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  EMDaemonBooster *v14;
  uint8_t buf[4];
  EMDaemonBooster *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[EMDaemonBooster connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[EMDaemonBooster loggingDescription](self, "loggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = self;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "%ld: Acquired Daemon Boost for: %{public}@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__EMDaemonBooster__newRemoteBoost__block_invoke;
  v11[3] = &unk_1E70F2998;
  v12 = v6;
  v14 = self;
  v7 = v5;
  v13 = v7;
  v8 = v6;
  objc_msgSend(v4, "giveBoostWithCompletionBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)loggingDescription
{
  return self->_loggingDescription;
}

- (EMRemoteConnection)connection
{
  return self->_connection;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__EMDaemonBooster_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1)
    dispatch_once(&log_onceToken_10, block);
  return (OS_os_log *)(id)log_log_10;
}

void __22__EMDaemonBooster_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;

}

void __50__EMDaemonBooster_initWithConnection_description___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "remoteBoost");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancel");

  objc_msgSend(WeakRetained, "setRemoteBoost:", 0);
}

void __50__EMDaemonBooster_initWithConnection_description___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "remoteBoost");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancel");

  v2 = (void *)objc_msgSend(WeakRetained, "_newRemoteBoost");
  objc_msgSend(WeakRetained, "setRemoteBoost:", v2);

}

void __34__EMDaemonBooster__newRemoteBoost__block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[5];
    v3 = a1[6];
    v5 = 134218242;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_DEFAULT, "%ld: Released Daemon Boost for: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)dealloc
{
  void *v3;
  NSProgress *remoteBoost;
  objc_super v5;

  -[EMDaemonBooster remoteBoost](self, "remoteBoost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  remoteBoost = self->_remoteBoost;
  self->_remoteBoost = 0;

  v5.receiver = self;
  v5.super_class = (Class)EMDaemonBooster;
  -[EMDaemonBooster dealloc](&v5, sel_dealloc);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setLoggingDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSProgress)remoteBoost
{
  return self->_remoteBoost;
}

- (void)setRemoteBoost:(id)a3
{
  objc_storeStrong((id *)&self->_remoteBoost, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteBoost, 0);
  objc_storeStrong((id *)&self->_loggingDescription, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
