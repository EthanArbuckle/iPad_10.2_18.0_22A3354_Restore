@implementation CRKPlatformFeatureDataStore

+ (CRKFeatureDataStoreProtocol)sharedDataStore
{
  if (sharedDataStore_onceToken != -1)
    dispatch_once(&sharedDataStore_onceToken, &__block_literal_global_44);
  return (CRKFeatureDataStoreProtocol *)(id)sharedDataStore_dataStore;
}

void __46__CRKPlatformFeatureDataStore_sharedDataStore__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "makeFeatureDataStore");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedDataStore_dataStore;
  sharedDataStore_dataStore = v0;

}

@end
