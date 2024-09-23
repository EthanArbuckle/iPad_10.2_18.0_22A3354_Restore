@implementation HKRateLimiter

- (HKRateLimiter)initWithLimit:(unint64_t)a3 timeInterval:(double)a4
{
  HKRateLimiter *v6;
  HKRateLimiter *v7;
  NSMutableArray *v8;
  NSMutableArray *history;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKRateLimiter;
  v6 = -[HKRateLimiter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_limit = a3;
    v6->_timeInterval = a4;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    history = v7->_history;
    v7->_history = v8;

  }
  return v7;
}

- (BOOL)perform:(id)a3 cost:(unint64_t)a4
{
  void (**v6)(_QWORD);
  os_unfair_lock_s *p_lock;
  unint64_t v8;
  unint64_t limit;
  NSMutableArray *history;
  _HKRateLimiterOperationRecord *v11;
  void *v12;
  _QWORD *v13;

  v6 = (void (**)(_QWORD))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[HKRateLimiter _lock_usedBudget]((uint64_t)self) + a4;
  limit = self->_limit;
  if (v8 > limit)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    history = self->_history;
    v11 = [_HKRateLimiterOperationRecord alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_HKRateLimiterOperationRecord initWithDatePerformed:cost:](v11, v12, a4);
    -[NSMutableArray addObject:](history, "addObject:", v13);

    os_unfair_lock_unlock(p_lock);
    v6[2](v6);
  }

  return v8 <= limit;
}

- (uint64_t)_lock_usedBudget
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v1 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -*(double *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(v1 + 16);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __33__HKRateLimiter__lock_usedBudget__block_invoke;
    v15[3] = &unk_1E37ED678;
    v4 = v2;
    v16 = v4;
    objc_msgSend(v3, "hk_removeObjectsPassingTest:", v15);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = *(id *)(v1 + 16);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    if (v6)
    {
      v7 = v6;
      v1 = 0;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v1 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "cost", (_QWORD)v11);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      }
      while (v7);
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

BOOL __33__HKRateLimiter__lock_usedBudget__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "datePerformed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) == -1;

  return v4;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
}

@end
