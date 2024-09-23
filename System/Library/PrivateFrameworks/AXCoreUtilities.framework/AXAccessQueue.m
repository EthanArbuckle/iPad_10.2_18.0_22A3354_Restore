@implementation AXAccessQueue

+ (id)mainAccessQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AXAccessQueue_mainAccessQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mainAccessQueue__AXMainAccessQueueOnceToken != -1)
    dispatch_once(&mainAccessQueue__AXMainAccessQueueOnceToken, block);
  return (id)mainAccessQueue__AXMainAccessQueue;
}

- (void)performSynchronousWritingBlock:(id)a3
{
  id v4;

  v4 = a3;
  if (-[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
    AXPerformBlockSynchronouslyOnMainThread(v4);
  else
    -[AXAccessQueue _performBlock:withDispatchFunction:synchronously:accessQueueContext:](self, "_performBlock:withDispatchFunction:synchronously:accessQueueContext:", v4, MEMORY[0x1E0C82C48], 1, 2);

}

- (BOOL)behavesAsMainQueue
{
  return -[AXAccessQueue specialBehaviors](self, "specialBehaviors") & 1;
}

- (unint64_t)specialBehaviors
{
  return self->_specialBehaviors;
}

void __32__AXAccessQueue_mainAccessQueue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithLabel:appendUUIDToLabel:specialBehaviors:", 0, 0, 1);
  v2 = (void *)mainAccessQueue__AXMainAccessQueue;
  mainAccessQueue__AXMainAccessQueue = v1;

}

- (id)_initWithLabel:(id)a3 appendUUIDToLabel:(BOOL)a4 specialBehaviors:(unint64_t)a5
{
  _BOOL4 v6;
  id v8;
  AXAccessQueue *v9;
  AXAccessQueue *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  dispatch_queue_t v16;
  id v17;
  objc_class *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  objc_super v25;

  v6 = a4;
  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AXAccessQueue;
  v9 = -[AXAccessQueue init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    if ((a5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (v6)
          v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), v8, v12);
        else
          v13 = (id)objc_msgSend(v8, "copy");
      }
      else
      {
        v13 = v12;
      }
      v14 = objc_retainAutorelease(v13);
      v15 = (const char *)objc_msgSend(v14, "UTF8String");
      v16 = dispatch_queue_create(v15, MEMORY[0x1E0C80D50]);
      if (v16)
      {
        v17 = objc_alloc(MEMORY[0x1E0CB3940]);
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (!v8 || v6)
          v21 = objc_msgSend(v17, "initWithFormat:", CFSTR("%@-%@"), v19, v14, v24);
        else
          v21 = objc_msgSend(v17, "initWithFormat:", CFSTR("%@-%@-%@"), v19, v14, v12);
        v22 = (void *)v21;

        if (v22 && v12)
        {
          -[AXAccessQueue setThreadLocalStorageKey:](v10, "setThreadLocalStorageKey:", v22);
          -[AXAccessQueue setConcurrentQueue:](v10, "setConcurrentQueue:", v16);
          -[AXAccessQueue setSpecialBehaviors:](v10, "setSpecialBehaviors:", a5);
LABEL_20:

          goto LABEL_21;
        }

      }
      else
      {
        v22 = v10;
      }
      v10 = 0;
      goto LABEL_20;
    }
    -[AXAccessQueue setSpecialBehaviors:](v9, "setSpecialBehaviors:", a5);
  }
LABEL_21:

  return v10;
}

- (void)setSpecialBehaviors:(unint64_t)a3
{
  self->_specialBehaviors = a3;
}

+ (id)backgroundAccessQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AXAccessQueue_backgroundAccessQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (backgroundAccessQueue__AXBackgroundAccessQueueOnceToken != -1)
    dispatch_once(&backgroundAccessQueue__AXBackgroundAccessQueueOnceToken, block);
  return (id)backgroundAccessQueue__AXBackgroundAccessQueue;
}

void __38__AXAccessQueue_backgroundAccessQueue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithParentClass:description:appendUUIDToLabel:", *(_QWORD *)(a1 + 32), CFSTR("GlobalBackgroundQueue"), 0);
  v2 = (void *)backgroundAccessQueue__AXBackgroundAccessQueue;
  backgroundAccessQueue__AXBackgroundAccessQueue = v1;

}

- (AXAccessQueue)init
{
  return -[AXAccessQueue initWithLabel:appendUUIDToLabel:](self, "initWithLabel:appendUUIDToLabel:", 0, 1);
}

- (AXAccessQueue)initWithLabel:(id)a3 appendUUIDToLabel:(BOOL)a4
{
  return (AXAccessQueue *)-[AXAccessQueue _initWithLabel:appendUUIDToLabel:specialBehaviors:](self, "_initWithLabel:appendUUIDToLabel:specialBehaviors:", a3, a4, 0);
}

- (AXAccessQueue)initWithParentClass:(Class)a3 description:(id)a4 appendUUIDToLabel:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  AXAccessQueue *v16;
  uint64_t v18;

  v5 = a5;
  v8 = a4;
  if (a3)
  {
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_6;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v8)
    v14 = objc_msgSend(v13, "initWithFormat:", CFSTR("%@.%@.%@"), v11, v9, v8);
  else
    v14 = objc_msgSend(v13, "initWithFormat:", CFSTR("%@.%@"), v11, v9, v18);
  v15 = (void *)v14;
  v16 = -[AXAccessQueue initWithLabel:appendUUIDToLabel:](self, "initWithLabel:appendUUIDToLabel:", v14, v5);

  return v16;
}

- (NSString)label
{
  __CFString *v3;
  NSObject *v4;
  const char *label;

  if (-[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
  {
    v3 = CFSTR("Main access queue");
  }
  else
  {
    -[AXAccessQueue concurrentQueue](self, "concurrentQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    label = dispatch_queue_get_label(v4);

    if (label)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", label);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (BOOL)behavesWithoutErrorReporting
{
  return (-[AXAccessQueue specialBehaviors](self, "specialBehaviors") >> 1) & 1;
}

- (void)performSynchronousReadingBlock:(id)a3
{
  id v4;

  v4 = a3;
  if (-[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
    AXPerformBlockSynchronouslyOnMainThread(v4);
  else
    -[AXAccessQueue _performBlock:withDispatchFunction:synchronously:accessQueueContext:](self, "_performBlock:withDispatchFunction:synchronously:accessQueueContext:", v4, MEMORY[0x1E0C82F90], 1, 1);

}

- (void)performAsynchronousReadingBlock:(id)a3
{
  id block;

  block = a3;
  if (-[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
    AXPerformBlockAsynchronouslyOnMainThread(block);
  else
    -[AXAccessQueue _performBlock:withDispatchFunction:synchronously:accessQueueContext:](self, "_performBlock:withDispatchFunction:synchronously:accessQueueContext:", block, MEMORY[0x1E0C82C00], 0, 1);

}

- (void)performAsynchronousWritingBlock:(id)a3
{
  id block;

  block = a3;
  if (-[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
    AXPerformBlockAsynchronouslyOnMainThread(block);
  else
    -[AXAccessQueue _performBlock:withDispatchFunction:synchronously:accessQueueContext:](self, "_performBlock:withDispatchFunction:synchronously:accessQueueContext:", block, MEMORY[0x1E0C82C28], 0, 2);

}

- (void)afterDelay:(double)a3 processReadingBlock:(id)a4
{
  id v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (-[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
  {
    AXPerformBlockOnMainThreadAfterDelay(v6, a3);
  }
  else
  {
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    -[AXAccessQueue concurrentQueue](self, "concurrentQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__AXAccessQueue_afterDelay_processReadingBlock___block_invoke;
    v9[3] = &unk_1E28C2CD0;
    v9[4] = self;
    v10 = v6;
    dispatch_after(v7, v8, v9);

  }
}

uint64_t __48__AXAccessQueue_afterDelay_processReadingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performBlock:withDispatchFunction:synchronously:accessQueueContext:", *(_QWORD *)(a1 + 40), _AXAccessQueuePerformBlockNoQueueingOrLocking, 1, 1);
}

- (void)afterDelay:(double)a3 processWritingBlock:(id)a4
{
  id v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (-[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
  {
    AXPerformBlockOnMainThreadAfterDelay(v6, a3);
  }
  else
  {
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__AXAccessQueue_afterDelay_processWritingBlock___block_invoke;
    v9[3] = &unk_1E28C2CD0;
    v9[4] = self;
    v10 = v6;
    dispatch_after(v7, v8, v9);

  }
}

uint64_t __48__AXAccessQueue_afterDelay_processWritingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAsynchronousWritingBlock:", *(_QWORD *)(a1 + 40));
}

- (BOOL)canReadInCurrentExecutionThread
{
  if (-[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
    return objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  else
    return -[AXAccessQueue _accessQueueContextInCurrentExecutionThread](self, "_accessQueueContextInCurrentExecutionThread")- 1 < 2;
}

- (BOOL)canWriteInCurrentExecutionThread
{
  if (-[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
    return objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  else
    return -[AXAccessQueue _accessQueueContextInCurrentExecutionThread](self, "_accessQueueContextInCurrentExecutionThread") == 2;
}

- (BOOL)canOnlyReadInCurrentExecutionThread
{
  return !-[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue")
      && -[AXAccessQueue _accessQueueContextInCurrentExecutionThread](self, "_accessQueueContextInCurrentExecutionThread") == 1;
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
  -[AXAccessQueue label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; label = \"%@\">"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)_accessQueueContextInCurrentExecutionThread
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  if (!-[AXAccessQueue behavesWithoutErrorReporting](self, "behavesWithoutErrorReporting")
    && -[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
  {
    AXLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[AXAccessQueue _accessQueueContextInCurrentExecutionThread].cold.1(a2);

  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAccessQueue threadLocalStorageKey](self, "threadLocalStorageKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return v9;
}

- (void)_performBlock:(id)a3 withDispatchFunction:(void *)a4 synchronously:(BOOL)a5 accessQueueContext:(unint64_t)a6
{
  _BOOL4 v7;
  id v11;
  void *v12;
  NSObject *v13;
  void (**v14)(_QWORD);
  NSObject *v15;
  unint64_t v16;
  void *v17;
  _QWORD v18[5];
  void (**v19)(_QWORD);
  unint64_t v20;

  v7 = a5;
  v11 = a3;
  v12 = v11;
  if (!v11)
  {
    AXLogUI();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[AXAccessQueue _performBlock:withDispatchFunction:synchronously:accessQueueContext:].cold.2(v13);

    v11 = &__block_literal_global_24;
  }
  v14 = (void (**)(_QWORD))_Block_copy(v11);

  if (!-[AXAccessQueue behavesWithoutErrorReporting](self, "behavesWithoutErrorReporting")
    && -[AXAccessQueue behavesAsMainQueue](self, "behavesAsMainQueue"))
  {
    AXLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[AXAccessQueue _accessQueueContextInCurrentExecutionThread].cold.1(a2);

  }
  if (!v7)
    goto LABEL_15;
  v16 = -[AXAccessQueue _accessQueueContextInCurrentExecutionThread](self, "_accessQueueContextInCurrentExecutionThread");
  if (v16 != 2)
  {
    if (v16 == 1)
    {
      if (a6 != 1)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Trying to synchronously execute a writing block from within a reading block. This is illegal."));
        goto LABEL_16;
      }
      goto LABEL_14;
    }
LABEL_15:
    -[AXAccessQueue concurrentQueue](self, "concurrentQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__AXAccessQueue__performBlock_withDispatchFunction_synchronously_accessQueueContext___block_invoke_20;
    v18[3] = &unk_1E28C39B0;
    v18[4] = self;
    v20 = a6;
    v19 = v14;
    ((void (*)(void *, _QWORD *))a4)(v17, v18);

    goto LABEL_16;
  }
LABEL_14:
  v14[2](v14);
LABEL_16:

}

void __85__AXAccessQueue__performBlock_withDispatchFunction_synchronously_accessQueueContext___block_invoke_20(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "threadLocalStorageKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

- (NSString)threadLocalStorageKey
{
  return self->_threadLocalStorageKey;
}

- (void)setThreadLocalStorageKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setConcurrentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_threadLocalStorageKey, 0);
}

- (void)_accessQueueContextInCurrentExecutionThread
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sel_getName(a1);
  OUTLINED_FUNCTION_1_1(&dword_18EBEC000, v1, v2, "%s makes no sense with the main access queue.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_performBlock:(os_log_t)log withDispatchFunction:synchronously:accessQueueContext:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18EBEC000, log, OS_LOG_TYPE_FAULT, "block must not be nil.", v1, 2u);
}

@end
