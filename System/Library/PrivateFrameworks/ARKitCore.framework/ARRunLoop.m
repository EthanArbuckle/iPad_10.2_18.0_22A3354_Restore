@implementation ARRunLoop

- (ARRunLoop)init
{
  void *v3;
  ARRunLoop *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ARRunLoop.%p"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ARRunLoop initWithName:](self, "initWithName:", v3);

  return v4;
}

- (ARRunLoop)initWithName:(id)a3
{
  id v4;
  ARRunLoop *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARRunLoop;
  v5 = -[ARRunLoop init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_autoreleasePoolStack = CFArrayCreateMutable(0, 0, 0);
  }

  return v5;
}

- (void)dealloc
{
  __CFRunLoopObserver *runLoopEnterObserver;
  CFRunLoopMode *v4;
  __CFRunLoopObserver *runLoopExitObserver;
  __CFRunLoop *runloop;
  objc_super v7;

  runLoopEnterObserver = self->_runLoopEnterObserver;
  v4 = (CFRunLoopMode *)MEMORY[0x1E0C9B270];
  if (runLoopEnterObserver)
  {
    CFRunLoopRemoveObserver(self->_runloop, runLoopEnterObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(self->_runLoopEnterObserver);
  }
  runLoopExitObserver = self->_runLoopExitObserver;
  if (runLoopExitObserver)
  {
    CFRunLoopRemoveObserver(self->_runloop, runLoopExitObserver, *v4);
    CFRelease(self->_runLoopExitObserver);
  }
  runloop = self->_runloop;
  if (runloop)
    CFRelease(runloop);
  CFRelease(self->_autoreleasePoolStack);
  v7.receiver = self;
  v7.super_class = (Class)ARRunLoop;
  -[ARRunLoop dealloc](&v7, sel_dealloc);
}

- (void)start
{
  os_unfair_lock_s *p_lock;
  _BOOL4 started;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  started = self->_started;
  self->_started = 1;
  os_unfair_lock_unlock(p_lock);
  if (!started)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", self, sel__startThread, 0);
    objc_msgSend(v5, "setName:", self->_name);
    objc_msgSend(v5, "setQualityOfService:", 33);
    objc_msgSend(v5, "start");

  }
}

- (void)_startThread
{
  __CFRunLoop *Current;
  void *v4;
  __CFRunLoopObserver *v5;
  const __CFString *v6;
  __CFRunLoopObserver *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *earlyRunloopBlocks;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  uint64_t v15;
  __CFRunLoopSource *v16;
  const __CFString *v17;
  CFRunLoopSourceContext v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  Current = CFRunLoopGetCurrent();
  pthread_set_fixedpriority_self();
  if (!_CFRunLoopSetPerCalloutAutoreleasepoolEnabled())
  {
    objc_initWeak((id *)&v18, self);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __25__ARRunLoop__startThread__block_invoke;
    v23[3] = &unk_1E6673888;
    objc_copyWeak(&v24, (id *)&v18);
    v4 = (void *)MEMORY[0x1B5E2DF90](v23);
    v5 = CFRunLoopObserverCreateWithHandler(0, 1uLL, 1u, -2147483647, v4);
    self->_runLoopEnterObserver = v5;
    v6 = (const __CFString *)*MEMORY[0x1E0C9B270];
    CFRunLoopAddObserver(Current, v5, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    v7 = CFRunLoopObserverCreateWithHandler(0, 0xA0uLL, 1u, 0x7FFFFFFFLL, v4);
    self->_runLoopExitObserver = v7;
    CFRunLoopAddObserver(Current, v7, v6);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)&v18);
  }
  v8 = (void *)MEMORY[0x1B5E2DDB0]();
  os_unfair_lock_lock(&self->_lock);
  CFRetain(Current);
  self->_runloop = Current;
  v9 = self->_earlyRunloopBlocks;
  earlyRunloopBlocks = self->_earlyRunloopBlocks;
  self->_earlyRunloopBlocks = 0;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v9;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    v14 = (const void *)*MEMORY[0x1E0C9B270];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        CFRunLoopPerformBlock(Current, v14, *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15++));
      }
      while (v12 != v15);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_lock);
  objc_autoreleasePoolPop(v8);
  memset(&v18, 0, sizeof(v18));
  v16 = CFRunLoopSourceCreate(0, 0, &v18);
  v17 = (const __CFString *)*MEMORY[0x1E0C9B280];
  CFRunLoopAddSource(Current, v16, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  CFRelease(v16);
  CFRunLoopRun();
  CFRunLoopRemoveSource(Current, v16, v17);
  -[ARRunLoop setCancelled:](self, "setCancelled:", 1);
}

void __25__ARRunLoop__startThread__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_runloop_handleActivity:", a3);

}

- (void)runOnRunLoop:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  __CFRunLoop *runloop;
  NSMutableArray *earlyRunloopBlocks;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  runloop = self->_runloop;
  if (runloop)
  {
    os_unfair_lock_unlock(p_lock);
    CFRunLoopPerformBlock(runloop, (CFTypeRef)*MEMORY[0x1E0C9B270], v5);

    CFRunLoopWakeUp(runloop);
  }
  else
  {
    earlyRunloopBlocks = self->_earlyRunloopBlocks;
    if (earlyRunloopBlocks)
      v8 = earlyRunloopBlocks;
    else
      v8 = (NSMutableArray *)objc_opt_new();
    v9 = self->_earlyRunloopBlocks;
    self->_earlyRunloopBlocks = v8;

    v10 = self->_earlyRunloopBlocks;
    v11 = (void *)MEMORY[0x1B5E2DF90](v5);

    -[NSMutableArray addObject:](v10, "addObject:", v11);
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)cancel
{
  -[ARRunLoop runOnRunLoop:](self, "runOnRunLoop:", &__block_literal_global_34);
}

void __19__ARRunLoop_cancel__block_invoke()
{
  __CFRunLoop *Current;

  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

- (void)_runloop_handleActivity:(unint64_t)a3
{
  switch(a3)
  {
    case 0x80uLL:
      -[ARRunLoop _runloop_popAutoreleasePool](self, "_runloop_popAutoreleasePool");
      return;
    case 0x20uLL:
      -[ARRunLoop _runloop_popAutoreleasePool](self, "_runloop_popAutoreleasePool");
      goto LABEL_7;
    case 1uLL:
LABEL_7:
      -[ARRunLoop _runloop_pushAutoreleasePool](self, "_runloop_pushAutoreleasePool");
      break;
  }
}

- (void)_runloop_pushAutoreleasePool
{
  __CFArray *autoreleasePoolStack;
  const void *v3;

  autoreleasePoolStack = self->_autoreleasePoolStack;
  v3 = (const void *)MEMORY[0x1B5E2D1A4](0, a2);
  CFArrayAppendValue(autoreleasePoolStack, v3);
}

- (void)_runloop_popAutoreleasePool
{
  CFIndex Count;
  CFIndex v4;
  const void *ValueAtIndex;

  Count = CFArrayGetCount(self->_autoreleasePoolStack);
  v4 = Count - 1;
  if (Count >= 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(self->_autoreleasePoolStack, v4);
    MEMORY[0x1B5E2D198](ValueAtIndex);
    CFArrayRemoveValueAtIndex(self->_autoreleasePoolStack, v4);
  }
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earlyRunloopBlocks, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
