@implementation CKDRequiredFeaturesCache

- (CKDRequiredFeaturesCache)init
{
  CKDRequiredFeaturesCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDRequiredFeaturesCache;
  v2 = -[CKDRequiredFeaturesCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)sharedCache
{
  if (qword_1ED702C90 != -1)
    dispatch_once(&qword_1ED702C90, &unk_1E7838518);
  return (id)qword_1ED702C98;
}

- (id)requiredFeaturesForZoneID:(id)a3
{
  id v4;
  CKDRequiredFeaturesCache *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_cache(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v10;
}

- (void)setRequiredFeatures:(id)a3 forZoneID:(id)a4
{
  id v6;
  CKDRequiredFeaturesCache *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend_cache(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v10, v11, (uint64_t)v12, v6);

  objc_sync_exit(v7);
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
