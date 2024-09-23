@implementation FBSMainRunLoopSerialQueue

- (void)assertBarrierOnQueue
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __42__FBSMainRunLoopSerialQueue_performAsync___block_invoke(uint64_t a1)
{
  -[FBSMainRunLoopSerialQueue _queue_performAsync:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_queue_performAsync:(uint64_t)a1
{
  void *v3;
  void *v4;
  __CFRunLoop *Main;

  if (a1)
  {
    if (a2)
    {
      v3 = *(void **)(a1 + 32);
      v4 = (void *)MEMORY[0x19AECA324](a2);
      objc_msgSend(v3, "addObject:", v4);

      CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 24));
      Main = CFRunLoopGetMain();
      CFRunLoopWakeUp(Main);
    }
  }
}

uint64_t __63__FBSMainRunLoopSerialQueue__targetQueue_performNextIfPossible__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  if (result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectAtIndex:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectAtIndex:", 0);
  }
  return result;
}

- (void)_performNextFromRunLoopSource
{
  if (a1)
  {
    if (-[FBSMainRunLoopSerialQueue _targetQueue_performNextIfPossible](a1))
      CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 24));
  }
}

- (BOOL)_targetQueue_performNextIfPossible
{
  _BOOL8 v2;
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!a1 || *(_BYTE *)(a1 + 40))
    return 0;
  *(_BYTE *)(a1 + 40) = 1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  v12 = 0;
  v3 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__FBSMainRunLoopSerialQueue__targetQueue_performNextIfPossible__block_invoke;
  v6[3] = &unk_1E38EB628;
  v6[4] = a1;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);
  v4 = (void *)v8[5];
  v2 = v4 != 0;
  if (v4)
    __FBSSERIALQUEUE_IS_CALLING_OUT_TO_A_BLOCK__(v4);
  *(_BYTE *)(a1 + 40) = 0;
  _Block_object_dispose(&v7, 8);

  return v2;
}

- (id)_initWithModes:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CFRunLoopSourceRef v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  __CFRunLoop *Main;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CFRunLoopSourceContext v27;
  _BYTE v28[128];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v27.version = (CFIndex)a1;
    v27.info = FBSSerialQueue;
    a1 = -[CFRunLoopSourceContext init]((objc_super *)&v27, sel_init);
    if (a1)
    {
      objc_msgSend(off_1E38E9DF8, "serial");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceClass:", 33);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = BSDispatchQueueCreate();
      v7 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v6;

      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v8;

      if (!objc_msgSend(v3, "count"))
      {
        v29[0] = *MEMORY[0x1E0C9B270];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v10 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v10;
      }
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v3);
      v12 = (void *)*((_QWORD *)a1 + 1);
      *((_QWORD *)a1 + 1) = v11;

      v27.version = 0;
      memset(&v27.retain, 0, 56);
      v27.info = a1;
      v27.perform = (void (__cdecl *)(void *))FBSSerialQueueRunLoopSourceHandler;
      v13 = CFRunLoopSourceCreate(0, 0, &v27);
      *((_QWORD *)a1 + 3) = v13;
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create source"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBSMainRunLoopSerialQueue _initWithModes:].cold.1();
        objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A6EC88CLL);
      }
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = *((id *)a1 + 1);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            v19 = *(const __CFString **)(*((_QWORD *)&v23 + 1) + 8 * v18);
            Main = CFRunLoopGetMain();
            CFRunLoopAddSource(Main, *((CFRunLoopSourceRef *)a1 + 3), v19);
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v16);
      }

    }
  }

  return a1;
}

- (void)performAsync:(id)a3
{
  dispatch_block_t v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  if (a3)
  {
    v4 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, a3);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__FBSMainRunLoopSerialQueue_performAsync___block_invoke;
    block[3] = &unk_1E38EBB98;
    block[4] = self;
    v8 = v4;
    v6 = v4;
    dispatch_async_and_wait(queue, block);

  }
}

- (void)dealloc
{
  objc_super v3;

  CFRunLoopSourceInvalidate(self->_source);
  CFRelease(self->_source);
  v3.receiver = self;
  v3.super_class = (Class)FBSMainRunLoopSerialQueue;
  -[FBSMainRunLoopSerialQueue dealloc](&v3, sel_dealloc);
}

- (void)performAfter:(double)a3 withBlock:(id)a4
{
  dispatch_block_t v6;
  dispatch_time_t v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;

  if (a4)
  {
    v6 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, a4);
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__FBSMainRunLoopSerialQueue_performAfter_withBlock___block_invoke;
    v10[3] = &unk_1E38EBB98;
    v10[4] = self;
    v11 = v6;
    v9 = v6;
    dispatch_after(v7, queue, v10);

  }
}

void __52__FBSMainRunLoopSerialQueue_performAfter_withBlock___block_invoke(uint64_t a1)
{
  -[FBSMainRunLoopSerialQueue _queue_performAsync:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_modes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  NSObject *queue;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  FBSMainRunLoopSerialQueue *v15;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", self->_modes, CFSTR("modes"), 0);
  v4 = (id)objc_msgSend(v3, "appendPointer:withName:", self->_source, CFSTR("source"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_main_callingOut, CFSTR("callingOut"));
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __40__FBSMainRunLoopSerialQueue_description__block_invoke;
  v13 = &unk_1E38EAE08;
  v14 = v3;
  v15 = self;
  v7 = v3;
  dispatch_async_and_wait(queue, &v10);
  objc_msgSend(v7, "build", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __40__FBSMainRunLoopSerialQueue_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("enqueued"), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_blocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_modes, 0);
}

- (void)_initWithModes:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
