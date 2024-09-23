@implementation MFInvocationQueue

+ (id)sharedInvocationQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MFInvocationQueue_sharedInvocationQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInvocationQueue_onceToken != -1)
    dispatch_once(&sharedInvocationQueue_onceToken, block);
  return (id)sharedInvocationQueue_singleton;
}

- (void)addInvocation:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t threadPriorityTrigger;
  NSInteger v7;
  NSInteger v8;
  unsigned int v9;
  void *v10;
  NSMutableArray *items;
  NSMutableArray *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t numThreads;
  void *v20;
  id v21;

  v21 = a3;
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "monitor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    v5 = objc_msgSend(v4, "priority");
    threadPriorityTrigger = self->_threadPriorityTrigger;
    -[NSConditionLock lock](self->_lock, "lock");
    v7 = -[NSConditionLock condition](self->_lock, "condition");
    v8 = v7;
    do
      v9 = __ldaxr((unsigned int *)&_invocationCount);
    while (__stlxr(v9 + 1, (unsigned int *)&_invocationCount));
    if (v5 <= threadPriorityTrigger || v7 == 1)
    {
      items = self->_items;
      if (!items)
      {
        v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v13 = self->_items;
        self->_items = v12;

        items = self->_items;
      }
      v14 = -[NSMutableArray count](items, "count");
      if (v14)
      {
        v15 = 0;
        v16 = v4;
        while (1)
        {
          -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "monitor");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v4 = 0;
          }

          v18 = objc_msgSend(v4, "priority");
          if (v5 < v18)
            break;
          ++v15;
          v16 = v4;
          if (v14 == v15)
            goto LABEL_19;
        }
        -[NSMutableArray insertObject:atIndex:](self->_items, "insertObject:atIndex:", v21, v15);
      }
      else
      {
LABEL_19:
        -[NSMutableArray addObject:](self->_items, "addObject:", v21);
      }
      if (v8 != 1)
      {
        numThreads = self->_numThreads;
        if (numThreads < self->_maxThreads)
        {
          self->_numThreads = numThreads + 1;
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", self, sel__drainQueue_, 0);
          objc_msgSend(v20, "setQualityOfService:", 17);
          objc_msgSend(v20, "start");

        }
      }
      -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", 2);
    }
    else
    {
      ++self->_numThreads;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", self, sel__drainQueue_, v21);
      objc_msgSend(v10, "setQualityOfService:", 17);
      objc_msgSend(v10, "start");
      -[NSConditionLock unlock](self->_lock, "unlock");

    }
  }

}

- (void)_drainQueue:(id)a3
{
  id v4;
  FILE **v5;
  void *v6;
  double Current;
  FILE *v8;
  void *v9;
  id v10;
  const char *v11;
  const char *Name;
  FILE *v13;
  void *v14;
  id v15;
  const char *v16;
  const char *v17;
  CFAbsoluteTime v18;
  char isKindOfClass;
  unsigned int v20;
  void *v21;
  void *v22;

  v4 = a3;
  if (!_drainQueue__c)
    _drainQueue__c = objc_opt_class();
  v5 = (FILE **)MEMORY[0x1E0C80C10];
  do
  {
    if (v4)
    {
      if (_drainQueue__once != -1)
        dispatch_once(&_drainQueue__once, &__block_literal_global_9);
      v6 = (void *)MEMORY[0x1A85B0E24]();
      if (_drainQueue__DebugInvocationThreads
        || (Current = 0.0, objc_msgSend(v4, "mf_shouldLogInvocation")))
      {
        Current = CFAbsoluteTimeGetCurrent();
        v8 = *v5;
        objc_msgSend(v4, "target");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = (const char *)objc_msgSend(v10, "UTF8String");
        Name = sel_getName((SEL)objc_msgSend(v4, "selector"));
        fprintf(v8, "MFInvocationQueue starting invocation %p [%s %s]\n", v4, v11, Name);

      }
      objc_msgSend(v4, "invoke");
      if (_drainQueue__DebugInvocationThreads || objc_msgSend(v4, "mf_shouldLogInvocation"))
      {
        v13 = *v5;
        objc_msgSend(v4, "target");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "description");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v16 = (const char *)objc_msgSend(v15, "UTF8String");
        v17 = sel_getName((SEL)objc_msgSend(v4, "selector"));
        v18 = CFAbsoluteTimeGetCurrent();
        fprintf(v13, "MFInvocationQueue finished invocation %p [%s %s] in %5.5fs\n", v4, v16, v17, v18 - Current);

      }
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        _MFFlushCurrentInvocation();
      do
        v20 = __ldaxr((unsigned int *)&_invocationCount);
      while (__stlxr(v20 - 1, (unsigned int *)&_invocationCount));
      objc_autoreleasePoolPop(v6);
    }
    v21 = (void *)MEMORY[0x1A85B0E24]();
    -[NSConditionLock lock](self->_lock, "lock");
    if (self->_numThreads > self->_maxThreads)
      goto LABEL_25;
    if (!-[NSMutableArray count](self->_items, "count") && self->_threadRecycleTimeout > 0.0)
    {
      -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", 1);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", self->_threadRecycleTimeout);
      if (!-[NSConditionLock lockWhenCondition:beforeDate:](self->_lock, "lockWhenCondition:beforeDate:", 2, v22))
        -[NSConditionLock lock](self->_lock, "lock");

    }
    if (-[NSMutableArray count](self->_items, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_items, "removeObjectAtIndex:", 0);
    }
    else
    {
LABEL_25:
      v4 = 0;
      --self->_numThreads;
    }
    -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", 2 * (-[NSMutableArray count](self->_items, "count") != 0));
    objc_autoreleasePoolPop(v21);
  }
  while (v4);
}

- (MFInvocationQueue)init
{
  return -[MFInvocationQueue initWithMaxThreadCount:](self, "initWithMaxThreadCount:", 1);
}

- (MFInvocationQueue)initWithMaxThreadCount:(unint64_t)a3
{
  MFInvocationQueue *v4;
  uint64_t v5;
  NSConditionLock *lock;
  unint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFInvocationQueue;
  v4 = -[MFInvocationQueue init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithName:condition:andDelegate:", CFSTR("InvocationQueue_lock"), 0, v4);
    lock = v4->_lock;
    v4->_lock = (NSConditionLock *)v5;

    if (a3 <= 1)
      v7 = 1;
    else
      v7 = a3;
    v4->_maxThreads = v7;
    v4->_threadPriorityTrigger = 7;
    objc_msgSend(MEMORY[0x1E0D46090], "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addDiagnosticsGenerator:", v4);

  }
  return v4;
}

- (void)setThreadRecycleTimeout:(double)a3
{
  self->_threadRecycleTimeout = a3;
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

uint64_t __42__MFInvocationQueue_sharedInvocationQueue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithMaxThreadCount:", 1);
  v2 = (void *)sharedInvocationQueue_singleton;
  sharedInvocationQueue_singleton = v1;

  return objc_msgSend((id)sharedInvocationQueue_singleton, "setThreadRecycleTimeout:", 30.0);
}

void __33__MFInvocationQueue__drainQueue___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _drainQueue__DebugInvocationThreads = objc_msgSend(v0, "BOOLForKey:", CFSTR("DebugWorkerThreads"));

}

- (void)dealloc
{
  int v3;
  unsigned int v4;
  objc_super v5;

  v3 = -(int)-[NSMutableArray count](self->_items, "count");
  do
    v4 = __ldaxr((unsigned int *)&_invocationCount);
  while (__stlxr(v4 + v3, (unsigned int *)&_invocationCount));
  v5.receiver = self;
  v5.super_class = (Class)MFInvocationQueue;
  -[MFInvocationQueue dealloc](&v5, sel_dealloc);
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

+ (void)flushAllInvocationQueues
{
  double v3;
  void *v4;
  void *v5;

  do
  {
    if (__ldaxr((unsigned int *)&_invocationCount))
    {
      v3 = 0.01;
      while (1)
      {
        __clrex();
        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "runUntilDate:", v5);

        if (v3 < 1.0)
          v3 = v3 + v3;
        while (!__ldaxr((unsigned int *)&_invocationCount))
        {
          if (!__stlxr(0, (unsigned int *)&_invocationCount))
            return;
        }
      }
    }
  }
  while (__stlxr(0, (unsigned int *)&_invocationCount));
}

- (void)didCancel:(id)a3
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  unsigned int v10;
  id v11;

  v11 = a3;
  -[NSConditionLock lock](self->_lock, "lock");
  v4 = -[NSMutableArray count](self->_items, "count");
  v5 = v4;
  if (v4)
  {
    v6 = v4 - 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "monitor");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == v11)
        {
          objc_msgSend(v11, "postActivityStarting");
          objc_msgSend(v11, "postActivityFinished:", v7);
          -[NSMutableArray removeObjectAtIndex:](self->_items, "removeObjectAtIndex:", v6);
        }
      }

      --v6;
    }
    while (v6 != -1);
  }
  v9 = -[NSMutableArray count](self->_items, "count") - v5;
  do
    v10 = __ldaxr((unsigned int *)&_invocationCount);
  while (__stlxr(v10 + v9, (unsigned int *)&_invocationCount));
  -[NSConditionLock unlock](self->_lock, "unlock");

}

- (id)copyDiagnosticInformation
{
  id v3;
  MFInvocationQueue *v4;
  uint64_t v5;
  const __CFString *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
  v4 = (MFInvocationQueue *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  v5 = objc_opt_class();
  v6 = &stru_1E4F1C8F8;
  if (v4 == self)
    v6 = CFSTR("Shared ");
  objc_msgSend(v3, "appendFormat:", CFSTR("==== %@Invocation Queue <%@: %p> ====\n"), v6, v5, self);
  objc_msgSend(v3, "appendFormat:", CFSTR("number of running threads: %d\n"), self->_numThreads);
  objc_msgSend(v3, "appendString:", CFSTR("==== Queued ====\n"));
  -[NSConditionLock lock](self->_lock, "lock");
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_items;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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

- (unint64_t)threadPriorityTrigger
{
  return self->_threadPriorityTrigger;
}

- (void)setThreadPriorityTrigger:(unint64_t)a3
{
  self->_threadPriorityTrigger = a3;
}

- (double)threadRecycleTimeout
{
  return self->_threadRecycleTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
