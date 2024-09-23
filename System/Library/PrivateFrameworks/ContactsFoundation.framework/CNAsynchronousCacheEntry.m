@implementation CNAsynchronousCacheEntry

- (void)addDelegate:(id)a3
{
  CNAsynchronousCacheEntry *v4;
  id v5;
  void *v6;
  double v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNAsynchronousCacheEntry withLock_compactDelegates](v4, "withLock_compactDelegates");
  -[CNAsynchronousCacheEntry withLock_addDelegate:](v4, "withLock_addDelegate:", v8);
  v5 = v4->_currentValue;
  -[CNSchedulerProvider immediateScheduler](v4->_schedulerProvider, "immediateScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v4->_timestampOfCurrentValue = v7;

  objc_sync_exit(v4);
  if (v5)
    objc_msgSend(v8, "cacheEntryDidUpdateValue:", v4);

}

- (void)updateValue:(id)a3
{
  id v5;
  CNAsynchronousCacheEntry *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[CNAsynchronousCacheEntry withLock_compactDelegates](v6, "withLock_compactDelegates");
  -[CNWeakArray allObjects](v6->_delegates, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v6->_currentValue, a3);
  objc_sync_exit(v6);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "cacheEntryDidUpdateValue:", v6, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)withLock_compactDelegates
{
  -[CNWeakArray compact](self->_delegates, "compact");
}

- (id)currentValue
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)withLock_addDelegate:(id)a3
{
  -[CNWeakArray addObject:](self->_delegates, "addObject:", a3);
}

- (double)timestampOfCurrentValue
{
  return self->_timestampOfCurrentValue;
}

- (CNAsynchronousCacheEntry)initWithSchedulerProvider:(id)a3
{
  id v5;
  CNAsynchronousCacheEntry *v6;
  CNAsynchronousCacheEntry *v7;
  id currentValue;
  CNWeakArray *v9;
  CNWeakArray *delegates;
  CNAsynchronousCacheEntry *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNAsynchronousCacheEntry;
  v6 = -[CNAsynchronousCacheEntry init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_schedulerProvider, a3);
    currentValue = v7->_currentValue;
    v7->_currentValue = 0;

    v7->_timestampOfCurrentValue = 0.0;
    v9 = objc_alloc_init(CNWeakArray);
    delegates = v7->_delegates;
    v7->_delegates = v9;

    v11 = v7;
  }

  return v7;
}

- (CNAsynchronousCacheEntry)init
{
  void *v3;
  void *v4;
  CNAsynchronousCacheEntry *v5;

  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNAsynchronousCacheEntry initWithSchedulerProvider:](self, "initWithSchedulerProvider:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("currentValue"), self->_currentValue);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeDelegates:(id)a3
{
  CNAsynchronousCacheEntry *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CNAsynchronousCacheEntry withLock_compactAndRemoveDelegates:](v4, "withLock_compactAndRemoveDelegates:", v5);
  objc_sync_exit(v4);

}

- (void)withLock_compactAndRemoveDelegates:(id)a3
{
  CNWeakArray *delegates;
  id v5;
  void *v6;
  id v7;

  delegates = self->_delegates;
  v5 = a3;
  -[CNWeakArray allObjects](delegates, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObjectsInArray:", v5);
  -[CNWeakArray setArray:](self->_delegates, "setArray:", v7);

}

- (void)setCurrentValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CNSchedulerProvider)schedulerProvider
{
  return (CNSchedulerProvider *)objc_getProperty(self, a2, 24, 1);
}

- (CNWeakArray)delegates
{
  return (CNWeakArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong(&self->_currentValue, 0);
}

@end
