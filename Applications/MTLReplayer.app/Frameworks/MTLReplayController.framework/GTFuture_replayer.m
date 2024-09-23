@implementation GTFuture_replayer

- (GTFuture_replayer)init
{
  GTFuture_replayer *v2;
  NSCondition *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTFuture_replayer;
  v2 = -[GTFuture_replayer init](&v5, "init");
  if (v2)
  {
    v3 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    v2->_condition = v3;
    -[NSCondition lock](v3, "lock");
    v2->_notifyList = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
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
  id v3;
  NSCondition *condition;
  objc_super v5;

  v3 = +[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 1028, 0);
  -[NSCondition lock](self->_condition, "lock");
  if (!self->_resolved)
  {
    -[NSCondition unlock](self->_condition, "unlock");
    -[GTFuture_replayer _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", 0, v3, 1);
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
  v5.super_class = (Class)GTFuture_replayer;
  -[GTFuture_replayer dealloc](&v5, "dealloc");
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
  v3 = objc_msgSend(self->_completion, "copy");
  -[NSCondition unlock](self->_condition, "unlock");
  return v3;
}

- (void)setCompletionBlock:(id)a3
{
  -[NSCondition lock](self->_condition, "lock");
  self->_completion = objc_msgSend(a3, "copy");
  -[NSCondition unlock](self->_condition, "unlock");
}

- (void)_start_NOLOCK
{
  -[GTFuture_replayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[NSCondition lock](self->_condition, "lock");
  if (!self->_started && !self->_cancelled && !self->_resolved)
    self->_started = 1;
  -[NSCondition unlock](self->_condition, "unlock");
  -[GTFuture_replayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
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
  -[GTFuture_replayer _addDependency_REQUIRESLOCK:](self, "_addDependency_REQUIRESLOCK:", a3);
  -[NSCondition unlock](self->_condition, "unlock");
}

- (void)waitUntilResolved
{
  NSDate *v3;
  _BOOL8 resolved;
  double v5;
  double v6;
  NSString *v7;
  uint64_t v8;
  NSString *v9;
  NSFileHandle *v10;
  NSFileHandle *v11;
  uint64_t v12;

  +[NSThread isMainThread](NSThread, "isMainThread");
  if (+[GTFuture_replayer logPerformance](GTFuture_replayer, "logPerformance"))
  {
    v3 = +[NSDate date](NSDate, "date");
    resolved = self->_resolved;
  }
  else
  {
    resolved = 0;
    v3 = 0;
  }
  -[GTFuture_replayer _start_NOLOCK](self, "_start_NOLOCK");
  -[GTFuture_replayer waitUntilFinished](self, "waitUntilFinished");
  if (+[GTFuture_replayer logPerformance](GTFuture_replayer, "logPerformance"))
  {
    -[NSDate timeIntervalSinceNow](v3, "timeIntervalSinceNow");
    v6 = -v5;
    v7 = -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("GPUDebugger.DYFuture.csv"));
    -[NSDate timeIntervalSinceReferenceDate](+[NSDate date](NSDate, "date"), "timeIntervalSinceReferenceDate");
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f, %@, %@, %f, %d, %d\n"), v8, -[NSThread valueForKeyPath:](+[NSThread currentThread](NSThread, "currentThread"), "valueForKeyPath:", CFSTR("private.seqNum")), -[NSArray componentsJoinedByString:](+[NSThread callStackSymbols](NSThread, "callStackSymbols"), "componentsJoinedByString:", CFSTR(" | ")), *(_QWORD *)&v6, resolved, +[NSThread isMainThread](NSThread, "isMainThread"));
    v10 = +[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", v7);
    if (v10)
    {
      v11 = v10;
      -[NSFileHandle seekToEndOfFile](v10, "seekToEndOfFile");
      -[NSFileHandle writeData:](v11, "writeData:", -[NSString dataUsingEncoding:](v9, "dataUsingEncoding:", 4));
      -[NSFileHandle closeFile](v11, "closeFile");
    }
    else
    {
      v12 = 0;
      objc_msgSend(objc_msgSend(CFSTR("Timestamp, Thread, Symbol, Interval, Resolved, Main Thread\n"), "stringByAppendingString:", v9), "writeToFile:atomically:encoding:error:", v7, 1, 4, &v12);
    }
    if (!-[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", CFSTR("GPUDebugger.DYFuture.HardAssertMainThread")))-[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", CFSTR("GPUDebugger.DYFuture.SoftAssertMainThread"));
  }
}

- (id)result
{
  -[GTFuture_replayer waitUntilResolved](self, "waitUntilResolved");
  return self->_result;
}

- (void)addResultHandler:(id)a3
{
  id result;
  NSError *error;
  id v7;
  NSObject *global_queue;
  id v9;
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
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __29__GTFuture_addResultHandler___block_invoke;
    block[3] = &unk_725168;
    block[5] = error;
    block[6] = v7;
    block[4] = result;
    dispatch_async(global_queue, block);
  }
  else
  {
    v9 = objc_msgSend(a3, "copy");
    notifyList = self->_notifyList;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __29__GTFuture_addResultHandler___block_invoke_2;
    v11[3] = &unk_725A70;
    v11[4] = self;
    v11[5] = v9;
    -[NSMutableArray addObject:](notifyList, "addObject:", +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v11));
    -[NSCondition unlock](self->_condition, "unlock");
  }
}

- (void)requestResult:(id)a3
{
  -[GTFuture_replayer addResultHandler:](self, "addResultHandler:", a3);
  -[GTFuture_replayer _start_NOLOCK](self, "_start_NOLOCK");
}

- (BOOL)BOOLResult
{
  id v2;

  v2 = -[GTFuture_replayer result](self, "result");
  if ((objc_opt_respondsToSelector(v2, "BOOLValue") & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return v2 != 0;
}

- (unsigned)uint32Result
{
  id v2;

  v2 = -[GTFuture_replayer result](self, "result");
  if ((objc_opt_respondsToSelector(v2, "unsignedIntValue") & 1) != 0)
    return objc_msgSend(v2, "unsignedIntValue");
  else
    return v2 != 0;
}

- (int)intResult
{
  id v2;

  v2 = -[GTFuture_replayer result](self, "result");
  if ((objc_opt_respondsToSelector(v2, "intValue") & 1) != 0)
    return objc_msgSend(v2, "intValue");
  else
    return v2 != 0;
}

- (void)_setResult:(id)a3 error:(id)a4 notify_NOLOCK:(BOOL)a5
{
  NSError *error;
  NSMutableArray *notifyList;
  void (**completion)(_QWORD);
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  -[GTFuture_replayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[GTFuture_replayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
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
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(notifyList);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "start");
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](notifyList, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
  -[GTFuture_replayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  -[GTFuture_replayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (void)setResult:(id)a3
{
  -[GTFuture_replayer _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", a3, 0, 1);
}

- (id)error
{
  -[GTFuture_replayer waitUntilResolved](self, "waitUntilResolved");
  return self->_error;
}

- (void)cancel
{
  NSError *v3;

  -[NSCondition lock](self->_condition, "lock");
  self->_cancelled = 1;
  v3 = (NSError *)+[GTError_replayer errorWithDomain:code:userInfo:](GTError_replayer, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 1027, 0);

  self->_error = v3;
  -[NSCondition unlock](self->_condition, "unlock");
  -[GTFuture_replayer _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", 0, self->_error, 1);
}

- (void)setError:(id)a3
{
  -[GTFuture_replayer _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", 0, a3, 0);
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
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __31__GTFuture_timeoutAfter_label___block_invoke;
    block[3] = &unk_726128;
    block[4] = self;
    dispatch_after(v7, global_queue, block);
  }
}

- (void)resolveWithFuture:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[6];

  objc_msgSend(*((id *)a3 + 2), "lock");
  if (*((_BYTE *)a3 + 24))
  {
    v5 = *((_QWORD *)a3 + 4);
    v6 = *((_QWORD *)a3 + 5);
    objc_msgSend(*((id *)a3 + 2), "unlock");
    -[GTFuture_replayer _setResult:error:notify_NOLOCK:](self, "_setResult:error:notify_NOLOCK:", v5, v6, 1);
  }
  else
  {
    v7 = a3;
    v8 = (void *)*((_QWORD *)a3 + 6);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __30__GTFuture_resolveWithFuture___block_invoke;
    v9[3] = &unk_725190;
    v9[4] = a3;
    v9[5] = self;
    objc_msgSend(v8, "addObject:", +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v9));
    objc_msgSend(*((id *)a3 + 2), "unlock");
  }
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
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __34__GTFuture_notifyOnQueue_handler___block_invoke;
    v8[3] = &unk_725A70;
    v8[4] = a3;
    v8[5] = a4;
    -[NSMutableArray addObject:](notifyList, "addObject:", +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v8));
    -[NSCondition unlock](self->_condition, "unlock");
  }
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
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __24__GTFuture_notifyGroup___block_invoke;
    v6[3] = &unk_726128;
    v6[4] = a3;
    -[NSMutableArray addObject:](notifyList, "addObject:", +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v6));
    -[NSCondition unlock](self->_condition, "unlock");
  }
}

- (void)_addDependency_REQUIRESLOCK:(id)a3
{
  NSMutableArray *inflightDependencies;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  inflightDependencies = self->_inflightDependencies;
  if (!inflightDependencies)
  {
    inflightDependencies = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_inflightDependencies = inflightDependencies;
  }
  if ((-[NSMutableArray containsObject:](inflightDependencies, "containsObject:", a3) & 1) == 0)
  {
    if ((objc_msgSend(a3, "isFinished") & 1) == 0)
      -[NSMutableArray addObject:](self->_inflightDependencies, "addObject:", a3);
    v7 = objc_opt_class(GTFuture_replayer, v6);
    if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = __40__GTFuture__addDependency_REQUIRESLOCK___block_invoke;
      v8[3] = &unk_7251B8;
      v8[4] = self;
      v8[5] = a3;
      objc_msgSend(a3, "addResultHandler:", v8);
    }
    else
    {
      objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("isFinished"), 1, 0);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v8;

  v8 = objc_opt_class(NSOperation, a2);
  if ((objc_opt_isKindOfClass(a4, v8) & 1) != 0)
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
  NSArray *v3;

  -[NSCondition lock](self->_condition, "lock");
  v3 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_inflightDependencies);
  -[NSCondition unlock](self->_condition, "unlock");
  return v3;
}

+ (id)future
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_opt_class(a1, a2);
  return (id)objc_opt_new(v2, v3);
}

+ (id)futureWithResult:(id)a3 error:(id)a4
{
  id v6;

  v6 = objc_msgSend(a1, "future");
  objc_msgSend(v6, "setError:", a4);
  objc_msgSend(v6, "setResult:", a3);
  return v6;
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
  v6.super_class = (Class)&OBJC_METACLASS___GTFuture_replayer;
  return objc_msgSendSuper2(&v6, "automaticallyNotifiesObserversForKey:", a3);
}

+ (BOOL)logPerformance
{
  if (+[GTFuture logPerformance]::onceToken != -1)
    dispatch_once(&+[GTFuture logPerformance]::onceToken, &__block_literal_global_1181);
  return +[GTFuture logPerformance]::log;
}

@end
