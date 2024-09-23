@implementation _BPSAbstractCorrelateOrderedMerge

- (_BPSAbstractCorrelateOrderedMerge)initWithDownstream:(id)a3 upstreamCount:(unint64_t)a4
{
  _BPSAbstractCorrelateOrderedMerge *v7;
  _BPSAbstractCorrelateOrderedMerge *v8;
  uint64_t v9;
  NSMutableArray *subscriptions;
  uint64_t v11;
  NSMutableArray *upstreamBookmarks;
  uint64_t v13;
  NSMutableArray *buffers;
  uint64_t v15;
  NSMutableSet *completedUpstreamIndexes;
  uint64_t v17;
  NSMutableArray *requestsPerSubscription;
  NSMutableArray *v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  NSMutableArray *v23;
  void *v24;
  id v26;
  objc_super v27;

  v26 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_BPSAbstractCorrelateOrderedMerge;
  v7 = -[_BPSAbstractCorrelateOrderedMerge init](&v27, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_downstream, a3);
    v8->_upstreamCount = a4;
    v8->_recursion = 0;
    v8->_finished = 0;
    v8->_errored = 0;
    v8->_cancelled = 0;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    subscriptions = v8->_subscriptions;
    v8->_subscriptions = (NSMutableArray *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    upstreamBookmarks = v8->_upstreamBookmarks;
    v8->_upstreamBookmarks = (NSMutableArray *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    buffers = v8->_buffers;
    v8->_buffers = (NSMutableArray *)v13;

    v8->_demand = 0;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", a4);
    completedUpstreamIndexes = v8->_completedUpstreamIndexes;
    v8->_completedUpstreamIndexes = (NSMutableSet *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    requestsPerSubscription = v8->_requestsPerSubscription;
    v8->_requestsPerSubscription = (NSMutableArray *)v17;

    v8->_lock._os_unfair_lock_opaque = 0;
    for (v8->_downstreamLock = 0; a4; --a4)
    {
      v19 = v8->_subscriptions;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v19, "addObject:", v20);

      v21 = v8->_upstreamBookmarks;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v21, "addObject:", v22);

      v23 = v8->_buffers;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v23, "addObject:", v24);

      -[NSMutableArray addObject:](v8->_requestsPerSubscription, "addObject:", &unk_1E5565708);
    }
  }

  return v8;
}

- (void)requestDemand:(int64_t)a3
{
  _BPSAbstractCorrelateOrderedMerge *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BPSAbstractCorrelateOrderedMerge *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;

  v5 = self;
  v14 = v5;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("BPSCorrelateOrderedMerge.m"), 73, CFSTR("Expecting demand to be greater than 0"));

    v5 = v14;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[_BPSAbstractCorrelateOrderedMerge cancelled](v14, "cancelled")
    || -[_BPSAbstractCorrelateOrderedMerge finished](v14, "finished")
    || -[_BPSAbstractCorrelateOrderedMerge errored](v14, "errored"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[_BPSAbstractCorrelateOrderedMerge subscriptions](v14, "subscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    -[_BPSAbstractCorrelateOrderedMerge requestsPerSubscription](v14, "requestsPerSubscription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BPSAbstractCorrelateOrderedMerge setDemand:](v14, "setDemand:", -[_BPSAbstractCorrelateOrderedMerge demand](v14, "demand") + a3);
    os_unfair_lock_unlock(p_lock);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __51___BPSAbstractCorrelateOrderedMerge_requestDemand___block_invoke;
    v18 = &unk_1E554CE88;
    v10 = v9;
    v19 = v10;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
    os_unfair_lock_lock(p_lock);
    if (!-[_BPSAbstractCorrelateOrderedMerge recursion](v14, "recursion")
      && -[_BPSAbstractCorrelateOrderedMerge demand](v14, "demand") >= 1)
    {
      -[_BPSAbstractCorrelateOrderedMerge flushBufferAndRequestMoreWhileLocked](v14, "flushBufferAndRequestMoreWhileLocked");
    }
    v11 = -[_BPSAbstractCorrelateOrderedMerge finishCount](v14, "finishCount", v14, v15, v16, v17, v18);
    if (v11 == -[_BPSAbstractCorrelateOrderedMerge upstreamCount](v14, "upstreamCount")
      && -[_BPSAbstractCorrelateOrderedMerge _isBuffersEmpty](v14, "_isBuffersEmpty"))
    {
      os_unfair_lock_unlock(p_lock);
      -[_BPSAbstractCorrelateOrderedMerge _guardedBecomeTerminal](v14, "_guardedBecomeTerminal");
      os_unfair_lock_lock(p_lock);
      +[BPSCompletion success](BPSCompletion, "success");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BPSAbstractCorrelateOrderedMerge _completeWhileLockedWithCompletion:](v14, "_completeWhileLockedWithCompletion:", v12);

    }
    os_unfair_lock_unlock(p_lock);

  }
}

- (BOOL)isWaitingForMoreValues
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[_BPSAbstractCorrelateOrderedMerge completedUpstreamIndexes](self, "completedUpstreamIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[_BPSAbstractCorrelateOrderedMerge buffers](self, "buffers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59___BPSAbstractCorrelateOrderedMerge_isWaitingForMoreValues__block_invoke;
  v7[3] = &unk_1E554CEB0;
  v5 = v3;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (void)receiveSubscription:(id)a3 atIndex:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (-[_BPSAbstractCorrelateOrderedMerge upstreamCount](self, "upstreamCount") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSCorrelateOrderedMerge.m"), 138, CFSTR("Index should be less than upstream count"));

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[_BPSAbstractCorrelateOrderedMerge cancelled](self, "cancelled"))
    goto LABEL_8;
  if (-[_BPSAbstractCorrelateOrderedMerge finished](self, "finished"))
    goto LABEL_8;
  if (-[_BPSAbstractCorrelateOrderedMerge errored](self, "errored"))
    goto LABEL_8;
  -[_BPSAbstractCorrelateOrderedMerge subscriptions](self, "subscriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
LABEL_8:
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v15, "cancel");
  }
  else
  {
    -[_BPSAbstractCorrelateOrderedMerge subscriptions](self, "subscriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:atIndexedSubscript:", v15, a4);

    -[_BPSAbstractCorrelateOrderedMerge requestsPerSubscription](self, "requestsPerSubscription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:atIndexedSubscript:", &unk_1E5565720, a4);

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v15, "requestDemand:", 1);
  }

}

- (int64_t)receiveInput:(id)a3 atIndex:(unint64_t)a4
{
  id v7;
  _BPSAbstractCorrelateOrderedMerge *v8;
  int64_t v9;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = self;
  if (-[_BPSAbstractCorrelateOrderedMerge upstreamCount](v8, "upstreamCount") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("BPSCorrelateOrderedMerge.m"), 158, CFSTR("Index should be less than upstream count"));

  }
  os_unfair_lock_lock(&v8->_lock);
  if (!-[_BPSAbstractCorrelateOrderedMerge cancelled](v8, "cancelled")
    && !-[_BPSAbstractCorrelateOrderedMerge finished](v8, "finished")
    && !-[_BPSAbstractCorrelateOrderedMerge errored](v8, "errored"))
  {
    -[_BPSAbstractCorrelateOrderedMerge buffers](v8, "buffers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (v14)
    {
      v30[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      -[_BPSAbstractCorrelateOrderedMerge buffers](v8, "buffers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:atIndexedSubscript:", v16, a4);

    }
    else
    {
      objc_msgSend(v12, "addObject:", v7);
      if ((unint64_t)objc_msgSend(v12, "count") >= 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("BPSCorrelateOrderedMerge.m"), 173, CFSTR("Should only cache 1 event per stream. But got: %lu"), objc_msgSend(v12, "count"));

      }
    }
    if (!-[_BPSAbstractCorrelateOrderedMerge recursion](v8, "recursion")
      && -[_BPSAbstractCorrelateOrderedMerge demand](v8, "demand"))
    {
      -[_BPSAbstractCorrelateOrderedMerge flushBufferAndRequestMoreWhileLocked](v8, "flushBufferAndRequestMoreWhileLocked");
    }
    v9 = 0;
    -[_BPSAbstractCorrelateOrderedMerge requestsPerSubscription](v8, "requestsPerSubscription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_BPSAbstractCorrelateOrderedMerge isWaitingForMoreValues](v8, "isWaitingForMoreValues")
      && objc_msgSend(v19, "integerValue") > 0)
    {
      goto LABEL_22;
    }
    v29 = v12;
    -[_BPSAbstractCorrelateOrderedMerge buffers](v8, "buffers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqual:", v22))
    {

      v12 = v29;
    }
    else
    {
      -[_BPSAbstractCorrelateOrderedMerge buffers](v8, "buffers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", a4);
      v28 = v19;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v24, "count");

      v19 = v28;
      v12 = v29;
      if (v27)
      {
LABEL_22:
        os_unfair_lock_unlock(&v8->_lock);

        goto LABEL_7;
      }
      -[_BPSAbstractCorrelateOrderedMerge requestsPerSubscription](v8, "requestsPerSubscription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:atIndexedSubscript:", &unk_1E5565720, a4);
      v9 = 1;
    }

    goto LABEL_22;
  }
  os_unfair_lock_unlock(&v8->_lock);
  v9 = 0;
LABEL_7:

  return v9;
}

- (BOOL)_isBuffersEmpty
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[_BPSAbstractCorrelateOrderedMerge buffers](self, "buffers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52___BPSAbstractCorrelateOrderedMerge__isBuffersEmpty__block_invoke;
  v7[3] = &unk_1E554CED8;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  v4 = *((int *)v9 + 6);
  -[_BPSAbstractCorrelateOrderedMerge buffers](self, "buffers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "count") == v4;

  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)_completeWhileLockedWithCompletion:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_BPSAbstractCorrelateOrderedMerge setFinished:](self, "setFinished:", 1);
  if (-[_BPSAbstractCorrelateOrderedMerge upstreamCount](self, "upstreamCount"))
  {
    v4 = 0;
    do
    {
      -[_BPSAbstractCorrelateOrderedMerge completedUpstreamIndexes](self, "completedUpstreamIndexes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

      ++v4;
    }
    while (v4 < -[_BPSAbstractCorrelateOrderedMerge upstreamCount](self, "upstreamCount"));
  }
  -[_BPSAbstractCorrelateOrderedMerge downstream](self, "downstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BPSAbstractCorrelateOrderedMerge setDownstream:](self, "setDownstream:", 0);
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v7, "receiveCompletion:", v8);
  os_unfair_recursive_lock_unlock();
  os_unfair_lock_lock(&self->_lock);

}

- (void)_guardedBecomeTerminal
{
  os_unfair_lock_s *p_lock;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_BPSAbstractCorrelateOrderedMerge setFinished:](self, "setFinished:", 1);
  -[_BPSAbstractCorrelateOrderedMerge subscriptions](self, "subscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v4, "copy");

  if (objc_msgSend(v18, "count"))
  {
    v5 = 0;
    do
    {
      -[_BPSAbstractCorrelateOrderedMerge updateBookmarksWhenLockedForIndex:](self, "updateBookmarksWhenLockedForIndex:", v5);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BPSAbstractCorrelateOrderedMerge subscriptions](self, "subscriptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:atIndexedSubscript:", v6, v5);

      -[_BPSAbstractCorrelateOrderedMerge requestsPerSubscription](self, "requestsPerSubscription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:atIndexedSubscript:", &unk_1E5565708, v5);

      ++v5;
    }
    while (v5 < objc_msgSend(v18, "count"));
  }
  -[_BPSAbstractCorrelateOrderedMerge buffers](self, "buffers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BPSAbstractCorrelateOrderedMerge buffers](self, "buffers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v12, v11);

      ++v11;
      -[_BPSAbstractCorrelateOrderedMerge buffers](self, "buffers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

    }
    while (v11 < v15);
  }
  os_unfair_lock_unlock(p_lock);
  if (objc_msgSend(v18, "count"))
  {
    v16 = 0;
    do
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v17, "cancel");

      ++v16;
    }
    while (v16 < objc_msgSend(v18, "count"));
  }

}

- (void)receiveCompletion:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  _BPSAbstractCorrelateOrderedMerge *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = self;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_BPSAbstractOrderedMerge receiveCompletion:atIndex:].cold.1((uint64_t)v7, a4, v8);

  v9 = objc_msgSend(v6, "state");
  if (v9 == 1)
  {
    -[_BPSAbstractCorrelateOrderedMerge _guardedBecomeTerminal](v7, "_guardedBecomeTerminal");
    os_unfair_lock_lock(&v7->_lock);
    -[_BPSAbstractCorrelateOrderedMerge setErrored:](v7, "setErrored:", 1);
    -[_BPSAbstractCorrelateOrderedMerge downstream](v7, "downstream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BPSAbstractCorrelateOrderedMerge setDownstream:](v7, "setDownstream:", 0);
    os_unfair_lock_unlock(&v7->_lock);
    os_unfair_recursive_lock_lock_with_options();
    objc_msgSend(v16, "receiveCompletion:", v6);
    os_unfair_recursive_lock_unlock();

  }
  else if (!v9)
  {
    os_unfair_lock_lock(&v7->_lock);
    -[_BPSAbstractCorrelateOrderedMerge completedUpstreamIndexes](v7, "completedUpstreamIndexes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    if (!-[_BPSAbstractCorrelateOrderedMerge finished](v7, "finished"))
    {
      -[_BPSAbstractCorrelateOrderedMerge setFinishCount:](v7, "setFinishCount:", -[_BPSAbstractCorrelateOrderedMerge finishCount](v7, "finishCount") + 1);
      -[_BPSAbstractCorrelateOrderedMerge updateBookmarksWhenLockedForIndex:](v7, "updateBookmarksWhenLockedForIndex:", a4);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BPSAbstractCorrelateOrderedMerge subscriptions](v7, "subscriptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v12, a4);

      -[_BPSAbstractCorrelateOrderedMerge requestsPerSubscription](v7, "requestsPerSubscription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:atIndexedSubscript:", &unk_1E5565708, a4);

      if (!-[_BPSAbstractCorrelateOrderedMerge recursion](v7, "recursion")
        && -[_BPSAbstractCorrelateOrderedMerge demand](v7, "demand"))
      {
        -[_BPSAbstractCorrelateOrderedMerge flushBufferAndRequestMoreWhileLocked](v7, "flushBufferAndRequestMoreWhileLocked");
      }
      v15 = -[_BPSAbstractCorrelateOrderedMerge finishCount](v7, "finishCount");
      if (v15 == -[_BPSAbstractCorrelateOrderedMerge upstreamCount](v7, "upstreamCount")
        && -[_BPSAbstractCorrelateOrderedMerge _isBuffersEmpty](v7, "_isBuffersEmpty"))
      {
        os_unfair_lock_unlock(&v7->_lock);
        -[_BPSAbstractCorrelateOrderedMerge _guardedBecomeTerminal](v7, "_guardedBecomeTerminal");
        os_unfair_lock_lock(&v7->_lock);
        -[_BPSAbstractCorrelateOrderedMerge _completeWhileLockedWithCompletion:](v7, "_completeWhileLockedWithCompletion:", v6);
      }
    }
    os_unfair_lock_unlock(&v7->_lock);
  }

}

- (void)flushBufferAndRequestMoreWhileLocked
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  -[_BPSAbstractCorrelateOrderedMerge downstream](self, "downstream");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[_BPSAbstractCorrelateOrderedMerge downstream](self, "downstream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EEAF4B78);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSCorrelateOrderedMerge.m"), 313, CFSTR("Downstream should conform to BPSCorrelationProducer protocol"));

    }
  }
  if (-[_BPSAbstractCorrelateOrderedMerge demand](self, "demand") >= 1)
  {
    while (!-[_BPSAbstractCorrelateOrderedMerge isWaitingForMoreValues](self, "isWaitingForMoreValues", v24))
    {
      v25 = 0;
      -[_BPSAbstractCorrelateOrderedMerge nextValueIndex:](self, "nextValueIndex:", &v25);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v25;
      v11 = v10;
      if (!v9)
      {

        return;
      }
      -[_BPSAbstractCorrelateOrderedMerge setDemand:](self, "setDemand:", -[_BPSAbstractCorrelateOrderedMerge demand](self, "demand") - 1);
      -[_BPSAbstractCorrelateOrderedMerge setRecursion:](self, "setRecursion:", 1);
      v12 = objc_msgSend(v11, "integerValue");
      -[_BPSAbstractCorrelateOrderedMerge requestsPerSubscription](self, "requestsPerSubscription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "integerValue") - 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BPSAbstractCorrelateOrderedMerge requestsPerSubscription](self, "requestsPerSubscription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:atIndexedSubscript:", v15, v12);

      -[_BPSAbstractCorrelateOrderedMerge subscriptions](self, "subscriptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[_BPSAbstractCorrelateOrderedMerge downstream](self, "downstream");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_lock);
      os_unfair_recursive_lock_lock_with_options();
      v20 = objc_msgSend(v19, "receiveInput:source:", v9, +[BPSCorrelate correlateSourceForIndex:](BPSCorrelate, "correlateSourceForIndex:", v12));
      os_unfair_recursive_lock_unlock();
      os_unfair_lock_lock(&self->_lock);
      -[_BPSAbstractCorrelateOrderedMerge setRecursion:](self, "setRecursion:", 0);
      if (v20 >= 1)
        -[_BPSAbstractCorrelateOrderedMerge setDemand:](self, "setDemand:", -[_BPSAbstractCorrelateOrderedMerge demand](self, "demand") + v20);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[_BPSAbstractCorrelateOrderedMerge requestsPerSubscription](self, "requestsPerSubscription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "integerValue"))
        {

        }
        else
        {
          v24 = -[_BPSAbstractCorrelateOrderedMerge demand](self, "demand");

          if (v24 >= 1)
          {
            -[_BPSAbstractCorrelateOrderedMerge requestsPerSubscription](self, "requestsPerSubscription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:atIndexedSubscript:", &unk_1E5565720, v12);

            os_unfair_lock_unlock(&self->_lock);
            objc_msgSend(v18, "requestDemand:", 1);
            os_unfair_lock_lock(&self->_lock);
          }
        }
      }

      if (-[_BPSAbstractCorrelateOrderedMerge demand](self, "demand") <= 0)
        return;
    }
  }
}

- (id)nextValueIndex:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  -[_BPSAbstractCorrelateOrderedMerge buffers](self, "buffers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  v12 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52___BPSAbstractCorrelateOrderedMerge_nextValueIndex___block_invoke;
  v10[3] = &unk_1E554CF00;
  v10[5] = v11;
  v10[6] = &v13;
  v10[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14[3]);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v14[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v8, v14[3]);
    -[_BPSAbstractCorrelateOrderedMerge setBuffers:](self, "setBuffers:", v6);

  }
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (int64_t)compareFirst:(id)a3 withSecond:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Abstract Method"), &stru_1E554E0D0);
  return 0;
}

- (void)cancel
{
  _BPSAbstractCorrelateOrderedMerge *v2;

  v2 = self;
  -[_BPSAbstractCorrelateOrderedMerge _guardedBecomeTerminal](v2, "_guardedBecomeTerminal");
  os_unfair_lock_lock(&v2->_lock);
  -[_BPSAbstractCorrelateOrderedMerge setCancelled:](v2, "setCancelled:", 1);
  -[_BPSAbstractCorrelateOrderedMerge setDownstream:](v2, "setDownstream:", 0);
  os_unfair_lock_unlock(&v2->_lock);

}

- (id)upstreamSubscriptions
{
  void *v2;
  void *v3;
  id v4;

  -[_BPSAbstractCorrelateOrderedMerge subscriptions](self, "subscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (void)updateBookmarksWhenLockedForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;

  -[_BPSAbstractCorrelateOrderedMerge subscriptions](self, "subscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EEAF3EE8))
    {
      v9 = v6;
      v10 = (void *)objc_msgSend(v9, "newBookmark");
      if (v10)
        -[NSMutableArray setObject:atIndexedSubscript:](self->_upstreamBookmarks, "setObject:atIndexedSubscript:", v10, a3);

    }
    else
    {
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_BPSAbstractOrderedMerge updateBookmarksWhenLockedForIndex:].cold.1((uint64_t)v6, v11);

    }
  }

}

- (id)newBookmark
{
  BMBookmarkNode *v3;
  NSMutableArray *upstreamBookmarks;
  objc_class *v5;
  void *v6;
  BMBookmarkNode *v7;

  v3 = [BMBookmarkNode alloc];
  upstreamBookmarks = self->_upstreamBookmarks;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BMBookmarkNode initWithValue:upstreams:name:](v3, "initWithValue:upstreams:name:", 0, upstreamBookmarks, v6);

  return v7;
}

- (unint64_t)upstreamCount
{
  return self->_upstreamCount;
}

- (void)setUpstreamCount:(unint64_t)a3
{
  self->_upstreamCount = a3;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (NSMutableArray)upstreamBookmarks
{
  return self->_upstreamBookmarks;
}

- (void)setUpstreamBookmarks:(id)a3
{
  objc_storeStrong((id *)&self->_upstreamBookmarks, a3);
}

- (NSMutableArray)buffers
{
  return self->_buffers;
}

- (void)setBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_buffers, a3);
}

- (NSMutableArray)requestsPerSubscription
{
  return self->_requestsPerSubscription;
}

- (void)setRequestsPerSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_requestsPerSubscription, a3);
}

- (NSMutableSet)completedUpstreamIndexes
{
  return self->_completedUpstreamIndexes;
}

- (void)setCompletedUpstreamIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_completedUpstreamIndexes, a3);
}

- (BOOL)recursion
{
  return self->_recursion;
}

- (void)setRecursion:(BOOL)a3
{
  self->_recursion = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)errored
{
  return self->_errored;
}

- (void)setErrored:(BOOL)a3
{
  self->_errored = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (unint64_t)finishCount
{
  return self->_finishCount;
}

- (void)setFinishCount:(unint64_t)a3
{
  self->_finishCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedUpstreamIndexes, 0);
  objc_storeStrong((id *)&self->_requestsPerSubscription, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_upstreamBookmarks, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
