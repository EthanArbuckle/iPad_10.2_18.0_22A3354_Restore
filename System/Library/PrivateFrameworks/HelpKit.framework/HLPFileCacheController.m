@implementation HLPFileCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_6 != -1)
    dispatch_once(&sharedInstance_predicate_6, &__block_literal_global_10);
  return (id)sharedInstance_gHLPFileCacheController;
}

void __40__HLPFileCacheController_sharedInstance__block_invoke()
{
  HLPFileCacheController *v0;
  void *v1;

  v0 = -[HLPDataCacheController initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:]([HLPFileCacheController alloc], "initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:", CFSTR("HLPStringCacheIdentifier"), CFSTR("com.apple.helpkit.String"), 3145728, 2);
  v1 = (void *)sharedInstance_gHLPFileCacheController;
  sharedInstance_gHLPFileCacheController = (uint64_t)v0;

}

- (id)newDataCache
{
  HLPDataCache *v2;

  v2 = objc_alloc_init(HLPDataCache);
  -[HLPDataCache setCacheType:](v2, "setCacheType:", 0);
  -[HLPDataCache setMaxAge:](v2, "setMaxAge:", 84600);
  return v2;
}

@end
