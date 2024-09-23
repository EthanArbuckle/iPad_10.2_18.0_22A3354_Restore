@implementation ATXMemoryPressureMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_observer;
}

- (void)registerObserver:(id)a3
{
  ATXMemoryPressureMonitor *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterObserver:(id)a3
{
  ATXMemoryPressureMonitor *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

void __42__ATXMemoryPressureMonitor_sharedInstance__block_invoke()
{
  ATXMemoryPressureMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(ATXMemoryPressureMonitor);
  v1 = (void *)sharedInstance_observer;
  sharedInstance_observer = (uint64_t)v0;

}

- (ATXMemoryPressureMonitor)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  dispatch_source_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ATXMemoryPressureMonitor;
  v2 = -[ATXMemoryPressureMonitor init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("ATXMemoryPressureMonitor.internalQueue", v3);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    v7 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v6;

    v8 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, *((dispatch_queue_t *)v2 + 1));
    v9 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v8;

    objc_initWeak(&location, v2);
    v10 = *((_QWORD *)v2 + 2);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __32__ATXMemoryPressureMonitor_init__block_invoke;
    v12[3] = &unk_1E82BF590;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v10, v12);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return (ATXMemoryPressureMonitor *)v2;
}

void __32__ATXMemoryPressureMonitor_init__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_currentMemoryPressureType");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "_notifyObserversOfMemoryPressureType:", v3);

}

- (void)dealloc
{
  objc_super v3;

  dispatch_suspend((dispatch_object_t)self->_memoryMonitoringSource);
  v3.receiver = self;
  v3.super_class = (Class)ATXMemoryPressureMonitor;
  -[ATXMemoryPressureMonitor dealloc](&v3, sel_dealloc);
}

- (unint64_t)_currentMemoryPressureType
{
  uintptr_t data;
  uint64_t v3;
  NSObject *v5;

  data = dispatch_source_get_data((dispatch_source_t)self->_memoryMonitoringSource);
  if (data == 1)
    return 0;
  v3 = data;
  if (data != 4)
  {
    if (data == 2)
      return 1;
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXMemoryPressureMonitor _currentMemoryPressureType].cold.1(v3, v5);

  }
  return 2;
}

- (void)_notifyObserversOfMemoryPressureType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  ATXMemoryPressureMonitor *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    ATXMemoryPressureTypeToString(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1C99CA000, v5, OS_LOG_TYPE_DEFAULT, "ATXMemoryPressureMonitor: received memory pressure warning of type: %@", buf, 0xCu);

  }
  v7 = self;
  objc_sync_enter(v7);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7->_observers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (a3 - 1 <= 1 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "handleMemoryPressure");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "handleMemoryPressureOfType:", a3);
      }
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_memoryMonitoringSource, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)_currentMemoryPressureType
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1C99CA000, a2, OS_LOG_TYPE_FAULT, "ATXMemoryPressureMonitor could not convert %lu to ATXMemoryPressureType", (uint8_t *)&v2, 0xCu);
}

@end
