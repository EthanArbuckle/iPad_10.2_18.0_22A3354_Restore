@implementation HKMedicationControl

- (HKMedicationControl)init
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

- (HKMedicationControl)initWithHealthStore:(id)a3
{
  id v5;
  HKMedicationControl *v6;
  HKMedicationControl *v7;
  id v8;
  HKHealthStore *healthStore;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKMedicationControl;
  v6 = -[HKMedicationControl init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x1E0CB6CC0]);
    healthStore = v7->_healthStore;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", healthStore, CFSTR("HKMedicationControlServerIdentifier"), v7, v10);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v7;
}

- (void)updateLocalDeviceValuesNowWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__HKMedicationControl_updateLocalDeviceValuesNowWithCompletion___block_invoke;
  v10[3] = &unk_1E6CD5C48;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __64__HKMedicationControl_updateLocalDeviceValuesNowWithCompletion___block_invoke_2;
  v8[3] = &unk_1E6CD52D8;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __64__HKMedicationControl_updateLocalDeviceValuesNowWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateLocalDeviceValuesNowWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__HKMedicationControl_updateLocalDeviceValuesNowWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)accountDevicesInfoTriggeringUpdate:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__HKMedicationControl_accountDevicesInfoTriggeringUpdate_completion___block_invoke;
  v12[3] = &unk_1E6CD5C70;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __69__HKMedicationControl_accountDevicesInfoTriggeringUpdate_completion___block_invoke_2;
  v10[3] = &unk_1E6CD52D8;
  v11 = v13;
  v9 = v13;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __69__HKMedicationControl_accountDevicesInfoTriggeringUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_accountDevicesInfoTriggeringUpdate:completion:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __69__HKMedicationControl_accountDevicesInfoTriggeringUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)markDrugInteractionAsDismissed:(id)a3 completion:(id)a4
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationControl.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionResult != nil"));

  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__HKMedicationControl_markDrugInteractionAsDismissed_completion___block_invoke;
  v17[3] = &unk_1E6CD5C98;
  v18 = v7;
  v19 = v9;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __65__HKMedicationControl_markDrugInteractionAsDismissed_completion___block_invoke_2;
  v15[3] = &unk_1E6CD52D8;
  v16 = v19;
  v12 = v19;
  v13 = v7;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __65__HKMedicationControl_markDrugInteractionAsDismissed_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_markDrugInteractionAsDismissed:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __65__HKMedicationControl_markDrugInteractionAsDismissed_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allDismissedDrugInteractionsWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HKMedicationControl_allDismissedDrugInteractionsWithCompletion___block_invoke;
  v10[3] = &unk_1E6CD5C48;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __66__HKMedicationControl_allDismissedDrugInteractionsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E6CD52D8;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __66__HKMedicationControl_allDismissedDrugInteractionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_allDismissedDrugInteractionsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__HKMedicationControl_allDismissedDrugInteractionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteDismissedDrugInteractionsForMedication:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "firstConceptIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationControl.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication.firstConceptIdentifier != nil"));

  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__HKMedicationControl_deleteDismissedDrugInteractionsForMedication_completion___block_invoke;
  v18[3] = &unk_1E6CD5C98;
  v19 = v7;
  v20 = v10;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __79__HKMedicationControl_deleteDismissedDrugInteractionsForMedication_completion___block_invoke_2;
  v16[3] = &unk_1E6CD52D8;
  v17 = v20;
  v13 = v20;
  v14 = v7;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __79__HKMedicationControl_deleteDismissedDrugInteractionsForMedication_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteDismissedDrugInteractionsForMedication:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __79__HKMedicationControl_deleteDismissedDrugInteractionsForMedication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)markPregnancyLactationInteractionForMedicationAsDismissed:(id)a3 interactionType:(int64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  int64_t v23;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "firstConceptIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationControl.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication.firstConceptIdentifier != nil"));

  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __108__HKMedicationControl_markPregnancyLactationInteractionForMedicationAsDismissed_interactionType_completion___block_invoke;
  v20[3] = &unk_1E6CD5CC0;
  v21 = v9;
  v23 = a4;
  v22 = v12;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __108__HKMedicationControl_markPregnancyLactationInteractionForMedicationAsDismissed_interactionType_completion___block_invoke_2;
  v18[3] = &unk_1E6CD52D8;
  v19 = v22;
  v15 = v22;
  v16 = v9;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v20, v18);

}

uint64_t __108__HKMedicationControl_markPregnancyLactationInteractionForMedicationAsDismissed_interactionType_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_markPregnancyLactationInteractionForMedicationAsDismissed:interactionType:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __108__HKMedicationControl_markPregnancyLactationInteractionForMedicationAsDismissed_interactionType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allDismissedPregnancyLactationInteractionsWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__HKMedicationControl_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke;
  v10[3] = &unk_1E6CD5C48;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __80__HKMedicationControl_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E6CD52D8;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __80__HKMedicationControl_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_allDismissedPregnancyLactationInteractionsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __80__HKMedicationControl_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteDismissedPregnancyLactationInteractionsForMedication:(id)a3 interactionTypes:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "firstConceptIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationControl.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication.firstConceptIdentifier != nil"));

  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __110__HKMedicationControl_deleteDismissedPregnancyLactationInteractionsForMedication_interactionTypes_completion___block_invoke;
  v22[3] = &unk_1E6CD5CE8;
  v23 = v9;
  v24 = v10;
  v25 = v13;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __110__HKMedicationControl_deleteDismissedPregnancyLactationInteractionsForMedication_interactionTypes_completion___block_invoke_2;
  v20[3] = &unk_1E6CD52D8;
  v21 = v25;
  v16 = v25;
  v17 = v10;
  v18 = v9;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v22, v20);

}

uint64_t __110__HKMedicationControl_deleteDismissedPregnancyLactationInteractionsForMedication_interactionTypes_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteDismissedPregnancyLactationInteractionsForMedication:interactionTypes:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __110__HKMedicationControl_deleteDismissedPregnancyLactationInteractionsForMedication_interactionTypes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF189690);
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF193298);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_accountDevicesInfoTriggeringUpdate_completion_, 0, 1);

  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_allDismissedDrugInteractionsWithCompletion_, 0, 1);
  v5 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_allDismissedPregnancyLactationInteractionsWithCompletion_, 0, 1);
  return v2;
}

- (id)exportedInterface
{
  return +[HKMedicationControl clientInterface](HKMedicationControl, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKMedicationControl serverInterface](HKMedicationControl, "serverInterface");
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
  v11[2] = __51__HKMedicationControl_unitTest_noOpWithCompletion___block_invoke;
  v11[3] = &unk_1E6CD5C48;
  v12 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HKMedicationControl_unitTest_noOpWithCompletion___block_invoke_2;
  v9[3] = &unk_1E6CD52D8;
  v7 = v5;
  v8 = v4;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __51__HKMedicationControl_unitTest_noOpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unitTesting_createTaskServerNoOpWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __51__HKMedicationControl_unitTest_noOpWithCompletion___block_invoke_2(uint64_t a1)
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
