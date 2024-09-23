@implementation FBServiceFacilityServerClientHandle

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (FBServiceFacilityServerClientHandle)initWithFacilityID:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  FBServiceFacilityServerClientHandle *v10;
  uint64_t v11;
  NSString *facilityID;
  uint64_t v13;
  BSProcessHandle *processHandle;
  void *v15;
  uint64_t v16;
  FBProcess *process;
  void *v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("facilityID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBServiceFacilityServerClientHandle initWithFacilityID:connection:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B09DCLL);
  }
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("connection"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBServiceFacilityServerClientHandle initWithFacilityID:connection:].cold.2(a2);
    goto LABEL_11;
  }
  v20.receiver = self;
  v20.super_class = (Class)FBServiceFacilityServerClientHandle;
  v10 = -[FBServiceFacilityServerClientHandle init](&v20, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    facilityID = v10->_facilityID;
    v10->_facilityID = (NSString *)v11;

    objc_storeStrong((id *)&v10->_connection, a4);
    objc_msgSend(v9, "remoteProcess");
    v13 = objc_claimAutoreleasedReturnValue();
    processHandle = v10->_processHandle;
    v10->_processHandle = (BSProcessHandle *)v13;

    +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerProcessForHandle:", v10->_processHandle);
    v16 = objc_claimAutoreleasedReturnValue();
    process = v10->_process;
    v10->_process = (FBProcess *)v16;

  }
  return v10;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_facilityID, 0, 1);
  FBSProcessPrettyDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", CFSTR("remote"), v5, 1);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)prettyProcessDescription
{
  return (id)FBSProcessPrettyDescription();
}

- (NSString)facilityID
{
  return self->_facilityID;
}

- (BSXPCServiceConnectionMessaging)clientHandle_messageBuilder
{
  return self->_connection;
}

- (int)pid
{
  return -[BSProcessHandle pid](self->_processHandle, "pid");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_facilityID, 0);
}

- (void)invalidate
{
  -[BSServiceConnection invalidate](self->_connection, "invalidate");
}

- (RBSProcessIdentity)processIdentity
{
  return -[FBProcess identity](self->_process, "identity");
}

- (BOOL)isSuspended
{
  return -[FBProcess taskState](self->_process, "taskState") == 3;
}

- (void)setContext:(id)a3
{
  FBSServiceFacilityClientContext *v5;
  FBSServiceFacilityClientContext *context;
  FBSServiceFacilityClientContext *v7;

  v5 = (FBSServiceFacilityClientContext *)a3;
  context = self->_context;
  if (context != v5)
  {
    v7 = v5;
    -[FBSServiceFacilityClientContext setClientHandle:](context, "setClientHandle:", 0);
    objc_storeStrong((id *)&self->_context, a3);
    -[FBSServiceFacilityClientContext setClientHandle:](self->_context, "setClientHandle:", self);
    v5 = v7;
  }

}

- (FBSServiceFacilityClientContext)context
{
  return self->_context;
}

- (void)initWithFacilityID:(const char *)a1 connection:.cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFacilityID:(const char *)a1 connection:.cold.2(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
