@implementation MTTimerCache

void __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __int128 v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    MTLogForCategory(4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_cold_1(a1, (uint64_t)v9, v10);

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v11 + 16))(v11, 0, 0, v9);
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_2;
    v14[3] = &unk_1E39CDC70;
    v14[4] = v12;
    v15 = v7;
    v16 = v8;
    v17 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v12, "_withLock:", v14);
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v13 + 16))(v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);

  }
}

- (void)getCachedTimersWithCompletion:(id)a3
{
  -[MTTimerCache _getCachedTimersWithCompletion:doSynchronous:](self, "_getCachedTimersWithCompletion:doSynchronous:", a3, 0);
}

- (void)_getCachedTimersWithCompletion:(id)a3 doSynchronous:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void (**updateBlock)(id, _QWORD *, _BOOL8);
  _QWORD v9[7];
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a4;
  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9;
  v24 = __Block_byref_object_dispose__9;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__9;
  v18 = __Block_byref_object_dispose__9;
  v19 = 0;
  if (-[MTTimerCache _isUpdateNeeded](self, "_isUpdateNeeded"))
  {
    MTLogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MTAlarmCache _getCachedAlarmsWithCompletion:doSynchronous:].cold.1((uint64_t)self, v7);

    updateBlock = (void (**)(id, _QWORD *, _BOOL8))self->_updateBlock;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke;
    v10[3] = &unk_1E39CDC98;
    v10[4] = self;
    v12 = &v20;
    v13 = &v14;
    v11 = v6;
    updateBlock[2](updateBlock, v10, v4);

  }
  else if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_2;
    v9[3] = &unk_1E39CDCC0;
    v9[4] = self;
    v9[5] = &v20;
    v9[6] = &v14;
    -[MTTimerCache _withLock:](self, "_withLock:", v9);
    (*((void (**)(id, uint64_t, uint64_t, _QWORD))v6 + 2))(v6, v21[5], v15[5], 0);
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

- (BOOL)_isUpdateNeeded
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__MTTimerCache__isUpdateNeeded__block_invoke;
  v4[3] = &unk_1E39CBB50;
  v4[4] = self;
  v4[5] = &v5;
  -[MTTimerCache _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_cacheLock;
  void (**v4)(_QWORD);

  p_cacheLock = &self->_cacheLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_cacheLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_cacheLock);
}

void __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __31__MTTimerCache__isUpdateNeeded__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (MTTimerCache)initWithUpdateBlock:(id)a3
{
  id v4;
  MTTimerCache *v5;
  uint64_t v6;
  NSMutableArray *orderedTimers;
  MTTimer *nextTimer;
  uint64_t v9;
  id updateBlock;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTTimerCache;
  v5 = -[MTTimerCache init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    orderedTimers = v5->_orderedTimers;
    v5->_orderedTimers = (NSMutableArray *)v6;

    nextTimer = v5->_nextTimer;
    v5->_nextTimer = 0;

    v5->_needsUpdate = 1;
    v9 = objc_msgSend(v4, "copy");
    updateBlock = v5->_updateBlock;
    v5->_updateBlock = (id)v9;

    v5->_cacheLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

void __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_2(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
}

- (void)markNeedsUpdate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __31__MTTimerCache_markNeedsUpdate__block_invoke;
  v2[3] = &unk_1E39CB858;
  v2[4] = self;
  -[MTTimerCache _withLock:](self, "_withLock:", v2);
}

uint64_t __31__MTTimerCache_markNeedsUpdate__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 1;
  return result;
}

- (void)getCachedTimersSyncWithCompletion:(id)a3
{
  -[MTTimerCache _getCachedTimersWithCompletion:doSynchronous:](self, "_getCachedTimersWithCompletion:doSynchronous:", a3, 1);
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)orderedTimers
{
  return self->_orderedTimers;
}

- (void)setOrderedTimers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedTimers, a3);
}

- (MTTimer)nextTimer
{
  return self->_nextTimer;
}

- (void)setNextTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nextTimer, a3);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void)setCacheLock:(os_unfair_lock_s)a3
{
  self->_cacheLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextTimer, 0);
  objc_storeStrong((id *)&self->_orderedTimers, 0);
  objc_storeStrong(&self->_updateBlock, 0);
}

void __61__MTTimerCache__getCachedTimersWithCompletion_doSynchronous___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ - Error getting timers: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
