@implementation AKLogUserInteraction

void ___AKLogUserInteraction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)AKLoggingSubsystem, "userInteraction");
  v1 = (void *)_AKLogUserInteraction_log;
  _AKLogUserInteraction_log = (uint64_t)v0;

}

@end
