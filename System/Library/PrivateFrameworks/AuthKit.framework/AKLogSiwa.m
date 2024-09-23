@implementation AKLogSiwa

void ___AKLogSiwa_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)AKLoggingSubsystem, "siwa");
  v1 = (void *)_AKLogSiwa_log;
  _AKLogSiwa_log = (uint64_t)v0;

}

@end
