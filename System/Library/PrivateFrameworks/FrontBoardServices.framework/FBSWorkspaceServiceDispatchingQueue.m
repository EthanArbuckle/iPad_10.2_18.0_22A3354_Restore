@implementation FBSWorkspaceServiceDispatchingQueue

- (id)_initWithTargetQueue:(void *)a3 callOutQueue:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!a1)
    goto LABEL_7;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("targetQueue != ((void *)0)"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceServiceDispatchingQueue _initWithTargetQueue:callOutQueue:].cold.1();
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EF7D0);
  }
  v9 = v7;
  NSClassFromString(CFSTR("FBSSerialQueue"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceServiceDispatchingQueue _initWithTargetQueue:callOutQueue:].cold.2();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EF834);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSerialQueueClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceServiceDispatchingQueue _initWithTargetQueue:callOutQueue:].cold.2();
    goto LABEL_16;
  }

  v14.receiver = a1;
  v14.super_class = (Class)FBSWorkspaceServiceDispatchingQueue;
  v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
  a1 = v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a2);
    objc_storeStrong(a1 + 2, a3);
  }
LABEL_7:

  return a1;
}

- (void)assertBarrierOnQueue
{
  -[FBSSerialQueue assertBarrierOnQueue](self->_callOutQueue, "assertBarrierOnQueue");
}

- (id)backingQueueIfExists
{
  return -[FBSSerialQueue backingQueueIfExists](self->_callOutQueue, "backingQueueIfExists");
}

- (void)performAsync:(id)a3
{
  id v4;
  NSObject *targetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__FBSWorkspaceServiceDispatchingQueue_performAsync___block_invoke;
  v7[3] = &unk_1E38EBB98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(targetQueue, v7);

}

uint64_t __52__FBSWorkspaceServiceDispatchingQueue_performAsync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "performAsync:", *(_QWORD *)(a1 + 40));
}

- (void)performAsync:(id)a3 withHandoff:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = a3;
  v8 = a4;
  v9 = v5;
  v6 = v8;
  v7 = v5;
  xpc_dictionary_handoff_reply();

}

uint64_t __64__FBSWorkspaceServiceDispatchingQueue_performAsync_withHandoff___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "performAsync:withHandoff:", a1[6], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

- (void)_initWithTargetQueue:callOutQueue:.cold.1()
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

- (void)_initWithTargetQueue:callOutQueue:.cold.2()
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
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
