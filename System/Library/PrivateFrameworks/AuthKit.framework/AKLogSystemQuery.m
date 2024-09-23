@implementation AKLogSystemQuery

void ___AKLogSystemQuery_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)AKLoggingSubsystem, "query");
  v1 = (void *)_AKLogSystemQuery_log;
  _AKLogSystemQuery_log = (uint64_t)v0;

}

@end
