@implementation LSDServiceGetXPCConnection

id ___LSDServiceGetXPCConnection_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(unsigned __int16 *)(v2 + 16) == 3;
  else
    v3 = 0;
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "serviceNameForConnectionType:lightweightSystemService:", objc_msgSend(*(id *)(a1 + 48), "connectionType"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v4, *(_QWORD *)(a1 + 56));
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "XPCInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = ___LSDServiceGetXPCConnection_block_invoke_3;
    v16[3] = &unk_1E10418C8;
    v8 = v4;
    v17 = v8;
    objc_msgSend(v5, "setInterruptionHandler:", v16);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = ___LSDServiceGetXPCConnection_block_invoke_45;
    v13[3] = &unk_1E10422C8;
    v14 = v8;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setInvalidationHandler:", v13);
    objc_msgSend(v5, "setDelegate:", objc_opt_class());
    v9 = *(unsigned int *)(a1 + 64);
    v10 = *(void (**)(void *, uint64_t))(a1 + 72);
    v11 = *(id *)(a1 + 80);
    v10(v5, v9);

    objc_msgSend(v5, "resume");
  }

  return v5;
}

void ___LSDServiceGetXPCConnection_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_LSDServiceGetXPCConnection::serverConnections;
  _LSDServiceGetXPCConnection::serverConnections = (uint64_t)v0;

}

void ___LSDServiceGetXPCConnection_block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _LSDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    ___LSDServiceGetXPCConnection_block_invoke_3_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

void ___LSDServiceGetXPCConnection_block_invoke_45(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _LSDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    ___LSDServiceGetXPCConnection_block_invoke_45_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  os_unfair_lock_lock((os_unfair_lock_t)&_LSDServiceGetXPCConnection::serverConnectionsLock);
  objc_msgSend((id)_LSDServiceGetXPCConnection::serverConnections, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)&_LSDServiceGetXPCConnection::serverConnectionsLock);
}

void ___LSDServiceGetXPCConnection_block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "LaunchServices: disconnect event interruption received for service %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ___LSDServiceGetXPCConnection_block_invoke_45_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "LaunchServices: disconnect event invalidation received for service %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
