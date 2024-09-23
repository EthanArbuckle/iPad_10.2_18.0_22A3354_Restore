@implementation LACCache

- (LACCache)initWithTimeout:(double)a3
{
  LACCache *v4;
  LACCache *v5;
  uint64_t v6;
  NSMutableDictionary *cachedValues;
  uint64_t v8;
  OS_dispatch_queue *workQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LACCache;
  v4 = -[LACCache init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_timeout = a3;
    v6 = objc_opt_new();
    cachedValues = v5->_cachedValues;
    v5->_cachedValues = (NSMutableDictionary *)v6;

    v5->_cachedValuesLock._os_unfair_lock_opaque = 0;
    +[LACConcurrencyUtilities createDefaultSerialQueueWithIdentifier:](LACConcurrencyUtilities, "createDefaultSerialQueueWithIdentifier:", CFSTR("com.apple.LocalAuthentication.lac-cache-queue"));
    v8 = objc_claimAutoreleasedReturnValue();
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v8;

  }
  return v5;
}

- (void)invalidate
{
  os_unfair_lock_s *p_cachedValuesLock;

  p_cachedValuesLock = &self->_cachedValuesLock;
  os_unfair_lock_lock(&self->_cachedValuesLock);
  -[NSMutableDictionary removeAllObjects](self->_cachedValues, "removeAllObjects");
  os_unfair_lock_unlock(p_cachedValuesLock);
}

- (id)cachedValueWithParameter:(id)a3
{
  os_unfair_lock_s *p_cachedValuesLock;
  id v5;
  NSMutableDictionary *cachedValues;
  void *v7;
  void *v8;

  p_cachedValuesLock = &self->_cachedValuesLock;
  v5 = a3;
  os_unfair_lock_lock(p_cachedValuesLock);
  cachedValues = self->_cachedValues;
  -[LACCache _identifierForParameter:](self, "_identifierForParameter:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](cachedValues, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_cachedValuesLock);
  return v8;
}

- (void)setCachedValue:(id)a3 withParameter:(id)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *workQueue;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  if (v6)
  {
    -[LACCache _identifierForParameter:](self, "_identifierForParameter:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_cachedValuesLock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedValues, "setObject:forKeyedSubscript:", v6, v7);
    os_unfair_lock_unlock(&self->_cachedValuesLock);
    if (self->_timeout > 0.0)
    {
      objc_initWeak(&location, self);
      v8 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
      workQueue = self->_workQueue;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __41__LACCache_setCachedValue_withParameter___block_invoke;
      v10[3] = &unk_2510C0F98;
      objc_copyWeak(&v13, &location);
      v11 = v6;
      v12 = v7;
      dispatch_after(v8, workQueue, v10);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
}

void __41__LACCache_setCachedValue_withParameter___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_invalidateCachedValue:identifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_identifierForParameter:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = a3;
    v5 = objc_opt_class();
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_2510C57B8;
  }
  return v7;
}

- (void)_invalidateCachedValue:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  v6 = a3;
  os_unfair_lock_lock(&self->_cachedValuesLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedValues, "objectForKeyedSubscript:", v8);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    -[NSMutableDictionary removeObjectForKey:](self->_cachedValues, "removeObjectForKey:", v8);
  os_unfair_lock_unlock(&self->_cachedValuesLock);

}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cachedValues, 0);
}

@end
