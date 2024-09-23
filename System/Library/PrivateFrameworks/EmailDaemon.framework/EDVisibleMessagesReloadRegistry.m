@implementation EDVisibleMessagesReloadRegistry

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__EDVisibleMessagesReloadRegistry_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_98 != -1)
    dispatch_once(&log_onceToken_98, block);
  return (id)log_log_98;
}

void __38__EDVisibleMessagesReloadRegistry_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_98;
  log_log_98 = (uint64_t)v1;

}

- (EDVisibleMessagesReloadRegistry)init
{
  EDVisibleMessagesReloadRegistry *v2;
  EDVisibleMessagesReloadRegistry *v3;
  uint64_t v4;
  NSHashTable *observers;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  EFAssertableScheduler *observationScheduler;
  const char *v11;
  uint64_t v12;
  id v13;
  EFAssertableScheduler *v14;
  uint64_t v15;
  EFDebouncer *reloadDebouncer;
  _QWORD v18[4];
  id v19;
  _QWORD handler[4];
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)EDVisibleMessagesReloadRegistry;
  v2 = -[EDVisibleMessagesReloadRegistry init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.EDVisibleMessagesReloadRegistry.notify", v7);

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.EDVisibleMessagesReloadRegistry.observation"));
    v9 = objc_claimAutoreleasedReturnValue();
    observationScheduler = v3->_observationScheduler;
    v3->_observationScheduler = (EFAssertableScheduler *)v9;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    v11 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D46988], "UTF8String");
    v12 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __39__EDVisibleMessagesReloadRegistry_init__block_invoke;
    handler[3] = &unk_1E94A3658;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v11, &v3->_notifyToken, v8, handler);
    v13 = objc_alloc(MEMORY[0x1E0D1EEA0]);
    v14 = v3->_observationScheduler;
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __39__EDVisibleMessagesReloadRegistry_init__block_invoke_2;
    v18[3] = &unk_1E94A0710;
    objc_copyWeak(&v19, &location);
    v15 = objc_msgSend(v13, "initWithTimeInterval:scheduler:startAfter:block:", v14, 0, v18, 30.0);
    reloadDebouncer = v3->_reloadDebouncer;
    v3->_reloadDebouncer = (EFDebouncer *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __39__EDVisibleMessagesReloadRegistry_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scheduleVisibleMessageReload");

}

void __39__EDVisibleMessagesReloadRegistry_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadVisibleMessages");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)EDVisibleMessagesReloadRegistry;
  -[EDVisibleMessagesReloadRegistry dealloc](&v3, sel_dealloc);
}

- (id)addVisibleMessagesObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSHashTable *observers;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id from;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a3);
  v4 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __62__EDVisibleMessagesReloadRegistry_addVisibleMessagesObserver___block_invoke;
  v12 = &unk_1E949E7A0;
  objc_copyWeak(&v13, &from);
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "addCancelationBlock:", &v9);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  v7 = objc_loadWeakRetained(&location);
  -[NSHashTable addObject:](observers, "addObject:", v7, v9, v10, v11, v12);

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v4;
}

void __62__EDVisibleMessagesReloadRegistry_addVisibleMessagesObserver___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  void *v4;
  id v5;
  os_unfair_lock_s *v6;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained + 2;
    v6 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 2);
    v4 = *(void **)&v6[4]._os_unfair_lock_opaque;
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "removeObject:", v5);

    os_unfair_lock_unlock(v3);
    WeakRetained = v6;
  }

}

- (void)_scheduleVisibleMessageReload
{
  -[EFDebouncer debounceResult:](self->_reloadDebouncer, "debounceResult:", 0);
}

- (void)_reloadVisibleMessages
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "reload", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadDebouncer, 0);
  objc_storeStrong((id *)&self->_observationScheduler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
