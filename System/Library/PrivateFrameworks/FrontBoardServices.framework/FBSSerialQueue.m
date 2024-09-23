@implementation FBSSerialQueue

+ (FBSSerialQueue)queueWithMainRunLoopModes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[modes count] > 0"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSerialQueue queueWithMainRunLoopModes:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EC5D8);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mode (%@) is not a string"), v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            +[FBSSerialQueue queueWithMainRunLoopModes:].cold.2();
          objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A6EC574);
        }
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v12 = -[FBSMainRunLoopSerialQueue _initWithModes:]([FBSMainRunLoopSerialQueue alloc], v5);
  return (FBSSerialQueue *)v12;
}

+ (id)_queueWithSerialDispatchQueue:(id)a3
{
  id v3;
  void *v4;
  id *v5;
  id result;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = -[FBSDispatchSerialQueue _initWithQueue:]((id *)[FBSDispatchSerialQueue alloc], v3);

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("serialQueue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSerialQueue _queueWithSerialDispatchQueue:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSSerialQueue)init
{
  FBSSerialQueue *v3;

  +[FBSDispatchSerialQueue _mainQueue]();
  v3 = (FBSSerialQueue *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)mainDispatchQueue
{
  return +[FBSDispatchSerialQueue _mainQueue]();
}

+ (FBSSerialQueue)queueWithDispatchQueue:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  FBSSerialQueue *result;
  void *v8;
  _QWORD block[4];
  NSObject *v10;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    if (v3 == (id)MEMORY[0x1E0C80D38])
    {
      +[FBSDispatchSerialQueue _mainQueue]();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__FBSSerialQueue_queueWithDispatchQueue___block_invoke;
      block[3] = &unk_1E38EAE78;
      v5 = v3;
      v10 = v5;
      dispatch_async(v5, block);
      v6 = -[FBSDispatchSerialQueue _initWithQueue:]((id *)[FBSDispatchSerialQueue alloc], v5);

    }
    return (FBSSerialQueue *)v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSerialQueue queueWithDispatchQueue:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = (FBSSerialQueue *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __41__FBSSerialQueue_queueWithDispatchQueue___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_barrier(*(dispatch_queue_t *)(a1 + 32));
}

- (void)performAsync:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSSerialQueue *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;

  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138413314;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = CFSTR("FBSSerialQueue.m");
    v17 = 1024;
    v18 = 83;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v9, 0x30u);

  }
  __break(0);
}

- (void)performAfter:(double)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  FBSSerialQueue *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;

  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413314;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = CFSTR("FBSSerialQueue.m");
    v18 = 1024;
    v19 = 87;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v10, 0x30u);

  }
  __break(0);
}

- (void)assertBarrierOnQueue
{
  void *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  FBSSerialQueue *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138413314;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    v11 = 2048;
    v12 = self;
    v13 = 2112;
    v14 = CFSTR("FBSSerialQueue.m");
    v15 = 1024;
    v16 = 93;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v7, 0x30u);

  }
  __break(0);
}

- (id)backingQueueIfExists
{
  return 0;
}

- (void)performAsync:(id)a3 withHandoff:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  FBSSerialQueue *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;

  v7 = a3;
  v8 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413314;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = CFSTR("FBSSerialQueue.m");
    v20 = 1024;
    v21 = 101;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v12, 0x30u);

  }
  __break(0);
}

+ (void)_queueWithSerialDispatchQueue:.cold.1()
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

+ (void)queueWithDispatchQueue:.cold.1()
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

+ (void)queueWithMainRunLoopModes:.cold.1()
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

+ (void)queueWithMainRunLoopModes:.cold.2()
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
