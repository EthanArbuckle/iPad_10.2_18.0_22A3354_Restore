@implementation AEDeactivationPool

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
    v17.super_class = (Class)AEDeactivationPool;
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

- (void)deactivateWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id obj;
  uint64_t v23;
  void *v24;
  _QWORD block[5];
  id v26;
  _QWORD v27[9];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v21 = v3;
    v24 = (void *)objc_opt_new();
    v5 = dispatch_group_create();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = *(id *)(a1 + 8);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v6)
    {
      v7 = v6;
      v23 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          dispatch_group_enter(v5);
          AECoreLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            -[AEPersistentDeactivation deactivation](v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v33 = v12;
            _os_log_impl(&dword_22E279000, v10, OS_LOG_TYPE_INFO, "Running deactivation: %{public}@", buf, 0xCu);

          }
          -[AEPersistentDeactivation deactivation](v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          AELoggingCategoryForEvent(objc_msgSend(v13, "event"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = *(id *)(a1 + 24);
          -[AEPersistentDeactivation deactivation](v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "beginIntervalWithCategory:name:", v14, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          -[AEPersistentDeactivation deactivation](v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __47__AEDeactivationPool_deactivateWithCompletion___block_invoke;
          v27[3] = &unk_24FA21E58;
          v27[4] = v18;
          v27[5] = v9;
          v27[6] = a1;
          v27[7] = v24;
          v27[8] = v5;
          objc_msgSend(v19, "deactivateWithCompletion:", v27);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    v20 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__AEDeactivationPool_deactivateWithCompletion___block_invoke_1;
    block[3] = &unk_24FA21A98;
    v4 = v21;
    block[4] = v24;
    v26 = v21;
    dispatch_group_notify(v5, v20, block);

  }
}

void __47__AEDeactivationPool_deactivateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endInterval");
  if (v3
    && (-[AEPersistentDeactivation deactivation](*(_QWORD *)(a1 + 40)),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isFailable"),
        v4,
        !v5))
  {
    AECoreLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __47__AEDeactivationPool_deactivateWithCompletion___block_invoke_cold_1((uint64_t *)(a1 + 40), v3, v21);

    AECoreLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      -[AEPersistentDeactivation deactivation](*(_QWORD *)(a1 + 40));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v24;
      _os_log_impl(&dword_22E279000, v22, OS_LOG_TYPE_INFO, "Scratchpad will NOT be removed for failed deactivation with ID=%{public}@", buf, 0xCu);

    }
    v13 = *(id *)(a1 + 56);
    objc_sync_enter(v13);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
    objc_sync_exit(v13);
  }
  else
  {
    AECoreLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[AEPersistentDeactivation deactivation](*(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v8;
      _os_log_impl(&dword_22E279000, v6, OS_LOG_TYPE_INFO, "Removing scratchpad for completed deactivation with ID=%{public}@", buf, 0xCu);

    }
    v9 = *(_QWORD **)(a1 + 48);
    if (v9)
      v9 = (_QWORD *)v9[2];
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    -[AEPersistentDeactivation scratchpadIdentifier](v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "readOnlyScratchpadForIdentifier:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v14 = objc_msgSend(v13, "removeWithError:", &v25);
    v15 = v25;
    if (v15)
      v16 = v14;
    else
      v16 = 1;
    if ((v16 & 1) == 0)
    {
      AECoreLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        -[AEPersistentDeactivation deactivation](*(_QWORD *)(a1 + 40));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v19;
        _os_log_impl(&dword_22E279000, v17, OS_LOG_TYPE_INFO, "An error occurred removing the scratchpad for deactivation with ID=%{public}@", buf, 0xCu);

      }
      v20 = *(id *)(a1 + 56);
      objc_sync_enter(v20);
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);
      objc_sync_exit(v20);

    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __47__AEDeactivationPool_deactivateWithCompletion___block_invoke_1(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_performancePrimitives, 0);
  objc_storeStrong((id *)&self->_policyStore, 0);
  objc_storeStrong((id *)&self->_persistentDeactivations, 0);
}

void __47__AEDeactivationPool_deactivateWithCompletion___block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[AEPersistentDeactivation deactivation](*a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "ae_verboseDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_22E279000, a3, OS_LOG_TYPE_ERROR, "Encountered error running deactivation: %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
