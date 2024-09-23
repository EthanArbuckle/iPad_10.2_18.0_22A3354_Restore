@implementation HKMedicationExposableDoseEventControl

- (HKMedicationExposableDoseEventControl)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKMedicationExposableDoseEventControl)initWithHealthStore:(id)a3
{
  id v5;
  HKMedicationExposableDoseEventControl *v6;
  HKMedicationExposableDoseEventControl *v7;
  id v8;
  HKHealthStore *healthStore;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKMedicationExposableDoseEventControl;
  v6 = -[HKMedicationExposableDoseEventControl init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x1E0CB6CC0]);
    healthStore = v7->_healthStore;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", healthStore, CFSTR("HKMedicationExposableDoseEventControlServerIdentifier"), v7, v10);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v7;
}

- (void)doseEventsForDateInterval:(id)a3 medicationIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationExposableDoseEventControl.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateInterval != nil"));

  }
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__HKMedicationExposableDoseEventControl_doseEventsForDateInterval_medicationIdentifier_completion___block_invoke;
  v21[3] = &unk_1E6CD5510;
  v22 = v9;
  v23 = v10;
  v24 = v12;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __99__HKMedicationExposableDoseEventControl_doseEventsForDateInterval_medicationIdentifier_completion___block_invoke_2;
  v19[3] = &unk_1E6CD52D8;
  v20 = v24;
  v15 = v24;
  v16 = v10;
  v17 = v9;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v21, v19);

}

uint64_t __99__HKMedicationExposableDoseEventControl_doseEventsForDateInterval_medicationIdentifier_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_doseEventsForDateInterval:medicationIdentifier:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __99__HKMedicationExposableDoseEventControl_doseEventsForDateInterval_medicationIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)writeDoseEvents:(id)a3 completion:(id)a4
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
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationExposableDoseEventControl.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("doseEvents != nil"));

  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__HKMedicationExposableDoseEventControl_writeDoseEvents_completion___block_invoke;
  v17[3] = &unk_1E6CD5538;
  v18 = v7;
  v19 = v9;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __68__HKMedicationExposableDoseEventControl_writeDoseEvents_completion___block_invoke_2;
  v15[3] = &unk_1E6CD52D8;
  v16 = v19;
  v12 = v19;
  v13 = v7;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __68__HKMedicationExposableDoseEventControl_writeDoseEvents_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_writeDoseEvents:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __68__HKMedicationExposableDoseEventControl_writeDoseEvents_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteDoseEventWithPersistentUUID:(id)a3 completion:(id)a4
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
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationExposableDoseEventControl.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistentUUID != nil"));

  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__HKMedicationExposableDoseEventControl_deleteDoseEventWithPersistentUUID_completion___block_invoke;
  v17[3] = &unk_1E6CD5538;
  v18 = v7;
  v19 = v9;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __86__HKMedicationExposableDoseEventControl_deleteDoseEventWithPersistentUUID_completion___block_invoke_2;
  v15[3] = &unk_1E6CD52D8;
  v16 = v19;
  v12 = v19;
  v13 = v7;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __86__HKMedicationExposableDoseEventControl_deleteDoseEventWithPersistentUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteDoseEventWithPersistentUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __86__HKMedicationExposableDoseEventControl_deleteDoseEventWithPersistentUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF185F48);
}

+ (id)serverInterface
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF193238);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_doseEventsForDateInterval_medicationIdentifier_completion_, 0, 1);
  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_writeDoseEvents_completion_, 0, 0);
  return v2;
}

- (id)exportedInterface
{
  return +[HKMedicationExposableDoseEventControl clientInterface](HKMedicationExposableDoseEventControl, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKMedicationExposableDoseEventControl serverInterface](HKMedicationExposableDoseEventControl, "serverInterface");
}

- (void)unitTest_noOpWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v10 = v5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HKMedicationExposableDoseEventControl_unitTest_noOpWithCompletion___block_invoke;
  v11[3] = &unk_1E6CD5560;
  v12 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__HKMedicationExposableDoseEventControl_unitTest_noOpWithCompletion___block_invoke_2;
  v9[3] = &unk_1E6CD52D8;
  v7 = v5;
  v8 = v4;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __69__HKMedicationExposableDoseEventControl_unitTest_noOpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unitTesting_createTaskServerNoOpWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __69__HKMedicationExposableDoseEventControl_unitTest_noOpWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
