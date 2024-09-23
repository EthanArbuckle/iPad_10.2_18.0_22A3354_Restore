@implementation AKTrafficLogSubsystem

void ___AKTrafficLogSubsystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)AKLoggingSubsystem, "traffic");
  v1 = (void *)_AKTrafficLogSubsystem_log;
  _AKTrafficLogSubsystem_log = (uint64_t)v0;

}

@end
