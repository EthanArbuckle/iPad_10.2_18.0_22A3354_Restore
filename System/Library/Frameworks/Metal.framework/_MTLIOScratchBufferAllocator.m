@implementation _MTLIOScratchBufferAllocator

- (void)returnPriv:(MTLIOScratchBufferPrivate *)a3
{
  _opaque_pthread_mutex_t *p_pool_lock;
  unint64_t v6;
  MTLIOScratchBufferPrivate *var0;
  MTLIOScratchBufferPrivate **var1;
  MTLIOScratchBufferPrivateQueue *p_poolq;
  MTLIOScratchBufferPrivate *tqh_first;
  MTLIOScratchBufferPrivate ***p_var1;
  _QWORD *p_tqh_last;

  p_pool_lock = &self->_pool_lock;
  pthread_mutex_lock(&self->_pool_lock);
  v6 = a3->var3 - 1;
  a3->var3 = v6;
  if (!v6)
  {
    if (objc_msgSend(a3->var1, "allocatedSize") >= self->_currentSize)
    {
      if (!a3->var5)
      {
        var0 = a3->var0.var0;
        var1 = a3->var0.var1;
        if (a3->var0.var0)
        {
          var0->var0.var1 = var1;
          var1 = a3->var0.var1;
        }
        else
        {
          self->_activeq.tqh_last = var1;
        }
        *var1 = var0;
        tqh_first = self->_poolq.tqh_first;
        p_poolq = &self->_poolq;
        a3->var0.var0 = tqh_first;
        p_var1 = &tqh_first->var0.var1;
        if (tqh_first)
          p_tqh_last = p_var1;
        else
          p_tqh_last = &p_poolq->tqh_last;
        *p_tqh_last = a3;
        p_poolq->tqh_first = a3;
        a3->var0.var1 = &p_poolq->tqh_first;
        a3->var5 = 1;
      }
      a3->var4 = mach_absolute_time();
    }
    else
    {

      free(a3);
    }
  }
  pthread_mutex_unlock(p_pool_lock);
}

- (id)newScratchBufferWithMinimumSize:(unint64_t)a3
{
  _opaque_pthread_mutex_t *p_pool_lock;
  MTLIOScratchBufferPrivate *tqh_first;
  MTLIOScratchBufferPrivate *var0;
  MTLIOScratchBufferPrivate *v8;
  MTLIOScratchBufferPrivate **var1;
  MTLIOScratchBufferPrivate *v10;
  MTLIOScratchBufferPrivate **v11;
  MTLIOScratchBufferPrivate *v12;
  MTLIOScratchBufferPrivate *v13;
  MTLIOScratchBufferPrivate **v14;
  MTLIOScratchBufferPrivate *v15;
  unint64_t v16;
  unint64_t v18;
  unint64_t v19;
  MTLIOScratchBufferPrivate *v20;
  MTLIOScratchBufferPrivate *v21;
  MTLIOScratchBufferPrivate **v22;
  MTLIOScratchBufferPrivate *v23;
  MTLIOScratchBufferPrivate **v24;
  uint64_t v25;
  uint64_t v26;
  MTLIOScratchBufferPrivateQueue *p_activeq;
  MTLIOScratchBufferPrivate *v28;
  MTLIOScratchBufferPrivate ***p_var1;
  MTLIOScratchBufferPrivate ***p_tqh_last;

  p_pool_lock = &self->_pool_lock;
  pthread_mutex_lock(&self->_pool_lock);
  if (self->_currentSize < a3)
  {
    tqh_first = self->_activeq.tqh_first;
    if (tqh_first)
    {
      var0 = tqh_first->var0.var0;
      if (tqh_first->var0.var0)
      {
        do
        {
          v8 = var0;
          var0->var0.var1 = tqh_first->var0.var1;
          *tqh_first->var0.var1 = var0;
          var0 = var0->var0.var0;
          tqh_first = v8;
        }
        while (var0);
      }
      else
      {
        v8 = self->_activeq.tqh_first;
      }
      var1 = v8->var0.var1;
      self->_activeq.tqh_last = var1;
      *var1 = 0;
    }
    v10 = self->_poolq.tqh_first;
    if (v10)
    {
      do
      {
        v12 = v10->var0.var0;
        v11 = v10->var0.var1;
        if (v10->var0.var0)
        {
          v12->var0.var1 = v11;
          v11 = v10->var0.var1;
        }
        else
        {
          self->_poolq.tqh_last = v11;
        }
        *v11 = v12;
        v10->var5 = 0;
        if (!v10->var3)
        {

          free(v10);
        }
        v10 = v12;
      }
      while (v12);
    }
    v13 = self->_volatileq.tqh_first;
    if (v13)
    {
      do
      {
        v15 = v13->var0.var0;
        v14 = v13->var0.var1;
        if (v13->var0.var0)
        {
          v15->var0.var1 = v14;
          v14 = v13->var0.var1;
        }
        else
        {
          self->_volatileq.tqh_last = v14;
        }
        *v14 = v15;

        free(v13);
        v13 = v15;
      }
      while (v15);
    }
    v16 = -[MTLDevice maxBufferLength](self->_device, "maxBufferLength");
    if (v16 < a3)
      goto LABEL_21;
    v18 = *MEMORY[0x1E0C85AA8] + 4 * a3 - 1;
    if ((v18 & -*MEMORY[0x1E0C85AA8]) >= v16)
      v19 = v16;
    else
      v19 = v18 & -*MEMORY[0x1E0C85AA8];
    self->_currentSize = v19;
  }
  v20 = self->_poolq.tqh_first;
  if (v20)
  {
    v21 = v20->var0.var0;
    v22 = v20->var0.var1;
    if (v20->var0.var0)
    {
      v21->var0.var1 = v22;
      v22 = v20->var0.var1;
    }
    else
    {
      self->_poolq.tqh_last = v22;
    }
    *v22 = v21;
  }
  else
  {
    v20 = self->_volatileq.tqh_first;
    if (v20)
    {
      v23 = v20->var0.var0;
      v24 = v20->var0.var1;
      if (v20->var0.var0)
      {
        v23->var0.var1 = v24;
        v24 = v20->var0.var1;
      }
      else
      {
        self->_volatileq.tqh_last = v24;
      }
      *v24 = v23;
      objc_msgSend(v20->var1, "setPurgeableState:", 2);
    }
    else
    {
      v25 = -[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:");
      if (!v25)
      {
LABEL_21:
        pthread_mutex_unlock(p_pool_lock);
        return 0;
      }
      v26 = v25;
      v20 = (MTLIOScratchBufferPrivate *)malloc_type_malloc(0x38uLL, 0x10A00402C0B3040uLL);
      v20->var1 = (id)v26;
      v20->var2 = self;
      v20->var3 = 0;
    }
  }
  v28 = self->_activeq.tqh_first;
  p_activeq = &self->_activeq;
  v20->var5 = 0;
  v20->var0.var0 = v28;
  p_var1 = &v28->var0.var1;
  if (v28)
    p_tqh_last = p_var1;
  else
    p_tqh_last = &p_activeq->tqh_last;
  *p_tqh_last = &v20->var0.var0;
  p_activeq->tqh_first = v20;
  v20->var0.var1 = &p_activeq->tqh_first;
  ++v20->var3;
  pthread_mutex_unlock(p_pool_lock);
  return -[_MTLIOScratchBuffer init:]([_MTLIOScratchBuffer alloc], "init:", v20);
}

- (void)returnActiveScratchBuffersToPool
{
  _opaque_pthread_mutex_t *p_pool_lock;
  MTLIOScratchBufferPrivate *tqh_first;
  MTLIOScratchBufferPrivateQueue *p_poolq;
  MTLIOScratchBufferPrivate *var0;
  MTLIOScratchBufferPrivate **var1;
  MTLIOScratchBufferPrivate *v8;
  MTLIOScratchBufferPrivate ***p_var1;

  p_pool_lock = &self->_pool_lock;
  pthread_mutex_lock(&self->_pool_lock);
  tqh_first = self->_activeq.tqh_first;
  if (tqh_first)
  {
    p_poolq = &self->_poolq;
    do
    {
      var0 = tqh_first->var0.var0;
      var1 = tqh_first->var0.var1;
      if (tqh_first->var0.var0)
      {
        var0->var0.var1 = var1;
        var1 = tqh_first->var0.var1;
      }
      else
      {
        self->_activeq.tqh_last = var1;
      }
      *var1 = var0;
      v8 = p_poolq->tqh_first;
      tqh_first->var0.var0 = p_poolq->tqh_first;
      if (v8)
        p_var1 = &v8->var0.var1;
      else
        p_var1 = &self->_poolq.tqh_last;
      *p_var1 = &tqh_first->var0.var0;
      p_poolq->tqh_first = tqh_first;
      tqh_first->var0.var1 = &p_poolq->tqh_first;
      tqh_first->var5 = 1;
      tqh_first = var0;
    }
    while (var0);
  }
  pthread_mutex_unlock(p_pool_lock);
}

- (void)kickCleanupQueue
{
  os_unfair_lock_s *p_pool_cleanup_lock;
  NSObject *pool_cleanup_source;
  dispatch_time_t v5;

  p_pool_cleanup_lock = &self->_pool_cleanup_lock;
  os_unfair_lock_lock(&self->_pool_cleanup_lock);
  self->_pool_cleanup_requested = 1;
  if (!self->_pool_cleanup_scheduled)
  {
    self->_pool_cleanup_scheduled = 1;
    pool_cleanup_source = self->_pool_cleanup_source;
    v5 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(pool_cleanup_source, v5, 0x3B9ACA00uLL, 0x5F5E100uLL);
    dispatch_resume((dispatch_object_t)self->_pool_cleanup_source);
  }
  os_unfair_lock_unlock(p_pool_cleanup_lock);
}

- (void)updateScratchBuffersPurgeabilityHandler
{
  os_unfair_lock_s *p_pool_cleanup_lock;
  BOOL v4;

  p_pool_cleanup_lock = &self->_pool_cleanup_lock;
  os_unfair_lock_lock(&self->_pool_cleanup_lock);
  self->_pool_cleanup_requested = 0;
  os_unfair_lock_unlock(p_pool_cleanup_lock);
  v4 = -[_MTLIOScratchBufferAllocator updateScratchBuffersPurgeability](self, "updateScratchBuffersPurgeability");
  os_unfair_lock_lock(p_pool_cleanup_lock);
  if (!v4 && !self->_pool_cleanup_requested)
  {
    dispatch_suspend((dispatch_object_t)self->_pool_cleanup_source);
    self->_pool_cleanup_scheduled = 0;
  }
  os_unfair_lock_unlock(p_pool_cleanup_lock);
}

- (BOOL)updateScratchBuffersPurgeability
{
  _opaque_pthread_mutex_t *p_pool_lock;
  uint64_t v4;
  MTLIOScratchBufferPrivate *v5;
  uint64_t v6;
  MTLIOScratchBufferPrivateQueue *p_volatileq;
  MTLIOScratchBufferPrivate *v8;
  MTLIOScratchBufferPrivate *var0;
  MTLIOScratchBufferPrivate **var1;
  MTLIOScratchBufferPrivate *tqh_first;
  MTLIOScratchBufferPrivate ***p_var1;
  BOOL v13;

  p_pool_lock = &self->_pool_lock;
  pthread_mutex_lock(&self->_pool_lock);
  if (self->_poolq.tqh_first)
  {
    v4 = mach_absolute_time();
    v5 = (MTLIOScratchBufferPrivate *)**((_QWORD **)self->_poolq.tqh_last + 1);
    if (v5)
    {
      v6 = v4 - self->_age_to_purge;
      p_volatileq = &self->_volatileq;
      do
      {
        v8 = (MTLIOScratchBufferPrivate *)**((_QWORD **)v5->var0.var1 + 1);
        if (!v5->var3)
        {
          if (v5->var4 >= v6)
            break;
          objc_msgSend(v5->var1, "setPurgeableState:", 3);
          var0 = v5->var0.var0;
          var1 = v5->var0.var1;
          if (v5->var0.var0)
          {
            var0->var0.var1 = var1;
            var1 = v5->var0.var1;
          }
          else
          {
            self->_poolq.tqh_last = var1;
          }
          *var1 = var0;
          tqh_first = p_volatileq->tqh_first;
          v5->var0.var0 = p_volatileq->tqh_first;
          if (tqh_first)
            p_var1 = &tqh_first->var0.var1;
          else
            p_var1 = &self->_volatileq.tqh_last;
          *p_var1 = &v5->var0.var0;
          p_volatileq->tqh_first = v5;
          v5->var0.var1 = &p_volatileq->tqh_first;
        }
        v5 = v8;
      }
      while (v8);
    }
    v13 = self->_poolq.tqh_first != 0;
  }
  else
  {
    v13 = 0;
  }
  pthread_mutex_unlock(p_pool_lock);
  return v13;
}

- (_MTLIOScratchBufferAllocator)initWithDevice:(id)a3
{
  char *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v9[5];
  _QWORD v10[6];
  mach_timebase_info info;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_MTLIOScratchBufferAllocator;
  v4 = -[_MTLIOScratchBufferAllocator init](&v12, sel_init);
  if (v4)
  {
    v5 = a3;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 56) = 0u;
    *((_QWORD *)v4 + 9) = 0;
    *((_QWORD *)v4 + 10) = v5;
    *((_QWORD *)v4 + 11) = 0;
    *((_QWORD *)v4 + 12) = v4 + 88;
    *((_QWORD *)v4 + 13) = 0;
    *(_OWORD *)(v4 + 8) = xmmword_18281A0D0;
    *((_QWORD *)v4 + 14) = v4 + 104;
    *((_QWORD *)v4 + 15) = 0;
    *((_QWORD *)v4 + 16) = v4 + 120;
    mach_timebase_info(&info);
    *((_QWORD *)v4 + 17) = 1000000000 * (unint64_t)info.denom / info.numer;
    *((_DWORD *)v4 + 40) = 0;
    *((_WORD *)v4 + 82) = 0;
    v6 = dispatch_queue_create("com.Metal.IOScratchBufferAllocatorCleanupQueue", 0);
    *((_QWORD *)v4 + 18) = v6;
    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);
    *((_QWORD *)v4 + 19) = v7;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3052000000;
    v10[3] = __Block_byref_object_copy__9;
    v10[4] = __Block_byref_object_dispose__9;
    v10[5] = v4;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47___MTLIOScratchBufferAllocator_initWithDevice___block_invoke;
    v9[3] = &unk_1E0FE3468;
    v9[4] = v10;
    dispatch_source_set_event_handler(v7, v9);
    _Block_object_dispose(v10, 8);
  }
  return (_MTLIOScratchBufferAllocator *)v4;
}

- (void)dealloc
{
  NSObject *pool_cleanup_queue;
  MTLIOScratchBufferPrivate *tqh_first;
  MTLIOScratchBufferPrivate **var1;
  MTLIOScratchBufferPrivate *var0;
  MTLIOScratchBufferPrivate *v7;
  MTLIOScratchBufferPrivate **v8;
  MTLIOScratchBufferPrivate *v9;
  MTLIOScratchBufferPrivate *v10;
  MTLIOScratchBufferPrivate **v11;
  MTLIOScratchBufferPrivate *v12;
  objc_super v13;
  _QWORD block[5];

  pool_cleanup_queue = self->_pool_cleanup_queue;
  if (pool_cleanup_queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39___MTLIOScratchBufferAllocator_dealloc__block_invoke;
    block[3] = &unk_1E0FE2880;
    block[4] = self;
    dispatch_sync(pool_cleanup_queue, block);
    dispatch_release((dispatch_object_t)self->_pool_cleanup_queue);
  }
  pthread_mutex_destroy(&self->_pool_lock);
  tqh_first = self->_activeq.tqh_first;
  if (tqh_first)
  {
    do
    {
      var0 = tqh_first->var0.var0;
      var1 = tqh_first->var0.var1;
      if (tqh_first->var0.var0)
      {
        var0->var0.var1 = var1;
        var1 = tqh_first->var0.var1;
      }
      else
      {
        self->_activeq.tqh_last = var1;
      }
      *var1 = var0;

      free(tqh_first);
      tqh_first = var0;
    }
    while (var0);
  }
  v7 = self->_poolq.tqh_first;
  if (v7)
  {
    do
    {
      v9 = v7->var0.var0;
      v8 = v7->var0.var1;
      if (v7->var0.var0)
      {
        v9->var0.var1 = v8;
        v8 = v7->var0.var1;
      }
      else
      {
        self->_poolq.tqh_last = v8;
      }
      *v8 = v9;

      free(v7);
      v7 = v9;
    }
    while (v9);
  }
  v10 = self->_volatileq.tqh_first;
  if (v10)
  {
    do
    {
      v12 = v10->var0.var0;
      v11 = v10->var0.var1;
      if (v10->var0.var0)
      {
        v12->var0.var1 = v11;
        v11 = v10->var0.var1;
      }
      else
      {
        self->_volatileq.tqh_last = v11;
      }
      *v11 = v12;

      free(v10);
      v10 = v12;
    }
    while (v12);
  }

  v13.receiver = self;
  v13.super_class = (Class)_MTLIOScratchBufferAllocator;
  -[_MTLIOScratchBufferAllocator dealloc](&v13, sel_dealloc);
}

@end
