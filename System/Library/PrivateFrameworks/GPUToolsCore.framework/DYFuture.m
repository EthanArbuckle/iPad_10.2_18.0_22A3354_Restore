@implementation DYFuture

+ (id)future
{
  objc_opt_class();
  return (id)objc_opt_new();
}

+ (id)futureWithResult:(id)a3 error:(id)a4
{
  void *v6;

  v6 = (void *)objc_msgSend(a1, "future");
  objc_msgSend(v6, "setError:", a4);
  objc_msgSend(v6, "setResult:", a3);
  return v6;
}

- (DYFuture)init
{
  DYFuture *v2;
  NSCondition *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYFuture;
  v2 = -[DYFuture init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    v2->_condition = v3;
    -[NSCondition lock](v3, "lock");
    v2->_notifyList = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_priority = 0;
    v2->_result = 0;
    v2->_error = 0;
    v2->_resolved = 0;
    -[NSCondition unlock](v2->_condition, "unlock");
  }
  return v2;
}

- (void)dealloc
{
  DYError *v3;
  NSCondition *condition;
  objc_super v5;

  v3 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 1028, 0);
  -[NSCondition lock](self->_condition, "lock");
  if (!self->_resolved)
  {
    -[NSCondition unlock](self->_condition, "unlock");
    -[DYFuture _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", 0, v3, 1);
    -[NSCondition lock](self->_condition, "lock");
  }

  self->_resolved = 1;
  self->_result = 0;
  self->_error = 0;
  self->_notifyList = 0;
  condition = self->_condition;
  self->_condition = 0;
  -[NSCondition broadcast](condition, "broadcast");
  -[NSCondition unlock](condition, "unlock");

  v5.receiver = self;
  v5.super_class = (Class)DYFuture;
  -[DYFuture dealloc](&v5, sel_dealloc);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("isFinished")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("isExecuting")) & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___DYFuture;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (BOOL)isCancelled
{
  BOOL cancelled;

  -[NSCondition lock](self->_condition, "lock");
  cancelled = self->_cancelled;
  -[NSCondition unlock](self->_condition, "unlock");
  return cancelled;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  BOOL v3;

  -[NSCondition lock](self->_condition, "lock");
  v3 = !self->_resolved && !self->_cancelled;
  -[NSCondition unlock](self->_condition, "unlock");
  return v3;
}

- (BOOL)isFinished
{
  BOOL v3;

  -[NSCondition lock](self->_condition, "lock");
  v3 = self->_resolved || self->_cancelled;
  -[NSCondition unlock](self->_condition, "unlock");
  return v3;
}

- (int64_t)queuePriority
{
  int64_t priority;

  -[NSCondition lock](self->_condition, "lock");
  priority = self->_priority;
  -[NSCondition unlock](self->_condition, "unlock");
  return priority;
}

- (void)setQueuePriority:(int64_t)a3
{
  -[NSCondition lock](self->_condition, "lock");
  self->_priority = a3;
  -[NSCondition unlock](self->_condition, "unlock");
}

- (id)completionBlock
{
  id v3;

  -[NSCondition lock](self->_condition, "lock");
  v3 = (id)objc_msgSend(self->_completion, "copy");
  -[NSCondition unlock](self->_condition, "unlock");
  return v3;
}

- (void)setCompletionBlock:(id)a3
{
  -[NSCondition lock](self->_condition, "lock");
  self->_completion = (id)objc_msgSend(a3, "copy");
  -[NSCondition unlock](self->_condition, "unlock");
}

- (void)_start_NOLOCK
{
  -[DYFuture willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[NSCondition lock](self->_condition, "lock");
  if (!self->_started && !self->_cancelled && !self->_resolved)
    self->_started = 1;
  -[NSCondition unlock](self->_condition, "unlock");
  -[DYFuture didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (void)waitUntilFinished
{
  -[NSCondition lock](self->_condition, "lock");
  while (!self->_resolved)
  {
    if (self->_cancelled)
      break;
    -[NSCondition wait](self->_condition, "wait");
  }
  -[NSCondition unlock](self->_condition, "unlock");
}

- (void)addDependency:(id)a3
{
  -[NSCondition lock](self->_condition, "lock");
  -[DYFuture _addDependency_REQUIRESLOCK:](self, "_addDependency_REQUIRESLOCK:", a3);
  -[NSCondition unlock](self->_condition, "unlock");
}

+ (BOOL)logPerformance
{
  if (logPerformance_onceToken != -1)
    dispatch_once(&logPerformance_onceToken, &__block_literal_global_3);
  return logPerformance_log;
}

uint64_t __26__DYFuture_logPerformance__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("GPUDebugger.DYFuture.LogPerformance"));
  logPerformance_log = result;
  return result;
}

+ (BOOL)enableAssertMainThread
{
  if (enableAssertMainThread_onceToken != -1)
    dispatch_once(&enableAssertMainThread_onceToken, &__block_literal_global_14);
  return enableAssertMainThread_log;
}

uint64_t __34__DYFuture_enableAssertMainThread__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("GPUDebugger.DYFuture.EnableAssertMainThread"));
  enableAssertMainThread_log = result;
  return result;
}

- (void)waitUntilResolved
{
  void *v3;
  _BOOL8 resolved;
  double v5;
  double v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    +[DYFuture enableAssertMainThread](DYFuture, "enableAssertMainThread");
  if (+[DYFuture logPerformance](DYFuture, "logPerformance"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    resolved = self->_resolved;
  }
  else
  {
    resolved = 0;
    v3 = 0;
  }
  -[DYFuture _start_NOLOCK](self, "_start_NOLOCK");
  -[DYFuture waitUntilFinished](self, "waitUntilFinished");
  if (+[DYFuture logPerformance](DYFuture, "logPerformance"))
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    v6 = -v5;
    v7 = -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("GPUDebugger.DYFuture.csv"));
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE60], "date"), "timeIntervalSinceReferenceDate");
    v10 = v9;
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "valueForKeyPath:", CFSTR("private.seqNum"));
    v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols"), "componentsJoinedByString:", CFSTR(" | "));
    v13 = (void *)objc_msgSend(v8, "stringWithFormat:", CFSTR("%f, %@, %@, %f, %d, %d\n"), v10, v11, v12, *(_QWORD *)&v6, resolved, objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"));
    v14 = (void *)objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v7);
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v14, "seekToEndOfFile");
      objc_msgSend(v15, "writeData:", objc_msgSend(v13, "dataUsingEncoding:", 4));
      objc_msgSend(v15, "closeFile");
    }
    else
    {
      v16 = 0;
      objc_msgSend((id)objc_msgSend(CFSTR("Timestamp, Thread, Symbol, Interval, Resolved, Main Thread\n"), "stringByAppendingString:", v13), "writeToFile:atomically:encoding:error:", v7, 1, 4, &v16);
    }
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("GPUDebugger.DYFuture.HardAssertMainThread")) & 1) == 0)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("GPUDebugger.DYFuture.SoftAssertMainThread"));
  }
}

- (id)resolvedResult
{
  return self->_result;
}

- (NSError)resolvedError
{
  return self->_error;
}

- (id)result
{
  -[DYFuture waitUntilResolved](self, "waitUntilResolved");
  return self->_result;
}

- (void)addResultHandler:(id)a3
{
  id result;
  NSError *error;
  uint64_t v7;
  NSObject *global_queue;
  uint64_t v9;
  NSMutableArray *notifyList;
  _QWORD v11[6];
  _QWORD block[7];

  -[NSCondition lock](self->_condition, "lock");
  if (self->_resolved)
  {
    result = self->_result;
    error = self->_error;
    -[NSCondition unlock](self->_condition, "unlock");
    v7 = objc_msgSend(a3, "copy");
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__DYFuture_addResultHandler___block_invoke;
    block[3] = &unk_250D62AD0;
    block[5] = error;
    block[6] = v7;
    block[4] = result;
    dispatch_async(global_queue, block);
  }
  else
  {
    v9 = objc_msgSend(a3, "copy");
    notifyList = self->_notifyList;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __29__DYFuture_addResultHandler___block_invoke_2;
    v11[3] = &unk_250D62AF8;
    v11[4] = self;
    v11[5] = v9;
    -[NSMutableArray addObject:](notifyList, "addObject:", objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v11));
    -[NSCondition unlock](self->_condition, "unlock");
  }
}

void __29__DYFuture_addResultHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __29__DYFuture_addResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD block[7];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 272);
  v4 = *(_QWORD *)(v2 + 280);
  objc_msgSend(*(id *)(v2 + 256), "unlock");
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__DYFuture_addResultHandler___block_invoke_3;
  block[3] = &unk_250D62AD0;
  v6 = *(_QWORD *)(a1 + 40);
  block[5] = v4;
  block[6] = v6;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

void __29__DYFuture_addResultHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)requestResult:(id)a3
{
  -[DYFuture addResultHandler:](self, "addResultHandler:", a3);
  -[DYFuture _start_NOLOCK](self, "_start_NOLOCK");
}

- (BOOL)BOOLResult
{
  id v2;

  v2 = -[DYFuture result](self, "result");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return v2 != 0;
}

- (unsigned)uint32Result
{
  id v2;

  v2 = -[DYFuture result](self, "result");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "unsignedIntValue");
  else
    return v2 != 0;
}

- (int)intResult
{
  id v2;

  v2 = -[DYFuture result](self, "result");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "intValue");
  else
    return v2 != 0;
}

- (void)_setResult:(id)a3 error:(id)a4 notify_NOLOCK:(BOOL)a5
{
  NSError *error;
  NSMutableArray *notifyList;
  void (**completion)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[DYFuture willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[DYFuture willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[NSCondition lock](self->_condition, "lock");
  if (self->_resolved)
    goto LABEL_16;
  if (a4)
  {
    error = self->_error;
    if (error != a4)
    {

      self->_error = (NSError *)a4;
    }
  }
  if (!a5)
  {
LABEL_16:
    -[NSCondition unlock](self->_condition, "unlock");
  }
  else
  {
    self->_result = a3;
    self->_resolved = 1;
    notifyList = self->_notifyList;
    self->_notifyList = 0;
    completion = (void (**)(_QWORD))self->_completion;
    self->_completion = 0;
    -[NSCondition broadcast](self->_condition, "broadcast");
    -[NSCondition unlock](self->_condition, "unlock");
    if (completion)
    {
      completion[2](completion);

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](notifyList, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(notifyList);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "start");
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](notifyList, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
  -[DYFuture didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  -[DYFuture didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (void)setResult:(id)a3
{
  -[DYFuture _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", a3, 0, 1);
}

- (NSError)error
{
  -[DYFuture waitUntilResolved](self, "waitUntilResolved");
  return self->_error;
}

- (void)cancel
{
  DYError *v3;

  -[NSCondition lock](self->_condition, "lock");
  self->_cancelled = 1;
  v3 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 1027, 0);

  self->_error = &v3->super;
  -[NSCondition unlock](self->_condition, "unlock");
  -[DYFuture _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", 0, self->_error, 1);
}

- (void)setError:(id)a3
{
  -[DYFuture _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", 0, a3, 0);
}

- (void)timeoutAfter:(double)a3 label:(id)a4
{
  _BOOL4 resolved;
  dispatch_time_t v7;
  NSObject *global_queue;
  _QWORD block[5];

  -[NSCondition lock](self->_condition, "lock", a4);
  resolved = self->_resolved;
  -[NSCondition unlock](self->_condition, "unlock");
  if (!resolved)
  {
    v7 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    global_queue = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__DYFuture_timeoutAfter_label___block_invoke;
    block[3] = &unk_250D62318;
    block[4] = self;
    dispatch_after(v7, global_queue, block);
  }
}

uint64_t __31__DYFuture_timeoutAfter_label___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 264);
  result = objc_msgSend(*(id *)(v2 + 256), "unlock");
  if (!v3)
    return objc_msgSend(*(id *)(a1 + 32), "_setResult:error:notify_NOLOCK:", 0, +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 5, 0), 1);
  return result;
}

- (void)resolveWithFuture:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[6];

  objc_msgSend(*((id *)a3 + 32), "lock");
  if (*((_BYTE *)a3 + 264))
  {
    v5 = *((_QWORD *)a3 + 34);
    v6 = *((_QWORD *)a3 + 35);
    objc_msgSend(*((id *)a3 + 32), "unlock");
    -[DYFuture _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", v5, v6, 1);
  }
  else
  {
    v7 = a3;
    v8 = (void *)*((_QWORD *)a3 + 36);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __30__DYFuture_resolveWithFuture___block_invoke;
    v9[3] = &unk_250D622A0;
    v9[4] = a3;
    v9[5] = self;
    objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v9));
    objc_msgSend(*((id *)a3 + 32), "unlock");
  }
}

void __30__DYFuture_resolveWithFuture___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 272);
  v4 = *(_QWORD *)(v2 + 280);
  objc_msgSend(*(id *)(v2 + 256), "unlock");
  objc_msgSend(*(id *)(a1 + 40), "_setResult:error:notify_NOLOCK:", v3, v4, 1);

}

- (void)notifyOnQueue:(id)a3 handler:(id)a4
{
  NSMutableArray *notifyList;
  _QWORD v8[6];

  -[NSCondition lock](self->_condition, "lock");
  if (self->_resolved)
  {
    -[NSCondition unlock](self->_condition, "unlock");
    dispatch_async((dispatch_queue_t)a3, a4);
  }
  else
  {
    dispatch_retain((dispatch_object_t)a3);
    notifyList = self->_notifyList;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __34__DYFuture_notifyOnQueue_handler___block_invoke;
    v8[3] = &unk_250D62AF8;
    v8[4] = a3;
    v8[5] = a4;
    -[NSMutableArray addObject:](notifyList, "addObject:", objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v8));
    -[NSCondition unlock](self->_condition, "unlock");
  }
}

void __34__DYFuture_notifyOnQueue_handler___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (void)notifyGroup:(id)a3
{
  NSMutableArray *notifyList;
  _QWORD v6[5];

  -[NSCondition lock](self->_condition, "lock");
  if (self->_resolved)
  {
    -[NSCondition unlock](self->_condition, "unlock");
  }
  else
  {
    dispatch_retain((dispatch_object_t)a3);
    dispatch_group_enter((dispatch_group_t)a3);
    notifyList = self->_notifyList;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __24__DYFuture_notifyGroup___block_invoke;
    v6[3] = &unk_250D62318;
    v6[4] = a3;
    -[NSMutableArray addObject:](notifyList, "addObject:", objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v6));
    -[NSCondition unlock](self->_condition, "unlock");
  }
}

void __24__DYFuture_notifyGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (void)_addDependency_REQUIRESLOCK:(id)a3
{
  NSMutableArray *inflightDependencies;
  _QWORD v6[6];

  inflightDependencies = self->_inflightDependencies;
  if (!inflightDependencies)
  {
    inflightDependencies = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_inflightDependencies = inflightDependencies;
  }
  if ((-[NSMutableArray containsObject:](inflightDependencies, "containsObject:", a3) & 1) == 0)
  {
    if ((objc_msgSend(a3, "isFinished") & 1) == 0)
      -[NSMutableArray addObject:](self->_inflightDependencies, "addObject:", a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __40__DYFuture__addDependency_REQUIRESLOCK___block_invoke;
      v6[3] = &unk_250D62B20;
      v6[4] = self;
      v6[5] = a3;
      objc_msgSend(a3, "addResultHandler:", v6);
    }
    else
    {
      objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("isFinished"), 1, 0);
    }
  }
}

uint64_t __40__DYFuture__addDependency_REQUIRESLOCK___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "broadcast");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "unlock");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSCondition lock](self->_condition, "lock");
    -[NSMutableArray removeObject:](self->_inflightDependencies, "removeObject:", a4);
    -[NSCondition broadcast](self->_condition, "broadcast");
    -[NSCondition unlock](self->_condition, "unlock");
  }
}

- (BOOL)_waitForDependencies_REQUIRESLOCK
{
  while (-[NSMutableArray count](self->_inflightDependencies, "count"))
  {
    if (self->_cancelled)
      break;
    -[NSCondition wait](self->_condition, "wait");
  }
  return !self->_cancelled;
}

- (id)_dependencies_NOLOCK
{
  void *v3;

  -[NSCondition lock](self->_condition, "lock");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_inflightDependencies);
  -[NSCondition unlock](self->_condition, "unlock");
  return v3;
}

- (BOOL)resolved
{
  return self->_resolved;
}

@end
