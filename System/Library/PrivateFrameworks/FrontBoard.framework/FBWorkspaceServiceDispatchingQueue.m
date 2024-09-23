@implementation FBWorkspaceServiceDispatchingQueue

- (id)_initWithTargetQueue:(id)a3
{
  id v5;
  void *v6;
  FBWorkspaceServiceDispatchingQueue *v7;
  FBWorkspaceServiceDispatchingQueue *v8;
  id result;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)FBWorkspaceServiceDispatchingQueue;
    v7 = -[FBWorkspaceServiceDispatchingQueue init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_targetQueue, a3);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("targetQueue != ((void *)0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceServiceDispatchingQueue _initWithTargetQueue:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)backingQueueIfExists
{
  return 0;
}

- (void)performAsync:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__FBWorkspaceServiceDispatchingQueue_performAsync___block_invoke;
  block[3] = &unk_1E4A12168;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, block);

}

void __51__FBWorkspaceServiceDispatchingQueue_performAsync___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (void)performAsync:(id)a3 withHandoff:(id)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  xpc_dictionary_handoff_reply();

}

void __63__FBWorkspaceServiceDispatchingQueue_performAsync_withHandoff___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

- (void)_initWithTargetQueue:.cold.1()
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

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
