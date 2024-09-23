@implementation EspressoSharedKernelCacheEntry

- (EspressoMetalKernelsCache)cached
{
  return (EspressoMetalKernelsCache *)objc_loadWeakRetained((id *)&self->_cached);
}

- (void)setCached:(id)a3
{
  objc_storeWeak((id *)&self->_cached, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cached);
}

@end
