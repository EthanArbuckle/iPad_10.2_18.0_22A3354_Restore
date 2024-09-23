@implementation FKGetLogSystem

void ___FKGetLogSystem_block_invoke()
{
  id v0;
  os_log_t v1;
  void *v2;
  id v3;

  FriendKitBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create((const char *)objc_msgSend(v0, "UTF8String"), "main");
  v2 = (void *)_FKGetLogSystem_log;
  _FKGetLogSystem_log = (uint64_t)v1;

}

@end
