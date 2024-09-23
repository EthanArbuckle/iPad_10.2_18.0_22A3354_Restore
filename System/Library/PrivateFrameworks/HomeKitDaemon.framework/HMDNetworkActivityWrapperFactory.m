@implementation HMDNetworkActivityWrapperFactory

- (id)networkActivityWrapperWithLabel:(unint64_t)a3
{
  return -[HMDNetworkActivityWrapper initWithLabel:]([HMDNetworkActivityWrapper alloc], "initWithLabel:", a3);
}

+ (HMDNetworkActivityWrapperFactory)sharedInstance
{
  if (_onceToken_169361 != -1)
    dispatch_once(&_onceToken_169361, &__block_literal_global_169362);
  return (HMDNetworkActivityWrapperFactory *)(id)_sharedInstance_169363;
}

void __50__HMDNetworkActivityWrapperFactory_sharedInstance__block_invoke()
{
  HMDNetworkActivityWrapperFactory *v0;
  void *v1;

  if (!_sharedInstance_169363)
  {
    v0 = objc_alloc_init(HMDNetworkActivityWrapperFactory);
    v1 = (void *)_sharedInstance_169363;
    _sharedInstance_169363 = (uint64_t)v0;

  }
}

@end
