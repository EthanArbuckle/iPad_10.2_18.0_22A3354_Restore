@implementation LNConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_requestTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_activityProvider, 0);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  LNConnectionOperation *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LNConnectionOperation queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  getLNLogCategoryConnection();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v16 = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v4;
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    v16 = 138543362;
    v17 = self;
    v9 = v7;
    v10 = OS_LOG_TYPE_INFO;
    v11 = 12;
  }
  _os_log_impl(&dword_1A18F6000, v9, v10, v8, (uint8_t *)&v16, v11);
LABEL_7:

  -[LNConnectionOperation requestTimer](self, "requestTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cancel");

  -[LNConnectionOperation connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[LNConnectionOperation connection](self, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "connectionOperation:didFinishWithError:", self, v4);

  }
}

- (LNWatchdogTimer)requestTimer
{
  return self->_requestTimer;
}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  LNConnectionOperation *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[LNConnectionOperation queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  getLNLogCategoryConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "Starting operation %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[LNConnectionOperation setRequestTimer](self, "setRequestTimer");
  -[LNConnectionOperation connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[LNConnectionOperation connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connectionOperationWillStart:", self);

  }
}

- (LNConnectionOperationDelegate)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setRequestTimer
{
  double v3;
  LNWatchdogTimer *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  LNWatchdogTimer *v9;
  LNWatchdogTimer *requestTimer;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  -[LNConnectionOperation timeout](self, "timeout");
  if (v3 != *(double *)&LNConnectionOperationRequestTimeoutDisabled)
  {
    objc_initWeak(&location, self);
    v4 = [LNWatchdogTimer alloc];
    -[LNConnectionOperation timeout](self, "timeout");
    v6 = v5;
    -[LNConnectionOperation connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __40__LNConnectionOperation_setRequestTimer__block_invoke;
    v14 = &unk_1E45DDEF8;
    objc_copyWeak(&v15, &location);
    v9 = -[LNWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v4, "initWithTimeoutInterval:onQueue:timeoutHandler:", v8, &v11, v6);
    requestTimer = self->_requestTimer;
    self->_requestTimer = v9;

    -[LNWatchdogTimer start](self->_requestTimer, "start", v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (double)timeout
{
  return *(double *)&LNConnectionOperationRequestTimeout;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_os_activity)activity
{
  OS_os_activity *activity;
  OS_os_activity *v4;
  OS_os_activity *v5;
  id activityProvider;

  activity = self->_activity;
  if (!activity)
  {
    (*((void (**)(void))self->_activityProvider + 2))();
    v4 = (OS_os_activity *)objc_claimAutoreleasedReturnValue();
    v5 = self->_activity;
    self->_activity = v4;

    activityProvider = self->_activityProvider;
    self->_activityProvider = 0;

    activity = self->_activity;
  }
  return activity;
}

- (LNConnectionOperation)initWithIdentifier:(id)a3 priority:(int64_t)a4 queue:(id)a5 activity:(id)a6
{
  id v11;
  id v12;
  id v13;
  LNConnectionOperation *v14;
  uint64_t v15;
  NSUUID *identifier;
  void *v17;
  id activityProvider;
  LNConnectionOperation *v19;
  void *v21;
  objc_super v22;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnectionOperation.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v22.receiver = self;
  v22.super_class = (Class)LNConnectionOperation;
  v14 = -[LNConnectionOperation init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v15;

    v14->_priority = a4;
    v17 = _Block_copy(v13);
    activityProvider = v14->_activityProvider;
    v14->_activityProvider = v17;

    objc_storeStrong((id *)&v14->_queue, a5);
    v19 = v14;
  }

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnectionOperation identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNConnectionOperation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)cancelTimeout
{
  double v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[LNConnectionOperation timeout](self, "timeout");
  if (v3 != *(double *)&LNConnectionOperationRequestTimeoutDisabled)
  {
    getLNLogCategoryConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[LNConnectionOperation identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "Canceling timeout for operation with identifier %{public}@", (uint8_t *)&v7, 0xCu);

    }
    -[LNConnectionOperation requestTimer](self, "requestTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

  }
}

- (void)extendTimeout
{
  double v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[LNConnectionOperation timeout](self, "timeout");
  if (v3 != *(double *)&LNConnectionOperationRequestTimeoutDisabled)
  {
    getLNLogCategoryConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[LNConnectionOperation identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "Extending timeout for operation with identifier %{public}@", (uint8_t *)&v7, 0xCu);

    }
    -[LNConnectionOperation requestTimer](self, "requestTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    -[LNConnectionOperation setRequestTimer](self, "setRequestTimer");
  }
}

- (id)validatingResult:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = 0;
  }
  else
  {
    if (v6)
    {
      v9 = v6;
    }
    else
    {
      LNConnectionErrorWithCode(1014);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }

  return v8;
}

void __40__LNConnectionOperation_setRequestTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "targetIsBeingDebugged");

  if ((v3 & 1) == 0)
  {
    getLNLogCategoryConnection();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543618;
      v7 = WeakRetained;
      v8 = 2050;
      v9 = LNConnectionOperationRequestTimeout;
    }

    LNConnectionErrorWithCode(1002);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "finishWithError:", v5);

  }
}

@end
