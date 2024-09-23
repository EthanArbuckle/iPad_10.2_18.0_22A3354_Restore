@implementation HDAsynchronousTaskTree

- (HDAsynchronousTaskTree)initWithDescription:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HDAsynchronousTaskTree *v8;
  uint64_t v9;
  NSString *groupDescription;
  NSMutableArray *v11;
  NSMutableArray *lock_pendingTasks;
  NSMutableArray *v13;
  NSMutableArray *lock_pendingSubtasks;
  NSMutableArray *v15;
  NSMutableArray *lock_taskErrors;
  uint64_t v17;
  id lock_completion;
  uint64_t v19;
  OS_dispatch_queue *default_task_queue;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HDAsynchronousTaskTree;
  v8 = -[HDAsynchronousTaskTree init](&v22, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    groupDescription = v8->_groupDescription;
    v8->_groupDescription = (NSString *)v9;

    v8->_lock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    lock_pendingTasks = v8->_lock_pendingTasks;
    v8->_lock_pendingTasks = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    lock_pendingSubtasks = v8->_lock_pendingSubtasks;
    v8->_lock_pendingSubtasks = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    lock_taskErrors = v8->_lock_taskErrors;
    v8->_lock_taskErrors = v15;

    *(_WORD *)&v8->_lock_started = 0;
    v17 = objc_msgSend(v7, "copy");
    lock_completion = v8->_lock_completion;
    v8->_lock_completion = (id)v17;

    HKCreateSerialUtilityDispatchQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    default_task_queue = v8->_default_task_queue;
    v8->_default_task_queue = (OS_dispatch_queue *)v19;

  }
  return v8;
}

- (void)addTask:(id)a3
{
  -[HDAsynchronousTaskTree addTaskOnQueue:task:](self, "addTaskOnQueue:task:", self->_default_task_queue, a3);
}

- (void)addTaskOnQueue:(id)a3 task:(id)a4
{
  -[HDAsynchronousTaskTree addTaskOnQueue:timeout:task:](self, "addTaskOnQueue:timeout:task:", a3, a4, 0.0);
}

- (void)addTaskWithTimeout:(double)a3 task:(id)a4
{
  -[HDAsynchronousTaskTree addTaskOnQueue:timeout:task:](self, "addTaskOnQueue:timeout:task:", self->_default_task_queue, a4, a3);
}

- (void)addTaskOnQueue:(id)a3 timeout:(double)a4 task:(id)a5
{
  id v9;
  unsigned __int8 v10;
  HDAsynchronousTask *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a5;
  if (v16)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAsynchronousTaskTree.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAsynchronousTaskTree.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

LABEL_3:
  v10 = atomic_load((unsigned __int8 *)&self->_rejectAddTask);
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAsynchronousTaskTree.m"), 82, CFSTR("Cannot add task if the task tree is rejecting addTask calls"));

  }
  v11 = objc_alloc_init(HDAsynchronousTask);
  -[HDAsynchronousTask setQueue:]((uint64_t)v11, v16);
  if (v11)
  {
    objc_setProperty_nonatomic_copy(v11, v12, v9, 16);
    v11->_timeout = a4;
    v11->_hasTimeout = a4 > 0.0;
  }
  -[HDAsynchronousTaskTree _addTask:queue:]((uint64_t)self, v11, v16);

}

- (void)_addTask:(void *)a3 queue:
{
  id v5;
  unsigned __int8 v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v6 = atomic_load((unsigned __int8 *)(a1 + 40));
    if ((v6 & 1) == 0 && !*(_BYTE *)(a1 + 43))
    {
      v7 = 24;
      if (!*(_BYTE *)(a1 + 42))
        v7 = 16;
      objc_msgSend(*(id *)(a1 + v7), "addObject:", v8);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }

}

- (void)addCheckpointTask:(id)a3
{
  -[HDAsynchronousTaskTree addCheckpointTaskOnQueue:task:](self, "addCheckpointTaskOnQueue:task:", self->_default_task_queue, a3);
}

- (void)addCheckpointTaskOnQueue:(id)a3 task:(id)a4
{
  id v7;
  unsigned __int8 v8;
  HDAsynchronousTask *v9;
  const char *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAsynchronousTaskTree.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("checkpointHandler != nil"), v13);

  }
  v8 = atomic_load((unsigned __int8 *)&self->_rejectAddTask);
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAsynchronousTaskTree.m"), 101, CFSTR("Cannot add task if the task tree is rejecting addTask calls"));

  }
  v9 = objc_alloc_init(HDAsynchronousTask);
  -[HDAsynchronousTask setQueue:]((uint64_t)v9, v13);
  if (v9)
    objc_setProperty_nonatomic_copy(v9, v10, v7, 40);
  -[HDAsynchronousTaskTree _addTask:queue:]((uint64_t)self, v9, v13);

}

- (NSArray)allErrors
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = (void *)-[NSMutableArray copy](self->_lock_taskErrors, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)begin
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_lock_started)
  {
    os_unfair_lock_unlock(p_lock);
    if (self->_lock_started)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAsynchronousTaskTree.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_lock_started"));

    }
  }
  else
  {
    self->_lock_started = 1;
    -[HDAsynchronousTaskTree _lock_beginNextTask]((uint64_t)self);
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_lock_beginNextTask
{
  unsigned __int8 v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint64_t v16;
  char *v17;
  _QWORD block[4];
  void *v19;
  uint64_t v20;

  if (!a1)
    return;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (*(_BYTE *)(a1 + 43))
    return;
  if (!objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    *(_BYTE *)(a1 + 43) = 1;
    v7 = objc_msgSend(*(id *)(a1 + 32), "count") != 0;
    v8 = a1;
LABEL_11:
    -[HDAsynchronousTaskTree _lock_reportResult:](v8, v7);
    return;
  }
  v2 = atomic_load((unsigned __int8 *)(a1 + 40));
  if ((v2 & 1) != 0)
  {
    *(_BYTE *)(a1 + 43) = 1;
    v8 = a1;
    v7 = 3;
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 16), "objectAtIndexedSubscript:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 16), "removeObjectAtIndex:", 0);
  if (v3 && *(_QWORD *)(v3 + 40))
  {
    atomic_store(1u, (unsigned __int8 *)(a1 + 41));
    v4 = *(NSObject **)(v3 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke;
    block[3] = &unk_24CB18410;
    v19 = (void *)v3;
    v20 = a1;
    v5 = (id)v3;
    dispatch_async(v4, block);
    v6 = v19;
  }
  else
  {
    if (v3)
    {
      if (*(_BYTE *)(v3 + 8))
      {
        dispatch_get_global_queue(0, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v9);

        v11 = dispatch_time(0, (uint64_t)(*(double *)(v3 + 32) * 1000000000.0));
        dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      else
      {
        v10 = 0;
      }
      v12 = *(NSObject **)(v3 + 24);
    }
    else
    {
      v10 = 0;
      v12 = 0;
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_2;
    v13[3] = &unk_24CB18740;
    v14 = (id)v3;
    v15 = v10;
    v16 = a1;
    v17 = sel__lock_beginNextTask;
    v6 = (id)v3;
    v5 = v10;
    dispatch_async(v12, v13);

  }
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (void)_completeCurrentTaskWithResult:(void *)a3 error:
{
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v5 = a3;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 8));
    switch(a2)
    {
      case 0:
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        -[HDAsynchronousTaskTree _lock_insertPendingSubtasks]((const os_unfair_lock *)a1);
        -[HDAsynchronousTaskTree _lock_beginNextTask](a1);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        break;
      case 1:
      case 3:
        if (!v5)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 100, CFSTR("Asynchronous task failed without reporting an error."));
          v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
        v6 = (void *)objc_msgSend(*(id *)(a1 + 24), "copy");
        objc_msgSend(*(id *)(a1 + 24), "removeAllObjects");
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __63__HDAsynchronousTaskTree__completeCurrentTaskWithResult_error___block_invoke;
        v10[3] = &unk_24CB18348;
        v10[4] = a1;
        v7 = v10;
        goto LABEL_10;
      case 2:
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        *(_BYTE *)(a1 + 43) = 1;
        if (!v5)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 100, CFSTR("Asynchronous task had a critical failure without reporting an error."));
          v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", *(_QWORD *)(a1 + 24));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(*(id *)(a1 + 16), "copy");
        objc_msgSend(v6, "addObjectsFromArray:", v8);

        objc_msgSend(*(id *)(a1 + 24), "removeAllObjects");
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __63__HDAsynchronousTaskTree__completeCurrentTaskWithResult_error___block_invoke_2;
        v9[3] = &unk_24CB18348;
        v9[4] = a1;
        v7 = v9;
LABEL_10:
        -[HDAsynchronousTaskTree _runPendingCheckpointTasks:completion:](a1, v6, v7);

        break;
      default:
        break;
    }
  }

}

- (void)_lock_insertPendingSubtasks
{
  os_unfair_lock *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  if (a1)
  {
    v1 = (os_unfair_lock *)a1;
    os_unfair_lock_assert_owner(a1 + 2);
    v3 = *(_QWORD *)&v1[4]._os_unfair_lock_opaque;
    v2 = *(void **)&v1[6]._os_unfair_lock_opaque;
    v1 += 4;
    objc_msgSend(v2, "addObjectsFromArray:", v3);
    objc_msgSend(*(id *)&v1->_os_unfair_lock_opaque, "removeAllObjects");
    v4 = *(id *)&v1->_os_unfair_lock_opaque;
    objc_storeStrong((id *)v1, *(id *)&v1[2]._os_unfair_lock_opaque);
    v5 = *(void **)&v1[2]._os_unfair_lock_opaque;
    *(_QWORD *)&v1[2]._os_unfair_lock_opaque = v4;

  }
}

void __63__HDAsynchronousTaskTree__completeCurrentTaskWithResult_error___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  -[HDAsynchronousTaskTree _lock_beginNextTask](*(_QWORD *)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)_runPendingCheckpointTasks:(void *)a3 completion:
{
  id v5;
  id v6;
  HDSynchronousTaskGroup *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD block[6];
  HDSynchronousTaskGroup *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_alloc_init(HDSynchronousTaskGroup);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __64__HDAsynchronousTaskTree__runPendingCheckpointTasks_completion___block_invoke;
    v22[3] = &unk_24CB18790;
    v22[4] = a1;
    v23 = v6;
    -[HDSynchronousTaskGroup setDidFinish:](v7, "setDidFinish:", v22);
    -[HDSynchronousTaskGroup beginTask](v7, "beginTask");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          if (v13 && *(_QWORD *)(v13 + 40))
          {
            atomic_store(1u, (unsigned __int8 *)(a1 + 41));
            -[HDSynchronousTaskGroup beginTask](v7, "beginTask");
            v14 = *(NSObject **)(v13 + 24);
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __64__HDAsynchronousTaskTree__runPendingCheckpointTasks_completion___block_invoke_2;
            block[3] = &unk_24CB184E8;
            block[4] = v13;
            block[5] = a1;
            v17 = v7;
            dispatch_async(v14, block);

          }
          ++v12;
        }
        while (v10 != v12);
        v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        v10 = v15;
      }
      while (v15);
    }

    -[HDSynchronousTaskGroup finishTask](v7, "finishTask");
  }

}

void __63__HDAsynchronousTaskTree__completeCurrentTaskWithResult_error___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  -[HDAsynchronousTaskTree _lock_reportResult:](*(_QWORD *)(a1 + 32), 2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)_lock_reportResult:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v4 = (void *)MEMORY[0x212BD3780](*(_QWORD *)(a1 + 48));
    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v9 = v6;
    v7 = v6;
    v8 = v4;
    HKDispatchAsyncOnGlobalConcurrentQueue();

  }
}

void __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 41));
  -[HDAsynchronousTaskTree _lock_beginNextTask](*(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
}

void __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void (**v7)(id, uint64_t, _QWORD *);
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD handler[4];
  NSObject *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[4];
  char v23;

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2810000000;
  v22[3] = &unk_210FDF047;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    if (!*(_BYTE *)(v2 + 8))
      goto LABEL_4;
    v4 = *(void **)(a1 + 40);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_3;
    handler[3] = &unk_24CB186F0;
    v19 = v22;
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 48);
    v17 = v5;
    v18 = v6;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 40));

    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
LABEL_4:
      v2 = *(_QWORD *)(v2 + 16);
  }
  v7 = (void (**)(id, uint64_t, _QWORD *))(id)v2;
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_4;
  v10[3] = &unk_24CB18718;
  v9 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v13 = v20;
  v14 = v22;
  v10[4] = v9;
  v15 = v8;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v7[2](v7, v9, v10);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_3(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  id v4;

  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) == 0)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 100, CFSTR("Asynchronous task failed due to timeout"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[HDAsynchronousTaskTree _completeCurrentTaskWithResult:error:](*(_QWORD *)(a1 + 40), 2, v4);

  }
}

void __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    v12 = v5;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("HDAsynchronousTaskTree.m"), 269, CFSTR("Asynchronous task has already completed."));

    v5 = v12;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_BYTE *)(v6 + 24) = 1;
  v7 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if ((v8 & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v11 = v5;
    if (v9 && *(_BYTE *)(v9 + 8))
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
    -[HDAsynchronousTaskTree _completeCurrentTaskWithResult:error:](*(_QWORD *)(a1 + 32), a2, v11);
    v5 = v11;
  }

}

void __45__HDAsynchronousTaskTree__lock_reportResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __64__HDAsynchronousTaskTree__runPendingCheckpointTasks_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 41));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__HDAsynchronousTaskTree__runPendingCheckpointTasks_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "finishTask");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_groupDescription);
}

- (NSString)groupDescription
{
  return self->_groupDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupDescription, 0);
  objc_storeStrong((id *)&self->_default_task_queue, 0);
  objc_storeStrong(&self->_lock_completion, 0);
  objc_storeStrong((id *)&self->_lock_taskErrors, 0);
  objc_storeStrong((id *)&self->_lock_pendingSubtasks, 0);
  objc_storeStrong((id *)&self->_lock_pendingTasks, 0);
}

@end
