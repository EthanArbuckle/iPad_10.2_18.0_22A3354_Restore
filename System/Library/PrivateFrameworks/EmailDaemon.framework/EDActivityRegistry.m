@implementation EDActivityRegistry

- (void)startedActivity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "startedActivity:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)registerActivityObserver:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if ((-[NSMutableSet containsObject:](self->_observers, "containsObject:", v6) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Activity observer is already registered"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v8);
  }
  else
  {
    -[NSMutableSet addObject:](self->_observers, "addObject:", v6);
    os_unfair_lock_unlock(&self->_lock);
    v8 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__EDActivityRegistry_registerActivityObserver_completion___block_invoke;
    v10[3] = &unk_1E949AD60;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    objc_msgSend(v8, "addCancelationBlock:", v10);
    -[EDActivityPersistence currentActivities](self->_activityPersistence, "currentActivities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, void *, _QWORD))v7 + 2))(v7, v8, v9, 0);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (EDActivityRegistry)initWithHookRegistry:(id)a3 activityPersistence:(id)a4
{
  id v7;
  id v8;
  EDActivityRegistry *v9;
  EDActivityRegistry *v10;
  NSMutableSet *v11;
  NSMutableSet *observers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDActivityRegistry;
  v9 = -[EDActivityRegistry init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hookRegistry, a3);
    -[EDPersistenceHookRegistry registerActivityHookResponder:](v10->_hookRegistry, "registerActivityHookResponder:", v10);
    objc_storeStrong((id *)&v10->_activityPersistence, a4);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observers = v10->_observers;
    v10->_observers = v11;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

void __58__EDActivityRegistry_registerActivityObserver_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
  objc_msgSend(*((id *)WeakRetained + 1), "removeObject:", *(_QWORD *)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);

}

- (void)removedActivityWithID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removedActivityWithID:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__EDActivityRegistry_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (OS_os_log *)(id)log_log_0;
}

void __25__EDActivityRegistry_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

- (void)activityWithID:(id)a3 finishedWithError:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = self->_observers;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "activityWithID:finishedWithError:", v6, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)activityWithID:(id)a3 setUserInfoObject:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = self->_observers;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "activityWithID:setUserInfoObject:forKey:", v8, v9, v10, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)activityWithID:(id)a3 setCompletedCount:(int64_t)a4 totalCount:(int64_t)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = self->_observers;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "activityWithID:setCompletedCount:totalCount:", v8, v10, v11, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(p_lock);
}

- (EDActivityPersistence)activityPersistence
{
  return self->_activityPersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
