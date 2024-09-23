@implementation VSAsyncOperation

- (BOOL)isExecuting
{
  int *p_state;
  unsigned int v3;
  BOOL result;

  p_state = &self->_state;
  while (1)
  {
    v3 = __ldaxr((unsigned int *)p_state);
    if (v3 != 1)
      break;
    result = 1;
    if (!__stlxr(1u, (unsigned int *)p_state))
      return result;
  }
  result = 0;
  __clrex();
  return result;
}

- (BOOL)isFinished
{
  int *p_state;
  unsigned int v3;
  BOOL result;

  p_state = &self->_state;
  while (1)
  {
    v3 = __ldaxr((unsigned int *)p_state);
    if (v3 != 2)
      break;
    if (!__stlxr(2u, (unsigned int *)p_state))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

- (void)finishExecutionIfPossible
{
  NSObject *v3;
  NSObject *v4;
  int *p_state;
  unsigned int v6;
  int v7;
  VSAsyncOperation *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = (VSAsyncOperation *)"-[VSAsyncOperation finishExecutionIfPossible]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Finishing execution of operation %p.", (uint8_t *)&v7, 0xCu);
  }

  -[VSAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[VSAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  p_state = &self->_state;
  while (1)
  {
    v6 = __ldaxr((unsigned int *)p_state);
    if (v6 != 1)
      break;
    if (!__stlxr(2u, (unsigned int *)p_state))
      goto LABEL_10;
  }
  __clrex();
LABEL_10:
  -[VSAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  -[VSAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (void)start
{
  int *p_state;
  NSObject *v5;
  NSObject *v6;
  int v7;
  VSAsyncOperation *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((-[VSAsyncOperation isReady](self, "isReady") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Operation cannot start before it's ready."));
  -[VSAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  p_state = &self->_state;
  do
  {
    if (__ldaxr((unsigned int *)p_state))
    {
      __clrex();
      -[VSAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The -start method may only be called once."));
      return;
    }
  }
  while (__stlxr(1u, (unsigned int *)p_state));
  -[VSAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  if (-[VSAsyncOperation isCancelled](self, "isCancelled"))
  {
    -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
  }
  else
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Will begin execution of %@", (uint8_t *)&v7, 0xCu);
    }

    -[VSAsyncOperation executionDidBegin](self, "executionDidBegin");
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Did begin execution of %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  VSAsyncOperation *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Will cancel operation %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)VSAsyncOperation;
  -[VSAsyncOperation cancel](&v5, sel_cancel);
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Did cancel operation %@", buf, 0xCu);
  }

}

@end
