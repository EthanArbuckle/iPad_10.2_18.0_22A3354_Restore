@implementation DMTTimeoutOperation

- (DMTTimeoutOperation)initWithOperation:(id)a3 timeout:(double)a4 cancelsOnTimeout:(BOOL)a5
{
  id v9;
  DMTTimeoutOperation *v10;
  DMTTimeoutOperation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMTTimeoutOperation;
  v10 = -[DMTTimeoutOperation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_observedOperation, a3);
    v11->_timeoutInterval = a4;
    v11->_cancelsOnTimeout = a5;
  }

  return v11;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMTTimeoutOperation;
  -[DMTTimeoutOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__DMTTimeoutOperation_cancel__block_invoke;
  block[3] = &unk_24E59FCE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __29__DMTTimeoutOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "timeoutTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidate");

    v3 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endOperationWithError:", v4);

  }
}

- (void)main
{
  id v4;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (-[DMTTimeoutOperation isExecuting](self, "isExecuting"))
    {
      if (-[DMTTimeoutOperation isCancelled](self, "isCancelled"))
      {
        CATErrorWithCodeAndUserInfo();
        v4 = (id)objc_claimAutoreleasedReturnValue();
        -[DMTTimeoutOperation endOperationWithError:](self, "endOperationWithError:", v4);

      }
      else
      {
        -[DMTTimeoutOperation beginWaitingForOperation](self, "beginWaitingForOperation");
      }
    }
  }
  else
  {
    -[DMTTimeoutOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)beginWaitingForOperation
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[DMTTimeoutOperation observedOperation](self, "observedOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  -[DMTTimeoutOperation observedOperation](self, "observedOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  -[DMTTimeoutOperation observedOperation](self, "observedOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (!v5)
  {
    objc_msgSend(v6, "addTarget:selector:forOperationEvents:", self, sel_innerOperationDidFinish_, 6);

    -[DMTTimeoutOperation observedOperation](self, "observedOperation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startedDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[DMTTimeoutOperation observedOperation](self, "observedOperation");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addTarget:selector:forOperationEvents:", self, sel_createTimer, 1);
      goto LABEL_7;
    }
LABEL_5:
    -[DMTTimeoutOperation createTimer](self, "createTimer");
    return;
  }
  -[DMTTimeoutOperation innerOperationDidFinish:](self, "innerOperationDidFinish:", v6);
LABEL_7:

}

- (void)createTimer
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDBCF40];
  -[DMTTimeoutOperation timeoutInterval](self, "timeoutInterval");
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_timerDidFire_, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DMTTimeoutOperation setTimeoutTimer:](self, "setTimeoutTimer:", v4);

}

- (void)timerDidFire:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  if (-[DMTTimeoutOperation isExecuting](self, "isExecuting", a3))
  {
    if (-[DMTTimeoutOperation isCancelled](self, "isCancelled"))
    {
      CATErrorWithCodeAndUserInfo();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[DMTTimeoutOperation cancelsOnTimeout](self, "cancelsOnTimeout"))
      {
        -[DMTTimeoutOperation observedOperation](self, "observedOperation");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cancel");

      }
      DMTErrorWithCodeAndUserInfo(4, 0);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (id)v4;
    -[DMTTimeoutOperation endOperationWithError:](self, "endOperationWithError:", v4);

  }
}

- (void)innerOperationDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[DMTTimeoutOperation isExecuting](self, "isExecuting"))
  {
    if (-[DMTTimeoutOperation isCancelled](self, "isCancelled"))
    {
      CATErrorWithCodeAndUserInfo();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMTTimeoutOperation endOperationWithError:](self, "endOperationWithError:", v4);

    }
    else
    {
      -[DMTTimeoutOperation timeoutTimer](self, "timeoutTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidate");

      -[DMTTimeoutOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v6);
    }
  }

}

- (CATOperation)observedOperation
{
  return self->_observedOperation;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (BOOL)cancelsOnTimeout
{
  return self->_cancelsOnTimeout;
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_observedOperation, 0);
}

@end
