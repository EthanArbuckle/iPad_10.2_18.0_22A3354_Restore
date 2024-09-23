@implementation PBFPPTBlockOperation

+ (PBFPPTBlockOperation)operationWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", v4);

  return (PBFPPTBlockOperation *)v5;
}

+ (PBFPPTBlockOperation)operationWithName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithName:block:", v7, v6);

  return (PBFPPTBlockOperation *)v8;
}

- (PBFPPTBlockOperation)initWithBlock:(id)a3
{
  id v4;
  PBFPPTBlockOperation *v5;
  PBFPPTBlockOperation *v6;
  id v7;
  id block;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBFPPTBlockOperation;
  v5 = -[PBFPPTOperation init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v5->_timeoutInterval = 15.0;
    v5->_state = 0;
    v7 = objc_msgSend(v4, "copy");
    block = v6->_block;
    v6->_block = v7;

  }
  return v6;
}

- (PBFPPTBlockOperation)initWithName:(id)a3 block:(id)a4
{
  id v6;
  PBFPPTBlockOperation *v7;
  PBFPPTBlockOperation *v8;

  v6 = a3;
  v7 = -[PBFPPTBlockOperation initWithBlock:](self, "initWithBlock:", a4);
  v8 = v7;
  if (v7)
    -[PBFPPTOperation setOperationName:](v7, "setOperationName:", v6);

  return v8;
}

- (PBFPPTBlockOperation)init
{
  return -[PBFPPTBlockOperation initWithName:block:](self, "initWithName:block:", CFSTR("(anonymous PBFPPTBlockOperation)"), &stru_10000C938);
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = -[PBFPPTBlockOperation state](self, "state");
  v5 = CFSTR("Pending");
  if (v4 == 2)
    v5 = CFSTR("Finished");
  if (v4 == 1)
    v6 = CFSTR("Executing");
  else
    v6 = v5;
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("state"));
  v7 = objc_msgSend(v3, "appendFloat:withName:", CFSTR("timeoutInterval"), self->_timeoutInterval);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBFPPTOperation operationName](self, "operationName"));
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("operationName"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));
  return v9;
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("state"), 0);
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("state"), 0);
}

- (void)finish
{
  dispatch_block_t block;

  block = (dispatch_block_t)objc_claimAutoreleasedReturnValue(-[PBFPPTBlockOperation timeoutBlock](self, "timeoutBlock"));
  if (block)
  {
    dispatch_block_cancel(block);
    -[PBFPPTBlockOperation setTimeoutBlock:](self, "setTimeoutBlock:", 0);
  }
  -[PBFPPTBlockOperation setState:](self, "setState:", 2);
  -[PBFPPTOperation operationDidFinish](self, "operationDidFinish");

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBFPPTBlockOperation;
  -[PBFPPTBlockOperation cancel](&v3, "cancel");
  self->_cancelled = 1;
  -[PBFPPTBlockOperation finish](self, "finish");
}

- (void)cancelAndFailTestWithReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PBFPPTBlockOperation *v8;
  objc_super v9;
  uint8_t buf[4];
  PBFPPTBlockOperation *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "runningPPTTestName"));
  objc_msgSend(UIApp, "failedTest:withFailure:", v5, v4);
  v9.receiver = self;
  v9.super_class = (Class)PBFPPTBlockOperation;
  -[PBFPPTBlockOperation cancel](&v9, "cancel");
  self->_cancelled = 1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[PBFPPTOperation operationName](self, "operationName"));
    v7 = (void *)v6;
    if (v6)
      v8 = (PBFPPTBlockOperation *)v6;
    else
      v8 = self;
    *(_DWORD *)buf = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' cancelled for reason: %@", buf, 0x16u);

  }
  -[PBFPPTBlockOperation finish](self, "finish");

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return (id)-[PBFPPTBlockOperation state](self, "state") == (id)1;
}

- (BOOL)isFinished
{
  return (id)-[PBFPPTBlockOperation state](self, "state") == (id)2;
}

- (void)start
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBFPPTBlockOperation dependencies](self, "dependencies", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "isCancelled") & 1) != 0)
        {
          -[PBFPPTBlockOperation cancel](self, "cancel");

          return;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
        continue;
      break;
    }
  }

  if ((-[PBFPPTBlockOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (-[PBFPPTBlockOperation isExecuting](self, "isExecuting"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100007CAC(self);
    }
    else if (-[PBFPPTBlockOperation isFinished](self, "isFinished"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100007D2C(self);
    }
    else
    {
      -[PBFPPTBlockOperation setState:](self, "setState:", 1);
      -[PBFPPTBlockOperation main](self, "main");
    }
  }
}

- (void)main
{
  double v3;
  double v4;
  dispatch_block_t v5;
  dispatch_time_t v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD v8[6];

  -[PBFPPTBlockOperation timeoutInterval](self, "timeoutInterval");
  v4 = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000079CC;
  v8[3] = &unk_10000C960;
  v8[4] = self;
  *(double *)&v8[5] = v3;
  v5 = dispatch_block_create((dispatch_block_flags_t)0, v8);
  -[PBFPPTBlockOperation setTimeoutBlock:](self, "setTimeoutBlock:", v5);
  v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v5);
  -[PBFPPTOperation operationWillStart](self, "operationWillStart");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PBFPPTBlockOperation block](self, "block"));
  ((void (**)(_QWORD, PBFPPTBlockOperation *))v7)[2](v7, self);

}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (id)timeoutBlock
{
  return objc_loadWeakRetained(&self->_timeoutBlock);
}

- (void)setTimeoutBlock:(id)a3
{
  objc_storeWeak(&self->_timeoutBlock, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_destroyWeak(&self->_timeoutBlock);
}

@end
