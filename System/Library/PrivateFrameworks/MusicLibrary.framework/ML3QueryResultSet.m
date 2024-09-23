@implementation ML3QueryResultSet

void __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  __int128 v8;
  _QWORD block[6];
  _QWORD v10[4];
  __int128 v11;

  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_2;
  v10[3] = &unk_1E5B637A0;
  v8 = *(_OWORD *)(a1 + 40);
  v4 = (id)v8;
  v11 = v8;
  objc_msgSend(v2, "_onQueueAddUpdateFinishedBlock:", v10);
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") <= 1)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 64);
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_3;
    block[3] = &unk_1E5B65E48;
    v7 = *(_QWORD *)(a1 + 48);
    block[4] = v5;
    block[5] = v7;
    dispatch_barrier_async(v6, block);
  }

}

- (void)_onQueueAddUpdateFinishedBlock:(id)a3
{
  id v5;
  NSMutableArray *updateToLibraryCurrentRevisionCompletionBlocks;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3QueryResultSet.mm"), 433, CFSTR("invalid parameter.  completion block must be specified."));

    v5 = 0;
  }
  updateToLibraryCurrentRevisionCompletionBlocks = self->_updateToLibraryCurrentRevisionCompletionBlocks;
  if (!updateToLibraryCurrentRevisionCompletionBlocks)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_updateToLibraryCurrentRevisionCompletionBlocks;
    self->_updateToLibraryCurrentRevisionCompletionBlocks = v7;

    updateToLibraryCurrentRevisionCompletionBlocks = self->_updateToLibraryCurrentRevisionCompletionBlocks;
    v5 = v11;
  }
  v9 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableArray addObject:](updateToLibraryCurrentRevisionCompletionBlocks, "addObject:", v9);

}

- (ML3Query)query
{
  return self->_query;
}

- (unint64_t)count
{
  return -[ML3QueryResultSet_BackingStore count](self->_backingStore, "count");
}

void __44__ML3QueryResultSet__loadCurrentFullResults__block_invoke(uint64_t a1, int64_t a2, char a3)
{
  FastAppendPersistentID(*(ML3QueryResultSet_MutableBackingStore **)(a1 + 32), a2, a3);
}

void __44__ML3QueryResultSet__loadCurrentFullResults__block_invoke_2(uint64_t a1, int64_t a2)
{
  FastAppendPersistentID(*(ML3QueryResultSet_MutableBackingStore **)(a1 + 32), a2, 0);
}

- (int64_t)localRevision
{
  return self->_localRevision;
}

uint64_t __41__ML3QueryResultSet_persistentIDAtIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "persistentIDAtIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

uint64_t __49__ML3QueryResultSet_enumerateSectionsUsingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateSectionsUsingBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueInvokeAndClearUpdateFinishedBlocksWithDidUpdateResult:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (int64_t)persistentIDAtIndex:(unint64_t)a3
{
  NSObject *fixedPriorityQueue;
  int64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  fixedPriorityQueue = self->_fixedPriorityQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ML3QueryResultSet_persistentIDAtIndex___block_invoke;
  block[3] = &unk_1E5B655D8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(fixedPriorityQueue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD *v4;
  double Current;
  NSObject *v6;
  double v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[2];
  uint64_t (*v11)(uint64_t);
  void *v12;
  __int128 v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_4;
  v12 = &unk_1E5B65E48;
  v13 = *(_OWORD *)(a1 + 32);
  v3 = (id)v13;
  v4 = v10;
  if (_executeTimeQueryOperation(NSString *,ML3QueryResultSet *,void({block_pointer})(void))::onceToken != -1)
    dispatch_once(&_executeTimeQueryOperation(NSString *,ML3QueryResultSet *,void({block_pointer})(void))::onceToken, &__block_literal_global_14134);
  if (_executeTimeQueryOperation(NSString *,ML3QueryResultSet *,void({block_pointer})(void))::timeQueryOps)
    Current = CFAbsoluteTimeGetCurrent();
  else
    Current = 0.0;
  v11((uint64_t)v4);
  if (_executeTimeQueryOperation(NSString *,ML3QueryResultSet *,void({block_pointer})(void))::timeQueryOps)
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v3, "query");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = CFSTR("updated results");
      v16 = 2048;
      v17 = v7 - Current;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ in %.2f seconds for query with criteria: %{public}@", buf, 0x20u);

    }
  }

  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_5;
  v9[3] = &unk_1E5B65E48;
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56), v9);
}

uint64_t __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateToLibraryCurrentRevision");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (ML3QueryResultSet)initWithQuery:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  ML3ContainerQueryResultSet *v14;
  ML3QueryResultSet *p_super;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = -[ML3QueryResultSet _initWithQuery:supportsIncrementalUpdate:](self, "_initWithQuery:supportsIncrementalUpdate:", v4, 0);
LABEL_7:
    self = (ML3QueryResultSet *)v7;
    p_super = self;
    goto LABEL_10;
  }
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) == 0)
  {
    v7 = -[ML3QueryResultSet _initWithQuery:supportsIncrementalUpdate:](self, "_initWithQuery:supportsIncrementalUpdate:", v4, 1);
    goto LABEL_7;
  }
  v10 = v4;
  objc_msgSend(v10, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForProperty:", CFSTR("smart_is_dynamic"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  if (v13)
  {
    v14 = -[ML3ContainerQueryResultSet initWithQuery:]([ML3ContainerQueryResultSet alloc], "initWithQuery:", v10);
  }
  else
  {
    v14 = (ML3ContainerQueryResultSet *)-[ML3QueryResultSet _initWithQuery:supportsIncrementalUpdate:](self, "_initWithQuery:supportsIncrementalUpdate:", v10, 0);
    self = &v14->super;
  }
  p_super = &v14->super;

LABEL_10:
  return p_super;
}

- (id)_initWithQuery:(id)a3 supportsIncrementalUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  ML3QueryResultSet *v7;
  ML3QueryResultSet *v8;
  ML3OrderingTerm *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  BOOL v14;
  char v15;
  void *v16;
  BOOL v17;
  ML3OrderingTerm *v18;
  void *v19;
  ML3Query *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *fixedPriorityQueue;
  void *v33;
  objc_super v34;
  _QWORD v35[2];

  v4 = a4;
  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ML3QueryResultSet;
  v7 = -[ML3QueryResultSet init](&v34, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v6, "orderingTerms");
    v9 = (ML3OrderingTerm *)objc_claimAutoreleasedReturnValue();
    if (-[ML3OrderingTerm count](v9, "count"))
    {

      if (!v4)
        goto LABEL_8;
    }
    else
    {
      if (!objc_msgSend(v6, "usingSections"))
      {
        v15 = 0;
        goto LABEL_14;
      }
      objc_msgSend(v6, "sectionProperty");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 != 0;

      if (!v11 || !v4)
      {
LABEL_8:
        v15 = 0;
LABEL_15:
        objc_storeStrong((id *)&v7->_query, v6);
        v7->_supportsIncrementalUpdate = v15;
        v27 = dispatch_queue_create("com.apple.ML3QueryResultSet.coalescing", 0);
        queue = v7->_queue;
        v7->_queue = (OS_dispatch_queue *)v27;

        dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INTERACTIVE, 0);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = dispatch_queue_create("com.apple.ML3QueryResultSet", v29);
        fixedPriorityQueue = v8->_fixedPriorityQueue;
        v8->_fixedPriorityQueue = (OS_dispatch_queue *)v30;

        goto LABEL_16;
      }
    }
    objc_msgSend(v6, "predicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spotlightPredicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (!v14)
      goto LABEL_8;
    objc_msgSend(v6, "orderingTerms");
    v9 = (ML3OrderingTerm *)objc_claimAutoreleasedReturnValue();
    if (-[ML3OrderingTerm count](v9, "count"))
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(v6, "sectionProperty");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (v17)
      {
        v15 = 1;
        goto LABEL_15;
      }
      v18 = [ML3OrderingTerm alloc];
      objc_msgSend(v6, "sectionProperty");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ML3OrderingTerm initWithProperty:](v18, "initWithProperty:", v19);

      v20 = [ML3Query alloc];
      objc_msgSend(v6, "library");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v6, "entityClass");
      objc_msgSend(v6, "predicate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v6, "usingSections");
      objc_msgSend(v6, "nonDirectAggregateQuery");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:](v20, "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v33, v21, v22, v23, v24, v25, 0, objc_msgSend(v6, "options"));

      v15 = 1;
      v6 = (id)v26;
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:

  return v8;
}

- (BOOL)_updateToLibraryCurrentRevision
{
  ML3Query *v3;
  void *v4;
  uint64_t v5;
  int64_t revision;
  BOOL v7;
  int v8;
  _QWORD v10[4];
  ML3Query *v11;
  id v12;
  ML3QueryResultSet *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = self->_query;
  -[ML3Query library](v3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ML3Query filtersOnDynamicProperties](v3, "filtersOnDynamicProperties"))
    v5 = objc_msgSend(v4, "currentRevision");
  else
    v5 = objc_msgSend(v4, "currentContentRevision");
  if (!self->_backingStore)
    goto LABEL_14;
  revision = self->_revision;
  if (revision == v5)
  {
    v7 = 0;
    goto LABEL_15;
  }
  if (!self->_supportsIncrementalUpdate || !revision || revision > v5 || revision + 100 < v5)
  {
LABEL_14:
    -[ML3QueryResultSet _loadCurrentFullResults](self, "_loadCurrentFullResults");
    ++self->_localRevision;
    v7 = 1;
    goto LABEL_15;
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke;
  v10[3] = &unk_1E5B63810;
  v11 = v3;
  v12 = v4;
  v13 = self;
  v14 = &v15;
  objc_msgSend(v12, "performReadOnlyDatabaseTransactionWithBlock:", v10);
  v8 = *((unsigned __int8 *)v16 + 24);
  if (*((_BYTE *)v16 + 24))
    ++self->_localRevision;
  v7 = v8 != 0;

  _Block_object_dispose(&v15, 8);
LABEL_15:

  return v7;
}

- (void)_loadCurrentFullResults
{
  ML3Query *v3;
  void *v4;
  ML3QueryResultSet_MutableBackingStore *v5;
  void *v6;
  id *v7;
  ML3QueryResultSet_BackingStore *backingStore;
  _QWORD v9[4];
  ML3QueryResultSet_MutableBackingStore *v10;
  _QWORD v11[4];
  ML3QueryResultSet_MutableBackingStore *v12;

  v3 = self->_query;
  -[ML3Query library](v3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_revision = objc_msgSend(v4, "currentRevision");
  v5 = objc_alloc_init(ML3QueryResultSet_MutableBackingStore);
  -[ML3Query sectionProperty](v3, "sectionProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__ML3QueryResultSet__loadCurrentFullResults__block_invoke;
    v11[3] = &unk_1E5B63730;
    v7 = (id *)&v12;
    v12 = v5;
    -[ML3Query enumeratePersistentIDsAndSectionsWithProperty:usingBlock:](v3, "enumeratePersistentIDsAndSectionsWithProperty:usingBlock:", v6, v11);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__ML3QueryResultSet__loadCurrentFullResults__block_invoke_2;
    v9[3] = &unk_1E5B65960;
    v7 = (id *)&v10;
    v10 = v5;
    -[ML3Query enumeratePersistentIDsUsingBlock:](v3, "enumeratePersistentIDsUsingBlock:", v9);
  }

  backingStore = self->_backingStore;
  self->_backingStore = &v5->super;

}

void __83__ML3QueryResultSet__onQueueInvokeAndClearUpdateFinishedBlocksWithDidUpdateResult___block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))MEMORY[0x1AF43CDE0](a2);
  v3[2](v3, *(unsigned __int8 *)(a1 + 32));

}

intptr_t __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  id v4;
  NSObject *fixedPriorityQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  fixedPriorityQueue = self->_fixedPriorityQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ML3QueryResultSet_enumerateSectionsUsingBlock___block_invoke;
  block[3] = &unk_1E5B64758;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(fixedPriorityQueue, block);

}

_QWORD *__62__ML3QueryResultSet_BackingStore_enumerateSectionsUsingBlock___block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  char v3;

  if (*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 56))
  {
    v1 = result;
    if (*(unsigned __int8 *)(*(_QWORD *)(result[6] + 8) + 24) != 255)
    {
      v3 = 0;
      result = (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
      if (!v3)
      {
        v2 = *(_QWORD *)(v1[5] + 8);
        *(_QWORD *)(v2 + 48) += *(_QWORD *)(v2 + 56);
        *(_QWORD *)(v2 + 56) = 0;
      }
    }
  }
  return result;
}

- (BOOL)updateToLibraryCurrentRevision
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  _QWORD block[5];
  dispatch_semaphore_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke;
  block[3] = &unk_1E5B65CF0;
  v8 = v3;
  v9 = &v10;
  block[4] = self;
  v5 = v3;
  dispatch_sync(queue, block);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(queue) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)queue;
}

- (void)_onQueueInvokeAndClearUpdateFinishedBlocksWithDidUpdateResult:(BOOL)a3
{
  id v5;
  _QWORD v6[4];
  BOOL v7;

  v5 = (id)-[NSMutableArray copy](self->_updateToLibraryCurrentRevisionCompletionBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_updateToLibraryCurrentRevisionCompletionBlocks, "removeAllObjects");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__ML3QueryResultSet__onQueueInvokeAndClearUpdateFinishedBlocksWithDidUpdateResult___block_invoke;
  v6[3] = &__block_descriptor_33_e15_v32__0_8Q16_B24l;
  v7 = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedPriorityQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_updateToLibraryCurrentRevisionCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

_QWORD *__69__ML3QueryResultSet_BackingStore_reverseEnumerateSectionsUsingBlock___block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  char v3;

  if (*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 56))
  {
    v1 = result;
    if (*(unsigned __int8 *)(*(_QWORD *)(result[6] + 8) + 24) != 255)
    {
      v3 = 0;
      result = (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
      if (!v3)
      {
        v2 = *(_QWORD *)(v1[5] + 8);
        *(_QWORD *)(v2 + 48) += *(_QWORD *)(v2 + 56);
        *(_QWORD *)(v2 + 56) = 0;
      }
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  dispatch_queue_t v5;
  id v6;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 2, self->_query);
  v4[3] = (id)self->_revision;
  objc_storeStrong(v4 + 1, self->_backingStore);
  *((_BYTE *)v4 + 40) = self->_supportsIncrementalUpdate;
  v5 = dispatch_queue_create("com.apple.ML3QueryResultSet.coalescing", 0);
  v6 = v4[7];
  v4[7] = v5;

  objc_storeStrong(v4 + 8, self->_fixedPriorityQueue);
  return v4;
}

- (void)_mergeChangesWithFromNewPIDs:(const void *)a3 changedPIDs:(void *)a4
{
  objc_class *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  ML3QueryResultSet_MutableBackingStore *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  int64_t v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  int64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  ML3Query *v44;
  unint64_t v45;
  id *location;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  _QWORD v54[4];
  _QWORD *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  unint64_t v59;
  const void *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  void *v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v44 = self->_query;
  -[ML3Query library](v44, "library");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "checkoutReaderConnection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ML3Query entityClass](v44, "entityClass");
  -[ML3Query orderingTerms](v44, "orderingTerms");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v43, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3QueryResultSet.mm"), 298, CFSTR("Updateable query has no ordering! query: %@"), v44);

  }
  -[ML3Query sectionProperty](v44, "sectionProperty");
  v8 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v8;
  if (v8)
  {
    -[objc_class joinClausesForProperty:](v7, "joinClausesForProperty:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" "));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    -[objc_class databaseTable](v7, "databaseTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = &stru_1E5B66908;
    if (v10)
      v12 = v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@ %@ WHERE %@.ROWID = ?"), v52, v11, v12, v11);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = 0;
  }
  -[objc_class disambiguatedSQLForProperty:](v7, "disambiguatedSQLForProperty:", CFSTR("ROWID"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v40, 0);
  v13 = *(_QWORD *)a3;
  v14 = *((_QWORD *)a3 + 1);
  location = (id *)&self->_backingStore;
  -[ML3QueryResultSet_BackingStore backingStoreByRemovingPersistentIDs:](self->_backingStore, "backingStoreByRemovingPersistentIDs:", a4);
  v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  v17 = objc_alloc_init(ML3QueryResultSet_MutableBackingStore);
  v45 = -[ML3QueryResultSet entityLimit](self, "entityLimit");
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:](v44, "selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:", v39, 0, v43, 0, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Query predicateIncludingSystemwidePredicates](v44, "predicateIncludingSystemwidePredicates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "databaseStatementParameters");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == v13)
  {
    v21 = 0;
    v34 = 0;
  }
  else
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v51 = (v14 - v13) >> 3;
    do
    {
      -[ML3Query lowerBoundParametersForOrderingTerms:lowerBoundPersistentID:](v44, "lowerBoundParametersForOrderingTerms:lowerBoundPersistentID:", v43, *(_QWORD *)(*(_QWORD *)a3 + 8 * v20));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "arrayByAddingObjectsFromArray:", v47);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "executeQuery:withParameters:", v41, v22);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = 0;
      v70 = &v69;
      v71 = 0x2020000000;
      v72 = 0;
      v65 = 0;
      v66 = &v65;
      v67 = 0x2020000000;
      v68 = 0;
      v61 = 0;
      v62 = &v61;
      v63 = 0x2020000000;
      v64 = v20 + 1;
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __62__ML3QueryResultSet__mergeChangesWithFromNewPIDs_changedPIDs___block_invoke;
      v54[3] = &unk_1E5B63758;
      v56 = &v61;
      v59 = v51;
      v60 = a3;
      v55 = v15;
      v57 = &v65;
      v58 = &v69;
      objc_msgSend(v48, "enumerateRowsWithBlock:", v54);
      if (*((_BYTE *)v70 + 24))
      {
        if (v21 < v16)
        {
          while (1)
          {
            v23 = *(_QWORD *)(v15[1] + 8 * v21);
            if (v23 == v66[3])
              break;
            FastAppendPersistentID(v17, v23, *(_BYTE *)(v15[4] + v21++));
            if (v16 == v21)
            {
              v21 = v16;
              goto LABEL_33;
            }
          }
          while (v20 < v62[3])
          {
            v24 = *(_QWORD *)(*(_QWORD *)a3 + 8 * v20);
            if (v52)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)a3 + 8 * v20));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v74[0] = v25;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "executeQuery:withParameters:", v49, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "int64ValueForFirstRowAndColumn");

            }
            else
            {
              v28 = 0;
            }
            FastAppendPersistentID(v17, v24, v28);
            ++v20;
          }
          --v20;
        }
      }
      else
      {
        if (v21 < v16)
        {
          do
          {
            FastAppendPersistentID(v17, *(_QWORD *)(v15[1] + 8 * v21), *(_BYTE *)(v15[4] + v21));
            ++v21;
          }
          while (v16 != v21);
          v21 = v16;
        }
        if (v20 < v51)
        {
          do
          {
            v29 = *(_QWORD *)(*(_QWORD *)a3 + 8 * v20);
            if (v52)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)a3 + 8 * v20));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = v30;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "executeQuery:withParameters:", v49, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "int64ValueForFirstRowAndColumn");

            }
            else
            {
              v33 = 0;
            }
            FastAppendPersistentID(v17, v29, v33);
            ++v20;
          }
          while (v51 != v20);
          v20 = v51;
        }
      }
LABEL_33:

      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(&v65, 8);
      _Block_object_dispose(&v69, 8);

      ++v20;
      v34 = v48;
      v19 = v48;
    }
    while (v20 < v51);
  }
  v35 = v34;
  if (v21 < v16)
  {
    do
    {
      FastAppendPersistentID(v17, *(_QWORD *)(v15[1] + 8 * v21), *(_BYTE *)(v15[4] + v21));
      ++v21;
    }
    while (v16 != v21);
  }
  objc_storeStrong(location, v17);
  v36 = location;
  while (objc_msgSend(*v36, "count") > v45)
  {
    v36 = location;
    *((_QWORD *)*location + 2) -= 8;
  }
  objc_msgSend(v38, "checkInDatabaseConnection:", v50);

}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  id v4;
  NSObject *fixedPriorityQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  fixedPriorityQueue = self->_fixedPriorityQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ML3QueryResultSet_enumeratePersistentIDsUsingBlock___block_invoke;
  block[3] = &unk_1E5B64758;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(fixedPriorityQueue, block);

}

- (unint64_t)entityLimit
{
  return -1;
}

uint64_t __54__ML3QueryResultSet_enumeratePersistentIDsUsingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumeratePersistentIDsUsingBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;
  char v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void **v21;
  _OWORD *v22;
  _OWORD v23[2];
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;

  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "entityClass");
  objc_msgSend(*(id *)(a1 + 32), "orderingTerms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "revisionTrackingCode");
  v25 = 0;
  v26 = 0;
  v27 = 0;
  memset(v23, 0, sizeof(v23));
  v24 = 1065353216;
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
  if (objc_msgSend(*(id *)(a1 + 32), "filtersOnDynamicProperties"))
    v8 = 3;
  else
    v8 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke_2;
  v15[3] = &unk_1E5B637E8;
  v20 = v3;
  v16 = *(id *)(a1 + 40);
  v9 = v2;
  v17 = v9;
  v10 = v4;
  v11 = *(_QWORD *)(a1 + 48);
  v18 = v10;
  v19 = v11;
  v21 = &v25;
  v22 = v23;
  objc_msgSend(v6, "getChangedPersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:usingBlock:", v7, v5, v8, v15);
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "containsPersistentIDs:", v23);
  if (v25 == v26)
    v13 = v12;
  else
    v13 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 48), "_mergeChangesWithFromNewPIDs:changedPIDs:", &v25, v23);
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) = objc_msgSend(*(id *)(a1 + 40), "currentRevision");

  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v23);
  if (v25)
  {
    v26 = v25;
    operator delete(v25);
  }

  return 1;
}

void __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke_2(_QWORD *a1, unint64_t *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[5];

  v6 = (void *)a1[8];
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = objc_msgSend(*(id *)(a1[7] + 16), "options");
  v12[1] = 3221225472;
  v12[2] = __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke_3;
  v12[3] = &__block_descriptor_40_e12_v24__0q8_B16l;
  v12[4] = a1[9];
  v12[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v6, "enumeratePersistentIDsInLibrary:matchingPredicate:orderingTerms:persistentIDs:count:options:usingBlock:", v7, v8, v9, a2, a3, v10, v12);
  for (; a3; --a3)
  {
    v11 = *a2++;
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(a1[10], v11, v11);
  }
}

void __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD **)(v3 + 8);
  v4 = *(_QWORD *)(v3 + 16);
  if ((unint64_t)v5 >= v4)
  {
    v7 = *(_QWORD **)v3;
    v8 = ((uint64_t)v5 - *(_QWORD *)v3) >> 3;
    v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 61)
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    v10 = v4 - (_QWORD)v7;
    if (v10 >> 2 > v9)
      v9 = v10 >> 2;
    v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8;
    v12 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v11)
      v12 = v9;
    if (v12)
    {
      v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v12);
      v7 = *(_QWORD **)v3;
      v5 = *(_QWORD **)(v3 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = (_QWORD *)(v12 + 8 * v8);
    v15 = v12 + 8 * v13;
    *v14 = a2;
    v6 = v14 + 1;
    while (v5 != v7)
    {
      v16 = *--v5;
      *--v14 = v16;
    }
    *(_QWORD *)v3 = v14;
    *(_QWORD *)(v3 + 8) = v6;
    *(_QWORD *)(v3 + 16) = v15;
    if (v7)
      operator delete(v7);
  }
  else
  {
    *v5 = a2;
    v6 = v5 + 1;
  }
  *(_QWORD *)(v3 + 8) = v6;
}

void __62__ML3QueryResultSet__mergeChangesWithFromNewPIDs_changedPIDs___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = objc_msgSend(v14, "int64ForColumnIndex:", 0);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(_QWORD *)(v9 + 24);
  if (v10 >= *(_QWORD *)(a1 + 64))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD **)(v11 + 8);
    v13 = *(_QWORD **)(v11 + 16);
    while (v12 != v13)
    {
      if (*v12 == v8)
        goto LABEL_8;
      ++v12;
    }
    goto LABEL_9;
  }
  if (*(_QWORD *)(**(_QWORD **)(a1 + 72) + 8 * v10) != v8)
  {
LABEL_8:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_9:
    *a4 = 1;
    goto LABEL_10;
  }
  *(_QWORD *)(v9 + 24) = v10 + 1;
LABEL_10:

}

@end
