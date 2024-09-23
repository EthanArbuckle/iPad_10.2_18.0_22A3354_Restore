@implementation MTAlarmCache

void __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  uint64_t v22;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    MTLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_cold_1(a1, (uint64_t)v12, v13);

    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v14 + 16))(v14, 0, 0, 0, v12);
  }
  else
  {
    v15 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_2;
    v17[3] = &unk_1E39CCDB0;
    v17[4] = v15;
    v18 = v9;
    v19 = v10;
    v20 = v11;
    v21 = *(_OWORD *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v15, "_withLock:", v17);
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v16 + 16))(v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 0);

  }
}

- (void)getCachedAlarmsWithCompletion:(id)a3
{
  -[MTAlarmCache _getCachedAlarmsWithCompletion:doSynchronous:](self, "_getCachedAlarmsWithCompletion:doSynchronous:", a3, 0);
}

- (void)_getCachedAlarmsWithCompletion:(id)a3 doSynchronous:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void (**updateBlock)(id, _QWORD *, _BOOL8);
  _QWORD v9[8];
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a4;
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6;
  v31 = __Block_byref_object_dispose__6;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  if (-[MTAlarmCache _isUpdateNeeded](self, "_isUpdateNeeded"))
  {
    MTLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MTAlarmCache _getCachedAlarmsWithCompletion:doSynchronous:].cold.1((uint64_t)self, v7);

    updateBlock = (void (**)(id, _QWORD *, _BOOL8))self->_updateBlock;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke;
    v10[3] = &unk_1E39CCDD8;
    v10[4] = self;
    v12 = &v27;
    v13 = &v21;
    v14 = &v15;
    v11 = v6;
    updateBlock[2](updateBlock, v10, v4);

  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_2;
    v9[3] = &unk_1E39CCE00;
    v9[4] = self;
    v9[5] = &v27;
    v9[6] = &v21;
    v9[7] = &v15;
    -[MTAlarmCache _withLock:](self, "_withLock:", v9);
    if (v6)
      (*((void (**)(id, uint64_t, uint64_t, uint64_t, _QWORD))v6 + 2))(v6, v28[5], v22[5], v16[5], 0);
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

- (void)_getCachedAlarmsWithCompletion:(uint64_t)a1 doSynchronous:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_DEBUG, "%@ - Cache Miss", (uint8_t *)&v2, 0xCu);
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
  v4[2] = __31__MTAlarmCache__isUpdateNeeded__block_invoke;
  v4[3] = &unk_1E39CBB50;
  v4[4] = self;
  v4[5] = &v5;
  -[MTAlarmCache _withLock:](self, "_withLock:", v4);
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

uint64_t __31__MTAlarmCache__isUpdateNeeded__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

void __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  v8 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

void __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_2(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 40));
}

- (MTAlarmCache)initWithUpdateBlock:(id)a3
{
  id v4;
  MTAlarmCache *v5;
  uint64_t v6;
  NSMutableArray *orderedAlarms;
  uint64_t v8;
  NSMutableArray *sleepAlarms;
  MTAlarm *nextAlarm;
  uint64_t v11;
  id updateBlock;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTAlarmCache;
  v5 = -[MTAlarmCache init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    orderedAlarms = v5->_orderedAlarms;
    v5->_orderedAlarms = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    sleepAlarms = v5->_sleepAlarms;
    v5->_sleepAlarms = (NSMutableArray *)v8;

    nextAlarm = v5->_nextAlarm;
    v5->_nextAlarm = 0;

    v5->_needsUpdate = 1;
    v11 = objc_msgSend(v4, "copy");
    updateBlock = v5->_updateBlock;
    v5->_updateBlock = (id)v11;

    v5->_cacheLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)markNeedsUpdate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __31__MTAlarmCache_markNeedsUpdate__block_invoke;
  v2[3] = &unk_1E39CB858;
  v2[4] = self;
  -[MTAlarmCache _withLock:](self, "_withLock:", v2);
}

uint64_t __31__MTAlarmCache_markNeedsUpdate__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 1;
  return result;
}

- (void)getCachedAlarmsSyncWithCompletion:(id)a3
{
  -[MTAlarmCache _getCachedAlarmsWithCompletion:doSynchronous:](self, "_getCachedAlarmsWithCompletion:doSynchronous:", a3, 1);
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)orderedAlarms
{
  return self->_orderedAlarms;
}

- (void)setOrderedAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_orderedAlarms, a3);
}

- (NSMutableArray)sleepAlarms
{
  return self->_sleepAlarms;
}

- (void)setSleepAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_sleepAlarms, a3);
}

- (MTAlarm)nextAlarm
{
  return self->_nextAlarm;
}

- (void)setNextAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_nextAlarm, a3);
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
  objc_storeStrong((id *)&self->_nextAlarm, 0);
  objc_storeStrong((id *)&self->_sleepAlarms, 0);
  objc_storeStrong((id *)&self->_orderedAlarms, 0);
  objc_storeStrong(&self->_updateBlock, 0);
}

void __61__MTAlarmCache__getCachedAlarmsWithCompletion_doSynchronous___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ - Error getting alarms: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
