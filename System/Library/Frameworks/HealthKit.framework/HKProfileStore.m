@implementation HKProfileStore

- (HKProfileStore)initWithHealthStore:(id)a3
{
  id v4;
  HKProfileStore *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKProxyProvider *proxyProvider;
  HKObserverSet *v11;
  uint64_t v12;
  HKProfileStoreObserver *observers;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKProfileStore;
  v5 = -[HKProfileStore init](&v15, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    v11 = [HKObserverSet alloc];
    v12 = -[HKObserverSet initWithName:loggingCategory:](v11, "initWithName:loggingCategory:", CFSTR("HKProfileStoreObservers"), HKLogDefault);
    observers = v5->_observers;
    v5->_observers = (HKProfileStoreObserver *)v12;

    v5->_startedObserving = 0;
  }

  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)createProfileOfType:(int64_t)a3 displayName:(id)a4 completion:(id)a5
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

  v8 = a4;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__HKProfileStore_createProfileOfType_displayName_completion___block_invoke;
  v15[3] = &unk_1E37F5830;
  v18 = a3;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __61__HKProfileStore_createProfileOfType_displayName_completion___block_invoke_2;
  v13[3] = &unk_1E37E6B38;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __61__HKProfileStore_createProfileOfType_displayName_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_createProfileOfType:displayName:completion:", a1[6], a1[4], a1[5]);
}

uint64_t __61__HKProfileStore_createProfileOfType_displayName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteProfile:(id)a3 completion:(id)a4
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
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__HKProfileStore_deleteProfile_completion___block_invoke;
  v13[3] = &unk_1E37F5858;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __43__HKProfileStore_deleteProfile_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __43__HKProfileStore_deleteProfile_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteProfile:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __43__HKProfileStore_deleteProfile_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllProfilesWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__HKProfileStore_fetchAllProfilesWithCompletion___block_invoke;
  v9[3] = &unk_1E37F5880;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __49__HKProfileStore_fetchAllProfilesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __49__HKProfileStore_fetchAllProfilesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getAllProfilesWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __49__HKProfileStore_fetchAllProfilesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchProfileIdentifierForNRDeviceUUID:(id)a3 completion:(id)a4
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
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_completion___block_invoke;
  v13[3] = &unk_1E37F5858;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __67__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __67__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_profileIdentifierForNRDeviceUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __67__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchProfileIdentifierForNRDeviceUUID:(id)a3 ownerAppleID:(id)a4 completion:(id)a5
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
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke;
  v17[3] = &unk_1E37F58A8;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __80__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke_2;
  v15[3] = &unk_1E37E6B38;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __80__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_profileIdentifierForNRDeviceUUID:ownerAppleID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __80__HKProfileStore_fetchProfileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)synchronouslyFetchFirstName
{
  id v2;
  _QWORD v4[5];
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__53;
  v10 = __Block_byref_object_dispose__53;
  v11 = 0;
  v4[4] = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke;
  v5[3] = &unk_1E37F58F8;
  v5[4] = &v6;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_3;
  v4[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  -[HKProfileStore _getSynchronousProxyWithHandler:errorHandler:](self, "_getSynchronousProxyWithHandler:errorHandler:", v5, v4);
  v2 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v2;
}

uint64_t __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_2;
  v3[3] = &unk_1E37F58D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchDisplayNameWithCompletion:", v3);
}

void __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_3_cold_1(a1);

}

- (void)fetchDisplayName:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueDoubleObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueDoubleObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__HKProfileStore_fetchDisplayName___block_invoke;
  v9[3] = &unk_1E37F5880;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __35__HKProfileStore_fetchDisplayName___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __35__HKProfileStore_fetchDisplayName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchDisplayNameWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __35__HKProfileStore_fetchDisplayName___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDisplayFirstName:(id)a3 lastName:(id)a4 completion:(id)a5
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
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__HKProfileStore_setDisplayFirstName_lastName_completion___block_invoke;
  v17[3] = &unk_1E37F58A8;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __58__HKProfileStore_setDisplayFirstName_lastName_completion___block_invoke_2;
  v15[3] = &unk_1E37E6B38;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __58__HKProfileStore_setDisplayFirstName_lastName_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDisplayFirstName:lastName:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __58__HKProfileStore_setDisplayFirstName_lastName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchDisplayImageData:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__HKProfileStore_fetchDisplayImageData___block_invoke;
  v9[3] = &unk_1E37F5880;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __40__HKProfileStore_fetchDisplayImageData___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __40__HKProfileStore_fetchDisplayImageData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchDisplayImageData:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__HKProfileStore_fetchDisplayImageData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDisplayImageData:(id)a3 completion:(id)a4
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
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__HKProfileStore_setDisplayImageData_completion___block_invoke;
  v13[3] = &unk_1E37F5858;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __49__HKProfileStore_setDisplayImageData_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __49__HKProfileStore_setDisplayImageData_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDisplayImageData:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __49__HKProfileStore_setDisplayImageData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_getSynchronousProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](self->_proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", a3, a4);
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void)fetchSharingInformationForProfileIdentifier:(id)a3 completion:(id)a4
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
  -[HKProxyProvider clientQueueDoubleObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueDoubleObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__HKProfileStore_fetchSharingInformationForProfileIdentifier_completion___block_invoke;
  v13[3] = &unk_1E37F5858;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __73__HKProfileStore_fetchSharingInformationForProfileIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __73__HKProfileStore_fetchSharingInformationForProfileIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSharingInformationForProfileIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73__HKProfileStore_fetchSharingInformationForProfileIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startObservingWithCompletion:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SEL v9;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[5];
  id v13;

  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HKProfileStore_startObservingWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37E69F8;
  aBlock[4] = self;
  v13 = v5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__HKProfileStore_startObservingWithCompletion___block_invoke_3;
  v10[3] = &unk_1E37F5880;
  v11 = _Block_copy(aBlock);
  v7[0] = v10[0];
  v7[1] = 3221225472;
  v7[2] = __47__HKProfileStore_startObservingWithCompletion___block_invoke_5;
  v7[3] = &unk_1E37F5940;
  v8 = v11;
  v9 = a2;
  v6 = v11;
  -[HKProfileStore _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v10, v7);

}

void __47__HKProfileStore_startObservingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__HKProfileStore_startObservingWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6D40;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __47__HKProfileStore_startObservingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __47__HKProfileStore_startObservingWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__HKProfileStore_startObservingWithCompletion___block_invoke_4;
  v3[3] = &unk_1E37E6CD0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_startObservingWithCompletion:", v3);

}

uint64_t __47__HKProfileStore_startObservingWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__HKProfileStore_startObservingWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__HKProfileStore_startObservingWithCompletion___block_invoke_5_cold_1(a1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  HKProfileStoreObserver *observers;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  if (!self->_startedObserving)
  {
    self->_startedObserving = 1;
    objc_initWeak(&location, self);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __41__HKProfileStore_addObserver_completion___block_invoke;
    v14[3] = &unk_1E37E95B8;
    objc_copyWeak(&v15, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](self->_proxyProvider, "setAutomaticProxyReconnectionHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __41__HKProfileStore_addObserver_completion___block_invoke_3;
  v12[3] = &unk_1E37E6B38;
  v13 = v7;
  v9 = v7;
  -[HKProfileStore startObservingWithCompletion:](self, "startObservingWithCompletion:", v12);
  observers = self->_observers;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKProfileStoreObserver registerObserver:queue:](observers, "registerObserver:queue:", v6, v11);

}

void __41__HKProfileStore_addObserver_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__HKProfileStore_addObserver_completion___block_invoke_2;
  v9[3] = &unk_1E37F5968;
  objc_copyWeak(&v10, v7);
  objc_msgSend(WeakRetained, "startObservingWithCompletion:", v9);

  objc_destroyWeak(&v10);
}

void __41__HKProfileStore_addObserver_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (!a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "dispatchProfileListDidUpdate");

  }
}

uint64_t __41__HKProfileStore_addObserver_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeObserver:(id)a3
{
  -[HKProfileStoreObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)dispatchProfileListDidUpdate
{
  HKProfileStoreObserver *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__HKProfileStore_dispatchProfileListDidUpdate__block_invoke;
  v3[3] = &unk_1E37E6D68;
  v3[4] = self;
  -[HKProfileStoreObserver notifyObservers:](observers, "notifyObservers:", v3);
}

uint64_t __46__HKProfileStore_dispatchProfileListDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "profileListDidUpdateForProfileStore:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __45__HKProfileStore_synchronouslyFetchFirstName__block_invoke_3_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v2, v3, "%{public}@ failed: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_2();
}

void __47__HKProfileStore_startObservingWithCompletion___block_invoke_5_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v2, v3, "%{public}@ failed: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_2();
}

@end
