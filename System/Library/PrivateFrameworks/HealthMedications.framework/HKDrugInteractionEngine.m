@implementation HKDrugInteractionEngine

- (HKDrugInteractionEngine)init
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

- (HKDrugInteractionEngine)initWithHealthStore:(id)a3
{
  id v5;
  HKDrugInteractionEngine *v6;
  HKDrugInteractionEngine *v7;
  id v8;
  HKHealthStore *healthStore;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKDrugInteractionEngine;
  v6 = -[HKDrugInteractionEngine init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x1E0CB6CC0]);
    healthStore = v7->_healthStore;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", healthStore, CFSTR("HDDrugInteractionEngineServerIdentifier"), v7, v10);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v7;
}

- (void)interactionClassesForConceptWithIdentifier:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__HKDrugInteractionEngine_interactionClassesForConceptWithIdentifier_completion___block_invoke;
  v14[3] = &unk_1E6CD5D98;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __81__HKDrugInteractionEngine_interactionClassesForConceptWithIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E6CD52D8;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __81__HKDrugInteractionEngine_interactionClassesForConceptWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionClassesForConceptWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __81__HKDrugInteractionEngine_interactionClassesForConceptWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)interactionClassesForMedication:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__HKDrugInteractionEngine_interactionClassesForMedication_completion___block_invoke;
  v14[3] = &unk_1E6CD5D98;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __70__HKDrugInteractionEngine_interactionClassesForMedication_completion___block_invoke_2;
  v12[3] = &unk_1E6CD52D8;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __70__HKDrugInteractionEngine_interactionClassesForMedication_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionClassesForMedication:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __70__HKDrugInteractionEngine_interactionClassesForMedication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)interactionClassForLifestyleFactor:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__HKDrugInteractionEngine_interactionClassForLifestyleFactor_completion___block_invoke;
  v12[3] = &unk_1E6CD5DC0;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __73__HKDrugInteractionEngine_interactionClassForLifestyleFactor_completion___block_invoke_2;
  v10[3] = &unk_1E6CD52D8;
  v11 = v13;
  v9 = v13;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __73__HKDrugInteractionEngine_interactionClassForLifestyleFactor_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionClassForLifestyleFactor:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __73__HKDrugInteractionEngine_interactionClassForLifestyleFactor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)numberOfInteractionsForConceptWithIdentifier:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__HKDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_completion___block_invoke;
  v14[3] = &unk_1E6CD5D98;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __83__HKDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E6CD52D8;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __83__HKDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_numberOfInteractionsForConceptWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __83__HKDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)numberOfInteractionsForMedication:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__HKDrugInteractionEngine_numberOfInteractionsForMedication_completion___block_invoke;
  v14[3] = &unk_1E6CD5D98;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __72__HKDrugInteractionEngine_numberOfInteractionsForMedication_completion___block_invoke_2;
  v12[3] = &unk_1E6CD52D8;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __72__HKDrugInteractionEngine_numberOfInteractionsForMedication_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_numberOfInteractionsForMedication:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __72__HKDrugInteractionEngine_numberOfInteractionsForMedication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)interactionResultsForInteractionClasses:(id)a3 completion:(id)a4
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
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__HKDrugInteractionEngine_interactionResultsForInteractionClasses_completion___block_invoke;
  v14[3] = &unk_1E6CD5D98;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __78__HKDrugInteractionEngine_interactionResultsForInteractionClasses_completion___block_invoke_2;
  v12[3] = &unk_1E6CD52D8;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __78__HKDrugInteractionEngine_interactionResultsForInteractionClasses_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionResultsForInteractionClasses:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __78__HKDrugInteractionEngine_interactionResultsForInteractionClasses_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)interactionResultForFirstMedication:(id)a3 secondMedication:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__HKDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_completion___block_invoke;
  v18[3] = &unk_1E6CD5DE8;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __91__HKDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_completion___block_invoke_2;
  v16[3] = &unk_1E6CD52D8;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __91__HKDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionResultForFirstMedication:secondMedication:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __91__HKDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)interactionResultForMedication:(id)a3 lifestyleFactor:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__HKDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_completion___block_invoke;
  v16[3] = &unk_1E6CD5E10;
  v17 = v8;
  v19 = a4;
  v18 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __85__HKDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_completion___block_invoke_2;
  v14[3] = &unk_1E6CD52D8;
  v15 = v18;
  v12 = v18;
  v13 = v8;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __85__HKDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionResultForMedication:lifestyleFactor:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __85__HKDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)interactionResultsForMedications:(id)a3 lifestyleFactors:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__HKDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_completion___block_invoke;
  v18[3] = &unk_1E6CD5DE8;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __88__HKDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_completion___block_invoke_2;
  v16[3] = &unk_1E6CD52D8;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __88__HKDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_interactionResultsForMedications:lifestyleFactors:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __88__HKDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF18A0F8);
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1932F8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_interactionClassesForConceptWithIdentifier_completion_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_interactionClassesForMedication_completion_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_interactionResultsForInteractionClasses_completion_, 0, 0);
  v4 = (id)objc_msgSend(v2, "hk_setSetOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_interactionResultsForInteractionClasses_completion_, 0, 1);
  v5 = (id)objc_msgSend(v2, "hk_setSetOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_interactionResultsForMedications_lifestyleFactors_completion_, 0, 1);
  v6 = (id)objc_msgSend(v2, "hk_setSetOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_interactionResultsForMedications_lifestyleFactors_completion_, 0, 0);

  return v2;
}

- (id)exportedInterface
{
  return +[HKDrugInteractionEngine clientInterface](HKDrugInteractionEngine, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKDrugInteractionEngine serverInterface](HKDrugInteractionEngine, "serverInterface");
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
  v11[2] = __55__HKDrugInteractionEngine_unitTest_noOpWithCompletion___block_invoke;
  v11[3] = &unk_1E6CD5E38;
  v12 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__HKDrugInteractionEngine_unitTest_noOpWithCompletion___block_invoke_2;
  v9[3] = &unk_1E6CD52D8;
  v7 = v5;
  v8 = v4;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __55__HKDrugInteractionEngine_unitTest_noOpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unitTesting_createTaskServerNoOpWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __55__HKDrugInteractionEngine_unitTest_noOpWithCompletion___block_invoke_2(uint64_t a1)
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
