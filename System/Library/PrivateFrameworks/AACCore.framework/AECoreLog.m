@implementation AECoreLog

void __AECoreLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(AACLoggingSubsystem, "UTF8String"), "Core");
  v1 = (void *)AECoreLog_log;
  AECoreLog_log = (uint64_t)v0;

}

@end
