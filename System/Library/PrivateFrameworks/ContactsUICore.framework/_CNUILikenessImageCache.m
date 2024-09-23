@implementation _CNUILikenessImageCache

- (CNQueue)evictionQueue
{
  return self->_evictionQueue;
}

- (CNCache)cache
{
  return self->_cache;
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (_CNUILikenessImageCache)initWithCapacity:(unint64_t)a3 hasContactStore:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  dispatch_source_t v17;
  void *v18;
  NSObject *v19;
  _QWORD handler[4];
  id v22;
  uint8_t buf[16];
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)_CNUILikenessImageCache;
  v6 = -[_CNUILikenessImageCache init](&v27, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D139B0]);
    v8 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v7;

    v9 = objc_alloc_init(MEMORY[0x1E0D13BD8]);
    v10 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v9;

    objc_initWeak(&location, v6);
    v11 = (void *)MEMORY[0x1E0D13B40];
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __60___CNUILikenessImageCache_initWithCapacity_hasContactStore___block_invoke;
    v24[3] = &unk_1EA6055C8;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v11, "boundedQueueWithCapacity:overflowHandler:", a3, v24);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v13;

    if (!a4)
    {
      +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD140000, v15, OS_LOG_TYPE_INFO, "No contact store provided, will empty cache on CNContactStoreDidChangeNotification", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel_emptyCache_, *MEMORY[0x1E0C96870], 0);

    }
    v17 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, MEMORY[0x1E0C80D38]);
    v18 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v17;

    v19 = *((_QWORD *)v6 + 4);
    handler[0] = v12;
    handler[1] = 3221225472;
    handler[2] = __60___CNUILikenessImageCache_initWithCapacity_hasContactStore___block_invoke_7;
    handler[3] = &unk_1EA603690;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v19, handler);
    dispatch_resume(*((dispatch_object_t *)v6 + 4));
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return (_CNUILikenessImageCache *)v6;
}

- (void)emptyCache:(id)a3
{
  void *v3;

  -[_CNUILikenessImageCache lock](self, "lock", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNRunWithLock();

}

- (void)touchCacheKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_CNUILikenessImageCache evictionQueue](self, "evictionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueObject:", v4);

  -[_CNUILikenessImageCache evictionQueue](self, "evictionQueue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueue:", v4);

}

- (void)invalidateCacheEntriesContainingIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_CNUILikenessImageCache lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  CNRunWithLock();

}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void)setEvictionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_evictionQueue, a3);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (OS_dispatch_source)memoryMonitoringSource
{
  return self->_memoryMonitoringSource;
}

- (void)setMemoryMonitoringSource:(id)a3
{
  objc_storeStrong((id *)&self->_memoryMonitoringSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryMonitoringSource, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_evictionQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
