@implementation ConversationKitLog

void __ConversationKitLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)ConversationKitLogSubsystem, "Default");
  v1 = (void *)ConversationKitLog_ConversationKitLog;
  ConversationKitLog_ConversationKitLog = (uint64_t)v0;

}

@end
