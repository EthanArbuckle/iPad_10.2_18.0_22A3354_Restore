@implementation HDCloudSyncStateSyncShim

- (HDCloudSyncStateSyncShim)initWithProfile:(id)a3
{
  id v5;
  HDCloudSyncStateSyncShim *v6;
  HDCloudSyncStateSyncShim *v7;
  uint64_t v8;
  NSDictionary *domainToEntityClassMapping;
  uint64_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncStateSyncShim;
  v6 = -[HDCloudSyncStateSyncShim init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    -[HDCloudSyncStateSyncShim _createDomainToEntityMapping](v7, "_createDomainToEntityMapping");
    v8 = objc_claimAutoreleasedReturnValue();
    domainToEntityClassMapping = v7->_domainToEntityClassMapping;
    v7->_domainToEntityClassMapping = (NSDictionary *)v8;

    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)mergeStateDataWithStore:(id)a3 domain:(id)a4 configuration:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *queue;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  char v27;
  _QWORD v28[4];
  id v29;
  HDCloudSyncStateSyncShim *v30;
  objc_class *v31;
  id v32;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = -[HDCloudSyncStateSyncShim _stateEntityForDomain:](self, "_stateEntityForDomain:", a4);
  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityAssertion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "contextWithAccessibilityAssertion:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDProfile database](self->_profile, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __84__HDCloudSyncStateSyncShim_mergeStateDataWithStore_domain_configuration_completion___block_invoke;
  v28[3] = &unk_1E6CF4CA8;
  v30 = self;
  v31 = v13;
  v29 = v10;
  v19 = v10;
  LOBYTE(v13) = objc_msgSend(v17, "performTransactionWithContext:error:block:inaccessibilityHandler:", v16, &v32, v28, 0);
  v20 = v32;

  queue = self->_queue;
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __84__HDCloudSyncStateSyncShim_mergeStateDataWithStore_domain_configuration_completion___block_invoke_2;
  block[3] = &unk_1E6CEBC78;
  v27 = (char)v13;
  v25 = v20;
  v26 = v11;
  v22 = v20;
  v23 = v11;
  dispatch_async(queue, block);

}

uint64_t __84__HDCloudSyncStateSyncShim_mergeStateDataWithStore_domain_configuration_completion___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(*(id *)(a1 + 48), "updateDataWithStateStorage:profile:transaction:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v5, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 125, CFSTR("State entity class %@ doesnt implement State Sync protocol"), *(_QWORD *)(a1 + 48));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v7);
      else
        _HKLogDroppedError();
    }

    v6 = 0;
  }

  return v6;
}

uint64_t __84__HDCloudSyncStateSyncShim_mergeStateDataWithStore_domain_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)syncDidFinishWithResult:(BOOL)a3 domain:(id)a4 stateStore:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  objc_class *v12;
  NSObject *queue;
  id *v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD block[4];
  _QWORD v22[2];

  v8 = a3;
  v10 = a5;
  v11 = a6;
  v12 = -[HDCloudSyncStateSyncShim _stateEntityForDomain:](self, "_stateEntityForDomain:", a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class syncDidFinishWithResult:stateStore:profile:](v12, "syncDidFinishWithResult:stateStore:profile:", !v8, v10, self->_profile);
    queue = self->_queue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__HDCloudSyncStateSyncShim_syncDidFinishWithResult_domain_stateStore_completion___block_invoke_2;
    v18[3] = &unk_1E6CE8C48;
    v14 = &v20;
    v19 = 0;
    v20 = v11;
    v15 = v11;
    dispatch_async(queue, v18);

  }
  else
  {
    v16 = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__HDCloudSyncStateSyncShim_syncDidFinishWithResult_domain_stateStore_completion___block_invoke;
    block[3] = &unk_1E6CF4CD0;
    v14 = (id *)v22;
    v22[0] = v11;
    v22[1] = v12;
    v17 = v11;
    dispatch_async(v16, block);
  }

}

void __81__HDCloudSyncStateSyncShim_syncDidFinishWithResult_domain_stateStore_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 125, CFSTR("State entity class %@ doesnt implement State Sync protocol"), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __81__HDCloudSyncStateSyncShim_syncDidFinishWithResult_domain_stateStore_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32));
}

- (id)_createDomainToEntityMapping
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HDProfile daemon](self->_profile, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudSyncCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateSyncEntityClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hk_mapToDictionary:", &__block_literal_global_76);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __56__HDCloudSyncStateSyncShim__createDomainToEntityMapping__block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "stateEntitySchema");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))a3)[2](v5, v6, a2);

}

- (Class)_stateEntityForDomain:(id)a3
{
  return (Class)-[NSDictionary objectForKeyedSubscript:](self->_domainToEntityClassMapping, "objectForKeyedSubscript:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_domainToEntityClassMapping, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
