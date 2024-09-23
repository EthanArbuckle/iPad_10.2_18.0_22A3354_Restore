@implementation IDSDelLog

void __IDSDelLog_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ids-delegate");
  v1 = (void *)IDSDelLog_log;
  IDSDelLog_log = (uint64_t)v0;

}

@end
