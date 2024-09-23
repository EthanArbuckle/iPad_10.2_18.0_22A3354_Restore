@implementation DEDIDSConnectionLog

void __DEDIDSConnectionLog_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ids-connection");
  v1 = (void *)DEDIDSConnectionLog_handle;
  DEDIDSConnectionLog_handle = (uint64_t)v0;

}

@end
