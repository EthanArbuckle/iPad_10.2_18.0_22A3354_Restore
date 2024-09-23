@implementation AKLiveValue

- (AKLiveValue)init
{
  AKLiveValue *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableArray *cleanupBlocks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKLiveValue;
  v2 = -[AKLiveValue init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.akd.live-value", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    cleanupBlocks = v2->_cleanupBlocks;
    v2->_cleanupBlocks = (NSMutableArray *)v5;

  }
  return v2;
}

- (AKLiveValue)initWithSyncProducer:(id)a3
{
  id v4;
  AKLiveValue *v5;
  uint64_t v6;
  id syncProducer;

  v4 = a3;
  v5 = -[AKLiveValue init](self, "init");
  if (v5)
  {
    v6 = MEMORY[0x194022E4C](v4);
    syncProducer = v5->_syncProducer;
    v5->_syncProducer = (id)v6;

    -[AKLiveValue _updateValue](v5, "_updateValue");
  }

  return v5;
}

- (AKLiveValue)initWithAsyncProducer:(id)a3
{
  id v4;
  AKLiveValue *v5;
  uint64_t v6;
  id asyncProducer;

  v4 = a3;
  v5 = -[AKLiveValue init](self, "init");
  if (v5)
  {
    v6 = MEMORY[0x194022E4C](v4);
    asyncProducer = v5->_asyncProducer;
    v5->_asyncProducer = (id)v6;

    -[AKLiveValue _updateValue](v5, "_updateValue");
  }

  return v5;
}

+ (id)liveValueWithSyncProducer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSyncProducer:", v4);

  return v5;
}

+ (id)liveValueWithAsyncProducer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAsyncProducer:", v4);

  return v5;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *cleanupBlocks;
  objc_super v5;
  _QWORD v6[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cleanupBlocks = self->_cleanupBlocks;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __22__AKLiveValue_dealloc__block_invoke;
  v6[3] = &unk_1E2E61EE0;
  v6[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](cleanupBlocks, "enumerateObjectsUsingBlock:", v6);
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)AKLiveValue;
  -[AKLiveValue dealloc](&v5, sel_dealloc);
}

uint64_t __22__AKLiveValue_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (id)newTrigger
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__AKLiveValue_newTrigger__block_invoke;
  v4[3] = &unk_1E2E5E1F8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x194022E4C](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __25__AKLiveValue_newTrigger__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateValue");

}

- (id)newTriggerWithCleanup:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *cleanupBlocks;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  cleanupBlocks = self->_cleanupBlocks;
  v7 = (void *)MEMORY[0x194022E4C](v5);

  -[NSMutableArray addObject:](cleanupBlocks, "addObject:", v7);
  os_unfair_lock_unlock(p_lock);
  return -[AKLiveValue newTrigger](self, "newTrigger");
}

- (id)captureCurrentValue
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_value;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_updateValue
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AKLiveValue__updateValue__block_invoke;
  block[3] = &unk_1E2E5E1D0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__AKLiveValue__updateValue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_updateValue");
}

- (void)_onqueue_updateValue
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19202F000, a2, OS_LOG_TYPE_FAULT, "%@: Expected nonnull sync or async producer", (uint8_t *)&v2, 0xCu);
}

void __35__AKLiveValue__onqueue_updateValue__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setValue:", v3);

}

- (void)_setValue:(id)a3
{
  id v4;
  id value;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  value = self->_value;
  self->_value = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanupBlocks, 0);
  objc_storeStrong(&self->_asyncProducer, 0);
  objc_storeStrong(&self->_syncProducer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
