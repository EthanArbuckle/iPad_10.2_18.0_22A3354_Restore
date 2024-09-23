@implementation BWPixelBufferPool

- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5
{
  return -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](self, "initWithVideoFormat:capacity:name:memoryPool:", a3, a4, a5, 0);
}

- (__CFDictionary)cvPixelBufferPoolAuxAttributes
{
  -[BWPixelBufferPool _ensurePool]((uint64_t)self);
  return (__CFDictionary *)self->_pixelBufferPoolAuxAttributes;
}

- (__CVPixelBufferPool)cvPixelBufferPool
{
  -[BWPixelBufferPool _ensurePool]((uint64_t)self);
  return self->_pixelBufferPool;
}

- (CVPixelBufferRef)_newPixelBuffer
{
  uint64_t v1;
  CVReturn v2;
  uint64_t v3;
  _QWORD v4[5];
  CVPixelBufferRef pixelBufferOut;

  if (result)
  {
    v1 = (uint64_t)result;
    pixelBufferOut = 0;
    if (-[BWPixelBufferPool _ensurePool]((uint64_t)result))
      goto LABEL_8;
    -[BWPixelBufferPool _waitForBackPressureSemaphoreIfNeededAndReportIfWaited:](v1, *(unsigned __int8 *)(v1 + 97));
    v2 = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CVPixelBufferPoolRef *)(v1 + 56), *(CFDictionaryRef *)(v1 + 64), &pixelBufferOut);
    if (*(_BYTE *)(v1 + 96))
    {
      v3 = *(_QWORD *)(v1 + 104);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __36__BWPixelBufferPool__newPixelBuffer__block_invoke;
      v4[3] = &unk_1E491E720;
      v4[4] = v3;
      +[BWIOSurfaceTracking trackPixelBuffer:surfaceUseCountIsZeroHandler:](BWIOSurfaceTracking, "trackPixelBuffer:surfaceUseCountIsZeroHandler:", pixelBufferOut, v4);
    }
    if (v2)
LABEL_8:
      FigDebugAssert3();
    return pixelBufferOut;
  }
  return result;
}

- (uint64_t)_ensurePool
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 32))
    {
      if (*(_QWORD *)(result + 56))
        return 0;
      else
        return FigSignalErrorAt();
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(result + 48));
      if (!*(_QWORD *)(v1 + 56))
      {
        v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
        v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(v1 + 16));
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CA9060]);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E49F8460, *MEMORY[0x1E0CA9058]);
        v4 = *(_QWORD *)(v1 + 24);
        if (v4)
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CA9068]);
        v5 = (void *)objc_msgSend(*(id *)(v1 + 8), "pixelBufferAttributes");
        if (*(_QWORD *)(v1 + 88) && (objc_msgSend(*(id *)(v1 + 8), "memoryPoolUseAllowed") & 1) != 0
          || *(_QWORD *)(v1 + 40)
          || objc_msgSend(*(id *)(v1 + 8), "colorSpaceProperties"))
        {
          v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
          if (*(_QWORD *)(v1 + 40))
            FigCFDictionaryAddEntriesToDictionaryWithRecursion();
          if (objc_msgSend(*(id *)(v1 + 8), "colorSpaceProperties"))
          {
            v6 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", objc_msgSend(*(id *)(v1 + 8), "colorSpaceProperties"));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CA8C68]);
          }
          if (objc_msgSend(*(id *)(v1 + 8), "memoryPoolUseAllowed"))
            objc_msgSend(*(id *)(v1 + 88), "enableForPixelBufferAttributes:", v5);
        }
        *(_DWORD *)(v1 + 80) = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDictionaryRef)v2, (CFDictionaryRef)v5, (CVPixelBufferPoolRef *)(v1 + 56));
        v7 = *MEMORY[0x1E0CA9050];
        v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(v1 + 16));
        *(_QWORD *)(v1 + 64) = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
      return *(unsigned int *)(v1 + 80);
    }
  }
  return result;
}

- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:](self, "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", a3, a4, a5, 0, a6, 0, v7);
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  id v5;
  uint64_t v6;

  if (self->_clientProvidesPool)
  {
    self->_capacity = a3;
  }
  else
  {
    -[BWPixelBufferPool _ensurePool]((uint64_t)self);
    if (!CVPixelBufferPoolSetMinBufferCount())
    {
      self->_capacity = a3;
      v5 = (id)-[NSDictionary mutableCopy](self->_pixelBufferPoolAuxAttributes, "mutableCopy");
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CA9050]);

      self->_pixelBufferPoolAuxAttributes = (NSDictionary *)objc_msgSend(v5, "copy");
    }
  }
}

- (int)preallocate
{
  int v2;
  void *v4;
  int v5;

  if (!self->_clientProvidesPool)
  {
    v4 = (void *)MEMORY[0x1A858DD40]();
    v5 = -[BWPixelBufferPool _ensurePool]((uint64_t)self);
    if (v5)
    {
      v2 = v5;
    }
    else
    {
      v2 = CVPixelBufferPoolPreAllocate();
      if (!v2)
      {
LABEL_5:
        objc_autoreleasePoolPop(v4);
        return v2;
      }
    }
    FigDebugAssert3();
    goto LABEL_5;
  }
  return 0;
}

void __54__BWPixelBufferPool_preallocateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1A858DD40]();
  v3 = -[BWPixelBufferPool _ensurePool](*(_QWORD *)(a1 + 32));
  if (!(_DWORD)v3)
    v3 = CVPixelBufferPoolPreAllocate();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

- (unint64_t)width
{
  return -[BWVideoFormat width](self->_videoFormat, "width");
}

- (void)preallocateWithCompletionHandler:(id)a3
{
  NSObject *global_queue;
  _QWORD v6[6];

  if (!self->_clientProvidesPool)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__BWPixelBufferPool_preallocateWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E491F098;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(global_queue, v6);
  }
}

- (unint64_t)height
{
  return -[BWVideoFormat height](self->_videoFormat, "height");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    kBWPixelBufferPoolBackPressureWaitTimeoutInMilliSeconds = 1;
  }
}

- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 clientProvidesPool:(BOOL)a6 memoryPool:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9
{
  _BOOL4 v9;
  BWPixelBufferPool *v14;
  objc_super v16;

  if (!a3)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("no format provided"), 0));
  }
  v9 = a8;
  v16.receiver = self;
  v16.super_class = (Class)BWPixelBufferPool;
  v14 = -[BWPixelBufferPool init](&v16, sel_init, a3, a4, a5);
  if (v14)
  {
    v14->_videoFormat = (BWVideoFormat *)a3;
    v14->_capacity = a4;
    v14->_name = 0;
    v14->_pixelBufferPoolConfigurationLock._os_unfair_lock_opaque = 0;
    v14->_clientProvidesPool = a6;
    v14->_memoryPool = (BWMemoryPool *)a7;
    v14->_providesBackPressure = v9;
    v14->_reportSlowBackPressureAllocations = a9;
    if (v9)
      v14->_backPressureSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a4);
  }
  return v14;
}

- (BWPixelBufferPool)initWithVideoFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 memoryPool:(id)a6 additionalPixelBufferAttributes:(id)a7 providesBackPressure:(BOOL)a8 reportSlowBackPressureAllocations:(BOOL)a9
{
  BWPixelBufferPool *v10;
  uint64_t v12;

  LOBYTE(v12) = a9;
  v10 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:](self, "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", a3, a4, a5, 0, a6, a8, v12);
  if (v10)
    v10->_additionalPixelBufferAttributes = (NSDictionary *)objc_msgSend(a7, "copy");
  return v10;
}

- (void)dealloc
{
  __CVPixelBufferPool *pixelBufferPool;
  objc_super v4;

  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
    CFRelease(pixelBufferPool);

  v4.receiver = self;
  v4.super_class = (Class)BWPixelBufferPool;
  -[BWPixelBufferPool dealloc](&v4, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (void)setCVPixelBufferPool:(__CVPixelBufferPool *)a3 attributes:(__CFDictionary *)a4
{
  os_unfair_lock_s *p_pixelBufferPoolConfigurationLock;
  NSDictionary *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("Can't have NULL pool");
    goto LABEL_20;
  }
  if (!a4)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("Can't have NULL attributes");
    goto LABEL_20;
  }
  if (!self->_clientProvidesPool)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("Can't call when clientProvidesPool = NO");
LABEL_20:
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v17, 0));
  }
  p_pixelBufferPoolConfigurationLock = &self->_pixelBufferPoolConfigurationLock;
  os_unfair_lock_lock(&self->_pixelBufferPoolConfigurationLock);
  if (!self->_pixelBufferPool)
  {
    self->_pixelBufferPool = (__CVPixelBufferPool *)CFRetain(a3);
    v8 = (NSDictionary *)CFRetain(a4);
    self->_pixelBufferPoolAuxAttributes = v8;
    v9 = -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9050]);
    if (v9)
      objc_msgSend(v9, "intValue");
    if (-[BWVideoFormat colorSpaceProperties](self->_videoFormat, "colorSpaceProperties"))
    {
      v10 = -[__CFDictionary objectForKeyedSubscript:](CVPixelBufferPoolGetPixelBufferAttributes(a3), "objectForKeyedSubscript:", *MEMORY[0x1E0CA8C68]);
      if (v10)
      {
        v11 = (void *)v10;
        v12 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", -[BWVideoFormat colorSpaceProperties](self->_videoFormat, "colorSpaceProperties", *MEMORY[0x1E0CA8EE8], *MEMORY[0x1E0CA8D68], *MEMORY[0x1E0CA8E98], v19));
        v13 = 0;
        do
        {
          if (objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *(uint64_t *)((char *)&v18 + v13)), "isEqual:", objc_msgSend(v12, "objectForKeyedSubscript:", *(uint64_t *)((char *)&v18 + v13))))v14 = v13 == 16;
          else
            v14 = 1;
          v13 += 8;
        }
        while (!v14);
      }
    }
  }
  os_unfair_lock_unlock(p_pixelBufferPoolConfigurationLock);
}

- (BOOL)prefetch:(int)a3 lastEmittedSurfaceID:(unsigned int)a4
{
  uint64_t v4;
  int capacity;
  int v7;
  unint64_t v8;
  CVPixelBufferRef *v9;
  size_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  uint64_t v13;
  const __CFAllocator *v14;
  uint64_t v15;
  CVPixelBufferRef *v16;
  CVReturn PixelBufferWithAuxAttributes;
  __CVBuffer *v18;
  __IOSurface *IOSurface;
  uint64_t ID;
  uint64_t v22;
  uint64_t v23;
  CFDictionaryRef v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (a4)
    -[NSMutableSet addObject:](self->_prefetchedSurfaceIDs, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4));
  capacity = self->_capacity;
  if ((int)(capacity - -[NSMutableSet count](self->_prefetchedSurfaceIDs, "count")) <= (int)v4)
  {
    v7 = self->_capacity;
    v4 = v7 - -[NSMutableSet count](self->_prefetchedSurfaceIDs, "count");
  }
  if ((int)v4 < 1)
    return (int)v4 < 1;
  v8 = 8 * v4;
  v9 = (CVPixelBufferRef *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFF0));
  if (v8 >= 0x200)
    v10 = 512;
  else
    v10 = 8 * v4;
  bzero((char *)&v22 - ((v8 + 15) & 0xFFFFFFFF0), v10);
  if (!-[BWPixelBufferPool _ensurePool]((uint64_t)self))
  {
    v22 = (uint64_t)&v22;
    v23 = v4;
    v11 = v4;
    v12 = (const __CFDictionary *)(id)-[NSDictionary mutableCopy](self->_pixelBufferPoolAuxAttributes, "mutableCopy");
    v13 = *MEMORY[0x1E0CA9070];
    v24 = v12;
    -[__CFDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v13);
    bzero((char *)&v22 - ((v8 + 15) & 0xFFFFFFFF0), 8 * v4);
    v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v15 = v4;
    v16 = v9;
    do
    {
      PixelBufferWithAuxAttributes = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(v14, self->_pixelBufferPool, v24, v16);
      if (PixelBufferWithAuxAttributes)
        break;
      if (!self->_prefetchedSurfaceIDs)
        self->_prefetchedSurfaceIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v18 = *v16++;
      IOSurface = CVPixelBufferGetIOSurface(v18);
      ID = IOSurfaceGetID(IOSurface);
      -[NSMutableSet containsObject:](self->_prefetchedSurfaceIDs, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ID));
      -[NSMutableSet addObject:](self->_prefetchedSurfaceIDs, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ID));
      --v15;
    }
    while (v15);
    LODWORD(v4) = v23;
    do
    {
      if (*v9)
        CVPixelBufferRelease(*v9);
      ++v9;
      --v11;
    }
    while (v11);
    if (PixelBufferWithAuxAttributes == -6689 || PixelBufferWithAuxAttributes == -6662)
      return 1;
    return (int)v4 < 1;
  }
  FigDebugAssert3();
  return 0;
}

- (void)prefetchWithCompletionHandler:(id)a3
{
  NSObject *global_queue;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__BWPixelBufferPool_prefetchWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E491F098;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(global_queue, v6);
}

void __51__BWPixelBufferPool_prefetchWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1A858DD40]();
  v3 = -[BWPixelBufferPool _ensurePool](*(_QWORD *)(a1 + 32));
  if (!(_DWORD)v3)
    v3 = CVPixelBufferPoolPrefetchPages();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

- (void)flushToMinimumCapacity:(unint64_t)a3
{
  if (self->_pixelBufferPool)
  {
    if (self->_capacity > a3)
    {
      CVPixelBufferPoolSetMinBufferCount();
      CVPixelBufferPoolSetMinBufferCount();
    }
  }
}

- (uint64_t)_waitForBackPressureSemaphoreIfNeededAndReportIfWaited:(uint64_t)a1
{
  NSObject *v3;
  unint64_t *v4;
  unint64_t v5;
  NSObject *v6;
  int64_t v7;
  dispatch_time_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v13;
  int64_t v14;
  dispatch_time_t v15;
  NSObject *v16;

  if (a1 && *(_BYTE *)(a1 + 96))
  {
    v3 = *(NSObject **)(a1 + 104);
    if (v3)
    {
      if (a2)
      {
        v4 = (unint64_t *)(a1 + 112);
        do
          v5 = __ldaxr(v4);
        while (__stlxr(v5 + 1, v4));
        if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 104), 0))
        {
          v6 = *(NSObject **)(a1 + 104);
          v7 = kBWPixelBufferPoolBackPressureWaitTimeoutInMilliSeconds ? 1000000000 : 0;
          v8 = dispatch_time(0, v7);
          if (dispatch_semaphore_wait(v6, v8))
          {
            v9 = 0;
            do
            {
              v10 = kBWPixelBufferPoolBackPressureWaitTimeoutInMilliSeconds;
              if (kBWPixelBufferPoolBackPressureWaitTimeoutInMilliSeconds)
                v11 = 1000;
              else
                v11 = 0;
              v9 += v11;
              if (dword_1ECFE9A50)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                v10 = kBWPixelBufferPoolBackPressureWaitTimeoutInMilliSeconds;
              }
              v13 = *(NSObject **)(a1 + 104);
              if (v10)
                v14 = 1000000000;
              else
                v14 = 0;
              v15 = dispatch_time(0, v14);
            }
            while (dispatch_semaphore_wait(v13, v15));
            if (dword_1ECFE9A50)
            {
              v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
        }
      }
      else
      {
        dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    else
    {
      FigDebugAssert3();
    }
  }
  return 0;
}

intptr_t __36__BWPixelBufferPool__newPixelBuffer__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)waitForAvailablePixelBuffer
{
  char v3;

  if (!self->_providesBackPressure)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Not callable when initialized with _providesBackPressure=NO"), 0));
  v3 = -[BWPixelBufferPool _waitForBackPressureSemaphoreIfNeededAndReportIfWaited:]((uint64_t)self, 1);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_backPressureSemaphore);
  return v3;
}

- (BOOL)isPixelBufferAvailable
{
  intptr_t v3;

  if (!self->_providesBackPressure)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Not callable when initialized with _providesBackPressure=NO"), 0));
  v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_backPressureSemaphore, 0);
  if (!v3)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_backPressureSemaphore);
  return v3 == 0;
}

- (unsigned)pixelFormat
{
  return -[BWVideoFormat pixelFormat](self->_videoFormat, "pixelFormat");
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  unsigned int v3;

  v3 = -[BWVideoFormat width](self->_videoFormat, "width");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | ((unint64_t)-[BWVideoFormat height](self->_videoFormat, "height") << 32));
}

- (unint64_t)sliceCount
{
  return -[BWVideoFormat sliceCount](self->_videoFormat, "sliceCount");
}

- (BOOL)usesMemoryPool
{
  return self->_memoryPool && -[BWVideoFormat memoryPoolUseAllowed](self->_videoFormat, "memoryPoolUseAllowed");
}

- (void)enumerateSurfacesUsingBlock:(id)a3
{
  CVPixelBufferPoolScanIOSurfacesWithOptions();
}

@end
