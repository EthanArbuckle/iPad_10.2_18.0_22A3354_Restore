@implementation CoreDAVTaskGroup

- (CoreDAVTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  id v6;
  id v7;
  CoreDAVTaskGroup *v8;
  CoreDAVTaskGroup *v9;
  NSMutableSet *v10;
  NSMutableSet *outstandingTasks;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CoreDAVTaskGroup;
  v8 = -[CoreDAVTaskGroup init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accountInfoProvider, v6);
    objc_storeWeak((id *)&v9->_taskManager, v7);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    outstandingTasks = v9->_outstandingTasks;
    v9->_outstandingTasks = v10;

    v9->_timeoutInterval = 240.0;
  }

  return v9;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[NSMutableSet count](self->_outstandingTasks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTaskGroup.m"), 45, CFSTR("We should never finish a task group with an existing task.  I have %@"), self->_outstandingTasks);

  }
  objc_storeWeak((id *)&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)CoreDAVTaskGroup;
  -[CoreDAVTaskGroup dealloc](&v5, sel_dealloc);
}

- (void)startTaskGroup
{
  CDVAbstractMethod();
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v4, 0);

}

- (void)_tearDownAllTasks
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->_isTearingDown)
  {
    self->_isTearingDown = 1;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
    v4 = (void *)-[NSMutableSet copy](self->_outstandingTasks, "copy");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "finishEarlyWithError:", v3, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)bailWithError:(id)a3
{
  id v4;

  if (!self->_isCancelling)
  {
    self->_isCancelling = 1;
    v4 = a3;
    -[CoreDAVTaskGroup _tearDownAllTasks](self, "_tearDownAllTasks");
    -[CoreDAVTaskGroup taskGroupWillCancelWithError:](self, "taskGroupWillCancelWithError:", v4);

  }
}

- (void)cancelTaskGroup
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
  -[CoreDAVTaskGroup bailWithError:](self, "bailWithError:", v3);

}

- (void)finishCoreDAVTaskGroupWithError:(id)a3 delegateCallbackBlock:(id)a4
{
  void (**v6)(_QWORD);
  CoreDAVTaskGroup *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  id v11;

  v11 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (!self->_isFinished)
  {
    self->_isFinished = 1;
    -[CoreDAVTaskGroup setError:](self, "setError:", v11);
    v7 = self;
    -[CoreDAVTaskGroup delegate](v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v6[2](v6);
    -[CoreDAVTaskGroup completionBlock](v7, "completionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CoreDAVTaskGroup completionBlock](v7, "completionBlock");
      v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v10[2]();

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "taskGroup:didFinishWithError:", v7, v11);
    }
    -[CoreDAVTaskGroup setProgressBlock:](v7, "setProgressBlock:", 0);
    -[CoreDAVTaskGroup setCompletionBlock:](v7, "setCompletionBlock:", 0);

  }
}

- (void)finishCoreDAVTaskGroupWithError:(id)a3
{
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", a3, 0);
}

- (void)finishEarlyWithError:(id)a3
{
  -[CoreDAVTaskGroup bailWithError:](self, "bailWithError:", a3);
  -[CoreDAVTaskGroup setDelegate:](self, "setDelegate:", 0);
}

- (void)submitWithTaskManager:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  CoreDAVTaskGroup *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[CoreDAVTaskGroup setTaskManager:](self, "setTaskManager:");
    -[CoreDAVTaskGroup startTaskGroup](self, "startTaskGroup");
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logHandleForAccountInfoProvider:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412290;
        v9 = self;
        _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_ERROR, "TaskGroup %@ submitted with no taskManager, returning immediately", (uint8_t *)&v8, 0xCu);
      }
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    -[CoreDAVTaskGroup finishEarlyWithError:](self, "finishEarlyWithError:", v7);

  }
}

- (CoreDAVAccountInfoProvider)accountInfoProvider
{
  return (CoreDAVAccountInfoProvider *)objc_loadWeakRetained((id *)&self->_accountInfoProvider);
}

- (void)setAccountInfoProvider:(id)a3
{
  objc_storeWeak((id *)&self->_accountInfoProvider, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CoreDAVTaskGroupDelegate)delegate
{
  return (CoreDAVTaskGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableSet)outstandingTasks
{
  return self->_outstandingTasks;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CoreDAVTaskManager)taskManager
{
  return (CoreDAVTaskManager *)objc_loadWeakRetained((id *)&self->_taskManager);
}

- (void)setTaskManager:(id)a3
{
  objc_storeWeak((id *)&self->_taskManager, a3);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outstandingTasks, 0);
  objc_destroyWeak((id *)&self->_accountInfoProvider);
  objc_destroyWeak((id *)&self->_taskManager);
}

@end
