@implementation DESRecordStoreManager

- (DESRecordStoreManager)init
{
  DESRecordStoreManager *v2;
  uint64_t v3;
  DESRecordStorePolicyManager *policyManager;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  DESDeviceIdentifierStore *identifierStore;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DESRecordStoreManager;
  v2 = -[DESRecordStoreManager init](&v11, sel_init);
  if (v2)
  {
    +[DESRecordStorePolicyManager sharedInstance](DESRecordStorePolicyManager, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    policyManager = v2->_policyManager;
    v2->_policyManager = (DESRecordStorePolicyManager *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("DESRecordStoreManager", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    identifierStore = v2->_identifierStore;
    v2->_identifierStore = (DESDeviceIdentifierStore *)v8;

  }
  return v2;
}

- (void)fetchCoreDuetEventsForBundleId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  OS_dispatch_queue *queue;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DESRecordStorePolicyManager coreDuetEventQueryForPluginID:](self->_policyManager, "coreDuetEventQueryForPluginID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1B96E5000, v9, OS_LOG_TYPE_INFO, "Running CoreDuet event query %@ for %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);

    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B96E5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FetchCoreDuetEvents", "Fetching CoreDuet events.", buf, 2u);
    }

    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "identifierForBundleId:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    queue = self->_queue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __67__DESRecordStoreManager_fetchCoreDuetEventsForBundleId_completion___block_invoke;
    v20[3] = &unk_1E706EC28;
    v24 = v12;
    v21 = v10;
    v22 = v16;
    v23 = v7;
    v18 = v16;
    v19 = v10;
    objc_msgSend(v19, "executeQuery:responseQueue:withCompletion:", v8, queue, v20);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }

}

void __67__DESRecordStoreManager_fetchCoreDuetEventsForBundleId_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = a1[4];
    *(_DWORD *)buf = 138412290;
    v33 = v8;
    _os_log_impl(&dword_1B96E5000, v7, OS_LOG_TYPE_INFO, "Got response from %@", buf, 0xCu);
  }

  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B96E5000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchCoreDuetEvents", "Finished fetching CoreDuet events.", buf, 2u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = a1;
    v24 = v6;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v5;
    obj = v5;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v18, "metadata");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stream");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          DESAmendedRecordInfo(v19, v21, (void *)v12[5]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setMetadata:", v22);

          objc_msgSend(v13, "addObject:", v18);
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }

    (*(void (**)(void))(v12[6] + 16))();
    v6 = v24;
    v5 = v25;
  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __67__DESRecordStoreManager_fetchCoreDuetEventsForBundleId_completion___block_invoke_cold_1();

    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)fetchRecordSetForBundleId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1B96E5000, v8, OS_LOG_TYPE_INFO, "Fetching records for %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__DESRecordStoreManager_fetchRecordSetForBundleId_completion___block_invoke;
  v11[3] = &unk_1E706EC50;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[DESRecordStoreManager fetchSavedRecordInfoForBundleId:completion:](self, "fetchSavedRecordInfoForBundleId:completion:", v10, v11);

}

void __62__DESRecordStoreManager_fetchRecordSetForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  DESRecordSet *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v13 = -[DESRecordSet initWithNativeRecords:nativeRecordInfo:coreDuetEvents:]([DESRecordSet alloc], "initWithNativeRecords:nativeRecordInfo:coreDuetEvents:", v9, v10, v11);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1B96E5000, v14, OS_LOG_TYPE_INFO, "Fail to fetch records for %@", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)fetchRecordSetSynchronouslyForBundleId:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v7 = dispatch_semaphore_create(0);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __70__DESRecordStoreManager_fetchRecordSetSynchronouslyForBundleId_error___block_invoke;
  v22 = &unk_1E706EC78;
  v25 = &v27;
  v8 = v6;
  v23 = v8;
  v26 = &v33;
  v9 = v7;
  v24 = v9;
  -[DESRecordStoreManager fetchRecordSetForBundleId:completion:](self, "fetchRecordSetForBundleId:completion:", v8, &v19);
  v10 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timeout while fetching DES records for %@"), v8, v19, v20, v21, v22, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1531, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v28[5];
    v28[5] = v14;

  }
  if (a4)
  {
    v16 = (void *)v28[5];
    if (v16)
      *a4 = objc_retainAutorelease(v16);
  }
  v17 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __70__DESRecordStoreManager_fetchRecordSetSynchronouslyForBundleId_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id *v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1BCCC38F0]();
  if (v6)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __70__DESRecordStoreManager_fetchRecordSetSynchronouslyForBundleId_error___block_invoke_cold_1(v6, a1, v9);

    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v11 = a2;
  }
  else
  {
    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v11 = a3;
  }
  objc_storeStrong(v10, v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  objc_autoreleasePoolPop(v8);

}

- (void)fetchSavedRecordInfoForBundleId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  DESRecordStoreManager *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25 = self;
  -[DESRecordStorePolicyManager supportedRecordTypesForPluginID:](self->_policyManager, "supportedRecordTypesForPluginID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v26 = v6;
  objc_msgSend(v9, "identifierForBundleId:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v34;
    do
    {
      v16 = 0;
      v17 = v14;
      do
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v16);
        v32 = v17;
        AddRecordsForType(v18, v7, v10, &v32);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v32;

        if (v19)
        {
          objc_msgSend(v27, "setObject:forKey:", v19, v18);
        }
        else
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v38 = v18;
            v39 = 2112;
            v40 = v14;
            _os_log_error_impl(&dword_1B96E5000, v20, OS_LOG_TYPE_ERROR, "Could not read records for %@: %@", buf, 0x16u);
          }

        }
        ++v16;
        v17 = v14;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __68__DESRecordStoreManager_fetchSavedRecordInfoForBundleId_completion___block_invoke;
  v28[3] = &unk_1E706ECA0;
  v30 = v7;
  v31 = v24;
  v29 = v27;
  v21 = v7;
  v22 = v27;
  v23 = v24;
  -[DESRecordStoreManager fetchCoreDuetEventsForBundleId:completion:](v25, "fetchCoreDuetEventsForBundleId:completion:", v26, v28);

}

uint64_t __68__DESRecordStoreManager_fetchSavedRecordInfoForBundleId_completion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2, a3);
}

- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4
{
  DESDeviceIdentifierStore *identifierStore;
  void (**v6)(id, _QWORD, id);
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  identifierStore = self->_identifierStore;
  v6 = (void (**)(id, _QWORD, id))a4;
  v7 = a3;
  -[DESDeviceIdentifierStore identifierForBundleId:](identifierStore, "identifierForBundleId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0;
  AddRecordsForType(v7, v9, v8, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
    v12 = v9;
  else
    v12 = 0;
  ((void (**)(id, id, id))v6)[2](v6, v12, v11);

}

- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *, _QWORD))a5;
  v11 = 0;
  RecordDataForUUID(a4, a3, (uint64_t)&v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1B96E5000, v10, OS_LOG_TYPE_INFO, "Unable to read record: %@", buf, 0xCu);
    }

    ((void (**)(id, void *, id))v7)[2](v7, 0, v9);
  }

}

- (id)saveRecordToDirPath:(id)a3 data:(id)a4 recordInfo:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v13 = 0;
  if (objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, a6))
  {
    if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v11) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v11, 0, a6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingPathComponent:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAppendingPathExtension:", CFSTR("desdata"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "writeToFile:options:error:", v18, 0x40000000, a6))
        {
          v28 = v18;
          objc_msgSend(v15, "UUIDString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringByAppendingPathComponent:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("json"));
          v21 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v21;
          if ((objc_msgSend(v14, "writeToFile:options:error:", v21, 0x40000000, a6) & 1) != 0)
          {
            v13 = v15;
            v18 = v28;
          }
          else
          {
            v30 = 0;
            v18 = v28;
            v24 = objc_msgSend(v12, "_fides_removeItemAtPath:error:", v28, &v30);
            v25 = v30;
            if ((v24 & 1) == 0)
            {
              +[DESLogging coreChannel](DESLogging, "coreChannel");
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                -[DESRecordStoreManager saveRecordToDirPath:data:recordInfo:error:].cold.1();

            }
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }
      goto LABEL_21;
    }
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[DESRecordStoreManager saveRecordToDirPath:data:recordInfo:error:].cold.2();

    if (a6)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("Record info cannot be converted to JSON");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1506, v14);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

      goto LABEL_22;
    }
    v13 = 0;
  }
LABEL_22:

  return v13;
}

- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, id);
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint8_t buf[8];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, id))a6;
  if (v10 && v11 && v12)
  {
    RecordDirPathForRecordType(v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_generate(v15);

    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B96E5000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "RecordSaving", "Saving Record.", buf, 2u);
    }

    v26 = 0;
    -[DESRecordStoreManager saveRecordToDirPath:data:recordInfo:error:](self, "saveRecordToDirPath:data:recordInfo:error:", v14, v11, v12, &v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v26;
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B96E5000, v22, OS_SIGNPOST_INTERVAL_END, v16, "RecordSaving", "Finished saving record.", buf, 2u);
    }

    if (v19)
    {
      +[DESCoreAnalyticsEventManager sendEventWriteRecordForBundleID:](DESCoreAnalyticsEventManager, "sendEventWriteRecordForBundleID:", v10);
      v13[2](v13, v19, v20);
      GarbageCollectOldRecords(v10);
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[DESRecordStoreManager saveRecordForBundleId:data:recordInfo:completion:].cold.1();

      v13[2](v13, 0, v20);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB28A8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("invalid arguments passed to service; programmer error!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 3328, v14);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v20);
  }

}

- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  unint64_t v28;
  void (**v29)(id, void *);
  void *v30;
  id v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = (void (**)(id, void *))a4;
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v28 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B96E5000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DeleteAllRecords", "Deleting all records.", buf, 2u);
  }
  spid = v7;

  v30 = v5;
  RecordDirPathForRecordType(v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v32 = (void *)v10;
  objc_msgSend(v31, "enumeratorAtPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v11, "skipDescendants", spid);
        objc_msgSend(v17, "pathExtension");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("json")) & 1) != 0
          || objc_msgSend(v18, "isEqualToString:", CFSTR("desdata")))
        {
          objc_msgSend(v32, "stringByAppendingPathComponent:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0;
          v20 = objc_msgSend(v31, "_fides_removeItemAtPath:error:", v19, &v33);
          v21 = v33;

          if ((v20 & 1) == 0)
          {
            v22 = v21;

            +[DESLogging coreChannel](DESLogging, "coreChannel");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v39 = v17;
              v40 = 2112;
              v41 = v22;
              _os_log_error_impl(&dword_1B96E5000, v23, OS_LOG_TYPE_ERROR, "Could not delete %@: %@", buf, 0x16u);
            }

            v14 = v22;
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }
  +[DESLogging coreChannel](DESLogging, "coreChannel", spid);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B96E5000, v25, OS_SIGNPOST_INTERVAL_END, spida, "DeleteAllRecords", "Finished deleting all records.", buf, 2u);
  }

  v29[2](v29, v14);
}

- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD);
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  int v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  os_signpost_id_t spid;
  id v30;
  id v31;
  uint8_t buf[16];

  v7 = (void (**)(id, _QWORD))a5;
  v8 = a4;
  v9 = a3;
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B96E5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "DeleteRecord", "Deleting record.", buf, 2u);
  }
  spid = v11;

  RecordDirPathForRecordType(v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v8, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringByAppendingPathComponent:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringByAppendingPathExtension:", CFSTR("json"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v20 = objc_msgSend(v16, "_fides_removeItemAtPath:error:", v19, &v31);
  v21 = v31;

  objc_msgSend(v18, "stringByAppendingPathExtension:", CFSTR("desdata"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v23 = objc_msgSend(v16, "_fides_removeItemAtPath:error:", v22, &v30);
  v24 = v30;

  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B96E5000, v26, OS_SIGNPOST_INTERVAL_END, spid, "DeleteRecord", "Finished deleting record.", buf, 2u);
  }

  if (v23)
    v27 = 0;
  else
    v27 = v24;
  if (v20)
    v28 = v27;
  else
    v28 = v21;
  ((void (**)(id, id))v7)[2](v7, v28);

}

- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  OS_dispatch_queue *queue;
  id v15;
  _QWORD v16[4];
  id v17;
  os_signpost_id_t v18;
  uint8_t buf[16];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B96E5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SaveCoreDuetEvent", "Saving core duet event.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__DESRecordStoreManager_saveCoreDuetEvent_completion___block_invoke;
  v16[3] = &unk_1E706ECC8;
  v17 = v7;
  v18 = v9;
  v15 = v7;
  objc_msgSend(v12, "saveObjects:responseQueue:withCompletion:", v13, queue, v16);

}

void __54__DESRecordStoreManager_saveCoreDuetEvent_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];

  v4 = a3;
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B96E5000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SaveCoreDuetEvent", "Finished saving core duet event.", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)recordDirURLsForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESRecordStorePolicyManager supportedRecordTypesForPluginID:](self->_policyManager, "supportedRecordTypesForPluginID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        RecordDirURLForRecordType(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_policyManager, 0);
}

void __67__DESRecordStoreManager_fetchCoreDuetEventsForBundleId_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "Failed to fetch CoreDuet events %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__DESRecordStoreManager_fetchRecordSetSynchronouslyForBundleId_error___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2_1();
  v6 = 2112;
  v7 = v4;
  _os_log_debug_impl(&dword_1B96E5000, a3, OS_LOG_TYPE_DEBUG, "Fetch %lu DES records for %@", v5, 0x16u);
}

- (void)saveRecordToDirPath:data:recordInfo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "Unable to delete failed record data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveRecordToDirPath:data:recordInfo:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "Record info cannot be converted to JSON: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveRecordForBundleId:data:recordInfo:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2(&dword_1B96E5000, v0, v1, "Fail to saveRecordForBundleId with bundleId=%@, error=%@");
  OUTLINED_FUNCTION_1();
}

@end
