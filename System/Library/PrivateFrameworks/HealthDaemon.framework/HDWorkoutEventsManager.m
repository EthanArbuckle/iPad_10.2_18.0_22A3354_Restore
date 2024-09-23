@implementation HDWorkoutEventsManager

- (HDWorkoutEventsManager)initWithProfile:(id)a3
{
  id v4;
  HDWorkoutEventsManager *v5;
  HDWorkoutEventsManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  HDAssertionManager *v9;
  HDAssertionManager *assertionManager;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDWorkoutEventsManager;
  v5 = -[HDWorkoutEventsManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    assertionManager = v6->_assertionManager;
    v6->_assertionManager = v9;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v6->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v6, CFSTR("HDWorkoutSessionAssertionIdentifierEventCollection"), v6->_queue);
  }

  return v6;
}

- (id)takeSessionAssertionWithOwnerIdentifier:(id)a3 activityType:(unint64_t)a4 sessionIdentifier:(id)a5 eventsDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  _HDEventsCollectionAssertion *v13;
  HDWorkoutEventsManager *v14;
  HDAssertionManager *assertionManager;
  id v16;
  id v17;
  HDWorkoutEventsManager *v18;
  HDWorkoutEventsManager *v19;
  HDWorkoutEventsManager *v20;
  _QWORD v22[5];
  HDWorkoutEventsManager *v23;
  id v24;
  id v25;
  unint64_t v26;
  objc_super v27;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = [_HDEventsCollectionAssertion alloc];
  if (v13)
  {
    v27.receiver = v13;
    v27.super_class = (Class)_HDEventsCollectionAssertion;
    v14 = -[HDWorkoutEventsManager initWithAssertionIdentifier:ownerIdentifier:](&v27, sel_initWithAssertionIdentifier_ownerIdentifier_, CFSTR("HDWorkoutSessionAssertionIdentifierEventCollection"), v10);
  }
  else
  {
    v14 = 0;
  }
  objc_storeWeak((id *)&self->_eventsDelegate, v12);
  assertionManager = self->_assertionManager;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __112__HDWorkoutEventsManager_takeSessionAssertionWithOwnerIdentifier_activityType_sessionIdentifier_eventsDelegate___block_invoke;
  v22[3] = &unk_1E6CE7D90;
  v22[4] = self;
  v23 = v14;
  v25 = v11;
  v26 = a4;
  v24 = v12;
  v16 = v11;
  v17 = v12;
  v18 = v14;
  if (-[HDAssertionManager takeAssertion:preNotificationBlock:](assertionManager, "takeAssertion:preNotificationBlock:", v18, v22))v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

void __112__HDWorkoutEventsManager_takeSessionAssertionWithOwnerIdentifier_activityType_sessionIdentifier_eventsDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__HDWorkoutEventsManager_takeSessionAssertionWithOwnerIdentifier_activityType_sessionIdentifier_eventsDelegate___block_invoke_2;
  block[3] = &unk_1E6CE7D90;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v11 = *(_QWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  dispatch_sync(v3, block);

}

void __112__HDWorkoutEventsManager_takeSessionAssertionWithOwnerIdentifier_activityType_sessionIdentifier_eventsDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t i;
  objc_class *v11;
  id v12;
  id WeakRetained;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 40);
  v21 = *(id *)(a1 + 48);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    _allEventCollectorClasses();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      v9 = (id *)(v3 + 8);
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          v11 = *(objc_class **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (-[objc_class isAvailableInCurrentHardware](v11, "isAvailableInCurrentHardware")
            && -[objc_class supportsWorkoutActivityType:](v11, "supportsWorkoutActivityType:", v2))
          {
            v12 = [v11 alloc];
            WeakRetained = objc_loadWeakRetained(v9);
            v14 = (void *)objc_msgSend(v12, "initWithProfile:delegate:", WeakRetained, v21);

            objc_msgSend(v4, "addObject:", v14);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  -[_HDEventsCollectionAssertion setEventCollectors:](*(_QWORD *)(a1 + 32), v4);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = *(_QWORD **)(a1 + 32);
  if (v15)
    v15 = (_QWORD *)v15[10];
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "startWithSessionId:", *(_QWORD *)(a1 + 56));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

}

- (void)requestPendingEventsThroughDate:(id)a3 sessionIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke;
  v15[3] = &unk_1E6CE7E08;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

void __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[4];
  id v26;
  _QWORD v27[6];
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activeAssertionsForIdentifier:", CFSTR("HDWorkoutSessionAssertionIdentifierEventCollection"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v34;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(obj);
        v24 = v3;
        v4 = *(_QWORD **)(*((_QWORD *)&v33 + 1) + 8 * v3);
        _HKInitializeLogging();
        v5 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v39 = v6;
          v40 = 2114;
          v41 = v4;
          _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting post-stop events collection for active assertion %{public}@", buf, 0x16u);
        }
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        if (v4)
          v7 = (void *)v4[10];
        else
          v7 = 0;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v30 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v13, "sessionId");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = *(void **)(a1 + 40);

              if (v14 == v15)
              {
                dispatch_group_enter(v2);
                _HKInitializeLogging();
                v16 = *MEMORY[0x1E0CB5380];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                {
                  v17 = *(_QWORD *)(a1 + 32);
                  *(_DWORD *)buf = 138543618;
                  v39 = v17;
                  v40 = 2114;
                  v41 = v13;
                  _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting post-stop events collection for %{public}@", buf, 0x16u);
                }
                v18 = *(_QWORD *)(a1 + 48);
                v27[0] = MEMORY[0x1E0C809B0];
                v27[1] = 3221225472;
                v27[2] = __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke_194;
                v27[3] = &unk_1E6CE7DB8;
                v27[4] = *(_QWORD *)(a1 + 32);
                v27[5] = v13;
                v28 = v2;
                objc_msgSend(v13, "requestPendingEventsThroughDate:completion:", v18, v27);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v10);
        }

        v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      v23 = v19;
    }
    while (v19);
  }
  v20 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke_196;
  block[3] = &unk_1E6CE7DE0;
  v26 = *(id *)(a1 + 56);
  dispatch_group_notify(v2, v20, block);

}

void __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke_194(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  v7 = *MEMORY[0x1E0CB5380];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully finished collecting post-stop events pending for %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to collect post-stop pending events for %{public}@, error: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __87__HDWorkoutEventsManager_requestPendingEventsThroughDate_sessionIdentifier_completion___block_invoke_196(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateEventCollectorsForActivityType:(unint64_t)a3 activityIdentifier:(id)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *queue;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  HDWorkoutEventsManager *v16;
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  HDWorkoutEventsManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x1E0CB5380];
  v8 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating event collectors", buf, 0xCu);
  }
  if (a3 != 83)
  {
    -[HDAssertionManager activeAssertionsForIdentifier:](self->_assertionManager, "activeAssertionsForIdentifier:", CFSTR("HDWorkoutSessionAssertionIdentifierEventCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (objc_msgSend(v9, "count"))
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__HDWorkoutEventsManager_updateEventCollectorsForActivityType_activityIdentifier___block_invoke;
      block[3] = &unk_1E6CE7D90;
      v14 = v9;
      v18 = a3;
      v15 = v10;
      v16 = self;
      v17 = v6;
      dispatch_sync(queue, block);

    }
    else
    {
      _HKInitializeLogging();
      v12 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = self;
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: No active event collector assertions to update", buf, 0xCu);
      }
    }

  }
}

void __82__HDWorkoutEventsManager_updateEventCollectorsForActivityType_activityIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id WeakRetained;
  id v22;
  void *v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  objc_class *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = *(id *)(a1 + 32);
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v40;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(obj);
        v3 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v2);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v28 = v3;
        v29 = v2;
        if (v3)
          v4 = *(void **)(v3 + 80);
        else
          v4 = 0;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v36 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              if ((objc_msgSend((id)objc_opt_class(), "supportsWorkoutActivityType:", *(_QWORD *)(a1 + 64)) & 1) != 0)
                objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
              else
                objc_msgSend(v10, "stop");
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
          }
          while (v7);
        }

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        _allEventCollectorClasses();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v32 != v14)
                objc_enumerationMutation(v11);
              v16 = *(objc_class **)(*((_QWORD *)&v31 + 1) + 8 * j);
              if (-[objc_class supportsWorkoutActivityType:](v16, "supportsWorkoutActivityType:", *(_QWORD *)(a1 + 64)))
              {
                v17 = *(void **)(a1 + 40);
                v30[0] = MEMORY[0x1E0C809B0];
                v30[1] = 3221225472;
                v30[2] = __82__HDWorkoutEventsManager_updateEventCollectorsForActivityType_activityIdentifier___block_invoke_2;
                v30[3] = &__block_descriptor_40_e33_B16__0__HDWorkoutEventCollector_8lu32l8;
                v30[4] = v16;
                if ((objc_msgSend(v17, "hk_containsObjectPassingTest:", v30) & 1) != 0)
                {
                  _HKInitializeLogging();
                  v18 = *MEMORY[0x1E0CB5380];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                  {
                    v19 = *(_QWORD *)(a1 + 48);
                    *(_DWORD *)buf = 138543618;
                    v44 = v19;
                    v45 = 2114;
                    v46 = v16;
                    _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Event collector %{public}@, already exists", buf, 0x16u);
                  }
                }
                else
                {
                  v20 = [v16 alloc];
                  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
                  v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 40));
                  v23 = (void *)objc_msgSend(v20, "initWithProfile:delegate:", WeakRetained, v22);

                  objc_msgSend(*(id *)(a1 + 40), "addObject:", v23);
                  objc_msgSend(v23, "startWithSessionId:", *(_QWORD *)(a1 + 56));

                }
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
          }
          while (v13);
        }

        -[_HDEventsCollectionAssertion setEventCollectors:](v28, *(void **)(a1 + 40));
        v2 = v29 + 1;
      }
      while (v29 + 1 != v27);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      v27 = v24;
    }
    while (v24);
  }

}

uint64_t __82__HDWorkoutEventsManager_updateEventCollectorsForActivityType_activityIdentifier___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HDAssertionManager activeAssertionsForIdentifier:](self->_assertionManager, "activeAssertionsForIdentifier:", CFSTR("HDWorkoutSessionAssertionIdentifierEventCollection"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        if (v12)
          v12 = (_QWORD *)v12[10];
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v20;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v20 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "fakeActivityDetection:workoutActivity:", v6, v7);
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v15);
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (v5)
    v6 = (void *)v5[10];
  else
    v6 = 0;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "stop", (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_eventCollectors;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "unitTest_setCMWorkoutManager:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventsDelegate);
  objc_storeStrong((id *)&self->_eventCollectors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
