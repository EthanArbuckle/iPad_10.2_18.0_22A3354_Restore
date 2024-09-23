@implementation AVCallbackContextRegistry

- (void)registerCallbackContextObject:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVWeakReference *v9;
  NSObject *readWriteQueue;
  void *v11;
  void *v13;
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  if (!a3)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"callbackContext != nil"), 0);
    objc_exception_throw(v13);
  }
  v9 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVCallbackContextRegistry_registerCallbackContextObject___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = v9;
  block[6] = &v15;
  block[4] = self;
  av_readwrite_dispatch_queue_write(readWriteQueue, block);

  v11 = (void *)v16[3];
  _Block_object_dispose(&v15, 8);
  return v11;
}

- (id)callbackContextForToken:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  NSObject *readWriteQueue;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  _QWORD block[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;

  if (!a3)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"callbackContextToken != AVCallbackContextTokenInvalid"), 0);
    objc_exception_throw(v21);
  }
  v11 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:");
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__31;
  v31 = __Block_byref_object_dispose__31;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AVCallbackContextRegistry_callbackContextForToken___block_invoke;
  block[3] = &unk_1E30347C8;
  block[4] = self;
  block[5] = v11;
  block[6] = &v27;
  block[7] = &v23;
  av_readwrite_dispatch_queue_read(readWriteQueue, block);
  if (v24[3] < (unint64_t)a3)
  {
    v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot look up token %p that was not vended by %@.  Break on AVCallbackContextRegistryUnrecognizedTokenBreak() to debug."), v13, v14, v15, v16, v17, (uint64_t)a3);
    NSLog(CFSTR("%@"), v18, self);
  }
  v19 = (void *)objc_msgSend((id)v28[5], "referencedObject");

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  return v19;
}

- (AVCallbackContextRegistry)init
{
  AVCallbackContextRegistry *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCallbackContextRegistry;
  v2 = -[AVCallbackContextRegistry init](&v5, sel_init);
  if (v2)
  {
    v2->_contextsForTokens = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = av_readwrite_dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ read/write queue"), v2), "UTF8String"));
    v2->_currentToken = 0;
    v2->_readWriteQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

uint64_t __63__AVCallbackContextRegistry_unregisterCallbackContextForToken___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 16);
  return result;
}

id __53__AVCallbackContextRegistry_callbackContextForToken___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 16);
  return result;
}

uint64_t __59__AVCallbackContextRegistry_registerCallbackContextObject___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1[4];
  v2 = *(_QWORD *)(v1 + 16) + 1;
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v2;
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", a1[5], objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24)));
}

+ (id)sharedCallbackContextRegistry
{
  return (id)_sSharedCallbackContextRegistry;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _sSharedCallbackContextRegistry = objc_alloc_init(AVCallbackContextRegistry);
}

- (void)unregisterCallbackContextForToken:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  NSObject *readWriteQueue;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD block[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  if (!a3)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"callbackContextToken != AVCallbackContextTokenInvalid"), 0);
    objc_exception_throw(v19);
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v11 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:");
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVCallbackContextRegistry_unregisterCallbackContextForToken___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = v11;
  block[6] = &v21;
  av_readwrite_dispatch_queue_write(readWriteQueue, block);
  if (v22[3] < (unint64_t)a3)
  {
    v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot unregister token %p that was not vended by %@.  Break on AVCallbackContextRegistryUnrecognizedTokenBreak() to debug."), v13, v14, v15, v16, v17, (uint64_t)a3);
    NSLog(CFSTR("%@"), v18, self);
  }
  _Block_object_dispose(&v21, 8);
}

- (void)dealloc
{
  NSObject *readWriteQueue;
  objc_super v4;

  readWriteQueue = self->_readWriteQueue;
  if (readWriteQueue)
    dispatch_release(readWriteQueue);

  v4.receiver = self;
  v4.super_class = (Class)AVCallbackContextRegistry;
  -[AVCallbackContextRegistry dealloc](&v4, sel_dealloc);
}

@end
