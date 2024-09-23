@implementation HDCloudSyncManagerRepositoryTask

- (HDCloudSyncManagerRepositoryTask)initWithManager:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncManagerRepositoryTask *v8;
  HDCloudSyncManagerRepositoryTask *v9;
  uint64_t v10;
  HDCloudSyncContext *context;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncManagerRepositoryTask;
  v8 = -[HDCloudSyncManagerTask init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v6);
    v10 = objc_msgSend(v7, "copy");
    context = v9->_context;
    v9->_context = (HDCloudSyncContext *)v10;

  }
  return v9;
}

- (void)main
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  HDXPCClient *client;
  _QWORD v8[5];
  id v9;

  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Manager has gone nil before starting task."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!-[HDCloudSyncManagerRepositoryTask runWhenSyncProhibited](self, "runWhenSyncProhibited"))
  {
    v9 = 0;
    v4 = objc_msgSend(v3, "canPerformCloudSyncWithError:", &v9);
    v5 = v9;
    v6 = v5;
    if ((v4 & 1) != 0)
    {

      goto LABEL_5;
    }
LABEL_7:
    -[HDCloudSyncManagerRepositoryTask mainWithRepositories:error:](self, "mainWithRepositories:error:", 0, v6);

    goto LABEL_8;
  }
LABEL_5:
  client = self->_client;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__HDCloudSyncManagerRepositoryTask_main__block_invoke;
  v8[3] = &unk_1E6CF3370;
  v8[4] = self;
  objc_msgSend(v3, "cloudSyncRepositoriesForClient:completion:", client, v8);
LABEL_8:

}

void __40__HDCloudSyncManagerRepositoryTask_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = v7;
    v10 = 138543618;
    v11 = v8;
    v12 = 2048;
    v13 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched %ld repositories.", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "mainWithRepositories:error:", v5, v6);

}

- (void)mainWithRepositories:(id)a3 error:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (HDCloudSyncManager)manager
{
  return (HDCloudSyncManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (HDCloudSyncContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)repositories
{
  return self->_repositories;
}

- (void)setRepositories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (HDXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (BOOL)runWhenSyncProhibited
{
  return self->_runWhenSyncProhibited;
}

- (void)setRunWhenSyncProhibited:(BOOL)a3
{
  self->_runWhenSyncProhibited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_repositories, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_manager);
}

@end
