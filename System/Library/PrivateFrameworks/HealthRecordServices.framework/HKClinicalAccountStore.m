@implementation HKClinicalAccountStore

- (HKClinicalAccountStore)initWithHealthStore:(id)a3
{
  id v5;
  HKClinicalAccountStore *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKObserverSet *accountStateChangeObservers;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKClinicalAccountStore;
  v6 = -[HKClinicalAccountStore init](&v22, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "initWithName:loggingCategory:", v9, v10);
    accountStateChangeObservers = v6->_accountStateChangeObservers;
    v6->_accountStateChangeObservers = (HKObserverSet *)v11;

    objc_storeStrong((id *)&v6->_healthStore, a3);
    v13 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, v14, v6, v15);
    proxyProvider = v6->_proxyProvider;
    v6->_proxyProvider = (HKTaskServerProxyProvider *)v16;

    objc_initWeak(&location, v6);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __46__HKClinicalAccountStore_initWithHealthStore___block_invoke;
    v19[3] = &unk_24D549EC0;
    objc_copyWeak(&v20, &location);
    -[HKTaskServerProxyProvider setAutomaticProxyReconnectionHandler:](v6->_proxyProvider, "setAutomaticProxyReconnectionHandler:", v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __46__HKClinicalAccountStore_initWithHealthStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:", v4);

}

- (id)allAccountsWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v9[4] = &v17;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__HKClinicalAccountStore_allAccountsWithError___block_invoke;
  v10[3] = &unk_24D549F10;
  v10[4] = &v11;
  v10[5] = &v17;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__HKClinicalAccountStore_allAccountsWithError___block_invoke_3;
  v9[3] = &unk_24D5491F0;
  -[HKClinicalAccountStore _getSynchronousServerProxyWithHandler:errorHandler:](self, "_getSynchronousServerProxyWithHandler:errorHandler:", v10, v9);
  v4 = (void *)v12[5];
  if (!v4)
  {
    v5 = (id)v18[5];
    v6 = v5;
    if (v5)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v5);
      else
        _HKLogDroppedError();
    }

    v4 = (void *)v12[5];
  }
  v7 = v4;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __47__HKClinicalAccountStore_allAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__HKClinicalAccountStore_allAccountsWithError___block_invoke_2;
  v3[3] = &unk_24D549EE8;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchAllAccountsWithCompletion:", v3);
}

void __47__HKClinicalAccountStore_allAccountsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __47__HKClinicalAccountStore_allAccountsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)fetchAllAccountsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__HKClinicalAccountStore_fetchAllAccountsWithCompletion___block_invoke;
  v9[3] = &unk_24D549F38;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __57__HKClinicalAccountStore_fetchAllAccountsWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __57__HKClinicalAccountStore_fetchAllAccountsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllAccountsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__HKClinicalAccountStore_fetchAllAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAccountsForGatewaysWithExternalIDs:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__HKClinicalAccountStore_fetchAccountsForGatewaysWithExternalIDs_completion___block_invoke;
  v13[3] = &unk_24D549F60;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __77__HKClinicalAccountStore_fetchAccountsForGatewaysWithExternalIDs_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __77__HKClinicalAccountStore_fetchAccountsForGatewaysWithExternalIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAccountsForGatewaysWithExternalIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __77__HKClinicalAccountStore_fetchAccountsForGatewaysWithExternalIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAccountForSource:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__HKClinicalAccountStore_fetchAccountForSource_completion___block_invoke;
  v13[3] = &unk_24D549F60;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __59__HKClinicalAccountStore_fetchAccountForSource_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __59__HKClinicalAccountStore_fetchAccountForSource_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAccountForSource:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __59__HKClinicalAccountStore_fetchAccountForSource_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)accountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke;
  v15[3] = &unk_24D549FB0;
  v8 = v6;
  v16 = v8;
  v17 = &v19;
  v18 = &v25;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke_3;
  v14[3] = &unk_24D5491F0;
  v14[4] = &v25;
  -[HKClinicalAccountStore _getSynchronousServerProxyWithHandler:errorHandler:](self, "_getSynchronousServerProxyWithHandler:errorHandler:", v15, v14);
  v9 = (void *)v20[5];
  if (!v9)
  {
    v10 = (id)v26[5];
    v11 = v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    v9 = (void *)v20[5];
  }
  v12 = v9;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

uint64_t __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke_2;
  v4[3] = &unk_24D549F88;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchAccountWithIdentifier:completion:", v2, v4);
}

void __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __54__HKClinicalAccountStore_accountWithIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)fetchAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__HKClinicalAccountStore_fetchAccountWithIdentifier_completion___block_invoke;
  v13[3] = &unk_24D549F60;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __64__HKClinicalAccountStore_fetchAccountWithIdentifier_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __64__HKClinicalAccountStore_fetchAccountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAccountWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __64__HKClinicalAccountStore_fetchAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteAccountWithIdentifier:(id)a3 deletionReason:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;

  v8 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__HKClinicalAccountStore_deleteAccountWithIdentifier_deletionReason_completion___block_invoke;
  v15[3] = &unk_24D549FD8;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __80__HKClinicalAccountStore_deleteAccountWithIdentifier_deletionReason_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __80__HKClinicalAccountStore_deleteAccountWithIdentifier_deletionReason_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteAccountWithIdentifier:deletionReason:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __80__HKClinicalAccountStore_deleteAccountWithIdentifier_deletionReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)hasAnyHealthRecordsAccountWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKClinicalAccountStore _clientQueueBoolHandlerWithCompletion:](self, "_clientQueueBoolHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke;
  v9[3] = &unk_24D549F38;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_191;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

void __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_2;
  v3[3] = &unk_24D54A000;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_hasAnyHealthRecordsAccountWithCompletion:", v3);

}

void __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1);

}

void __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_191(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)hasGatewayBackedHealthRecordsAccountWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKClinicalAccountStore _clientQueueBoolHandlerWithCompletion:](self, "_clientQueueBoolHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke;
  v9[3] = &unk_24D549F38;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_192;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

void __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_2;
  v3[3] = &unk_24D54A000;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_hasGatewayBackedHealthRecordsAccountWithCompletion:", v3);

}

void __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1);

}

void __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_192(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)deviceConfigurationSupportsHealthRecords:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKClinicalAccountStore _clientQueueFailableActionHandlerWithCompletion:](self, "_clientQueueFailableActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke;
  v9[3] = &unk_24D549F38;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deviceConfigurationSupportsHealthRecords:", *(_QWORD *)(a1 + 32));
}

void __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)shouldShowHealthRecordsSectionWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKClinicalAccountStore _clientQueueDoubleBoolHandlerWithCompletion:](self, "_clientQueueDoubleBoolHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke;
  v9[3] = &unk_24D549F38;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_194;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

void __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_2;
  v3[3] = &unk_24D54A028;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_shouldShowHealthRecordsSectionWithCompletion:", v3);

}

void __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;

  v7 = a4;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1, a3);

}

void __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_194(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)supportsClinicalSharing
{
  char v2;
  _QWORD v4[5];
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4[4] = &v6;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke;
  v5[3] = &unk_24D54A078;
  v5[4] = &v6;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_195;
  v4[3] = &unk_24D5491F0;
  -[HKClinicalAccountStore _getSynchronousServerProxyWithHandler:errorHandler:](self, "_getSynchronousServerProxyWithHandler:errorHandler:", v5, v4);
  v2 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_2;
  v3[3] = &unk_24D54A050;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_supportsClinicalSharingWithCompletion:", v3);
}

void __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 1;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_2_cold_1();
  }

}

void __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_195(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_2_cold_1();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;

}

- (void)beginInitialLoginSessionForGateway:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (objc_msgSend(MEMORY[0x24BDD4198], "isRunningStoreDemoMode"))
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v10 = v20;
      _os_log_impl(&dword_2163C4000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ running store demo mode, connecting to gateways is not supported", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 111, CFSTR("Running in store demo mode, connecting to gateways is not supported"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
  }
  else
  {
    -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __72__HKClinicalAccountStore_beginInitialLoginSessionForGateway_completion___block_invoke;
    v16[3] = &unk_24D549F60;
    v17 = v6;
    v18 = v12;
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __72__HKClinicalAccountStore_beginInitialLoginSessionForGateway_completion___block_invoke_2;
    v14[3] = &unk_24D549308;
    v7 = (void (**)(id, _QWORD, void *))v18;
    v15 = v7;
    -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v16, v14);

    v11 = v17;
  }

}

void __72__HKClinicalAccountStore_beginInitialLoginSessionForGateway_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "externalID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_beginInitialLoginSessionForGatewayWithExternalID:completion:", v5, *(_QWORD *)(a1 + 40));

}

uint64_t __72__HKClinicalAccountStore_beginInitialLoginSessionForGateway_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)beginReloginSessionForAccount:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__HKClinicalAccountStore_beginReloginSessionForAccount_completion___block_invoke;
  v13[3] = &unk_24D549F60;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __67__HKClinicalAccountStore_beginReloginSessionForAccount_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

void __67__HKClinicalAccountStore_beginReloginSessionForAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_beginReloginSessionForAccountWithIdentifier:completion:", v5, *(_QWORD *)(a1 + 40));

}

uint64_t __67__HKClinicalAccountStore_beginReloginSessionForAccount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endLoginSessionWithState:(id)a3 code:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKClinicalAccountStore *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  HKClinicalAccountStore *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__2;
  v26[4] = __Block_byref_object_dispose__2;
  v11 = self;
  v27 = v11;
  v12 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke;
  v23[3] = &unk_24D54A0C8;
  v23[4] = v11;
  v24 = v10;
  v25 = v26;
  v13 = (void *)MEMORY[0x2199F7D50](v23);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_3;
  v19[3] = &unk_24D54A0F0;
  v14 = v8;
  v20 = v14;
  v15 = v9;
  v21 = v15;
  v22 = v13;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_4;
  v17[3] = &unk_24D549308;
  v16 = v22;
  v18 = v16;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](v11, "_fetchServerProxyWithHandler:errorHandler:", v19, v17);

  _Block_object_dispose(v26, 8);
}

void __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_2;
  block[3] = &unk_24D54A0A0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  dispatch_async(v4, block);

}

void __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

uint64_t __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_3(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_endLoginSessionWithState:code:completion:", a1[4], a1[5], a1[6]);
}

void __67__HKClinicalAccountStore_endLoginSessionWithState_code_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[HKClinicalAccountLoginCompletionState completionStateWithError:](HKClinicalAccountLoginCompletionState, "completionStateWithError:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)persistEphemeralAccount:(id)a3 triggerIngestion:(BOOL)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__HKClinicalAccountStore_persistEphemeralAccount_triggerIngestion_completion___block_invoke;
  v15[3] = &unk_24D54A118;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __78__HKClinicalAccountStore_persistEphemeralAccount_triggerIngestion_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __78__HKClinicalAccountStore_persistEphemeralAccount_triggerIngestion_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_persistEphemeralAccount:triggerIngestion:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __78__HKClinicalAccountStore_persistEphemeralAccount_triggerIngestion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pruneAuthenticationDataWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__HKClinicalAccountStore_pruneAuthenticationDataWithCompletion___block_invoke;
  v9[3] = &unk_24D549F38;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __64__HKClinicalAccountStore_pruneAuthenticationDataWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __64__HKClinicalAccountStore_pruneAuthenticationDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pruneAuthenticationDataWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__HKClinicalAccountStore_pruneAuthenticationDataWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)replaceAccountWithNewAccountForAccountWithIdentifier:(id)a3 usingCredentialWithPersistentID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __122__HKClinicalAccountStore_replaceAccountWithNewAccountForAccountWithIdentifier_usingCredentialWithPersistentID_completion___block_invoke;
  v17[3] = &unk_24D54A0F0;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __122__HKClinicalAccountStore_replaceAccountWithNewAccountForAccountWithIdentifier_usingCredentialWithPersistentID_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __122__HKClinicalAccountStore_replaceAccountWithNewAccountForAccountWithIdentifier_usingCredentialWithPersistentID_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_replaceAccountWithNewAccountForAccountWithIdentifier:usingCredentialWithPersistentID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __122__HKClinicalAccountStore_replaceAccountWithNewAccountForAccountWithIdentifier_usingCredentialWithPersistentID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)refreshAccountConnectionInformationForAccountsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __99__HKClinicalAccountStore_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion___block_invoke;
  v13[3] = &unk_24D549F60;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __99__HKClinicalAccountStore_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __99__HKClinicalAccountStore_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_refreshAccountConnectionInformationForAccountsWithIdentifiers:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __99__HKClinicalAccountStore_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateClinicalSharingStatusForAccountWithIdentifier:(id)a3 firstSharedDate:(id)a4 lastSharedDate:(id)a5 userStatus:(id)a6 multiDeviceStatus:(id)a7 primaryDeviceName:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __167__HKClinicalAccountStore_updateClinicalSharingStatusForAccountWithIdentifier_firstSharedDate_lastSharedDate_userStatus_multiDeviceStatus_primaryDeviceName_completion___block_invoke;
  v32[3] = &unk_24D54A140;
  v33 = v15;
  v34 = v16;
  v35 = v17;
  v36 = v18;
  v37 = v19;
  v38 = v20;
  v39 = v21;
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __167__HKClinicalAccountStore_updateClinicalSharingStatusForAccountWithIdentifier_firstSharedDate_lastSharedDate_userStatus_multiDeviceStatus_primaryDeviceName_completion___block_invoke_2;
  v30[3] = &unk_24D549308;
  v31 = v39;
  v23 = v39;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  v27 = v17;
  v28 = v16;
  v29 = v15;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v32, v30);

}

uint64_t __167__HKClinicalAccountStore_updateClinicalSharingStatusForAccountWithIdentifier_firstSharedDate_lastSharedDate_userStatus_multiDeviceStatus_primaryDeviceName_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateClinicalSharingStatusForAccountWithIdentifier:firstSharedDate:lastSharedDate:userStatus:multiDeviceStatus:primaryDeviceName:completion:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);
}

uint64_t __167__HKClinicalAccountStore_updateClinicalSharingStatusForAccountWithIdentifier_firstSharedDate_lastSharedDate_userStatus_multiDeviceStatus_primaryDeviceName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addAccountStateChangeListener:(id)a3
{
  id v4;

  v4 = a3;
  -[HKClinicalAccountStore _establishProxyConnectionIfNoObserversArePresent](self, "_establishProxyConnectionIfNoObserversArePresent");
  -[HKObserverSet registerObserver:](self->_accountStateChangeObservers, "registerObserver:", v4);

}

- (void)removeAccountStateChangeListener:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_accountStateChangeObservers, "unregisterObserver:", a3);
}

- (void)fetchAllEventsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__HKClinicalAccountStore_fetchAllEventsForAccountWithIdentifier_completion___block_invoke;
  v13[3] = &unk_24D549F60;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __76__HKClinicalAccountStore_fetchAllEventsForAccountWithIdentifier_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __76__HKClinicalAccountStore_fetchAllEventsForAccountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllEventsForAccountIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __76__HKClinicalAccountStore_fetchAllEventsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createStaticAccountWithTitle:(id)a3 subtitle:(id)a4 description:(id)a5 countryCode:(id)a6 fhirVersion:(id)a7 onlyIfNeededForSimulatedGatewayID:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __145__HKClinicalAccountStore_createStaticAccountWithTitle_subtitle_description_countryCode_fhirVersion_onlyIfNeededForSimulatedGatewayID_completion___block_invoke;
  v32[3] = &unk_24D54A140;
  v33 = v15;
  v34 = v16;
  v35 = v17;
  v36 = v18;
  v37 = v19;
  v38 = v20;
  v39 = v21;
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __145__HKClinicalAccountStore_createStaticAccountWithTitle_subtitle_description_countryCode_fhirVersion_onlyIfNeededForSimulatedGatewayID_completion___block_invoke_2;
  v30[3] = &unk_24D549308;
  v31 = v39;
  v23 = v39;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  v27 = v17;
  v28 = v16;
  v29 = v15;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v32, v30);

}

uint64_t __145__HKClinicalAccountStore_createStaticAccountWithTitle_subtitle_description_countryCode_fhirVersion_onlyIfNeededForSimulatedGatewayID_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_createStaticAccountWithTitle:subtitle:description:countryCode:fhirVersion:onlyIfNeededForSimulatedGatewayID:completion:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);
}

uint64_t __145__HKClinicalAccountStore_createStaticAccountWithTitle_subtitle_description_countryCode_fhirVersion_onlyIfNeededForSimulatedGatewayID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidateCredentialForAccountWithIdentifier:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__HKClinicalAccountStore_invalidateCredentialForAccountWithIdentifier_event_completion___block_invoke;
  v17[3] = &unk_24D54A0F0;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __88__HKClinicalAccountStore_invalidateCredentialForAccountWithIdentifier_event_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __88__HKClinicalAccountStore_invalidateCredentialForAccountWithIdentifier_event_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_invalidateCredentialForAccountWithIdentifier:event:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __88__HKClinicalAccountStore_invalidateCredentialForAccountWithIdentifier_event_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateAccountCredentialStateForAccountWithIdentifier:(id)a3 state:(int64_t)a4 event:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  int64_t v23;

  v10 = a3;
  v11 = a5;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __102__HKClinicalAccountStore_updateAccountCredentialStateForAccountWithIdentifier_state_event_completion___block_invoke;
  v19[3] = &unk_24D54A168;
  v23 = a4;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __102__HKClinicalAccountStore_updateAccountCredentialStateForAccountWithIdentifier_state_event_completion___block_invoke_2;
  v17[3] = &unk_24D549308;
  v18 = v22;
  v14 = v22;
  v15 = v11;
  v16 = v10;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v19, v17);

}

uint64_t __102__HKClinicalAccountStore_updateAccountCredentialStateForAccountWithIdentifier_state_event_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateAccountCredentialStateWithIdentifier:state:event:completion:", a1[4], a1[7], a1[5], a1[6]);
}

uint64_t __102__HKClinicalAccountStore_updateAccountCredentialStateForAccountWithIdentifier_state_event_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)simulateUnmergeEventForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__HKClinicalAccountStore_simulateUnmergeEventForAccountWithIdentifier_completion___block_invoke;
  v13[3] = &unk_24D549F60;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __82__HKClinicalAccountStore_simulateUnmergeEventForAccountWithIdentifier_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __82__HKClinicalAccountStore_simulateUnmergeEventForAccountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_simulateUnmergeEventForAccountWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __82__HKClinicalAccountStore_simulateUnmergeEventForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)simulateAccountDownloadOverdueWithIdentifier:(id)a3 stage:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;

  v8 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __88__HKClinicalAccountStore_simulateAccountDownloadOverdueWithIdentifier_stage_completion___block_invoke;
  v15[3] = &unk_24D549FD8;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __88__HKClinicalAccountStore_simulateAccountDownloadOverdueWithIdentifier_stage_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __88__HKClinicalAccountStore_simulateAccountDownloadOverdueWithIdentifier_stage_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_simulateAccountDownloadOverdueWithIdentifier:stage:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __88__HKClinicalAccountStore_simulateAccountDownloadOverdueWithIdentifier_stage_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clientRemote_accountDidChange:(id)a3 changeType:(int64_t)a4
{
  id v6;
  void *v7;
  HKObserverSet *accountStateChangeObservers;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  uint8_t buf[4];
  HKClinicalAccountStore *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
  {
    v10 = v7;
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromAccountStateChangeType(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v12;
    _os_log_debug_impl(&dword_2163C4000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: account with identifier %{public}@ did change state: %{public}@", buf, 0x20u);

  }
  accountStateChangeObservers = self->_accountStateChangeObservers;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__HKClinicalAccountStore_clientRemote_accountDidChange_changeType___block_invoke;
  v13[3] = &unk_24D54A190;
  v13[4] = self;
  v14 = v6;
  v15 = a4;
  v9 = v6;
  -[HKObserverSet notifyObservers:](accountStateChangeObservers, "notifyObservers:", v13);

}

uint64_t __67__HKClinicalAccountStore_clientRemote_accountDidChange_changeType___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "clinicalAccountStore:accountDidChange:changeType:", a1[4], a1[5], a1[6]);
}

- (void)_establishProxyConnectionIfNoObserversArePresent
{
  if (!-[HKObserverSet count](self->_accountStateChangeObservers, "count"))
    -[HKClinicalAccountStore _establishProxyConnection](self, "_establishProxyConnection");
}

- (void)_reestablishProxyConnectionIfObserversArePresentWithPluginServerProxy:(id)a3
{
  void (**unitTesting_didCallReestablishProxyConnectionIfObserversArePresent)(void);
  id v5;

  v5 = a3;
  if (-[HKObserverSet count](self->_accountStateChangeObservers, "count"))
  {
    -[HKClinicalAccountStore _executeCheapCallOnPluginServerProxy:](self, "_executeCheapCallOnPluginServerProxy:", v5);
    unitTesting_didCallReestablishProxyConnectionIfObserversArePresent = (void (**)(void))self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent;
    if (unitTesting_didCallReestablishProxyConnectionIfObserversArePresent)
      unitTesting_didCallReestablishProxyConnectionIfObserversArePresent[2]();
  }

}

- (void)_establishProxyConnection
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__HKClinicalAccountStore__establishProxyConnection__block_invoke;
  v3[3] = &unk_24D54A1B8;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__HKClinicalAccountStore__establishProxyConnection__block_invoke_2;
  v2[3] = &unk_24D549448;
  -[HKClinicalAccountStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v3, v2);
}

uint64_t __51__HKClinicalAccountStore__establishProxyConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeCheapCallOnPluginServerProxy:", a2);
}

void __51__HKClinicalAccountStore__establishProxyConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __51__HKClinicalAccountStore__establishProxyConnection__block_invoke_2_cold_1();

}

- (void)_executeCheapCallOnPluginServerProxy:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEBUG))
    -[HKClinicalAccountStore _executeCheapCallOnPluginServerProxy:].cold.1();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__HKClinicalAccountStore__executeCheapCallOnPluginServerProxy___block_invoke;
  v5[3] = &unk_24D5493F8;
  v5[4] = self;
  objc_msgSend(v4, "remote_pingWithCompletion:", v5);

}

void __63__HKClinicalAccountStore__executeCheapCallOnPluginServerProxy___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      __63__HKClinicalAccountStore__executeCheapCallOnPluginServerProxy___block_invoke_cold_1();
  }

}

- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void)_getSynchronousServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](self->_proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", a3, a4);
}

- (id)_clientQueueBoolHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  -[HKTaskServerProxyProvider exportedObject](self->_proxyProvider, "exportedObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__HKClinicalAccountStore__clientQueueBoolHandlerWithCompletion___block_invoke;
  v8[3] = &unk_24D54A208;
  v8[4] = self;
  v9 = v4;
  v10 = v11;
  v5 = v4;
  v6 = (void *)MEMORY[0x2199F7D50](v8);

  _Block_object_dispose(v11, 8);
  return v6;
}

void __64__HKClinicalAccountStore__clientQueueBoolHandlerWithCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  char v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HKClinicalAccountStore__clientQueueBoolHandlerWithCompletion___block_invoke_2;
  block[3] = &unk_24D54A1E0;
  v5 = *(id *)(a1 + 40);
  v10 = a2;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  dispatch_async(v4, block);

}

void __64__HKClinicalAccountStore__clientQueueBoolHandlerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)_clientQueueDoubleBoolHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  -[HKTaskServerProxyProvider exportedObject](self->_proxyProvider, "exportedObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__HKClinicalAccountStore__clientQueueDoubleBoolHandlerWithCompletion___block_invoke;
  v8[3] = &unk_24D54A258;
  v8[4] = self;
  v9 = v4;
  v10 = v11;
  v5 = v4;
  v6 = (void *)MEMORY[0x2199F7D50](v8);

  _Block_object_dispose(v11, 8);
  return v6;
}

void __70__HKClinicalAccountStore__clientQueueDoubleBoolHandlerWithCompletion___block_invoke(uint64_t a1, char a2, char a3)
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  char v12;
  char v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HKClinicalAccountStore__clientQueueDoubleBoolHandlerWithCompletion___block_invoke_2;
  block[3] = &unk_24D54A230;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v13 = a3;
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v7;
  v11 = v8;
  dispatch_async(v6, block);

}

void __70__HKClinicalAccountStore__clientQueueDoubleBoolHandlerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)_clientQueueFailableActionHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  -[HKTaskServerProxyProvider exportedObject](self->_proxyProvider, "exportedObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__HKClinicalAccountStore__clientQueueFailableActionHandlerWithCompletion___block_invoke;
  v8[3] = &unk_24D54A2A8;
  v8[4] = self;
  v9 = v4;
  v10 = v11;
  v5 = v4;
  v6 = (void *)MEMORY[0x2199F7D50](v8);

  _Block_object_dispose(v11, 8);
  return v6;
}

void __74__HKClinicalAccountStore__clientQueueFailableActionHandlerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__HKClinicalAccountStore__clientQueueFailableActionHandlerWithCompletion___block_invoke_2;
  v9[3] = &unk_24D54A280;
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = a2;
  v8 = v5;
  dispatch_async(v6, v9);

}

void __74__HKClinicalAccountStore__clientQueueFailableActionHandlerWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a1[5];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, a1[7], a1[4]);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (id)unitTesting_didCallReestablishProxyConnectionIfObserversArePresent
{
  return self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent;
}

- (void)setUnitTesting_didCallReestablishProxyConnectionIfObserversArePresent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didCallReestablishProxyConnectionIfObserversArePresent, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_accountStateChangeObservers, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __67__HKClinicalAccountStore_hasAnyHealthRecordsAccountWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2163C4000, v0, v1, "Failed to query for any health records account availability with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __77__HKClinicalAccountStore_hasGatewayBackedHealthRecordsAccountWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2163C4000, v0, v1, "Failed to query for gateway backed account availability with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __67__HKClinicalAccountStore_deviceConfigurationSupportsHealthRecords___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2163C4000, v0, v1, "Failed to determine if device configuration supports CHR with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__HKClinicalAccountStore_shouldShowHealthRecordsSectionWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2163C4000, v0, v1, "Failed to determine if CHR section should be shown with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__HKClinicalAccountStore_supportsClinicalSharing__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2163C4000, v0, v1, "Failed to query for clinical sharing availability with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __51__HKClinicalAccountStore__establishProxyConnection__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163C4000, v0, v1, "%{public}@: error establishing proxy connection: %{public}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_executeCheapCallOnPluginServerProxy:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2114;
  v4 = v0;
  _os_log_debug_impl(&dword_2163C4000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: making cheap XCP call to establish connection on %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __63__HKClinicalAccountStore__executeCheapCallOnPluginServerProxy___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163C4000, v0, v1, "%{public}@: error executing a ping: %{public}@");
  OUTLINED_FUNCTION_1_0();
}

@end
