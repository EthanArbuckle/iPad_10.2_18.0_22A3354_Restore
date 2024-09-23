@implementation LAKeyStoreBuilder

+ (id)buildKeyStore
{
  return objc_alloc_init(_LAKeyStore);
}

@end
