@implementation CLRunLoopSiloThread

- (CLRunLoopSiloThread)initWithCurrentThread
{
  CLRunLoopSiloThread *v2;
  uint64_t v3;
  NSThread *underlyingThread;
  uint64_t v5;
  NSRunLoop *underlyingRunLoop;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLRunLoopSiloThread;
  v2 = -[CLRunLoopSiloThread init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v3 = objc_claimAutoreleasedReturnValue();
    underlyingThread = v2->_underlyingThread;
    v2->_underlyingThread = (NSThread *)v3;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v5 = objc_claimAutoreleasedReturnValue();
    underlyingRunLoop = v2->_underlyingRunLoop;
    v2->_underlyingRunLoop = (NSRunLoop *)v5;

    v2->_threadId = pthread_self();
    v2->_shouldCancelThread = 0;
  }
  return v2;
}

- (NSRunLoop)underlyingRunLoop
{
  return self->_underlyingRunLoop;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_shouldCancelThread)
  {
    CFRunLoopStop(-[NSRunLoop getCFRunLoop](self->_underlyingRunLoop, "getCFRunLoop"));
    -[NSThread cancel](self->_underlyingThread, "cancel");
  }
  v3.receiver = self;
  v3.super_class = (Class)CLRunLoopSiloThread;
  -[CLRunLoopSiloThread dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingThread, 0);
  objc_storeStrong((id *)&self->_underlyingRunLoop, 0);
}

- (CLRunLoopSiloThread)init
{
  CLRunLoopSiloThread *v2;
  id v3;
  uint64_t v4;
  NSThread *underlyingThread;
  intptr_t v6;
  NSObject *v7;
  CLRunLoopSiloThread *v8;
  uint8_t v10[16];
  _QWORD v11[4];
  CLRunLoopSiloThread *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  dispatch_semaphore_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CLRunLoopSiloThread;
  v2 = -[CLRunLoopSiloThread init](&v20, sel_init);
  if (!v2)
    goto LABEL_11;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1A1A02A1C;
  v18 = sub_1A1A029F4;
  v19 = dispatch_semaphore_create(0);
  v3 = objc_alloc(MEMORY[0x1E0CB3978]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A1A09164;
  v11[3] = &unk_1E45FB8C0;
  v2 = v2;
  v12 = v2;
  v13 = &v14;
  v4 = objc_msgSend(v3, "initWithBlock:", v11);
  underlyingThread = v2->_underlyingThread;
  v2->_underlyingThread = (NSThread *)v4;

  -[NSThread start](v2->_underlyingThread, "start");
  v6 = dispatch_semaphore_wait((dispatch_semaphore_t)v15[5], 0xFFFFFFFFFFFFFFFFLL);
  if (v6)
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
    v7 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_FAULT, "CLRunLoopSilo initialization timed out", v10, 2u);
    }

    v2 = 0;
  }
  else
  {
    v2->_shouldCancelThread = 1;
  }

  _Block_object_dispose(&v14, 8);
  if (v6)
  {
    v8 = 0;
  }
  else
  {
LABEL_11:
    v2 = v2;
    v8 = v2;
  }

  return v8;
}

- (CLRunLoopSiloThread)initWithRunLoop:(__CFRunLoop *)a3
{
  CLRunLoopSiloThread *v4;
  const void *v5;
  intptr_t v6;
  NSObject *v7;
  CLRunLoopSiloThread *v8;
  uint8_t v10[16];
  _QWORD block[4];
  CLRunLoopSiloThread *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  dispatch_semaphore_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CLRunLoopSiloThread;
  v4 = -[CLRunLoopSiloThread init](&v20, sel_init);
  if (!v4)
    goto LABEL_11;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1A1A02A1C;
  v18 = sub_1A1A029F4;
  v19 = dispatch_semaphore_create(0);
  v5 = (const void *)*MEMORY[0x1E0C9B270];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A1A093B8;
  block[3] = &unk_1E45FB8C0;
  v4 = v4;
  v12 = v4;
  v13 = &v14;
  CFRunLoopPerformBlock(a3, v5, block);
  v6 = dispatch_semaphore_wait((dispatch_semaphore_t)v15[5], 0xFFFFFFFFFFFFFFFFLL);
  if (v6)
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
    v7 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_FAULT, "CLRunLoopSilo initialization timed out", v10, 2u);
    }

    v4 = 0;
  }
  else
  {
    v4->_shouldCancelThread = 0;
  }

  _Block_object_dispose(&v14, 8);
  if (v6)
  {
    v8 = 0;
  }
  else
  {
LABEL_11:
    v4 = v4;
    v8 = v4;
  }

  return v8;
}

- (_opaque_pthread_t)threadId
{
  return self->_threadId;
}

- (NSThread)underlyingThread
{
  return self->_underlyingThread;
}

- (BOOL)shouldCancelThread
{
  return self->_shouldCancelThread;
}

@end
