@implementation ACDKeychainLogSystem

void ___ACDKeychainLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accounts", "keychain");
  v1 = (void *)_ACDKeychainLogSystem_log;
  _ACDKeychainLogSystem_log = (uint64_t)v0;

}

@end
