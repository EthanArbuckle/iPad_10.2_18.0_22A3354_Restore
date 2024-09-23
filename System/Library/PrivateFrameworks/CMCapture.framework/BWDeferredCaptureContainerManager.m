@implementation BWDeferredCaptureContainerManager

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_73_0);
  return (id)sharedInstance_sharedInstance;
}

BWDeferredCaptureContainerManager *__51__BWDeferredCaptureContainerManager_sharedInstance__block_invoke()
{
  BWDeferredCaptureContainerManager *result;

  result = objc_alloc_init(BWDeferredCaptureContainerManager);
  sharedInstance_sharedInstance = (uint64_t)result;
  return result;
}

- (BWDeferredCaptureContainerManager)init
{
  id v2;
  BWDeferredCaptureContainerManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWDeferredCaptureContainerManager;
  v2 = -[BWDeferredContainerManagerBase initWithQueuePriority:](&v5, sel_initWithQueuePriority_, 14);
  v3 = (BWDeferredCaptureContainerManager *)v2;
  if (v2)
  {
    *((_DWORD *)v2 + 54) = 0;
    *((_DWORD *)v2 + 55) = 10;
    *((_QWORD *)v2 + 28) = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 26));
    v3->_stagedContainers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_cachedContainers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_inflightContainers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_flushQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v3->_flushQueueBackground = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v3->_pools = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[BWDeferredCaptureContainerManager _queryLowDiskThresholds:veryLowDiskThresholdBytes:]((uint64_t)v3, (uint64_t *)&v3->_cachedLowDiskThresholdBytes, 0);
  }
  return v3;
}

- (uint64_t)_queryLowDiskThresholds:(uint64_t *)a3 veryLowDiskThresholdBytes:
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  statfs v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  memset(&v10, 0, 512);
  v9 = 0;
  v5 = -[NSString fileSystemRepresentation](NSHomeDirectory(), "fileSystemRepresentation");
  if (!statfs(v5, &v10)
    && !fsctl(v10.f_mntonname, 0x4004681CuLL, (char *)&v9 + 4, 0)
    && !fsctl(v10.f_mntonname, 0x4004681BuLL, &v9, 0))
  {
    v6 = v10.f_bsize * HIDWORD(v9);
    v7 = (v9 * v10.f_bsize);
    if (!a2)
      goto LABEL_7;
    goto LABEL_6;
  }
  FigDebugAssert3();
  v7 = 524288000;
  v6 = 734003200;
  if (a2)
LABEL_6:
    *a2 = v6;
LABEL_7:
  if (a3)
    *a3 = v7;
  return 0;
}

uint64_t __87__BWDeferredCaptureContainerManager__containerForCaptureRequestIdentifier_array_index___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(a2, "captureRequestIdentifier"));
}

- (uint64_t)_stagedContainerForCaptureRequestIdentifier:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  if (result)
  {
    v2 = *(void **)(result + 232);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __87__BWDeferredCaptureContainerManager__containerForCaptureRequestIdentifier_array_index___block_invoke;
    v4[3] = &unk_1E49213C8;
    v4[4] = a2;
    v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", v4);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return objc_msgSend(v2, "objectAtIndexedSubscript:", v3);
  }
  return result;
}

- (uint64_t)_cachedContainerForCaptureRequestIdentifier:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  if (result)
  {
    v2 = *(void **)(result + 248);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __87__BWDeferredCaptureContainerManager__containerForCaptureRequestIdentifier_array_index___block_invoke;
    v4[3] = &unk_1E49213C8;
    v4[4] = a2;
    v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", v4);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return objc_msgSend(v2, "objectAtIndexedSubscript:", v3);
  }
  return result;
}

- (uint64_t)_inflightContainerForCaptureRequestIdentifier:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  if (result)
  {
    v2 = *(void **)(result + 240);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __87__BWDeferredCaptureContainerManager__containerForCaptureRequestIdentifier_array_index___block_invoke;
    v4[3] = &unk_1E49213C8;
    v4[4] = a2;
    v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", v4);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return objc_msgSend(v2, "objectAtIndexedSubscript:", v3);
  }
  return result;
}

- (uint64_t)_removeContainerForCaptureRequestIdentifier:(void *)a3 array:
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  if (result)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __87__BWDeferredCaptureContainerManager__containerForCaptureRequestIdentifier_array_index___block_invoke;
    v6[3] = &unk_1E49213C8;
    v6[4] = a2;
    v4 = objc_msgSend(a3, "indexOfObjectPassingTest:", v6);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      v5 = v4;
      result = objc_msgSend(a3, "objectAtIndexedSubscript:", v4);
      if (result)
      {
        objc_msgSend(a3, "removeObjectAtIndex:", v5);
        return 1;
      }
    }
  }
  return result;
}

- (uint64_t)_flushContainer:(void *)a3 container:
{
  _QWORD block[6];
  int v8;

  if (a1)
  {
    objc_msgSend(a3, "preflush");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__BWDeferredCaptureContainerManager__flushContainer_container___block_invoke;
    block[3] = &unk_1E491EEF8;
    block[4] = a3;
    block[5] = a1;
    v8 = 0;
    dispatch_async(a2, block);
  }
  return 0;
}

uint64_t __63__BWDeferredCaptureContainerManager__flushContainer_container___block_invoke(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v3 = objc_msgSend(*(id *)(a1 + 32), "captureRequestIdentifier");
  objc_msgSend(*(id *)(a1 + 32), "flush");
  -[BWDeferredCaptureContainerManager _reportCoreAnalyticsDataWithError:container:](*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void **)(a1 + 32));
  pthread_rwlock_wrlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 40) + 8));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    -[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:](v4, v3, *(void **)(v4 + 240));
    v5 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }
  result = pthread_rwlock_unlock((pthread_rwlock_t *)(v5 + 8));
  if (*v2 == 1)
    return kdebug_trace();
  return result;
}

- (uint64_t)_reportCoreAnalyticsDataWithError:(void *)a3 container:
{
  BWDeferredCaptureAnalyticsPayload *v5;

  if (result)
  {
    v5 = objc_alloc_init(BWDeferredCaptureAnalyticsPayload);
    -[BWDeferredCaptureAnalyticsPayload setError:](v5, "setError:", a2);
    if (a3)
    {
      -[BWDeferredCaptureAnalyticsPayload setProcessingType:](v5, "setProcessingType:", objc_msgSend(a3, "processingType"));
      -[BWDeferredCaptureAnalyticsPayload setFileBacked:](v5, "setFileBacked:", objc_msgSend(a3, "cached") ^ 1);
      -[BWDeferredCaptureAnalyticsPayload setCommitDurationInMilliseconds:](v5, "setCommitDurationInMilliseconds:", objc_msgSend(a3, "commitDurationNS") / 0xF4240uLL);
      -[BWDeferredCaptureAnalyticsPayload setFlushDurationInMilliseconds:](v5, "setFlushDurationInMilliseconds:", objc_msgSend(a3, "flushDurationNS") / 0xF4240uLL);
    }
    return -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v5);
  }
  return result;
}

- (void)_rescheduleCacheExpiryTimer
{
  _DWORD *v2;
  NSObject *v3;
  _QWORD handler[5];

  if (a1)
  {
    v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
    if (objc_msgSend(*(id *)(a1 + 248), "count"))
    {
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 224), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "firstObject"), "cacheExpiryTime"), 0xFFFFFFFFFFFFFFFFLL, 0);
      v3 = *(NSObject **)(a1 + 224);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __64__BWDeferredCaptureContainerManager__rescheduleCacheExpiryTimer__block_invoke;
      handler[3] = &unk_1E491E720;
      handler[4] = a1;
      dispatch_source_set_event_handler(v3, handler);
      dispatch_resume(*(dispatch_object_t *)(a1 + 224));
    }
    else
    {
      FigDebugAssert3();
    }
    if (*v2 == 1)
      kdebug_trace();
  }
}

uint64_t __64__BWDeferredCaptureContainerManager__rescheduleCacheExpiryTimer__block_invoke(uint64_t a1)
{
  return -[BWDeferredCaptureContainerManager _handleExpiryTimer](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_handleExpiryTimer
{
  uint64_t v1;
  _DWORD *v2;
  pthread_rwlock_t *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[6];
  int v9;

  v1 = a1;
  if (!a1)
    return v1;
  v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  dispatch_suspend(*(dispatch_object_t *)(v1 + 224));
  v3 = (pthread_rwlock_t *)(v1 + 8);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v1 + 8));
  if (!objc_msgSend(*(id *)(v1 + 248), "count"))
    goto LABEL_7;
  v4 = objc_msgSend(*(id *)(v1 + 248), "objectAtIndexedSubscript:", 0);
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(v1 + 240), "addObject:", v4);
    objc_msgSend(*(id *)(v1 + 248), "removeObjectAtIndex:", 0);
    v6 = *(NSObject **)(v1 + 264);
    objc_msgSend(v5, "preflush");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__BWDeferredCaptureContainerManager__flushContainer_container___block_invoke;
    block[3] = &unk_1E491EEF8;
    block[4] = v5;
    block[5] = v1;
    v9 = 0;
    dispatch_async(v6, block);
    -[BWDeferredCaptureContainerManager _rescheduleCacheExpiryTimer](v1);
LABEL_7:
    v1 = 0;
    goto LABEL_8;
  }
  FigDebugAssert3();
  v1 = 4294951160;
LABEL_8:
  pthread_rwlock_unlock(v3);
  if (*v2 == 1)
    kdebug_trace();
  return v1;
}

- (void)_updateCacheEntryForContainer:(int)a3 release:
{
  id v6;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 248), "count"))
      dispatch_suspend(*(dispatch_object_t *)(a1 + 224));
    if (a3)
    {
      if ((-[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:](a1, objc_msgSend(a2, "captureRequestIdentifier"), *(void **)(a1 + 248)) & 1) == 0)FigDebugAssert3();
    }
    else
    {
      v6 = a2;
      -[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:](a1, objc_msgSend(a2, "captureRequestIdentifier"), *(void **)(a1 + 248));
      objc_msgSend(a2, "setCached:", 1);
      objc_msgSend(a2, "setCacheExpiryTime:", dispatch_time(0, 1000000000 * *(unsigned int *)(a1 + 220)));
      objc_msgSend(*(id *)(a1 + 248), "insertObject:atIndex:", a2, objc_msgSend(*(id *)(a1 + 248), "indexOfObject:inSortedRange:options:usingComparator:", a2, 0, objc_msgSend(*(id *)(a1 + 248), "count"), 1024, &__block_literal_global_84_0));

    }
    -[BWDeferredCaptureContainerManager _rescheduleCacheExpiryTimer](a1);
  }
}

uint64_t __75__BWDeferredCaptureContainerManager__updateCacheEntryForContainer_release___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v7;

  v5 = objc_msgSend(a2, "cacheExpiryTime");
  if (v5 > objc_msgSend(a3, "cacheExpiryTime"))
    return 1;
  v7 = objc_msgSend(a2, "cacheExpiryTime");
  if (v7 >= objc_msgSend(a3, "cacheExpiryTime"))
    return 0;
  else
    return -1;
}

- (BOOL)canDefer
{
  const char *v3;
  statfs v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(&v5, 0, 512);
  v3 = -[NSString fileSystemRepresentation](NSHomeDirectory(), "fileSystemRepresentation");
  if (!statfs(v3, &v5))
  {
    if (v5.f_bavail * v5.f_bsize > self->_cachedLowDiskThresholdBytes)
      return 1;
    -[BWDeferredCaptureContainerManager _reportCoreAnalyticsDataWithError:container:]((uint64_t)self, 4294951160, 0);
  }
  return 0;
}

- (id)createCaptureContainerWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 err:(int *)a5
{
  _DWORD *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  BWDeferredCaptureContainer *v13;
  BWDeferredCaptureContainer *v14;
  uint64_t v16;
  char v17;

  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (a3 && a4)
  {
    v17 = 0;
    v16 = 0;
    v10 = -[BWDeferredContainerManagerBase _containerURLForApplicationID:captureRequestIdentifier:processingContainer:exists:isDirectory:resolvedApplicationID:]((uint64_t)self, a3, (uint64_t)a4, 0, &v17, 0, &v16);
    if (!v17)
    {
      v11 = v10;
      v12 = self->_cacheSize == 0;
      v13 = [BWDeferredCaptureContainer alloc];
      v14 = -[BWDeferredCaptureContainer initWithApplicationID:captureRequestIdentifier:baseFolderURL:flushBuffersUponCommit:err:](v13, "initWithApplicationID:captureRequestIdentifier:baseFolderURL:flushBuffersUponCommit:err:", v16, a4, v11, v12, a5);
      LODWORD(a4) = 0;
      if (!a5)
        goto LABEL_8;
      goto LABEL_7;
    }
    a4 = (id)4294951161;
  }
  else
  {
    FigDebugAssert3();
    a4 = (id)4294954516;
  }
  -[BWDeferredCaptureContainerManager _reportCoreAnalyticsDataWithError:container:]((uint64_t)self, (uint64_t)a4, 0);
  v14 = 0;
  if (a5)
LABEL_7:
    *a5 = (int)a4;
LABEL_8:
  if (*v9 == 1)
    kdebug_trace();
  return v14;
}

- (int)addCaptureContainer:(id)a3
{
  _DWORD *v5;
  int v6;

  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  if (a3)
  {
    -[NSMutableArray addObject:](self->_stagedContainers, "addObject:", a3);
    v6 = 0;
  }
  else
  {
    FigDebugAssert3();
    v6 = -12780;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v5 == 1)
    kdebug_trace();
  return v6;
}

- (id)lookupCaptureContainer:(id)a3
{
  _DWORD *v5;
  void *v6;

  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_rdlock(&self->super._lock);
  if (a3)
  {
    v6 = (void *)-[BWDeferredCaptureContainerManager _stagedContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a3);
  }
  else
  {
    FigDebugAssert3();
    v6 = 0;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v5 == 1)
    kdebug_trace();
  return v6;
}

- (int)commitContainer:(id)a3
{
  _DWORD *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  unsigned int v11;

  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  if (!a3)
  {
    FigDebugAssert3();
    v7 = 0;
LABEL_18:
    v11 = -12780;
    goto LABEL_10;
  }
  v6 = (void *)-[BWDeferredCaptureContainerManager _stagedContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a3);
  v7 = v6;
  if (!v6)
  {
    FigDebugAssert3();
    goto LABEL_18;
  }
  v8 = v6;
  if (self)
    -[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:]((uint64_t)self, (uint64_t)a3, self->_stagedContainers);
  v9 = objc_msgSend(v7, "commit");
  v11 = v9;
  if ((_DWORD)v9 || (objc_msgSend(v7, "valid:", &v11), (v9 = v11) != 0))
  {
    -[BWDeferredCaptureContainerManager _reportCoreAnalyticsDataWithError:container:]((uint64_t)self, v9, v7);
  }
  else if (-[NSMutableArray count](self->_cachedContainers, "count") >= (unint64_t)self->_cacheSize)
  {
    -[NSMutableArray addObject:](self->_inflightContainers, "addObject:", v7);
    -[BWDeferredCaptureContainerManager _flushContainer:container:]((uint64_t)self, self->_flushQueue, v7);
  }
  else
  {
    -[BWDeferredCaptureContainerManager _updateCacheEntryForContainer:release:]((uint64_t)self, v7, 0);
  }
LABEL_10:
  pthread_rwlock_unlock(&self->super._lock);

  if (*v5 == 1)
    kdebug_trace();
  return v11;
}

- (int)containerWaitForFlush:(id)a3
{
  _opaque_pthread_rwlock_t *p_lock;
  void *v6;
  int v7;

  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  v6 = (void *)-[BWDeferredCaptureContainerManager _inflightContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a3);
  if (v6)
    v7 = objc_msgSend(v6, "waitForFlush");
  else
    v7 = 0;
  pthread_rwlock_unlock(p_lock);
  return v7;
}

- (int)abortContainer:(id)a3 error:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  _DWORD *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v17;
  uint64_t v18;
  objc_super v19;

  v5 = *(_QWORD *)&a4;
  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  if (a3
    && (v9 = (void *)-[BWDeferredCaptureContainerManager _stagedContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a3)) != 0)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, "abort");
    v12 = v11;
    if (v11)
    {
      v18 = v4;
      v17 = v11;
      FigDebugAssert3();
    }
    -[BWDeferredCaptureContainerManager _reportCoreAnalyticsDataWithError:container:]((uint64_t)self, v5, v10);
    v13 = objc_msgSend(v10, "applicationID");
    if (self)
      -[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:]((uint64_t)self, (uint64_t)a3, self->_stagedContainers);
    v19.receiver = self;
    v19.super_class = (Class)BWDeferredCaptureContainerManager;
    v14 = -[BWDeferredContainerManagerBase deleteContainerForApplicationID:captureRequestIdentifier:](&v19, sel_deleteContainerForApplicationID_captureRequestIdentifier_, v13, a3, v17, v18);
    if ((v14 & 0xFFFFFFFB) != 0)
      v15 = v14;
    else
      v15 = v12;
  }
  else
  {
    FigDebugAssert3();
    v15 = -12780;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v8 == 1)
    kdebug_trace();
  return v15;
}

- (uint64_t)_enumerateManifestsForApplicationID:(void *)a3 manifestArray:(int)a4 deleteInvalidContainers:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v32;
  int v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  unsigned int v49;
  _QWORD v50[16];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = result;
    v49 = 0;
    v7 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.applicationID == %@"), a2);
    pthread_rwlock_wrlock((pthread_rwlock_t *)(v6 + 8));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v8 = (void *)objc_msgSend(*(id *)(v6 + 248), "filteredArrayUsingPredicate:", v7);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v46 != v11)
            objc_enumerationMutation(v8);
          -[BWDeferredContainerManagerBase _insertUniqueManifestIntoTimeSortedArray:manifestArray:](v6, objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "manifest"), a3);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v10);
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = (void *)objc_msgSend(*(id *)(v6 + 240), "filteredArrayUsingPredicate:", v7);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v13);
          -[BWDeferredContainerManagerBase _insertUniqueManifestIntoTimeSortedArray:manifestArray:](v6, objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "manifest"), a3);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
      }
      while (v15);
    }
    pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 8));
    v50[0] = CFSTR("/var/mobile/Media/Deferred/CaptureContainers");
    v50[1] = a2;
    v18 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2));
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = (id)objc_msgSend(v19, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v18, MEMORY[0x1E0C9AA60], 5, 0);
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (result)
    {
      v20 = result;
      v21 = 0;
      v34 = 0;
      v36 = *(_QWORD *)v38;
      while (1)
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v38 != v36)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v22);
          v24 = (void *)MEMORY[0x1A858DD40]();
          v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", objc_msgSend(v23, "lastPathComponent"));
          if (v25)
          {
            v26 = v25;
            pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 8));
            if (-[BWDeferredCaptureContainerManager _stagedContainerForCaptureRequestIdentifier:](v6, objc_msgSend(v26, "UUIDString"))|| -[BWDeferredCaptureContainerManager _inflightContainerForCaptureRequestIdentifier:](v6, objc_msgSend(v26, "UUIDString")))
            {
              pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 8));
              goto LABEL_25;
            }
            pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 8));
            v27 = +[BWDeferredContainer manifestDictionaryForURL:err:](BWDeferredContainer, "manifestDictionaryForURL:err:", v23, &v49);
            if (!v49)
            {
              -[BWDeferredContainerManagerBase _insertUniqueManifestIntoTimeSortedArray:manifestArray:](v6, (uint64_t)v27, a3);
              goto LABEL_25;
            }
            FigDebugAssert3();
          }
          else
          {
            FigDebugAssert3();
            v49 = -16132;
          }
          if (a4)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v50[0] = 0;
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", v23, v50);
            v28 = v34;
            if (v50[0])
              v28 = v34 + 1;
            v34 = v28;
          }
          else
          {
            v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
LABEL_25:
          if ((v21 + v22 + 1) >= 0x400)
          {
            v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            objc_autoreleasePoolPop(v24);
            goto LABEL_41;
          }
          objc_autoreleasePoolPop(v24);
          ++v22;
        }
        while (v20 != v22);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
        v20 = v29;
        v21 += v22;
        if (!v29)
        {
LABEL_41:
          if (v34)
            return 4294951157;
          else
            return v49;
        }
      }
    }
  }
  return result;
}

- (id)manifestsForApplicationID:(id)a3 err:(int *)a4
{
  _DWORD *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!a3)
  {
    FigDebugAssert3();
    v8 = 0;
    v17 = -16134;
    if (!a4)
      goto LABEL_19;
LABEL_18:
    *a4 = v17;
    goto LABEL_19;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D4D8) & 1) == 0
    && !objc_msgSend(a3, "isEqualToString:", 0x1E493D478))
  {
    v17 = -[BWDeferredCaptureContainerManager _enumerateManifestsForApplicationID:manifestArray:deleteInvalidContainers:]((uint64_t)self, (uint64_t)a3, v8, 1);
    goto LABEL_17;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/mobile/Media/Deferred/CaptureContainers"));
  v11 = (void *)objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, MEMORY[0x1E0C9AA60], 5, 0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = -[BWDeferredCaptureContainerManager _enumerateManifestsForApplicationID:manifestArray:deleteInvalidContainers:]((uint64_t)self, objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "lastPathComponent"), v8, 1);
      }
      v17 = v16;
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
LABEL_17:
    if (!a4)
      goto LABEL_19;
    goto LABEL_18;
  }
  v17 = 0;
  if (a4)
    goto LABEL_18;
LABEL_19:
  if (*v7 == 1)
    kdebug_trace();
  return v8;
}

- (int)queryContainerStatusForApplicationID:(id)a3 captureRequestIdentifier:(id)a4 status:(int *)a5
{
  _DWORD *v8;
  _opaque_pthread_rwlock_t *p_lock;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);
  v10 = (void *)-[BWDeferredCaptureContainerManager _cachedContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a4);
  if (v10)
  {
    -[BWDeferredCaptureContainerManager _updateCacheEntryForContainer:release:]((uint64_t)self, v10, 0);
    v11 = 0;
    LODWORD(v12) = 1;
  }
  else
  {
    v13 = (void *)-[BWDeferredCaptureContainerManager _inflightContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a4);
    v12 = v13;
    if (v13)
    {
      v14 = v13;
      v11 = objc_msgSend(v12, "waitForFlushWithTimeoutInSeconds:", 7);

      LODWORD(v12) = 0;
    }
    else
    {
      v11 = 0;
    }
  }
  pthread_rwlock_unlock(p_lock);
  if (a5)
    *a5 = (int)v12;
  if (*v8 == 1)
    kdebug_trace();
  return v11;
}

- (int)deleteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4
{
  uint64_t v4;
  _DWORD *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;
  int v21;
  uint64_t v22;
  objc_super v23;

  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  if (!a3)
  {
    v22 = v4;
    v21 = 0;
LABEL_26:
    FigDebugAssert3();
    LODWORD(v10) = 0;
    goto LABEL_27;
  }
  if (!a4)
  {
    v22 = v4;
    v21 = 0;
    goto LABEL_26;
  }
  v9 = (void *)-[BWDeferredCaptureContainerManager _stagedContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a4);
  if (v9)
  {
    v10 = v9;
    v11 = v9;
    if (self)
      -[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:]((uint64_t)self, (uint64_t)a4, self->_stagedContainers);
    goto LABEL_12;
  }
  v12 = (void *)-[BWDeferredCaptureContainerManager _cachedContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a4);
  if (v12)
  {
    v10 = v12;
    v13 = v12;
    -[BWDeferredCaptureContainerManager _updateCacheEntryForContainer:release:]((uint64_t)self, v10, 1);
LABEL_12:
    v16 = objc_msgSend(v10, "waitForFlush");

    LODWORD(v10) = 1;
    goto LABEL_13;
  }
  v14 = (void *)-[BWDeferredCaptureContainerManager _inflightContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a4);
  v10 = v14;
  if (v14)
  {
    v15 = v14;
    goto LABEL_12;
  }
LABEL_27:
  v16 = 0;
LABEL_13:
  v23.receiver = self;
  v23.super_class = (Class)BWDeferredCaptureContainerManager;
  v17 = -[BWDeferredContainerManagerBase deleteContainerForApplicationID:captureRequestIdentifier:](&v23, sel_deleteContainerForApplicationID_captureRequestIdentifier_, a3, a4, v21, v22);
  if (v17 == 4)
    v18 = (int)v10;
  else
    v18 = 0;
  if (!v17)
    v18 = 1;
  if (v18)
    v19 = v16;
  else
    v19 = v17;
  pthread_rwlock_unlock(&self->super._lock);
  if (*v8 == 1)
    kdebug_trace();
  return v19;
}

- (id)copyRemoteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4 err:(int *)a5
{
  _DWORD *v8;
  _opaque_pthread_rwlock_t *p_lock;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  int v15;

  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v15 = 0;
  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);
  v10 = (void *)-[BWDeferredCaptureContainerManager _cachedContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a4);
  if (v10)
  {
    v11 = v10;
    -[BWDeferredCaptureContainerManager _updateCacheEntryForContainer:release:]((uint64_t)self, v10, 0);
    v12 = (void *)objc_msgSend(v11, "copyXPCEncoding:", &v15);
    if (v12)
      goto LABEL_5;
    FigDebugAssert3();
    v14 = -16132;
  }
  else
  {
    FigDebugAssert3();
    v12 = 0;
    v14 = -16134;
  }
  v15 = v14;
LABEL_5:
  pthread_rwlock_unlock(p_lock);
  if (a5)
    *a5 = v15;
  if (*v8 == 1)
    kdebug_trace();
  return v12;
}

- (int)releaseRemoteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4
{
  _DWORD *v6;
  void *v7;
  int v8;

  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_rdlock(&self->super._lock);
  v7 = (void *)-[BWDeferredCaptureContainerManager _cachedContainerForCaptureRequestIdentifier:]((uint64_t)self, (uint64_t)a4);
  if (v7)
  {
    -[BWDeferredCaptureContainerManager _updateCacheEntryForContainer:release:]((uint64_t)self, v7, 0);
    v8 = 0;
  }
  else
  {
    FigDebugAssert3();
    v8 = -16134;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v6 == 1)
    kdebug_trace();
  return v8;
}

- (int)addBufferPool:(id)a3
{
  _DWORD *v5;
  BWDeferredContainerPixelBufferPoolWrapper *v6;

  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (a3)
  {
    v6 = -[BWDeferredContainerPixelBufferPoolWrapper initWithVideoFormat:capacity:name:]([BWDeferredContainerPixelBufferPoolWrapper alloc], "initWithVideoFormat:capacity:name:", objc_msgSend(a3, "videoFormat"), objc_msgSend(a3, "capacity") * (self->_cacheSize + 1), objc_msgSend(a3, "name"));
    pthread_rwlock_wrlock(&self->super._lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pools, "setObject:forKeyedSubscript:", v6, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3));

  }
  else
  {
    FigDebugAssert3();
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v5 == 1)
    kdebug_trace();
  return 0;
}

- (int)removeBufferPool:(id)a3
{
  _DWORD *v5;

  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_wrlock(&self->super._lock);
  if (a3)
    -[NSMutableDictionary removeObjectForKey:](self->_pools, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3));
  else
    FigDebugAssert3();
  pthread_rwlock_unlock(&self->super._lock);
  if (*v5 == 1)
    kdebug_trace();
  return 0;
}

- (__CVBuffer)newPixelBuffer:(id)a3
{
  id v3;
  _opaque_pthread_rwlock_t *p_lock;
  id v6;
  __CVBuffer *v7;

  v3 = a3;
  if (a3
    && (p_lock = &self->super._lock,
        pthread_rwlock_rdlock(&self->super._lock),
        v3 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v3)), v6 = v3, pthread_rwlock_unlock(p_lock), v3))
  {
    v7 = (__CVBuffer *)-[BWDeferredContainerPixelBufferPoolWrapper newPixelBuffer]((uint64_t)v3);
  }
  else
  {
    FigDebugAssert3();
    v7 = 0;
  }

  return v7;
}

- (void)flush:(id)a3 toMinimumCapacity:(unint64_t)a4
{
  _opaque_pthread_rwlock_t *p_lock;
  id v8;
  void *v9;
  id v10;

  if (a3)
  {
    p_lock = &self->super._lock;
    pthread_rwlock_rdlock(&self->super._lock);
    v10 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3));
    v8 = v10;
    pthread_rwlock_unlock(p_lock);
    objc_msgSend(v10, "flushToMinimumCapacity:", a4);
    v9 = v10;
  }
  else
  {
    FigDebugAssert3();
    v9 = 0;
  }

}

@end
