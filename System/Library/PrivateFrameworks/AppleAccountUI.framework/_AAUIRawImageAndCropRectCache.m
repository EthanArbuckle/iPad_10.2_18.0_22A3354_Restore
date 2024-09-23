@implementation _AAUIRawImageAndCropRectCache

+ (id)_cacheStore
{
  if (_cacheStore_onceToken != -1)
    dispatch_once(&_cacheStore_onceToken, &__block_literal_global_11);
  return (id)_cacheStore_rawImageAndCropRectCache;
}

+ (id)entryForPersonID:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_cacheStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

+ (void)setEntry:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(a1, "_cacheStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);
  objc_sync_exit(v7);

}

@end
