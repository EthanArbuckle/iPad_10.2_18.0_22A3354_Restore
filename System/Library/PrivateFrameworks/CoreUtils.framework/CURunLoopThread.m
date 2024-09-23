@implementation CURunLoopThread

- (CURunLoopThread)init
{
  CURunLoopThread *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CURunLoopThread;
  v2 = -[CURunLoopThread init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CURunLoopThread;
  }
  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CURunLoopThread;
  -[CURunLoopThread dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE0679B0;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CURunLoopThread_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CURunLoopThread_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  LogCategory *ucat;
  LogCategory *v8;
  void (**invalidationHandler)(void);
  id v10;
  id threadInitializeHandler;
  id threadFinalizeHandler;
  uint64_t v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CURunLoopThread _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v13);
        goto LABEL_6;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x32u))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }
LABEL_6:
  if (self->_threadRunning)
    return;
  v8 = self->_ucat;
  if (v8->var0 <= 30)
  {
    if (v8->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v8, 0x1Eu))
        goto LABEL_11;
      v8 = self->_ucat;
    }
    LogPrintF((uint64_t)v8, (uint64_t)"-[CURunLoopThread _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v3, v4, v5, v6, v13);
  }
LABEL_11:
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    v10 = self->_invalidationHandler;
  }
  else
  {
    v10 = 0;
  }
  self->_invalidationHandler = 0;

  threadInitializeHandler = self->_threadInitializeHandler;
  self->_threadInitializeHandler = 0;

  threadFinalizeHandler = self->_threadFinalizeHandler;
  self->_threadFinalizeHandler = 0;

}

- (void)performBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__CURunLoopThread_performBlock___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (BOOL)_scheduleStopThread
{
  CURunLoopThread *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 runLoopValid;
  BOOL v8;
  BOOL v9;
  LogCategory *ucat;
  __CFRunLoop *runLoop;
  const void *v12;
  uint64_t v14;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  runLoopValid = v2->_runLoopValid;
  v2->_runLoopValid = 0;
  v8 = !runLoopValid || v2->_runLoop == 0;
  v9 = !v8;
  if (!v8)
  {
    ucat = v2->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_12;
        ucat = v2->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CURunLoopThread _scheduleStopThread]", 0x1Eu, (uint64_t)"Scheduling stop of RunLoop thread\n", v3, v4, v5, v6, v14);
    }
LABEL_12:
    runLoop = v2->_runLoop;
    v12 = (const void *)*MEMORY[0x1E0C9B280];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__CURunLoopThread__scheduleStopThread__block_invoke;
    block[3] = &unk_1E25DF2A0;
    block[4] = v2;
    CFRunLoopPerformBlock(runLoop, v12, block);
    CFRunLoopWakeUp(v2->_runLoop);
  }
  objc_sync_exit(v2);

  return v9;
}

- (void)_threadMain
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  CURunLoopThread *v8;
  __CFRunLoopSource *v9;
  void (**threadInitializeHandler)(void);
  CURunLoopThread *v11;
  void *v12;
  NSMutableArray *startBlocks;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSObject *dispatchQueue;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  LogCategory *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  LogCategory *v33;
  void (**threadFinalizeHandler)(void);
  CURunLoopThread *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  _QWORD block[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CFRunLoopSourceContext context;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  ucat = self->_ucat;
  if (ucat->var0 > 30)
    goto LABEL_5;
  if (ucat->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      goto LABEL_5;
    ucat = self->_ucat;
  }
  LogPrintF((uint64_t)ucat, (uint64_t)"-[CURunLoopThread _threadMain]", 0x1Eu, (uint64_t)"RunLoop thread starting\n", v2, v3, v4, v5, v37);
LABEL_5:
  v8 = self;
  objc_sync_enter(v8);
  v8->_runLoop = CFRunLoopGetCurrent();
  v8->_runLoopValid = 1;
  objc_sync_exit(v8);

  memset(&context, 0, sizeof(context));
  v9 = CFRunLoopSourceCreate(0, 0, &context);
  if (v9)
    CFRunLoopAddSource(v8->_runLoop, v9, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  v38 = (void *)MEMORY[0x18D78EB2C]();
  threadInitializeHandler = (void (**)(void))v8->_threadInitializeHandler;
  if (threadInitializeHandler)
    threadInitializeHandler[2]();
  v11 = v8;
  objc_sync_enter(v11);
  v12 = (void *)-[NSMutableArray copy](v11->_startBlocks, "copy");
  -[NSMutableArray removeAllObjects](v11->_startBlocks, "removeAllObjects");
  startBlocks = v11->_startBlocks;
  v11->_startBlocks = 0;

  objc_sync_exit(v11);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x18D78EB2C]();
        (*(void (**)(uint64_t))(v18 + 16))(v18);
        objc_autoreleasePoolPop(v19);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v15);
  }

  objc_autoreleasePoolPop(v38);
  dispatchQueue = v11->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CURunLoopThread__threadMain__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = v11;
  dispatch_async(dispatchQueue, block);
  v21 = (const __CFString *)*MEMORY[0x1E0C9B280];
  while (1)
  {
    v22 = (void *)MEMORY[0x18D78EB2C]();
    v27 = CFRunLoopRunInMode(v21, 1.79769313e308, 0);
    if ((_DWORD)v27 == 2)
      break;
    v28 = self->_ucat;
    if (v28->var0 > 10)
      goto LABEL_22;
    if (v28->var0 != -1)
      goto LABEL_20;
    if (_LogCategory_Initialize((uint64_t)v28, 0xAu))
    {
      v28 = self->_ucat;
LABEL_20:
      LogPrintF((uint64_t)v28, (uint64_t)"-[CURunLoopThread _threadMain]", 0xAu, (uint64_t)"Waiting for runloop to start (%d)\n", v23, v24, v25, v26, v27);
    }
LABEL_22:
    usleep(0x4E20u);
    objc_autoreleasePoolPop(v22);
  }
  objc_autoreleasePoolPop(v22);
  v33 = self->_ucat;
  if (v33->var0 <= 30)
  {
    if (v33->var0 != -1)
      goto LABEL_26;
    if (_LogCategory_Initialize((uint64_t)v33, 0x1Eu))
    {
      v33 = self->_ucat;
LABEL_26:
      LogPrintF((uint64_t)v33, (uint64_t)"-[CURunLoopThread _threadMain]", 0x1Eu, (uint64_t)"RunLoop thread stopping\n", v29, v30, v31, v32, v37);
    }
  }
  threadFinalizeHandler = (void (**)(void))v11->_threadFinalizeHandler;
  if (threadFinalizeHandler)
    threadFinalizeHandler[2]();
  if (v9)
  {
    CFRunLoopRemoveSource(v8->_runLoop, v9, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(v9);
  }
  v35 = v11;
  objc_sync_enter(v35);
  v8->_runLoop = 0;
  objc_sync_exit(v35);

  v36 = v11->_dispatchQueue;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __30__CURunLoopThread__threadMain__block_invoke_2;
  v39[3] = &unk_1E25DF2A0;
  v39[4] = v35;
  dispatch_async(v36, v39);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)label
{
  return self->_label;
}

- (id)threadInitializeHandler
{
  return self->_threadInitializeHandler;
}

- (void)setThreadInitializeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)threadFinalizeHandler
{
  return self->_threadFinalizeHandler;
}

- (void)setThreadFinalizeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_threadFinalizeHandler, 0);
  objc_storeStrong(&self->_threadInitializeHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_startBlocks, 0);
}

uint64_t __30__CURunLoopThread__threadMain__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v9 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v9 + 48);
  if (*(int *)result > 30)
    goto LABEL_5;
  if (*(_DWORD *)result != -1)
    goto LABEL_3;
  result = _LogCategory_Initialize(result, 0x1Eu);
  v9 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)result)
  {
    result = *(_QWORD *)(v9 + 48);
LABEL_3:
    result = LogPrintF(result, (uint64_t)"-[CURunLoopThread _threadMain]_block_invoke", 0x1Eu, (uint64_t)"Started RunLoop thread\n", a5, a6, a7, a8, v11);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  if (*(_BYTE *)(v9 + 9))
    return objc_msgSend((id)v9, "_scheduleStopThread");
  return result;
}

uint64_t __30__CURunLoopThread__threadMain__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v13;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD *)(a1 + 32);
      if (!v11)
        goto LABEL_5;
      v10 = *(int **)(v9 + 48);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CURunLoopThread _threadMain]_block_invoke_2", 0x1Eu, (uint64_t)"Stopped RunLoop thread\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  *(_BYTE *)(v9 + 40) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __38__CURunLoopThread__scheduleStopThread__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  int *v10;
  _BOOL4 v11;
  __CFRunLoop *v12;
  uint64_t v13;
  _QWORD *obj;

  v9 = *(_QWORD **)(a1 + 32);
  v10 = (int *)v9[6];
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CURunLoopThread _scheduleStopThread]_block_invoke", 0x1Eu, (uint64_t)"Stopping RunLoop thread\n", a5, a6, a7, a8, v13);
      v9 = *(_QWORD **)(a1 + 32);
      goto LABEL_5;
    }
    v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    v9 = *(_QWORD **)(a1 + 32);
    if (v11)
    {
      v10 = (int *)v9[6];
      goto LABEL_3;
    }
  }
LABEL_5:
  obj = v9;
  objc_sync_enter(obj);
  v12 = *(__CFRunLoop **)(*(_QWORD *)(a1 + 32) + 16);
  if (v12)
    CFRunLoopStop(v12);
  objc_sync_exit(obj);

}

void __32__CURunLoopThread_performBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  uint64_t v10;
  __CFRunLoop *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BYTE *obj;

  v8 = *(_BYTE **)(a1 + 32);
  if (!v8[8])
    FatalErrorF((uint64_t)"PerformBlock before activate", a2, a3, a4, a5, a6, a7, a8, v17);
  if (v8[9])
    FatalErrorF((uint64_t)"PerformBlock after invalidate", a2, a3, a4, a5, a6, a7, a8, v17);
  obj = v8;
  objc_sync_enter(obj);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(__CFRunLoop **)(v10 + 16);
  if (v11 && *(_BYTE *)(v10 + 24))
  {
    CFRunLoopPerformBlock(v11, (CFTypeRef)*MEMORY[0x1E0C9B280], *(void **)(a1 + 40));
    CFRunLoopWakeUp(*(CFRunLoopRef *)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    v12 = *(void **)(v10 + 32);
    if (!v12)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 32);
      *(_QWORD *)(v14 + 32) = v13;

      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    }
    v16 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v12, "addObject:", v16);

  }
  objc_sync_exit(obj);

}

uint64_t __29__CURunLoopThread_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v9 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v9 + 9))
    return result;
  v10 = result;
  v11 = *(int **)(v9 + 48);
  if (*v11 <= 30)
  {
    if (*v11 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)v11, (uint64_t)"-[CURunLoopThread invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v18);
      v9 = *(_QWORD *)(v10 + 32);
      goto LABEL_6;
    }
    v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
    v9 = *(_QWORD *)(v10 + 32);
    if (v12)
    {
      v11 = *(int **)(v9 + 48);
      goto LABEL_4;
    }
  }
LABEL_6:
  *(_BYTE *)(v9 + 9) = 1;
  result = objc_msgSend(*(id *)(v10 + 32), "_scheduleStopThread");
  if ((result & 1) == 0)
  {
    v17 = *(_QWORD *)(v10 + 32);
    if (*(_BYTE *)(v17 + 8))
    {
      result = *(_QWORD *)(v17 + 48);
      if (*(int *)result <= 30)
      {
        if (*(_DWORD *)result != -1)
          return LogPrintF(result, (uint64_t)"-[CURunLoopThread invalidate]_block_invoke", 0x1Eu, (uint64_t)"Deferring stop of RunLoop thread until it finishes starting\n", v13, v14, v15, v16, a9);
        result = _LogCategory_Initialize(result, 0x1Eu);
        if ((_DWORD)result)
        {
          result = *(_QWORD *)(*(_QWORD *)(v10 + 32) + 48);
          return LogPrintF(result, (uint64_t)"-[CURunLoopThread invalidate]_block_invoke", 0x1Eu, (uint64_t)"Deferring stop of RunLoop thread until it finishes starting\n", v13, v14, v15, v16, a9);
        }
      }
    }
    else
    {
      return objc_msgSend((id)v17, "_invalidated");
    }
  }
  return result;
}

uint64_t __27__CURunLoopThread_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v13;
  _QWORD v14[5];

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD *)(a1 + 32);
      if (!v11)
        goto LABEL_5;
      v10 = *(int **)(v9 + 48);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CURunLoopThread activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  *(_BYTE *)(v9 + 8) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __27__CURunLoopThread_activate__block_invoke_2;
  v14[3] = &unk_1E25DF2A0;
  v14[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadWithBlock:", v14);
}

void __27__CURunLoopThread_activate__block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D78EB2C]();
  objc_msgSend(*(id *)(a1 + 32), "_threadMain");
  objc_autoreleasePoolPop(v2);
}

@end
