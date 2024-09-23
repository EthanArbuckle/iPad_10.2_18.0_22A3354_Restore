@implementation MCMTestLocks

- (MCMTestLocks)init
{
  MCMTestLocks *v2;
  MCMTestLocks *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *stateQueue;
  uint64_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)MCMTestLocks;
  v2 = -[MCMTestLocks init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 0;
    v4 = dispatch_queue_create("com.apple.containermanagerd.MCMTestLocks.stateQueue", 0);
    stateQueue = v3->_stateQueue;
    v3->_stateQueue = (OS_dispatch_queue *)v4;

    v6 = 0;
    v7 = MEMORY[0x1E0C80D50];
    do
    {
      v8 = dispatch_queue_create("com.apple.containermanagerd.MCMTestLocks.lockQueue", v7);
      v9 = v3->_lockQueue[v6];
      v3->_lockQueue[v6] = (OS_dispatch_queue *)v8;

      v10 = dispatch_semaphore_create(0);
      v11 = v3->_lockSemaphore[v6];
      v3->_lockSemaphore[v6] = (OS_dispatch_semaphore *)v10;

      ++v6;
    }
    while (v6 != 15);
  }
  return v3;
}

- (void)acquireLock:(unint64_t)a3
{
  NSObject *v5;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  -[MCMTestLocks stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MCMTestLocks_acquireLock___block_invoke;
  block[3] = &unk_1E8CB4968;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(v5, block);

}

- (void)releaseLock:(unint64_t)a3
{
  NSObject *v5;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  -[MCMTestLocks stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MCMTestLocks_releaseLock___block_invoke;
  block[3] = &unk_1E8CB4968;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(v5, block);

}

- (void)releaseAllLocks
{
  NSObject *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  -[MCMTestLocks stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__MCMTestLocks_releaseAllLocks__block_invoke;
  v4[3] = &unk_1E8CB6458;
  v4[4] = self;
  dispatch_sync(v3, v4);

}

- (void)waitOnLock:(unint64_t)a3
{
  OS_dispatch_queue *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[MCMTestLocks enabled](self, "enabled"))
  {
    v5 = self->_lockQueue[a3];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_1CF807000, v8, OS_LOG_TYPE_DEFAULT, "[%s] Waiting on lock: %llu", buf, 0x16u);
    }

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__MCMTestLocks_waitOnLock___block_invoke;
    v10[3] = &unk_1E8CB4968;
    v11 = v7;
    v12 = a3;
    v9 = v7;
    dispatch_sync((dispatch_queue_t)v5, v10);

  }
}

- (int64_t)countOfLock:(unint64_t)a3
{
  NSObject *v5;
  int64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = -1;
  if (-[MCMTestLocks enabled](self, "enabled"))
  {
    -[MCMTestLocks stateQueue](self, "stateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __28__MCMTestLocks_countOfLock___block_invoke;
    v8[3] = &unk_1E8CB5C68;
    v8[4] = self;
    v8[5] = &v9;
    v8[6] = a3;
    dispatch_sync(v5, v8);

  }
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  MCMTestLocks *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    if (!v4->_enabled)
    {
      container_log_handle_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 0;
        v6 = "Enabled test locks feature.";
        v7 = (uint8_t *)&v9;
LABEL_8:
        _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v4->_enabled)
  {
    -[MCMTestLocks releaseAllLocks](v4, "releaseAllLocks");
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v6 = "Disabled test locks feature.";
      v7 = (uint8_t *)&v8;
      goto LABEL_8;
    }
LABEL_9:

  }
  v4->_enabled = v3;
  objc_sync_exit(v4);

}

- (BOOL)enabled
{
  MCMTestLocks *v2;
  BOOL enabled;

  v2 = self;
  objc_sync_enter(v2);
  enabled = v2->_enabled;
  objc_sync_exit(v2);

  return enabled;
}

- (void)_stateQueue_updateCountForLock:(unint64_t)a3 byCount:(int64_t)a4
{
  int64_t *lockCount;
  int64_t v6;
  int64_t v7;
  BOOL v8;
  NSObject *v10;
  int64_t v11;
  uint8_t buf[4];
  unint64_t v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    lockCount = self->_lockCount;
    v6 = self->_lockCount[a3];
    v7 = v6 + a4;
    if (v6 + a4 < 0)
    {
      v11 = self->_lockCount[a3];
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v13 = a3;
        v14 = 2048;
        v15 = a4;
        v16 = 2048;
        v17 = v11;
        _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Unbalanced update to test lock: %llu by: %ld from: %ld", buf, 0x20u);
      }

      abort();
    }
    if (v6)
      v8 = 1;
    else
      v8 = v7 == 0;
    if (v8)
    {
      if (!v7)
        -[MCMTestLocks _stateQueue_releaseLock:](self, "_stateQueue_releaseLock:", a3);
    }
    else
    {
      -[MCMTestLocks _stateQueue_acquireLock:](self, "_stateQueue_acquireLock:", a3);
    }
    lockCount[a3] = v7;
  }
}

- (void)_stateQueue_acquireLock:(unint64_t)a3
{
  id *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(&self->super.isa + a3);
  v5 = v4[31];
  v6 = v4[16];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MCMTestLocks__stateQueue_acquireLock___block_invoke;
  block[3] = &unk_1E8CB4968;
  v10 = v5;
  v11 = a3;
  v7 = v5;
  v8 = v6;
  dispatch_barrier_async(v8, block);

}

- (void)_stateQueue_releaseLock:(unint64_t)a3
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lockSemaphore[a3]);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateQueue, a3);
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong((id *)&self->_stateQueue, 0);
  for (i = 0; i != -15; --i)
    objc_storeStrong((id *)&self->_lockSemaphore[i + 14], 0);
  for (j = 240; j != 120; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
}

void __40__MCMTestLocks__stateQueue_acquireLock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1CF807000, v2, OS_LOG_TYPE_DEFAULT, "Blocking waiters for lock: %llu", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  container_log_handle_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 134217984;
    v7 = v5;
    _os_log_impl(&dword_1CF807000, v4, OS_LOG_TYPE_DEFAULT, "Unblocking waiters for lock: %llu", (uint8_t *)&v6, 0xCu);
  }

}

_QWORD *__28__MCMTestLocks_countOfLock___block_invoke(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 8 * result[6] + 8);
  return result;
}

void __27__MCMTestLocks_waitOnLock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 136315394;
    v6 = v3;
    v7 = 2048;
    v8 = v4;
    _os_log_impl(&dword_1CF807000, v2, OS_LOG_TYPE_DEFAULT, "[%s] No longer waiting on lock: %llu", (uint8_t *)&v5, 0x16u);
  }

}

void __31__MCMTestLocks_releaseAllLocks__block_invoke(uint64_t a1)
{
  uint64_t i;
  NSObject *v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  for (i = 1; i != 16; ++i)
    objc_msgSend(*(id *)(a1 + 32), "_stateQueue_updateCountForLock:byCount:", i - 1, -*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * i));
  container_log_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CF807000, v3, OS_LOG_TYPE_DEFAULT, "Released all test locks.", v4, 2u);
  }

}

void __28__MCMTestLocks_releaseLock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_updateCountForLock:byCount:", *(_QWORD *)(a1 + 40), -1);
  container_log_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v3 + 8);
    v5 = 134218240;
    v6 = v3;
    v7 = 2048;
    v8 = v4;
    _os_log_impl(&dword_1CF807000, v2, OS_LOG_TYPE_DEFAULT, "Released test lock: %llu; count: %ld",
      (uint8_t *)&v5,
      0x16u);
  }

}

void __28__MCMTestLocks_acquireLock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_updateCountForLock:byCount:", *(_QWORD *)(a1 + 40), 1);
  container_log_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v3 + 8);
    v5 = 134218240;
    v6 = v3;
    v7 = 2048;
    v8 = v4;
    _os_log_impl(&dword_1CF807000, v2, OS_LOG_TYPE_DEFAULT, "Acquired test lock: %llu; count: %ld",
      (uint8_t *)&v5,
      0x16u);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_singleton;
}

void __30__MCMTestLocks_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = v0;

}

@end
