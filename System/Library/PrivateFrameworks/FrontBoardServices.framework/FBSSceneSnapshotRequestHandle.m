@implementation FBSSceneSnapshotRequestHandle

+ (id)handleForRequestType:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestType:context:", a3, v6);

  return v7;
}

- (FBSSceneSnapshotRequestHandle)initWithRequestType:(unint64_t)a3 context:(id)a4
{
  id v7;
  FBSSceneSnapshotRequestHandle *v8;
  FBSSceneSnapshotRequestHandle *v9;

  v7 = a4;
  v8 = -[FBSSceneSnapshotRequestHandle init](self, "init");
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v9;
}

- (void)performRequestForScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  FBSSceneSnapshotRequestHandle *v10;
  _BOOL4 canceled;
  NSObject *v12;
  NSObject *v13;
  unint64_t type;
  dispatch_semaphore_t v15;
  BSActionResponder *v16;
  BSActionResponder *responder;
  BSActionResponder *v18;
  void *SerialWithQoS;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  NSObject *v30;
  uint8_t buf[4];
  FBSSceneSnapshotRequestHandle *v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneSnapshotRequestHandle performRequestForScene:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A73ACB0);
  }
  v6 = v5;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneSnapshotContext sceneID](self->_context, "sceneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[scene identifier] isEqualToString:[_context sceneID]]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneSnapshotRequestHandle performRequestForScene:].cold.3(a2);
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A73AD14);
  }
  if (self->_responder)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot perform this twice"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneSnapshotRequestHandle performRequestForScene:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A73AD6CLL);
  }
  v10 = self;
  objc_sync_enter(v10);
  canceled = v10->_canceled;
  if (v10->_canceled)
  {
    v12 = 0;
  }
  else
  {
    FBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      type = v10->_type;
      *(_DWORD *)buf = 134218240;
      v32 = v10;
      v33 = 2048;
      v34 = type;
      _os_log_impl(&dword_19A6D4000, v13, OS_LOG_TYPE_DEFAULT, "Performing snapshot request %p (type %lu)", buf, 0x16u);
    }

    if (v10->_type == 1)
      v15 = dispatch_semaphore_create(0);
    else
      v15 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __56__FBSSceneSnapshotRequestHandle_performRequestForScene___block_invoke;
    v29[3] = &unk_1E38ED610;
    v29[4] = v10;
    v12 = v15;
    v30 = v12;
    objc_msgSend(off_1E38E9DB8, "responderWithHandler:", v29);
    v16 = (BSActionResponder *)objc_claimAutoreleasedReturnValue();
    responder = self->_responder;
    self->_responder = v16;

    v18 = self->_responder;
    SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();
    -[BSActionResponder setQueue:](v18, "setQueue:", SerialWithQoS);

    v20 = -[BSActionResponder setTimeout:](self->_responder, "setTimeout:", dispatch_time(0, 5000000000));
    if (self->_responder)
    {
      v21 = (void *)MEMORY[0x19AECA15C](v20);
      v22 = (void *)MEMORY[0x1E0C99E60];
      v23 = -[FBSSceneSnapshotRequestAction _initWithType:context:responder:]([FBSSceneSnapshotRequestAction alloc], "_initWithType:context:responder:", v10->_type, self->_context, self->_responder);
      objc_msgSend(v22, "setWithObject:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendActions:", v24);

      objc_autoreleasePoolPop(v21);
    }

  }
  objc_sync_exit(v10);

  if (v12)
    v25 = canceled;
  else
    v25 = 1;
  if (!v25)
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

}

void __56__FBSSceneSnapshotRequestHandle_performRequestForScene___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t *)(a1 + 32);
  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "_clearAction");
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  FBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__FBSSceneSnapshotRequestHandle_performRequestForScene___block_invoke_cold_1(v4, v6, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *v4;
    v11 = 134217984;
    v12 = v9;
    _os_log_impl(&dword_19A6D4000, v8, OS_LOG_TYPE_DEFAULT, "Snapshot request %p complete", (uint8_t *)&v11, 0xCu);
  }

  v10 = *(NSObject **)(a1 + 40);
  if (v10)
    dispatch_semaphore_signal(v10);

}

- (void)cancelRequest
{
  FBSSceneSnapshotRequestHandle *v2;
  NSObject *v3;
  int v4;
  FBSSceneSnapshotRequestHandle *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_canceled)
  {
    FBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = v2;
      _os_log_impl(&dword_19A6D4000, v3, OS_LOG_TYPE_DEFAULT, "Snapshot request %p canceled", (uint8_t *)&v4, 0xCu);
    }

    v2->_canceled = 1;
    -[BSActionResponder annul](v2->_responder, "annul");
    -[FBSSceneSnapshotRequestHandle _clearAction](v2, "_clearAction");
  }
  objc_sync_exit(v2);

}

- (void)_clearAction
{
  BSActionResponder *responder;
  FBSSceneSnapshotRequestHandle *obj;

  obj = self;
  objc_sync_enter(obj);
  responder = obj->_responder;
  obj->_responder = 0;

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)performRequestForScene:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)performRequestForScene:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)performRequestForScene:(const char *)a1 .cold.3(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __56__FBSSceneSnapshotRequestHandle_performRequestForScene___block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_19A6D4000, a3, OS_LOG_TYPE_ERROR, "Snapshot request %p complete with error: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
