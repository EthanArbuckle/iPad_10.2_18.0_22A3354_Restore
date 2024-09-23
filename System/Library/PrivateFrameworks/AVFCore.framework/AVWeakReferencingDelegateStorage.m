@implementation AVWeakReferencingDelegateStorage

void __78__AVWeakReferencingDelegateStorage_getRetainedDelegate_retainedDelegateQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(*(id *)(a1 + 32), "_delegate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
    dispatch_retain(v2);
}

- (id)_delegate
{
  id v3;

  if (MEMORY[0x1E0CA0158])
    FigConcurrentAccessDetectorBeginReading();
  v3 = -[AVWeakReference referencedObject](self->_weakReferenceToDelegate, "referencedObject");
  if (MEMORY[0x1E0CA0178])
    FigConcurrentAccessDetectorEndReading();
  return v3;
}

- (OS_dispatch_queue)delegateQueue
{
  OS_dispatch_queue *result;
  dispatch_object_t object;

  object = 0;
  -[AVWeakReferencingDelegateStorage getRetainedDelegate:retainedDelegateQueue:](self, "getRetainedDelegate:retainedDelegateQueue:", 0, &object);
  result = (OS_dispatch_queue *)object;
  if (object)
  {
    dispatch_release(object);
    return (OS_dispatch_queue *)object;
  }
  return result;
}

- (id)delegate
{
  id v3;

  v3 = 0;
  -[AVWeakReferencingDelegateStorage getRetainedDelegate:retainedDelegateQueue:](self, "getRetainedDelegate:retainedDelegateQueue:", &v3, 0);
  return v3;
}

- (void)getRetainedDelegate:(id *)a3 retainedDelegateQueue:(id *)a4
{
  NSObject *delegateReadWriteQueue;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__27;
  v21 = __Block_byref_object_dispose__27;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__27;
  v15 = __Block_byref_object_dispose__27;
  v16 = 0;
  delegateReadWriteQueue = self->_delegateReadWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AVWeakReferencingDelegateStorage_getRetainedDelegate_retainedDelegateQueue___block_invoke;
  block[3] = &unk_1E3031690;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  av_readwrite_dispatch_queue_read(delegateReadWriteQueue, block);
  if (a3)
    *a3 = (id)v18[5];
  if (a4)
  {
    v7 = v12[5];
    if (v7)
    {
      dispatch_retain(v7);
      v8 = (void *)v12[5];
    }
    else
    {
      v8 = 0;
    }
    *a4 = v8;
  }

  v9 = v12[5];
  if (v9)
    dispatch_release(v9);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

void __54__AVWeakReferencingDelegateStorage_setDelegate_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "_setDelegateViaWeakReference:", *(_QWORD *)(a1 + 40));
  v2 = *(NSObject **)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 32);
  if (v2 != v4)
  {
    *(_QWORD *)(v3 + 32) = v2;
    v2 = v4;
  }
  if (v2)
    dispatch_release(v2);
}

- (void)_setDelegateViaWeakReference:(id)a3
{
  id v5;

  if (MEMORY[0x1E0CA0160])
    FigConcurrentAccessDetectorBeginWriting();
  v5 = a3;

  self->_weakReferenceToDelegate = (AVWeakReference *)a3;
  if (MEMORY[0x1E0CA0180])
    FigConcurrentAccessDetectorEndWriting();
}

+ (void)initialize
{
  objc_opt_class();
}

- (AVWeakReferencingDelegateStorage)init
{
  AVWeakReferencingDelegateStorage *v2;
  void *v3;
  objc_class *v4;
  const char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVWeakReferencingDelegateStorage;
  v2 = -[AVWeakReferencingDelegateStorage init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> delegate serialization queue"), NSStringFromClass(v4), v2), "UTF8String");
    v2->_delegateReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v5);
    v2->_detectorForWeakReferenceToDelegate = (OpaqueConcurrentAccessDetector *)FigConcurrentAccessDetectorCreate();
  }
  return v2;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVWeakReference *v11;
  NSObject *delegateReadWriteQueue;
  void *v13;
  _QWORD block[7];

  if (!a3 && a4)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, v4, v5, v6, v7, (uint64_t)"newDelegateQueue == NULL"), 0);
    objc_exception_throw(v13);
  }
  if (a4)
    dispatch_retain((dispatch_object_t)a4);
  v11 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
  delegateReadWriteQueue = self->_delegateReadWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVWeakReferencingDelegateStorage_setDelegate_queue___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = self;
  block[5] = v11;
  block[6] = a4;
  av_readwrite_dispatch_queue_write_async(delegateReadWriteQueue, block);
}

- (void)invokeDelegateCallbackWithBlock:(id)a3 synchronouslyIfDelegateQueueIsQueue:(id)a4
{
  AVPerformDelegateCallbackSynchronouslyForDelegateStorageIfCurrentDelegateQueueIsQueueElseDispatchToCurrentDelegateQueue(self, a4, (uint64_t)a3);
}

- (void)invokeDelegateCallbackWithBlock:(id)a3
{
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:synchronouslyIfDelegateQueueIsQueue:](self, "invokeDelegateCallbackWithBlock:synchronouslyIfDelegateQueueIsQueue:", a3, 0);
}

- (void)_collectUncollectables
{
  NSObject *delegateReadWriteQueue;
  NSObject *delegateQueue;

  delegateReadWriteQueue = self->_delegateReadWriteQueue;
  if (delegateReadWriteQueue)
    dispatch_release(delegateReadWriteQueue);
  if (self->_detectorForWeakReferenceToDelegate)
    FigConcurrentAccessDetectorDestroy();
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    dispatch_release(delegateQueue);
}

- (void)dealloc
{
  objc_super v3;

  -[AVWeakReferencingDelegateStorage _collectUncollectables](self, "_collectUncollectables");
  v3.receiver = self;
  v3.super_class = (Class)AVWeakReferencingDelegateStorage;
  -[AVWeakReferencingDelegateStorage dealloc](&v3, sel_dealloc);
}

@end
