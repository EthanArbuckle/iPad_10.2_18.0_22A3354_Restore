@implementation BWMemoryPool

- (int)enableForCaptureDevice:(id)a3
{
  NSObject *queue;
  int v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BWMemoryPool_enableForCaptureDevice___block_invoke;
  block[3] = &unk_1E491F458;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __47__BWMemoryPool_enableForPixelBufferAttributes___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_alloc(MEMORY[0x1E0C99E08]);
    v3 = *MEMORY[0x1E0CA8FF0];
    v5 = (id)objc_msgSend(v2, "initWithDictionary:", objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FF0]));
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "poolId"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CBBEE8]);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v3);

  }
}

- (unint64_t)poolIdentifier
{
  return -[IOSurfaceMemoryPool poolId](self->_pool, "poolId");
}

+ (BWMemoryPool)sharedMemoryPool
{
  if (sharedMemoryPool_initMemoryPool != -1)
    dispatch_once(&sharedMemoryPool_initMemoryPool, &__block_literal_global_59_1);
  return (BWMemoryPool *)sharedMemoryPool_sMemoryPool;
}

- (void)enableForPixelBufferAttributes:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__BWMemoryPool_enableForPixelBufferAttributes___block_invoke;
  v4[3] = &unk_1E491E748;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (int)enableForCaptureStream:(id)a3
{
  NSObject *queue;
  int v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BWMemoryPool_enableForCaptureStream___block_invoke;
  block[3] = &unk_1E491F458;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__39__BWMemoryPool_enableForCaptureDevice___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;
  int v4;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
  {
    result = (void *)objc_msgSend(*(id *)(a1 + 40), "setProperty:value:", *MEMORY[0x1E0D059C8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(result, "poolId")));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)result;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(_DWORD *)(v3 + 24);
    if (v4 == -12784 || v4 == -12787)
      *(_DWORD *)(v3 + 24) = 0;
  }
  return result;
}

- (void)_addFlushAssertion
{
  os_unfair_lock_s *p_flushAssertionLock;

  p_flushAssertionLock = &self->_flushAssertionLock;
  os_unfair_lock_lock(&self->_flushAssertionLock);
  ++self->_flushAssertionCount;
  os_unfair_lock_unlock(p_flushAssertionLock);
}

- (id)newFlushAssertion:(id)a3
{
  return -[BWMemoryPoolFlushAssertion initWithIdentifier:pool:]([BWMemoryPoolFlushAssertion alloc], a3, self);
}

- (uint64_t)_sizesDistributionWithTotalSize:(uint64_t)result
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = a2 << 20;
    v4 = *MEMORY[0x1E0CBBF10];
    if ((MEMORY[0xFFFFFC021] & 8) != 0)
    {
      v20[0] = &unk_1E49FB310;
      v9 = *MEMORY[0x1E0CBBEE0];
      v19[0] = v4;
      v19[1] = v9;
      v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 3145728 * a2 / 6uLL);
      v21[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v17[1] = v9;
      v18[0] = &unk_1E49FB2F8;
      v17[0] = v4;
      v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (a2 << 21) / 6uLL);
      v21[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v15[1] = v9;
      v16[0] = &unk_1E49FB328;
      v15[0] = v4;
      v16[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v3 / 6);
      v21[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = v21;
      v8 = 3;
    }
    else
    {
      v13[0] = &unk_1E49FB2F8;
      v5 = *MEMORY[0x1E0CBBEE0];
      v12[0] = v4;
      v12[1] = v5;
      v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (a2 << 21) / 3uLL);
      v14[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v3 / 3, v4, v5, &unk_1E49FB328);
      v14[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 2);
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = v14;
      v8 = 2;
    }
    return objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
  }
  return result;
}

void __21__BWMemoryPool_flush__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1A858DD40]();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_msgSend(*(id *)(v3 + 16), "flush:", MEMORY[0x1E0C9AA70]);
  objc_autoreleasePoolPop(v2);
}

- (void)_removeFlushAssertion
{
  os_unfair_lock_s *p_flushAssertionLock;
  unsigned int v4;

  p_flushAssertionLock = &self->_flushAssertionLock;
  os_unfair_lock_lock(&self->_flushAssertionLock);
  v4 = self->_flushAssertionCount - 1;
  self->_flushAssertionCount = v4;
  os_unfair_lock_unlock(p_flushAssertionLock);
  if (!v4)
    -[BWMemoryPool flush](self, "flush");
}

- (void)flush
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__BWMemoryPool_flush__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(queue, block);
}

void *__39__BWMemoryPool_enableForCaptureStream___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;
  int v4;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
  {
    result = (void *)objc_msgSend(*(id *)(a1 + 40), "setProperty:value:", *MEMORY[0x1E0D076A0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(result, "poolId")));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)result;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(_DWORD *)(v3 + 24);
    if (v4 == -12784 || v4 == -12787)
      *(_DWORD *)(v3 + 24) = 0;
  }
  return result;
}

BWMemoryPool *__32__BWMemoryPool_sharedMemoryPool__block_invoke()
{
  BWMemoryPool *result;

  result = objc_alloc_init(BWMemoryPool);
  sharedMemoryPool_sMemoryPool = (uint64_t)result;
  return result;
}

- (BWMemoryPool)init
{
  BWMemoryPool *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWMemoryPool;
  v2 = -[BWMemoryPool init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.memorypool", v3);
    *(_QWORD *)&v2->_flushAssertionCount = 0;
  }
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  objc_super v3;

  -[BWMemoryPool _disable]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWMemoryPool;
  -[BWMemoryPool dealloc](&v3, sel_dealloc);
}

- (void)_disable
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v4;
  _QWORD v5[5];
  os_log_type_t type;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {

    *(_QWORD *)(a1 + 16) = 0;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 28));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28));
    v2 = *(void **)(a1 + 32);
    if (v2)
    {
      if (dword_1ECFE9B30)
      {
        v7 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v2 = *(void **)(a1 + 32);
      }
      v4 = v2;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __24__BWMemoryPool__disable__block_invoke;
      v5[3] = &unk_1E491E720;
      v5[4] = v4;
      objc_msgSend(v4, "invalidateWithCompletionHandler:", v5);

      *(_QWORD *)(a1 + 32) = 0;
    }
  }
}

- (uint64_t)_maximizeAvailableSystemMemory
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v3;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 32))
    {
      if (dword_1ECFE9B30)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D50300]), "initWithPolicy:description:", CFSTR("Camera"), CFSTR("com.apple.cameracapture"));
      *(_QWORD *)(v1 + 32) = v3;
      return objc_msgSend(v3, "acquireWithCompletionHandler:", &__block_literal_global_93);
    }
  }
  return result;
}

void __46__BWMemoryPool__maximizeAvailableSystemMemory__block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECFE9B30)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)ensureMemoryAsyncWithSize:(unint64_t)a3 withMaximizeSystemMemory:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__BWMemoryPool_ensureMemoryAsyncWithSize_withMaximizeSystemMemory___block_invoke;
  block[3] = &unk_1E4922900;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(queue, block);
}

void __67__BWMemoryPool_ensureMemoryAsyncWithSize_withMaximizeSystemMemory___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A858DD40]();
  -[BWMemoryPool _ensureMemoryWithSize:withMaximizeSystemMemory:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

- (uint64_t)_ensureMemoryWithSize:(int)a3 withMaximizeSystemMemory:
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2)
    {
      v4 = result;
      if (*(_QWORD *)(result + 16)
        || (result = -[BWMemoryPool _createMemoryPoolWithMaximizeSystemMemory:](result, a3), (_DWORD)result))
      {
        v5 = -[BWMemoryPool _sizesDistributionWithTotalSize:](v4, a2);
        v6 = *(void **)(v4 + 16);
        v7 = *MEMORY[0x1E0CBC030];
        v8[0] = v5;
        return objc_msgSend(v6, "ensureMemory:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1)) == 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)disable
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__BWMemoryPool_disable__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __23__BWMemoryPool_disable__block_invoke(uint64_t a1)
{
  -[BWMemoryPool _disable](*(_QWORD *)(a1 + 32));
}

- (void)disableWithCompletionHandler:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__BWMemoryPool_disableWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E491F098;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __45__BWMemoryPool_disableWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1A858DD40]();
  -[BWMemoryPool _disable](*(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_autoreleasePoolPop(v2);
}

- (int)disableForCaptureStream:(id)a3
{
  NSObject *queue;
  int v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__BWMemoryPool_disableForCaptureStream___block_invoke;
  v6[3] = &unk_1E491E9A8;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__BWMemoryPool_disableForCaptureStream___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;

  result = objc_msgSend(*(id *)(a1 + 32), "setProperty:value:", *MEMORY[0x1E0D059C8], &unk_1E49FB2F8);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_DWORD *)(v3 + 24);
  if (v4 == -12784 || v4 == -12787)
    *(_DWORD *)(v3 + 24) = 0;
  return result;
}

- (id)newMTLBufferWithLength:(unint64_t)a3 forDevice:(id)a4
{
  uint64_t v4;
  IOSurfaceMemoryPool *pool;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IOSurfaceRef v11;
  IOSurfaceRef v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  pool = self->_pool;
  if (!pool)
    return (id)objc_msgSend(a4, "newBufferWithLength:options:", a3, 0, v16, v17);
  v18[0] = *MEMORY[0x1E0CBBEE8];
  v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IOSurfaceMemoryPool poolId](pool, "poolId"));
  v18[1] = *MEMORY[0x1E0CBBEE0];
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v9 = *MEMORY[0x1E0CBBF10];
  v19[1] = v8;
  v19[2] = &unk_1E49FB2F8;
  v10 = *MEMORY[0x1E0CBC050];
  v18[2] = v9;
  v18[3] = v10;
  v19[3] = MEMORY[0x1E0C9AAB0];
  v11 = IOSurfaceCreate((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4));
  if (!v11)
  {
    v17 = v4;
    LODWORD(v16) = 0;
    FigDebugAssert3();
    return (id)objc_msgSend(a4, "newBufferWithLength:options:", a3, 0, v16, v17);
  }
  v12 = v11;
  v13 = objc_msgSend(a4, "newBufferWithIOSurface:", v11);
  if (!v13)
  {
    v17 = v4;
    LODWORD(v16) = 0;
    FigDebugAssert3();
    CFRelease(v12);
    return (id)objc_msgSend(a4, "newBufferWithLength:options:", a3, 0, v16, v17);
  }
  v14 = (void *)v13;
  CFRelease(v12);
  return v14;
}

- (int)disableForCaptureDevice:(id)a3
{
  NSObject *queue;
  int v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__BWMemoryPool_disableForCaptureDevice___block_invoke;
  v6[3] = &unk_1E491E9A8;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__BWMemoryPool_disableForCaptureDevice___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;

  result = objc_msgSend(*(id *)(a1 + 32), "setProperty:value:", *MEMORY[0x1E0D059C8], &unk_1E49FB2F8);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_DWORD *)(v3 + 24);
  if (v4 == -12784 || v4 == -12787)
    *(_DWORD *)(v3 + 24) = 0;
  return result;
}

void __24__BWMemoryPool__disable__block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECFE9B30)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

}

- (uint64_t)_createMemoryPoolWithMaximizeSystemMemory:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v8 = v2;
      LODWORD(v7) = 0;
      FigDebugAssert3();
    }
    if (*(_QWORD *)(v4 + 16))
      return 1;
    if (a2)
      -[BWMemoryPool _maximizeAvailableSystemMemory](v4);
    v9[0] = *MEMORY[0x1E0CBC038];
    v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1, v7, v8);
    v9[1] = *MEMORY[0x1E0CBC028];
    v9[2] = CFSTR("IOSurfaceMemoryPoolEntitlement");
    v10[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v10[2] = CFSTR("com.apple.private.cameracapture.memorypool");
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBBEB0]), "initWithProperties:", v5);
    *(_QWORD *)(v4 + 16) = v6;
    result = objc_msgSend(v6, "poolId");
    if (result)
      return 1;
  }
  return result;
}

- (BOOL)getInUseFootprint:(unint64_t *)a3 andOutOfUseFootprint:(unint64_t *)a4
{
  NSObject *queue;
  char v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__BWMemoryPool_getInUseFootprint_andOutOfUseFootprint___block_invoke;
  v7[3] = &unk_1E4925778;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __55__BWMemoryPool_getInUseFootprint_andOutOfUseFootprint___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1[4] + 16);
  if (v1)
  {
    v2 = (void *)objc_msgSend(v1, "copyDebugInfo");
    obj = (id)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("InUse"));
    v3 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("OutOfUse"));
    if (objc_msgSend(v3, "count") == 1)
    {
      v28 = v2;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v4 = (void *)objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", CFSTR("Buckets"));
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v5)
      {
        v6 = v5;
        v7 = 0;
        v8 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v40 != v8)
              objc_enumerationMutation(v4);
            v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v11 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Bucket buffer size"));
            v12 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Descriptors"));
            v13 = objc_msgSend(v11, "integerValue");
            v7 += objc_msgSend(v12, "count") * v13;
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v6);
      }
      else
      {
        v7 = 0;
      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = *(_QWORD *)v36;
        while (2)
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v36 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
            v20 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Pool Id")), "unsignedLongLongValue");
            if (v20 != objc_msgSend(*(id *)(a1[4] + 16), "poolId"))
            {
              *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
              goto LABEL_35;
            }
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v21 = (void *)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Components"));
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v32;
              do
              {
                for (k = 0; k != v23; ++k)
                {
                  if (*(_QWORD *)v32 != v24)
                    objc_enumerationMutation(v21);
                  v16 += objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * k), "objectForKeyedSubscript:", CFSTR("Length")), "unsignedLongLongValue");
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
              }
              while (v23);
            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v15)
            continue;
          break;
        }
      }
      else
      {
        v16 = 0;
      }
      v26 = (_QWORD *)a1[6];
      if (v26)
        *v26 = v16;
      v27 = (_QWORD *)a1[7];
      if (v27)
        *v27 = v7;
LABEL_35:
      v2 = v28;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    }
  }
  else
  {
    v2 = 0;
  }

}

@end
