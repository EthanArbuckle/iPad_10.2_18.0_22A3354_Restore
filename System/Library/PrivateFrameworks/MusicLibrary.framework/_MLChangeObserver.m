@implementation _MLChangeObserver

- (_MLChangeObserver)init
{
  _MLChangeObserver *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MLChangeObserver;
  result = -[_MLChangeObserver init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[_MLChangeObserver tearDownTaskAssertion](self, "tearDownTaskAssertion");
  -[_MLChangeObserver tearDownTimeoutTimer](self, "tearDownTimeoutTimer");
  v3.receiver = self;
  v3.super_class = (Class)_MLChangeObserver;
  -[_MLChangeObserver dealloc](&v3, sel_dealloc);
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  _MLChangeObserver *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - newPath=%{public}@", buf, 0x16u);
  }

  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke;
  v20[3] = &unk_1E5B64CC8;
  v20[4] = self;
  v21 = v7;
  v10 = v7;
  v11 = (void *)MEMORY[0x1AF43CDE0](v20);
  os_unfair_lock_lock(&self->_lock);
  -[_MLChangeObserver setupTaskAssertion](self, "setupTaskAssertion");
  -[_MLChangeObserver setupTimeoutTimer](self, "setupTimeoutTimer");
  os_unfair_lock_unlock(&self->_lock);
  -[_MLChangeObserver connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke_2;
  v18[3] = &unk_1E5B647D0;
  v18[4] = self;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke_4;
  v16[3] = &unk_1E5B64CC8;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "performDatabasePathChange:completion:", v6, v16);

}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)terminateForFailureToPerformDatabasePathChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  _MLChangeObserver *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "%{public}@ - terminateForFailureToPerformDatabasePathChange", buf, 0xCu);
  }

  -[_MLChangeObserver connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67___MLChangeObserver_terminateForFailureToPerformDatabasePathChange__block_invoke;
  v6[3] = &unk_1E5B63CD0;
  v6[4] = self;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "terminateForFailureToPerformDatabasePathChange");

  -[_MLChangeObserver setConnection:](self, "setConnection:", 0);
}

- (void)setConnection:(id)a3
{
  id v5;
  NSString *v6;
  NSString *bundleID;

  v5 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  if (v5)
  {
    objc_msgSend(v5, "auditToken");
    MSVBundleIDForAuditToken();
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleID = self->_bundleID;
    self->_bundleID = v6;
  }
  else
  {
    bundleID = self->_bundleID;
    self->_bundleID = 0;
  }

}

- (NSString)bundleID
{
  void *v3;
  NSString *v4;
  void *v5;

  -[_MLChangeObserver connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = self->_bundleID;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_MLChangeObserver bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MLChangeObserver connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("_MLChangeObserver <%p> - Observer for %@[%d]"), self, v4, objc_msgSend(v5, "processIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setupTaskAssertion
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  _MLChangeObserver *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D4D108]);
  -[_MLChangeObserver connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "processIdentifier");
  -[_MLChangeObserver bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithName:pid:bundleID:subsystem:reason:flags:", CFSTR("Processing shared database path change"), v5, v6, CFSTR("com.apple.medialibraryd"), 2, 3);
  -[_MLChangeObserver setTaskAssertion:](self, "setTaskAssertion:", v7);

  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[_MLChangeObserver taskAssertion](self, "taskAssertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ - setupTaskAssertion: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)tearDownTaskAssertion
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  _MLChangeObserver *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_MLChangeObserver taskAssertion](self, "taskAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - tearDownTaskAssertion", (uint8_t *)&v6, 0xCu);
    }

    -[_MLChangeObserver taskAssertion](self, "taskAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[_MLChangeObserver setTaskAssertion:](self, "setTaskAssertion:", 0);
  }
}

- (void)setupTimeoutTimer
{
  void *v3;
  NSObject *v4;
  dispatch_source_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  pid_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _MLChangeObserver *v20;
  id v21;
  pid_t v22;
  uint8_t buf[4];
  _MLChangeObserver *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[_MLChangeObserver tearDownTimeoutTimer](self, "tearDownTimeoutTimer");
  -[_MLChangeObserver timeoutTimer](self, "timeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - setupTimeoutTimerWithcompletion:", buf, 0xCu);
    }

    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
    -[_MLChangeObserver setTimeoutTimer:](self, "setTimeoutTimer:", v5);

    v6 = dispatch_time(0, 10000000000);
    -[_MLChangeObserver timeoutTimer](self, "timeoutTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v7, v6, 0xFFFFFFFFFFFFFFFFLL, 0);

    objc_initWeak((id *)buf, self);
    -[_MLChangeObserver bundleID](self, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MLChangeObserver connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = v9 == 0;

    if ((v6 & 1) != 0)
    {
      v11 = getpid();
    }
    else
    {
      -[_MLChangeObserver connection](self, "connection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "processIdentifier");

    }
    -[_MLChangeObserver timeoutTimer](self, "timeoutTimer");
    v12 = objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __38___MLChangeObserver_setupTimeoutTimer__block_invoke;
    v18 = &unk_1E5B63CF8;
    objc_copyWeak(&v21, (id *)buf);
    v13 = v8;
    v22 = v11;
    v19 = v13;
    v20 = self;
    dispatch_source_set_event_handler(v12, &v15);

    -[_MLChangeObserver timeoutTimer](self, "timeoutTimer", v15, v16, v17, v18);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v14);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)tearDownTimeoutTimer
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  _MLChangeObserver *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_MLChangeObserver timeoutTimer](self, "timeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - tearDownTimeoutTimer", (uint8_t *)&v6, 0xCu);
    }

    -[_MLChangeObserver timeoutTimer](self, "timeoutTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v5);

    -[_MLChangeObserver setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (MSVTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTaskAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_taskAssertion, a3);
}

- (BOOL)hasTimedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (id)observerWithConnection:(id)a3
{
  id v3;
  _MLChangeObserver *v4;

  v3 = a3;
  v4 = objc_alloc_init(_MLChangeObserver);
  -[_MLChangeObserver setConnection:](v4, "setConnection:", v3);

  return v4;
}

@end
