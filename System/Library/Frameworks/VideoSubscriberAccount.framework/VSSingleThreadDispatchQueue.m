@implementation VSSingleThreadDispatchQueue

- (VSSingleThreadDispatchQueue)initWithName:(id)a3
{
  id v4;
  VSSingleThreadDispatchQueue *v5;
  NSMutableArray *v6;
  NSMutableArray *blocks;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VSSingleThreadDispatchQueue;
  v5 = -[VSSingleThreadDispatchQueue init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    blocks = v5->_blocks;
    v5->_blocks = v6;

    v8 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v8;

  }
  return v5;
}

+ (id)currentQueue
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("VSSingleThreadDispatchQueueThreadKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)startWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;

  -[VSSingleThreadDispatchQueue setStartCompletionBlock:](self, "setStartCompletionBlock:", a3);
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", self, sel__threadMain, 0);
  -[VSSingleThreadDispatchQueue setUnderlyingThread:](self, "setUnderlyingThread:");
  -[VSSingleThreadDispatchQueue name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  objc_msgSend(v9, "setName:", v8);
  objc_msgSend(v9, "start");

}

- (void)dispatchBlock:(id)a3
{
  VSSingleThreadDispatchQueue *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[VSSingleThreadDispatchQueue blocks](v4, "blocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "addObject:", v6);

  CFRunLoopSourceSignal(-[VSSingleThreadDispatchQueue runLoopSource](v4, "runLoopSource"));
  CFRunLoopWakeUp(-[VSSingleThreadDispatchQueue underlyingRunLoop](v4, "underlyingRunLoop"));
  objc_sync_exit(v4);

}

- (void)dispatchBlockSync:(id)a3
{
  id v4;
  VSSemaphore *v5;
  VSSemaphore *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  VSSemaphore *v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(VSSemaphore);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __49__VSSingleThreadDispatchQueue_dispatchBlockSync___block_invoke;
  v11 = &unk_1E939F1A8;
  v12 = v5;
  v13 = v4;
  v6 = v5;
  v7 = v4;
  -[VSSingleThreadDispatchQueue dispatchBlock:](self, "dispatchBlock:", &v8);
  -[VSSemaphore wait](v6, "wait", v8, v9, v10, v11);

}

uint64_t __49__VSSingleThreadDispatchQueue_dispatchBlockSync___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (void)stop
{
  VSSingleThreadDispatchQueue *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_state)
    CFRunLoopStop(-[VSSingleThreadDispatchQueue underlyingRunLoop](obj, "underlyingRunLoop"));
  objc_sync_exit(obj);

}

- (int64_t)state
{
  VSSingleThreadDispatchQueue *v2;
  int64_t state;

  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (void)_threadMain
{
  NSObject *v3;
  void *v4;
  CFRunLoopRef Current;
  __CFRunLoopSource *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CFRunLoopRunResult v16;
  VSSingleThreadDispatchQueue *v17;
  _QWORD v18[4];
  id v19;
  id location;
  CFRunLoopSourceContext buf;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.version) = 136315138;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"-[VSSingleThreadDispatchQueue _threadMain]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x1D8236758]();
  buf.version = 0;
  buf.info = self;
  memset(&buf.retain, 0, 40);
  buf.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))runLoopSourceScheduleCallback;
  buf.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))runLoopSourceCancellCallback;
  buf.perform = (void (__cdecl *)(void *))runLoopSourcePerformCallback;
  Current = CFRunLoopGetCurrent();
  -[VSSingleThreadDispatchQueue setUnderlyingRunLoop:](self, "setUnderlyingRunLoop:", Current);
  CFRetain(Current);
  v6 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &buf);
  -[VSSingleThreadDispatchQueue setRunLoopSource:](self, "setRunLoopSource:", v6);
  v7 = (const __CFString *)*MEMORY[0x1E0C9B280];
  CFRunLoopAddSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threadDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", self, CFSTR("VSSingleThreadDispatchQueueThreadKey"));

  -[VSSingleThreadDispatchQueue startCompletionBlock](self, "startCompletionBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__VSSingleThreadDispatchQueue__threadMain__block_invoke;
    v18[3] = &unk_1E939FD70;
    objc_copyWeak(&v19, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  do
  {
    v15 = (void *)MEMORY[0x1D8236758](v11, v12, v13, v14);
    v16 = CFRunLoopRunInMode(v7, 1.0e10, 1u);
    objc_autoreleasePoolPop(v15);
  }
  while ((v16 - 3) < 0xFFFFFFFE);
  CFRelease(Current);
  CFRunLoopSourceInvalidate(v6);
  -[VSSingleThreadDispatchQueue setRunLoopSource:](self, "setRunLoopSource:", 0);
  -[VSSingleThreadDispatchQueue setUnderlyingRunLoop:](self, "setUnderlyingRunLoop:", 0);
  v17 = self;
  objc_sync_enter(v17);
  -[VSSingleThreadDispatchQueue setState:](v17, "setState:", 1);
  objc_sync_exit(v17);

  objc_autoreleasePoolPop(v4);
}

void __42__VSSingleThreadDispatchQueue__threadMain__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v2)(_QWORD, _QWORD);
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "startCompletionBlock");
    v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v2)[2](v2, v3);

    objc_msgSend(v3, "setStartCompletionBlock:", 0);
    WeakRetained = v3;
  }

}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSThread)underlyingThread
{
  return self->_underlyingThread;
}

- (void)setUnderlyingThread:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingThread, a3);
}

- (__CFRunLoop)underlyingRunLoop
{
  return self->_underlyingRunLoop;
}

- (void)setUnderlyingRunLoop:(__CFRunLoop *)a3
{
  self->_underlyingRunLoop = a3;
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (NSMutableArray)blocks
{
  return self->_blocks;
}

- (void)setBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_blocks, a3);
}

- (id)startCompletionBlock
{
  return self->_startCompletionBlock;
}

- (void)setStartCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startCompletionBlock, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_underlyingThread, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
