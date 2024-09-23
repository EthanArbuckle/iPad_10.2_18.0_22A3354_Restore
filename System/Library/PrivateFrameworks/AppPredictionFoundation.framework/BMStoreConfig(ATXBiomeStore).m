@implementation BMStoreConfig(ATXBiomeStore)

+ (id)atx_storeConfig
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0D024C0]);
  objc_msgSend(a1, "atx_biomeStreamManagerStreamsBasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithStoreBasePath:segmentSize:", v3, 0x800000);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, 0, 0x20000000, 0.0);
  objc_msgSend(v4, "setPruningPolicy:", v5);

  return v4;
}

+ (id)atx_biomeStreamManagerStreamsBasePath
{
  return +[ATXPaths biomeStreamsRootDirectory](ATXPaths, "biomeStreamsRootDirectory");
}

@end
