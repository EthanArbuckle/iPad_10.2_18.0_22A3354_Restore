@implementation __NSCFURLSessionConnection

- (uint64_t)_storeCachedResponse:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  if (result)
  {
    v3 = result;
    result = objc_msgSend((id)objc_msgSend(a2, "data"), "length");
    if (result)
    {
      v4 = *(void **)(v3 + 8);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __51____NSCFURLSessionConnection__storeCachedResponse___block_invoke;
      v5[3] = &unk_1E14F7948;
      v5[4] = a2;
      v5[5] = v3;
      return objc_msgSend(v4, "_withXURLCache:", v5);
    }
  }
  return result;
}

- (__NSCFURLSessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  __NSCFURLSessionConnection *v8;
  NSURLSessionTask *task;
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)__NSCFURLSessionConnection;
  v8 = -[__NSCFURLSessionConnection init](&v12, sel_init);
  if (v8)
  {
    v8->_task = (NSURLSessionTask *)a3;
    v8->_delegate = (__NSCFURLSessionConnectionDelegate *)a4;
    dispatch_retain((dispatch_object_t)a5);
    v8->_workQueue = (OS_dispatch_queue *)a5;
    task = v8->_task;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66____NSCFURLSessionConnection_initWithTask_delegate_delegateQueue___block_invoke;
    v11[3] = &unk_1E14F7920;
    v11[4] = v8;
    -[NSURLSessionTask _withXURLCache:](task, "_withXURLCache:", v11);
  }
  return v8;
}

- (uint64_t)_setupForCache:(uint64_t)result expectedLength:(uint64_t)a2 response:(void *)a3
{
  uint64_t v3;
  _QWORD *v4;

  if (result)
  {
    v3 = a2;
    v4 = (_QWORD *)result;
    if (*(_QWORD *)(result + 64) >= a2)
    {
      *(_QWORD *)(result + 48) = dispatch_data_create("", 0, 0, 0);
      if (v3 < 0)
        v3 = v4[8];
      v4[7] = v3;
      result = objc_msgSend(a3, "copy");
      v4[5] = result;
    }
  }
  return result;
}

- (void)_appendDataToCache:(uint64_t)a1
{
  NSObject *v3;
  dispatch_object_t *v4;
  size_t size;

  if (a1)
  {
    v4 = (dispatch_object_t *)(a1 + 48);
    v3 = *(NSObject **)(a1 + 48);
    if (v3)
    {
      size = dispatch_data_get_size(v3);
      if (dispatch_data_get_size(a2) + size <= *(_QWORD *)(a1 + 56))
        conCatData(v4, a2);
      else
        -[__NSCFURLSessionConnection _tossCache](a1);
    }
  }
}

- (NSCachedURLResponse)_cachedResponse
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSCachedURLResponse *v5;
  uint64_t v6;
  uint64_t v7;

  if (!a1)
    return 0;
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = *(int *)(objc_msgSend(v2, "_inner") + 72);
    if ((_DWORD)v3 == 2)
    {
      -[__NSCFURLSessionConnection _tossCache](a1);
      v3 = 2;
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = *(NSObject **)(a1 + 48);
  if (!v4)
    return 0;
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = -[NSCachedURLResponse initWithResponse:data:userInfo:storagePolicy:]([NSCachedURLResponse alloc], "initWithResponse:data:userInfo:storagePolicy:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, v3);
    v6 = -[NSCachedURLResponse _CFCachedURLResponse](v5, "_CFCachedURLResponse");
    if (v6)
    {
      v7 = *(_QWORD *)(v6 + 16);
      if (v7)
        *(_BYTE *)(v7 + 24) = *(_BYTE *)(a1 + 32);
    }

    *(_QWORD *)(a1 + 40) = 0;
    v4 = *(NSObject **)(a1 + 48);
  }
  else
  {
    v5 = 0;
  }
  dispatch_release(v4);
  *(_QWORD *)(a1 + 48) = 0;
  return v5;
}

- (void)_tossCache
{
  NSObject *v2;
  _QWORD *v3;

  if (a1)
  {
    v3 = (_QWORD *)(a1 + 48);
    v2 = *(NSObject **)(a1 + 48);
    if (v2)
    {
      dispatch_release(v2);
      *v3 = 0;
      v3[1] = 0;

      *(_QWORD *)(a1 + 40) = 0;
    }
  }
}

- (void)withWorkQueueAsync:(dispatch_queue_t *)a1
{
  SEL v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, a2, 8, 1), "_qos");
    objc_msgSend(objc_getProperty(a1, v3, 8, 1), "_voucher");
    v4 = (void *)dispatch_block_create_with_voucher_and_qos_class();
    dispatch_async(a1[2], v4);
    _Block_release(v4);
  }
}

- (void)dealloc
{
  const char *v3;
  NSObject *workQueue;
  NSURLResponse *cacheResponse;
  NSObject *cacheData;
  objc_super v7;

  workQueue = self->_workQueue;
  if (workQueue)
  {
    dispatch_release(workQueue);
    self->_workQueue = 0;
  }
  objc_setProperty_atomic(self, v3, 0, 24);
  cacheResponse = self->_cacheResponse;
  if (cacheResponse)
  {

    self->_cacheResponse = 0;
  }
  cacheData = self->_cacheData;
  if (cacheData)
  {
    dispatch_release(cacheData);
    self->_cacheData = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)__NSCFURLSessionConnection;
  -[__NSCFURLSessionConnection dealloc](&v7, sel_dealloc);
}

- (void)setIsDownload:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v3 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "__NSCFURLSessionConnection: some sub-class failed to implement setIsDownload. File a bug!", v4, 2u);
  }
}

@end
