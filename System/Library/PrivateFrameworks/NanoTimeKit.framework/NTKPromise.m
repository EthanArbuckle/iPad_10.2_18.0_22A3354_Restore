@implementation NTKPromise

+ (id)promiseNamed:(id)a3 withBackgroundPriority:(unsigned int)a4 foregroundPriority:(unsigned int)a5 block:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;
  NTKPromise *v11;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v10 = a3;
  v11 = -[NTKPromise initWithName:backgroundPriority:foregroundPriority:block:]([NTKPromise alloc], "initWithName:backgroundPriority:foregroundPriority:block:", v10, v7, v6, v9);

  return v11;
}

- (NTKPromise)initWithName:(id)a3 backgroundPriority:(unsigned int)a4 foregroundPriority:(unsigned int)a5 block:(id)a6
{
  id v11;
  id v12;
  NTKPromise *v13;
  NTKPromise *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NTKPromise;
  v13 = -[NTKPromise init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    v14->_bgPriority = a4;
    v14->_fgPriority = a5;
    v14->_lock_promiseState = 0;
    v14->_lock._os_unfair_lock_opaque = 0;
    -[NTKPromise _beginLoadingBlock:](v14, "_beginLoadingBlock:", v12);
  }

  return v14;
}

- (void)_beginLoadingBlock:(id)a3
{
  id v4;
  dispatch_qos_class_t bgPriority;
  dispatch_block_t v6;
  NSObject *loaderQueue;
  NSObject *v8;
  id v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *v11;
  uint64_t block;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id location;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_promiseState)
  {
    self->_lock_promiseState = 1;
    objc_initWeak(&location, self);
    bgPriority = self->_bgPriority;
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __33__NTKPromise__beginLoadingBlock___block_invoke;
    v15 = &unk_1E6BD1890;
    objc_copyWeak(&v17, &location);
    v16 = v4;
    v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, bgPriority, 0, &block);
    loaderQueue = self->_loaderQueue;
    if (!loaderQueue)
    {
      dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)self->_bgPriority, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NTKPromise Queue - %@"), self->_name, block, v13, v14, v15);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v9, "cStringUsingEncoding:", 4), v8);
      v11 = self->_loaderQueue;
      self->_loaderQueue = v10;

      loaderQueue = self->_loaderQueue;
    }
    dispatch_async(loaderQueue, v6);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(&self->_lock);

}

void __33__NTKPromise__beginLoadingBlock___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD *v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  kdebug_trace();

  v7 = objc_loadWeakRetained(v2);
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v7[3];
    v7[3] = v4;

  }
  v6 = objc_loadWeakRetained(v2);
  kdebug_trace();

}

+ (id)promiseNamed:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  NTKPromise *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NTKPromise initWithName:block:]([NTKPromise alloc], "initWithName:block:", v6, v5);

  return v7;
}

+ (id)metalPipelinePromiseNamed:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  NTKPromise *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NTKPromise initWithName:backgroundPriority:foregroundPriority:block:]([NTKPromise alloc], "initWithName:backgroundPriority:foregroundPriority:block:", v6, 25, 33, v5);

  return v7;
}

- (NTKPromise)initWithName:(id)a3 block:(id)a4
{
  return -[NTKPromise initWithName:backgroundPriority:foregroundPriority:block:](self, "initWithName:backgroundPriority:foregroundPriority:block:", a3, 25, 33, a4);
}

- (id)object
{
  os_unfair_lock_s *p_lock;
  dispatch_qos_class_t fgPriority;
  dispatch_block_t v5;
  OS_dispatch_queue *loaderQueue;
  id v7;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_promiseState == 1)
  {
    fgPriority = self->_fgPriority;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__NTKPromise_object__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, fgPriority, 0, block);
    kdebug_trace();
    dispatch_sync((dispatch_queue_t)self->_loaderQueue, v5);
    loaderQueue = self->_loaderQueue;
    self->_loaderQueue = 0;

  }
  v7 = self->_lock_loadedObject;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

void __20__NTKPromise_object__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 2;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_lock_loadedObject, 0);
  objc_storeStrong(&self->_loaderQueue_loadedObject, 0);
  objc_storeStrong((id *)&self->_loaderQueue, 0);
}

@end
