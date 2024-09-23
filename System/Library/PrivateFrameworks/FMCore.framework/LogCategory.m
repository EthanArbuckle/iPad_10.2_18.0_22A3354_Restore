@implementation LogCategory

void __LogCategory_Unspecified_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCore", "_");
  v1 = (void *)LogCategory_Unspecified_log;
  LogCategory_Unspecified_log = (uint64_t)v0;

}

void __LogCategory_APS_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCore", "APS");
  v1 = (void *)LogCategory_APS_log;
  LogCategory_APS_log = (uint64_t)v0;

}

void __LogCategory_FMRunLoopMonitor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCore", "FMRunLoopMonitor");
  v1 = (void *)LogCategory_FMRunLoopMonitor_log;
  LogCategory_FMRunLoopMonitor_log = (uint64_t)v0;

}

void __LogCategory_FMSynchronizer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCore", "FMSynchronizer");
  v1 = (void *)LogCategory_FMSynchronizer_log;
  LogCategory_FMSynchronizer_log = (uint64_t)v0;

}

void __LogCategory_FMXPCActivity_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCore", "XPCActivity");
  v1 = (void *)LogCategory_FMXPCActivity_log;
  LogCategory_FMXPCActivity_log = (uint64_t)v0;

}

void __LogCategory_FMXPCBridge_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCore", "FMXPCBridge");
  v1 = (void *)LogCategory_FMXPCBridge_log;
  LogCategory_FMXPCBridge_log = (uint64_t)v0;

}

void __LogCategory_Networking_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCore", "networking");
  v1 = (void *)LogCategory_Networking_log;
  LogCategory_Networking_log = (uint64_t)v0;

}

void __LogCategory_NetworkingVerbose_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCore", "networking.verbose");
  v1 = (void *)LogCategory_NetworkingVerbose_log;
  LogCategory_NetworkingVerbose_log = (uint64_t)v0;

}

void __LogCategory_ServerError_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCore", "servererror");
  v1 = (void *)LogCategory_ServerError_log;
  LogCategory_ServerError_log = (uint64_t)v0;

}

void __LogCategory_SharedFileContainer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.FMCore", "SharedFileContainer");
  v1 = (void *)LogCategory_SharedFileContainer_log;
  LogCategory_SharedFileContainer_log = (uint64_t)v0;

}

@end
