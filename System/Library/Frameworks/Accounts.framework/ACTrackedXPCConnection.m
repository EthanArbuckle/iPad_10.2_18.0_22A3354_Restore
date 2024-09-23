@implementation ACTrackedXPCConnection

- (ACTrackedXPCConnection)init
{
  ACTrackedXPCConnection *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACTrackedXPCConnection;
  v2 = -[ACTrackedXPCConnection init](&v4, sel_init);
  if (v2)
  {
    os_unfair_lock_lock(&gOpenConnectionLock);
    __30__ACTrackedXPCConnection_init__block_invoke();
    os_unfair_lock_unlock(&gOpenConnectionLock);
  }
  return v2;
}

void __30__ACTrackedXPCConnection_init__block_invoke()
{
  int v0;
  NSObject *v1;
  NSObject *v2;

  if (++gOpenConnectionCount > gMaxConnectionCount)
  {
    v0 = _os_feature_enabled_impl();
    _ACLogSystem();
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v0)
    {
      if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
        __30__ACTrackedXPCConnection_init__block_invoke_cold_1(v2);
    }
    else if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      __30__ACTrackedXPCConnection_init__block_invoke_cold_2(v2);
    }

    gMaxConnectionCount *= 2;
  }
}

void __30__ACTrackedXPCConnection_init__block_invoke_cold_2(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = gOpenConnectionCount;
  _os_log_error_impl(&dword_1A2BCD000, log, OS_LOG_TYPE_ERROR, "\"Exceeded the maximum number of connections (2) to accountsd: %d connections open. Consider switching to +[ACAccountStore defaultStore]\", (uint8_t *)v1, 8u);
}

- (void)dealloc
{
  objc_super v3;

  os_unfair_lock_lock(&gOpenConnectionLock);
  --gOpenConnectionCount;
  os_unfair_lock_unlock(&gOpenConnectionLock);
  v3.receiver = self;
  v3.super_class = (Class)ACTrackedXPCConnection;
  -[ACTrackedXPCConnection dealloc](&v3, sel_dealloc);
}

void __30__ACTrackedXPCConnection_init__block_invoke_cold_1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = gOpenConnectionCount;
  _os_log_fault_impl(&dword_1A2BCD000, log, OS_LOG_TYPE_FAULT, "Exceeded the maximum number of connections (2) to accountsd: %d connections open. Consider switching to +[ACAccountStore defaultStore]", (uint8_t *)v1, 8u);
}

@end
