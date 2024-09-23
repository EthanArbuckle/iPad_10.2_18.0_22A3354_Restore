@implementation NSOperationQueue

- (void)addOperation:(NSOperation *)op
{
  __addOperations((objc_class *)self, a2, (uint64_t)op, 0, 0);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("operations")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("operationCount")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("suspended")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("operationCount")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("name")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("qualityOfService")) & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSOperationQueue;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

void __29__NSOperationQueue_mainQueue__block_invoke()
{
  _DWORD *v0;
  NSPointerArray *v1;
  void *v2;
  qos_class_t v3;

  v0 = objc_allocWithZone((Class)NSOperationQueue);
  v1 = -[NSPointerArray initWithOptions:]([NSPointerArray alloc], "initWithOptions:", 258);
  v0[2] = 0;
  *((_QWORD *)v0 + 19) = v1;
  *((_QWORD *)v0 + 20) = 1;
  v0[42] = 1;
  *((_BYTE *)v0 + 506) = -1;
  v2 = (void *)*((_QWORD *)v0 + 24);
  *((_QWORD *)v0 + 24) = objc_msgSend(CFSTR("NSOperationQueue Main Queue"), "copy");

  v3 = qos_class_main();
  oq_set_property_qos((uint64_t)v0, v3);
  qword_1ECD09920 = (uint64_t)v0;
}

- (void)addOperationWithBlock:(void *)block
{
  NSBlockOperation *v4;
  uint64_t property_qos;

  v4 = +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", block);
  property_qos = oq_get_property_qos((uint64_t)self);
  if (property_qos)
    -[NSOperation setQualityOfService:](v4, "setQualityOfService:", property_qos);
  -[NSOperationQueue addOperation:](self, "addOperation:", v4);
}

- (NSOperationQueue)init
{
  NSOperationQueue *v3;
  NSPointerArray *v4;
  NSString *v5;
  NSString *name;
  unsigned __int8 *p_propertyQoS;
  int v8;
  NSObject *backingQueue;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!_NSIsMultiThreaded)
  {
    _NSIsMultiThreaded = 1;
    -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSWillBecomeMultiThreadedNotification"), 0, 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)NSOperationQueue;
  v3 = -[NSOperationQueue init](&v11, sel_init);
  v4 = -[NSPointerArray initWithOptions:]([NSPointerArray alloc], "initWithOptions:", 258);
  v3->_iqp.__queueLock._os_unfair_lock_opaque = 0;
  v3->_iqp.__activeThreads = v4;
  v3->_iqp.__maxNumOps = -1;
  v3->_iqp.__actualMaxNumOps = 0x7FFFFFFF;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSOperationQueue %p"), v3);
  name = v3->_iqp.__name;
  v3->_iqp.__name = (NSString *)-[NSString copy](v5, "copy");

  p_propertyQoS = &v3->_iqp.__propertyQoS;
  do
    v8 = __ldaxr(p_propertyQoS);
  while (__stlxr(0, p_propertyQoS));
  if (v8)
  {
    backingQueue = v3->_iqp.__backingQueue;
    v3->_iqp.__backingQueue = 0;
    v3->_iqp.__nameBuffer[0] = 0;
    if (backingQueue)
      dispatch_release(backingQueue);
  }
  return v3;
}

- (void)dealloc
{
  NSOperationQueue *v2;
  NSObject *dispatch_queue;
  NSObject *backingQueue;
  _NSOperationQueueProgress *progress;
  _NSOperationQueueProgress *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_iqp.__mainQ)
  {
    __break(1u);
LABEL_10:
    v6 = 0;
    goto LABEL_8;
  }
  v2 = self;
  dispatch_queue = self->_iqp.__dispatch_queue;
  if (dispatch_queue)
    dispatch_release(dispatch_queue);
  v2->_iqp.__dispatch_queue = 0;
  backingQueue = v2->_iqp.__backingQueue;
  if (backingQueue)
    dispatch_release(backingQueue);

  progress = v2->_iqp._progress;
  if (!progress)
    goto LABEL_10;
  os_unfair_lock_lock(&progress->_queueLock);
  progress->_queue = 0;
  os_unfair_lock_unlock(&progress->_queueLock);
  v6 = v2->_iqp._progress;
LABEL_8:

  v7.receiver = v2;
  v7.super_class = (Class)NSOperationQueue;
  -[NSOperationQueue dealloc](&v7, sel_dealloc);
}

- (void)addOperations:(NSArray *)ops waitUntilFinished:(BOOL)wait
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v4 = wait;
  v15 = *MEMORY[0x1E0C80C00];
  __addOperations((objc_class *)self, a2, 0, (unint64_t)ops, 0);
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](ops, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(ops);
          __NSOPERATIONQUEUE_IS_WAITING_ON_AN_OPERATION__(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](ops, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v7);
    }
  }
}

+ (NSOperationQueue)mainQueue
{
  if (qword_1ECD09928 != -1)
    dispatch_once(&qword_1ECD09928, &__block_literal_global_217);
  return (NSOperationQueue *)qword_1ECD09920;
}

- (void)addBarrierBlock:(void *)barrier
{
  $88CEAA7892FB5213380B0DE37358CF4B *p_iqp;
  NSOperation *firstOperation;
  NSOperationQueue *v8;
  NSObject *v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  firstOperation = self->_iqp.__firstOperation;
  if (firstOperation)
  {
    v10.receiver = [_NSBarrierOperation alloc];
    v10.super_class = (Class)_NSBarrierOperation;
    v8 = -[NSOperationQueue init](&v10, sel_init);
    *(_QWORD *)&v8->_iqp.__nameBuffer[48] = _Block_copy(barrier);
    v8->_iqp.__nameBuffer[38] = 12;
    do
    {
      -[NSOperationQueue addDependency:](v8, "addDependency:", firstOperation);
      firstOperation = firstOperation->_iop.__nextOp;
    }
    while (firstOperation);
    __addOperations((objc_class *)self, a2, (uint64_t)v8, 0, 1);
    os_unfair_lock_unlock(&p_iqp->__queueLock);
    goto LABEL_5;
  }
  v9 = oq_synthesize_backing_queue((uint64_t)self);
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  if (!v9)
  {
    v8 = 0;
LABEL_5:

    __NSOQSchedule((uint64_t)self);
    return;
  }
  dispatch_barrier_async(v9, barrier);
  dispatch_release(v9);
}

- (void)setName:(NSString *)name
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  if (!self->_iqp.__mainQ)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __28__NSOperationQueue_setName___block_invoke;
    v3[3] = &unk_1E0F4C650;
    v3[4] = self;
    v3[5] = name;
    -[NSOperationQueue _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", &_NSOperationNameKeys, 1, 0, 0, v3);
  }
}

- (void)setSuspended:(BOOL)suspended
{
  _QWORD v5[5];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_iqp.__mainQ)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __33__NSOperationQueue_setSuspended___block_invoke;
    v5[3] = &unk_1E0F4FB60;
    v5[4] = self;
    v6 = suspended;
    -[NSOperationQueue _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", &_NSOperationQueueSuspendedKeys, 1, 0, 0, v5);
    if (!suspended)
      __NSOQSchedule((uint64_t)self);
  }
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  BOOL v3;
  NSQualityOfService v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v3 = (unint64_t)(qualityOfService + 1) > 0x22
    || ((1 << (qualityOfService + 1)) & 0x404040441) == 0;
  v4 = NSQualityOfServiceDefault;
  if (!v3)
    v4 = qualityOfService;
  if (!self->_iqp.__mainQ)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__NSOperationQueue_setQualityOfService___block_invoke;
    v5[3] = &unk_1E0F4EE20;
    v5[4] = self;
    v5[5] = v4;
    -[NSOperationQueue _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", &_NSOperationQualityOfServiceKeys, 1, 0, 0, v5);
  }
}

void __40__NSOperationQueue_setQualityOfService___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  oq_set_property_qos(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __33__NSOperationQueue_setSuspended___block_invoke(uint64_t result)
{
  atomic_store(*(_BYTE *)(result + 40), (unsigned __int8 *)(*(_QWORD *)(result + 32) + 500));
  return result;
}

void __28__NSOperationQueue_setName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    v3 = *(__CFString **)(a1 + 40);
  else
    v3 = &stru_1E0F56070;
  v4 = *(void **)(v2 + 192);
  *(_QWORD *)(v2 + 192) = -[__CFString copy](v3, "copy");

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

+ (NSOperationQueue)currentQueue
{
  if (pthread_main_np() == 1)
    return +[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue");
  else
    return (NSOperationQueue *)(id)_CFGetTSD();
}

- (void)setMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount
{
  int v6;
  void *v7;

  if (maxConcurrentOperationCount <= -2)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: count (%ld) cannot be negative"), _NSMethodExceptionProem((objc_class *)self, a2), maxConcurrentOperationCount), 0);
    objc_exception_throw(v7);
  }
  if (!self->_iqp.__mainQ)
  {
    os_unfair_lock_lock(&self->_iqp.__queueLock);
    self->_iqp.__maxNumOps = maxConcurrentOperationCount;
    if (maxConcurrentOperationCount > 0x7FFFFFFF || maxConcurrentOperationCount == -1)
      v6 = 0x7FFFFFFF;
    else
      v6 = maxConcurrentOperationCount;
    self->_iqp.__actualMaxNumOps = v6;
    os_unfair_lock_unlock(&self->_iqp.__queueLock);
    __NSOQSchedule((uint64_t)self);
  }
}

- (NSUInteger)operationCount
{
  return atomic_load(&self->_iqp.__operationCount);
}

- (BOOL)isSuspended
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_iqp.__suspended);
  return v2 & 1;
}

- (void)waitUntilAllOperationsAreFinished
{
  NSOperationQueue *v3;
  void *i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = self;
  for (i = (void *)objc_opt_new(); ; objc_msgSend(i, "removeAllObjects"))
  {
    __NSOperationQueueGetOperations((uint64_t)self, i, 1);
    if (!objc_msgSend(i, "count"))
      break;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = objc_msgSend(i, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(i);
          __NSOPERATIONQUEUE_IS_WAITING_ON_AN_OPERATION__(*(void **)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(i, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      }
      while (v6);
    }
  }

}

- (void)cancelAllOperations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_iqp.__mainQ)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    __NSOperationQueueGetOperations((uint64_t)self, v3, 1);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          __NSOPERATIONQUEUE_IS_CANCELLING_AN_OPERATION__(*(void **)(*((_QWORD *)&v9 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      }
      while (v5);
    }
  }
}

- (void)setUnderlyingQueue:(dispatch_queue_t)underlyingQueue
{
  NSObject *dispatch_queue;
  void *v7;

  if (!self->_iqp.__mainQ)
  {
    if (__NSOperationQueueGetOperations((uint64_t)self, 0, 1))
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: operation queue must be empty in order to change underlying dispatch queue"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
      objc_exception_throw(v7);
    }
    if (underlyingQueue)
      dispatch_retain(underlyingQueue);
    dispatch_queue = self->_iqp.__dispatch_queue;
    if (dispatch_queue)
      dispatch_release(dispatch_queue);
    self->_iqp.__dispatch_queue = (OS_dispatch_queue *)underlyingQueue;
  }
}

- (NSArray)operations
{
  NSArray *v3;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  __NSOperationQueueGetOperations((uint64_t)self, v3, 0);
  return v3;
}

- (NSInteger)maxConcurrentOperationCount
{
  return self->_iqp.__maxNumOps;
}

- (NSQualityOfService)qualityOfService
{
  NSQualityOfService result;

  result = oq_get_property_qos((uint64_t)self);
  if ((_DWORD)result == (NSQualityOfServiceUtility|0x4) || result == 0)
    return -1;
  return result;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  unsigned __int8 *p_operationsObserverCount;
  int v12;
  const __CFString *v13;
  unsigned __int8 *p_operationCountObserverCount;
  int v15;
  NSString *v16;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("operations")) & 1) != 0)
  {
    p_operationsObserverCount = &self->_iqp.__operationsObserverCount;
    do
      v12 = __ldaxr(p_operationsObserverCount);
    while (__stlxr(v12 + 1, p_operationsObserverCount));
    if (v12 == 255)
    {
      atomic_store(0xFFu, p_operationsObserverCount);
      v13 = CFSTR("operations");
      goto LABEL_12;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("operationCount")) & 1) != 0)
  {
    p_operationCountObserverCount = &self->_iqp.__operationCountObserverCount;
    do
      v15 = __ldaxr(p_operationCountObserverCount);
    while (__stlxr(v15 + 1, p_operationCountObserverCount));
    if (v15 == 255)
    {
      atomic_store(0xFFu, p_operationCountObserverCount);
      v13 = CFSTR("operationCount");
LABEL_12:
      v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("added too many observers to an NSOperationQueue for %@"), v13);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0));
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)NSOperationQueue;
  -[NSOperationQueue addObserver:forKeyPath:options:context:](&v17, sel_addObserver_forKeyPath_options_context_, a3, a4, a5, a6);
}

- (NSProgress)progress
{
  $88CEAA7892FB5213380B0DE37358CF4B *p_iqp;
  _NSOperationQueueProgress *progress;

  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  progress = self->_iqp._progress;
  if (!progress)
  {
    progress = (_NSOperationQueueProgress *)-[_NSOperationQueueProgress initWithQueue:]([_NSOperationQueueProgress alloc], (uint64_t)self);
    self->_iqp._progress = progress;
  }
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  return &progress->super;
}

- (BOOL)overcommitsOperations
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_iqp.__overcommit);
  return v2 & 1;
}

- (void)setOvercommitsOperations:(BOOL)a3
{
  BOOL *p_overcommit;
  unsigned __int8 v4;
  NSObject *backingQueue;

  if (!self->_iqp.__mainQ)
  {
    p_overcommit = &self->_iqp.__overcommit;
    do
      v4 = __ldaxr((unsigned __int8 *)p_overcommit);
    while (__stlxr(a3, (unsigned __int8 *)p_overcommit));
    if ((v4 & 1) != a3)
    {
      backingQueue = self->_iqp.__backingQueue;
      self->_iqp.__backingQueue = 0;
      self->_iqp.__nameBuffer[0] = 0;
      if (backingQueue)
        dispatch_release(backingQueue);
    }
  }
}

- (dispatch_queue_t)underlyingQueue
{
  $88CEAA7892FB5213380B0DE37358CF4B *p_iqp;
  OS_dispatch_queue *v5;

  if (self->_iqp.__mainQ)
    return (dispatch_queue_t)MEMORY[0x1E0C80D38];
  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  v5 = self->_iqp.__dispatch_queue;
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  return (dispatch_queue_t)v5;
}

- (NSString)name
{
  $88CEAA7892FB5213380B0DE37358CF4B *p_iqp;
  NSString *name;

  p_iqp = &self->_iqp;
  os_unfair_lock_lock(&self->_iqp.__queueLock);
  name = self->_iqp.__name;
  os_unfair_lock_unlock(&p_iqp->__queueLock);
  return name;
}

- (id)__graphDescription
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(&stru_1E0F56070, "mutableCopy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[NSOperationQueue operations](self, "operations");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendString:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "__graphDescription:", 0));
        objc_msgSend(v3, "appendString:", CFSTR("\n"));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  return v3;
}

- (NSString)description
{
  NSString *v3;
  objc_super v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = -[NSOperationQueue name](self, "name");
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSOperationQueue;
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{name = '%@'}"), -[NSOperationQueue description](&v6, sel_description), v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NSOperationQueue;
    return -[NSOperationQueue description](&v5, sel_description);
  }
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSOperationQueue;
  -[NSOperationQueue removeObserver:forKeyPath:](&v9, sel_removeObserver_forKeyPath_, a3);
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("operations")) & 1) != 0)
  {
    v6 = 503;
  }
  else
  {
    if (!objc_msgSend(a4, "isEqualToString:", CFSTR("operationCount")))
      return;
    v6 = 504;
  }
  v7 = (unsigned __int8 *)self + v6;
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
}

- (void)_fc_addUncancellableOperationWithBlock:(id)a3
{
  -[NSOperationQueue addOperation:](self, "addOperation:", +[NSBlockOperation blockOperationWithBlock:](_NSFCUncancellableBlockOperation, "blockOperationWithBlock:", a3));
}

- (void)_fc_addUncancellableOperationForReactorID:(id)a3 block:(id)a4
{
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __95__NSOperationQueue_NSFileCoordinationSupport___fc_addUncancellableOperationForReactorID_block___block_invoke;
  v4[3] = &unk_1E0F50148;
  v4[4] = a3;
  v4[5] = a4;
  -[NSOperationQueue addOperation:](self, "addOperation:", +[NSBlockOperation blockOperationWithBlock:](_NSFCUncancellableBlockOperation, "blockOperationWithBlock:", v4));
}

void __95__NSOperationQueue_NSFileCoordinationSupport___fc_addUncancellableOperationForReactorID_block___block_invoke(uint64_t a1)
{
  NSMutableDictionary *v2;
  id v3;

  v2 = -[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary");
  v3 = (id)-[NSMutableDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", CFSTR("_NSCurrentReactorID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("_NSCurrentReactorID"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, CFSTR("_NSCurrentReactorID"));

}

@end
