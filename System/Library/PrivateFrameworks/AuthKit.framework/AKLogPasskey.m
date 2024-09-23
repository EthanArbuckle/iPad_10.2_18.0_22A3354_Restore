@implementation AKLogPasskey

void ___AKLogPasskey_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)AKLoggingSubsystem, "passkey");
  v1 = (void *)_AKLogPasskey_log;
  _AKLogPasskey_log = (uint64_t)v0;

}

@end
