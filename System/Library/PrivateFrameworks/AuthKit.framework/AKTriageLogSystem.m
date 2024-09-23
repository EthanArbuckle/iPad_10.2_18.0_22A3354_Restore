@implementation AKTriageLogSystem

void ___AKTriageLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)AKLoggingSubsystem, "aaa-itriage");
  v1 = (void *)_AKTriageLogSystem_log;
  _AKTriageLogSystem_log = (uint64_t)v0;

}

@end
