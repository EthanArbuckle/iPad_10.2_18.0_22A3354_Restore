@implementation AKLogHme

void ___AKLogHme_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)AKLoggingSubsystem, "hme");
  v1 = (void *)_AKLogHme_log;
  _AKLogHme_log = (uint64_t)v0;

}

@end
