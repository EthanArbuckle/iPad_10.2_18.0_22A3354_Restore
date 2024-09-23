@implementation _HKWheelchairUseCharacteristicCache

- (_HKWheelchairUseCharacteristicCache)initWithHealthStore:(id)a3
{
  id v5;
  _HKWheelchairUseCharacteristicCache *v6;
  _HKWheelchairUseCharacteristicCache *v7;
  uint64_t v8;
  NSHashTable *observers;
  uint64_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_HKWheelchairUseCharacteristicCache;
  v6 = -[_HKWheelchairUseCharacteristicCache init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v7->_state = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    HKCreateSerialDispatchQueue(0, CFSTR("fetchingQueue"));
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v7->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v7->_lock);
    -[_HKWheelchairUseCharacteristicCache _lock_fetchWheelchairUse](v7, "_lock_fetchWheelchairUse");
    os_unfair_lock_unlock(&v7->_lock);
    objc_initWeak(&location, v7);
    v12 = MEMORY[0x1E0C80D38];
    v13 = MEMORY[0x1E0C80D38];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59___HKWheelchairUseCharacteristicCache_initWithHealthStore___block_invoke;
    v15[3] = &unk_1E37E9F88;
    objc_copyWeak(&v16, &location);
    notify_register_dispatch("com.apple.healthd.user-characteristics.did-change", &v7->_characteristicUpdateToken, v12, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_characteristicUpdateToken);
  v3.receiver = self;
  v3.super_class = (Class)_HKWheelchairUseCharacteristicCache;
  -[_HKWheelchairUseCharacteristicCache dealloc](&v3, sel_dealloc);
}

- (void)registerObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_alertObservers:(id)a3 didUpdateToWheelchairUser:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "wheelchairUseCharacteristicCache:wheelchairUsageDidChange:", self, v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isWheelchairUser
{
  _HKWheelchairUseCharacteristicCache *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[_HKWheelchairUseCharacteristicCache _lock_isWheelchairUser](v2, "_lock_isWheelchairUser");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_lock_isWheelchairUser
{
  os_unfair_lock_assert_owner(&self->_lock);
  -[_HKWheelchairUseCharacteristicCache _lock_fetchWheelchairUseIfNecessary](self, "_lock_fetchWheelchairUseIfNecessary");
  return -[HKWheelchairUseObject wheelchairUse](self->_wheelchairUseObject, "wheelchairUse") == HKWheelchairUseYes;
}

- (BOOL)hasFetchedWheelchairUse
{
  _HKWheelchairUseCharacteristicCache *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_wheelchairUseObject != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_lock_needsFetch
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_state == 0;
}

- (void)_lock_fetchWheelchairUseIfNecessary
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[_HKWheelchairUseCharacteristicCache _lock_needsFetch](self, "_lock_needsFetch"))
    -[_HKWheelchairUseCharacteristicCache _lock_fetchWheelchairUse](self, "_lock_fetchWheelchairUse");
}

- (void)_lock_fetchWheelchairUse
{
  NSObject *queue;
  _QWORD block[5];

  os_unfair_lock_assert_owner(&self->_lock);
  self->_state = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___HKWheelchairUseCharacteristicCache__lock_fetchWheelchairUse__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleFetchError:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  int64_t queryRetries;
  uint64_t v8;
  dispatch_time_t v9;
  _QWORD block[5];

  v4 = a3;
  if ((HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      -[_HKWheelchairUseCharacteristicCache _handleFetchError:].cold.1((uint64_t)v4, v5);
  }
  v6 = objc_msgSend(v4, "hk_isDatabaseAccessibilityError");
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    self->_state = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    queryRetries = self->_queryRetries;
    self->_queryRetries = queryRetries + 1;
    os_unfair_lock_unlock(&self->_lock);
    v8 = 5;
    if (queryRetries < 5)
      v8 = queryRetries;
    v9 = dispatch_time(0, 1000000000 * v8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57___HKWheelchairUseCharacteristicCache__handleFetchError___block_invoke;
    block[3] = &unk_1E37E6770;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
  }

}

- (void)_handleFetchSuccess:(id)a3
{
  id v5;
  HKWheelchairUseObject *wheelchairUseObject;
  uint64_t v7;
  NSObject *v8;
  HKWheelchairUse v9;
  __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  int v16;
  _HKWheelchairUseCharacteristicCache *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  wheelchairUseObject = self->_wheelchairUseObject;
  self->_state = 2;
  self->_queryRetries = 0;
  v7 = -[HKWheelchairUseObject wheelchairUse](wheelchairUseObject, "wheelchairUse");
  if (v7 == objc_msgSend(v5, "wheelchairUse"))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    _HKInitializeLogging();
    v8 = (id)HKLogDefault;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[HKWheelchairUseObject wheelchairUse](self->_wheelchairUseObject, "wheelchairUse");
      if ((unint64_t)v9 > HKWheelchairUseYes)
        v10 = 0;
      else
        v10 = off_1E37F5470[v9];
      v11 = objc_msgSend(v5, "wheelchairUse");
      if (v11 > 2)
        v12 = 0;
      else
        v12 = off_1E37F5470[v11];
      v16 = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "%@: Wheelchair Use changed from \"%@\" to \"%@\", notifying observers.", (uint8_t *)&v16, 0x20u);
    }

    objc_storeStrong((id *)&self->_wheelchairUseObject, a3);
    v13 = -[_HKWheelchairUseCharacteristicCache _lock_isWheelchairUser](self, "_lock_isWheelchairUser");
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    os_unfair_lock_unlock(&self->_lock);
    -[_HKWheelchairUseCharacteristicCache _alertObservers:didUpdateToWheelchairUser:](self, "_alertObservers:didUpdateToWheelchairUser:", v15, v13);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wheelchairUseObject, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_handleFetchError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Error loading wheelchair use characteristic: %@", (uint8_t *)&v2, 0xCu);
}

@end
