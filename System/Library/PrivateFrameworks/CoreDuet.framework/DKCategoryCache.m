@implementation DKCategoryCache

uint64_t __32___DKCategoryCache_sharedCached__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCached_sharedCache_0;
  sharedCached_sharedCache_0 = v0;

  return objc_msgSend((id)sharedCached_sharedCache_0, "setCountLimit:", 6);
}

void __45___DKCategoryCache_categoryWithInteger_type___block_invoke()
{
  void *v0;
  id v1;

  +[_DKBoolCategory type](_DKBoolCategory, "type");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  categoryWithInteger_type__BOOLTypeCode = objc_msgSend(v0, "typeCode");

  +[_DKAnyIntegerCategory type](_DKAnyIntegerCategory, "type");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  categoryWithInteger_type__anyTypeCode = objc_msgSend(v1, "typeCode");

}

@end
