@implementation DRSClientConnectionState

- (DRSClientConnectionState)initWithConnection:(id)a3 service:(id)a4
{
  _xpc_connection_s *v6;
  id v7;
  DRSClientConnectionState *v8;
  pid_t pid;
  uint64_t v10;
  NSString *procName;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  const __CFString *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  DRSClientConnectionState *v27;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_connection_s *)a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)DRSClientConnectionState;
  v8 = -[DRSClientConnectionState init](&v29, sel_init);
  if (v8)
  {
    pid = xpc_connection_get_pid(v6);
    v8->_pid = pid;
    DRSPidToProcessName(pid);
    v10 = objc_claimAutoreleasedReturnValue();
    procName = v8->_procName;
    v8->_procName = (NSString *)v10;

    v12 = xpc_connection_copy_entitlement_value();
    v13 = (void *)v12;
    if (v12)
      LOBYTE(v12) = MEMORY[0x1DF0B73D0](v12) == MEMORY[0x1E0C812D0] && xpc_BOOL_get_value(v13);
    v8->_hasAdminEntitlement = v12;
    DPLogHandle_ServiceLifecycle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      -[DRSClientConnectionState stateDescription](v8, "stateDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[DRSClientConnectionState hasAdminEntitlement](v8, "hasAdminEntitlement");
      v17 = CFSTR("does not have");
      if (v16)
        v17 = CFSTR("has");
      *(_DWORD *)buf = 138543618;
      v31 = v15;
      v32 = 2114;
      v33 = v17;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConnectionAdminEntitlementSetting", "%{public}@ connection %{public}@ the admin entitlement", buf, 0x16u);

    }
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __55__DRSClientConnectionState_initWithConnection_service___block_invoke;
    v26 = &unk_1EA3D1178;
    v27 = v8;
    v18 = v7;
    v28 = v18;
    xpc_connection_set_event_handler(v6, &v23);
    objc_msgSend(v18, "messageQueue", v23, v24, v25, v26);
    v19 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(v6, v19);

    xpc_connection_activate(v6);
  }
  DPLogHandle_ServiceLifecycle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    -[DRSClientConnectionState stateDescription](v8, "stateDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v21;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewClientConnection", "Received client connection from %{public}@", buf, 0xCu);

  }
  return v8;
}

void __55__DRSClientConnectionState_initWithConnection_service___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  const char *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81260])
  {
    DPLogHandle_ServiceLifecycle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      objc_msgSend(*(id *)(a1 + 32), "stateDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      v9 = "ConnectionInvalidation";
      v10 = "%{public}@ connection invalidated";
LABEL_12:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v9, v10, (uint8_t *)&v11, 0xCu);

    }
LABEL_13:

    goto LABEL_14;
  }
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    DPLogHandle_ServiceLifecycle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      objc_msgSend(*(id *)(a1 + 32), "stateDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      v9 = "ConnectionInterrupted";
      v10 = "%{public}@ connection interrupted";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (MEMORY[0x1DF0B73D0](v3) == MEMORY[0x1E0C812F8])
  {
    objc_msgSend(*(id *)(a1 + 40), "handleRequest:state:", v4, *(_QWORD *)(a1 + 32));
  }
  else
  {
    v5 = (void *)MEMORY[0x1DF0B72BC](v4);
    DPLogHandle_ServiceLifecycle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      v11 = 136446210;
      v12 = v5;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMessageType", "Invalid message type unexpected: %{public}s", (uint8_t *)&v11, 0xCu);
    }

    if (v5)
      free(v5);
  }
LABEL_14:

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  DPLogHandle_ServiceLifecycle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    -[DRSClientConnectionState stateDescription](self, "stateDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConnectionStateDealloc", "Disconnecting from %{public}@", buf, 0xCu);

  }
  v5.receiver = self;
  v5.super_class = (Class)DRSClientConnectionState;
  -[DRSClientConnectionState dealloc](&v5, sel_dealloc);
}

- (NSString)stateDescription
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = "(admin)";
  if (!self->_hasAdminEntitlement)
    v4 = "";
  return (NSString *)(id)objc_msgSend(v3, "initWithFormat:", CFSTR("DRSClient [%d:%@] %s"), self->_pid, self->_procName, v4);
}

- (int)pid
{
  return self->_pid;
}

- (NSString)procName
{
  return self->_procName;
}

- (BOOL)hasAdminEntitlement
{
  return self->_hasAdminEntitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_procName, 0);
}

@end
