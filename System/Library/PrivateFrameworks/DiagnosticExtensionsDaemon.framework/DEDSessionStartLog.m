@implementation DEDSessionStartLog

void __DEDSessionStartLog_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "session-start");
  v1 = (void *)DEDSessionStartLog_log;
  DEDSessionStartLog_log = (uint64_t)v0;

}

@end
