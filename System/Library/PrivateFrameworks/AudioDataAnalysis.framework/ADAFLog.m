@implementation ADAFLog

void __ADAFLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("AudioDataAnalysisFramework(ADAF)", "ADAM");
  v1 = (void *)ADAFLog_adafLog;
  ADAFLog_adafLog = (uint64_t)v0;

}

@end
