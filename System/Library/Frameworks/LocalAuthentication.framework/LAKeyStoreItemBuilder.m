@implementation LAKeyStoreItemBuilder

+ (id)buildNullGenericPassword
{
  return objc_alloc_init(_LAKeyStoreGenericPasswordNull);
}

+ (id)buildNullKey
{
  return objc_alloc_init(_LAKeyStoreKeyNull);
}

@end
