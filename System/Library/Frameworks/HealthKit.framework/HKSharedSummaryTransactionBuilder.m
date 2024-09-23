@implementation HKSharedSummaryTransactionBuilder

- (HKSharedSummaryTransactionBuilder)initWithHealthStore:(id)a3
{
  return -[HKSharedSummaryTransactionBuilder initWithHealthStore:transactionUUID:](self, "initWithHealthStore:transactionUUID:", a3, 0);
}

- (HKSharedSummaryTransactionBuilder)initWithHealthStore:(id)a3 transactionUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  HKSharedSummaryTransactionBuilder *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "profileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type") == 2;

  v10 = -[HKSharedSummaryTransactionBuilder initWithHealthStore:transactionUUID:allowCommitted:](self, "initWithHealthStore:transactionUUID:allowCommitted:", v7, v6, v9);
  return v10;
}

- (HKSharedSummaryTransactionBuilder)initWithHealthStore:(id)a3 transactionUUID:(id)a4 allowCommitted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  HKSharedSummaryTransactionBuilder *v10;
  uint64_t v11;
  NSUUID *transactionUUID;
  HKTaskServerProxyProvider *v13;
  void *v14;
  uint64_t v15;
  HKTaskServerProxyProvider *proxyProvider;
  HKSharedSummaryTransactionBuilderTaskConfiguration *v17;
  NSObject *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  HKSharedSummaryTransactionBuilder *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HKSharedSummaryTransactionBuilder;
  v10 = -[HKSharedSummaryTransactionBuilder init](&v21, sel_init);
  if (v10)
  {
    if (v9)
    {
      v11 = objc_msgSend(v9, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    transactionUUID = v10->_transactionUUID;
    v10->_transactionUUID = (NSUUID *)v11;

    objc_storeWeak((id *)&v10->_healthStore, v8);
    v13 = [HKTaskServerProxyProvider alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v13, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v8, CFSTR("HKSharedSummaryTransactionBuilderServerIdentifier"), v10, v14);
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v15;

    v17 = objc_alloc_init(HKSharedSummaryTransactionBuilderTaskConfiguration);
    -[HKSharedSummaryTransactionBuilderTaskConfiguration setTransactionUUID:](v17, "setTransactionUUID:", v10->_transactionUUID);
    -[HKSharedSummaryTransactionBuilderTaskConfiguration setAllowCommitted:](v17, "setAllowCommitted:", v5);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v10->_proxyProvider, "setTaskConfiguration:", v17);
    _HKInitializeLogging();
    HKLogSharing();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[NSUUID UUIDString](v10->_transactionUUID, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v10;
      v24 = 2114;
      v25 = v19;
      _os_log_impl(&dword_19A0E6000, v18, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Created new builder for transaction %{public}@", buf, 0x16u);

    }
  }

  return v10;
}

- (id)isCommittedWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__35;
  v16 = __Block_byref_object_dispose__35;
  v17 = 0;
  proxyProvider = self->_proxyProvider;
  v10[4] = &v12;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke;
  v11[3] = &unk_1E37F1898;
  v11[4] = &v18;
  v11[5] = &v12;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke_3;
  v10[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v11, v10);
  v5 = (void *)v13[5];
  if (v5)
  {
    v6 = v5;
    v7 = v6;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError(v6);

    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v19 + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

uint64_t __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke_2;
  v3[3] = &unk_1E37F1870;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getCommitStatusWithCompletion:", v3);
}

void __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "BOOLValue");
  else
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

void __58__HKSharedSummaryTransactionBuilder_isCommittedWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addSummaries:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke;
  v14[3] = &unk_1E37F18C0;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_3;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

void __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_2;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addSummaries:completion:", v3, v4);

}

uint64_t __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)reuseSummaries:(id)a3 completion:(id)a4
{
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  proxyProvider = self->_proxyProvider;
  v7 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_map:", &__block_literal_global_83);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v11 = self->_proxyProvider;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_2;
  v16[3] = &unk_1E37F18C0;
  v17 = v9;
  v18 = v8;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4;
  v14[3] = &unk_1E37E69F8;
  v14[4] = self;
  v15 = v18;
  v12 = v18;
  v13 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v11, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_3;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_reuseSummariesWithUUIDs:completion:", v3, v4);

}

uint64_t __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)reuseSummariesWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__HKSharedSummaryTransactionBuilder_reuseSummariesWithUUIDs_completion___block_invoke;
  v14[3] = &unk_1E37F18C0;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __72__HKSharedSummaryTransactionBuilder_reuseSummariesWithUUIDs_completion___block_invoke_2;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __72__HKSharedSummaryTransactionBuilder_reuseSummariesWithUUIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_reuseSummariesWithUUIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __72__HKSharedSummaryTransactionBuilder_reuseSummariesWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)reuseSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__HKSharedSummaryTransactionBuilder_reuseSummariesWithPackage_names_completion___block_invoke;
  v18[3] = &unk_1E37F1928;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __80__HKSharedSummaryTransactionBuilder_reuseSummariesWithPackage_names_completion___block_invoke_2;
  v16[3] = &unk_1E37E69F8;
  v16[4] = self;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __80__HKSharedSummaryTransactionBuilder_reuseSummariesWithPackage_names_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_reuseSummariesWithPackage:names:completion:", a1[4], a1[5], a1[6]);
}

void __80__HKSharedSummaryTransactionBuilder_reuseSummariesWithPackage_names_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)reuseAllSummariesWithPackage:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__HKSharedSummaryTransactionBuilder_reuseAllSummariesWithPackage_completion___block_invoke;
  v14[3] = &unk_1E37F18C0;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __77__HKSharedSummaryTransactionBuilder_reuseAllSummariesWithPackage_completion___block_invoke_2;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __77__HKSharedSummaryTransactionBuilder_reuseAllSummariesWithPackage_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_reuseAllSummariesWithPackage:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __77__HKSharedSummaryTransactionBuilder_reuseAllSummariesWithPackage_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)addMetadata:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke;
  v14[3] = &unk_1E37F18C0;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke_2;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_addMetadata:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeSummariesWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke;
  v14[3] = &unk_1E37F18C0;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

void __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_2;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_removeSummariesWithUUIDs:completion:", v3, v4);

}

uint64_t __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeSummariesWithPackage:(id)a3 names:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke;
  v18[3] = &unk_1E37F1928;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke_3;
  v16[3] = &unk_1E37E69F8;
  v16[4] = self;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke_2;
  v5[3] = &unk_1E37E6AE8;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_removeSummariesWithPackage:names:completion:", v3, v4, v5);

}

uint64_t __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__HKSharedSummaryTransactionBuilder_removeSummariesWithPackage_names_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeAllSummariesWithPackage:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke;
  v14[3] = &unk_1E37F18C0;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke_3;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

void __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke_2;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_removeAllSummariesWithPackage:completion:", v3, v4);

}

uint64_t __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__HKSharedSummaryTransactionBuilder_removeAllSummariesWithPackage_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)commitAsUrgent:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  BOOL v18;
  uint8_t buf[4];
  HKSharedSummaryTransactionBuilder *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[NSUUID UUIDString](self->_transactionUUID, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    v20 = self;
    v21 = 2114;
    if (v4)
      v10 = CFSTR("YES");
    v22 = v8;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Commiting transaction %{public}@ urgent: %{public}@", buf, 0x20u);

  }
  v11 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke;
  v16[3] = &unk_1E37F1950;
  v18 = v4;
  v17 = v6;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke_2;
  v14[3] = &unk_1E37E69F8;
  v14[4] = self;
  v15 = v17;
  v13 = v17;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_commitAsUrgent:completion:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)commitWithCompletion:(id)a3
{
  -[HKSharedSummaryTransactionBuilder commitAsUrgent:completion:](self, "commitAsUrgent:completion:", 0, a3);
}

- (void)discardWithCompletion:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  HKSharedSummaryTransactionBuilder *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NSUUID UUIDString](self->_transactionUUID, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Discarding transaction %{public}@", buf, 0x16u);

  }
  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke;
  v12[3] = &unk_1E37F1978;
  v13 = v4;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_3;
  v10[3] = &unk_1E37E69F8;
  v10[4] = self;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

void __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_2;
  v3[3] = &unk_1E37E6AE8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_discardWithCompletion:", v3);

}

uint64_t __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)addedSummariesWithPackage:(id)a3 names:(id)a4 resultsHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  HKTaskServerProxyProvider *proxyProvider;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke;
  v23[3] = &unk_1E37F19C8;
  v23[4] = self;
  v24 = v10;
  v12 = (void *)objc_msgSend(v23, "copy");
  proxyProvider = self->_proxyProvider;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_3;
  v19[3] = &unk_1E37F1928;
  v20 = v8;
  v21 = v9;
  v22 = v12;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_4;
  v17[3] = &unk_1E37E69F8;
  v17[4] = self;
  v18 = v22;
  v14 = v22;
  v15 = v9;
  v16 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v19, v17);

}

void __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  char v18;
  _QWORD v19[5];
  id v20;

  v7 = a2;
  v8 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__35;
  v19[4] = __Block_byref_object_dispose__35;
  v20 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_2;
  block[3] = &unk_1E37F19A0;
  v10 = *(id *)(a1 + 40);
  v18 = a3;
  v14 = v7;
  v15 = v8;
  v16 = v10;
  v17 = v19;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, block);

  _Block_object_dispose(v19, 8);
}

void __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

uint64_t __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_addedSummariesWithPackage:names:resultsHandler:", a1[4], a1[5], a1[6]);
}

void __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_4_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F948);
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F9A8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_addSummaries_completion_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_addedSummariesWithPackage_names_resultsHandler_, 0, 1);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_remote_reuseSummariesWithUUIDs_completion_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_remote_removeSummariesWithUUIDs_completion_, 0, 0);

  return v2;
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (NSUUID)transactionUUID
{
  return self->_transactionUUID;
}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_loadWeakRetained((id *)&self->_healthStore);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_healthStore);
  objc_storeStrong((id *)&self->_transactionUUID, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __61__HKSharedSummaryTransactionBuilder_addSummaries_completion___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error adding summaries to transaction %{public}@");
  OUTLINED_FUNCTION_3();
}

void __63__HKSharedSummaryTransactionBuilder_reuseSummaries_completion___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error reusing summaries in transaction %{public}@");
  OUTLINED_FUNCTION_3();
}

void __60__HKSharedSummaryTransactionBuilder_addMetadata_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error adding metadata to transaction %{public}@");
  OUTLINED_FUNCTION_3();
}

void __73__HKSharedSummaryTransactionBuilder_removeSummariesWithUUIDs_completion___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error removing summaries from transaction %{public}@");
  OUTLINED_FUNCTION_3();
}

void __63__HKSharedSummaryTransactionBuilder_commitAsUrgent_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error committing transaction %{public}@");
  OUTLINED_FUNCTION_3();
}

void __59__HKSharedSummaryTransactionBuilder_discardWithCompletion___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error discarding transaction %{public}@");
  OUTLINED_FUNCTION_3();
}

void __84__HKSharedSummaryTransactionBuilder_addedSummariesWithPackage_names_resultsHandler___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Error retrieving added summaries %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
