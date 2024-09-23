@implementation HKMedicalIDStore

- (HKMedicalIDStore)initWithHealthStore:(id)a3
{
  id v4;
  HKMedicalIDStore *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  HKTaskServerProxyProvider *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HKTaskServerProxyProvider *setupStatusProxyProvider;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKMedicalIDStore;
  v5 = -[HKMedicalIDStore init](&v21, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "clientInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "serverInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:", v4, v7, v5, v8, v9, v10);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v13 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "setupStatusTaskIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "setupStatusClientInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "setupStatusServerInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:](v13, "initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:", v4, v14, v5, v15, v16, v17);
    setupStatusProxyProvider = v5->_setupStatusProxyProvider;
    v5->_setupStatusProxyProvider = (HKTaskServerProxyProvider *)v18;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_setupStatusProxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

- (void)setLastFetchedMedicalIDData:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  _HKMedicalIDData *v6;
  _HKMedicalIDData *lastFetchedMedicalIDData;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (_HKMedicalIDData *)objc_msgSend(v5, "copy");

  lastFetchedMedicalIDData = self->_lastFetchedMedicalIDData;
  self->_lastFetchedMedicalIDData = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)lastFetchedMedicalIDData
{
  os_unfair_lock_s *p_lock;
  _HKMedicalIDData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lastFetchedMedicalIDData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)setupStatusTaskIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, CFSTR("setupStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)medicalIDSetUpStatus
{
  HKTaskServerProxyProvider *setupStatusProxyProvider;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  setupStatusProxyProvider = self->_setupStatusProxyProvider;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke;
  v5[3] = &unk_1E37EFD20;
  v5[4] = &v6;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](setupStatusProxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v5, &__block_literal_global_61);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke_2;
  v3[3] = &unk_1E37EA1B0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_medicalIDSetUpStatusWithCompletion:", v3);
}

uint64_t __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke_3_cold_1((uint64_t)v2, v3);

}

- (void)fetchMedicalIDDataWithCompletion:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  void *v7;
  HKTaskServerProxyProvider *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke;
  v14[3] = &unk_1E37EFD68;
  v14[4] = self;
  v15 = v4;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](proxyProvider, "clientQueueObjectHandlerWithCompletion:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_proxyProvider;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_2;
  v12[3] = &unk_1E37EFD90;
  v13 = v7;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_4;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v8, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

void __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setLastFetchedMedicalIDData:", v7);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_3;
  v3[3] = &unk_1E37E9568;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_fetchMedicalIDWithCompletion:", v3);

}

uint64_t __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__HKMedicalIDStore_fetchMedicalIDDataWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  void *v7;
  HKTaskServerProxyProvider *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke;
  v14[3] = &unk_1E37EFD68;
  v14[4] = self;
  v15 = v4;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](proxyProvider, "clientQueueObjectHandlerWithCompletion:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_proxyProvider;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_2;
  v12[3] = &unk_1E37EFD90;
  v13 = v7;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_4;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v8, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

void __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setLastFetchedMedicalIDData:", v7);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_3;
  v3[3] = &unk_1E37E9568;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:", v3);

}

uint64_t __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__HKMedicalIDStore_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchMedicalIDEmergencyContactsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke;
  v11[3] = &unk_1E37EFD90;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke_3;
  v9[3] = &unk_1E37E6B38;
  v10 = v12;
  v8 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

void __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke_2;
  v3[3] = &unk_1E37EFDB8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_medicalIDEmergencyContactsWithCompletion:", v3);

}

uint64_t __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__HKMedicalIDStore_fetchMedicalIDEmergencyContactsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchMedicalIDClinicalContactsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke;
  v11[3] = &unk_1E37EFD90;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke_3;
  v9[3] = &unk_1E37E6B38;
  v10 = v12;
  v8 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

void __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke_2;
  v3[3] = &unk_1E37EFDB8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_medicalIDClinicalContactsWithCompletion:", v3);

}

uint64_t __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__HKMedicalIDStore_fetchMedicalIDClinicalContactsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateMedicalIDData:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  HKMedicalIDStore *v17;
  id v18;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDStore lastFetchedMedicalIDData](self, "lastFetchedMedicalIDData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setModificationDatesForUpdatedFieldsWithMedicalIDData:", v8);

  proxyProvider = self->_proxyProvider;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke;
  v15[3] = &unk_1E37EFDE0;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke_3;
  v13[3] = &unk_1E37E6B38;
  v14 = v18;
  v11 = v18;
  v12 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v13);

}

void __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "lastFetchedMedicalIDData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke_2;
  v7[3] = &unk_1E37E6AE8;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "remote_updateMedicalIDData:lastFetchedMedicalIDData:completion:", v3, v6, v7);

}

uint64_t __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__HKMedicalIDStore_updateMedicalIDData_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteMedicalIDDataWithCompletion:(id)a3
{
  void *v4;
  _HKMedicalIDData *v5;
  uint64_t v6;
  HKTaskServerProxyProvider *proxyProvider;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(_HKMedicalIDData);
  -[_HKMedicalIDData setIsDisabled:](v5, "setIsDisabled:", 1);
  -[_HKMedicalIDData setModificationDatesForUpdatedFieldsWithMedicalIDData:](v5, "setModificationDatesForUpdatedFieldsWithMedicalIDData:", 0);
  v6 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke;
  v11[3] = &unk_1E37EFE08;
  v11[4] = self;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke_3;
  v9[3] = &unk_1E37E6B38;
  v10 = v12;
  v8 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

void __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "lastFetchedMedicalIDData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke_2;
  v6[3] = &unk_1E37E6AE8;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "remote_deleteMedicalIDDataWithLastFetchedMedicalIDData:completion:", v5, v6);

}

uint64_t __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__HKMedicalIDStore_deleteMedicalIDDataWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addEmergencyContact:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
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
  v14[2] = __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke;
  v14[3] = &unk_1E37EFE08;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke_3;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

void __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke_2;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addEmergencyContact:completion:", v3, v4);

}

uint64_t __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__HKMedicalIDStore_addEmergencyContact_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeEmergencyContact:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
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
  v14[2] = __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke;
  v14[3] = &unk_1E37EFE08;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke_3;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

void __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke_2;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_removeEmergencyContact:completion:", v3, v4);

}

uint64_t __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__HKMedicalIDStore_removeEmergencyContact_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)serverInterface
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F288);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_medicalIDEmergencyContactsWithCompletion_, 0, 1);
  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_medicalIDClinicalContactsWithCompletion_, 0, 1);
  return v2;
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F2E8);
}

+ (id)setupStatusServerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F348);
}

+ (id)setupStatusClientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F3A8);
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchedMedicalIDData, 0);
  objc_storeStrong((id *)&self->_setupStatusProxyProvider, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __40__HKMedicalIDStore_medicalIDSetUpStatus__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Failed to get synchronous proxy with error, %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
