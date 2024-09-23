@implementation FBWorkspaceIncomingConnection

- (id)initWithWorkspace:(id *)a1
{
  if (a1)
    return -[FBWorkspaceConnection _initWithWorkspace:](a1, a2);
  return a1;
}

- (void)workspaceLock_setConnection:(uint64_t)a1
{
  id v3;
  void *v4;
  os_unfair_lock *v5;
  _QWORD *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  _QWORD block[5];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("incomingConnection"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceIncomingConnection workspaceLock_setConnection:].cold.1();
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35FBF74);
    }
    v5 = (os_unfair_lock *)*(id *)(a1 + 8);
    -[FBWorkspace _assertLocked](v5);
    -[os_unfair_lock process](v5, "process");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspaceConnection _workspaceLock_connection]((const os_unfair_lock **)a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    FBLogProcessWorkspace();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FBWorkspaceIncomingConnection workspaceLock_setConnection:].cold.2(v6, v9);

      objc_msgSend(v4, "invalidate");
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[FBProcess logProem](v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v10;
        _os_log_impl(&dword_1A359A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection established.", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0D232C8], "interface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __61__FBWorkspaceIncomingConnection_workspaceLock_setConnection___block_invoke;
      v23[3] = &unk_1E4A129E8;
      v13 = v6;
      v24 = v13;
      -[FBWorkspaceConnection _workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:](a1, v4, v11, 0, v23);

      -[FBWorkspaceConnection _workspaceLock_connection]((const os_unfair_lock **)a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "remoteTarget");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      FBLogProcessWorkspace();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[FBProcess logProem](v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v17;
        v27 = 2114;
        v28 = v15;
        _os_log_impl(&dword_1A359A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ created proxy of %{public}@", buf, 0x16u);

      }
      -[FBWorkspace _connectionQueue]((id *)v5);
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __61__FBWorkspaceIncomingConnection_workspaceLock_setConnection___block_invoke_47;
      block[3] = &unk_1E4A11FD0;
      block[4] = a1;
      v22 = v15;
      v19 = v15;
      dispatch_async(v18, block);

    }
  }

}

uint64_t __61__FBWorkspaceIncomingConnection_workspaceLock_setConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  FBLogProcessWorkspace();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    -[FBProcess logProem](*(_QWORD **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A359A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Workspace connection invalidated.", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_notePendingExitForReason:", CFSTR("workspace client connection invalidated"));
}

void __61__FBWorkspaceIncomingConnection_workspaceLock_setConnection___block_invoke_47(uint64_t a1)
{
  -[FBWorkspaceConnection _flushConnectBlocksWithProxy:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)workspaceLock_setConnection:.cold.1()
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

- (void)workspaceLock_setConnection:(_QWORD *)a1 .cold.2(_QWORD *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[FBProcess logProem](a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_7(&dword_1A359A000, a2, v4, "%{public}@ Unexpectedly attempted to assign a new connection to a workspace server with an existing connection.", (uint8_t *)&v5);

}

@end
