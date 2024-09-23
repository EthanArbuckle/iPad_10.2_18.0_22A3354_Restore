@implementation SECKEY

void ___SECKEY_LOG_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.security", "seckey");
  v1 = (void *)_SECKEY_LOG_log;
  _SECKEY_LOG_log = (uint64_t)v0;

}

void ___SECKEY_LOG_block_invoke_7727()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.security", "seckey");
  v1 = (void *)_SECKEY_LOG_log_7726;
  _SECKEY_LOG_log_7726 = (uint64_t)v0;

}

void ___SECKEY_LOG_block_invoke_8050()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.security", "seckey");
  v1 = (void *)_SECKEY_LOG_log_8049;
  _SECKEY_LOG_log_8049 = (uint64_t)v0;

}

void ___SECKEY_LOG_block_invoke_9297()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.security", "seckey");
  v1 = (void *)_SECKEY_LOG_log_9296;
  _SECKEY_LOG_log_9296 = (uint64_t)v0;

}

void ___SECKEY_LOG_block_invoke_9917()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.security", "seckey");
  v1 = (void *)_SECKEY_LOG_log_9915;
  _SECKEY_LOG_log_9915 = (uint64_t)v0;

}

@end
