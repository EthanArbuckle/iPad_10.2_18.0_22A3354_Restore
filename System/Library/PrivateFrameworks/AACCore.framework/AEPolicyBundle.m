@implementation AEPolicyBundle

- (AEPolicyBundle)initWithPolicyStore:(id)a3 performancePrimitives:(id)a4 activations:(id)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AEPolicyBundle *v15;
  AEPolicyBundle *v16;
  uint64_t v17;
  NSArray *activations;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AEPolicyBundle;
  v15 = -[AEPolicyBundle init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_policyStore, a3);
    objc_storeStrong((id *)&v16->_performancePrimitives, a4);
    v17 = objc_msgSend(v13, "copy");
    activations = v16->_activations;
    v16->_activations = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_queue, a6);
  }

  return v16;
}

- (void)activateSessionWithCompletion:(id)a3
{
  id v4;
  AEInvalidationRouter *v5;
  OS_dispatch_queue *queue;
  AEInvalidationRouter *v7;
  AEPerformancePrimitives *performancePrimitives;
  AEPerformancePrimitives *v9;
  void *v10;
  NSArray *activations;
  NSArray *v12;
  void *v13;
  id v14;
  _QWORD v15[7];
  id v16;

  v4 = a3;
  v5 = [AEInvalidationRouter alloc];
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7 = -[AEInvalidationRouter initWithQueue:](v5, "initWithQueue:", queue);
  -[AEInvalidationRouter setRouterMode:](v7, "setRouterMode:", 0);
  if (self)
    performancePrimitives = self->_performancePrimitives;
  else
    performancePrimitives = 0;
  v9 = performancePrimitives;
  -[AEPerformancePrimitives beginIntervalWithCategory:name:](v9, "beginIntervalWithCategory:name:", CFSTR("Totals"), CFSTR("Activate Session"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    activations = self->_activations;
  else
    activations = 0;
  v12 = activations;
  -[AEInvalidationRouter invalidationHandler](v7, "invalidationHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __48__AEPolicyBundle_activateSessionWithCompletion___block_invoke;
  v15[3] = &unk_24FA21940;
  v15[4] = v10;
  v15[5] = self;
  v15[6] = v7;
  v16 = v4;
  v14 = v4;
  -[AEPolicyBundle runWithRemainingActivations:remainingDeactivations:invalidationHandler:currentEvent:completion:]((uint64_t)self, v12, MEMORY[0x24BDBD1A8], v13, 0, v15);

}

void __48__AEPolicyBundle_activateSessionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "endInterval");
  if (objc_msgSend(v9, "count"))
  {
    -[AEPolicyBundle activationErrorWithErrors:](*(_QWORD *)(a1 + 40), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEPolicyBundle recoverWithError:deactivations:finalCompletion:](*(_QWORD *)(a1 + 40), v10, v8, *(void **)(a1 + 56));

  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__AEPolicyBundle_activateSessionWithCompletion___block_invoke_2;
    v14[3] = &unk_24FA21918;
    v11 = *(void **)(a1 + 48);
    v14[4] = *(_QWORD *)(a1 + 40);
    v15 = v8;
    v12 = *(id *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 48);
    v18 = v12;
    v16 = v13;
    v17 = v7;
    objc_msgSend(v11, "fetchCapturedErrorWithCompletion:", v14);

  }
}

- (id)activationErrorWithErrors:(uint64_t)a1
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v2 = *MEMORY[0x24BDD10D8];
  v8[0] = AEPolicySessionFailedToActivateSubsystemsKey;
  v8[1] = v2;
  v9[0] = a2;
  v9[1] = a2;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AECoreErrorUserInfo(100, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)recoverWithError:(void *)a3 deactivations:(void *)a4 finalCompletion:
{
  id v7;
  id v8;
  id v9;
  AERecoveryPolicySession *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = a3;
    v10 = [AERecoveryPolicySession alloc];
    v11 = *(void **)(a1 + 32);
    v14 = a1 + 8;
    v12 = *(void **)(a1 + 8);
    v13 = *(void **)(v14 + 8);
    v15 = v11;
    v16 = v13;
    v17 = -[AERecoveryPolicySession initWithPolicyStore:performancePrimitives:persistentDeactivations:queue:]((id *)&v10->super.isa, v16, v15, v9, v12);

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __65__AEPolicyBundle_recoverWithError_deactivations_finalCompletion___block_invoke;
    v18[3] = &unk_24FA21A48;
    v20 = v8;
    v19 = v7;
    objc_msgSend(v17, "deactivateWithCompletion:", v18);

  }
}

void __48__AEPolicyBundle_activateSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v20[0] = a2;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a2;
    objc_msgSend(v4, "arrayWithObjects:count:", v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEPolicyBundle activationErrorWithErrors:](v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AEPolicyBundle recoverWithError:deactivations:finalCompletion:](*(_QWORD *)(a1 + 32), v7, *(void **)(a1 + 40), *(void **)(a1 + 64));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v9 = *(void **)(v8 + 16);
    else
      v9 = 0;
    v10 = *(_QWORD **)(a1 + 32);
    if (v10)
      v10 = (_QWORD *)v10[4];
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    if (v13)
      v15 = *(_QWORD *)(v13 + 8);
    else
      v15 = 0;
    v16 = v10;
    v17 = v9;
    v18 = 0;
    +[AEActivePolicySession sessionWithPolicyStore:performancePrimitives:invalidationRouter:activations:persistentDeactivations:queue:](AEActivePolicySession, "sessionWithPolicyStore:performancePrimitives:invalidationRouter:activations:persistentDeactivations:queue:", v17, v16, v11, v12, v14, v15);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (void)runWithRemainingActivations:(void *)a3 remainingDeactivations:(void *)a4 invalidationHandler:(uint64_t)a5 currentEvent:(void *)a6 completion:
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, id, id, _QWORD);
  uint64_t v15;
  uint64_t v16;
  AEActivationPool *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id *v23;
  AEDeactivationPool *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void (**v36)(id, id, id, _QWORD);
  _QWORD v37[5];
  id v38;
  id *v39;
  void *v40;
  void *v41;
  void (**v42)(id, id, id, _QWORD);
  id v43;
  uint64_t v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48[2];

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (a1)
  {
    if (objc_msgSend(v11, "count"))
    {
      if (a5 >= 3)
      {
LABEL_8:
        v14[2](v14, v11, v12, MEMORY[0x24BDBD1A8]);
        goto LABEL_9;
      }
    }
    else
    {
      v15 = objc_msgSend(v12, "count");
      if (a5 > 2 || !v15)
        goto LABEL_8;
    }
    v47[4] = a5;
    v48[0] = 0;
    v47[0] = MEMORY[0x24BDAC760];
    v16 = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke;
    v47[3] = &__block_descriptor_40_e30_B16__0___AEPolicyActivation__8l;
    objc_msgSend(v11, "ae_split:includeBlock:", v48, v47);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v48[0];
    v46 = 0;
    v45[0] = v16;
    v45[1] = 3221225472;
    v45[2] = __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_2;
    v45[3] = &__block_descriptor_40_e34_B16__0__AEPersistentDeactivation_8l;
    v45[4] = a5;
    objc_msgSend(v12, "ae_split:includeBlock:", &v46, v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v46;
    v17 = [AEActivationPool alloc];
    v36 = v14;
    v18 = v13;
    v20 = *(void **)(a1 + 8);
    v19 = *(void **)(a1 + 16);
    v35 = v12;
    v21 = *(id *)(a1 + 32);
    v22 = v19;
    v23 = -[AEActivationPool initWithPolicyStore:performancePrimitives:invalidationHandler:activations:queue:]((id *)&v17->super.isa, v22, v21, v18, v33, v20);

    v24 = [AEDeactivationPool alloc];
    v26 = *(void **)(a1 + 8);
    v25 = *(void **)(a1 + 16);
    v27 = *(id *)(a1 + 32);
    v28 = v25;
    v29 = v26;
    v12 = v35;
    v30 = -[AEDeactivationPool initWithPolicyStore:performancePrimitives:persistentDeactivations:queue:]((id *)&v24->super.isa, v28, v27, v31, v29);

    v13 = v18;
    v14 = v36;
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_3;
    v37[3] = &unk_24FA21A20;
    v37[4] = a1;
    v44 = a5;
    v38 = v35;
    v39 = v30;
    v40 = v32;
    v41 = v34;
    v42 = v36;
    v43 = v13;
    -[AEActivationPool activateWithCompletion:](v23, v37);

  }
LABEL_9:

}

- (id)recoverySession
{
  AEPolicyBundle *v2;
  NSArray *activations;
  void *v4;
  AERecoveryPolicySession *v5;
  AEPolicyStore *v6;
  AEPerformancePrimitives *v7;
  OS_dispatch_queue *queue;
  id *v9;
  _QWORD v11[5];

  v2 = self;
  if (self)
    self = (AEPolicyBundle *)self->_policyStore;
  if (-[AEPolicyBundle exists](self, "exists"))
  {
    if (v2)
      activations = v2->_activations;
    else
      activations = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __33__AEPolicyBundle_recoverySession__block_invoke;
    v11[3] = &unk_24FA21968;
    v11[4] = v2;
    -[NSArray ae_map:](activations, "ae_map:", v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [AERecoveryPolicySession alloc];
    if (v2)
    {
      v6 = v2->_policyStore;
      v7 = v2->_performancePrimitives;
      queue = v2->_queue;
    }
    else
    {
      v7 = 0;
      v6 = 0;
      queue = 0;
    }
    v9 = -[AERecoveryPolicySession initWithPolicyStore:performancePrimitives:persistentDeactivations:queue:]((id *)&v5->super.isa, v6, v7, v4, queue);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

id *__33__AEPolicyBundle_recoverySession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  AEPersistentDeactivation *v9;
  void *v10;
  id *v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[2];
  v5 = v4;
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readOnlyScratchpadForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "deactivationForScratchpad:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = [AEPersistentDeactivation alloc];
      objc_msgSend(v3, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[AEPersistentDeactivation initWithScratchpadIdentifier:deactivation:]((id *)&v9->super.isa, v10, v8);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

BOOL __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "event") == *(_QWORD *)(a1 + 32);
}

BOOL __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  -[AEPersistentDeactivation deactivation](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "event") == *(_QWORD *)(a1 + 32);

  return v4;
}

void __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  -[AEPolicyBundle validateProducedPersistentDeactivations:currentEvent:](*(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 88));
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "ae_addingItems:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_4;
    v13[3] = &unk_24FA219F8;
    v8 = *(_QWORD *)(a1 + 48);
    v13[4] = *(_QWORD *)(a1 + 56);
    v14 = v5;
    v9 = *(id *)(a1 + 72);
    v10 = *(_QWORD *)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v17 = v9;
    v11 = *(id *)(a1 + 80);
    v12 = *(_QWORD *)(a1 + 88);
    v18 = v11;
    v19 = v12;
    -[AEDeactivationPool deactivateWithCompletion:](v8, v13);

  }
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
    v6[2] = __71__AEPolicyBundle_validateProducedPersistentDeactivations_currentEvent___block_invoke;
    v6[3] = &__block_descriptor_40_e34_B16__0__AEPersistentDeactivation_8l;
    v6[4] = a3;
    objc_msgSend(a2, "ae_filter:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_validateProducedPersistentDeactivations_currentEvent_, a1, CFSTR("AEPolicyBundle.m"), 210, CFSTR("Produced deactivations that will not run: %@"), v5);

    }
  }
}

void __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ae_addingItems:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      v6 = *(NSObject **)(v5 + 8);
    else
      v6 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_5;
    v9[3] = &unk_24FA219D0;
    v10 = *(_OWORD *)(a1 + 48);
    v11 = v4;
    v7 = *(id *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80);
    v12 = v7;
    v14 = v8;
    v13 = *(id *)(a1 + 64);
    dispatch_async(v6, v9);

  }
}

uint64_t __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_5(_QWORD *a1)
{
  return -[AEPolicyBundle runWithRemainingActivations:remainingDeactivations:invalidationHandler:currentEvent:completion:](a1[4], a1[5], a1[6], a1[7], a1[9] + 1, a1[8]);
}

void __65__AEPolicyBundle_recoverWithError_deactivations_finalCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    AECoreLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__AEPolicyBundle_recoverWithError_deactivations_finalCompletion___block_invoke_cold_1((uint64_t)v3, v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

BOOL __71__AEPolicyBundle_validateProducedPersistentDeactivations_currentEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  -[AEPersistentDeactivation deactivation](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "event") <= *(_QWORD *)(a1 + 32);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performancePrimitives, 0);
  objc_storeStrong((id *)&self->_activations, 0);
  objc_storeStrong((id *)&self->_policyStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__AEPolicyBundle_recoverWithError_deactivations_finalCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_22E279000, a2, OS_LOG_TYPE_ERROR, "Failed to run deactivations during recovery session %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
