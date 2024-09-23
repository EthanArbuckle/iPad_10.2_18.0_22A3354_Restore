@implementation AEActivePolicySession

- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 invalidationRouter:(void *)a5 activations:(void *)a6 persistentDeactivations:(void *)a7 queue:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v25;
  objc_super v26;

  v25 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)AEActivePolicySession;
    v19 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
      v20 = objc_msgSend(v16, "copy");
      v21 = a1[6];
      a1[6] = (id)v20;

      v22 = objc_msgSend(v17, "copy");
      v23 = a1[7];
      a1[7] = (id)v22;

      objc_storeStrong(a1 + 5, a7);
    }
  }

  return a1;
}

+ (id)sessionWithPolicyStore:(id)a3 performancePrimitives:(id)a4 invalidationRouter:(id)a5 activations:(id)a6 persistentDeactivations:(id)a7 queue:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[AEActivePolicySession initWithPolicyStore:performancePrimitives:invalidationRouter:activations:persistentDeactivations:queue:]((id *)[AEActivePolicySession alloc], v18, v17, v16, v15, v14, v13);

  objc_msgSend(v16, "setRouterDelegate:", v19);
  return v19;
}

- (void)deactivateWithCompletion:(id)a3
{
  id v4;
  AEPerformancePrimitives *performancePrimitives;
  AEPerformancePrimitives *v6;
  void *v7;
  NSArray *v8;
  NSArray *persistentDeactivations;
  id v10;
  _QWORD v11[6];
  id v12;

  v4 = a3;
  if (self)
  {
    -[AEInvalidationRouter setRouterMode:](self->_invalidationRouter, "setRouterMode:", 0);
    performancePrimitives = self->_performancePrimitives;
  }
  else
  {
    objc_msgSend(0, "setRouterMode:", 0);
    performancePrimitives = 0;
  }
  v6 = performancePrimitives;
  -[AEPerformancePrimitives beginIntervalWithCategory:name:](v6, "beginIntervalWithCategory:name:", CFSTR("Totals"), CFSTR("Deactivate Session"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    v8 = self->_activation;
    persistentDeactivations = self->_persistentDeactivations;
  }
  else
  {
    v8 = 0;
    persistentDeactivations = 0;
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__AEActivePolicySession_deactivateWithCompletion___block_invoke;
  v11[3] = &unk_24FA21BF8;
  v11[4] = self;
  v11[5] = v7;
  v12 = v4;
  v10 = v4;
  -[AEActivePolicySession runRemainingActivations:remainingDeactivations:currentEvent:errors:completion:]((uint64_t)self, v8, persistentDeactivations, 3, MEMORY[0x24BDBD1A8], v11);

}

void __50__AEActivePolicySession_deactivateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 32);
  else
    v6 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2;
  v9[3] = &unk_24FA21BD0;
  v7 = *(_QWORD *)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v7;
  v12 = *(id *)(a1 + 48);
  v8 = v4;
  objc_msgSend(v6, "fetchCapturedErrorWithCompletion:", v9);

}

void __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD *v13;
  _QWORD *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[8];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endInterval");
  v4 = *(id *)(a1 + 40);
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "ae_adding:", v3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  AECoreLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E279000, v7, OS_LOG_TYPE_INFO, "Finished running deactivations", buf, 2u);
  }

  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    v9 = *(void **)(v8 + 16);
  else
    v9 = 0;
  v10 = objc_msgSend(v9, "hasPersistentData");
  AECoreLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2_cold_1(v12);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E279000, v12, OS_LOG_TYPE_INFO, "No scratchpads are left after running deactivations. Cleaning up all state…", buf, 2u);
    }

    v13 = *(_QWORD **)(a1 + 48);
    if (v13)
      v13 = (_QWORD *)v13[2];
    v21 = 0;
    v14 = v13;
    v15 = objc_msgSend(v14, "cleanUpPolicyStoreWithError:", &v21);
    v12 = v21;

    if ((v15 & 1) == 0)
    {
      AECoreLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2_cold_2(v12);

      objc_msgSend(v5, "ae_adding:", v12);
      v17 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v17;
    }
  }

  if (objc_msgSend(v5, "count"))
  {
    v18 = *MEMORY[0x24BDD10D8];
    v23[0] = AEPolicySessionFailedToDeactivateSubsystemsKey;
    v23[1] = v18;
    v24[0] = v5;
    v24[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    AECoreErrorUserInfo(101, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)runRemainingActivations:(void *)a3 remainingDeactivations:(uint64_t)a4 currentEvent:(void *)a5 errors:(void *)a6 completion:
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, id);
  uint64_t v15;
  uint64_t v16;
  AEActivationPool *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id *v24;
  AEDeactivationPool *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[6];
  id v39;
  void *v40;
  void *v41;
  void (**v42)(id, id);
  uint64_t v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47[2];

  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (a1)
  {
    if (objc_msgSend(v11, "count"))
    {
      if (a4 >= 6)
      {
LABEL_8:
        v14[2](v14, v13);
        goto LABEL_9;
      }
    }
    else
    {
      v15 = objc_msgSend(v12, "count");
      if (a4 > 5 || !v15)
        goto LABEL_8;
    }
    v46[4] = a4;
    v47[0] = 0;
    v46[0] = MEMORY[0x24BDAC760];
    v16 = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke;
    v46[3] = &__block_descriptor_40_e30_B16__0___AEPolicyActivation__8l;
    objc_msgSend(v11, "ae_split:includeBlock:", v47, v46);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v47[0];
    v45 = 0;
    v44[0] = v16;
    v44[1] = 3221225472;
    v44[2] = __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_2;
    v44[3] = &__block_descriptor_40_e34_B16__0__AEPersistentDeactivation_8l;
    v44[4] = a4;
    objc_msgSend(v12, "ae_split:includeBlock:", &v45, v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v45;
    v17 = [AEActivationPool alloc];
    v37 = v12;
    v18 = *(void **)(a1 + 16);
    v19 = *(void **)(a1 + 24);
    v36 = v13;
    v20 = *(id *)(a1 + 32);
    v21 = v19;
    v22 = v18;
    objc_msgSend(v20, "invalidationHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[AEActivationPool initWithPolicyStore:performancePrimitives:invalidationHandler:activations:queue:]((id *)&v17->super.isa, v22, v21, v23, v34, *(void **)(a1 + 40));

    v25 = [AEDeactivationPool alloc];
    v26 = *(void **)(a1 + 16);
    v27 = *(void **)(a1 + 40);
    v28 = *(id *)(a1 + 24);
    v29 = v26;
    v30 = v27;
    v13 = v36;
    v31 = -[AEDeactivationPool initWithPolicyStore:performancePrimitives:persistentDeactivations:queue:]((id *)&v25->super.isa, v29, v28, v32, v30);

    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_3;
    v38[3] = &unk_24FA21C70;
    v43 = a4;
    v38[4] = a1;
    v38[5] = v31;
    v39 = v36;
    v40 = v33;
    v41 = v35;
    v42 = v14;
    -[AEActivationPool activateWithCompletion:](v24, v38);

    v12 = v37;
  }
LABEL_9:

}

BOOL __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "event") == *(_QWORD *)(a1 + 32);
}

BOOL __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  -[AEPersistentDeactivation deactivation](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "event") == *(_QWORD *)(a1 + 32);

  return v4;
}

void __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  -[AEActivePolicySession validateProducedPersistentDeactivations:currentEvent:](*(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 80));
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_4;
  v13[3] = &unk_24FA21C48;
  v7 = *(_QWORD *)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 48);
  v15 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 56);
  v17 = v5;
  v10 = *(void **)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 80);
  v18 = v8;
  v20 = v9;
  v19 = v10;
  v11 = v5;
  v12 = v6;
  -[AEDeactivationPool deactivateWithCompletion:](v7, v13);

}

- (void)validateProducedPersistentDeactivations:(uint64_t)a3 currentEvent:
{
  void *v4;
  id v5;
  _QWORD v6[5];

  if (a1)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __78__AEActivePolicySession_validateProducedPersistentDeactivations_currentEvent___block_invoke;
    v6[3] = &__block_descriptor_40_e34_B16__0__AEPersistentDeactivation_8l;
    v6[4] = a3;
    objc_msgSend(a2, "ae_filter:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_validateProducedPersistentDeactivations_currentEvent_, a1, CFSTR("AEActivePolicySession.m"), 190, CFSTR("Produced deactivations that will not run: %@"), v5);

    }
  }
}

void __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(NSObject **)(v4 + 40);
  else
    v5 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_5;
  block[3] = &unk_24FA21C20;
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = v3;
  v6 = *(void **)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 56);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  v17 = v7;
  v18 = v8;
  v10 = *(void **)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 88);
  v19 = *(_QWORD *)(a1 + 72);
  v21 = v9;
  v20 = v10;
  v11 = v3;
  dispatch_async(v5, block);

}

void __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "ae_addingItems:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ae_addingItems:", *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "ae_addingItems:", *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEActivePolicySession runRemainingActivations:remainingDeactivations:currentEvent:errors:completion:](*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v3, *(_QWORD *)(a1 + 96) + 1, v4, *(_QWORD *)(a1 + 88));

}

BOOL __78__AEActivePolicySession_validateProducedPersistentDeactivations_currentEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  -[AEPersistentDeactivation deactivation](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "event") <= *(_QWORD *)(a1 + 32);

  return v4;
}

- (void)setInvalidationHandler:(id)a3
{
  void *v4;
  id invalidationHandler;

  v4 = (void *)MEMORY[0x22E329CEC](a3, a2);
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = v4;

  -[AEInvalidationRouter setRouterMode:](self->_invalidationRouter, "setRouterMode:", self->_invalidationHandler != 0);
}

- (void)invalidationRouter:(id)a3 didReceiveInvalidationError:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD);

  v5 = a4;
  -[AEActivePolicySession invalidationHandler](self, "invalidationHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    AECoreLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AEActivePolicySession invalidationRouter:didReceiveInvalidationError:].cold.1(v5);

    -[AEActivePolicySession invalidationHandler](self, "invalidationHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v5);

  }
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentDeactivations, 0);
  objc_storeStrong((id *)&self->_activation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_invalidationRouter, 0);
  objc_storeStrong((id *)&self->_performancePrimitives, 0);
  objc_storeStrong((id *)&self->_policyStore, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

void __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22E279000, log, OS_LOG_TYPE_FAULT, "Some scratchpads were not removed meaning some deactivations failed. Will reattempt to recover on next launch.", v1, 2u);
}

void __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "ae_verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_22E279000, v2, v3, "Failed to clean up policy store. Error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)invalidationRouter:(void *)a1 didReceiveInvalidationError:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "ae_verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_22E279000, v2, v3, "Active policy session encountered plugin invalidation. Reporting issue. Error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
