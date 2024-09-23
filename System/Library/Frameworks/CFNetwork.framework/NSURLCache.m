@implementation NSURLCache

- (void)_CFURLCache
{
  NSURLCacheInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->_cacheRef;
  else
    return 0;
}

+ (NSURLCache)sharedURLCache
{
  NSURLCache *v2;
  objc_class *v3;
  const char *Name;
  objc_class *v5;
  const char *v6;
  const void *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_gSharedCacheLock);
  if (!sharedInstance)
  {
    if (gSharedInstance)
    {
      v2 = [NSURLCache alloc];
      if (v2)
        v2 = -[NSURLCache _initWithExistingCFURLCache:](v2, "_initWithExistingCFURLCache:", gSharedInstance);
    }
    else
    {
      v2 = objc_alloc_init(NSURLCache);
    }
    sharedInstance = (uint64_t)v2;
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = (objc_class *)objc_opt_self();
    v6 = class_getName(v5);
    v7 = (const void *)sharedInstance;
    if (Name == v6)
      v7 = *(const void **)(*(_QWORD *)(sharedInstance + 8) + 24);
    CFURLCacheSetSharedURLCache(v7);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_gSharedCacheLock);
  return (NSURLCache *)(id)sharedInstance;
}

- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forDataTask:(NSURLSessionDataTask *)dataTask
{
  -[NSURLCache storeCachedResponse:forRequest:](self, "storeCachedResponse:forRequest:", cachedResponse, -[NSURLSessionTask currentRequest](dataTask, "currentRequest"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLCache;
  -[NSURLCache dealloc](&v3, sel_dealloc);
}

- (NSCachedURLResponse)cachedResponseForRequest:(NSURLRequest *)request
{
  NSURLCacheInternal *internal;
  __CFCachedURLResponse **v4;
  __CFCachedURLResponse **v5;
  NSCachedURLResponse *NSCachedURLResponse;
  NSCachedURLResponse *v7;
  NSCachedURLResponse *v8;

  if (!request)
  {
    NSLog(CFSTR("called cachedResponseForRequest: with nil request"), a2);
    return 0;
  }
  internal = self->_internal;
  if (!internal)
    return 0;
  v4 = (__CFCachedURLResponse **)CFURLCacheCopyResponseForRequest(internal->_cacheRef, (_CFURLRequest *)request);
  if (!v4)
    return 0;
  v5 = v4;
  NSCachedURLResponse = (NSCachedURLResponse *)__CFCachedURLResponse::GetNSCachedURLResponse(v4[2]);
  if (NSCachedURLResponse)
  {
    v7 = NSCachedURLResponse;
    v8 = NSCachedURLResponse;
    -[NSCachedURLResponse _reestablishInternalCFCachedURLResponse:](v7, "_reestablishInternalCFCachedURLResponse:", v5);
  }
  else
  {
    v7 = (NSCachedURLResponse *)-[NSCachedURLResponse _initWithCFCachedURLResponse:]([NSCachedURLResponse alloc], "_initWithCFCachedURLResponse:", v5);
  }
  CFRelease(v5);
  return v7;
}

- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request
{
  NSURLCacheInternal *internal;

  if (cachedResponse)
  {
    if (request)
    {
      internal = self->_internal;
      if (internal)
        CFURLCacheAddCachedResponseForRequest((_CFURLCache *)internal->_cacheRef, -[NSCachedURLResponse _CFCachedURLResponse](cachedResponse, "_CFCachedURLResponse"), (_CFURLRequest *)request, cachedResponse);
      else
        NSLog(CFSTR("called storeCachedResponse:forRequest: subclass should implement"), a2);
    }
    else
    {
      NSLog(CFSTR("called storeCachedResponse:forRequest: with nil request"), a2);
    }
  }
  else
  {
    NSLog(CFSTR("called storeCachedResponse:forRequest: with nil cached response"), a2);
  }
}

- (NSURLCache)initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)path
{
  NSURLCache *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSURLCache;
  v8 = -[NSURLCache init](&v10, sel_init);
  if (v8)
  {
    v8->_internal = objc_alloc_init(NSURLCacheInternal);
    v8->_internal->_cacheRef = (void *)__CFURLCacheCreateInternal((const __CFAllocator *)*MEMORY[0x1E0C9AE00], memoryCapacity, diskCapacity, (const __CFString *)path, 0, 0, 0);
    CFMakeCollectable(v8->_internal->_cacheRef);
    -[NSURLCache setMemoryCapacity:](v8, "setMemoryCapacity:", memoryCapacity);
    -[NSURLCache setDiskCapacity:](v8, "setDiskCapacity:", diskCapacity);
  }
  return v8;
}

- (void)setMemoryCapacity:(NSUInteger)memoryCapacity
{
  NSURLCacheInternal *internal;

  internal = self->_internal;
  if (internal)
    CFURLCacheSetMemoryCapacity((_QWORD *)internal->_cacheRef, memoryCapacity);
}

- (void)setDiskCapacity:(NSUInteger)diskCapacity
{
  NSURLCacheInternal *internal;

  internal = self->_internal;
  if (internal)
    CFURLCacheSetDiskCapacity((_QWORD *)internal->_cacheRef, diskCapacity);
}

- (NSUInteger)diskCapacity
{
  NSURLCacheInternal *internal;

  internal = self->_internal;
  if (internal)
    return (NSUInteger)CFURLCacheDiskCapacity((_QWORD *)internal->_cacheRef);
  else
    return 0;
}

- (NSUInteger)memoryCapacity
{
  NSURLCacheInternal *internal;

  internal = self->_internal;
  if (internal)
    return (NSUInteger)CFURLCacheMemoryCapacity((_QWORD *)internal->_cacheRef);
  else
    return 0;
}

- (double)_maxCacheableEntrySizeRatio
{
  NSURLCacheInternal *internal;
  double v3;
  _QWORD *cacheRef;

  internal = self->_internal;
  v3 = 0.0;
  if (internal)
  {
    cacheRef = internal->_cacheRef;
    if (IsCFURLCache((_BOOL8)cacheRef))
      return *(double *)(cacheRef[2] + 200);
  }
  return v3;
}

- (NSUInteger)currentMemoryUsage
{
  NSURLCacheInternal *internal;

  internal = self->_internal;
  if (internal)
    return (NSUInteger)CFURLCacheCurrentMemoryUsage((_QWORD *)internal->_cacheRef);
  else
    return 0;
}

- (void)getCachedResponseForDataTask:(NSURLSessionDataTask *)dataTask completionHandler:(void *)completionHandler
{
  (*((void (**)(void *, NSCachedURLResponse *))completionHandler + 2))(completionHandler, -[NSURLCache cachedResponseForRequest:](self, "cachedResponseForRequest:", -[NSURLSessionTask currentRequest](dataTask, "currentRequest")));
}

- (void)set_maxCacheableEntrySizeRatio:(double)a3
{
  NSURLCacheInternal *internal;
  _QWORD *cacheRef;
  uint64_t v5;

  internal = self->_internal;
  if (internal)
  {
    cacheRef = internal->_cacheRef;
    if (IsCFURLCache((_BOOL8)cacheRef))
    {
      v5 = cacheRef[2];
      *(double *)(v5 + 200) = a3;
      *(int64x2_t *)(v5 + 184) = vcvtq_s64_f64(vmulq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(v5 + 168)), a3));
    }
  }
}

- (void)removeAllCachedResponses
{
  NSURLCacheInternal *internal;

  internal = self->_internal;
  if (internal)
    CFURLCacheRemoveAllCachedResponses((_QWORD *)internal->_cacheRef);
}

- (NSURLCache)init
{
  return -[NSURLCache initWithMemoryCapacity:diskCapacity:diskPath:](self, "initWithMemoryCapacity:diskCapacity:diskPath:", 512000, 10000000, 0);
}

- (NSURLCache)initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity directoryURL:(NSURL *)directoryURL
{
  NSURLCache *v8;
  const __CFAllocator *v9;
  const __CFString *v10;
  uint64_t Internal;
  objc_super v13;
  _QWORD v14[2];
  void (*v15)(uint64_t);
  void *v16;
  const __CFString *v17;

  v13.receiver = self;
  v13.super_class = (Class)NSURLCache;
  v8 = -[NSURLCache init](&v13, sel_init);
  if (v8)
  {
    v8->_internal = objc_alloc_init(NSURLCacheInternal);
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (directoryURL)
      v10 = CFURLCopyPath((CFURLRef)directoryURL);
    else
      v10 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v15 = ___Z24_CFURLCacheCreateWithURLPK13__CFAllocatorllPK7__CFURL_block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0l;
    v17 = v10;
    Internal = __CFURLCacheCreateInternal(v9, memoryCapacity, diskCapacity, v10, 0, 1, 0);
    v15((uint64_t)v14);
    v8->_internal->_cacheRef = (void *)Internal;
    CFMakeCollectable(v8->_internal->_cacheRef);
    -[NSURLCache setMemoryCapacity:](v8, "setMemoryCapacity:", memoryCapacity);
    -[NSURLCache setDiskCapacity:](v8, "setDiskCapacity:", diskCapacity);
  }
  return v8;
}

- (NSUInteger)currentDiskUsage
{
  NSURLCacheInternal *internal;

  internal = self->_internal;
  if (internal)
    return (NSUInteger)CFURLCacheCurrentDiskUsage((__CFURLCache **)internal->_cacheRef);
  else
    return 0;
}

- (id)_initWithMemoryCapacity:(unint64_t)a3 diskCapacity:(unint64_t)a4 relativePath:(id)a5
{
  NSURLCache *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSURLCache;
  v8 = -[NSURLCache init](&v10, sel_init);
  if (v8)
  {
    v8->_internal = objc_alloc_init(NSURLCacheInternal);
    v8->_internal->_cacheRef = (void *)__CFURLCacheCreateInternal((const __CFAllocator *)*MEMORY[0x1E0C9AE00], a3, a4, (const __CFString *)a5, 1, 0, 0);
    CFMakeCollectable(v8->_internal->_cacheRef);
    -[NSURLCache setMemoryCapacity:](v8, "setMemoryCapacity:", a3);
    -[NSURLCache setDiskCapacity:](v8, "setDiskCapacity:", a4);
  }
  return v8;
}

+ (void)setSharedURLCache:(NSURLCache *)sharedURLCache
{
  id v4;
  NSURLCache *v5;
  objc_class *v6;
  const char *Name;
  objc_class *v8;

  os_unfair_lock_lock((os_unfair_lock_t)&_gSharedCacheLock);
  if ((NSURLCache *)sharedInstance != sharedURLCache)
  {
    v4 = (id)sharedInstance;
    if (sharedURLCache)
    {
      v5 = sharedURLCache;
      sharedInstance = (uint64_t)sharedURLCache;
      v6 = (objc_class *)objc_opt_class();
      Name = class_getName(v6);
      v8 = (objc_class *)objc_opt_self();
      if (Name == class_getName(v8))
        sharedURLCache = (NSURLCache *)sharedURLCache->_internal->_cacheRef;
    }
    else
    {
      sharedInstance = 0;
    }
    CFURLCacheSetSharedURLCache(sharedURLCache);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_gSharedCacheLock);
}

- (_CFCachedURLResponse)_nscfBridgeURLCacheCopyResponseForRequest:(_CFURLRequest *)a3
{
  id v4;
  NSCachedURLResponse *v5;

  v4 = -[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", a3);
  v5 = -[NSURLCache cachedResponseForRequest:](self, "cachedResponseForRequest:", v4);

  if (v5)
    return (_CFCachedURLResponse *)CFRetain(-[NSCachedURLResponse _CFCachedURLResponse](v5, "_CFCachedURLResponse"));
  else
    return 0;
}

- (void)_nscfBridgeURLCacheStoreCachedResponse:(_CFCachedURLResponse *)a3 forRequest:(_CFURLRequest *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;

  v9 = -[NSCachedURLResponse _initWithCFCachedURLResponse:]([NSCachedURLResponse alloc], "_initWithCFCachedURLResponse:", a3);
  v6 = -[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", a4);
  v7 = v6;
  if (v9)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    -[NSURLCache storeCachedResponse:forRequest:](self, "storeCachedResponse:forRequest:");
  }

LABEL_8:
  if (v9)

}

- (id)_initWithIdentifier:(id)a3 memoryCapacity:(int64_t)a4 diskCapacity:(int64_t)a5 private:(BOOL)a6
{
  const __CFString *v8;
  const void *Internal;
  id v10;

  if (a6)
    v8 = CFSTR("/tmp/PRIVATE_CACHE_HACK");
  else
    v8 = 0;
  Internal = (const void *)__CFURLCacheCreateInternal((const __CFAllocator *)*MEMORY[0x1E0C9AE00], a4, a5, v8, 0, 0, 0);
  v10 = -[NSURLCache _initWithExistingCFURLCache:](self, "_initWithExistingCFURLCache:", Internal);
  CFRelease(Internal);
  return v10;
}

- (id)_initVaryHeaderEnabledWithPath:(id)a3
{
  NSURLCache *v5;
  objc_super v7;

  if (!a3 || !objc_msgSend(a3, "length"))
    __assert_rtn("-[NSURLCache _initVaryHeaderEnabledWithPath:]", "NSURLCache.mm", 522, "path && [path length]");
  v7.receiver = self;
  v7.super_class = (Class)NSURLCache;
  v5 = -[NSURLCache init](&v7, sel_init);
  if (v5)
  {
    v5->_internal = objc_alloc_init(NSURLCacheInternal);
    v5->_internal->_cacheRef = (void *)__CFURLCacheCreateInternal((const __CFAllocator *)*MEMORY[0x1E0C9AE00], 512000, 10000000, (const __CFString *)a3, 1, 0, 1);
    CFMakeCollectable(v5->_internal->_cacheRef);
    -[NSURLCache setMemoryCapacity:](v5, "setMemoryCapacity:", 512000);
    -[NSURLCache setDiskCapacity:](v5, "setDiskCapacity:", 10000000);
  }
  return v5;
}

- (id)_initWithExistingCFURLCache:(void *)a3
{
  NSURLCache *v4;
  void *v5;
  CFTypeRef v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSURLCache;
  v4 = -[NSURLCache init](&v8, sel_init);
  if (v4)
  {
    v4->_internal = objc_alloc_init(NSURLCacheInternal);
    if (a3)
      v5 = a3;
    else
      v5 = (void *)gSharedInstance;
    v6 = CFRetain(v5);
    v4->_internal->_cacheRef = (void *)CFMakeCollectable(v6);
    -[NSURLCache setMemoryCapacity:](v4, "setMemoryCapacity:", CFURLCacheMemoryCapacity((_QWORD *)v4->_internal->_cacheRef));
    -[NSURLCache setDiskCapacity:](v4, "setDiskCapacity:", CFURLCacheDiskCapacity((_QWORD *)v4->_internal->_cacheRef));
  }
  return v4;
}

- (void)flushWithCompletion:(id)a3
{
  NSURLCacheInternal *internal;

  internal = self->_internal;
  if (internal)
    _CFURLCacheFlush((uint64_t)internal->_cacheRef, (void (**)(_QWORD))a3);
}

- (void)removeCachedResponseForRequest:(NSURLRequest *)request
{
  NSURLCacheInternal *internal;

  if (request)
  {
    internal = self->_internal;
    if (internal)
      CFURLCacheRemoveCachedResponseForRequest((__CFURLCache **)internal->_cacheRef, (_CFURLRequest *)request);
    else
      NSLog(CFSTR("called removeCachedResponseForRequest: subclass should implement"), a2);
  }
  else
  {
    NSLog(CFSTR("called removeCachedResponseForRequest: with nil request"), a2);
  }
}

- (void)removeCachedResponsesSinceDate:(NSDate *)date
{
  NSURLCacheInternal *internal;
  dispatch_queue_t *v5;
  id v6;
  void *v7;
  dispatch_queue_t v8;
  dispatch_block_t v9;
  _QWORD block[7];

  if (date)
  {
    internal = self->_internal;
    if (internal)
    {
      v5 = (dispatch_queue_t *)*((_QWORD *)internal->_cacheRef + 2);
      v6 = __CFURLCache::createAndOpenCacheDB((__CFURLCache *)v5);
      if (v6)
      {
        v7 = v6;
        v8 = v5[17];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = ___ZN12__CFURLCache30removeCachedResponsesSinceDateEPK8__CFDate_block_invoke;
        block[3] = &unk_1E14FE1E0;
        block[4] = v8;
        block[5] = v6;
        block[6] = date;
        v9 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
        dispatch_async(v5[17], v9);
        _Block_release(v9);

      }
    }
    else
    {
      NSLog(CFSTR("called removeCachedResponsesSince: subclass should implement"), a2);
    }
  }
  else
  {
    NSLog(CFSTR("called removeCachedResponsesSince: with nil date."), a2);
  }
}

- (id)_cacheDirectory
{
  return 0;
}

- (id)_varyStateForURL:(id)a3
{
  return (id)__CFURLCache::_varyStateForURL(*((__CFURLCache **)self->_internal->_cacheRef + 2), (__CFString *)a3);
}

- (void)_updateVaryState:(id)a3 forURL:(id)a4
{
  __CFURLCache::_updateVaryStateForURL(*((__CFURLCache **)self->_internal->_cacheRef + 2), (__CFString *)a3, (__CFString *)a4);
}

- (BOOL)_isVaryHeaderSupportEnabled
{
  NSURLCacheInternal *internal;
  _QWORD *cacheRef;
  uint64_t v4;

  internal = self->_internal;
  return internal && (cacheRef = internal->_cacheRef) != 0 && (v4 = cacheRef[2]) != 0 && *(_BYTE *)(v4 + 632) != 0;
}

- (void)removeCachedResponseForDataTask:(NSURLSessionDataTask *)dataTask
{
  -[NSURLCache removeCachedResponseForRequest:](self, "removeCachedResponseForRequest:", -[NSURLSessionTask currentRequest](dataTask, "currentRequest"));
}

@end
