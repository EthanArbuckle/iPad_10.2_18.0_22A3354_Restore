@implementation DDSAssertionTracker

- (DDSAssertionTracker)initWithDataHandler:(id)a3
{
  id v5;
  DDSAssertionTracker *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v11;
  NSMutableDictionary *assertionUpdateStatus;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DDSAssertionTracker;
  v6 = -[DDSAssertionTracker init](&v14, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.DataDeliveryServices.DDSAssertionTracker", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_dataHandler, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assertionUpdateStatus = v6->_assertionUpdateStatus;
    v6->_assertionUpdateStatus = v11;

  }
  return v6;
}

- (id)allAssertions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[DDSAssertionTracker queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__DDSAssertionTracker_allAssertions__block_invoke;
  v6[3] = &unk_1EA141C48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __36__DDSAssertionTracker_allAssertions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "trackedAssertions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)assertionDueForUpdateSinceDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  -[DDSAssertionTracker queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__DDSAssertionTracker_assertionDueForUpdateSinceDate___block_invoke;
  block[3] = &unk_1EA141C70;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__DDSAssertionTracker_assertionDueForUpdateSinceDate___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "trackedAssertions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assertionDueForUpdateFrom:SinceDate:", v6, a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)assertionDueForUpdateFrom:(id)a3 SinceDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "policy", (_QWORD)v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "preferredDownloadFrequency");

        -[DDSAssertionTracker intervalForDownloadFrequency:](self, "intervalForDownloadFrequency:", v16);
        v18 = v17;
        objc_msgSend(v14, "lastUpdated");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          objc_msgSend(v14, "lastUpdated");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timeIntervalSinceDate:", v21);
          v23 = v22;

          if (v23 <= v18)
            continue;
        }
        objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)resetAssertionDueDatesForAssetType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DDSAssertionTracker queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__DDSAssertionTracker_resetAssertionDueDatesForAssetType___block_invoke;
  block[3] = &unk_1EA1412F0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __58__DDSAssertionTracker_resetAssertionDueDatesForAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "trackedAssertions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "query");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "assetType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v10)
          objc_msgSend(v7, "setLastUpdated:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "dataHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trackedAssertions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveAssertionData:", v12);

}

- (void)addAssertionForQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  DDSAssertionTracker *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__4;
  v48 = __Block_byref_object_dispose__4;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  v39 = 0;
  -[DDSAssertionTracker queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __72__DDSAssertionTracker_addAssertionForQuery_policy_assertionID_clientID___block_invoke;
  v25 = &unk_1EA141C98;
  v26 = self;
  v15 = v10;
  v27 = v15;
  v31 = &v34;
  v16 = v12;
  v28 = v16;
  v17 = v13;
  v29 = v17;
  v18 = v11;
  v30 = v18;
  v32 = &v40;
  v33 = &v44;
  dispatch_sync(v14, &v22);

  if (!*((_BYTE *)v41 + 24))
  {
    -[DDSAssertionTracker delegate](self, "delegate", v22, v23, v24, v25, v26, v27, v28, v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v45[5]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleNewAssertions:", v20);

  }
  if (v35[5])
  {
    -[DDSAssertionTracker delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleAddedNewDescriptor:forAssertion:", v35[5], v45[5]);

  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

}

void __72__DDSAssertionTracker_addAssertionForQuery_policy_assertionID_clientID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  DDSAssertion *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "trackedAssertions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "query");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToAssetQuery:", *(_QWORD *)(a1 + 40));

        if (v9)
        {
          objc_msgSend(v7, "addDescriptorWithAssertionID:clientID:policy:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v12 = *(void **)(v11 + 40);
          *(_QWORD *)(v11 + 40) = v10;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v13 = -[DDSAssertion initWithQuery:]([DDSAssertion alloc], "initWithQuery:", *(_QWORD *)(a1 + 40));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addDescriptorWithAssertionID:clientID:policy:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    objc_msgSend(*(id *)(a1 + 32), "trackedAssertions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));

  }
  DefaultLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v22 = *(_QWORD *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v31 = v21;
    v32 = 2114;
    v33 = v22;
    v34 = 2114;
    v35 = v23;
    _os_log_impl(&dword_1DA990000, v20, OS_LOG_TYPE_DEFAULT, "Add assertion (%{public}@) with id (%{public}@) for client (%{public}@)", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "dataHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trackedAssertions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "saveAssertionData:", v25);

}

- (void)removeAssertionWithID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  DDSAssertionTracker *v18;
  uint64_t *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v20 = 0;
  v21[0] = &v20;
  v21[1] = 0x3032000000;
  v21[2] = __Block_byref_object_copy__4;
  v21[3] = __Block_byref_object_dispose__4;
  v22 = 0;
  -[DDSAssertionTracker queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__DDSAssertionTracker_removeAssertionWithID___block_invoke;
  block[3] = &unk_1EA141C20;
  v6 = v4;
  v17 = v6;
  v18 = self;
  v19 = &v20;
  dispatch_sync(v5, block);

  DefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DDSAssertionTracker removeAssertionWithID:].cold.1((uint64_t)v21, v7, v8, v9, v10, v11, v12, v13);

  if (*(_QWORD *)(v21[0] + 40))
  {
    -[DDSAssertionTracker delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(v21[0] + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleRemovedAssertions:", v15);

  }
  _Block_object_dispose(&v20, 8);

}

void __45__DDSAssertionTracker_removeAssertionWithID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[4];
  uint64_t v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  DefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v37 = v3;
    _os_log_impl(&dword_1DA990000, v2, OS_LOG_TYPE_DEFAULT, "Remove assertion with id: %{public}@", buf, 0xCu);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "trackedAssertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v30;
    *(_QWORD *)&v6 = 138543362;
    v28 = v6;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v10, "assertionIdentifiers", v28);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 32));

        if (v12)
        {
          objc_msgSend(v10, "removeDescriptorWithAssertionID:", *(_QWORD *)(a1 + 32));
          DefaultLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v17 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = v28;
            v37 = v17;
            _os_log_debug_impl(&dword_1DA990000, v13, OS_LOG_TYPE_DEBUG, "Removed descriptor id: %{public}@", buf, 0xCu);
          }

        }
        objc_msgSend(v10, "descriptors");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (!v15)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);
          DefaultLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            __45__DDSAssertionTracker_removeAssertionWithID___block_invoke_cold_1(a1 + 48, v18, v19, v20, v21, v22, v23, v24);

          goto LABEL_21;
        }
        DefaultLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __45__DDSAssertionTracker_removeAssertionWithID___block_invoke_cold_2(v33, v10, &v34, v16);

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_21:

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "trackedAssertions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
  objc_msgSend(*(id *)(a1 + 40), "dataHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "trackedAssertions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "saveAssertionData:", v27);

}

- (void)didUpdateAssertion:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  DDSAssertionTracker *v14;

  v6 = a3;
  v7 = a4;
  -[DDSAssertionTracker queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DDSAssertionTracker_didUpdateAssertion_atDate___block_invoke;
  block[3] = &unk_1EA141BF8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __49__DDSAssertionTracker_didUpdateAssertion_atDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  DefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1DA990000, v2, OS_LOG_TYPE_DEFAULT, "Setting last updated for assertion (%{public}@) set to (%{public}@)", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setLastUpdated:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "dataHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "trackedAssertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveAssertionData:", v6);

}

- (id)assertionForQuery:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  -[DDSAssertionTracker queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__DDSAssertionTracker_assertionForQuery___block_invoke;
  block[3] = &unk_1EA141C20;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __41__DDSAssertionTracker_assertionForQuery___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "trackedAssertions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "query");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToAssetQuery:", *(_QWORD *)(a1 + 40));

        if (v9)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (NSMutableArray)trackedAssertions
{
  NSMutableArray *trackedAssertions;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;

  trackedAssertions = self->_trackedAssertions;
  if (!trackedAssertions)
  {
    -[DDSAssertionTracker dataHandler](self, "dataHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadAssertionData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
    v7 = self->_trackedAssertions;
    self->_trackedAssertions = v6;

    trackedAssertions = self->_trackedAssertions;
  }
  return trackedAssertions;
}

- (double)intervalForDownloadFrequency:(int64_t)a3
{
  double result;

  result = 86400.0;
  if (a3 != 1)
    result = 0.0;
  if (a3 == 2)
    return 604800.0;
  return result;
}

- (id)trackedAssetTypes
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[DDSAssertionTracker queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__DDSAssertionTracker_trackedAssetTypes__block_invoke;
  v9[3] = &unk_1EA1412F0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __40__DDSAssertionTracker_trackedAssetTypes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "trackedAssertions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "query");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "assetType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)assertionIDsForClientID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[DDSAssertionTracker queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__DDSAssertionTracker_assertionIDsForClientID___block_invoke;
  block[3] = &unk_1EA141BF8;
  block[4] = self;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  dispatch_sync(v6, block);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __47__DDSAssertionTracker_assertionIDsForClientID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "trackedAssertions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "assertionIDsForClientID:", *(_QWORD *)(a1 + 48));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "unionSet:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)modifyUpdateStatusForAssertion:(id)a3 toStatus:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[DDSAssertionTracker queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__DDSAssertionTracker_modifyUpdateStatusForAssertion_toStatus___block_invoke;
  block[3] = &unk_1EA141CC0;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __63__DDSAssertionTracker_modifyUpdateStatusForAssertion_toStatus___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "assertionUpdateStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(*(id *)(a1 + 40), "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  objc_msgSend(v6, "setObject:forKey:", v2, v5);

}

- (int64_t)updateStatusForAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[DDSAssertionTracker queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__DDSAssertionTracker_updateStatusForAssertion___block_invoke;
  block[3] = &unk_1EA141C70;
  v14 = &v15;
  block[4] = self;
  v6 = v4;
  v13 = v6;
  dispatch_sync(v5, block);

  DefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "assertionIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16[3];
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2048;
    v22 = v9;
    _os_log_impl(&dword_1DA990000, v7, OS_LOG_TYPE_DEFAULT, "Asset Download UI updateStatusForAssertion for Assertion: (%{public}@), status: (%ld)", buf, 0x16u);

  }
  v10 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __48__DDSAssertionTracker_updateStatusForAssertion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "assertionUpdateStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(*(id *)(a1 + 40), "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUnsignedInteger:", objc_msgSend(v3, "hash"));
  objc_msgSend(v6, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (int)objc_msgSend(v5, "intValue");

}

- (DDSAssetTrackingDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)assertionUpdateStatus
{
  return self->_assertionUpdateStatus;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)trackedAssertionSets
{
  return self->_trackedAssertionSets;
}

- (DDSAssertionDataHandling)dataHandler
{
  return self->_dataHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataHandler, 0);
  objc_storeStrong((id *)&self->_trackedAssertionSets, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertionUpdateStatus, 0);
  objc_storeStrong((id *)&self->_trackedAssertions, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)removeAssertionWithID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1DA990000, a2, a3, "Calling delegate to remove assertion: %{public}@", a5, a6, a7, a8, 2u);
}

void __45__DDSAssertionTracker_removeAssertionWithID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1DA990000, a2, a3, "Removing assertion: %{public}@", a5, a6, a7, a8, 2u);
}

void __45__DDSAssertionTracker_removeAssertionWithID___block_invoke_cold_2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "descriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl(&dword_1DA990000, a4, OS_LOG_TYPE_DEBUG, "Descriptors: %{public}@", a1, 0xCu);

}

@end
