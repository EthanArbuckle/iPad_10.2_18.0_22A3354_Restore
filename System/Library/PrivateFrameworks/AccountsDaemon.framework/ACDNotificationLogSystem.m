@implementation ACDNotificationLogSystem

void ___ACDNotificationLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accounts", "notification");
  v1 = (void *)_ACDNotificationLogSystem_log;
  _ACDNotificationLogSystem_log = (uint64_t)v0;

}

@end
