@implementation DRSTaskingClientConnectionState

- (DRSTaskingClientConnectionState)initWithConnection:(id)a3 service:(id)a4
{
  _xpc_connection_s *v6;
  id v7;
  DRSTaskingClientConnectionState *v8;
  pid_t pid;
  uint64_t v10;
  NSString *procName;
  uint64_t v12;
  NSMutableDictionary *cachedEntitlements;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  const __CFString *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  DRSTaskingClientConnectionState *v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_connection_s *)a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)DRSTaskingClientConnectionState;
  v8 = -[DRSTaskingClientConnectionState init](&v31, sel_init);
  if (v8)
  {
    pid = xpc_connection_get_pid(v6);
    v8->_pid = pid;
    DRSPidToProcessName(pid);
    v10 = objc_claimAutoreleasedReturnValue();
    procName = v8->_procName;
    v8->_procName = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    cachedEntitlements = v8->_cachedEntitlements;
    v8->_cachedEntitlements = (NSMutableDictionary *)v12;

    v14 = xpc_connection_copy_entitlement_value();
    v15 = (void *)v14;
    if (v14)
      LOBYTE(v14) = MEMORY[0x1DF0B73D0](v14) == MEMORY[0x1E0C812D0] && xpc_BOOL_get_value(v15);
    v8->_hasAdminEntitlement = v14;
    DPLogHandle_ServiceTasking();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      -[DRSTaskingClientConnectionState stateDescription](v8, "stateDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[DRSTaskingClientConnectionState hasAdminEntitlement](v8, "hasAdminEntitlement");
      v19 = CFSTR("does not have");
      if (v18)
        v19 = CFSTR("has");
      *(_DWORD *)buf = 138543618;
      v33 = v17;
      v34 = 2114;
      v35 = v19;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminEntitlementSetting", "%{public}@ connection %{public}@ the admin entitlement", buf, 0x16u);

    }
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __62__DRSTaskingClientConnectionState_initWithConnection_service___block_invoke;
    v28 = &unk_1EA3D1178;
    v29 = v8;
    v20 = v7;
    v30 = v20;
    xpc_connection_set_event_handler(v6, &v25);
    objc_msgSend(v20, "messageQueue", v25, v26, v27, v28);
    v21 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(v6, v21);

    xpc_connection_activate(v6);
  }
  DPLogHandle_ServiceTasking();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v22))
  {
    -[DRSTaskingClientConnectionState stateDescription](v8, "stateDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v23;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewClientConnection", "Received client connection from %{public}@", buf, 0xCu);

  }
  return v8;
}

void __62__DRSTaskingClientConnectionState_initWithConnection_service___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  const char *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81260])
  {
    DPLogHandle_ServiceTasking();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v8))
      goto LABEL_19;
    objc_msgSend(*(id *)(a1 + 32), "stateDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v9;
    v10 = "ConnectionInvalidation";
    v11 = "%{public}@ connection invalidated";
LABEL_18:
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v10, v11, (uint8_t *)&v12, 0xCu);

    goto LABEL_19;
  }
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    DPLogHandle_ServiceTasking();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v8))
      goto LABEL_19;
    objc_msgSend(*(id *)(a1 + 32), "stateDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v9;
    v10 = "ConnectionInterrupted";
    v11 = "%{public}@ connection interrupted";
    goto LABEL_18;
  }
  if (v3 == (id)MEMORY[0x1E0C81288])
  {
    DPLogHandle_ServiceTasking();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v8))
      goto LABEL_19;
    objc_msgSend(*(id *)(a1 + 32), "stateDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v9;
    v10 = "TerminationImminent";
    v11 = "%{public}@ termination imminent";
    goto LABEL_18;
  }
  if (v3 == (id)MEMORY[0x1E0C81278])
  {
    DPLogHandle_ServiceTasking();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      objc_msgSend(*(id *)(a1 + 32), "stateDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      v10 = "CodeSigningRequirementsNotMet";
      v11 = "%{public}@ connection doesn't meet code signing requirements";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (MEMORY[0x1DF0B73D0](v3) == MEMORY[0x1E0C812F8])
  {
    objc_msgSend(*(id *)(a1 + 40), "handleRequest:state:", v4, *(_QWORD *)(a1 + 32));
  }
  else
  {
    v5 = (void *)MEMORY[0x1DF0B72BC](v4);
    DPLogHandle_ServiceTasking();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      objc_msgSend(*(id *)(a1 + 32), "stateDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v7;
      v14 = 2082;
      v15 = v5;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnexpectedMessageType", "%{public}@ message type unexpected: %{public}s", (uint8_t *)&v12, 0x16u);

    }
    if (v5)
      free(v5);
  }
LABEL_20:

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
  DPLogHandle_ServiceTasking();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    -[DRSTaskingClientConnectionState stateDescription](self, "stateDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConnectionStateDealloc", "Disconnecting from %{public}@", buf, 0xCu);

  }
  v5.receiver = self;
  v5.super_class = (Class)DRSTaskingClientConnectionState;
  -[DRSTaskingClientConnectionState dealloc](&v5, sel_dealloc);
}

- (BOOL)hasTeamIDEntitlement:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DRSTaskingClientConnectionState cachedEntitlements](self, "cachedEntitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    LOBYTE(v10) = objc_msgSend(v9, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.diagnosticpipeline.tasking.%@"), v6);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "UTF8String");
    v12 = xpc_connection_copy_entitlement_value();
    v13 = (void *)v12;
    v10 = v12 && MEMORY[0x1DF0B73D0](v12) == MEMORY[0x1E0C812D0] && xpc_BOOL_get_value(v13);
    DPLogHandle_ServiceTasking();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      -[DRSTaskingClientConnectionState stateDescription](self, "stateDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = "does not have";
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      if ((_DWORD)v10)
        v16 = "has";
      v22 = 2082;
      v23 = v16;
      v24 = 2112;
      v25 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConnectionStateTeamIDEntitlement", "Connection for %{public}@ %{public}s entitlement '%@'", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTaskingClientConnectionState cachedEntitlements](self, "cachedEntitlements");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v6);

  }
  return v10;
}

- (NSString)stateDescription
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = " (admin)";
  if (!self->_hasAdminEntitlement)
    v4 = "";
  return (NSString *)(id)objc_msgSend(v3, "initWithFormat:", CFSTR("DRSTaskingClient [%d:%@]%s"), self->_pid, self->_procName, v4);
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

- (NSMutableDictionary)cachedEntitlements
{
  return self->_cachedEntitlements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedEntitlements, 0);
  objc_storeStrong((id *)&self->_procName, 0);
}

@end
