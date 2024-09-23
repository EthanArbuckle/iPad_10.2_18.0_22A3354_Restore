@implementation NSObject(BBObjectCache)

- (uint64_t)bb_objectCache
{
  return objc_msgSend((id)objc_opt_class(), "bb_objectCache");
}

+ (BBObjectCache)bb_objectCache
{
  id v1;
  BBObjectCache *v2;

  v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, "BBObjectCacheForClass");
  v2 = (BBObjectCache *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(BBObjectCache);
    objc_setAssociatedObject(v1, "BBObjectCacheForClass", v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  return v2;
}

@end
