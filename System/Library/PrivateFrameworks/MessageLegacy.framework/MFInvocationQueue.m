@implementation MFInvocationQueue

- (void)addInvocation:(id)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  NSInteger v8;
  NSInteger v9;
  unsigned int v10;
  NSMutableArray *items;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t numThreads;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = (void *)objc_msgSend(a3, "monitor");
    else
      v5 = 0;
    v6 = objc_msgSend(v5, "priority");
    v7 = *(_QWORD *)&self->_threadPriorityTrigger;
    -[NSConditionLock lock](self->_lock, "lock");
    v8 = -[NSConditionLock condition](self->_lock, "condition");
    v9 = v8;
    do
      v10 = __ldaxr((unsigned int *)&_invocationCount);
    while (__stlxr(v10 + 1, (unsigned int *)&_invocationCount));
    if (v6 <= v7 || v8 == 1)
    {
      items = self->_items;
      if (!items)
      {
        items = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        self->_items = items;
      }
      v12 = -[NSMutableArray count](items, "count");
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        while (1)
        {
          v15 = (void *)-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v14);
          objc_opt_class();
          v16 = (objc_opt_isKindOfClass() & 1) != 0 ? (void *)objc_msgSend(v15, "monitor") : 0;
          if (v6 < objc_msgSend(v16, "priority"))
            break;
          if (v13 == ++v14)
            goto LABEL_20;
        }
        -[NSMutableArray insertObject:atIndex:](self->_items, "insertObject:atIndex:", a3, v14);
      }
      else
      {
LABEL_20:
        -[NSMutableArray addObject:](self->_items, "addObject:", a3);
      }
      if (v9 != 1)
      {
        numThreads = self->_numThreads;
        if (numThreads < self->_maxThreads)
        {
          self->_numThreads = numThreads + 1;
          objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadSelector:toTarget:withObject:", sel__drainQueue_, self, 0);
        }
      }
      -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", 2);
    }
    else
    {
      ++self->_numThreads;
      objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadSelector:toTarget:withObject:", sel__drainQueue_, self, a3);
      -[NSConditionLock unlock](self->_lock, "unlock");
    }
  }
}

- (void)_drainQueue:(id)a3
{
  FILE **v5;
  id v6;
  double Current;
  FILE *v8;
  const char *v9;
  const char *Name;
  FILE *v11;
  const char *v12;
  const char *v13;
  CFAbsoluteTime v14;
  char isKindOfClass;
  unsigned int v16;
  id v17;
  unint64_t numThreads;
  void *v19;

  if (!_drainQueue__c)
    _drainQueue__c = objc_opt_class();
  v5 = (FILE **)MEMORY[0x1E0C80C10];
  do
  {
    if (a3)
    {
      if (_drainQueue__once != -1)
        dispatch_once(&_drainQueue__once, &__block_literal_global_3);
      v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      if (_drainQueue__DebugInvocationThreads
        || (Current = 0.0, objc_msgSend(a3, "mf_shouldLogInvocation")))
      {
        Current = CFAbsoluteTimeGetCurrent();
        v8 = *v5;
        v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "target"), "description"), "UTF8String");
        Name = sel_getName((SEL)objc_msgSend(a3, "selector"));
        fprintf(v8, "MFInvocationQueue starting invocation %p [%s %s]\n", a3, v9, Name);
      }
      -[MFInvocationQueue _processInvocation:](self, "_processInvocation:", a3);
      if (_drainQueue__DebugInvocationThreads || objc_msgSend(a3, "mf_shouldLogInvocation"))
      {
        v11 = *v5;
        v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "target"), "description"), "UTF8String");
        v13 = sel_getName((SEL)objc_msgSend(a3, "selector"));
        v14 = CFAbsoluteTimeGetCurrent();
        fprintf(v11, "MFInvocationQueue finished invocation %p [%s %s] in %5.5fs\n", a3, v12, v13, v14 - Current);
      }
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        _MFFlushCurrentInvocation();
      do
        v16 = __ldaxr((unsigned int *)&_invocationCount);
      while (__stlxr(v16 - 1, (unsigned int *)&_invocationCount));

    }
    v17 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    -[NSConditionLock lock](self->_lock, "lock");
    numThreads = self->_numThreads;
    if (numThreads <= self->_maxThreads)
    {
      if (!-[NSMutableArray count](self->_items, "count") && self->_threadRecycleTimeout > 0.0)
      {
        -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", 1);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", self->_threadRecycleTimeout);
        if (!-[NSConditionLock lockWhenCondition:beforeDate:](self->_lock, "lockWhenCondition:beforeDate:", 2, v19))
          -[NSConditionLock lock](self->_lock, "lock");

      }
      if (-[NSMutableArray count](self->_items, "count"))
      {
        a3 = (id)-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", 0);
        -[NSMutableArray removeObjectAtIndex:](self->_items, "removeObjectAtIndex:", 0);
        goto LABEL_28;
      }
      a3 = 0;
      numThreads = self->_numThreads;
    }
    else
    {
      a3 = 0;
    }
    self->_numThreads = numThreads - 1;
LABEL_28:
    -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", 2 * (-[NSMutableArray count](self->_items, "count") != 0));
    objc_msgSend(v17, "drain");
  }
  while (a3);
}

- (MFInvocationQueue)init
{
  return -[MFInvocationQueue initWithMaxThreadCount:](self, "initWithMaxThreadCount:", 1);
}

- (MFInvocationQueue)initWithMaxThreadCount:(unint64_t)a3
{
  MFInvocationQueue *v4;
  unint64_t v5;
  dispatch_queue_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFInvocationQueue;
  v4 = -[MFInvocationQueue init](&v8, sel_init);
  if (v4)
  {
    v4->_lock = (NSConditionLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithName:condition:andDelegate:", CFSTR("InvocationQueue_lock"), 0, v4);
    if (a3 <= 1)
      v5 = 1;
    else
      v5 = a3;
    v4->_maxThreads = v5;
    *(_QWORD *)&v4->_threadPriorityTrigger = 7;
    v4->_threadOverrides = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4->_isForeground = objc_msgSend((id)MFUserAgent(), "isForeground");
    if (MFIsMobileMail())
    {
      v6 = dispatch_queue_create("com.apple.message.invocationqueue.keybag", 0);
      v4->_keybagQueue = (OS_dispatch_queue *)v6;
      MFRegisterContentProtectionObserver((uint64_t)v4, (uint64_t)v6);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D46090], "sharedController"), "addDiagnosticsGenerator:", v4);
  }
  return v4;
}

+ (id)sharedInvocationQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MFInvocationQueue_sharedInvocationQueue__block_invoke;
  block[3] = &unk_1E81C9B98;
  block[4] = a1;
  if (sharedInvocationQueue_onceToken != -1)
    dispatch_once(&sharedInvocationQueue_onceToken, block);
  return (id)sharedInvocationQueue_singleton;
}

uint64_t __42__MFInvocationQueue_sharedInvocationQueue__block_invoke(uint64_t a1)
{
  sharedInvocationQueue_singleton = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithMaxThreadCount:", 1);
  return objc_msgSend((id)sharedInvocationQueue_singleton, "setThreadRecycleTimeout:", 30.0);
}

- (void)dealloc
{
  int v3;
  unsigned int v4;
  objc_super v5;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D46090], "sharedController"), "removeDiagnosticsGenerator:", self);
  v3 = -(int)-[NSMutableArray count](self->_items, "count");
  do
    v4 = __ldaxr((unsigned int *)&_invocationCount);
  while (__stlxr(v4 + v3, (unsigned int *)&_invocationCount));

  if (MFIsMobileMail())
  {
    MFUnregisterContentProtectionObserver((uint64_t)self);
    dispatch_release((dispatch_object_t)self->_keybagQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFInvocationQueue;
  -[MFInvocationQueue dealloc](&v5, sel_dealloc);
}

- (void)setMaxThreadCount:(unint64_t)a3
{
  unint64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  self->_maxThreads = v3;
}

- (unint64_t)maxThreadCount
{
  return self->_maxThreads;
}

- (unint64_t)invocationCount
{
  unint64_t v3;

  -[NSConditionLock lock](self->_lock, "lock");
  v3 = -[NSMutableArray count](self->_items, "count");
  if (-[NSConditionLock condition](self->_lock, "condition") != 1)
    v3 += self->_numThreads;
  -[NSConditionLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)removeAllItems
{
  int v3;
  unsigned int v4;

  -[NSConditionLock lock](self->_lock, "lock");
  v3 = -(int)-[NSMutableArray count](self->_items, "count");
  do
    v4 = __ldaxr((unsigned int *)&_invocationCount);
  while (__stlxr(v4 + v3, (unsigned int *)&_invocationCount));
  -[NSMutableArray removeAllObjects](self->_items, "removeAllObjects");
  -[NSConditionLock unlock](self->_lock, "unlock");
}

- (void)_adjustThreadPrioritiesIsForeground:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__MFInvocationQueue__adjustThreadPrioritiesIsForeground___block_invoke;
  v3[3] = &unk_1E81CA0D8;
  v3[4] = self;
  v4 = a3;
  _dispatch_sync(v3);
}

uint64_t __57__MFInvocationQueue__adjustThreadPrioritiesIsForeground___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = *(_BYTE *)(a1 + 40);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "applyOverrideWhileForeground:", *(unsigned __int8 *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)_processInvocation:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _MFInvocationQOSOverride *v7;
  uint64_t v8;
  _QWORD v9[6];
  _QWORD v10[6];
  int __relative_priority;
  qos_class_t __qos_class;

  v5 = 17;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(a3, "isLowPriority");
    if ((_DWORD)v6)
      v5 = 25;
    else
      v5 = 17;
  }
  else
  {
    v6 = 0;
  }
  v7 = -[_MFInvocationQOSOverride initWithPthread:desiredQoS:lowPriority:]([_MFInvocationQOSOverride alloc], "initWithPthread:desiredQoS:lowPriority:", pthread_self(), v5, v6);
  __relative_priority = 0;
  __qos_class = QOS_CLASS_DEFAULT;
  pthread_get_qos_class_np(-[_MFInvocationQOSOverride pthread](v7, "pthread"), &__qos_class, &__relative_priority);
  v8 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MFInvocationQueue__processInvocation___block_invoke;
  v10[3] = &unk_1E81C9BC0;
  v10[4] = self;
  v10[5] = v7;
  _dispatch_sync(v10);
  pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0);
  objc_msgSend(a3, "invoke");
  pthread_set_qos_class_self_np(__qos_class, __relative_priority);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __40__MFInvocationQueue__processInvocation___block_invoke_43;
  v9[3] = &unk_1E81C9BC0;
  v9[4] = v7;
  v9[5] = self;
  _dispatch_sync(v9);

}

uint64_t __40__MFInvocationQueue__processInvocation___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v2 = (id *)(a1 + 40);
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "member:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "removeOverride"))
    {
      v5 = MFLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __40__MFInvocationQueue__processInvocation___block_invoke_cold_1(v2, v5);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", v4);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "applyOverrideWhileForeground:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 64));
}

uint64_t __40__MFInvocationQueue__processInvocation___block_invoke_43(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeOverride");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __33__MFInvocationQueue__drainQueue___block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("DebugWorkerThreads"));
  _drainQueue__DebugInvocationThreads = result;
  return result;
}

+ (unint64_t)totalInvocationCount
{
  return _invocationCount;
}

+ (void)flushAllInvocationQueues
{
  double v3;
  void *v4;

  if (objc_msgSend(a1, "totalInvocationCount"))
  {
    v3 = 0.01;
    do
    {
      v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      objc_msgSend(v4, "runUntilDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v3));
      if (v3 < 1.0)
        v3 = v3 + v3;
    }
    while (objc_msgSend(a1, "totalInvocationCount"));
  }
}

- (void)didCancel:(id)a3
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  unsigned int v10;

  -[NSConditionLock lock](self->_lock, "lock");
  v5 = -[NSMutableArray count](self->_items, "count");
  v6 = v5;
  if (v5)
  {
    v7 = v5 - 1;
    do
    {
      v8 = (void *)-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (id)objc_msgSend(v8, "monitor") == a3)
      {
        objc_msgSend(a3, "postActivityStarting");
        objc_msgSend(a3, "postActivityFinished:", v8);
        -[NSMutableArray removeObjectAtIndex:](self->_items, "removeObjectAtIndex:", v7);
      }
      --v7;
    }
    while (v7 != -1);
  }
  v9 = -[NSMutableArray count](self->_items, "count") - v6;
  do
    v10 = __ldaxr((unsigned int *)&_invocationCount);
  while (__stlxr(v10 + v9, (unsigned int *)&_invocationCount));
  -[NSConditionLock unlock](self->_lock, "unlock");
}

- (void)applicationWillSuspend
{
  -[MFInvocationQueue _adjustThreadPrioritiesIsForeground:](self, "_adjustThreadPrioritiesIsForeground:", 0);
}

- (void)applicationWillResume
{
  -[MFInvocationQueue _adjustThreadPrioritiesIsForeground:](self, "_adjustThreadPrioritiesIsForeground:", 1);
}

- (void)contentProtectionStateChanged:(int)a3 previousState:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  if (!a3 && a4 != 3)
  {
    v7[7] = v4;
    v7[8] = v5;
    -[MFInvocationQueue _adjustThreadPrioritiesIsForeground:](self, "_adjustThreadPrioritiesIsForeground:", 1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__MFInvocationQueue_contentProtectionStateChanged_previousState___block_invoke;
    v7[3] = &unk_1E81C9B98;
    v7[4] = self;
    _dispatch_sync(v7);
  }
}

uint64_t __65__MFInvocationQueue_contentProtectionStateChanged_previousState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)MFUserAgent(), "isForeground");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = result;
  return result;
}

- (id)copyDiagnosticInformation
{
  id v3;
  MFInvocationQueue *v4;
  const __CFString *v5;
  NSMutableArray *items;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  if (v4 == self)
    v5 = CFSTR("Shared ");
  else
    v5 = &stru_1E81CBE50;
  objc_msgSend(v3, "appendFormat:", CFSTR("==== %@Invocation Queue <%@: %p> ====\n"), v5, objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("number of running threads: %d\n"), self->_numThreads);
  objc_msgSend(v3, "appendString:", CFSTR("==== Queued ====\n"));
  -[NSConditionLock lock](self->_lock, "lock");
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    items = self->_items;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](items, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(items);
          objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](items, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("(empty)\n"));
  }
  -[NSConditionLock unlock](self->_lock, "unlock");
  return v3;
}

- (unint64_t)threadCount
{
  return self->_numThreads;
}

- (int)threadPriorityTrigger
{
  return *(_QWORD *)&self->_threadPriorityTrigger;
}

- (void)setThreadPriorityTrigger:(int)a3
{
  *(_QWORD *)&self->_threadPriorityTrigger = *(_QWORD *)&a3;
}

- (double)threadRecycleTimeout
{
  return self->_threadRecycleTimeout;
}

- (void)setThreadRecycleTimeout:(double)a3
{
  self->_threadRecycleTimeout = a3;
}

void __40__MFInvocationQueue__processInvocation___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*a1, "pthread");
  v4 = 134217984;
  v5 = v3;
  _os_log_debug_impl(&dword_1C8839000, a2, OS_LOG_TYPE_DEBUG, "processing low pri invocation: qos override already existed for %p, just ending it", (uint8_t *)&v4, 0xCu);
}

@end
