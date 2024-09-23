@implementation HKCloudSyncShareParticipantManager

- (int64_t)lastKnownParticipantSharingStatus
{
  HKTaskServerProxyProvider *proxyProvider;
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
  proxyProvider = self->_proxyProvider;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke;
  v5[3] = &unk_1E37EA1D8;
  v5[4] = &v6;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v5, &__block_literal_global_12);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke_2;
  v3[3] = &unk_1E37EA1B0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchSharingParticipantStatus:", v3);
}

uint64_t __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke_3_cold_1((uint64_t)v2, v3);

}

- (HKCloudSyncShareParticipantManager)initWithHealthStore:(id)a3
{
  id v5;
  HKCloudSyncShareParticipantManager *v6;
  HKCloudSyncShareParticipantManager *v7;
  HKTaskServerProxyProvider *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKCloudSyncShareParticipantManager;
  v6 = -[HKCloudSyncShareParticipantManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, v9, v7, v10);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    -[HKProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v7;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)exportedInterface
{
  return +[HKCloudSyncShareParticipantManager clientInterface](HKCloudSyncShareParticipantManager, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKCloudSyncShareParticipantManager serverInterface](HKCloudSyncShareParticipantManager, "serverInterface");
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E568);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_fetchAllShareParticipantEmailAddressesForSharingType_completion_, 0, 1);

  return v2;
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E5C8);
}

- (void)fetchAllShareParticipantEmailAddressesForSharingType:(unint64_t)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncShareParticipantManager.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__HKCloudSyncShareParticipantManager_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke;
  v15[3] = &unk_1E37EA220;
  v17 = a3;
  v16 = v8;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __102__HKCloudSyncShareParticipantManager_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke_2;
  v13[3] = &unk_1E37E6B38;
  v14 = v16;
  v11 = v16;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __102__HKCloudSyncShareParticipantManager_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllShareParticipantEmailAddressesForSharingType:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __102__HKCloudSyncShareParticipantManager_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)revokeAccessForAllShareParticipantsForSharingType:(unint64_t)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncShareParticipantManager.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__HKCloudSyncShareParticipantManager_revokeAccessForAllShareParticipantsForSharingType_completion___block_invoke;
  v15[3] = &unk_1E37EA220;
  v17 = a3;
  v16 = v8;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __99__HKCloudSyncShareParticipantManager_revokeAccessForAllShareParticipantsForSharingType_completion___block_invoke_2;
  v13[3] = &unk_1E37E6B38;
  v14 = v16;
  v11 = v16;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __99__HKCloudSyncShareParticipantManager_revokeAccessForAllShareParticipantsForSharingType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_revokeAccessForAllShareParticipantsForSharingType:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __99__HKCloudSyncShareParticipantManager_revokeAccessForAllShareParticipantsForSharingType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tearDownHealthSharingForProfile:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncShareParticipantManager.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__HKCloudSyncShareParticipantManager_tearDownHealthSharingForProfile_completion___block_invoke;
  v17[3] = &unk_1E37EA248;
  v18 = v7;
  v19 = v9;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __81__HKCloudSyncShareParticipantManager_tearDownHealthSharingForProfile_completion___block_invoke_2;
  v15[3] = &unk_1E37E6B38;
  v16 = v19;
  v12 = v19;
  v13 = v7;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __81__HKCloudSyncShareParticipantManager_tearDownHealthSharingForProfile_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_tearDownHealthSharingForProfile:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __81__HKCloudSyncShareParticipantManager_tearDownHealthSharingForProfile_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __71__HKCloudSyncShareParticipantManager_lastKnownParticipantSharingStatus__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve proxy with error, %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
