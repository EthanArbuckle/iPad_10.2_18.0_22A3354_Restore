@implementation CFPrefsSynchronizer

void __28___CFPrefsSynchronizer_init__block_invoke()
{
  const __CFSet *v0;

  v0 = (const __CFSet *)+[_CFPrefsSynchronizer sharedInstance]();
  -[_CFPrefsSynchronizer synchronize](v0);
}

_CFPrefsSynchronizer *__38___CFPrefsSynchronizer_sharedInstance__block_invoke()
{
  _CFPrefsSynchronizer *result;

  result = objc_alloc_init(_CFPrefsSynchronizer);
  sharedInstance_shared = (uint64_t)result;
  return result;
}

@end
