@implementation DrainOperation

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSCondition *v8;
  NSCondition *pauseLock;

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100009110((uint64_t)self, (uint64_t)v4, v5, v6);

  if ((-[DrainOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[DrainOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    -[DrainOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_finished = 0;
    self->_executing = 1;
    v8 = (NSCondition *)objc_opt_new(NSCondition, v7);
    pauseLock = self->_pauseLock;
    self->_pauseLock = v8;

    self->_isPaused = 0;
    -[DrainOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
    -[DrainOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    if ((-[DrainOperation isCancelled](self, "isCancelled") & 1) == 0)
      -[DrainOperation main](self, "main");
  }
}

- (void)cancel
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100009180((uint64_t)self, (uint64_t)v4, v5, v6);

  -[DrainOperation finish](self, "finish");
}

- (void)finish
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000091F0((uint64_t)self, (uint64_t)v4, v5, v6);

  -[DrainOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[DrainOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_finished = 1;
  self->_executing = 0;
  -[DrainOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  -[DrainOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)pause
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DrainOperation pauseLock](self, "pauseLock"));
  objc_msgSend(v3, "lock");

  -[DrainOperation setIsPaused:](self, "setIsPaused:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[DrainOperation pauseLock](self, "pauseLock"));
  objc_msgSend(v4, "unlock");

}

- (void)resume
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DrainOperation pauseLock](self, "pauseLock"));
  objc_msgSend(v3, "lock");

  -[DrainOperation setIsPaused:](self, "setIsPaused:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DrainOperation pauseLock](self, "pauseLock"));
  objc_msgSend(v4, "signal");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DrainOperation pauseLock](self, "pauseLock"));
  objc_msgSend(v5, "unlock");

}

- (void)waitIfPaused
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DrainOperation pauseLock](self, "pauseLock"));
  objc_msgSend(v3, "lock");

  if (-[DrainOperation isPaused](self, "isPaused"))
  {
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DrainOperation pauseLock](self, "pauseLock"));
      objc_msgSend(v4, "wait");

    }
    while (-[DrainOperation isPaused](self, "isPaused"));
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DrainOperation pauseLock](self, "pauseLock"));
  objc_msgSend(v5, "unlock");

}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSCondition)pauseLock
{
  return (NSCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPauseLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseLock, 0);
}

@end
