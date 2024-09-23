@implementation PFHistoryAnalyzer

- (PFHistoryAnalyzer)init
{
  return -[PFHistoryAnalyzer initWithOptions:](self, "initWithOptions:", 0);
}

- (PFHistoryAnalyzer)initWithOptions:(id)a3
{
  PFHistoryAnalyzer *v4;
  PFHistoryAnalyzerOptions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFHistoryAnalyzer;
  v4 = -[PFHistoryAnalyzer init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (PFHistoryAnalyzerOptions *)objc_msgSend(a3, "copy");
    else
      v5 = objc_alloc_init(PFHistoryAnalyzerOptions);
    v4->_options = v5;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_options = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFHistoryAnalyzer;
  -[PFHistoryAnalyzer dealloc](&v3, sel_dealloc);
}

- (uint64_t)newAnalyzerContextForStore:(uint64_t)a3 sinceLastHistoryToken:(void *)a4 inManagedObjectContext:(_QWORD *)a5 error:
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[11];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__63;
  v32 = __Block_byref_object_dispose__63;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__63;
  v22 = __Block_byref_object_dispose__63;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__PFHistoryAnalyzer_newAnalyzerContextForStore_sinceLastHistoryToken_inManagedObjectContext_error___block_invoke;
  v17[3] = &unk_1E1EE0B80;
  v17[4] = a1;
  v17[5] = a3;
  v17[6] = a2;
  v17[7] = a4;
  v17[8] = &v18;
  v17[9] = &v28;
  v17[10] = &v24;
  objc_msgSend(a4, "performBlockAndWait:", v17);
  if (!*((_BYTE *)v25 + 24))
  {

    v19[5] = 0;
    v8 = (id)v29[5];
    if (v8)
    {
      if (a5)
        *a5 = v8;
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzer.m");
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzer.m";
        v36 = 1024;
        v37 = 133;
        _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v29[5] = 0;
  v6 = v19[5];
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return v6;
}

void __99__PFHistoryAnalyzer_newAnalyzerContextForStore_sinceLastHistoryToken_inManagedObjectContext_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  void *v5;
  NSPersistentHistoryChangeRequest *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint8_t buf[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35[5];
  _BYTE v36[128];
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v35[0] = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 16);
    if (!v3)
      v3 = 20;
  }
  else
  {
    v3 = 20;
  }
  v28 = v3;
  v29 = *(id *)(a1 + 40);
  v4 = 1;
  while ((v4 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v6 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterToken:", v29);
    -[NSPersistentHistoryChangeRequest setFetchBatchSize:](v6, "setFetchBatchSize:", 20);
    -[NSPersistentHistoryChangeRequest setFetchLimit:](v6, "setFetchLimit:", v28);
    -[NSPersistentHistoryChangeRequest setUseQueryGenerationToken:](v6, "setUseQueryGenerationToken:", 1);
    -[NSPersistentHistoryChangeRequest setResultType:](v6, "setResultType:", 5);
    v37[0] = *(_QWORD *)(a1 + 48);
    -[NSPersistentStoreRequest setAffectedStores:](v6, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1));
    v7 = (void *)objc_msgSend(*(id *)(a1 + 56), "executeRequest:error:", v6, v35);
    if (v7)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "instantiateNewAnalyzerContextForChangesInStore:", *(_QWORD *)(a1 + 48));
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v8 = (void *)objc_msgSend(v7, "result");
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v32;
LABEL_11:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x18D76B4E4]();
          v14 = objc_msgSend(*(id *)(a1 + 32), "processTransaction:withContext:error:", v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          if ((v14 & 1) == 0)
          {
            if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
            {
              v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "History transaction processing failed but didn't return an error");
              _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, v27);
              v22 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: History transaction processing failed but didn't return an error", buf, 2u);
              }
            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
            v23 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          }
          objc_autoreleasePoolPop(v13);
          if (!v14)
            break;
          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
            if (v9)
              goto LABEL_11;
            break;
          }
        }
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
        || (v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)) != 0 && *(_QWORD *)(v24 + 16)
        || objc_msgSend((id)objc_msgSend(v7, "result"), "count") != v28)
      {
        v4 = 0;
      }
      else
      {

        v4 = 1;
        v29 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "result"), "lastObject"), "token");
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      v4 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v35[0];
    }
    objc_autoreleasePoolPop(v5);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v25 = (void *)MEMORY[0x18D76B4E4]();
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "finishProcessing:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      v26 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    }
    objc_autoreleasePoolPop(v25);
  }

}

- (id)instantiateNewAnalyzerContextForChangesInStore:(id)a3
{
  return -[PFHistoryAnalyzerContext initWithOptions:]([PFHistoryAnalyzerContext alloc], "initWithOptions:", self->_options);
}

- (BOOL)processTransaction:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return objc_msgSend(a4, "processTransaction:error:", a3, a5);
}

@end
