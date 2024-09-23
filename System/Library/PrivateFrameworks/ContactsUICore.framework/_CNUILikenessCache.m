@implementation _CNUILikenessCache

- (CNCache)cache
{
  return self->_cache;
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (_CNUILikenessCache)initWithCapacity:(unint64_t)a3
{
  _CNUILikenessCache *v4;
  _CNUILikenessCache *v5;
  _CNUILikenessCache *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CNUILikenessCache;
  v4 = -[_CNUILikenessCache init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[_CNUILikenessCache setUpIvarsWithCacheCapacity:](v4, "setUpIvarsWithCacheCapacity:", a3);
    -[_CNUILikenessCache setUpEvictionHandler](v5, "setUpEvictionHandler");
    -[_CNUILikenessCache setUpDatabaseChangeNotificationHandler](v5, "setUpDatabaseChangeNotificationHandler");
    -[_CNUILikenessCache setUpMemoryPressureWatcher](v5, "setUpMemoryPressureWatcher");
    v6 = v5;
  }

  return v5;
}

+ (id)log
{
  if (log_cn_once_token_1_1 != -1)
    dispatch_once(&log_cn_once_token_1_1, &__block_literal_global_30);
  return (id)log_cn_once_object_1_1;
}

- (void)setUpIvarsWithCacheCapacity:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CNCache *v9;
  CNCache *cache;
  CNUnfairLock *v11;
  CNUnfairLock *lock;
  NSObject *v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *backgroundQueue;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0D139B0]);
  objc_msgSend(MEMORY[0x1E0D139B0], "boundingStrategyWithCapacity:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D139B0], "nonatomicCacheScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (CNCache *)objc_msgSend(v5, "initWithBoundingStrategies:resourceScheduler:", v7, v8);
  cache = self->_cache;
  self->_cache = v9;

  v11 = (CNUnfairLock *)objc_alloc_init(MEMORY[0x1E0D13BD8]);
  lock = self->_lock;
  self->_lock = v11;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.contacts.ui.likeness-cache.deallocator", v13);
  backgroundQueue = self->_backgroundQueue;
  self->_backgroundQueue = v14;

}

- (void)setUpEvictionHandler
{
  CNCache *cache;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  cache = self->_cache;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42___CNUILikenessCache_setUpEvictionHandler__block_invoke;
  v4[3] = &unk_1EA6042E0;
  objc_copyWeak(&v5, &location);
  -[CNCache addDidEvictHandler:](cache, "addDidEvictHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setUpDatabaseChangeNotificationHandler
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_receiveDatabaseChangeNotification_, *MEMORY[0x1E0C96870], 0);

}

- (void)setUpMemoryPressureWatcher
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *memoryMonitoringSource;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[_CNUILikenessCache backgroundQueue](self, "backgroundQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, v3);
  memoryMonitoringSource = self->_memoryMonitoringSource;
  self->_memoryMonitoringSource = v4;

  objc_initWeak(&location, self);
  v6 = self->_memoryMonitoringSource;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48___CNUILikenessCache_setUpMemoryPressureWatcher__block_invoke;
  v7[3] = &unk_1EA603690;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_memoryMonitoringSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)objectForKey:(id)a3 onCacheMiss:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[_CNUILikenessCache lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  CNResultWithLock();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)receiveDatabaseChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DD140000, v5, OS_LOG_TYPE_DEFAULT, "Database change notification received", v6, 2u);
  }

  -[_CNUILikenessCache emptyCache:](self, "emptyCache:", v4);
}

- (void)receiveMemoryPressureSignal
{
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DD140000, v3, OS_LOG_TYPE_DEFAULT, "Memory pressure signal received", v4, 2u);
  }

  -[_CNUILikenessCache emptyCache:](self, "emptyCache:", 0);
}

- (void)emptyCache:(id)a3
{
  void *v3;

  -[_CNUILikenessCache lock](self, "lock", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNRunWithLock();

}

- (OS_dispatch_source)memoryMonitoringSource
{
  return self->_memoryMonitoringSource;
}

- (void)setMemoryMonitoringSource:(id)a3
{
  objc_storeStrong((id *)&self->_memoryMonitoringSource, a3);
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundQueue, a3);
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_memoryMonitoringSource, 0);
}

@end
