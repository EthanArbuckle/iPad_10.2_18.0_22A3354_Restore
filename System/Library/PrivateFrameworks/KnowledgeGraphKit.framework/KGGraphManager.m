@implementation KGGraphManager

- (KGGraphManager)initWithURL:(id)a3 entityFactory:(id)a4
{
  id v7;
  id v8;
  KGGraphManager *v9;
  KGGraphManager *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *executionQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *readFeederQueue;
  dispatch_queue_t v19;
  OS_dispatch_queue *writeFeederQueue;
  uint64_t v21;
  NSMutableArray *readOnlyStores;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)KGGraphManager;
  v9 = -[KGGraphManager init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_entityFactory, a4);
    v10->_readRunningCount = 0;
    v10->_readFeeding = 1;
    v10->_closed = 0;
    v10->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v11);
    v12 = objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = dispatch_queue_create("com.apple.photos.knowledgegraph.execution", v12);
    executionQueue = v10->_executionQueue;
    v10->_executionQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_create("com.apple.photos.knowledgegraph.readfeeder", v14);
    readFeederQueue = v10->_readFeederQueue;
    v10->_readFeederQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_create("com.apple.photos.knowledgegraph.writefeeder", v14);
    writeFeederQueue = v10->_writeFeederQueue;
    v10->_writeFeederQueue = (OS_dispatch_queue *)v19;

    dispatch_set_qos_class_fallback();
    dispatch_set_qos_class_fallback();
    dispatch_set_qos_class_fallback();
    dispatch_activate((dispatch_object_t)v10->_executionQueue);
    dispatch_activate((dispatch_object_t)v10->_readFeederQueue);
    dispatch_activate((dispatch_object_t)v10->_writeFeederQueue);
    *(_DWORD *)v10->_readStoreBooking = 0;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    readOnlyStores = v10->_readOnlyStores;
    v10->_readOnlyStores = (NSMutableArray *)v21;

  }
  return v10;
}

- (void)setEntityFactory:(id)a3
{
  os_unfair_lock_s *p_lock;
  KGEntityFactory **p_entityFactory;
  KGEntityFactory *entityFactory;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  entityFactory = self->_entityFactory;
  p_entityFactory = &self->_entityFactory;
  if (!entityFactory)
    objc_storeStrong((id *)p_entityFactory, a3);
  os_unfair_lock_unlock(p_lock);

}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_readFeeding)
    dispatch_resume((dispatch_object_t)self->_readFeederQueue);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)KGGraphManager;
  -[KGGraphManager dealloc](&v4, sel_dealloc);
}

- (id)obtainReadOnlyStore:(id *)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v6;
  NSMutableArray *readOnlyStores;
  unint64_t v8;
  char *readStoreBooking;
  KGDegasGraphStore *v10;
  BOOL v11;
  id v12;
  id v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_closed)
  {
    self->_closed = 0;
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    readOnlyStores = self->_readOnlyStores;
    self->_readOnlyStores = v6;

    *(_DWORD *)self->_readStoreBooking = 0;
  }
  v8 = 0;
  readStoreBooking = self->_readStoreBooking;
  while (readStoreBooking[v8])
  {
    if (++v8 == 4)
      goto LABEL_15;
  }
  if (-[NSMutableArray count](self->_readOnlyStores, "count") > v8)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_readOnlyStores, "objectAtIndexedSubscript:", v8);
    v10 = (KGDegasGraphStore *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    readStoreBooking[v8] = 1;
    goto LABEL_16;
  }
  v10 = -[KGDegasGraphStore initWithURL:]([KGDegasGraphStore alloc], "initWithURL:", self->_url);
  v14 = 0;
  v11 = -[KGDegasGraphStore openWithMode:error:](v10, "openWithMode:error:", 1, &v14);
  v12 = v14;
  if (v11)
  {
    -[NSMutableArray addObject:](self->_readOnlyStores, "addObject:", v10);

    goto LABEL_11;
  }

  if (a3)
    *a3 = objc_retainAutorelease(v12);

LABEL_15:
  v10 = 0;
LABEL_16:
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)checkinReadOnlyStore:(id)a3
{
  unint64_t v4;
  id v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = 0;
  while (-[NSMutableArray count](self->_readOnlyStores, "count") >= v4)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_readOnlyStores, "objectAtIndexedSubscript:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      self->_readStoreBooking[v4] = 0;
      break;
    }
    if (++v4 == 4)
      break;
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)obtainReadWriteStore:(id *)a3
{
  os_unfair_lock_s *p_lock;
  id *p_readWriteStore;
  KGDegasGraphStore *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v12;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_readWriteStore = (id *)&self->_readWriteStore;
  if (!self->_readWriteStore)
  {
    v7 = -[KGDegasGraphStore initWithURL:]([KGDegasGraphStore alloc], "initWithURL:", self->_url);
    v12 = 0;
    v8 = -[KGDegasGraphStore openWithMode:error:](v7, "openWithMode:error:", 134, &v12);
    v9 = v12;
    v10 = v9;
    if (v8)
    {
      objc_storeStrong((id *)&self->_readWriteStore, v7);
    }
    else if (a3)
    {
      *a3 = objc_retainAutorelease(v9);
    }

  }
  if (self->_closed && *p_readWriteStore)
    self->_closed = 0;
  os_unfair_lock_unlock(p_lock);
  return *p_readWriteStore;
}

- (void)doClose
{
  KGDegasGraphStore *readWriteStore;
  KGDegasGraphStore *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *readOnlyStores;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  readWriteStore = self->_readWriteStore;
  if (readWriteStore)
  {
    -[KGDegasGraphStore close](readWriteStore, "close");
    v4 = self->_readWriteStore;
    self->_readWriteStore = 0;

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_readOnlyStores;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "close", (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  readOnlyStores = self->_readOnlyStores;
  self->_readOnlyStores = 0;

  *(_DWORD *)self->_readStoreBooking = 0;
  self->_closed = 1;
}

- (void)close
{
  KGGraphManager *v2;
  dispatch_queue_t *v3;
  dispatch_block_t v4;
  _QWORD block[4];
  KGGraphManager *v6;

  v2 = self;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__KGGraphManager_close__block_invoke;
  block[3] = &unk_1E83E47A8;
  v6 = v2;
  v3 = v2;
  v4 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_barrier_sync(v3[6], v4);

}

- (void)asyncClose:(id)a3
{
  KGGraphManager *v3;
  dispatch_queue_t *v4;
  dispatch_block_t v5;
  _QWORD block[4];
  KGGraphManager *v7;

  v3 = self;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__KGGraphManager_asyncClose___block_invoke;
  block[3] = &unk_1E83E47A8;
  v7 = v3;
  v4 = v3;
  v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_barrier_async(v4[6], v5);

}

- (BOOL)replaceFromGraph:(id)a3 error:(id *)a4
{
  id v6;
  NSURL *v7;
  id v8;
  NSURL *v9;
  dispatch_block_t v10;
  BOOL v11;
  void *v12;
  _QWORD block[5];
  id v15;
  NSURL *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3179;
  v23 = __Block_byref_object_dispose__3180;
  v24 = 0;
  v7 = self->_url;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__KGGraphManager_replaceFromGraph_error___block_invoke;
  block[3] = &unk_1E83E47D0;
  block[4] = self;
  v17 = &v25;
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v18 = &v19;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_barrier_sync((dispatch_queue_t)self->_executionQueue, v10);
  if (*((_BYTE *)v26 + 24))
  {
    v11 = 1;
  }
  else
  {
    v11 = 0;
    if (a4)
    {
      v12 = (void *)v20[5];
      if (v12)
      {
        *a4 = objc_retainAutorelease(v12);
        v11 = *((_BYTE *)v26 + 24) != 0;
      }
    }
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

- (void)incrementReadCount
{
  os_unfair_lock_s *p_lock;
  int readRunningCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  readRunningCount = self->_readRunningCount;
  self->_readRunningCount = readRunningCount + 1;
  if (readRunningCount >= 4)
    __assert_rtn("-[KGGraphManager incrementReadCount]", "KGGraphManager.m", 250, "_readRunningCount <= kMaximumReaderCount");
  if (readRunningCount == 3 && self->_readFeeding)
  {
    self->_readFeeding = 0;
    dispatch_suspend((dispatch_object_t)self->_readFeederQueue);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)decrementReadCount
{
  os_unfair_lock_s *p_lock;
  int readRunningCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  readRunningCount = self->_readRunningCount;
  self->_readRunningCount = readRunningCount - 1;
  if (!self->_readFeeding && readRunningCount <= 4)
  {
    self->_readFeeding = 1;
    dispatch_resume((dispatch_object_t)self->_readFeederQueue);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)submitExclusiveBlock:(id)a3 async:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  KGGraphManager *v7;
  KGEntityFactory *entityFactory;
  KGLabelBasedEntityFactory *v9;
  KGLabelBasedEntityFactory *v10;
  KGGraphManager *v11;
  id v12;
  KGLabelBasedEntityFactory *v13;
  void *v14;
  NSObject *executionQueue;
  _QWORD aBlock[4];
  KGGraphManager *v17;
  KGLabelBasedEntityFactory *v18;
  id v19;

  v4 = a4;
  v6 = a3;
  v7 = self;
  entityFactory = v7->_entityFactory;
  if (entityFactory)
    v9 = entityFactory;
  else
    v9 = objc_alloc_init(KGLabelBasedEntityFactory);
  v10 = v9;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__KGGraphManager_submitExclusiveBlock_async___block_invoke;
  aBlock[3] = &unk_1E83E47F8;
  v11 = v7;
  v17 = v11;
  v12 = v6;
  v19 = v12;
  v13 = v10;
  v18 = v13;
  v14 = _Block_copy(aBlock);
  executionQueue = v11->_executionQueue;
  if (v4)
    dispatch_barrier_async(executionQueue, v14);
  else
    dispatch_barrier_sync(executionQueue, v14);

}

- (void)submitWriteBlock:(id)a3 async:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  KGGraphManager *v7;
  KGEntityFactory *entityFactory;
  KGLabelBasedEntityFactory *v9;
  KGLabelBasedEntityFactory *v10;
  uint64_t v11;
  KGGraphManager *v12;
  id v13;
  KGLabelBasedEntityFactory *v14;
  void *v15;
  KGGraphManager *v16;
  id v17;
  void *v18;
  NSObject *writeFeederQueue;
  _QWORD v20[4];
  KGGraphManager *v21;
  id v22;
  _QWORD aBlock[4];
  KGGraphManager *v24;
  KGLabelBasedEntityFactory *v25;
  id v26;

  v4 = a4;
  v6 = a3;
  v7 = self;
  entityFactory = v7->_entityFactory;
  if (entityFactory)
    v9 = entityFactory;
  else
    v9 = objc_alloc_init(KGLabelBasedEntityFactory);
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__KGGraphManager_submitWriteBlock_async___block_invoke;
  aBlock[3] = &unk_1E83E47F8;
  v12 = v7;
  v24 = v12;
  v13 = v6;
  v26 = v13;
  v14 = v10;
  v25 = v14;
  v15 = _Block_copy(aBlock);
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __41__KGGraphManager_submitWriteBlock_async___block_invoke_11;
  v20[3] = &unk_1E83E4820;
  v16 = v12;
  v21 = v16;
  v17 = v15;
  v22 = v17;
  v18 = _Block_copy(v20);
  writeFeederQueue = v16->_writeFeederQueue;
  if (v4)
    dispatch_async(writeFeederQueue, v18);
  else
    dispatch_sync(writeFeederQueue, v18);

}

- (void)submitReadBlock:(id)a3 async:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  KGGraphManager *v7;
  KGEntityFactory *entityFactory;
  KGLabelBasedEntityFactory *v9;
  KGLabelBasedEntityFactory *v10;
  uint64_t v11;
  KGGraphManager *v12;
  id v13;
  KGLabelBasedEntityFactory *v14;
  void *v15;
  id *v16;
  dispatch_queue_t *v17;
  void *v18;
  dispatch_queue_t *v19;
  _QWORD v20[4];
  dispatch_queue_t *v21;
  _QWORD v22[4];
  dispatch_queue_t *v23;
  id v24;
  _QWORD aBlock[4];
  KGGraphManager *v26;
  KGLabelBasedEntityFactory *v27;
  id v28;

  v4 = a4;
  v6 = a3;
  v7 = self;
  entityFactory = v7->_entityFactory;
  if (entityFactory)
    v9 = entityFactory;
  else
    v9 = objc_alloc_init(KGLabelBasedEntityFactory);
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__KGGraphManager_submitReadBlock_async___block_invoke;
  aBlock[3] = &unk_1E83E47F8;
  v12 = v7;
  v26 = v12;
  v13 = v6;
  v28 = v13;
  v14 = v10;
  v27 = v14;
  v15 = _Block_copy(aBlock);
  if (v4)
  {
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __40__KGGraphManager_submitReadBlock_async___block_invoke_13;
    v22[3] = &unk_1E83E4820;
    v16 = (id *)&v23;
    v17 = v12;
    v23 = v17;
    v24 = v15;
    v18 = _Block_copy(v22);
    dispatch_async(v17[5], v18);

  }
  else
  {
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __40__KGGraphManager_submitReadBlock_async___block_invoke_2;
    v20[3] = &unk_1E83E47A8;
    v16 = (id *)&v21;
    v19 = v12;
    v21 = v19;
    v18 = _Block_copy(v20);
    dispatch_sync(v19[5], v18);
    dispatch_sync(v19[6], v15);
  }

}

- (BOOL)checkValidState
{
  int readRunningCount;
  uint8_t v5[16];

  os_unfair_lock_assert_owner(&self->_lock);
  readRunningCount = self->_readRunningCount;
  if (readRunningCount >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "invalid state", v5, 2u);
  }
  return readRunningCount < 5;
}

- (void)performReadBlock:(id)a3
{
  -[KGGraphManager submitReadBlock:async:](self, "submitReadBlock:async:", a3, 0);
}

- (void)performWriteBlock:(id)a3
{
  -[KGGraphManager submitWriteBlock:async:](self, "submitWriteBlock:async:", a3, 0);
}

- (void)performExclusiveBlock:(id)a3
{
  -[KGGraphManager submitExclusiveBlock:async:](self, "submitExclusiveBlock:async:", a3, 0);
}

- (void)performAsyncReadBlock:(id)a3
{
  -[KGGraphManager submitReadBlock:async:](self, "submitReadBlock:async:", a3, 1);
}

- (void)performAsyncWriteBlock:(id)a3
{
  -[KGGraphManager submitWriteBlock:async:](self, "submitWriteBlock:async:", a3, 1);
}

- (void)performAsyncExclusiveBlock:(id)a3
{
  -[KGGraphManager submitExclusiveBlock:async:](self, "submitExclusiveBlock:async:", a3, 1);
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_readWriteStore, 0);
  objc_storeStrong((id *)&self->_readOnlyStores, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_readFeederQueue, 0);
  objc_storeStrong((id *)&self->_writeFeederQueue, 0);
  objc_storeStrong((id *)&self->_entityFactory, 0);
}

void __40__KGGraphManager_submitReadBlock_async___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  int v6;
  id v7;
  KGGraph *v8;
  int v9;
  char v10;
  NSObject *v11;
  const char *v12;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v17 = 0;
  objc_msgSend(v2, "obtainReadOnlyStore:", &v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v17;
  v5 = v4;
  if (!v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "decrementReadCount");
    v7 = v5;
    goto LABEL_13;
  }
  v16 = v4;
  v6 = objc_msgSend(v3, "beginTransactionWithError:", &v16);
  v7 = v16;

  if (v6)
  {
    v8 = -[KGGraph initWithImplementation:entityFactory:]([KGGraph alloc], "initWithImplementation:entityFactory:", v3, *(_QWORD *)(a1 + 40));
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    if (v9)
    {
      v15 = v7;
      v10 = objc_msgSend(v3, "commitTransactionWithError:", &v15);
      v5 = v15;

      if ((v10 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      v11 = MEMORY[0x1E0C81028];
      v12 = "database commit failed: %@";
    }
    else
    {
      v14 = v7;
      v13 = objc_msgSend(v3, "rollbackTransactionWithError:", &v14);
      v5 = v14;

      if ((v13 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      v11 = MEMORY[0x1E0C81028];
      v12 = "database rollback failed: %@";
    }
    _os_log_error_impl(&dword_1CA0A5000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
LABEL_11:
    objc_msgSend(*(id *)(a1 + 32), "checkinReadOnlyStore:", v3);

    goto LABEL_12;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_13:
}

void __40__KGGraphManager_submitReadBlock_async___block_invoke_13(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "incrementReadCount");
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 48), *(dispatch_block_t *)(a1 + 40));
}

uint64_t __40__KGGraphManager_submitReadBlock_async___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "incrementReadCount");
}

void __41__KGGraphManager_submitWriteBlock_async___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  KGMutableGraph *v8;
  int v9;
  char v10;
  id v11;
  NSObject *v12;
  const char *v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v18 = 0;
  objc_msgSend(v2, "obtainReadWriteStore:", &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  v5 = v4;
  if (v3)
  {
    v17 = v4;
    v6 = objc_msgSend(v3, "beginTransactionWithError:", &v17);
    v7 = v17;

    if ((v6 & 1) != 0)
    {
      v8 = -[KGMutableGraph initWithMutableImplementation:entityFactory:]([KGMutableGraph alloc], "initWithMutableImplementation:entityFactory:", v3, a1[5]);
      v9 = (*(uint64_t (**)(void))(a1[6] + 16))();

      if (v9)
      {
        v16 = v7;
        v10 = objc_msgSend(v3, "commitTransactionWithError:", &v16);
        v11 = v16;

        if ((v10 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        v12 = MEMORY[0x1E0C81028];
        v13 = "database commit failed: %@";
      }
      else
      {
        v15 = v7;
        v14 = objc_msgSend(v3, "rollbackTransactionWithError:", &v15);
        v11 = v15;

        if ((v14 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        v12 = MEMORY[0x1E0C81028];
        v13 = "database rollback failed: %@";
      }
      _os_log_error_impl(&dword_1CA0A5000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
LABEL_11:
      v7 = v11;
      goto LABEL_12;
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
    v7 = v5;
  }
LABEL_12:

}

void __41__KGGraphManager_submitWriteBlock_async___block_invoke_11(uint64_t a1)
{
  dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 48), *(dispatch_block_t *)(a1 + 40));
}

void __45__KGGraphManager_submitExclusiveBlock_async___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  KGMutableGraph *v8;
  int v9;
  char v10;
  id v11;
  NSObject *v12;
  const char *v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v18 = 0;
  objc_msgSend(v2, "obtainReadWriteStore:", &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  v5 = v4;
  if (v3)
  {
    v17 = v4;
    v6 = objc_msgSend(v3, "beginTransactionWithError:", &v17);
    v7 = v17;

    if ((v6 & 1) != 0)
    {
      v8 = -[KGMutableGraph initWithMutableImplementation:entityFactory:]([KGMutableGraph alloc], "initWithMutableImplementation:entityFactory:", v3, a1[5]);
      v9 = (*(uint64_t (**)(void))(a1[6] + 16))();

      if (v9)
      {
        v16 = v7;
        v10 = objc_msgSend(v3, "commitTransactionWithError:", &v16);
        v11 = v16;

        if ((v10 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        v12 = MEMORY[0x1E0C81028];
        v13 = "database commit failed: %@";
      }
      else
      {
        v15 = v7;
        v14 = objc_msgSend(v3, "rollbackTransactionWithError:", &v15);
        v11 = v15;

        if ((v14 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        v12 = MEMORY[0x1E0C81028];
        v13 = "database rollback failed: %@";
      }
      _os_log_error_impl(&dword_1CA0A5000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
LABEL_11:
      v7 = v11;
      goto LABEL_12;
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
    v7 = v5;
  }
LABEL_12:

}

void __41__KGGraphManager_replaceFromGraph_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "doClose");
  objc_msgSend(*(id *)(a1 + 40), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v7 = 0;
  v4 = objc_msgSend(v2, "copyToURL:error:", v3, &v7);
  v5 = v7;
  v6 = v7;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v5);

}

uint64_t __29__KGGraphManager_asyncClose___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doClose");
}

uint64_t __23__KGGraphManager_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doClose");
}

@end
