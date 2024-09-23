@implementation FBWorkspaceConnection

- (id)_initWithWorkspace:(id *)a1
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FBWorkspaceConnection;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      v6 = objc_opt_new();
      v7 = a1[3];
      a1[3] = (id)v6;

      *((_BYTE *)a1 + 32) = 1;
    }
  }

  return a1;
}

- (id)_workspace
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

- (const)_workspaceLock_connection
{
  const os_unfair_lock **v1;

  if (a1)
  {
    v1 = a1;
    -[FBWorkspace _assertLocked](a1[1]);
    a1 = (id)v1[2];
  }
  return a1;
}

- (void)_workspaceLock_setConnection:(void *)a3 withInterface:(void *)a4 activationHandler:(void *)a5 invalidationHandler:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v19 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    -[FBWorkspace _assertLocked](*(const os_unfair_lock **)(a1 + 8));
    if (*(_QWORD *)(a1 + 24))
    {
      objc_storeStrong((id *)(a1 + 16), a2);
      os_unfair_lock_lock((os_unfair_lock_t)&_connectionsLock);
      v13 = (void *)_connectionsLock_connectionByConnection;
      if (!_connectionsLock_connectionByConnection)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 512);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)_connectionsLock_connectionByConnection;
        _connectionsLock_connectionByConnection = v14;

        v13 = (void *)_connectionsLock_connectionByConnection;
      }
      objc_msgSend(v13, "objectForKey:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend((id)_connectionsLock_connectionByConnection, "setObject:forKey:", a1, v19);
        os_unfair_lock_unlock((os_unfair_lock_t)&_connectionsLock);
        v17 = *(void **)(a1 + 16);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __106__FBWorkspaceConnection__workspaceLock_setConnection_withInterface_activationHandler_invalidationHandler___block_invoke;
        v20[3] = &unk_1E4A14510;
        v20[4] = a1;
        v21 = v10;
        v22 = v11;
        v23 = v12;
        objc_msgSend(v17, "configureConnection:", v20);
        objc_msgSend(*(id *)(a1 + 16), "activate");

        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("should not be possible to have an existing mapping for connection=%p : existing=%@"), v19, _connectionsLock_connectionByConnection);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceConnection _workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:].cold.2();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot set connection if we've already been invalidated : conn=%@"), v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceConnection _workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:].cold.1();
    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35FB3A8);
  }
LABEL_7:

}

void __106__FBWorkspaceConnection__workspaceLock_setConnection_withInterface_activationHandler_invalidationHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  -[FBWorkspace _connectionQueue](*(id **)(a1[4] + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTargetQueue:", v3);

  objc_msgSend(MEMORY[0x1E0D232C8], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setInterface:", a1[5]);
  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1[4] + 8));
  if (a1[6])
    objc_msgSend(v5, "setActivationHandler:");
  objc_msgSend(v5, "setInvalidationHandler:", a1[7]);

}

- (void)_flushConnectBlocksWithProxy:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[FBWorkspace _lock](*(os_unfair_lock_s **)(a1 + 8));
    v4 = *(id *)(a1 + 24);
    v5 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    -[FBWorkspace _unlock](*(os_unfair_lock_s **)(a1 + 8));
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (id)queue
{
  if (a1)
  {
    -[FBWorkspace _queue](a1[1]);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)remoteProcess
{
  if (a1)
  {
    objc_msgSend(a1[1], "process");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_workspaceScene:(void *)a3 enqueueConnectBlock:
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = (void (**)(_QWORD, _QWORD))v5;
  if (!a1)
  {
LABEL_9:

    return;
  }
  if (v5)
  {
    -[FBWorkspace _connectionQueue](*(id **)(a1 + 8));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BSDispatchQueueAssert();

    -[FBWorkspace _lock](*(os_unfair_lock_s **)(a1 + 8));
    v8 = *(void **)(a1 + 24);
    if (v8)
    {
      v9 = (void *)objc_msgSend(v6, "copy");
      v10 = (void *)MEMORY[0x1A8590C4C]();
      objc_msgSend(v8, "addObject:", v10);

      -[FBWorkspace _unlock](*(os_unfair_lock_s **)(a1 + 8));
    }
    else
    {
      if (*(_BYTE *)(a1 + 32))
      {
        objc_msgSend(*(id *)(a1 + 16), "remoteTarget");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      -[FBWorkspace _unlock](*(os_unfair_lock_s **)(a1 + 8));
      ((void (**)(_QWORD, void *))v6)[2](v6, v11);

    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block != ((void *)0)"), v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBWorkspaceConnection _workspaceScene:enqueueConnectBlock:].cold.1();
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (id)_workspaceScene:(uint64_t)a3 acquireAssertionWithState:
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 8);
    objc_msgSend(a2, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspace _acquireAssertionForReason:withState:](v4, v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)currentWorkspaceConnection
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  id result;
  void *v7;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v0 = objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = (void *)v0;
    os_unfair_lock_lock((os_unfair_lock_t)&_connectionsLock);
    objc_msgSend((id)_connectionsLock_connectionByConnection, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)&_connectionsLock);
    if (v2)
    {
      v3 = v2;
    }
    else
    {
      FBLogProcessWorkspace();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[FBWorkspaceConnection currentWorkspaceConnection].cold.2((uint64_t)v1, v4, v5);

    }
    return v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("if we're asking for the currentContext and we don't have it then something must have gone seriously wrong"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnection currentWorkspaceConnection].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)workspaceLock_isValid
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    -[FBWorkspace _assertLocked](*(const os_unfair_lock **)(result + 8));
    return *(_BYTE *)(v1 + 32) != 0;
  }
  return result;
}

- (BOOL)isOutgoing
{
  uint64_t v1;

  if (result)
  {
    v1 = objc_opt_class();
    return v1 == objc_opt_class();
  }
  return result;
}

- (void)workspaceLock_enqueueConnectBlock:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
LABEL_9:

    return;
  }
  if (v3)
  {
    -[FBWorkspace _assertLocked](*(const os_unfair_lock **)(a1 + 8));
    v5 = *(void **)(a1 + 24);
    if (v5)
    {
      v6 = (void *)objc_msgSend(v4, "copy");
      v7 = (void *)MEMORY[0x1A8590C4C]();
      objc_msgSend(v5, "addObject:", v7);

    }
    else
    {
      if (*(_BYTE *)(a1 + 32))
      {
        objc_msgSend(*(id *)(a1 + 16), "remoteTarget");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      -[FBWorkspace _queue](*(id **)(a1 + 8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __59__FBWorkspaceConnection_workspaceLock_enqueueConnectBlock___block_invoke;
      v12[3] = &unk_1E4A13090;
      v13 = v8;
      v14 = v4;
      v10 = v8;
      objc_msgSend(v9, "performAsync:", v12);

    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block != ((void *)0)"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:].cold.1();
  objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __59__FBWorkspaceConnection_workspaceLock_enqueueConnectBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)workspaceLock_invalidate
{
  id *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  id *result;
  void *v9;

  v1 = (id *)a1;
  if (!a1)
    return v1;
  -[FBWorkspace _assertLocked](a1[1]);
  v2 = v1[3];
  v3 = v1[3];
  v1[3] = 0;

  os_unfair_lock_lock((os_unfair_lock_t)&_connectionsLock);
  objc_msgSend((id)_connectionsLock_connectionByConnection, "objectForKey:", v1[2]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4 == (_QWORD)v1;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend((id)_connectionsLock_connectionByConnection, "removeObjectForKey:", v1[2]);
    os_unfair_lock_unlock((os_unfair_lock_t)&_connectionsLock);
    objc_msgSend(v1[2], "invalidate");
    *((_BYTE *)v1 + 32) = 0;
    if (objc_msgSend(v2, "count"))
      v7 = v2;
    else
      v7 = 0;
    v1 = v7;

    return v1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("should not be possible to map to something other than connection=%p for connection=%@ : existing=%@"), v1, v1[2], v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBWorkspaceConnection workspaceLock_invalidate].cold.1();
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  result = (id *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspaceLock_waitForConnectBlocks, 0);
  objc_storeStrong((id *)&self->_workspaceLock_connection, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

- (void)_workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:.cold.1()
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

- (void)_workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:.cold.2()
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

- (void)_workspaceScene:enqueueConnectBlock:.cold.1()
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

+ (void)currentWorkspaceConnection
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_7(&dword_1A359A000, a2, a3, "Could not find workspaceConnection for currentConnection=%{public}@", (uint8_t *)&v3);
}

- (void)workspaceLock_enqueueConnectBlock:.cold.1()
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

- (void)workspaceLock_invalidate
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
