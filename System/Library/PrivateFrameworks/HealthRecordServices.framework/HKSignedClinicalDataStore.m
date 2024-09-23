@implementation HKSignedClinicalDataStore

- (HKSignedClinicalDataStore)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKSignedClinicalDataStore)initWithHealthStore:(id)a3
{
  id v4;
  HKSignedClinicalDataStore *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSignedClinicalDataStore;
  v5 = -[HKSignedClinicalDataStore init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)logPrefix
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
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
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__HKSignedClinicalDataStore_parseSignedClinicalData_options_completion___block_invoke;
  v15[3] = &unk_24D5499B8;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __72__HKSignedClinicalDataStore_parseSignedClinicalData_options_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __72__HKSignedClinicalDataStore_parseSignedClinicalData_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_parseSignedClinicalData:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __72__HKSignedClinicalDataStore_parseSignedClinicalData_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeSignedClinicalData:(id)a3 completion:(id)a4
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
  v13[2] = __64__HKSignedClinicalDataStore_storeSignedClinicalData_completion___block_invoke;
  v13[3] = &unk_24D5499E0;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __64__HKSignedClinicalDataStore_storeSignedClinicalData_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __64__HKSignedClinicalDataStore_storeSignedClinicalData_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_storeSignedClinicalData:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __64__HKSignedClinicalDataStore_storeSignedClinicalData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSignedClinicalDataGroupBackingMedicalRecord:(id)a3 options:(unint64_t)a4 completion:(id)a5
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
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __97__HKSignedClinicalDataStore_fetchSignedClinicalDataGroupBackingMedicalRecord_options_completion___block_invoke;
  v15[3] = &unk_24D5499B8;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __97__HKSignedClinicalDataStore_fetchSignedClinicalDataGroupBackingMedicalRecord_options_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __97__HKSignedClinicalDataStore_fetchSignedClinicalDataGroupBackingMedicalRecord_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSignedClinicalDataGroupBackingMedicalRecord:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __97__HKSignedClinicalDataStore_fetchSignedClinicalDataGroupBackingMedicalRecord_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteSignedClinicalDataRecord:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__HKSignedClinicalDataStore_deleteSignedClinicalDataRecord_completion___block_invoke;
  v13[3] = &unk_24D5499E0;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __71__HKSignedClinicalDataStore_deleteSignedClinicalDataRecord_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __71__HKSignedClinicalDataStore_deleteSignedClinicalDataRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteSignedClinicalDataRecord:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __71__HKSignedClinicalDataStore_deleteSignedClinicalDataRecord_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reverifySignatureForRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKSignedClinicalDataStore *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  HKSignedClinicalDataStore *v23;

  v6 = a3;
  v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__1;
  v22[4] = __Block_byref_object_dispose__1;
  v8 = self;
  v23 = v8;
  v9 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke;
  v19[3] = &unk_24D549A30;
  v19[4] = v8;
  v20 = v7;
  v21 = v22;
  v10 = (void *)MEMORY[0x2199F7D50](v19);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_3;
  v16[3] = &unk_24D5499E0;
  v17 = v6;
  v18 = v10;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_4;
  v13[3] = &unk_24D549A58;
  v11 = v18;
  v15 = v11;
  v12 = v17;
  v14 = v12;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](v8, "_fetchServerProxyWithHandler:errorHandler:", v16, v13);

  _Block_object_dispose(v22, 8);
}

void __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v7 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_2;
  block[3] = &unk_24D549A08;
  v9 = *(id *)(a1 + 40);
  v16 = a2;
  v12 = v7;
  v13 = v9;
  v14 = *(_QWORD *)(a1 + 48);
  v15 = a3;
  v10 = v7;
  dispatch_async(v8, block);

}

void __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

uint64_t __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_reverifySignatureForRecord:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __67__HKSignedClinicalDataStore_reverifySignatureForRecord_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v2 + 16))(v2, 0, objc_msgSend(v3, "signatureStatus"), v4);

}

- (void)reextractSignedClinicalDataRecordsForAccountWithIdentifier:(id)a3 completion:(id)a4
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
  v13[2] = __99__HKSignedClinicalDataStore_reextractSignedClinicalDataRecordsForAccountWithIdentifier_completion___block_invoke;
  v13[3] = &unk_24D5499E0;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __99__HKSignedClinicalDataStore_reextractSignedClinicalDataRecordsForAccountWithIdentifier_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __99__HKSignedClinicalDataStore_reextractSignedClinicalDataRecordsForAccountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_reextractSignedClinicalDataRecordsForAccountWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __99__HKSignedClinicalDataStore_reextractSignedClinicalDataRecordsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCurrentRegistryIssuerContentVersionWithCompletion:(id)a3
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
  v9[2] = __84__HKSignedClinicalDataStore_fetchCurrentRegistryIssuerContentVersionWithCompletion___block_invoke;
  v9[3] = &unk_24D549A80;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __84__HKSignedClinicalDataStore_fetchCurrentRegistryIssuerContentVersionWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __84__HKSignedClinicalDataStore_fetchCurrentRegistryIssuerContentVersionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCurrentRegistryIssuerContentVersionWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __84__HKSignedClinicalDataStore_fetchCurrentRegistryIssuerContentVersionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setRegistryIssuerContentVersion:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__HKSignedClinicalDataStore_setRegistryIssuerContentVersion_completion___block_invoke;
  v13[3] = &unk_24D5499E0;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __72__HKSignedClinicalDataStore_setRegistryIssuerContentVersion_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __72__HKSignedClinicalDataStore_setRegistryIssuerContentVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setRegistryIssuerContentVersion:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __72__HKSignedClinicalDataStore_setRegistryIssuerContentVersion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)insertOrReplaceIssuerRegistryEntries:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__HKSignedClinicalDataStore_insertOrReplaceIssuerRegistryEntries_completion___block_invoke;
  v13[3] = &unk_24D5499E0;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __77__HKSignedClinicalDataStore_insertOrReplaceIssuerRegistryEntries_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __77__HKSignedClinicalDataStore_insertOrReplaceIssuerRegistryEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertOrReplaceIssuerRegistryEntries:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __77__HKSignedClinicalDataStore_insertOrReplaceIssuerRegistryEntries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCurrentRegistryPublicKeyContentVersionWithCompletion:(id)a3
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
  v9[2] = __87__HKSignedClinicalDataStore_fetchCurrentRegistryPublicKeyContentVersionWithCompletion___block_invoke;
  v9[3] = &unk_24D549A80;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __87__HKSignedClinicalDataStore_fetchCurrentRegistryPublicKeyContentVersionWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __87__HKSignedClinicalDataStore_fetchCurrentRegistryPublicKeyContentVersionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCurrentRegistryPublicKeyContentVersionWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __87__HKSignedClinicalDataStore_fetchCurrentRegistryPublicKeyContentVersionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setRegistryPublicKeyContentVersion:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__HKSignedClinicalDataStore_setRegistryPublicKeyContentVersion_completion___block_invoke;
  v13[3] = &unk_24D5499E0;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __75__HKSignedClinicalDataStore_setRegistryPublicKeyContentVersion_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __75__HKSignedClinicalDataStore_setRegistryPublicKeyContentVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setRegistryPublicKeyContentVersion:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __75__HKSignedClinicalDataStore_setRegistryPublicKeyContentVersion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)insertOrReplacePublicKeyEntries:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__HKSignedClinicalDataStore_insertOrReplacePublicKeyEntries_completion___block_invoke;
  v13[3] = &unk_24D5499E0;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __72__HKSignedClinicalDataStore_insertOrReplacePublicKeyEntries_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __72__HKSignedClinicalDataStore_insertOrReplacePublicKeyEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertOrReplacePublicKeyEntries:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __72__HKSignedClinicalDataStore_insertOrReplacePublicKeyEntries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPublicKeyWithKeyID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__HKSignedClinicalDataStore_fetchPublicKeyWithKeyID_completion___block_invoke;
  v14[3] = &unk_24D5499E0;
  v15 = v6;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __64__HKSignedClinicalDataStore_fetchPublicKeyWithKeyID_completion___block_invoke_2;
  v11[3] = &unk_24D549AA8;
  v12 = v15;
  v13 = v16;
  v9 = v16;
  v10 = v15;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v14, v11);

}

uint64_t __64__HKSignedClinicalDataStore_fetchPublicKeyWithKeyID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchPublicKeyWithKeyID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __64__HKSignedClinicalDataStore_fetchPublicKeyWithKeyID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HKSignedClinicalDataRegistryPublicKeyFetchResult *v4;

  v3 = a2;
  v4 = -[HKSignedClinicalDataRegistryPublicKeyFetchResult initWithKeyID:outcome:jwkData:]([HKSignedClinicalDataRegistryPublicKeyFetchResult alloc], "initWithKeyID:outcome:jwkData:", *(_QWORD *)(a1 + 32), 4, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchPublicKeyEntriesWithCompletion:(id)a3
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
  v9[2] = __65__HKSignedClinicalDataStore_fetchPublicKeyEntriesWithCompletion___block_invoke;
  v9[3] = &unk_24D549A80;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __65__HKSignedClinicalDataStore_fetchPublicKeyEntriesWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __65__HKSignedClinicalDataStore_fetchPublicKeyEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchPublicKeyEntriesWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __65__HKSignedClinicalDataStore_fetchPublicKeyEntriesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removePublicKeyEntriesWithKeyIDs:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__HKSignedClinicalDataStore_removePublicKeyEntriesWithKeyIDs_completion___block_invoke;
  v13[3] = &unk_24D5499E0;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __73__HKSignedClinicalDataStore_removePublicKeyEntriesWithKeyIDs_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __73__HKSignedClinicalDataStore_removePublicKeyEntriesWithKeyIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removePublicKeyEntriesWithKeyIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73__HKSignedClinicalDataStore_removePublicKeyEntriesWithKeyIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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

  -[HKTaskServerProxyProvider clientQueueDoubleObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueDoubleObjectHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__HKSignedClinicalDataStore_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke;
  v11[3] = &unk_24D549AD0;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __81__HKSignedClinicalDataStore_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke_2;
  v9[3] = &unk_24D549308;
  v10 = v12;
  v8 = v12;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __81__HKSignedClinicalDataStore_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerDownloadIssuerRegistryWithOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __81__HKSignedClinicalDataStore_triggerDownloadIssuerRegistryWithOptions_completion___block_invoke_2(uint64_t a1)
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

  -[HKTaskServerProxyProvider clientQueueDoubleObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueDoubleObjectHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__HKSignedClinicalDataStore_triggerDownloadPublicKeysWithOptions_completion___block_invoke;
  v11[3] = &unk_24D549AD0;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __77__HKSignedClinicalDataStore_triggerDownloadPublicKeysWithOptions_completion___block_invoke_2;
  v9[3] = &unk_24D549308;
  v10 = v12;
  v8 = v12;
  -[HKSignedClinicalDataStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __77__HKSignedClinicalDataStore_triggerDownloadPublicKeysWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerDownloadPublicKeysWithOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __77__HKSignedClinicalDataStore_triggerDownloadPublicKeysWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void)connectionInvalidated
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[HKSignedClinicalDataStore logPrefix](self, "logPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2163C4000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ connection invalidated", (uint8_t *)&v6, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
