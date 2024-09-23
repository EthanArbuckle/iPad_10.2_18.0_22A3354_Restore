@implementation LCFFeatureStoreContextId

+ (id)getContextId
{
  if (getContextId_onceToken != -1)
    dispatch_once(&getContextId_onceToken, &__block_literal_global_0);
  return (id)getContextId_contextId;
}

void __40__LCFFeatureStoreContextId_getContextId__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getContextId_contextId;
  getContextId_contextId = v0;

}

@end
