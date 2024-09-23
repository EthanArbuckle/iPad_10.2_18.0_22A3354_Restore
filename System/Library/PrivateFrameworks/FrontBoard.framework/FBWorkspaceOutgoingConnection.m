@implementation FBWorkspaceOutgoingConnection

- (id)initWithWorkspace:(id *)result
{
  if (result)
  {
    result = -[FBWorkspaceConnection _initWithWorkspace:](result, a2);
    if (result)
      *((_BYTE *)result + 33) = 0;
  }
  return result;
}

- (void)workspaceLock_setEndpoint:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  os_unfair_lock *v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  _QWORD *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("endpoint"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceOutgoingConnection workspaceLock_setEndpoint:].cold.1();
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35FC444);
    }
    objc_msgSend(v3, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D232C8], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("outgoing endpoint is for the wrong service : %@"), v4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceOutgoingConnection workspaceLock_setEndpoint:].cold.3();
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35FC4A0);
    }
    v8 = (os_unfair_lock *)*(id *)(a1 + 8);
    -[FBWorkspace _assertLocked](v8);
    -[os_unfair_lock process](v8, "process");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspaceConnection _workspaceLock_connection]((const os_unfair_lock **)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    FBLogProcessWorkspace();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        -[FBProcess logProem](v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v33 = v13;
        v34 = 2114;
        v35 = v4;
        v36 = 2114;
        v37 = v14;
        _os_log_impl(&dword_1A359A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring outgoing endpoint due to already established connection : endpoint=%{public}@ existing=%{public}@", buf, 0x20u);

      }
      if ((objc_msgSend(v4, "isEqualToServiceEndpoint:", *(_QWORD *)(a1 + 40)) & 1) == 0)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        -[FBProcess logProem](v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ already have an outgoing connection but the endpoint doesn't match existing : new=%@ existing=%@"), v16, v4, *(_QWORD *)(a1 + 40));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[FBWorkspaceOutgoingConnection workspaceLock_setEndpoint:].cold.2();
        objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A35FC258);
      }
    }
    else
    {
      if (v12)
      {
        -[FBProcess logProem](v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v18;
        v34 = 2114;
        v35 = v4;
        _os_log_impl(&dword_1A359A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating outgoing connection to %{public}@.", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0D23010], "connectionWithEndpoint:clientContextBuilder:", v4, &__block_literal_global_26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)a1;
      objc_msgSend(MEMORY[0x1E0D232C8], "invertedInterface");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_2;
      v29[3] = &unk_1E4A14558;
      v30 = v9;
      v31 = v20;
      v26[0] = v22;
      v26[1] = 3221225472;
      v26[2] = __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_60;
      v26[3] = &unk_1E4A14558;
      v27 = v31;
      v28 = v30;
      v23 = v31;
      -[FBWorkspaceConnection _workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:]((uint64_t)v23, v19, v21, v29, v26);

    }
  }

}

uint64_t __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeBool:forKey:", 1, CFSTR("targetsClientEndpoint"));
}

void __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "remoteToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "versionedPID");
  if (v5 == -1 || v5 != objc_msgSend(*(id *)(a1 + 32), "versionedPID"))
  {
    FBLogProcessWorkspace();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_2_cold_1(a1, (uint64_t)v4, v8);

    -[FBWorkspaceConnection _workspace](*(id **)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    FBSceneErrorCreate(3uLL, CFSTR("FBWorkspaceOutgoingConnection failed process verification."), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspace _queue_unverifiedOutgoingConnection:didError:]((uint64_t)v7, v9, v10);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 33) = 1;
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspaceConnection _flushConnectBlocksWithProxy:](v6, v7);
  }

}

void __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_60(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 33);
  FBLogProcessWorkspace();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      -[FBProcess logProem](*(_QWORD **)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1A359A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Verified outgoing workspace connection invalidated.", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "_notePendingExitForReason:", CFSTR("verified outgoing workspace client connection invalidated"));
  }
  else
  {
    if (v4)
    {
      -[FBProcess logProem](*(_QWORD **)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1A359A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Unverified outgoing workspace connection invalidated.", (uint8_t *)&v10, 0xCu);

    }
    -[FBWorkspaceConnection _workspace](*(id **)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    FBSceneErrorCreate(4uLL, CFSTR("FBWorkspaceOutgoingConnection invalidated before process verification."), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspace _queue_unverifiedOutgoingConnection:didError:]((uint64_t)v7, v8, v9);

  }
}

- (BOOL)queue_isVerified
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    -[FBWorkspace _connectionQueue](*(id **)(result + 8));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    BSDispatchQueueAssert();

    return *(_BYTE *)(v1 + 33) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_verified, 0);
}

- (void)workspaceLock_setEndpoint:.cold.1()
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

- (void)workspaceLock_setEndpoint:.cold.2()
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

- (void)workspaceLock_setEndpoint:.cold.3()
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

void __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[FBProcess logProem](*(_QWORD **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = 138543874;
  v9 = v6;
  v10 = 2114;
  v11 = a2;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_1A359A000, a3, OS_LOG_TYPE_ERROR, "%{public}@ Outgoing workspace connection does not match expected process. remoteToken=%{public}@ process=%{public}@", (uint8_t *)&v8, 0x20u);

}

@end
