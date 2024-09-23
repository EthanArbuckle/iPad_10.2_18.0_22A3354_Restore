@implementation NSOperation

- (void)observationInfo
{
  return self->_iop.__obsInfo;
}

- (id)_implicitObservationInfo
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  v4 = self->_iop.__implicitObsInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)start
{
  unsigned __int8 *p_state;
  unsigned int v3;
  $EBB4F64558E27463174FAD50DEBA2FF9 *p_iop;
  NSString *v7;
  void *v8;
  unsigned __int8 v9;
  double thread_prio;
  double v12;
  double v13;
  NSOperationQueue *v14;
  int v15;
  _NSOperationQueueProgress *progress;
  NSProgress *v17;
  int v18;
  char v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  __CFString *v26;
  int v27;
  char v28;
  unsigned __int8 *p_isFinishedObserverCount;
  char v30;
  char v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  $EBB4F64558E27463174FAD50DEBA2FF9 *v37;
  _QWORD v38[6];

  v38[5] = *MEMORY[0x1E0C80C00];
  p_state = &self->_iop.__state;
  v3 = atomic_load(&self->_iop.__state);
  if (v3 == 244)
    return;
  p_iop = &self->_iop;
  do
  {
    if (__ldaxr(p_state))
    {
      __clrex();
      if (v3 == 216)
      {
        if (self->_iop.__queue)
          goto LABEL_10;
      }
      else if (v3 == 224 || v3 == 240)
      {
        v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: receiver is already executing"), _NSMethodExceptionProem((objc_class *)self, sel_start));
        goto LABEL_56;
      }
      v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: something is trying to start the receiver simultaneously from more than one thread"), _NSMethodExceptionProem((objc_class *)self, sel_start));
LABEL_56:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
    }
  }
  while (__stlxr(0xD8u, p_state));
  if (v3 <= 0x50 && !-[NSOperation isReady](self, "isReady"))
  {
    atomic_store(v3, &self->_iop.__state);
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: receiver is not yet ready to execute"), _NSMethodExceptionProem((objc_class *)self, sel_start));
    goto LABEL_56;
  }
LABEL_10:
  v8 = (void *)MEMORY[0x186DA8F78]();
  v9 = atomic_load((unsigned __int8 *)&self->_iop.__isCancelled);
  if ((v9 & 1) == 0)
  {
    if (atomic_load(&self->_iop.__isExecutingObserverCount))
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __iop_start_block_invoke;
      v38[3] = &__block_descriptor_40_e5_v8__0l;
      v38[4] = p_iop;
      -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", _NSOperationExecutingKeys, 1, 0, 0, v38);
    }
    else
    {
      atomic_store(0xE0u, &self->_iop.__state);
      +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:](__NSOperationInternalObserver, "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:", CFSTR("isExecuting"), self, 0, 0, 0, 0, 0);
    }
    thread_prio = self->_iop.__thread_prio;
    if (thread_prio == 0.5)
    {
      v13 = 0.0;
    }
    else
    {
      +[NSThread threadPriority](NSThread, "threadPriority");
      v13 = v12;
      +[NSThread setThreadPriority:](NSThread, "setThreadPriority:", self->_iop.__thread_prio);
    }
    os_unfair_lock_lock(&self->_iop.__lock);
    v14 = self->_iop.__queue;
    os_unfair_lock_unlock(&self->_iop.__lock);
    if (v14
      && object_getClass(self) != (Class)_NSBarrierOperation
      && (v15 = atomic_load(&v14->_iqp.__progressReporting)) != 0)
    {
      os_unfair_lock_lock(&v14->_iqp.__queueLock);
      progress = v14->_iqp._progress;
      if (!progress)
      {
        progress = (_NSOperationQueueProgress *)-[_NSOperationQueueProgress initWithQueue:]([_NSOperationQueueProgress alloc], (uint64_t)v14);
        v14->_iqp._progress = progress;
      }
      os_unfair_lock_unlock(&v14->_iqp.__queueLock);
      v17 = -[NSProgress initWithParent:userInfo:]([NSProgress alloc], "initWithParent:userInfo:", 0, 0);
      -[NSProgress setTotalUnitCount:](v17, "setTotalUnitCount:", 1);
      -[NSProgress addChild:withPendingUnitCount:](progress, "addChild:withPendingUnitCount:", v17, 1);
    }
    else
    {
      v17 = 0;
    }
    -[NSProgress becomeCurrentWithPendingUnitCount:](v17, "becomeCurrentWithPendingUnitCount:", 1);
    _CFExecutableLinkedOnOrAfter();
    __NSOPERATION_IS_INVOKING_MAIN__(self);
    -[NSProgress resignCurrent](v17, "resignCurrent");

    if (thread_prio != 0.5)
      +[NSThread setThreadPriority:](NSThread, "setThreadPriority:", v13);
  }
  v18 = atomic_load(p_state);
  if (v18 != 224)
  {
    if (atomic_load(&self->_iop.__isFinishedObserverCount))
    {
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __iop_start_block_invoke_3;
      v36 = &__block_descriptor_40_e5_v8__0l;
      v37 = p_iop;
      -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", &_NSOperationFinishedKeys, 1, 0, 0, &v33);
    }
    else
    {
      atomic_store(0xF0u, &self->_iop.__state);
      +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:](__NSOperationInternalObserver, "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:", CFSTR("isFinished"), self, 0, 0, 0, 0, 0);
    }
    goto LABEL_50;
  }
  v19 = 0;
  v20 = 0;
  v21 = 1;
  v22 = 1;
  while (2)
  {
    while (2)
    {
      while (1)
      {
        v23 = v19;
        v24 = v22;
        v25 = v21;
        v26 = _NSOperationExecutingAndFinishedKeys[v20];
        if (v26 != CFSTR("isReady"))
          break;
        v22 = 0;
        v27 = atomic_load(&self->_iop.__isReadyObserverCount);
        v28 = v19 | (v27 != 0);
        v19 = 1;
        v21 = v24;
        v20 = 1;
        if ((v28 & 1) != 0)
          goto LABEL_40;
      }
      if (v26 == CFSTR("isFinished"))
      {
        v22 = 0;
        p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
        goto LABEL_39;
      }
      if (v26 == CFSTR("isExecuting"))
      {
        v22 = 0;
        p_isFinishedObserverCount = &self->_iop.__isExecutingObserverCount;
        goto LABEL_39;
      }
      if (v26 == CFSTR("isCancelled"))
      {
        v22 = 0;
        p_isFinishedObserverCount = &self->_iop.__isCancelledObserverCount;
LABEL_39:
        v27 = atomic_load(p_isFinishedObserverCount);
        v30 = v19 | (v27 != 0);
        v20 = 1;
        v21 = v24;
        v19 = 1;
        if ((v30 & 1) != 0)
        {
LABEL_40:
          if (v27)
            v31 = v25;
          else
            v31 = v24;
          if ((v31 & 1) != 0)
            goto LABEL_44;
          goto LABEL_49;
        }
        continue;
      }
      break;
    }
    v22 = 0;
    v20 = 1;
    v21 = v24;
    v19 = 1;
    if ((v23 & 1) == 0)
      continue;
    break;
  }
  if ((v24 & 1) != 0)
  {
LABEL_44:
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __iop_start_block_invoke_2;
    v36 = &__block_descriptor_40_e5_v8__0l;
    v37 = p_iop;
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", _NSOperationExecutingAndFinishedKeys, 2, 0, 0, &v33);
    goto LABEL_50;
  }
LABEL_49:
  atomic_store(0xF0u, &self->_iop.__state);
  +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:](__NSOperationInternalObserver, "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:", CFSTR("isExecuting"), self, 0, 0, 0, 0, 0);
  +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:](__NSOperationInternalObserver, "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:", CFSTR("isFinished"), self, 0, 0, 0, 0, 0);
LABEL_50:
  objc_autoreleasePoolPop(v8);
}

- (BOOL)isExecuting
{
  int v2;

  v2 = atomic_load(&self->_iop.__state);
  return v2 == 224;
}

- (BOOL)isFinished
{
  unsigned int v2;

  v2 = atomic_load(&self->_iop.__state);
  return v2 > 0xEF;
}

- (BOOL)isReady
{
  NSOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  LOBYTE(v2) = v2->_iop.__unfinished_deps == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (id)keyPathsForValuesAffectingReady
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("isReady"));
}

+ (id)keyPathsForValuesAffectingFinished
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("isFinished"));
}

+ (id)keyPathsForValuesAffectingExecuting
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("isExecuting"));
}

+ (id)keyPathsForValuesAffectingIsReady
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("ready"));
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("executing"));
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("finished"));
}

+ (id)keyPathsForValuesAffectingIsCancelled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("cancelled"));
}

+ (id)keyPathsForValuesAffectingCancelled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("isCancelled"));
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("isFinished")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("finished")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("isReady")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("ready")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("isExecuting")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("executing")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("isCancelled")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("cancelled")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("dependencies")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("queuePriority")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("isAsynchronous")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("name")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("qualityOfService")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("completionBlock")) & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSOperation;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (void)setObservationInfo:(void *)a3
{
  void *obsInfo;
  id v5;

  obsInfo = self->_iop.__obsInfo;
  if (obsInfo != a3)
  {
    v5 = obsInfo;
    self->_iop.__obsInfo = a3;

  }
}

- (NSOperation)init
{
  NSOperation *v2;
  void *v3;
  const __CFArray *v4;
  CFIndex FirstIndexOfValue;
  CFIndex v6;
  void *ImplicitObservationInfo;
  void *v8;
  NSObject *v9;
  id v10;
  void *implicitObsInfo;
  void *value;
  objc_super v14;
  _OWORD v15[3];
  uint64_t v16;
  CFRange v17;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)NSOperation;
  v2 = -[NSOperation init](&v14, sel_init);
  if (qword_1ECD09918 != -1)
    dispatch_once(&qword_1ECD09918, &__block_literal_global_32);
  v3 = (void *)objc_opt_class();
  value = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD09938);
  v4 = (const __CFArray *)qword_1ECD09940;
  v17.length = CFArrayGetCount((CFArrayRef)qword_1ECD09940);
  v17.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v17, v3);
  if (FirstIndexOfValue == -1)
  {
    v15[0] = xmmword_1E0F4FAC0;
    v15[1] = *(_OWORD *)&off_1E0F4FAD0;
    v15[2] = xmmword_1E0F4FAE0;
    v8 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v15, 6);
    v9 = objc_opt_self();
    ImplicitObservationInfo = _NSKeyValueCreateImplicitObservationInfo(v9, v8, 0, 0, (objc_class *)v3, (objc_class **)&value);

    CFArrayAppendValue((CFMutableArrayRef)qword_1ECD09940, v3);
    CFArrayAppendValue((CFMutableArrayRef)qword_1ECD09948, value);
    CFArrayAppendValue((CFMutableArrayRef)qword_1ECD09950, ImplicitObservationInfo);
  }
  else
  {
    v6 = FirstIndexOfValue;
    value = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_1ECD09948, FirstIndexOfValue);
    ImplicitObservationInfo = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_1ECD09950, v6);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD09938);
  object_setClass(v2, (Class)value);
  pthread_mutex_init(&v2->_iop.__wait_mutex, 0);
  pthread_cond_init(&v2->_iop.__wait_cond, 0);
  atomic_store(1u, (unsigned __int8 *)&v2->_iop.__cached_isReady);
  v2->_iop.__prio = -1;
  v2->_iop.__thread_prio = 0.5;
  v2->_iop.__nameBuffer = 0;
  v2->_iop._shouldRemoveDependenciesAfterFinish = objc_msgSend((id)objc_opt_class(), "_removesDependenciesAfterFinish");
  v10 = ImplicitObservationInfo;
  os_unfair_lock_lock(&v2->_iop.__lock);
  implicitObsInfo = v2->_iop.__implicitObsInfo;
  v2->_iop.__implicitObsInfo = ImplicitObservationInfo;
  os_unfair_lock_unlock(&v2->_iop.__lock);

  return v2;
}

+ (BOOL)_removesDependenciesAfterFinish
{
  return 0;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  unsigned __int8 *p_isReadyObserverCount;
  int v12;
  unsigned __int8 *p_isExecutingObserverCount;
  int v14;
  const __CFString *v15;
  unsigned __int8 *p_isCancelledObserverCount;
  int v17;
  unsigned __int8 *p_isFinishedObserverCount;
  int v19;
  NSString *v20;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("isReady")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("ready")) & 1) != 0)
  {
    p_isReadyObserverCount = &self->_iop.__isReadyObserverCount;
    do
      v12 = __ldaxr(p_isReadyObserverCount);
    while (__stlxr(v12 + 1, p_isReadyObserverCount));
    if (v12 != 255)
      goto LABEL_6;
    atomic_store(0xFFu, p_isReadyObserverCount);
    v15 = CFSTR("isReady");
LABEL_26:
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("added too many observers to an NSOperation for %@"), v15);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0));
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("isExecuting")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("executing")) & 1) != 0)
  {
    p_isExecutingObserverCount = &self->_iop.__isExecutingObserverCount;
    do
      v14 = __ldaxr(p_isExecutingObserverCount);
    while (__stlxr(v14 + 1, p_isExecutingObserverCount));
    if (v14 == 255)
    {
      atomic_store(0xFFu, p_isExecutingObserverCount);
      v15 = CFSTR("isExecuting");
      goto LABEL_26;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("isCancelled")) & 1) != 0
         || (objc_msgSend(a4, "isEqualToString:", CFSTR("cancelled")) & 1) != 0)
  {
    p_isCancelledObserverCount = &self->_iop.__isCancelledObserverCount;
    do
      v17 = __ldaxr(p_isCancelledObserverCount);
    while (__stlxr(v17 + 1, p_isCancelledObserverCount));
    if (v17 == 255)
    {
      atomic_store(0xFFu, p_isCancelledObserverCount);
      v15 = CFSTR("isCancelled");
      goto LABEL_26;
    }
  }
  else if ((objc_msgSend(a4, "isEqualToString:", CFSTR("isFinished")) & 1) != 0
         || (objc_msgSend(a4, "isEqualToString:", CFSTR("finished")) & 1) != 0)
  {
    p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
    do
      v19 = __ldaxr(p_isFinishedObserverCount);
    while (__stlxr(v19 + 1, p_isFinishedObserverCount));
    if (v19 == 255)
    {
      atomic_store(0xFFu, p_isFinishedObserverCount);
      v15 = CFSTR("isFinished");
      goto LABEL_26;
    }
  }
LABEL_6:
  v21.receiver = self;
  v21.super_class = (Class)NSOperation;
  -[NSOperation addObserver:forKeyPath:options:context:](&v21, sel_addObserver_forKeyPath_options_context_, a3, a4, a5, a6);
}

- (void)waitUntilFinished
{
  os_unfair_lock_s *p_lock;
  NSOperationQueue *v4;
  qos_class_t v5;
  NSMapTable *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  os_unfair_lock_s *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  _opaque_pthread_t *v18;
  pthread_override_t started;
  pthread_mutex_t *p_wait_mutex;
  NSOperation *v21;
  NSOperationQueue *v22;
  id obj;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  v4 = self->_iop.__queue;
  os_unfair_lock_unlock(p_lock);
  v5 = atomic_load(&self->_iop.__propertyQoS);
  v22 = v4;
  if (v4)
    v6 = oq_begin_waiting((uint64_t)v4, v5);
  else
    v6 = 0;
  os_unfair_lock_lock(p_lock);
  v21 = self;
  v7 = (void *)-[NSMutableArray copy](self->_iop.__dependencies, "copy");
  os_unfair_lock_unlock(p_lock);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        if (v6)
        {
          v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v13 = (os_unfair_lock_s *)(v12 + 232);
          os_unfair_lock_lock((os_unfair_lock_t)(v12 + 232));
          v14 = *(id *)(v12 + 32);
          os_unfair_lock_unlock(v13);
          if (v14)
          {
            os_unfair_lock_lock((os_unfair_lock_t)v14 + 2);
            v15 = objc_msgSend(*((id *)v14 + 19), "count");
            if (v15)
            {
              v16 = v15;
              for (j = 0; j != v16; ++j)
              {
                v18 = (_opaque_pthread_t *)objc_msgSend(*((id *)v14 + 19), "pointerAtIndex:", j);
                if (!NSMapMember(v6, v18, 0, 0))
                {
                  started = pthread_override_qos_class_start_np(v18, v5, 0);
                  NSMapInsertKnownAbsent(v6, v18, started);
                }
              }
            }
            os_unfair_lock_unlock((os_unfair_lock_t)v14 + 2);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v9);
  }

  p_wait_mutex = &v21->_iop.__wait_mutex;
  pthread_mutex_lock(&v21->_iop.__wait_mutex);
  if (!-[NSOperation isFinished](v21, "isFinished"))
  {
    do
      pthread_cond_wait(&v21->_iop.__wait_cond, p_wait_mutex);
    while (!-[NSOperation isFinished](v21, "isFinished"));
  }
  pthread_mutex_unlock(p_wait_mutex);
  if (v6)
    oq_end_waiting(v6);

}

- (NSQualityOfService)qualityOfService
{
  NSQualityOfService result;

  result = op_get_property_qos((uint64_t)self);
  if ((_DWORD)result == (NSQualityOfServiceUtility|0x4) || result == 0)
    return -1;
  return result;
}

- (id)description
{
  NSString *v3;
  objc_super v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = -[NSOperation name](self, "name");
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSOperation;
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{name = '%@'}"), -[NSOperation description](&v6, sel_description), v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NSOperation;
    return -[NSOperation description](&v5, sel_description);
  }
}

- (NSString)name
{
  if (self->_iop.__nameBuffer)
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  else
    return 0;
}

- (BOOL)isCancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_iop.__isCancelled);
  return v2 & 1;
}

- (void)dealloc
{
  void *obsInfo;
  void *implicitObsInfo;
  NSOperationQueue *queue;
  id schedule;
  OS_voucher *voucher;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  obsInfo = self->_iop.__obsInfo;
  if (obsInfo)
  {
    self->_iop.__obsInfo = 0;

  }
  os_unfair_lock_lock(&self->_iop.__lock);
  implicitObsInfo = self->_iop.__implicitObsInfo;
  self->_iop.__implicitObsInfo = 0;
  os_unfair_lock_unlock(&self->_iop.__lock);

  os_unfair_lock_lock(&self->_iop.__lock);
  queue = self->_iop.__queue;
  self->_iop.__queue = 0;
  voucher = self->_iop._voucher;
  schedule = self->_iop.__schedule;
  self->_iop._voucher = 0;
  self->_iop.__schedule = 0;
  os_unfair_lock_unlock(&self->_iop.__lock);

  if (schedule)
    _Block_release(schedule);

  pthread_cond_destroy(&self->_iop.__wait_cond);
  pthread_mutex_destroy(&self->_iop.__wait_mutex);

  free(self->_iop.__nameBuffer);
  v8.receiver = self;
  v8.super_class = (Class)NSOperation;
  -[NSOperation dealloc](&v8, sel_dealloc);
}

- (NSOperationQueuePriority)queuePriority
{
  int prio;

  prio = self->_iop.__prio;
  if (prio == 255)
    LOBYTE(prio) = 0;
  return (uint64_t)(char)prio;
}

- (void)addDependency:(NSOperation *)op
{
  iop_addDependency((unsigned __int8 *)&self->_iop, op, self);
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
  v9.super_class = (Class)NSOperation;
  -[NSOperation removeObserver:forKeyPath:](&v9, sel_removeObserver_forKeyPath_, a3);
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("isReady")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("ready")) & 1) != 0)
  {
    v6 = 244;
    goto LABEL_13;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("isExecuting")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("executing")) & 1) != 0)
  {
    v6 = 242;
    goto LABEL_13;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("isCancelled")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("cancelled")) & 1) != 0)
  {
    v6 = 245;
    goto LABEL_13;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("isFinished")) & 1) != 0
    || objc_msgSend(a4, "isEqualToString:", CFSTR("finished")))
  {
    v6 = 243;
LABEL_13:
    v7 = (unsigned __int8 *)self + v6;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
  }
}

- (void)setThreadPriority:(double)threadPriority
{
  unsigned int v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v3 = atomic_load(&self->_iop.__state);
  if (v3 <= 0xD7)
  {
    if (threadPriority <= 0.0)
      threadPriority = 0.0;
    v4[1] = 3221225472;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[2] = __iop_setThreadPriority_block_invoke;
    v4[3] = &__block_descriptor_48_e5_v8__0l;
    if (threadPriority >= 1.0)
      threadPriority = 1.0;
    v4[4] = &self->_iop;
    *(double *)&v4[5] = threadPriority;
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", &_NSOperationThreadPriorityKeys, 1, 0, 0, v4);
  }
}

- (void)setName:(NSString *)name
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __iop_setName_block_invoke;
  v3[3] = &unk_1E0F4EE20;
  v3[4] = name;
  v3[5] = &self->_iop;
  -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", &_NSOperationNameKeys, 1, 0, 0, v3);
}

- (void)setQueuePriority:(NSOperationQueuePriority)queuePriority
{
  char v3;
  char v4;
  char v5;
  _QWORD v6[5];
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)queuePriority <= 0xFFFFFFFFFFFFFFF8)
    v3 = -8;
  else
    v3 = -4;
  if (queuePriority > NSOperationQueuePriorityLow)
    v3 = 0;
  if (queuePriority <= 3)
    v4 = v3;
  else
    v4 = 4;
  if (queuePriority <= 7)
    v5 = v4;
  else
    v5 = 8;
  if (self->_iop.__prio != v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __iop_setQueuePriority_block_invoke;
    v6[3] = &unk_1E0F4FB60;
    v6[4] = self;
    v7 = v5;
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", _NSOperationQueuePriorityKeys, 1, 0, 0, v6);
  }
}

- (void)setCompletionBlock:(void *)completionBlock
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __iop_setCompletionBlock_block_invoke;
  v3[3] = &unk_1E0F4FC00;
  v3[4] = completionBlock;
  v3[5] = &self->_iop;
  -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", &_NSOperationCompletionBlockKeys, 1, 0, 0, v3);
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  BOOL v3;
  NSQualityOfService v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v3 = (unint64_t)(qualityOfService + 1) > 0x22
    || ((1 << (qualityOfService + 1)) & 0x404040441) == 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__NSOperation_setQualityOfService___block_invoke;
  v5[3] = &unk_1E0F4EE20;
  if (v3)
    v4 = NSQualityOfServiceDefault;
  else
    v4 = qualityOfService;
  v5[4] = self;
  v5[5] = v4;
  -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", &_NSOperationQualityOfServiceKeys, 1, 0, 0, v5);
}

uint64_t __35__NSOperation_setQualityOfService___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1 > 16)
  {
    if (v1 != 17 && v1 != 33 && v1 != 25)
LABEL_9:
      LOBYTE(v1) = 0;
  }
  else
  {
    if (v1 == -1)
    {
      LOBYTE(v1) = 21;
      goto LABEL_11;
    }
    if (v1 != 5 && v1 != 9)
      goto LABEL_9;
  }
LABEL_11:
  atomic_store(v1, (unsigned __int8 *)(*(_QWORD *)(result + 32) + 241));
  return result;
}

- (void)cancel
{
  unsigned int v4;
  NSOperation *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  __CFString *v14;
  int v15;
  char v16;
  unsigned __int8 *p_isFinishedObserverCount;
  char v18;
  char v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[2];
  void (*v23)(uint64_t);
  void *v24;
  NSOperation *v25;
  $EBB4F64558E27463174FAD50DEBA2FF9 *p_iop;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[NSOperation isFinished](self, "isFinished"))
    return;
  if (atomic_load(&self->_iop.__isCancelledObserverCount))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __iop_cancel_block_invoke;
    v21[3] = &__block_descriptor_40_e5_v8__0l;
    v21[4] = &self->_iop;
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", _NSOperationCancelKeys, 1, 0, 0, v21);
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_iop.__isCancelled);
  }
  v4 = atomic_load(&self->_iop.__state);
  if (v4 > 0xDF)
    return;
  if (atomic_load(&self->_iop.__isReadyObserverCount))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __iop_cancel_block_invoke_2;
    v20[3] = &__block_descriptor_40_e5_v8__0l;
    v20[4] = &self->_iop;
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", &_NSOperationReadyKeys, 1, 0, 0, v20);
  }
  else
  {
    os_unfair_lock_lock(&self->_iop.__lock);
    self->_iop.__unfinished_deps = 0;
    os_unfair_lock_unlock(&self->_iop.__lock);
    +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:](__NSOperationInternalObserver, "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:", CFSTR("isReady"), self, 0, 0, 0, 0, 0);
  }
  if (!self->_iop._shouldRemoveDependenciesAfterFinish)
    return;
  v6 = self;
  v7 = 0;
  v8 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v23 = __iop_removeAllDependencies_block_invoke;
  v24 = &unk_1E0F4EE20;
  v25 = self;
  p_iop = &self->_iop;
  LOBYTE(v9) = 1;
  v10 = 1;
  do
  {
    while (1)
    {
      while (1)
      {
        v11 = v7;
        v12 = v10;
        v13 = v9;
        v14 = _NSOperationDependenciesAndReadyKeys[v8];
        if (v14 != CFSTR("isReady"))
          break;
        v10 = 0;
        v15 = atomic_load(&self->_iop.__isReadyObserverCount);
        v16 = v7 | (v15 != 0);
        v7 = 1;
        v9 = v12;
        v8 = 1;
        if ((v16 & 1) != 0)
          goto LABEL_23;
      }
      if (v14 != CFSTR("isFinished"))
        break;
      v10 = 0;
      p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
LABEL_22:
      v15 = atomic_load(p_isFinishedObserverCount);
      v18 = v7 | (v15 != 0);
      v8 = 1;
      v9 = v12;
      v7 = 1;
      if ((v18 & 1) != 0)
      {
LABEL_23:
        if (v15)
          v19 = v13;
        else
          v19 = v12;
        if ((v19 & 1) != 0)
          goto LABEL_27;
        goto LABEL_29;
      }
    }
    if (v14 == CFSTR("isExecuting"))
    {
      v10 = 0;
      p_isFinishedObserverCount = &self->_iop.__isExecutingObserverCount;
      goto LABEL_22;
    }
    if (v14 == CFSTR("isCancelled"))
    {
      v10 = 0;
      p_isFinishedObserverCount = &self->_iop.__isCancelledObserverCount;
      goto LABEL_22;
    }
    v10 = 0;
    v8 = 1;
    v9 = v12;
    v7 = 1;
  }
  while ((v11 & 1) == 0);
  if ((v12 & 1) != 0)
  {
LABEL_27:
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", _NSOperationDependenciesAndReadyKeys, 2, 0, 0, v22);
    goto LABEL_30;
  }
LABEL_29:
  ((void (*)(_QWORD *, uint64_t))v23)(v22, v9);
  +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:](__NSOperationInternalObserver, "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:", CFSTR("isReady"), self, 0, 0, 0, 0, 0);
LABEL_30:

}

CFMutableArrayRef __19__NSOperation_init__block_invoke()
{
  const __CFAllocator *v0;
  CFMutableArrayRef result;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
  qword_1ECD09940 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 16, &__NSOperationImplicitObservationArrayCallbacks);
  qword_1ECD09948 = (uint64_t)CFArrayCreateMutable(v0, 16, &__NSOperationImplicitObservationArrayCallbacks);
  result = CFArrayCreateMutable(v0, 16, &__NSOperationImplicitObservationArrayCallbacks);
  qword_1ECD09950 = (uint64_t)result;
  return result;
}

- (NSArray)dependencies
{
  void *v3;
  os_unfair_lock_s *p_lock;
  NSMutableArray *dependencies;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  dependencies = self->_iop.__dependencies;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dependencies, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(dependencies);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (object_getClass(v10) != (Class)_NSBarrierOperation)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dependencies, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v7);
  }
  os_unfair_lock_unlock(p_lock);
  if (v3)
    return (NSArray *)v3;
  else
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (void)completionBlock
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_iop.__lock;
  os_unfair_lock_lock(&self->_iop.__lock);
  v4 = self->_iop.__completion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (id)currentOperation
{
  return (id)_CFGetTSD();
}

- (BOOL)isConcurrent
{
  uint64_t v3;
  uint64_t v5;

  v3 = -[NSOperation methodForSelector:](self, "methodForSelector:", sel_isConcurrent);
  if (v3 != +[NSOperation instanceMethodForSelector:](NSOperation, "instanceMethodForSelector:", sel_isConcurrent))return 0;
  v5 = -[NSOperation methodForSelector:](self, "methodForSelector:", sel_isAsynchronous);
  return v5 != +[NSOperation instanceMethodForSelector:](NSOperation, "instanceMethodForSelector:", sel_isAsynchronous)&& -[NSOperation isAsynchronous](self, "isAsynchronous");
}

- (BOOL)isAsynchronous
{
  uint64_t v3;
  uint64_t v5;

  v3 = -[NSOperation methodForSelector:](self, "methodForSelector:", sel_isAsynchronous);
  if (v3 != +[NSOperation instanceMethodForSelector:](NSOperation, "instanceMethodForSelector:", sel_isAsynchronous))return 0;
  v5 = -[NSOperation methodForSelector:](self, "methodForSelector:", sel_isConcurrent);
  return v5 != +[NSOperation instanceMethodForSelector:](NSOperation, "instanceMethodForSelector:", sel_isConcurrent)&& -[NSOperation isConcurrent](self, "isConcurrent");
}

- (double)threadPriority
{
  return self->_iop.__thread_prio;
}

- (id)_copyCompletionBlock
{
  id completion;
  id v4;

  if (qword_1ECD09930 != -1)
    dispatch_once(&qword_1ECD09930, &__block_literal_global_307);
  os_unfair_lock_lock(&self->_iop.__lock);
  completion = self->_iop.__completion;
  if (_MergedGlobals_13)
    self->_iop.__completion = 0;
  else
    v4 = completion;
  os_unfair_lock_unlock(&self->_iop.__lock);
  return completion;
}

- (void)waitUntilFinishedOrTimeout:(double)a3
{
  double v4;
  NSOperationQueue *v5;
  qos_class_t v6;
  NSMapTable *v7;
  double i;
  timespec v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CFAbsoluteTimeGetCurrent() + a3;
  os_unfair_lock_lock(&self->_iop.__lock);
  v5 = self->_iop.__queue;
  os_unfair_lock_unlock(&self->_iop.__lock);
  v6 = atomic_load(&self->_iop.__propertyQoS);
  if (v5)
    v7 = oq_begin_waiting((uint64_t)v5, v6);
  else
    v7 = 0;
  pthread_mutex_lock(&self->_iop.__wait_mutex);
  for (i = v4 - CFAbsoluteTimeGetCurrent(); i > 0.0; i = v4 - CFAbsoluteTimeGetCurrent())
  {
    if (-[NSOperation isFinished](self, "isFinished"))
      break;
    v9.tv_sec = vcvtmd_s64_f64(i);
    v9.tv_nsec = (int)((i - (double)(uint64_t)floor(i)) * 1000000000.0);
    pthread_cond_timedwait_relative_np(&self->_iop.__wait_cond, &self->_iop.__wait_mutex, &v9);
  }
  pthread_mutex_unlock(&self->_iop.__wait_mutex);
  if (v7)
    oq_end_waiting(v7);

}

- (void)removeDependency:(NSOperation *)op
{
  $EBB4F64558E27463174FAD50DEBA2FF9 *p_iop;
  NSOperation *v6;
  NSOperation *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  __CFString *v15;
  int v16;
  char v17;
  unsigned __int8 *p_isFinishedObserverCount;
  char v19;
  char v20;
  _QWORD v21[2];
  void (*v22)(uint64_t);
  void *v23;
  NSOperation *v24;
  NSOperation *v25;
  $EBB4F64558E27463174FAD50DEBA2FF9 *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_iop = &self->_iop;
  v6 = op;
  v7 = self;
  v8 = 0;
  v9 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v22 = __iop_removeDependency_block_invoke;
  v23 = &unk_1E0F4FC28;
  v25 = self;
  v26 = p_iop;
  v24 = op;
  LOBYTE(v10) = 1;
  v11 = 1;
  do
  {
    while (1)
    {
      while (1)
      {
        v12 = v8;
        v13 = v11;
        v14 = v10;
        v15 = _NSOperationDependenciesAndReadyKeys[v9];
        if (v15 != CFSTR("isReady"))
          break;
        v11 = 0;
        v16 = atomic_load(&self->_iop.__isReadyObserverCount);
        v17 = v8 | (v16 != 0);
        v8 = 1;
        v10 = v13;
        v9 = 1;
        if ((v17 & 1) != 0)
          goto LABEL_14;
      }
      if (v15 != CFSTR("isFinished"))
        break;
      v11 = 0;
      p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
LABEL_13:
      v16 = atomic_load(p_isFinishedObserverCount);
      v19 = v8 | (v16 != 0);
      v9 = 1;
      v10 = v13;
      v8 = 1;
      if ((v19 & 1) != 0)
      {
LABEL_14:
        if (v16)
          v20 = v14;
        else
          v20 = v13;
        if ((v20 & 1) != 0)
          goto LABEL_18;
        goto LABEL_20;
      }
    }
    if (v15 == CFSTR("isExecuting"))
    {
      v11 = 0;
      p_isFinishedObserverCount = &self->_iop.__isExecutingObserverCount;
      goto LABEL_13;
    }
    if (v15 == CFSTR("isCancelled"))
    {
      v11 = 0;
      p_isFinishedObserverCount = &self->_iop.__isCancelledObserverCount;
      goto LABEL_13;
    }
    v11 = 0;
    v9 = 1;
    v10 = v13;
    v8 = 1;
  }
  while ((v12 & 1) == 0);
  if ((v13 & 1) != 0)
  {
LABEL_18:
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", _NSOperationDependenciesAndReadyKeys, 2, 0, 0, v21);
    goto LABEL_21;
  }
LABEL_20:
  ((void (*)(_QWORD *, uint64_t))v22)(v21, v10);
  +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:](__NSOperationInternalObserver, "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:", CFSTR("isReady"), self, 0, 0, 0, 0, 0);
LABEL_21:

}

- (void)removeAllDependencies
{
  $EBB4F64558E27463174FAD50DEBA2FF9 *p_iop;
  NSOperation *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  __CFString *v12;
  int v13;
  char v14;
  unsigned __int8 *p_isFinishedObserverCount;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  NSOperation *v22;
  $EBB4F64558E27463174FAD50DEBA2FF9 *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_iop = &self->_iop;
  v4 = self;
  v5 = 0;
  v6 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __iop_removeAllDependencies_block_invoke;
  v21 = &unk_1E0F4EE20;
  v22 = self;
  v23 = p_iop;
  LOBYTE(v7) = 1;
  v8 = 1;
  do
  {
    while (1)
    {
      while (1)
      {
        v9 = v5;
        v10 = v8;
        v11 = v7;
        v12 = _NSOperationDependenciesAndReadyKeys[v6];
        if (v12 != CFSTR("isReady"))
          break;
        v8 = 0;
        v13 = atomic_load(&self->_iop.__isReadyObserverCount);
        v14 = v5 | (v13 != 0);
        v5 = 1;
        v7 = v10;
        v6 = 1;
        if ((v14 & 1) != 0)
          goto LABEL_14;
      }
      if (v12 != CFSTR("isFinished"))
        break;
      v8 = 0;
      p_isFinishedObserverCount = &self->_iop.__isFinishedObserverCount;
LABEL_13:
      v13 = atomic_load(p_isFinishedObserverCount);
      v16 = v5 | (v13 != 0);
      v6 = 1;
      v7 = v10;
      v5 = 1;
      if ((v16 & 1) != 0)
      {
LABEL_14:
        if (v13)
          v17 = v11;
        else
          v17 = v10;
        if ((v17 & 1) != 0)
          goto LABEL_18;
        goto LABEL_20;
      }
    }
    if (v12 == CFSTR("isExecuting"))
    {
      v8 = 0;
      p_isFinishedObserverCount = &self->_iop.__isExecutingObserverCount;
      goto LABEL_13;
    }
    if (v12 == CFSTR("isCancelled"))
    {
      v8 = 0;
      p_isFinishedObserverCount = &self->_iop.__isCancelledObserverCount;
      goto LABEL_13;
    }
    v8 = 0;
    v6 = 1;
    v7 = v10;
    v5 = 1;
  }
  while ((v9 & 1) == 0);
  if ((v10 & 1) != 0)
  {
LABEL_18:
    -[NSOperation _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", _NSOperationDependenciesAndReadyKeys, 2, 0, 0, &v18);
    goto LABEL_21;
  }
LABEL_20:
  ((void (*)(uint64_t *, uint64_t))v20)(&v18, v7);
  +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:](__NSOperationInternalObserver, "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:", CFSTR("isReady"), self, 0, 0, 0, 0, 0, v18, v19);
LABEL_21:

}

- (id)debugDescription
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;

  v3 = -[NSOperation isFinished](self, "isFinished");
  v4 = -[NSOperation isReady](self, "isReady");
  v5 = -[NSOperation isCancelled](self, "isCancelled");
  v6 = -[NSOperation isExecuting](self, "isExecuting");
  v7 = objc_opt_class();
  v8 = CFSTR("NO");
  if (v3)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (v4)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (v5)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (v6)
    v8 = CFSTR("YES");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p isFinished=%@ isReady=%@ isCancelled=%@ isExecuting=%@>"), v7, self, v9, v10, v11, v8);
}

- (id)__graphDescription:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  int v7;
  const char *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(&stru_1E0F56070, "mutableCopy");
  if (a3)
  {
    v6 = a3;
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR("  "));
      --v6;
    }
    while (v6);
  }
  objc_msgSend(v5, "appendString:", -[NSOperation debugDescription](self, "debugDescription"));
  v7 = atomic_load(&self->_iop.__state);
  if (v7 > 215)
  {
    if (v7 > 239)
    {
      if (v7 == 240)
      {
        v8 = "finishing";
        goto LABEL_24;
      }
      if (v7 == 244)
      {
        v8 = "finished";
        goto LABEL_24;
      }
    }
    else
    {
      if (v7 == 216)
      {
        v8 = "starting";
        goto LABEL_24;
      }
      if (v7 == 224)
      {
        v8 = "executing";
        goto LABEL_24;
      }
    }
  }
  else if (v7 > 79)
  {
    if (v7 == 80)
    {
      v8 = "enqueued";
      goto LABEL_24;
    }
    if (v7 == 136)
    {
      v8 = "dispatching";
      goto LABEL_24;
    }
  }
  else
  {
    if (!v7)
    {
      v8 = "initialized";
      goto LABEL_24;
    }
    if (v7 == 72)
    {
      v8 = "enqueuing";
      goto LABEL_24;
    }
  }
  v8 = "unknown";
LABEL_24:
  objc_msgSend(v5, "appendFormat:", CFSTR(" %s\n"), v8);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = -[NSOperation dependencies](self, "dependencies");
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    v13 = a3 + 1;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v5, "appendString:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "__graphDescription:", v13));
      }
      while (v11 != v14);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v11);
  }
  return v5;
}

@end
