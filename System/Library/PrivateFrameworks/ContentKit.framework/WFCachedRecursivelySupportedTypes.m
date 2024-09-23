@implementation WFCachedRecursivelySupportedTypes

id __WFCachedRecursivelySupportedTypes_block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;
  void *v4;
  void *v5;

  v1 = *(id *)(a1 + 32);
  v2 = objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithObject:", v2);
  WFRecursivelySupportedTypesExcludingTraversedClasses(v1, isKindOfClass & 1, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
