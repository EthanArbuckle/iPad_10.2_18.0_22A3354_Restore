@implementation HDCloudSyncManagerTaskQueue

- (HDCloudSyncManagerTaskQueue)initWithDelegate:(id)a3
{
  id v4;
  HDCloudSyncManagerTaskQueue *v5;
  HDCloudSyncManagerTaskQueue *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncManagerTaskQueue;
  v5 = -[HDCloudSyncManagerTaskQueue init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (int64_t)pendingTaskCount
{
  os_unfair_lock_s *p_lock;
  int64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_pendingTasksBeingSorted + -[NSMutableArray count](self->_pendingTasks, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasActiveTask
{
  os_unfair_lock_s *p_lock;
  BOOL isComputingActiveTask;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_activeTask)
    isComputingActiveTask = 1;
  else
    isComputingActiveTask = self->_isComputingActiveTask;
  os_unfair_lock_unlock(p_lock);
  return isComputingActiveTask;
}

- (HDCloudSyncManagerTask)activeTask
{
  os_unfair_lock_s *p_lock;
  HDCloudSyncManagerTask *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_activeTask;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addTask:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  HDCloudSyncManagerTask *activeTask;
  uint64_t v11;
  NSMutableArray *pendingTasks;
  NSMutableArray *v13;
  NSMutableArray *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_pendingTasks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "combineWithTask:", v4, (_QWORD)v15))
        {
          os_unfair_lock_unlock(&self->_lock);

          goto LABEL_20;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (objc_msgSend(v4, "priority") >= 100)
  {
    activeTask = self->_activeTask;
    if (activeTask)
    {
      v11 = -[HDCloudSyncManagerTask priority](activeTask, "priority");
      if (v11 < objc_msgSend(v4, "priority"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[HDCloudSyncManagerTask cancel](self->_activeTask, "cancel");
      }
    }
  }
  pendingTasks = self->_pendingTasks;
  if (!pendingTasks)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = self->_pendingTasks;
    self->_pendingTasks = v13;

    pendingTasks = self->_pendingTasks;
  }
  -[NSMutableArray addObject:](pendingTasks, "addObject:", v4, (_QWORD)v15);
  os_unfair_lock_unlock(&self->_lock);
  while (-[HDCloudSyncManagerTaskQueue _primitiveConsiderStartingNextTask]((uint64_t)self))
    ;
LABEL_20:

}

- (BOOL)_primitiveConsiderStartingNextTask
{
  os_unfair_lock_s *v2;
  _BOOL8 v3;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  id to;

  if (!a1)
    return 0;
  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  if (*(_QWORD *)(a1 + 40) || *(_BYTE *)(a1 + 32) || *(_BYTE *)(a1 + 33))
  {
    os_unfair_lock_unlock(v2);
    return 0;
  }
  v5 = (id *)(a1 + 16);
  v6 = *(void **)(a1 + 16);
  v7 = v6;
  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;

  *(_QWORD *)(a1 + 24) = objc_msgSend(v7, "count");
  *(_BYTE *)(a1 + 32) = 1;
  os_unfair_lock_unlock(v2);
  objc_copyWeak(&to, (id *)(a1 + 48));
  v9 = objc_loadWeakRetained(&to);

  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__HDCloudSyncManagerTaskQueue__primitiveConsiderStartingNextTask__block_invoke;
    v13[3] = &unk_1E6D0A7A0;
    objc_copyWeak(&v14, &to);
    v13[4] = a1;
    objc_msgSend(v7, "sortUsingComparator:", v13);
    objc_destroyWeak(&v14);
  }
  os_unfair_lock_lock(v2);
  if (*v5)
    objc_msgSend(v7, "addObjectsFromArray:");
  objc_storeStrong((id *)(a1 + 16), v6);
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 0;
  objc_msgSend(*(id *)(a1 + 16), "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v11 != 0;
  if (v11)
  {
    objc_msgSend(*v5, "removeObjectAtIndex:", 0);
    objc_storeStrong((id *)(a1 + 40), v11);
    *(_BYTE *)(a1 + 33) = 1;
    os_unfair_lock_unlock(v2);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __65__HDCloudSyncManagerTaskQueue__primitiveConsiderStartingNextTask__block_invoke_2;
    v12[3] = &unk_1E6CE80E8;
    v12[4] = a1;
    objc_msgSend(v11, "startWithCompletion:", v12);
    os_unfair_lock_lock(v2);
    *(_BYTE *)(a1 + 33) = 0;
  }
  os_unfair_lock_unlock(v2);

  objc_destroyWeak(&to);
  return v3;
}

uint64_t __65__HDCloudSyncManagerTaskQueue__primitiveConsiderStartingNextTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = objc_msgSend(WeakRetained, "compareTask:withTask:queue:", v7, v6, *(_QWORD *)(a1 + 32));

  return v9;
}

void __65__HDCloudSyncManagerTaskQueue__primitiveConsiderStartingNextTask__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(v4 + 33);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
  if (!v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      while ((-[HDCloudSyncManagerTaskQueue _primitiveConsiderStartingNextTask](v6) & 1) != 0)
        ;
    }
  }
}

- (HDCloudSyncManagerTaskQueueDelegate)delegate
{
  return (HDCloudSyncManagerTaskQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeTask, 0);
  objc_storeStrong((id *)&self->_pendingTasks, 0);
}

@end
