@implementation SO

void __SO_LOG_SOUtils_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOUtils");
  v1 = (void *)SO_LOG_SOUtils_log;
  SO_LOG_SOUtils_log = (uint64_t)v0;

}

void __SO_LOG_SOServiceConnection_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOServiceConnection");
  v1 = (void *)SO_LOG_SOServiceConnection_log;
  SO_LOG_SOServiceConnection_log = (uint64_t)v0;

}

void __SO_LOG_SOConfigurationVersion_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOConfigurationVersion");
  v1 = (void *)SO_LOG_SOConfigurationVersion_log;
  SO_LOG_SOConfigurationVersion_log = (uint64_t)v0;

}

void __SO_LOG_SOConfigurationClient_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOConfigurationClient");
  v1 = (void *)SO_LOG_SOConfigurationClient_log;
  SO_LOG_SOConfigurationClient_log = (uint64_t)v0;

}

void __SO_LOG_SOClient_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOClient");
  v1 = (void *)SO_LOG_SOClient_log;
  SO_LOG_SOClient_log = (uint64_t)v0;

}

void __SO_LOG_SOClientImpl_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOClientImpl");
  v1 = (void *)SO_LOG_SOClientImpl_log;
  SO_LOG_SOClientImpl_log = (uint64_t)v0;

}

void __SO_LOG_SOAuthorizationCore_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOAuthorizationCore");
  v1 = (void *)SO_LOG_SOAuthorizationCore_log;
  SO_LOG_SOAuthorizationCore_log = (uint64_t)v0;

}

void __SO_LOG_SOErrorHelper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOErrorHelper");
  v1 = (void *)SO_LOG_SOErrorHelper_log;
  SO_LOG_SOErrorHelper_log = (uint64_t)v0;

}

void __SO_LOG_SOFullProfile_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOFullProfile");
  v1 = (void *)SO_LOG_SOFullProfile_log;
  SO_LOG_SOFullProfile_log = (uint64_t)v0;

}

void __SO_LOG_SOConfiguration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppSSO", "SOConfiguration");
  v1 = (void *)SO_LOG_SOConfiguration_log;
  SO_LOG_SOConfiguration_log = (uint64_t)v0;

}

@end
