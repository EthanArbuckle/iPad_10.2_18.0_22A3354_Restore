@implementation HMDNetworkActivityWrapperFactory

- (id)networkActivityWrapperWithLabel:(unint64_t)a3
{
  return -[HMDNetworkActivityWrapper initWithLabel:]([HMDNetworkActivityWrapper alloc], "initWithLabel:", a3);
}

+ (HMDNetworkActivityWrapperFactory)sharedInstance
{
  if (_onceToken != -1)
    dispatch_once(&_onceToken, &__block_literal_global_180146);
  return (HMDNetworkActivityWrapperFactory *)(id)_sharedInstance_180147;
}

void __50__HMDNetworkActivityWrapperFactory_sharedInstance__block_invoke()
{
  HMDNetworkActivityWrapperFactory *v0;
  void *v1;

  if (!_sharedInstance_180147)
  {
    v0 = objc_alloc_init(HMDNetworkActivityWrapperFactory);
    v1 = (void *)_sharedInstance_180147;
    _sharedInstance_180147 = (uint64_t)v0;

  }
}

@end
