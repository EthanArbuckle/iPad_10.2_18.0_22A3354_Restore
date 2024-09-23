@implementation DNDSModeAssertionManagerUpdateContext

- (DNDSModeAssertionManagerUpdateContext)initWithStore:(id)a3 clientDetailsProvider:(id)a4
{
  id v6;
  id v7;
  DNDSModeAssertionManagerUpdateContext *v8;
  uint64_t v9;
  DNDSModeAssertionStore *store;
  uint64_t v11;
  DNDSModeAssertionUpdateResult *updateResult;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSModeAssertionManagerUpdateContext;
  v8 = -[DNDSModeAssertionManagerUpdateContext init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    store = v8->_store;
    v8->_store = (DNDSModeAssertionStore *)v9;

    objc_storeStrong((id *)&v8->_clientDetailsProvider, a4);
    +[DNDSModeAssertionUpdateResult emptyResult](DNDSModeAssertionUpdateResult, "emptyResult");
    v11 = objc_claimAutoreleasedReturnValue();
    updateResult = v8->_updateResult;
    v8->_updateResult = (DNDSModeAssertionUpdateResult *)v11;

  }
  return v8;
}

- (id)takeAssertionWithUUID:(id)a3 details:(id)a4 source:(id)a5 startDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  DNDSClientDetailsProvider *clientDetailsProvider;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  DNDSModeAssertionUpdateResult *v38;
  DNDSModeAssertionUpdateResult *updateResult;
  DNDSModeAssertionStore *v40;
  DNDSModeAssertionStore *store;
  void *v43;
  void *v44;
  id *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v12 = a4;
  v13 = a3;
  v14 = _os_activity_create(&dword_1CB895000, "com.apple.donotdisturb.ModeAssertionManagerUpdateContext.takeAssertion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v14, &state);
  v15 = (void *)-[DNDSModeAssertionStore mutableCopy](self->_store, "mutableCopy");
  clientDetailsProvider = self->_clientDetailsProvider;
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSClientDetailsProvider clientDetailsForIdentifier:](clientDetailsProvider, "clientDetailsForIdentifier:", v17);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D5F8]), "initWithUUID:startDate:details:source:", v13, v11, v12, v10);
  objc_msgSend(v15, "assertions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "containsObject:", v18);
  if ((v21 & 1) != 0)
  {
    v22 = DNDSLogAssertionManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v18;
      _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "Assertion already exists in store; assertion=%{public}@",
        buf,
        0xCu);
    }
    goto LABEL_7;
  }
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __88__DNDSModeAssertionManagerUpdateContext_takeAssertionWithUUID_details_source_startDate___block_invoke;
  v47[3] = &unk_1E86A6770;
  v45 = &v48;
  v23 = v18;
  v48 = v23;
  if ((objc_msgSend(v20, "bs_containsObjectPassingTest:", v47) & 1) != 0)
  {
    v24 = DNDSLogAssertionManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v23;
      _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_DEFAULT, "Assertion was already invalidated; assertion=%{public}@",
        buf,
        0xCu);
    }
LABEL_7:
    +[DNDSModeAssertionUpdateResult emptyResult](DNDSModeAssertionUpdateResult, "emptyResult");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    os_activity_scope_leave(&state);
    v26 = v25;
    if ((v21 & 1) != 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  objc_msgSend(v19, "arrayByAddingObject:", v23);
  v27 = objc_claimAutoreleasedReturnValue();

  v44 = (void *)v27;
  objc_msgSend(v15, "setAssertions:", v27);
  v28 = DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v23;
    _os_log_impl(&dword_1CB895000, v28, OS_LOG_TYPE_DEFAULT, "Inserted new assertion into store; assertion=%{public}@",
      buf,
      0xCu);
  }
  if (objc_msgSend(v46, "isUserInteractionClient"))
  {
    +[DNDSModeAssertionInvalidationPredicate predicateForAnyAssertion](DNDSModeAssertionInvalidationPredicate, "predicateForAnyAssertion");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = 2;
  }
  else
  {
    objc_msgSend(v46, "identifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionClientIdentifiers:", v31);
    v29 = objc_claimAutoreleasedReturnValue();

    v30 = 4;
  }
  v43 = (void *)v29;
  +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:source:reason:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:source:reason:", v29, v11, v10, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidationRequests");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "arrayByAddingObject:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setInvalidationRequests:", v34);
  v35 = DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v32;
    _os_log_impl(&dword_1CB895000, v35, OS_LOG_TYPE_DEFAULT, "Inserted new invalidation request into store; invalidationRequest=%{public}@",
      buf,
      0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sanitizeDatesForThreshold:", v36);

  -[DNDSModeAssertionManagerUpdateContext _resolveStore:](self, "_resolveStore:", v15);
  -[DNDSModeAssertionManagerUpdateContext _cleanupStore:](self, "_cleanupStore:", v15);
  -[DNDSModeAssertionManagerUpdateContext _calculateUpdateResultForStore:previousStore:](self, "_calculateUpdateResultForStore:previousStore:", v15, self->_store);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionUpdateResult resultCombiningWithResult:](self->_updateResult, "resultCombiningWithResult:", v37);
  v38 = (DNDSModeAssertionUpdateResult *)objc_claimAutoreleasedReturnValue();
  updateResult = self->_updateResult;
  self->_updateResult = v38;

  v40 = (DNDSModeAssertionStore *)objc_msgSend(v15, "copy");
  store = self->_store;
  self->_store = v40;

  os_activity_scope_leave(&state);
  v26 = v37;
  v19 = v44;
LABEL_17:

LABEL_18:
  return v26;
}

uint64_t __88__DNDSModeAssertionManagerUpdateContext_takeAssertionWithUUID_details_source_startDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)modeAssertionsMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DNDSModeAssertionStore assertions](self->_store, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v10 = 134218242;
    v11 = objc_msgSend(v6, "count");
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu assertion(s) for predicate: predicate=%{public}@", (uint8_t *)&v10, 0x16u);

  }
  return v6;
}

- (id)modeAssertionInvalidationsMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DNDSModeAssertionStore invalidations](self->_store, "invalidations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v10 = 134218242;
    v11 = objc_msgSend(v6, "count");
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu assertion invalidation(s) for predicate: predicate=%{public}@", (uint8_t *)&v10, 0x16u);

  }
  return v6;
}

- (id)takeAssertionWithDetails:(id)a3 source:(id)a4 startDate:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionManagerUpdateContext takeAssertionWithUUID:details:source:startDate:](self, "takeAssertionWithUUID:details:source:startDate:", v12, v11, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)invalidateAssertionsForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  DNDSModeAssertionUpdateResult *v12;
  DNDSModeAssertionUpdateResult *updateResult;
  DNDSModeAssertionStore *v14;
  DNDSModeAssertionStore *store;
  os_activity_scope_state_s v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1CB895000, "com.apple.donotdisturb.ModeAssertionManagerUpdateContext.invalidateAssertions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v17);
  v6 = (void *)-[DNDSModeAssertionStore mutableCopy](self->_store, "mutableCopy", v17.opaque[0], v17.opaque[1]);
  objc_msgSend(v6, "invalidationRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObject:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setInvalidationRequests:", v8);
  v9 = DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v4;
    _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Inserted new invalidation request into store; request=%{public}@",
      buf,
      0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sanitizeDatesForThreshold:", v10);

  -[DNDSModeAssertionManagerUpdateContext _resolveStore:](self, "_resolveStore:", v6);
  -[DNDSModeAssertionManagerUpdateContext _cleanupStore:](self, "_cleanupStore:", v6);
  -[DNDSModeAssertionManagerUpdateContext _calculateUpdateResultForStore:previousStore:](self, "_calculateUpdateResultForStore:previousStore:", v6, self->_store);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionUpdateResult resultCombiningWithResult:](self->_updateResult, "resultCombiningWithResult:", v11);
  v12 = (DNDSModeAssertionUpdateResult *)objc_claimAutoreleasedReturnValue();
  updateResult = self->_updateResult;
  self->_updateResult = v12;

  v14 = (DNDSModeAssertionStore *)objc_msgSend(v6, "copy");
  store = self->_store;
  self->_store = v14;

  os_activity_scope_leave(&v17);
  return v11;
}

- (void)_resolveStore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "assertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v3;
  objc_msgSend(v3, "invalidationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v9)
  {
    v10 = v9;
    v29 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __55__DNDSModeAssertionManagerUpdateContext__resolveStore___block_invoke_3;
        v31[3] = &unk_1E86A6818;
        v31[4] = v12;
        objc_msgSend(v30, "bs_firstObjectPassingTest:", v31);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = objc_alloc(MEMORY[0x1E0D1D628]);
          objc_msgSend(v13, "requestDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "details");
          v16 = v8;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "source");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v14, "initWithAssertion:invalidationDate:details:source:reason:reasonOverride:", v12, v15, v17, v18, objc_msgSend(v13, "reason"), objc_msgSend(v13, "reasonOverride"));

          v8 = v16;
          if ((objc_msgSend(v16, "containsObject:", v19) & 1) != 0)
          {
            v20 = DNDSLogAssertionManager;
            if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v37 = v19;
              v38 = 2114;
              v39 = v13;
              v21 = v20;
              v22 = "Assertion already invalidated, skipping work; invalidation=%{public}@, invalidationRequest=%{public}@";
              goto LABEL_14;
            }
          }
          else
          {
            objc_msgSend(v16, "addObject:", v19);
            v24 = DNDSLogAssertionManager;
            if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v37 = v19;
              v38 = 2114;
              v39 = v13;
              v21 = v24;
              v22 = "Assertion invalidated; invalidation=%{public}@, invalidationRequest=%{public}@";
LABEL_14:
              _os_log_impl(&dword_1CB895000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0x16u);
            }
          }

          goto LABEL_16;
        }
        objc_msgSend(v27, "addObject:", v12);
        v23 = DNDSLogAssertionManager;
        if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v37 = v12;
          _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_INFO, "Assertion preserved; assertion=%{public}@", buf, 0xCu);
        }
LABEL_16:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_16_0);
  objc_msgSend(v26, "setAssertions:", v27);
  objc_msgSend(v26, "setInvalidations:", v8);
  objc_msgSend(v26, "setInvalidationRequests:", v30);

}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__resolveStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__resolveStore___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "requestDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__resolveStore___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "requestDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSModeAssertionInvalidationPredicate predicateForAssertionsTakenBeforeDate:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionsTakenBeforeDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v5;
  objc_msgSend(v3, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "evaluateWithObject:", *(_QWORD *)(a1 + 32));
  return v10;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__resolveStore___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "invalidationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_cleanupStore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char isKindOfClass;
  id v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  __CFString *v58;
  __CFString *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t ii;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  id obj;
  uint64_t v96;
  id v97;
  void *v98;
  id v99;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v3, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = v6;
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAssertions:", v7);

  v97 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v87 = v3;
  objc_msgSend(v3, "invalidations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v126;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v126 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
        objc_msgSend(v13, "assertion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "source");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "clientIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "assertion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "source");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "deviceIdentifier");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        v21 = CFSTR("default.device");
        if (v19)
          v21 = (__CFString *)v19;
        v22 = v21;

        -[DNDSClientDetailsProvider clientDetailsForIdentifier:](self->_clientDetailsProvider, "clientDetailsForIdentifier:", v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "objectForKey:", v23);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (!v24)
          v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v24, "setObject:forKey:", v13, v22);
        if ((unint64_t)objc_msgSend(v24, "count") >= 3)
        {
          objc_msgSend(v24, "keysSortedByValueUsingComparator:", &__block_literal_global_20_0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObjectForKey:", v26);

        }
        objc_msgSend(v97, "setObject:forKey:", v24, v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
    }
    while (v10);
  }

  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  objc_msgSend(v97, "allValues");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v122 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * j), "allValues");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObjectsFromArray:", v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
    }
    while (v30);
  }

  objc_msgSend(v27, "sortUsingComparator:", &__block_literal_global_21_0);
  objc_msgSend(v87, "setInvalidations:", v27);
  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  objc_msgSend(v87, "invalidationRequests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
  v98 = v34;
  if (v36)
  {
    v37 = v36;
    v38 = 0;
    v39 = *(_QWORD *)v118;
    v88 = v35;
    v89 = v27;
    v91 = *(_QWORD *)v118;
    do
    {
      v40 = 0;
      v94 = v37;
      do
      {
        if (*(_QWORD *)v118 != v39)
          objc_enumerationMutation(obj);
        v96 = v40;
        v41 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v40);
        objc_msgSend(v41, "predicate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v44 = v41;

          objc_msgSend(v34, "removeAllObjects");
          objc_msgSend(v35, "removeAllObjects");
          v38 = v44;
        }
        else
        {
          objc_msgSend(v41, "predicate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v46 = objc_opt_isKindOfClass();

          objc_msgSend(v41, "predicate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if ((v46 & 1) != 0)
          {
            v92 = v38;
            v115 = 0u;
            v116 = 0u;
            v113 = 0u;
            v114 = 0u;
            v90 = v47;
            objc_msgSend(v47, "clientIdentifiers");
            v99 = (id)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
            if (v49)
            {
              v50 = v49;
              v51 = *(_QWORD *)v114;
              do
              {
                for (k = 0; k != v50; ++k)
                {
                  if (*(_QWORD *)v114 != v51)
                    objc_enumerationMutation(v99);
                  v53 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * k);
                  -[DNDSClientDetailsProvider clientDetailsForIdentifier:](self->_clientDetailsProvider, "clientDetailsForIdentifier:", v53);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "source");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "deviceIdentifier");
                  v56 = objc_claimAutoreleasedReturnValue();
                  v57 = (void *)v56;
                  v58 = CFSTR("default.device");
                  if (v56)
                    v58 = (__CFString *)v56;
                  v59 = v58;

                  objc_msgSend(v34, "objectForKey:", v54);
                  v60 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v60)
                    v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  objc_msgSend(v60, "setObject:forKey:", v41, v59);
                  if ((unint64_t)objc_msgSend(v60, "count") >= 3)
                  {
                    objc_msgSend(v60, "keysSortedByValueUsingComparator:", &__block_literal_global_24_0);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "firstObject");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "removeObjectForKey:", v62);

                    v34 = v98;
                  }
                  objc_msgSend(v34, "setObject:forKey:", v60, v53);

                }
                v50 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
              }
              while (v50);
            }

            v35 = v88;
            v27 = v89;
            v38 = v92;
          }
          else
          {
            objc_opt_class();
            objc_opt_isKindOfClass();

            objc_msgSend(v41, "predicate");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = 0u;
            v110 = 0u;
            v111 = 0u;
            v112 = 0u;
            objc_msgSend(v63, "UUIDs");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
            if (v65)
            {
              v66 = v65;
              v67 = *(_QWORD *)v110;
              do
              {
                for (m = 0; m != v66; ++m)
                {
                  if (*(_QWORD *)v110 != v67)
                    objc_enumerationMutation(v64);
                  objc_msgSend(v35, "setObject:forKey:", v41, *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * m));
                }
                v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
              }
              while (v66);
            }

          }
          v39 = v91;
          v37 = v94;
        }
        v40 = v96 + 1;
      }
      while (v96 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
    }
    while (v37);
  }
  else
  {
    v38 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "bs_safeAddObject:", v38);
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  objc_msgSend(v34, "allValues");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v106;
    do
    {
      for (n = 0; n != v72; ++n)
      {
        if (*(_QWORD *)v106 != v73)
          objc_enumerationMutation(v70);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * n), "allValues");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObjectsFromArray:", v75);

      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
    }
    while (v72);
  }
  v93 = v38;

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  objc_msgSend(v87, "invalidations");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v101, v129, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v102;
    do
    {
      for (ii = 0; ii != v78; ++ii)
      {
        if (*(_QWORD *)v102 != v79)
          objc_enumerationMutation(v76);
        objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * ii), "assertion");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "UUID");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKey:", v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v69, "bs_safeAddObject:", v83);
      }
      v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v101, v129, 16);
    }
    while (v78);
  }

  objc_msgSend(v69, "allObjects");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "sortedArrayUsingComparator:", &__block_literal_global_27_0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v87, "setInvalidationRequests:", v85);
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__cleanupStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "invalidationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__cleanupStore___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "invalidationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__cleanupStore___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "requestDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__cleanupStore___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "requestDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_calculateUpdateResultForStore:(id)a3 previousStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  DNDSModeAssertionUpdateResult *v14;
  DNDSModeAssertionUpdateResult *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "assertions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__DNDSModeAssertionManagerUpdateContext__calculateUpdateResultForStore_previousStore___block_invoke;
  v22[3] = &unk_1E86A5BB0;
  v9 = v5;
  v23 = v9;
  objc_msgSend(v7, "bs_filter:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "invalidations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v8;
  v18 = 3221225472;
  v19 = __86__DNDSModeAssertionManagerUpdateContext__calculateUpdateResultForStore_previousStore___block_invoke_2;
  v20 = &unk_1E86A6770;
  v21 = v9;
  v12 = v9;
  objc_msgSend(v11, "bs_filter:", &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [DNDSModeAssertionUpdateResult alloc];
  v15 = -[DNDSModeAssertionUpdateResult initWithAssertions:invalidations:](v14, "initWithAssertions:invalidations:", v10, v13, v17, v18, v19, v20);

  return v15;
}

uint64_t __86__DNDSModeAssertionManagerUpdateContext__calculateUpdateResultForStore_previousStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "assertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1u;
}

uint64_t __86__DNDSModeAssertionManagerUpdateContext__calculateUpdateResultForStore_previousStore___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "invalidations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1u;
}

- (DNDSModeAssertionStore)store
{
  return self->_store;
}

- (DNDSModeAssertionUpdateResult)updateResult
{
  return self->_updateResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateResult, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
}

@end
