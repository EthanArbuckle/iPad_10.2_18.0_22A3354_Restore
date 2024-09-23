@implementation DKSyncContextObjectFactory

void __61___DKSyncContextObjectFactory_objectFactoryForClass_context___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 24);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)objectFactoryForClass_context__instances;
  objectFactoryForClass_context__instances = v0;

}

@end
