@implementation HLPVideoCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_5 != -1)
    dispatch_once(&sharedInstance_predicate_5, &__block_literal_global_9);
  return (id)sharedInstance_gHLPVideoCacheController;
}

void __41__HLPVideoCacheController_sharedInstance__block_invoke()
{
  HLPVideoCacheController *v0;
  void *v1;

  v0 = -[HLPDataCacheController initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:]([HLPVideoCacheController alloc], "initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:", CFSTR("HLPVideoCacheIdentifier"), CFSTR("com.apple.helpkit.Videos"), 52428800, 5);
  v1 = (void *)sharedInstance_gHLPVideoCacheController;
  sharedInstance_gHLPVideoCacheController = (uint64_t)v0;

}

- (id)newDataCache
{
  HLPDataCache *v2;

  v2 = objc_alloc_init(HLPDataCache);
  -[HLPDataCache setCacheType:](v2, "setCacheType:", 4);
  -[HLPDataCache setMaxAge:](v2, "setMaxAge:", 345600);
  return v2;
}

@end
