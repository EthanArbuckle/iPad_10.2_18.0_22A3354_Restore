@implementation AEActivationPool

- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 invalidationHandler:(void *)a5 activations:(void *)a6 queue:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  objc_super v22;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)AEActivationPool;
    a1 = (id *)objc_msgSendSuper2(&v22, sel_init);
    if (a1)
    {
      v17 = MEMORY[0x22E329CEC](v14);
      v18 = a1[2];
      a1[2] = (id)v17;

      v19 = objc_msgSend(v15, "copy");
      v20 = a1[1];
      a1[1] = (id)v19;

      objc_storeStrong(a1 + 3, a2);
      objc_storeStrong(a1 + 4, a3);
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (void)activateWithCompletion:(id *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id obj;
  id v22;
  id *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD block[6];
  id v28;
  _QWORD v29[9];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v20 = v3;
    v26 = (void *)objc_opt_new();
    v25 = (void *)objc_opt_new();
    v24 = a1[3];
    v22 = a1[2];
    v5 = dispatch_group_create();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = a1;
    obj = a1[1];
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          dispatch_group_enter(v5);
          AECoreLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v35 = v12;
            _os_log_impl(&dword_22E279000, v11, OS_LOG_TYPE_INFO, "Running activation: %{public}@", buf, 0xCu);

          }
          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "writeOnlyScratchpadForIdentifier:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          AELoggingCategoryForEvent(objc_msgSend(v10, "event"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v23[4];
          objc_msgSend(v10, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "beginIntervalWithCategory:name:", v15, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v29[0] = MEMORY[0x24BDAC760];
          v29[1] = 3221225472;
          v29[2] = __43__AEActivationPool_activateWithCompletion___block_invoke;
          v29[3] = &unk_24FA21B10;
          v29[4] = v18;
          v29[5] = v10;
          v29[6] = v26;
          v29[7] = v25;
          v29[8] = v5;
          objc_msgSend(v10, "activateWithScratchpad:invalidationHandler:completion:", v14, v22, v29);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v7);
    }

    v19 = v23[5];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__AEActivationPool_activateWithCompletion___block_invoke_2;
    block[3] = &unk_24FA21B38;
    v4 = v20;
    block[4] = v25;
    block[5] = v26;
    v28 = v20;
    dispatch_group_notify(v5, v19, block);

  }
}

void __43__AEActivationPool_activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  AEPersistentDeactivation *v9;
  void *v10;
  id *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "endInterval");
  if (v6)
  {
    AECoreLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43__AEActivationPool_activateWithCompletion___block_invoke_cold_1(a1, v6, v7);

    v8 = *(id *)(a1 + 48);
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    objc_sync_exit(v8);

  }
  if (v5)
  {
    v9 = [AEPersistentDeactivation alloc];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AEPersistentDeactivation initWithScratchpadIdentifier:deactivation:]((id *)&v9->super.isa, v10, v5);

    v12 = *(id *)(a1 + 56);
    objc_sync_enter(v12);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
    objc_sync_exit(v12);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __43__AEActivationPool_activateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_performancePrimitives, 0);
  objc_storeStrong((id *)&self->_policyStore, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_activations, 0);
}

void __43__AEActivationPool_activateWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "ae_verboseDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_22E279000, a3, OS_LOG_TYPE_ERROR, "Encountered error running activation: %{public}@. Error: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
