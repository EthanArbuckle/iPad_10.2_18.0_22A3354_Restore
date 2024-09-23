@implementation APConfigurationCache

- (APConfigurationCache)init
{
  APConfigurationCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  APInMemoryTTLCache *purgeableCache;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)APConfigurationCache;
  v2 = -[APConfigurationCache init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.ap.configurationsystem.queue", v3);

    v5 = objc_alloc(MEMORY[0x24BDFD488]);
    v7 = objc_msgSend_initWithExpirationInterval_flushQueue_(v5, v6, (uint64_t)v4, 300.0);
    purgeableCache = v2->_purgeableCache;
    v2->_purgeableCache = (APInMemoryTTLCache *)v7;

  }
  return v2;
}

+ (id)sharedInstance
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  APConfigurationCache *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;

  objc_msgSend_sharedInstance(MEMORY[0x24BDFD4D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configurationCache(v4, v5, v6);
  v7 = (APConfigurationCache *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = a1;
    objc_sync_enter(v8);
    objc_msgSend_configurationCache(v4, v9, v10);
    v7 = (APConfigurationCache *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(APConfigurationCache);
      objc_msgSend_setConfigurationCache_(v4, v11, (uint64_t)v7);
    }
    objc_sync_exit(v8);

  }
  return v7;
}

- (void)recentlyAccessedObject:(id)a3
{
  objc_msgSend_recentlyAccessedObject_(self->_purgeableCache, a2, (uint64_t)a3);
}

- (id)configurationForPath:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self->_purgeableCache, sel_getObjectForIdentifier_, a3);
}

- (void)setConfiguration:(id)a3
{
  MEMORY[0x24BEDD108](self->_purgeableCache, sel_setObject_, a3);
}

- (APInMemoryTTLCache)purgeableCache
{
  return self->_purgeableCache;
}

- (void)setPurgeableCache:(id)a3
{
  objc_storeStrong((id *)&self->_purgeableCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeableCache, 0);
}

@end
