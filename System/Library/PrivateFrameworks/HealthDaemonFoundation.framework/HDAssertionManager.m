@implementation HDAssertionManager

void __53__HDAssertionManager__postNotification_forAssertion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v7 = CFSTR("HDAssertionManagerAssertionKey");
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, v4, v6);

}

- (void)_releaseAssertion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssertionManager _lock_releaseAssertion:]((uint64_t)self, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_releaseAssertion:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (!*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v3, "assertionIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = *(id *)(v5 + 16);
        v8 = objc_msgSend(v7, "count");
        objc_msgSend(v7, "removeObject:", v3);
        v9 = objc_msgSend(v7, "count");
        if (v9 == v8)
        {
          _HKInitializeLogging();
          HKLogAssertions();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

          if (v11)
          {
            HKLogAssertions();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              -[HDAssertionManager _lock_releaseAssertion:].cold.1((uint64_t)v4, (uint64_t)v3, v12);

          }
        }
        if (!v9)
        {
          objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v4);
          if (!objc_msgSend(*(id *)(a1 + 24), "count"))
          {
            v13 = *(void **)(a1 + 24);
            *(_QWORD *)(a1 + 24) = 0;

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __45__HDAssertionManager__lock_releaseAssertion___block_invoke;
        v15[3] = &unk_24CB186A0;
        v15[4] = a1;
        v16 = v3;
        objc_msgSend(v14, "notifyObservers:", v15);

        -[HDAssertionManager _postNotification:forAssertion:](a1, CFSTR("HDAssertionManagerAssertionReturnedNotification"), v4);
      }

    }
  }

}

- (BOOL)takeAssertion:(id)a3
{
  return -[HDAssertionManager takeAssertion:preNotificationBlock:](self, "takeAssertion:preNotificationBlock:", a3, 0);
}

- (BOOL)hasActiveAssertion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
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
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "assertionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__HDAssertionManager_hasActiveAssertion___block_invoke;
  v8[3] = &unk_24CB18628;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[HDAssertionManager _lock_enumerateActiveAssertionsWithIdentifier:handler:]((uint64_t)self, v5, v8);

  os_unfair_lock_unlock(&self->_lock);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (void)_lock_enumerateActiveAssertionsWithIdentifier:(void *)a3 handler:
{
  id v5;
  void (**v6)(id, void *, _BYTE *);
  _QWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v5);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    if (v7)
      v7 = (_QWORD *)v7[2];
    objc_msgSend(v7, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if (objc_msgSend(v14, "state") == 2)
        {
          v15 = 0;
          v6[2](v6, v14, &v15);
          if (v15)
            break;
        }
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v11)
            goto LABEL_6;
          break;
        }
      }
    }

  }
}

void __41__HDAssertionManager_hasActiveAssertion___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ownerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ownerIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

    v13 = v14;
  }
  else
  {
    v7 = (void *)v6;
    objc_msgSend(v14, "ownerIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {

      v13 = v14;
      goto LABEL_8;
    }
    v9 = (void *)v8;
    objc_msgSend(*(id *)(a1 + 32), "ownerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ownerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    v13 = v14;
    if (!v12)
      goto LABEL_8;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *a3 = 1;
LABEL_8:

}

- (void)_postNotification:(void *)a3 forAssertion:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__HDAssertionManager__postNotification_forAssertion___block_invoke;
    block[3] = &unk_24CB184E8;
    v9 = v5;
    v10 = a1;
    v11 = v6;
    dispatch_async(v7, block);

  }
}

- (void)_lock_consumeBudgetsThenResetTimerWithIntermediateBlock:(uint64_t)a1
{
  id v3;
  double v4;
  double v5;
  int v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    HKMachAbsoluteTimeGetCurrent();
    v5 = v4;
    v6 = *(unsigned __int8 *)(a1 + 41);
    if (*(_BYTE *)(a1 + 41))
      -[HDAssertionManager _lock_consumeBudgetsThroughTime:](a1, v4);
    v3 = v7;
    if (v7)
    {
      (*((void (**)(id))v7 + 2))(v7);
      v3 = v7;
    }
    if (v6)
    {
      -[HDAssertionManager _lock_setBudgetConsumptionTimerWithStartTime:](a1, v5);
      v3 = v7;
    }
  }

}

uint64_t __45__HDAssertionManager__lock_releaseAssertion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assertionManager:assertionInvalidated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (HDAssertionManager)init
{
  HDAssertionManager *v2;
  HDAssertionManager *v3;
  uint64_t v4;
  OS_dispatch_queue *notificationQueue;
  uint64_t v6;
  OS_dispatch_queue *budgetTimerQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *observerSetsByAssertionIdentifier;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HDAssertionManager;
  v2 = -[HDAssertionManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v4;

    +[HDAssertionManager _sharedBudgetTimerQueue]();
    v6 = objc_claimAutoreleasedReturnValue();
    budgetTimerQueue = v3->_budgetTimerQueue;
    v3->_budgetTimerQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    observerSetsByAssertionIdentifier = v3->_observerSetsByAssertionIdentifier;
    v3->_observerSetsByAssertionIdentifier = v8;

    v3->_consumeBudgets = 0;
  }
  return v3;
}

+ (id)_sharedBudgetTimerQueue
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__HDAssertionManager__sharedBudgetTimerQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (_sharedBudgetTimerQueue_onceToken != -1)
    dispatch_once(&_sharedBudgetTimerQueue_onceToken, block);
  return (id)_sharedBudgetTimerQueue_queue;
}

- (void)dealloc
{
  objc_super v3;

  -[HDAssertionManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDAssertionManager;
  -[HDAssertionManager dealloc](&v3, sel_dealloc);
}

void __45__HDAssertionManager__sharedBudgetTimerQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  HKCreateSerialDispatchQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sharedBudgetTimerQueue_queue;
  _sharedBudgetTimerQueue_queue = v0;

}

- (BOOL)hasActiveAssertionForIdentifier:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  os_unfair_lock_lock(&self->_lock);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HDAssertionManager_hasActiveAssertionForIdentifier___block_invoke;
  v7[3] = &unk_24CB18600;
  v7[4] = &v8;
  -[HDAssertionManager _lock_enumerateActiveAssertionsWithIdentifier:handler:]((uint64_t)self, v4, v7);
  os_unfair_lock_unlock(&self->_lock);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __54__HDAssertionManager_hasActiveAssertionForIdentifier___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (id)activeAssertionsForIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__HDAssertionManager_activeAssertionsForIdentifier___block_invoke;
  v10[3] = &unk_24CB18650;
  v11 = v6;
  v7 = v6;
  -[HDAssertionManager _lock_enumerateActiveAssertionsWithIdentifier:handler:]((uint64_t)self, v5, v10);

  os_unfair_lock_unlock(&self->_lock);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

uint64_t __52__HDAssertionManager_activeAssertionsForIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)allAssertionsForIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionRecordsByIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (void *)v6[2];
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)ownerIdentifiersForAssertionIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__HDAssertionManager_ownerIdentifiersForAssertionIdentifier___block_invoke;
  v10[3] = &unk_24CB18650;
  v11 = v6;
  v7 = v6;
  -[HDAssertionManager _lock_enumerateActiveAssertionsWithIdentifier:handler:]((uint64_t)self, v5, v10);

  os_unfair_lock_unlock(&self->_lock);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

void __61__HDAssertionManager_ownerIdentifiersForAssertionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "ownerIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)takeAssertion:(id)a3 preNotificationBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  os_unfair_lock_s *p_lock;
  BOOL v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *assertionRecordsByIdentifier;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  int v18;
  char v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  void *v30;
  _QWORD v31[5];
  id v32;
  char *v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    if (!self->_assertionRecordsByIdentifier)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      assertionRecordsByIdentifier = self->_assertionRecordsByIdentifier;
      self->_assertionRecordsByIdentifier = v10;

    }
    objc_msgSend(v6, "assertionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "_takeWithManager:", self);
    v9 = v13 == 2;
    if (v13 != 2)
    {
      v23 = v13;
      _HKInitializeLogging();
      HKLogAssertions();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v23 == 3)
      {
        v26 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);

        if (!v26)
        {
LABEL_27:
          os_unfair_lock_unlock(p_lock);
LABEL_28:

          goto LABEL_29;
        }
        HKLogAssertions();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v38 = v12;
          v39 = 2114;
          v40 = v6;
          _os_log_impl(&dword_210F9A000, v25, OS_LOG_TYPE_INFO, "%{public}@: Cannot retake invalidated assertion %{public}@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v38 = v12;
        v39 = 2114;
        v40 = v6;
        v41 = 2048;
        v42 = v23;
        _os_log_error_impl(&dword_210F9A000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected state for assertion %{public}@: %ld", buf, 0x20u);
      }

      goto LABEL_27;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionRecordsByIdentifier, "objectForKeyedSubscript:", v12);
    v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v14
      || (v14 = -[_HDAssertionRecord initWithAssertionIdentifier:]([_HDAssertionRecord alloc], v12),
          v15 = self->_assertionRecordsByIdentifier,
          objc_msgSend(v6, "assertionIdentifier"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, v16),
          v16,
          v14))
    {
      v17 = (void *)v14[2];
    }
    else
    {
      v17 = 0;
    }
    v18 = objc_msgSend(v17, "containsObject:", v6);
    v19 = v18;
    v30 = v12;
    if (v18)
    {
      _HKInitializeLogging();
      HKLogAssertions();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

      if (!v21)
        goto LABEL_20;
      HKLogAssertions();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v38 = v30;
        v39 = 2114;
        v40 = v6;
        _os_log_impl(&dword_210F9A000, v22, OS_LOG_TYPE_INFO, "%{public}@: Assertion %{public}@ already taken", buf, 0x16u);
      }
    }
    else
    {
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __57__HDAssertionManager_takeAssertion_preNotificationBlock___block_invoke;
      v34[3] = &unk_24CB18410;
      v35 = v14;
      v27 = v6;
      v36 = v27;
      -[HDAssertionManager _lock_consumeBudgetsThenResetTimerWithIntermediateBlock:]((uint64_t)self, v34);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_observerSetsByAssertionIdentifier, "objectForKeyedSubscript:", v12);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __57__HDAssertionManager_takeAssertion_preNotificationBlock___block_invoke_2;
      v31[3] = &unk_24CB18678;
      v33 = sel_assertionManager_assertionTaken_;
      v31[4] = self;
      v32 = v27;
      objc_msgSend(v28, "notifyObservers:", v31);

      v22 = v35;
    }

LABEL_20:
    os_unfair_lock_unlock(&self->_lock);
    v12 = v30;
    if ((v19 & 1) == 0)
    {
      if (v7)
        v7[2](v7);
      -[HDAssertionManager _postNotification:forAssertion:]((uint64_t)self, CFSTR("HDAssertionManagerAssertionTakenNotification"), v30);
    }
    goto LABEL_28;
  }
  os_unfair_lock_unlock(&self->_lock);
  v9 = 0;
LABEL_29:

  return v9;
}

uint64_t __57__HDAssertionManager_takeAssertion_preNotificationBlock___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[2];
  return objc_msgSend(v1, "addObject:", *(_QWORD *)(a1 + 40));
}

void __57__HDAssertionManager_takeAssertion_preNotificationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assertionManager:assertionTaken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)resumeBudgetConsumption
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDAssertionManager _lock_resumeBudgetConsumption]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_resumeBudgetConsumption
{
  double v2;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (!*(_BYTE *)(a1 + 41))
    {
      *(_BYTE *)(a1 + 41) = 1;
      HKMachAbsoluteTimeGetCurrent();
      -[HDAssertionManager _lock_setBudgetConsumptionTimerWithStartTime:](a1, v2);
    }
  }
}

- (void)suspendBudgetConsumption
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDAssertionManager _lock_suspendBudgetConsumption]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_suspendBudgetConsumption
{
  double v2;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (*(_BYTE *)(a1 + 41))
    {
      *(_BYTE *)(a1 + 41) = 0;
      HKMachAbsoluteTimeGetCurrent();
      -[HDAssertionManager _lock_consumeBudgetsThroughTime:](a1, v2);
    }
  }
}

- (void)addObserver:(id)a3 forAssertionIdentifier:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_observerSetsByAssertionIdentifier, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = objc_alloc(MEMORY[0x24BDD3DD0]);
      HKLogAssertions();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v11, "initWithName:loggingCategory:", v8, v12);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observerSetsByAssertionIdentifier, "setObject:forKeyedSubscript:", v10, v8);
    }
    objc_msgSend(v10, "registerObserver:queue:", v13, v9);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3 forAssertionIdentifier:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observerSetsByAssertionIdentifier, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unregisterObserver:", v8);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_observerSetsByAssertionIdentifier;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_observerSetsByAssertionIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unregisterObserver:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)invalidate
{
  id v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSMutableDictionary *assertionRecordsByIdentifier;
  NSMutableDictionary *observerSetsByAssertionIdentifier;
  NSObject *budgetConsumptionTimer;
  OS_dispatch_source *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[NSMutableDictionary allValues](self->_assertionRecordsByIdentifier, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v36;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v9);
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          if (v10)
            v11 = *(void **)(v10 + 16);
          else
            v11 = 0;
          objc_msgSend(v11, "objectEnumerator");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v32 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            }
            while (v14);
          }

          ++v9;
        }
        while (v9 != v7);
        v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        v7 = v17;
      }
      while (v17);
    }

    assertionRecordsByIdentifier = self->_assertionRecordsByIdentifier;
    self->_assertionRecordsByIdentifier = 0;

    observerSetsByAssertionIdentifier = self->_observerSetsByAssertionIdentifier;
    self->_observerSetsByAssertionIdentifier = 0;

    budgetConsumptionTimer = self->_budgetConsumptionTimer;
    p_lock = &self->_lock;
    if (budgetConsumptionTimer)
    {
      dispatch_source_cancel(budgetConsumptionTimer);
      v21 = self->_budgetConsumptionTimer;
      self->_budgetConsumptionTimer = 0;

    }
  }
  os_unfair_lock_unlock(p_lock);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = v3;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "_invalidateAndRelease:", 0);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v24);
  }

}

- (void)_budgetConsumptionTimerDidFire
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  os_unfair_lock_s *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    _HKInitializeLogging();
    HKLogAssertions();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

    if (v4)
    {
      HKLogAssertions();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = 138543362;
        v7 = a1;
        _os_log_impl(&dword_210F9A000, v5, OS_LOG_TYPE_INFO, "%{public}@: Budget Consumption timer fired.", (uint8_t *)&v6, 0xCu);
      }

    }
    -[HDAssertionManager _lock_consumeBudgetsThenResetTimerWithIntermediateBlock:](a1, 0);
    os_unfair_lock_unlock(v2);
  }
}

- (void)_lock_setBudgetConsumptionTimerWithStartTime:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  dispatch_time_t v22;
  dispatch_source_t v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(*(id *)(a1 + 24), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v34;
      v8 = 1.79769313e308;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v9);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          if (v10)
            v11 = *(void **)(v10 + 16);
          else
            v11 = 0;
          objc_msgSend(v11, "objectEnumerator");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v30 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                objc_msgSend(v17, "remainingBudget");
                if (v8 >= v18)
                  v8 = v18;
                objc_msgSend(v17, "_setBudgetIntervalStartTime:", a2);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v14);
          }

          ++v9;
        }
        while (v9 != v6);
        v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        v6 = v19;
      }
      while (v19);

      if (v8 < 1.79769313e308)
      {
        v20 = *(NSObject **)(a1 + 48);
        if (v20)
        {
          dispatch_source_cancel(v20);
          v21 = *(void **)(a1 + 48);
          *(_QWORD *)(a1 + 48) = 0;

        }
        v22 = dispatch_time(0, (unint64_t)(v8 * 1000000000.0));
        v23 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 56));
        v24 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v23;

        dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 48), v22, 0xFFFFFFFFFFFFFFFFLL, 0);
        objc_initWeak(&location, (id)a1);
        v25 = *(NSObject **)(a1 + 48);
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __67__HDAssertionManager__lock_setBudgetConsumptionTimerWithStartTime___block_invoke;
        v26[3] = &unk_24CB186C8;
        objc_copyWeak(&v27, &location);
        dispatch_source_set_event_handler(v25, v26);
        dispatch_activate(*(dispatch_object_t *)(a1 + 48));
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
    }
    else
    {

    }
  }
}

- (void)_lock_consumeBudgetsThroughTime:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = a1;
    objc_msgSend(*(id *)(a1 + 24), "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v35;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v35 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v8);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          if (v9)
            v10 = *(void **)(v9 + 16);
          else
            v10 = 0;
          objc_msgSend(v10, "objectEnumerator");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v31 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                if (objc_msgSend(v16, "_consumeFromBudgetThroughTime:", a2))
                {
                  if (!v6)
                    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                  objc_msgSend(v6, "addObject:", v16);
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
            }
            while (v13);
          }

          ++v8;
        }
        while (v8 != v5);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        v5 = v17;
      }
      while (v17);
    }
    else
    {
      v6 = 0;
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v23, "_invalidateAndRelease:", 0);
          -[HDAssertionManager _lock_releaseAssertion:](v24, v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v20);
    }

  }
}

void __67__HDAssertionManager__lock_setBudgetConsumptionTimerWithStartTime___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  -[HDAssertionManager _budgetConsumptionTimerDidFire](WeakRetained);

}

- (OS_dispatch_queue)budgetTimerQueue
{
  return self->_budgetTimerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetTimerQueue, 0);
  objc_storeStrong((id *)&self->_budgetConsumptionTimer, 0);
  objc_storeStrong((id *)&self->_observerSetsByAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionRecordsByIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)_lock_releaseAssertion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_210F9A000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Released %{public}@ was not found", (uint8_t *)&v3, 0x16u);
}

@end
