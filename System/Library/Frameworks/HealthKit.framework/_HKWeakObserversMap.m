@implementation _HKWeakObserversMap

- (_HKWeakObserversMap)init
{
  _HKWeakObserversMap *v2;
  _HKWeakObserversMap *v3;
  uint64_t v4;
  HKMultimap *map;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKWeakObserversMap;
  v2 = -[_HKWeakObserversMap init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    +[HKMultimap multimapWithWeakObjects](HKMultimap, "multimapWithWeakObjects");
    v4 = objc_claimAutoreleasedReturnValue();
    map = v3->_map;
    v3->_map = (HKMultimap *)v4;

  }
  return v3;
}

- (void)addObserver:(id)a3 forKey:(id)a4
{
  -[_HKWeakObserversMap addObserver:queue:forKey:](self, "addObserver:queue:forKey:", a3, 0, a4);
}

- (void)addObserver:(id)a3 queue:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id object;

  object = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  objc_getAssociatedObject(object, &_HKAssociatedQueueKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (!v8)
    {
      HKCreateSerialDispatchQueue(object, CFSTR("_HKWeakObserversMap.queue"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_setAssociatedObject(object, &_HKAssociatedQueueKey, v8, (void *)0x301);
  }
  -[HKMultimap setObject:forKey:](self->_map, "setObject:forKey:", object, v9);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HKMultimap removeObject:](self->_map, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HKMultimap removeObject:forKey:](self->_map, "removeObject:forKey:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)notifyObserversOfKey:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  id obj;
  _QWORD block[5];
  id v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[HKMultimap objectsForKey:](self->_map, "objectsForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_getAssociatedObject(v13, &_HKAssociatedQueueKey);
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __52___HKWeakObserversMap_notifyObserversOfKey_handler___block_invoke;
        block[3] = &unk_1E37E68A0;
        block[4] = self;
        v17 = v6;
        v18 = v13;
        v19 = v7;
        dispatch_async(v14, block);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

}

- (id)test_observersForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HKMultimap objectsForKey:](self->_map, "objectsForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
}

@end
