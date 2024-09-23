@implementation AERecoveryPolicySession

- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 persistentDeactivations:(void *)a5 queue:
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)AERecoveryPolicySession;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      v14 = objc_msgSend(v12, "copy");
      v15 = a1[1];
      a1[1] = (id)v14;

      objc_storeStrong(a1 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (void)deactivateWithCompletion:(id)a3
{
  id v4;
  AEPerformancePrimitives *performancePrimitives;
  AEPerformancePrimitives *v6;
  void *v7;
  NSArray *persistentDeactivations;
  NSArray *v9;
  void *v10;
  NSObject *v11;
  NSArray *v12;
  id v13;
  _QWORD v14[6];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
    performancePrimitives = self->_performancePrimitives;
  else
    performancePrimitives = 0;
  v6 = performancePrimitives;
  -[AEPerformancePrimitives beginIntervalWithCategory:name:](v6, "beginIntervalWithCategory:name:", CFSTR("Totals"), CFSTR("Deactivate Session"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    persistentDeactivations = self->_persistentDeactivations;
  else
    persistentDeactivations = 0;
  v9 = persistentDeactivations;
  -[NSArray ae_map:](v9, "ae_map:", &__block_literal_global_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  AECoreLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_impl(&dword_22E279000, v11, OS_LOG_TYPE_INFO, "Running recovering session with deactivations: %{public}@", buf, 0xCu);
  }

  if (self)
    v12 = self->_persistentDeactivations;
  else
    v12 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__AERecoveryPolicySession_deactivateWithCompletion___block_invoke_4;
  v14[3] = &unk_24FA21BF8;
  v14[4] = v7;
  v14[5] = self;
  v15 = v4;
  v13 = v4;
  -[AERecoveryPolicySession deactivateWithRemainingPersistentDeactivations:currentEvent:errors:completion:]((uint64_t)self, v12, 0, MEMORY[0x24BDBD1A8], v14);

}

id __52__AERecoveryPolicySession_deactivateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  -[AEPersistentDeactivation deactivation](a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __52__AERecoveryPolicySession_deactivateWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[8];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endInterval");
  v4 = v3;
  AECoreLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E279000, v5, OS_LOG_TYPE_INFO, "Finished running recovery session", buf, 2u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    v7 = *(void **)(v6 + 16);
  else
    v7 = 0;
  v8 = objc_msgSend(v7, "hasPersistentData");
  AECoreLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2_cold_1(v10);
    v11 = 0;
    v12 = v4;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E279000, v10, OS_LOG_TYPE_INFO, "No scratchpads are left after running deactivations. Cleaning up all state…", buf, 2u);
    }

    v13 = *(_QWORD **)(a1 + 40);
    if (v13)
      v13 = (_QWORD *)v13[2];
    v20 = 0;
    v14 = v13;
    v15 = objc_msgSend(v14, "cleanUpPolicyStoreWithError:", &v20);
    v11 = v20;

    if ((v15 & 1) != 0)
    {
      v12 = v4;
      goto LABEL_19;
    }
    AECoreLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __52__AERecoveryPolicySession_deactivateWithCompletion___block_invoke_4_cold_2(v11, v16);

    -[NSObject ae_adding:](v4, "ae_adding:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
  }

LABEL_19:
  if (-[NSObject count](v4, "count"))
  {
    v17 = *MEMORY[0x24BDD10D8];
    v22[0] = AEPolicySessionFailedToDeactivateSubsystemsKey;
    v22[1] = v17;
    v23[0] = v12;
    v23[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AECoreErrorUserInfo(101, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)deactivateWithRemainingPersistentDeactivations:(uint64_t)a3 currentEvent:(void *)a4 errors:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  AEDeactivationPool *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    v12 = objc_msgSend(v9, "count");
    if (a3 <= 5 && v12)
    {
      v27 = 0;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke;
      v26[3] = &__block_descriptor_40_e34_B16__0__AEPersistentDeactivation_8l;
      v26[4] = a3;
      objc_msgSend(v9, "ae_split:includeBlock:", &v27, v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v27;
      v14 = [AEDeactivationPool alloc];
      v15 = *(void **)(a1 + 16);
      v16 = *(void **)(a1 + 32);
      v17 = *(id *)(a1 + 24);
      v18 = v15;
      v19 = -[AEDeactivationPool initWithPolicyStore:performancePrimitives:persistentDeactivations:queue:]((id *)&v14->super.isa, v18, v17, v13, v16);

      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke_2;
      v21[3] = &unk_24FA21DE0;
      v21[4] = a1;
      v22 = v10;
      v23 = v20;
      v25 = a3;
      v24 = v11;
      -[AEDeactivationPool deactivateWithCompletion:]((uint64_t)v19, v21);

    }
    else
    {
      (*((void (**)(id, id))v11 + 2))(v11, v10);
    }
  }

}

BOOL __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  -[AEPersistentDeactivation deactivation](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "event") == *(_QWORD *)(a1 + 32);

  return v4;
}

void __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(NSObject **)(v4 + 32);
  else
    v5 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke_3;
  v9[3] = &unk_24FA21DB8;
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v15 = *(_QWORD *)(a1 + 64);
  v14 = v7;
  v8 = v3;
  dispatch_async(v5, v9);

}

void __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "ae_addingItems:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[AERecoveryPolicySession deactivateWithRemainingPersistentDeactivations:currentEvent:errors:completion:](*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72) + 1, v2, *(_QWORD *)(a1 + 64));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_performancePrimitives, 0);
  objc_storeStrong((id *)&self->_policyStore, 0);
  objc_storeStrong((id *)&self->_persistentDeactivations, 0);
}

void __52__AERecoveryPolicySession_deactivateWithCompletion___block_invoke_4_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ae_verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_22E279000, a2, OS_LOG_TYPE_ERROR, "Failed to clean up policy store. Error: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
