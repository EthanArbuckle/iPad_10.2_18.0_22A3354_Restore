@implementation NSError

void __67__NSError_WCError__userInfoDictionaryWithErrorStringsForErrorCode___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.WatchConnectivity"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)userInfoDictionaryWithErrorStringsForErrorCode__bundle;
  userInfoDictionaryWithErrorStringsForErrorCode__bundle = v0;

}

@end
