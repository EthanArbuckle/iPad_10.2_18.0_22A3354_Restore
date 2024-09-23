@implementation HKMedicalRecordsStore

- (HKMedicalRecordsStore)initWithHealthStore:(id)a3
{
  id v4;
  HKMedicalRecordsStore *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  HKTaskConfiguration *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMedicalRecordsStore;
  v5 = -[HKMedicalRecordsStore init](&v13, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v11 = objc_alloc_init(HKTaskConfiguration);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v5->_proxyProvider, "setTaskConfiguration:", v11);

  }
  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)fetchMedicalRecordsForClinicalRecords:(id)a3 completion:(id)a4
{
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  proxyProvider = self->_proxyProvider;
  v7 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_map:", &__block_literal_global_34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v11 = self->_proxyProvider;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__HKMedicalRecordsStore_fetchMedicalRecordsForClinicalRecords_completion___block_invoke_2;
  v16[3] = &unk_1E37EC608;
  v17 = v9;
  v18 = v8;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __74__HKMedicalRecordsStore_fetchMedicalRecordsForClinicalRecords_completion___block_invoke_3;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v12 = v18;
  v13 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v11, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __74__HKMedicalRecordsStore_fetchMedicalRecordsForClinicalRecords_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

uint64_t __74__HKMedicalRecordsStore_fetchMedicalRecordsForClinicalRecords_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchMedicalRecordsForClinicalRecordsUUIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __74__HKMedicalRecordsStore_fetchMedicalRecordsForClinicalRecords_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
