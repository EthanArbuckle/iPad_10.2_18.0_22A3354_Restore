@implementation PFHistoryAnalyzerContext

- (PFHistoryAnalyzerContext)initWithOptions:(id)a3
{
  PFHistoryAnalyzerContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFHistoryAnalyzerContext;
  v4 = -[PFHistoryAnalyzerContext init](&v6, sel_init);
  if (v4)
  {
    v4->_objectIDToState = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_processedTransactionIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4->_options = (PFHistoryAnalyzerOptions *)a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_sortedStates = 0;
  self->_finalHistoryToken = 0;

  v3.receiver = self;
  v3.super_class = (Class)PFHistoryAnalyzerContext;
  -[PFHistoryAnalyzerContext dealloc](&v3, sel_dealloc);
}

- (BOOL)reset:(id *)a3
{

  self->_objectIDToState = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_processedTransactionIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);

  self->_sortedStates = 0;
  self->_isFinished = 0;

  self->_finalHistoryToken = 0;
  return 1;
}

- (BOOL)processTransaction:(id)a3 error:(id *)a4
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  BOOL v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSString *v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a3, "transactionNumber"));
  if (-[NSMutableSet containsObject:](self->_processedTransactionIDs, "containsObject:", v8))
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99768];
    v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid attempt to process transaction '%@' twice."), v8, v30);
    goto LABEL_20;
  }
  if (self->_isFinished)
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99768];
    v28 = (void *)MEMORY[0x1E0CB3940];
    v29 = NSStringFromSelector(a2);
    v27 = objc_msgSend(v28, "stringWithFormat:", CFSTR("Invalid invocation of '%@', cannot be called after '%@'"), v29, NSStringFromSelector(sel_finishProcessing_));
LABEL_20:
    objc_exception_throw((id)objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, v27, 0));
  }
  -[NSMutableSet addObject:](self->_processedTransactionIDs, "addObject:", v8);
  v9 = (void *)objc_msgSend(a3, "changes");
  v10 = objc_msgSend(v9, "count");
  v11 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (v10)
  {
    v12 = 0;
    while (-[PFHistoryAnalyzerContext processChange:error:](self, "processChange:error:", objc_msgSend(v9, "objectAtIndexedSubscript:", v12), &v31))
    {
      if (1000 * (v12 / 0x3E8) == v12)
      {

        v11 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      }
      if (v10 == ++v12)
        goto LABEL_9;
    }
    v14 = v31;
    v13 = 0;
  }
  else
  {
LABEL_9:
    v13 = 1;
  }

  self->_finalHistoryToken = (NSPersistentHistoryToken *)(id)objc_msgSend(a3, "token");
  if (!v13)
  {
    v15 = v31;
    if (v15)
    {
      if (a4)
        *a4 = v15;
    }
    else
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m");
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m";
        v34 = 1024;
        v35 = 97;
        _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v13;
}

- (BOOL)resetStateForObjectID:(id)a3 error:(id *)a4
{
  -[NSMutableDictionary removeObjectForKey:](self->_objectIDToState, "removeObjectForKey:", a3, a4);
  return 1;
}

- (BOOL)processChange:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  BOOL v9;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v7 = -[PFHistoryAnalyzerContext analyzerStateForChangedObjectID:error:](self, "analyzerStateForChangedObjectID:error:", objc_msgSend(a3, "changedObjectID"), &v21);
  if (!v7)
  {
    v11 = v21;
    if (v21)
      goto LABEL_6;
    v12 = -[PFHistoryAnalyzerContext newAnalyzerStateForChange:error:](self, "newAnalyzerStateForChange:error:", a3, &v21);
    if (v12)
    {
      v8 = v12;
      goto LABEL_3;
    }
    v11 = v21;
    if (v21)
    {
LABEL_6:
      if (a4)
      {
        v9 = 0;
        v8 = 0;
        *a4 = v11;
        goto LABEL_4;
      }
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFHistoryAnalyzerContext.m";
        v24 = 1024;
        v25 = 128;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v9 = 0;
    v8 = 0;
    goto LABEL_4;
  }
  v8 = v7;
  objc_msgSend(v7, "updateWithChange:", a3);
LABEL_3:
  v9 = 1;
LABEL_4:

  return v9;
}

- (id)analyzerStateForChangedObjectID:(id)a3 error:(id *)a4
{
  return (id)-[NSMutableDictionary objectForKey:](self->_objectIDToState, "objectForKey:", a3, a4);
}

- (id)newAnalyzerStateForChange:(id)a3 error:(id *)a4
{
  PFHistoryAnalyzerDefaultObjectState *v6;

  v6 = -[PFHistoryAnalyzerDefaultObjectState initWithOriginalChange:]([PFHistoryAnalyzerDefaultObjectState alloc], "initWithOriginalChange:", a3);
  -[NSMutableDictionary setObject:forKey:](self->_objectIDToState, "setObject:forKey:", v6, objc_msgSend(a3, "changedObjectID"));
  return v6;
}

- (BOOL)finishProcessing:(id *)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  PFHistoryAnalyzerOptions *options;
  void *v10;
  NSArray *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend((id)-[NSMutableDictionary allValues](self->_objectIDToState, "allValues"), "mutableCopy");
  v6 = objc_msgSend(v5, "count");
  v7 = MEMORY[0x1E0C809B0];
  if (v6 < 2)
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      v8 = (void *)objc_msgSend(v5, "lastObject");
      options = self->_options;
      if (options)
      {
        if (options->_automaticallyPruneTransientRecords)
        {
          v10 = v8;
          if (!objc_msgSend(v8, "originalChangeType") && objc_msgSend(v10, "finalChangeType") == 2)
            objc_msgSend(v5, "removeAllObjects");
        }
      }
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke;
    v14[3] = &unk_1E1EE1DA8;
    v14[4] = self;
    v14[5] = v4;
    objc_msgSend(v5, "sortUsingComparator:", v14);
    objc_msgSend(v5, "removeObjectsInArray:", v4);
  }
  v11 = (NSArray *)objc_msgSend(v5, "copy");
  self->_sortedStates = v11;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke_2;
  v13[3] = &unk_1E1EE1DD0;
  v13[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v13);

  self->_isFinished = 1;
  return 1;
}

uint64_t __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19[0] = a2;
  v19[1] = a3;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2, 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(a1 + 32);
        if (v11)
        {
          v12 = *(_QWORD *)(v11 + 16);
          if (v12)
          {
            if (*(_BYTE *)(v12 + 8))
            {
              v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
              if (!objc_msgSend(v13, "originalChangeType") && objc_msgSend(v13, "finalChangeType") == 2)
                objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }
  return objc_msgSend((id)objc_msgSend(a2, "finalTransactionNumber"), "compare:", objc_msgSend(a3, "finalTransactionNumber"));
}

void __45__PFHistoryAnalyzerContext_finishProcessing___block_invoke_2()
{
  objc_autoreleasePoolPop((void *)MEMORY[0x18D76B4E4]());
}

- (id)fetchSortedStates:(id *)a3
{
  return self->_sortedStates;
}

@end
