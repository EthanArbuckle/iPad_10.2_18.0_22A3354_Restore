@implementation AKLogFido

void ___AKLogFido_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)AKLoggingSubsystem, "fido");
  v1 = (void *)_AKLogFido_log;
  _AKLogFido_log = (uint64_t)v0;

}

@end
