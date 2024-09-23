@implementation BLSPendingBacklightProxy

- (int64_t)backlightState
{
  os_unfair_lock_s *p_lock;
  BLSBacklightProxy *replacementBacklightProxy;
  int64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy)
    v5 = -[BLSBacklightProxy backlightState](replacementBacklightProxy, "backlightState");
  else
    v5 = 0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BLSPendingBacklightProxy)init
{
  BLSPendingBacklightProxy *v2;
  BLSPendingBacklightProxy *v3;
  uint64_t v4;
  NSMutableArray *requests;
  uint64_t v6;
  NSHashTable *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BLSPendingBacklightProxy;
  v2 = -[BLSPendingBacklightProxy init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    requests = v3->_requests;
    v3->_requests = (NSMutableArray *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 2);
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v6;

  }
  return v3;
}

- (int64_t)flipbookState
{
  os_unfair_lock_s *p_lock;
  BLSBacklightProxy *replacementBacklightProxy;
  int64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy)
    v5 = -[BLSBacklightProxy flipbookState](replacementBacklightProxy, "flipbookState");
  else
    v5 = 0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isTransitioning
{
  os_unfair_lock_s *p_lock;
  BLSBacklightProxy *replacementBacklightProxy;
  char v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy)
    v5 = -[BLSBacklightProxy isTransitioning](replacementBacklightProxy, "isTransitioning");
  else
    v5 = 1;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isAlwaysOnEnabled
{
  os_unfair_lock_s *p_lock;
  BLSBacklightProxy *replacementBacklightProxy;
  char v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy)
    v5 = -[BLSBacklightProxy isAlwaysOnEnabled](replacementBacklightProxy, "isAlwaysOnEnabled");
  else
    v5 = 0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)deviceSupportsAlwaysOn
{
  os_unfair_lock_s *p_lock;
  BLSBacklightProxy *replacementBacklightProxy;
  char v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy)
    v5 = -[BLSBacklightProxy deviceSupportsAlwaysOn](replacementBacklightProxy, "deviceSupportsAlwaysOn");
  else
    v5 = 0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  BLSBacklightProxy *replacementBacklightProxy;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy)
    -[BLSBacklightProxy addObserver:](replacementBacklightProxy, "addObserver:", v5);
  else
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  BLSBacklightProxy *replacementBacklightProxy;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy)
    -[BLSBacklightProxy removeObserver:](replacementBacklightProxy, "removeObserver:", v5);
  else
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)performChangeRequest:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  BLSBacklightProxy *replacementBacklightProxy;
  BLSBacklightProxy *v7;
  void *v8;
  NSMutableArray *requests;
  id v10;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  replacementBacklightProxy = self->_replacementBacklightProxy;
  if (replacementBacklightProxy)
  {
    v7 = replacementBacklightProxy;
    os_unfair_lock_unlock(p_lock);
    -[BLSBacklightProxy performChangeRequest:](v7, "performChangeRequest:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    requests = self->_requests;
    v10 = 0;
    -[NSMutableArray addObject:](requests, "addObject:", v4);

    os_unfair_lock_unlock(p_lock);
    v8 = 0;
  }

  return v8;
}

- (void)replaceWithBacklightProxy:(id)a3
{
  id v5;
  void *v6;
  NSHashTable *observers;
  NSMutableArray *v8;
  NSMutableArray *requests;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint8_t v31[128];
  uint8_t buf[4];
  BLSPendingBacklightProxy *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_replacementBacklightProxy, a3);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  self->_observers = 0;

  v8 = self->_requests;
  requests = self->_requests;
  self->_requests = 0;

  os_unfair_lock_unlock(&self->_lock);
  bls_assertions_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v33 = self;
    v34 = 1024;
    v35 = objc_msgSend(v6, "count");
    v36 = 1024;
    v37 = -[NSMutableArray count](v8, "count");
    _os_log_debug_impl(&dword_1B0C75000, v10, OS_LOG_TYPE_DEBUG, "%p backlight proxy setup, will set %u observers, perform %u requests", buf, 0x18u);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v5, "addObserver:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v13);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = v8;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = (id)objc_msgSend(v5, "performChangeRequest:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v20++), (_QWORD)v22);
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementBacklightProxy, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
