@implementation BWDataBufferPool

+ (void)initialize
{
  objc_opt_class();
}

- (BWDataBufferPool)initWithFormat:(id)a3 capacity:(unint64_t)a4 name:(id)a5 clientProvidesPool:(BOOL)a6
{
  BWDataBufferPool *v9;
  objc_super v11;

  if (!a3)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("no format provided"), 0));
  }
  v11.receiver = self;
  v11.super_class = (Class)BWDataBufferPool;
  v9 = -[BWDataBufferPool init](&v11, sel_init, a3, a4, a5);
  if (v9)
  {
    v9->_format = (BWDataBufferBackedFormat *)a3;
    v9->_capacity = a4;
    v9->_name = 0;
    v9->_dataBufferPoolConfigurationLock._os_unfair_lock_opaque = 0;
    v9->_clientProvidesPool = a6;
  }
  return v9;
}

- (void)dealloc
{
  __CVDataBufferPool *dataBufferPool;
  objc_super v4;

  dataBufferPool = self->_dataBufferPool;
  if (dataBufferPool)
    CFRelease(dataBufferPool);

  v4.receiver = self;
  v4.super_class = (Class)BWDataBufferPool;
  -[BWDataBufferPool dealloc](&v4, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (void)setCVDataBufferPool:(__CVDataBufferPool *)a3 attributes:(__CFDictionary *)a4
{
  NSDictionary *v7;
  id v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;

  if (!a3)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = CFSTR("Can't have NULL pool");
    goto LABEL_11;
  }
  if (!a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = CFSTR("Can't have NULL attributes");
    goto LABEL_11;
  }
  if (!self->_clientProvidesPool)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = CFSTR("Can't call when clientProvidesPool = NO");
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0));
  }
  os_unfair_lock_lock(&self->_dataBufferPoolConfigurationLock);
  if (!self->_dataBufferPool)
  {
    self->_dataBufferPool = (__CVDataBufferPool *)CFRetain(a3);
    v7 = (NSDictionary *)CFRetain(a4);
    self->_dataBufferPoolAuxAttributes = v7;
    v8 = -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8C88]);
    if (v8)
      objc_msgSend(v8, "intValue");
  }
  os_unfair_lock_unlock(&self->_dataBufferPoolConfigurationLock);
}

- (void)prefetchWithCompletionHandler:(id)a3
{
  NSObject *global_queue;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__BWDataBufferPool_prefetchWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E491F098;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(global_queue, v6);
}

void __50__BWDataBufferPool_prefetchWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1A858DD40]();
  v3 = -[BWDataBufferPool _ensurePool](*(_QWORD *)(a1 + 32));
  if (!(_DWORD)v3)
    v3 = CVDataBufferPoolPrefetchPages();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  objc_autoreleasePoolPop(v2);
}

- (uint64_t)_ensurePool
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
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
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CA8C98]);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E49F8F88, *MEMORY[0x1E0CA8C90]);
        v4 = *(_QWORD *)(v1 + 24);
        if (v4)
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CA8CA0]);
        v5 = objc_msgSend(*(id *)(v1 + 8), "dataBufferAttributes");
        if (*(_QWORD *)(v1 + 40))
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
          FigCFDictionaryAddEntriesToDictionaryWithRecursion();
        }
        objc_msgSend(*(id *)(v1 + 8), "dataFormat");
        objc_msgSend(*(id *)(v1 + 8), "dataBufferSize");
        *(_DWORD *)(v1 + 72) = CVDataBufferPoolCreate();
        v6 = *MEMORY[0x1E0CA8C88];
        v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(v1 + 16));
        *(_QWORD *)(v1 + 64) = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
      return *(unsigned int *)(v1 + 72);
    }
  }
  return result;
}

- (void)flushToMinimumCapacity:(unint64_t)a3
{
  if (self->_dataBufferPool)
  {
    if (self->_capacity > a3)
    {
      CVDataBufferPoolSetMinBufferCount();
      CVDataBufferPoolSetMinBufferCount();
    }
  }
}

- (uint64_t)_newDataBuffer
{
  if (result)
  {
    if (-[BWDataBufferPool _ensurePool](result) || CVDataBufferPoolCreateDataBuffer())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    return 0;
  }
  return result;
}

- (void)setCapacity:(unint64_t)a3
{
  if (self->_clientProvidesPool
    || (-[BWDataBufferPool _ensurePool]((uint64_t)self), !CVDataBufferPoolSetMinBufferCount()))
  {
    self->_capacity = a3;
  }
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unsigned)dataFormat
{
  return -[BWDataBufferBackedFormat dataFormat](self->_format, "dataFormat");
}

- (__CVDataBufferPool)cvDataBufferPool
{
  -[BWDataBufferPool _ensurePool]((uint64_t)self);
  return self->_dataBufferPool;
}

- (__CFDictionary)cvDataBufferPoolAuxAttributes
{
  -[BWDataBufferPool _ensurePool]((uint64_t)self);
  return (__CFDictionary *)self->_dataBufferPoolAuxAttributes;
}

- (void)enumerateSurfacesUsingBlock:(id)a3
{
  CVDataBufferPoolScanIOSurfacesWithOptions();
}

@end
