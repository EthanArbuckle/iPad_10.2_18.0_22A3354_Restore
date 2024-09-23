@implementation _EFReplayObservable

- (_EFReplayObservable)initWithCount:(unint64_t)a3
{
  _EFReplayObservable *v4;
  NSLock *v5;
  NSLock *lock;
  uint64_t v7;
  EFQueue *queue;
  NSMutableArray *v9;
  NSMutableArray *observers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_EFReplayObservable;
  v4 = -[_EFReplayObservable init](&v12, sel_init);
  if (v4)
  {
    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v4->_lock;
    v4->_lock = v5;

    +[EFQueue boundedQueueWithCapacity:](EFQueue, "boundedQueueWithCapacity:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v4->_queue;
    v4->_queue = (EFQueue *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v4->_observers;
    v4->_observers = v9;

  }
  return v4;
}

- (id)subscribe:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  EFCancelationToken *v10;
  EFCancelationToken *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  _EFReplayObservable *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[EFQueue allObjects](self->_queue, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "observerDidReceiveResult:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  if (self->_error)
  {
    objc_msgSend(v4, "observerDidFailWithError:");
  }
  else if (self->_isStopped)
  {
    objc_msgSend(v4, "observerDidComplete");
  }
  if (self->_isStopped)
  {
    v9 = 0;
  }
  else
  {
    -[NSMutableArray addObject:](self->_observers, "addObject:", v4);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __33___EFReplayObservable_subscribe___block_invoke;
    v16 = &unk_1E62A58B0;
    v17 = self;
    v18 = v4;
    +[EFCancelationToken tokenWithCancelationBlock:](EFCancelationToken, "tokenWithCancelationBlock:", &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSLock unlock](self->_lock, "unlock", v13, v14, v15, v16, v17);
  if (v9)
    v10 = v9;
  else
    v10 = objc_alloc_init(EFCancelationToken);
  v11 = v10;

  return v11;
}

- (void)_unsubscribe:(id)a3
{
  id v4;

  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", v4);
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)observerDidReceiveResult:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (!self->_isStopped)
  {
    -[EFQueue enqueue:](self->_queue, "enqueue:", v4);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = self->_observers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "observerDidReceiveResult:", v4, (_QWORD)v9);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
  -[NSLock unlock](self->_lock, "unlock", (_QWORD)v9);

}

- (void)observerDidComplete
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  if (!self->_isStopped)
  {
    self->_isStopped = 1;
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_observers;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v8;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "observerDidComplete", (_QWORD)v7);
        }
        v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    -[NSMutableArray removeAllObjects](self->_observers, "removeAllObjects");
  }
  -[NSLock unlock](self->_lock, "unlock", (_QWORD)v7);
}

- (void)observerDidFailWithError:(id)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (!self->_isStopped)
  {
    self->_isStopped = 1;
    objc_storeStrong((id *)&self->_error, a3);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = self->_observers;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "observerDidFailWithError:", v5, (_QWORD)v10);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[NSMutableArray removeAllObjects](self->_observers, "removeAllObjects");
  }
  -[NSLock unlock](self->_lock, "unlock", (_QWORD)v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
