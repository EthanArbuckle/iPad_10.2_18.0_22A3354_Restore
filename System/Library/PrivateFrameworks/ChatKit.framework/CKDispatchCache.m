@implementation CKDispatchCache

- (CKDispatchCache)init
{
  return -[CKDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:](self, "initWithCacheLimit:dispatchPriority:isConcurrent:", 0, -2, 0);
}

- (CKDispatchCache)initWithCacheLimit:(unint64_t)a3 dispatchPriority:(int64_t)a4 isConcurrent:(BOOL)a5
{
  CKDispatchCache *v8;
  void *v9;
  NSCountedSet *v10;
  NSCountedSet *pendingKeys;
  NSMutableDictionary *v12;
  NSMutableDictionary *pendingGroups;
  uint64_t v14;
  NSCache *objectCache;
  dispatch_queue_t v16;
  OS_dispatch_queue *lockQueue;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKDispatchCache;
  v8 = -[CKDispatchCache init](&v19, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addListener:", v8);

    v10 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    pendingKeys = v8->_pendingKeys;
    v8->_pendingKeys = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingGroups = v8->_pendingGroups;
    v8->_pendingGroups = v12;

    CKCreateNSCache(a3);
    v14 = objc_claimAutoreleasedReturnValue();
    objectCache = v8->_objectCache;
    v8->_objectCache = (NSCache *)v14;

    v16 = dispatch_queue_create(0, MEMORY[0x1E0C80D50]);
    lockQueue = v8->_lockQueue;
    v8->_lockQueue = (OS_dispatch_queue *)v16;

    v8->_dispatchPriority = a4;
    v8->_isConcurrent = a5;
  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKDispatchCache;
  -[CKDispatchCache dealloc](&v4, sel_dealloc);
}

- (id)cachedObjectForKey:(id)a3
{
  id v4;
  NSObject *lockQueue;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  if (objc_msgSend(v4, "length"))
  {
    lockQueue = self->_lockQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__CKDispatchCache_cachedObjectForKey___block_invoke;
    block[3] = &unk_1E274A090;
    v13 = &v14;
    block[4] = self;
    v6 = v4;
    v12 = v6;
    dispatch_sync(lockQueue, block);
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        if (v15[5])
          v8 = CFSTR("YES");
        else
          v8 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v21 = v6;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "Dispatch cache lookup [%@]: %@", buf, 0x16u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();

  }
  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __38__CKDispatchCache_cachedObjectForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setCachedObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *lockQueue;
  _QWORD v9[4];
  id v10;
  CKDispatchCache *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    lockQueue = self->_lockQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__CKDispatchCache_setCachedObject_forKey___block_invoke;
    v9[3] = &unk_1E274A0B8;
    v10 = v6;
    v11 = self;
    v12 = v7;
    ck_dispatch_isolated(lockQueue, v9);

  }
}

void __42__CKDispatchCache_setCachedObject_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

}

- (IMDispatchQueue)dispatchQueue
{
  IMDispatchQueue *dispatchQueue;
  int64_t dispatchPriority;
  IMDispatchQueue *v5;
  IMDispatchQueue *v6;

  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
    dispatchPriority = self->_dispatchPriority;
    if (self->_isConcurrent)
      objc_msgSend(MEMORY[0x1E0D370E0], "concurrentQueueWithDispatchPriority:", dispatchPriority);
    else
      objc_msgSend(MEMORY[0x1E0D370E0], "serialQueueWithDispatchPriority:", dispatchPriority);
    v5 = (IMDispatchQueue *)objc_claimAutoreleasedReturnValue();
    v6 = self->_dispatchQueue;
    self->_dispatchQueue = v5;

    -[IMDispatchQueue setSuspended:](self->_dispatchQueue, "setSuspended:", 1);
    dispatchQueue = self->_dispatchQueue;
  }
  return dispatchQueue;
}

- (void)enqueueBlock:(id)a3 withPriority:(int64_t)a4
{
  id v6;
  id v7;

  if (a3)
  {
    v6 = a3;
    -[CKDispatchCache dispatchQueue](self, "dispatchQueue");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addBlock:withQueuePriority:", v6, a4);

  }
}

- (void)enqueueGenerationBlock:(id)a3 completion:(id)a4 withPriority:(int64_t)a5 forKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(int8x16_t *);
  void *v19;
  id v20;
  CKDispatchCache *v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (v10 && objc_msgSend(v12, "length"))
  {
    -[CKDispatchCache beginGeneratingForKey:](self, "beginGeneratingForKey:", v13);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __73__CKDispatchCache_enqueueGenerationBlock_completion_withPriority_forKey___block_invoke;
    v19 = &unk_1E274A0E0;
    v22 = v10;
    v20 = v13;
    v21 = self;
    v23 = v11;
    v14 = _Block_copy(&v16);
    -[CKDispatchCache dispatchQueue](self, "dispatchQueue", v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addBlock:withQueuePriority:", v14, a5);

  }
}

void __73__CKDispatchCache_enqueueGenerationBlock_completion_withPriority_forKey___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  int8x16_t v7;
  _QWORD v8[4];
  id v9;
  int8x16_t v10;

  (*(void (**)(void))(a1[3].i64[0] + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1[2].i64[1] + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__CKDispatchCache_enqueueGenerationBlock_completion_withPriority_forKey___block_invoke_2;
  v8[3] = &unk_1E274A0B8;
  v4 = v2;
  v9 = v4;
  v7 = a1[2];
  v5 = (id)v7.i64[0];
  v10 = vextq_s8(v7, v7, 8uLL);
  ck_dispatch_isolated(v3, v8);
  v6 = a1[3].i64[1];
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

uint64_t __73__CKDispatchCache_enqueueGenerationBlock_completion_withPriority_forKey___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
  return objc_msgSend(*(id *)(a1 + 40), "_endGeneratingForKeyUnlocked:", *(_QWORD *)(a1 + 48));
}

- (BOOL)isGeneratingForKey:(id)a3
{
  id v4;
  NSObject *lockQueue;
  char v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (objc_msgSend(v4, "length"))
  {
    lockQueue = self->_lockQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__CKDispatchCache_isGeneratingForKey___block_invoke;
    block[3] = &unk_1E274A090;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(lockQueue, block);

  }
  v6 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __38__CKDispatchCache_isGeneratingForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pendingKeys");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (void)_beginGeneratingForKeyUnlocked:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CKDispatchCache pendingKeys](self, "pendingKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if ((v5 & 1) == 0)
  {
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    -[CKDispatchCache pendingGroups](self, "pendingGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v9);

  }
  -[CKDispatchCache pendingKeys](self, "pendingKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

- (void)beginGeneratingForKey:(id)a3
{
  id v4;
  OS_dispatch_queue *lockQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    lockQueue = self->_lockQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__CKDispatchCache_beginGeneratingForKey___block_invoke;
    v6[3] = &unk_1E274A108;
    v6[4] = self;
    v7 = v4;
    ck_dispatch_isolated(lockQueue, v6);

  }
}

uint64_t __41__CKDispatchCache_beginGeneratingForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginGeneratingForKeyUnlocked:", *(_QWORD *)(a1 + 40));
}

- (void)_endGeneratingForKeyUnlocked:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CKDispatchCache pendingKeys](self, "pendingKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countForObject:", v10);

  -[CKDispatchCache pendingKeys](self, "pendingKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v10);

  if (v5 == 1)
  {
    -[CKDispatchCache pendingGroups](self, "pendingGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v10);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
      dispatch_group_leave(v8);
    -[CKDispatchCache pendingGroups](self, "pendingGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

- (void)endGeneratingForKey:(id)a3
{
  id v4;
  OS_dispatch_queue *lockQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    lockQueue = self->_lockQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__CKDispatchCache_endGeneratingForKey___block_invoke;
    v6[3] = &unk_1E274A108;
    v6[4] = self;
    v7 = v4;
    ck_dispatch_isolated(lockQueue, v6);

  }
}

uint64_t __39__CKDispatchCache_endGeneratingForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endGeneratingForKeyUnlocked:", *(_QWORD *)(a1 + 40));
}

- (BOOL)waitOnGenerationForKey:(id)a3
{
  id v4;
  NSObject *lockQueue;
  dispatch_time_t v6;
  BOOL v7;
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
  if (objc_msgSend(v4, "length"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    lockQueue = self->_lockQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__CKDispatchCache_waitOnGenerationForKey___block_invoke;
    block[3] = &unk_1E274A090;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(lockQueue, block);
    if (v13[5])
    {
      v6 = dispatch_time(0, 2000000000);
      v7 = dispatch_group_wait((dispatch_group_t)v13[5], v6) == 0;
    }
    else
    {
      v7 = 1;
    }

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void __42__CKDispatchCache_waitOnGenerationForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pendingGroups");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)resume
{
  id v2;

  -[CKDispatchCache dispatchQueue](self, "dispatchQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 0);

}

- (void)suspend
{
  id v2;

  -[CKDispatchCache dispatchQueue](self, "dispatchQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 1);

}

- (void)clearQueue
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKDispatchCache pendingGroups](self, "pendingGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "copy");

  -[CKDispatchCache pendingKeys](self, "pendingKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[CKDispatchCache pendingGroups](self, "pendingGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[IMDispatchQueue removeAllOutstandingBlocks](self->_dispatchQueue, "removeAllOutstandingBlocks");
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global);

}

void __29__CKDispatchCache_clearQueue__block_invoke(int a1, int a2, dispatch_group_t group)
{
  dispatch_group_leave(group);
}

- (void)emptyCache
{
  -[NSCache removeAllObjects](self->_objectCache, "removeAllObjects");
}

- (NSCache)objectCache
{
  return self->_objectCache;
}

- (void)setObjectCache:(id)a3
{
  objc_storeStrong((id *)&self->_objectCache, a3);
}

- (NSCountedSet)pendingKeys
{
  return self->_pendingKeys;
}

- (void)setPendingKeys:(id)a3
{
  objc_storeStrong((id *)&self->_pendingKeys, a3);
}

- (NSMutableDictionary)pendingGroups
{
  return self->_pendingGroups;
}

- (void)setPendingGroups:(id)a3
{
  objc_storeStrong((id *)&self->_pendingGroups, a3);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (OS_dispatch_queue)lockQueue
{
  return self->_lockQueue;
}

- (void)setLockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lockQueue, a3);
}

- (int64_t)dispatchPriority
{
  return self->_dispatchPriority;
}

- (void)setDispatchPriority:(int64_t)a3
{
  self->_dispatchPriority = a3;
}

- (BOOL)isConcurrent
{
  return self->_isConcurrent;
}

- (void)setIsConcurrent:(BOOL)a3
{
  self->_isConcurrent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_pendingGroups, 0);
  objc_storeStrong((id *)&self->_pendingKeys, 0);
  objc_storeStrong((id *)&self->_objectCache, 0);
}

@end
