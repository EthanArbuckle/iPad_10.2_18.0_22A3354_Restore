@implementation NSXPCInterface(ISIconCacheServiceProtocol)

+ (id)_IS_iconCacheServiceInterface
{
  if (_IS_iconCacheServiceInterface_onceToken != -1)
    dispatch_once(&_IS_iconCacheServiceInterface_onceToken, &__block_literal_global_6);
  return (id)_IS_iconCacheServiceInterface_interface;
}

@end
