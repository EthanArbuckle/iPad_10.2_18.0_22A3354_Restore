@implementation AAUICommandQueueRegistry

void __42__AAUICommandQueueRegistry_sharedRegistry__block_invoke()
{
  AAUICommandQueueRegistry *v0;
  void *v1;

  v0 = objc_alloc_init(AAUICommandQueueRegistry);
  v1 = (void *)sharedRegistry_registry;
  sharedRegistry_registry = (uint64_t)v0;

}

- (void)_appDidBecomeActive
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  MTLCommandQueue *cachedCommandQueue;
  int v6;
  MTLCommandQueue *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[AAUICommandQueueRegistry _locked_cacheCommandQueueIfNeeded](self, "_locked_cacheCommandQueueIfNeeded");
  ACHLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    cachedCommandQueue = self->_cachedCommandQueue;
    v6 = 138412290;
    v7 = cachedCommandQueue;
    _os_log_impl(&dword_21CC08000, v4, OS_LOG_TYPE_DEFAULT, "[AAUICommandQueueRegistry] App entered foreground with command queue: %@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_unlock(p_lock);
}

- (AAUICommandQueueRegistry)init
{
  AAUICommandQueueRegistry *v2;
  uint64_t v3;
  NSHashTable *transactions;
  MTLDevice *v5;
  MTLDevice *device;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AAUICommandQueueRegistry;
  v2 = -[AAUICommandQueueRegistry init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    transactions = v2->_transactions;
    v2->_transactions = (NSHashTable *)v3;

    v5 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v2->_device;
    v2->_device = v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__appDidBecomeActive, *MEMORY[0x24BEBE008], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__appWillBecomeInactive, *MEMORY[0x24BEBDF98], 0);

  }
  return v2;
}

- (void)addCommandQueueTransaction:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_transactions, "addObject:", v5);

  -[AAUICommandQueueRegistry _locked_cacheCommandQueueIfNeeded](self, "_locked_cacheCommandQueueIfNeeded");
  os_unfair_lock_unlock(p_lock);
}

- (void)_locked_cacheCommandQueueIfNeeded
{
  NSObject *v3;
  MTLCommandQueue *v4;
  MTLCommandQueue *cachedCommandQueue;
  uint8_t v6[16];

  if (!self->_cachedCommandQueue && -[NSHashTable count](self->_transactions, "count"))
  {
    ACHLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21CC08000, v3, OS_LOG_TYPE_DEFAULT, "[AAUICommandQueueRegistry] Creating new command queue", v6, 2u);
    }

    v4 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_device, "newCommandQueue");
    cachedCommandQueue = self->_cachedCommandQueue;
    self->_cachedCommandQueue = v4;

  }
}

+ (id)sharedRegistry
{
  if (sharedRegistry_onceToken != -1)
    dispatch_once(&sharedRegistry_onceToken, &__block_literal_global_2);
  return (id)sharedRegistry_registry;
}

- (id)sharedDevice
{
  return self->_device;
}

- (id)commandQueue
{
  os_unfair_lock_s *p_lock;
  MTLCommandQueue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[AAUICommandQueueRegistry _locked_cacheCommandQueueIfNeeded](self, "_locked_cacheCommandQueueIfNeeded");
  v4 = self->_cachedCommandQueue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)removeCommandQueueTransaction:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSObject *v6;
  MTLCommandQueue *cachedCommandQueue;
  uint8_t v8[16];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_transactions, "removeObject:", v5);

  if (!-[NSHashTable count](self->_transactions, "count"))
  {
    ACHLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21CC08000, v6, OS_LOG_TYPE_DEFAULT, "[AAUICommandQueueRegistry] Removed last command queue transaction, clearing command queue", v8, 2u);
    }

    cachedCommandQueue = self->_cachedCommandQueue;
    self->_cachedCommandQueue = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_appWillBecomeInactive
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  MTLCommandQueue *cachedCommandQueue;
  uint8_t v6[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_cachedCommandQueue)
  {
    ACHLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21CC08000, v4, OS_LOG_TYPE_DEFAULT, "[AAUICommandQueueRegistry] App backgrounded, clearing command queue", v6, 2u);
    }

    cachedCommandQueue = self->_cachedCommandQueue;
    self->_cachedCommandQueue = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_cachedCommandQueue, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

@end
