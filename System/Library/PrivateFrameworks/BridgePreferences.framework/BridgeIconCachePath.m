@implementation BridgeIconCachePath

void ___BridgeIconCachePath_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userCachesDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@/BridgeIconCache/"), v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_BridgeIconCachePath___bridgeIconCachePath;
  _BridgeIconCachePath___bridgeIconCachePath = v2;

}

@end
