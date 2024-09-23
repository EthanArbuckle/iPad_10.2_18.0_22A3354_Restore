@implementation _SYStreamerThread

+ (id)streamerThread
{
  uint64_t v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&streamerThread_threadLock);
  if (!streamerThread_thread)
  {
    v2 = objc_opt_new();
    v3 = (void *)streamerThread_thread;
    streamerThread_thread = v2;

    objc_msgSend((id)streamerThread_thread, "start");
    objc_msgSend((id)streamerThread_thread, "_waitForStartup");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&streamerThread_threadLock);
  return (id)streamerThread_thread;
}

- (_SYStreamerThread)init
{
  _SYStreamerThread *v2;
  uint64_t v3;
  NSConditionLock *startupLock;
  _SYStreamerThread *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SYStreamerThread;
  v2 = -[_SYStreamerThread init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
    startupLock = v2->_startupLock;
    v2->_startupLock = (NSConditionLock *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)_waitForStartup
{
  if (-[NSConditionLock condition](self->_startupLock, "condition") != 1)
  {
    -[NSConditionLock lockWhenCondition:](self->_startupLock, "lockWhenCondition:", 1);
    -[NSConditionLock unlock](self->_startupLock, "unlock");
  }
}

- (NSRunLoop)runLoop
{
  if (-[NSConditionLock condition](self->_startupLock, "condition") != 1)
  {
    -[NSConditionLock lockWhenCondition:](self->_startupLock, "lockWhenCondition:", 1);
    -[NSConditionLock unlock](self->_startupLock, "unlock");
  }
  return self->_threadRunLoop;
}

- (void)main
{
  NSRunLoop *v3;
  NSRunLoop *threadRunLoop;
  NSRunLoop *v5;
  void *v6;
  CFRunLoopSourceContext v7;
  char v8;

  -[NSConditionLock lock](self->_startupLock, "lock");
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v3 = (NSRunLoop *)objc_claimAutoreleasedReturnValue();
  threadRunLoop = self->_threadRunLoop;
  self->_threadRunLoop = v3;

  v8 = 0;
  v7.version = 0;
  memset(&v7.retain, 0, 56);
  v7.info = &v8;
  v7.perform = (void (__cdecl *)(void *))_StopPerform;
  self->_stopRLS = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &v7);
  CFRunLoopAddSource(-[NSRunLoop getCFRunLoop](self->_threadRunLoop, "getCFRunLoop"), self->_stopRLS, CFSTR("_SYWaitingForStream"));
  -[NSConditionLock unlockWithCondition:](self->_startupLock, "unlockWithCondition:", 1);
  while (!v8)
  {
    v5 = self->_threadRunLoop;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSRunLoop runMode:beforeDate:](v5, "runMode:beforeDate:", CFSTR("_SYWaitingForStream"), v6);

  }
  -[NSConditionLock lock](self->_startupLock, "lock");
  -[NSConditionLock unlockWithCondition:](self->_startupLock, "unlockWithCondition:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startupLock, 0);
  objc_storeStrong((id *)&self->_threadRunLoop, 0);
}

@end
