@implementation _ATXDuetHelper

+ (_ATXDuetHelper)sharedInstance
{
  if (sharedInstance__pasOnceToken8[0] != -1)
    dispatch_once(sharedInstance__pasOnceToken8, &__block_literal_global_139);
  return (_ATXDuetHelper *)(id)sharedInstance__pasExprOnceResult_32;
}

- (id)_queryDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75___ATXDuetHelper__queryDuetStream_startDate_endDate_otherPredicates_limit___block_invoke;
  v19[3] = &unk_1E82E3E98;
  v17 = v16;
  v20 = v17;
  -[_ATXDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:", v15, v14, v13, v12, a7, 1, v19);

  return v17;
}

- (void)_enumerateBatchesInDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 ascending:(BOOL)a8 block:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  -[_ATXDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:batchSize:ascending:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:batchSize:ascending:block:", a3, a4, a5, a6, a7, 200, v9, a9);
}

- (void)_enumerateBatchesInDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 batchSize:(unint64_t)a8 ascending:(BOOL)a9 block:(id)a10
{
  id v17;
  void (**v18)(id, void *);
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  void *v33;
  os_signpost_id_t spid;
  unint64_t v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v37 = a4;
  v36 = a5;
  v17 = a6;
  v18 = (void (**)(id, void *))a10;
  if (!a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDuetHelper.m"), 590, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit > 0"));

  }
  pthread_mutex_lock(&_enumerateBatchesInDuetStream_startDate_endDate_otherPredicates_limit_batchSize_ascending_block__duetLock);
  __atxlog_handle_default();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_generate(v19);

  __atxlog_handle_default();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v35 = v20 - 1;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    objc_msgSend(v38, "name");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v40 = objc_msgSend(v23, "UTF8String");
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "DuetQuery", "Stream=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);

  }
  spid = v20;

  v24 = 0;
  do
  {
    if ((uint64_t)a7 < 1)
      break;
    v25 = (void *)MEMORY[0x1CAA48B6C]();
    if (a7 >= a8)
      v26 = a8;
    else
      v26 = a7;
    -[_ATXDuetHelper _queryDuetStreamUnbatched:startDate:endDate:ascending:otherPredicates:limit:offset:](self, "_queryDuetStreamUnbatched:startDate:endDate:ascending:otherPredicates:limit:offset:", v38, v37, v36, a9, v17, v26, v24, spid);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v18[2](v18, v27);
      a7 -= objc_msgSend(v27, "count");
      v24 += objc_msgSend(v27, "count");
    }
    v28 = objc_msgSend(v27, "count");

    objc_autoreleasePoolPop(v25);
  }
  while (v28);
  __atxlog_handle_default();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    objc_msgSend(v38, "name");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = objc_msgSend(v31, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v40 = v32;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v30, OS_SIGNPOST_INTERVAL_END, spid, "DuetQuery", "Stream=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);

  }
  pthread_mutex_unlock(&_enumerateBatchesInDuetStream_startDate_endDate_otherPredicates_limit_batchSize_ascending_block__duetLock);

}

- (id)_queryDuetStreamUnbatched:(id)a3 startDate:(id)a4 endDate:(id)a5 ascending:(BOOL)a6 otherPredicates:(id)a7 limit:(unint64_t)a8 offset:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  SEL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v31;
  void *v32;
  _ATXDuetHelper *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  unint64_t v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  if (!a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDuetHelper.m"), 634, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit > 0"));

  }
  v20 = 0;
  v33 = self;
  if (v17 && v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate > %@ AND startDate < %@) OR (endDate > %@ AND endDate < %@)"), v17, v18, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = a2;
  if (objc_msgSend(v19, "count"))
  {
    v22 = (void *)MEMORY[0x1E0CB3528];
    if (v20)
    {
      objc_msgSend(v19, "arrayByAddingObject:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = v19;
    }
    objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
  }
  else
  {
    v24 = v20;
  }
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v21, v33, CFSTR("_ATXDuetHelper.m"), 642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchPredicate"));

  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__64;
  v45 = __Block_byref_object_dispose__64;
  v46 = 0;
  v25 = (void *)MEMORY[0x1CAA48B6C]();
  +[ATXDuetKnowledgeStoreManager sharedInstance](ATXDuetKnowledgeStoreManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __101___ATXDuetHelper__queryDuetStreamUnbatched_startDate_endDate_ascending_otherPredicates_limit_offset___block_invoke;
  v34[3] = &unk_1E82E5BA8;
  v40 = a6;
  v27 = v24;
  v35 = v27;
  v28 = v16;
  v38 = a9;
  v39 = a8;
  v36 = v28;
  v37 = &v41;
  objc_msgSend(v26, "runBlock:", v34);

  objc_autoreleasePoolPop(v25);
  v29 = (id)v42[5];
  _Block_object_dispose(&v41, 8);

  return v29;
}

- (_ATXDuetHelper)init
{
  _ATXDuetHelper *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _PASLock *deletionHandlerLock;
  id v8;
  void *v9;
  uint64_t v10;
  _PASLock *rootOfAppDataLock;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_ATXDuetHelper;
  v2 = -[_ATXDuetHelper init](&v18, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)objc_opt_new();
    v3[1] = 1;
    v4 = objc_opt_new();
    v5 = (void *)v3[2];
    v3[2] = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v3);
    deletionHandlerLock = v2->_deletionHandlerLock;
    v2->_deletionHandlerLock = (_PASLock *)v6;

    v8 = objc_alloc(MEMORY[0x1E0D815F0]);
    v9 = (void *)objc_opt_new();
    v10 = objc_msgSend(v8, "initWithGuardedData:", v9);
    rootOfAppDataLock = v2->_rootOfAppDataLock;
    v2->_rootOfAppDataLock = (_PASLock *)v10;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D15B80];
    objc_msgSend(v12, "addObserver:selector:name:object:suspensionBehavior:", v2, sel__handleTombstoneCreationWithNotification_, *MEMORY[0x1E0D15B80], *MEMORY[0x1E0D15B98], 2);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:suspensionBehavior:", v2, sel__handleTombstoneCreationWithNotification_, v13, v16, 2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D15B80];
  objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v6);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, v4, *MEMORY[0x1E0D15B98]);

  v8.receiver = self;
  v8.super_class = (Class)_ATXDuetHelper;
  -[_ATXDuetHelper dealloc](&v8, sel_dealloc);
}

- (void)enumerateRelevantShortcutsAndBundleIdsBetweenStartDate:(id)a3 endDate:(id)a4 limit:(unint64_t)a5 block:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *context;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, void *))a6;
  context = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appRelevantShortcutsStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v11;
  v30 = v10;
  -[_ATXDuetHelper _queryDuetStream:startDate:endDate:otherPredicates:limit:](self, "_queryDuetStream:startDate:endDate:otherPredicates:limit:", v13, v10, v11, 0, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v20, "atx_efficientRelevantShortcut");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          if (v22)
          {
            v12[2](v12, v22, v24);
          }
          else
          {
            __atxlog_handle_default();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v36 = "-[_ATXDuetHelper enumerateRelevantShortcutsAndBundleIdsBetweenStartDate:endDate:limit:block:]";
              v37 = 2112;
              v38 = v24;
              _os_log_error_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_ERROR, "%s: nil relevant shortcut for appRelevantShortcutsStream _DKEvent with bundleId %@", buf, 0x16u);
            }

          }
        }
        else
        {
          __atxlog_handle_default();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v20, "description");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v36 = "-[_ATXDuetHelper enumerateRelevantShortcutsAndBundleIdsBetweenStartDate:endDate:limit:block:]";
            v37 = 2112;
            v38 = v27;
            _os_log_error_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_ERROR, "%s: Found nil bundleId for appRelevantShortcutsStream _DKEvent %@", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(v21);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v17);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_computeRootOfAppDataWithLockWitness:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  ATXRootOfAppDataWithHashes *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *context;
  uint64_t v37;
  _QWORD *v38;
  ATXRootOfAppDataWithHashes *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  ATXRootOfAppDataWithHashes *v46;
  id v47;
  uint64_t *v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  context = (void *)MEMORY[0x1CAA48B6C]();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blobOfType:", 2);
  v37 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v37;
  if (v37)
  {
    v39 = -[ATXRootOfAppDataWithHashes initWithSerialized:]([ATXRootOfAppDataWithHashes alloc], "initWithSerialized:", v37);
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v49 = 0;
    v50 = (id *)&v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__64;
    v53 = __Block_byref_object_dispose__64;
    v54 = 0;
    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D15AF8], "appActivityStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __55___ATXDuetHelper__computeRootOfAppDataWithLockWitness___block_invoke;
    v45[3] = &unk_1E82E59B8;
    v48 = &v49;
    v39 = v6;
    v46 = v39;
    v40 = v7;
    v47 = v40;
    -[_ATXDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:", v8, v9, v10, 0, 1000000, 1, v45);

    v34 = objc_alloc_init(MEMORY[0x1E0CF8EE0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v34, "getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:limit:INIntentFilter:linkActionFilter:", v11, v12, 2, 0, 0, 1000000, 0, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "removeAllObjects");
    if (v35)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v13 = v35;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v59, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v42 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            v18 = (void *)MEMORY[0x1CAA48B6C]();
            objc_msgSend(v17, "action");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "intent");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "atx_hashApproximately");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            +[_ATXActionUtils sha256hex:](_ATXActionUtils, "sha256hex:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "bundleId");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v22)
              v25 = v23 == 0;
            else
              v25 = 1;
            if (!v25)
            {
              if (!v50[5] || (objc_msgSend(v23, "isEqualToString:") & 1) == 0)
              {
                __atxlog_handle_default();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v56 = v24;
                  v57 = 2112;
                  v58 = v22;
                  _os_log_debug_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEBUG, "CharlesLog, recordSessionWithBundleId,hash:%@,%@", buf, 0x16u);
                }

                -[ATXRootOfAppDataWithHashes recordSessionWithBundleId:firstAction:](v39, "recordSessionWithBundleId:firstAction:", v24, v22);
                objc_storeStrong(v50 + 5, v24);
              }
              if ((objc_msgSend(v40, "containsObject:", v22) & 1) == 0)
              {
                objc_msgSend(v40, "addObject:", v22);
                -[ATXRootOfAppData recordDocFreqWithBundleId:hasAction:](v39, "recordDocFreqWithBundleId:hasAction:", v24, v22);
              }
            }

            objc_autoreleasePoolPop(v18);
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v59, 16);
        }
        while (v14);
      }

    }
    +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXRootOfAppDataWithHashes serialize](v39, "serialize");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "writeBlob:type:expirationDate:", v28, 2, v29);

    _Block_object_dispose(&v49, 8);
    v5 = 0;
  }

  objc_autoreleasePoolPop(context);
  v30 = (void *)v38[1];
  v38[1] = v39;
  v31 = v39;

  v32 = objc_opt_new();
  v33 = (void *)v38[2];
  v38[2] = v32;

}

- (unint64_t)getDocFreqFor:(id)a3 contentKey:(id)a4
{
  id v6;
  id v7;
  _PASLock *rootOfAppDataLock;
  id v9;
  id v10;
  unint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _ATXDuetHelper *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  rootOfAppDataLock = self->_rootOfAppDataLock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43___ATXDuetHelper_getDocFreqFor_contentKey___block_invoke;
  v13[3] = &unk_1E82E59E0;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v16 = self;
  v17 = &v18;
  v15 = v10;
  -[_PASLock runWithLockAcquired:](rootOfAppDataLock, "runWithLockAcquired:", v13);
  v11 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4
{
  return -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:bundleIdFilter:limit:batchSize:](self, "getAppLaunchesBetweenStartDate:endDate:bundleIdFilter:limit:batchSize:", a3, a4, 0, 1000000, 200);
}

- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4 batchSize:(unint64_t)a5
{
  return -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:bundleIdFilter:limit:batchSize:](self, "getAppLaunchesBetweenStartDate:endDate:bundleIdFilter:limit:batchSize:", a3, a4, 0, 1000000, a5);
}

- (id)getFirstAppLaunchBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5
{
  void *v5;
  void *v6;

  -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:bundleIdFilter:limit:](self, "getAppLaunchesBetweenStartDate:endDate:bundleIdFilter:limit:", a3, a4, a5, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getLastAppLaunchBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _ATXAppLaunch *v17;
  void *v18;
  void *v19;
  void *v20;
  _ATXAppLaunch *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValue:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXDuetHelper _queryDuetStreamUnbatched:startDate:endDate:ascending:otherPredicates:limit:offset:](self, "_queryDuetStreamUnbatched:startDate:endDate:ascending:otherPredicates:limit:offset:", v12, v8, v9, 0, v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [_ATXAppLaunch alloc];
    objc_msgSend(v16, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_ATXAppLaunch initWithBundleId:startDate:endDate:timeZone:reason:](v17, "initWithBundleId:startDate:endDate:timeZone:reason:", v10, v18, v19, v20, 0);

  }
  else
  {
    v21 = 0;
  }

  objc_autoreleasePoolPop(v11);
  return v21;
}

- (id)getAppLaunchesFromUsageBetweenStartDate:(id)a3 endDate:(id)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  unint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5)
    v10 = a5;
  else
    v10 = 1000000;
  v11 = (void *)MEMORY[0x1CAA48B6C]();
  v12 = (void *)MEMORY[0x1E0CB3528];
  v13 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D159A0], "extensionHostIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateForObjectsWithMetadataKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "notPredicateWithSubpredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72___ATXDuetHelper_getAppLaunchesFromUsageBetweenStartDate_endDate_limit___block_invoke;
  v22[3] = &unk_1E82E5A08;
  v20 = v17;
  v23 = v20;
  v24 = v10;
  -[_ATXDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:", v18, v8, v9, v19, 1000000, 1, v22);

  objc_autoreleasePoolPop(v11);
  return v20;
}

- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 limit:(unint64_t)a6
{
  return -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:bundleIdFilter:limit:batchSize:](self, "getAppLaunchesBetweenStartDate:endDate:bundleIdFilter:limit:batchSize:", a3, a4, a5, a6, 200);
}

- (id)getAppLaunchesBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 limit:(unint64_t)a6 batchSize:(unint64_t)a7
{
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
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v27;
  void *context;
  _QWORD v30[4];
  id v31;
  id v32;
  unint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!a6)
    a6 = 1000000;
  context = (void *)MEMORY[0x1CAA48B6C]();
  v14 = (void *)MEMORY[0x1E0CB3528];
  v15 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D159A0], "extensionHostIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateForObjectsWithMetadataKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notPredicateWithSubpredicate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appInFocusStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __88___ATXDuetHelper_getAppLaunchesBetweenStartDate_endDate_bundleIdFilter_limit_batchSize___block_invoke;
  v30[3] = &unk_1E82E5A30;
  v22 = v13;
  v31 = v22;
  v23 = v19;
  v32 = v23;
  v33 = a6;
  LOBYTE(v27) = 1;
  -[_ATXDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:batchSize:ascending:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:batchSize:ascending:block:", v20, v11, v12, v21, 1000000, a7, v27, v30);

  v24 = v32;
  v25 = v23;

  objc_autoreleasePoolPop(context);
  return v25;
}

- (id)getScreenTransitionsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithIntegerValue:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1CAA48B6C]();
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D15AF8], "displayIsBacklit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63___ATXDuetHelper_getScreenTransitionsBetweenStartDate_endDate___block_invoke;
  v15[3] = &unk_1E82E3E98;
  v13 = v10;
  v16 = v13;
  -[_ATXDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:", v11, v6, v7, v12, 1000000, 1, v15);

  objc_autoreleasePoolPop(v9);
  return v13;
}

- (void)enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate:(id)a3 endDate:(id)a4 batchSize:(unint64_t)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *context;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  context = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15B08], "eventStreamName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateForObjectsWithMetadataKey:andStringValue:", v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15AF8], "tombstoneStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __102___ATXDuetHelper_enumerateBatchedIntentDeletionUUIDsAndDatesBetweenStartdate_endDate_batchSize_block___block_invoke;
  v23[3] = &unk_1E82E2740;
  v20 = v12;
  v24 = v20;
  LOBYTE(v21) = 1;
  -[_ATXDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:batchSize:ascending:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:batchSize:ascending:block:", v18, v10, v11, v19, 1000000, a5, v21, v23);

  objc_autoreleasePoolPop(context);
}

- (void)enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate:(id)a3 endDate:(id)a4 batchSize:(unint64_t)a5 block:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *context;
  _QWORD v29[4];
  id v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a6;
  context = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0D15AF8], "appActivityStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15B08], "eventStreamName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateForObjectsWithMetadataKey:andStringValue:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15998], "isEligibleForPrediction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateForObjectsWithMetadataKey:andIntegerValue:", v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CB3528];
  v32[0] = v15;
  v32[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15AF8], "tombstoneStream");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __112___ATXDuetHelper_enumerateBatchedEligibleActivityDeletionUUIDsAndDatesBetweenStartDate_endDate_batchSize_block___block_invoke;
  v29[3] = &unk_1E82E2740;
  v24 = v10;
  v30 = v24;
  LOBYTE(v25) = 1;
  -[_ATXDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:batchSize:ascending:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:batchSize:ascending:block:", v22, v8, v9, v23, 1000000, a5, v25, v29);

  objc_autoreleasePoolPop(context);
}

- (void)_handleTombstoneCreationWithNotification:(id)a3
{
  NSObject *v4;

  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_ATXDuetHelper _handleTombstoneCreationWithNotification:].cold.1(v4);

  -[_PASLock runWithLockAcquired:](self->_deletionHandlerLock, "runWithLockAcquired:", &__block_literal_global_62_2);
}

- (unint64_t)registerDeletionHandler:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _PASLock *deletionHandlerLock;
  id v11;
  id v12;
  unint64_t v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDuetHelper.m"), 479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDuetHelper.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  deletionHandlerLock = self->_deletionHandlerLock;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48___ATXDuetHelper_registerDeletionHandler_queue___block_invoke;
  v17[3] = &unk_1E82E5B38;
  v20 = &v21;
  v11 = v9;
  v18 = v11;
  v12 = v7;
  v19 = v12;
  -[_PASLock runWithLockAcquired:](deletionHandlerLock, "runWithLockAcquired:", v17);
  v13 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)deregisterDeletionHandlerWithToken:(unint64_t)a3
{
  _PASLock *deletionHandlerLock;
  _QWORD v4[5];

  deletionHandlerLock = self->_deletionHandlerLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53___ATXDuetHelper_deregisterDeletionHandlerWithToken___block_invoke;
  v4[3] = &__block_descriptor_40_e36_v16__0__ATXDuetCallbackGuardedData_8l;
  v4[4] = a3;
  -[_PASLock runWithLockAcquired:](deletionHandlerLock, "runWithLockAcquired:", v4);
}

- (id)getMicroLocationsFromLastMonth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -2419200.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48___ATXDuetHelper_getMicroLocationsFromLastMonth__block_invoke;
  v9[3] = &unk_1E82E3E98;
  v7 = v6;
  v10 = v7;
  -[_ATXDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:", v5, v4, v3, 0, 1000000, 1, v9);

  return v7;
}

- (id)getMostRecentMicroLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXDuetHelper _queryDuetStreamUnbatched:startDate:endDate:ascending:otherPredicates:limit:offset:](self, "_queryDuetStreamUnbatched:startDate:endDate:ascending:otherPredicates:limit:offset:", v6, v5, v4, 0, 0, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  microLocationEventFromDK(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v9;
}

- (unint64_t)_countDuetStream:(id)a3 startDate:(id)a4 endDate:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[1] = 3221225472;
  v18[2] = __75___ATXDuetHelper__countDuetStream_startDate_endDate_otherPredicates_limit___block_invoke;
  v18[3] = &unk_1E82E5B80;
  v18[4] = &v19;
  v18[0] = MEMORY[0x1E0C809B0];
  -[_ATXDuetHelper _enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:](self, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:", v12, v13, v14, v15, a7, 1, v18);
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (void)_enumerateBatchesInDuetStream:(id)a3 creationDateStart:(id)a4 creationDateEnd:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 ascending:(BOOL)a8 block:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  -[_ATXDuetHelper _enumerateBatchesInDuetStream:creationDateStart:creationDateEnd:otherPredicates:limit:batchSize:ascending:block:](self, "_enumerateBatchesInDuetStream:creationDateStart:creationDateEnd:otherPredicates:limit:batchSize:ascending:block:", a3, a4, a5, a6, a7, 200, v9, a9);
}

- (void)_enumerateBatchesInDuetStream:(id)a3 creationDateStart:(id)a4 creationDateEnd:(id)a5 otherPredicates:(id)a6 limit:(unint64_t)a7 batchSize:(unint64_t)a8 ascending:(BOOL)a9 block:(id)a10
{
  id v17;
  void (**v18)(id, void *);
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  void *v33;
  os_signpost_id_t spid;
  unint64_t v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v37 = a4;
  v36 = a5;
  v17 = a6;
  v18 = (void (**)(id, void *))a10;
  if (!a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDuetHelper.m"), 700, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit > 0"));

  }
  pthread_mutex_lock(&_enumerateBatchesInDuetStream_creationDateStart_creationDateEnd_otherPredicates_limit_batchSize_ascending_block__duetLock);
  __atxlog_handle_default();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_generate(v19);

  __atxlog_handle_default();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v35 = v20 - 1;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    objc_msgSend(v38, "name");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v40 = objc_msgSend(v23, "UTF8String");
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "DuetQuery", "Stream=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);

  }
  spid = v20;

  v24 = 0;
  do
  {
    if ((uint64_t)a7 < 1)
      break;
    v25 = (void *)MEMORY[0x1CAA48B6C]();
    if (a7 >= a8)
      v26 = a8;
    else
      v26 = a7;
    -[_ATXDuetHelper _queryDuetStreamUnbatched:creationDateStart:creationDateEnd:ascending:otherPredicates:limit:offset:](self, "_queryDuetStreamUnbatched:creationDateStart:creationDateEnd:ascending:otherPredicates:limit:offset:", v38, v37, v36, a9, v17, v26, v24, spid);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v18[2](v18, v27);
      a7 -= objc_msgSend(v27, "count");
      v24 += objc_msgSend(v27, "count");
    }
    v28 = objc_msgSend(v27, "count");

    objc_autoreleasePoolPop(v25);
  }
  while (v28);
  __atxlog_handle_default();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    objc_msgSend(v38, "name");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = objc_msgSend(v31, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v40 = v32;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v30, OS_SIGNPOST_INTERVAL_END, spid, "DuetQuery", "Stream=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);

  }
  pthread_mutex_unlock(&_enumerateBatchesInDuetStream_creationDateStart_creationDateEnd_otherPredicates_limit_batchSize_ascending_block__duetLock);

}

- (id)_queryDuetStreamUnbatched:(id)a3 creationDateStart:(id)a4 creationDateEnd:(id)a5 ascending:(BOOL)a6 otherPredicates:(id)a7 limit:(unint64_t)a8 offset:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  SEL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v31;
  void *v32;
  _ATXDuetHelper *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  unint64_t v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  if (!a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDuetHelper.m"), 745, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit > 0"));

  }
  v20 = 0;
  v33 = self;
  if (v17 && v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate > %@ AND creationDate < %@"), v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = a2;
  if (objc_msgSend(v19, "count"))
  {
    v22 = (void *)MEMORY[0x1E0CB3528];
    if (v20)
    {
      objc_msgSend(v19, "arrayByAddingObject:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = v19;
    }
    objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
  }
  else
  {
    v24 = v20;
  }
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v21, v33, CFSTR("_ATXDuetHelper.m"), 753, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchPredicate"));

  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__64;
  v45 = __Block_byref_object_dispose__64;
  v46 = 0;
  v25 = (void *)MEMORY[0x1CAA48B6C]();
  +[ATXDuetKnowledgeStoreManager sharedInstance](ATXDuetKnowledgeStoreManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __117___ATXDuetHelper__queryDuetStreamUnbatched_creationDateStart_creationDateEnd_ascending_otherPredicates_limit_offset___block_invoke;
  v34[3] = &unk_1E82E5BA8;
  v40 = a6;
  v27 = v24;
  v35 = v27;
  v28 = v16;
  v38 = a9;
  v39 = a8;
  v36 = v28;
  v37 = &v41;
  objc_msgSend(v26, "runBlock:", v34);

  objc_autoreleasePoolPop(v25);
  v29 = (id)v42[5];
  _Block_object_dispose(&v41, 8);

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootOfAppDataLock, 0);
  objc_storeStrong((id *)&self->_deletionHandlerLock, 0);
}

- (void)_handleTombstoneCreationWithNotification:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0D15B80];
  v2 = 138412290;
  v3 = v1;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "Processing distributed notification %@.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
