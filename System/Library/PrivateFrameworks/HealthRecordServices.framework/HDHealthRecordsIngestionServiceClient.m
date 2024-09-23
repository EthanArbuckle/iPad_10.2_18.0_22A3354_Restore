@implementation HDHealthRecordsIngestionServiceClient

- (HDHealthRecordsIngestionServiceClient)init
{
  void *v3;
  HDHealthRecordsIngestionServiceClient *v4;

  +[HKHealthRecordsDaemonConnection sharedConnection](HKHealthRecordsDaemonConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDHealthRecordsIngestionServiceClient initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (HDHealthRecordsIngestionServiceClient)initWithConnection:(id)a3
{
  id v4;
  HDHealthRecordsIngestionServiceClient *v5;
  HKHealthRecordsDaemonProxyProvider *v6;
  HKProxyProvider *proxyProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordsIngestionServiceClient;
  v5 = -[HDHealthRecordsIngestionServiceClient init](&v9, sel_init);
  if (v5)
  {
    v6 = -[HKHealthRecordsDaemonProxyProvider initWithConnection:serviceIdentifier:exportedObject:]([HKHealthRecordsDaemonProxyProvider alloc], "initWithConnection:serviceIdentifier:exportedObject:", v4, CFSTR("HealthRecordsIngestionService"), v5);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = &v6->super;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

- (void)parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5
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
  unint64_t v18;

  v8 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __84__HDHealthRecordsIngestionServiceClient_parseSignedClinicalData_options_completion___block_invoke;
  v15[3] = &unk_24D549650;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __84__HDHealthRecordsIngestionServiceClient_parseSignedClinicalData_options_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HDHealthRecordsIngestionServiceClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __84__HDHealthRecordsIngestionServiceClient_parseSignedClinicalData_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_parseSignedClinicalData:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __84__HDHealthRecordsIngestionServiceClient_parseSignedClinicalData_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)handleSignedClinicalDataFeature:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke;
  v19[3] = &unk_24D5496A0;
  v11 = v8;
  v20 = v11;
  v12 = v9;
  v21 = v12;
  v22 = &v30;
  v23 = &v24;
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke_3;
  v18[3] = &unk_24D5491F0;
  v18[4] = &v24;
  -[HDHealthRecordsIngestionServiceClient _synchronousPerformWithProxyHandler:errorHandler:](self, "_synchronousPerformWithProxyHandler:errorHandler:", v19, v18);
  v13 = (void *)v31[5];
  if (!v13)
  {
    v14 = (id)v25[5];
    v15 = v14;
    if (v14)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v13 = (void *)v31[5];
  }
  v16 = v13;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v16;
}

uint64_t __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke_2;
  v5[3] = &unk_24D549678;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_handleSignedClinicalDataFeature:context:completion:", v2, v3, v5);
}

void __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __87__HDHealthRecordsIngestionServiceClient_handleSignedClinicalDataFeature_context_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
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
  unint64_t v18;

  v8 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __101__HDHealthRecordsIngestionServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke;
  v15[3] = &unk_24D549650;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __101__HDHealthRecordsIngestionServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HDHealthRecordsIngestionServiceClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __101__HDHealthRecordsIngestionServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_processOriginalSignedClinicalDataRecords:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __101__HDHealthRecordsIngestionServiceClient_processOriginalSignedClinicalDataRecords_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reverifySignatureForRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5
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
  unint64_t v18;

  v8 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__HDHealthRecordsIngestionServiceClient_reverifySignatureForRecord_options_completion___block_invoke;
  v15[3] = &unk_24D549650;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __87__HDHealthRecordsIngestionServiceClient_reverifySignatureForRecord_options_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HDHealthRecordsIngestionServiceClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __87__HDHealthRecordsIngestionServiceClient_reverifySignatureForRecord_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_reverifySignatureForRecord:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __87__HDHealthRecordsIngestionServiceClient_reverifySignatureForRecord_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addCardToWalletForRecord:(id)a3 completion:(id)a4
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
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__HDHealthRecordsIngestionServiceClient_addCardToWalletForRecord_completion___block_invoke;
  v13[3] = &unk_24D5496C8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __77__HDHealthRecordsIngestionServiceClient_addCardToWalletForRecord_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HDHealthRecordsIngestionServiceClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __77__HDHealthRecordsIngestionServiceClient_addCardToWalletForRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_addCardToWalletForRecord:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __77__HDHealthRecordsIngestionServiceClient_addCardToWalletForRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didUpdateSignedClinicalDataRecord:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v7[5] = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke;
  v8[3] = &unk_24D5496F0;
  v9 = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke_2;
  v7[3] = &unk_24D549718;
  v7[4] = self;
  v6 = v5;
  -[HDHealthRecordsIngestionServiceClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v8, v7);

}

uint64_t __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_didUpdateSignedClinicalDataRecord:", *(_QWORD *)(a1 + 32));
}

void __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke_2_cold_1(a1, v4);

}

- (void)willDeleteSignedClinicalDataRecordWithSyncIdentifier:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v7[5] = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __94__HDHealthRecordsIngestionServiceClient_willDeleteSignedClinicalDataRecordWithSyncIdentifier___block_invoke;
  v8[3] = &unk_24D5496F0;
  v9 = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __94__HDHealthRecordsIngestionServiceClient_willDeleteSignedClinicalDataRecordWithSyncIdentifier___block_invoke_2;
  v7[3] = &unk_24D549718;
  v7[4] = self;
  v6 = v5;
  -[HDHealthRecordsIngestionServiceClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v8, v7);

}

uint64_t __94__HDHealthRecordsIngestionServiceClient_willDeleteSignedClinicalDataRecordWithSyncIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_willDeleteSignedClinicalDataRecordWithSyncIdentifier:", *(_QWORD *)(a1 + 32));
}

void __94__HDHealthRecordsIngestionServiceClient_willDeleteSignedClinicalDataRecordWithSyncIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke_2_cold_1(a1, v4);

}

- (void)triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  -[HKProxyProvider clientQueueDoubleObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueDoubleObjectHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __93__HDHealthRecordsIngestionServiceClient_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke;
  v11[3] = &unk_24D549740;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __93__HDHealthRecordsIngestionServiceClient_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke_2;
  v9[3] = &unk_24D549308;
  v10 = v12;
  v8 = v12;
  -[HDHealthRecordsIngestionServiceClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __93__HDHealthRecordsIngestionServiceClient_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerDownloadIssuerRegistryWithOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __93__HDHealthRecordsIngestionServiceClient_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  -[HKProxyProvider clientQueueDoubleObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueDoubleObjectHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __89__HDHealthRecordsIngestionServiceClient_triggerDownloadPublicKeysWithOptions_completion___block_invoke;
  v11[3] = &unk_24D549740;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __89__HDHealthRecordsIngestionServiceClient_triggerDownloadPublicKeysWithOptions_completion___block_invoke_2;
  v9[3] = &unk_24D549308;
  v10 = v12;
  v8 = v12;
  -[HDHealthRecordsIngestionServiceClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __89__HDHealthRecordsIngestionServiceClient_triggerDownloadPublicKeysWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerDownloadPublicKeysWithOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __89__HDHealthRecordsIngestionServiceClient_triggerDownloadPublicKeysWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void)_synchronousPerformWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](self->_proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", a3, a4);
}

- (id)exportedInterface
{
  return objc_alloc_init(MEMORY[0x24BDD1990]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __75__HDHealthRecordsIngestionServiceClient_didUpdateSignedClinicalDataRecord___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_3(a1, a2);
  v4 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_2163C4000, v7, v8, "%{public}@ %{public}@ failed to connect to proxy: %{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2();
}

@end
