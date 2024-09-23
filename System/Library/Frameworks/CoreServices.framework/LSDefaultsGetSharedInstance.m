@implementation LSDefaultsGetSharedInstance

void ____LSDefaultsGetSharedInstance_block_invoke()
{
  _LSDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(_LSDefaults);
  v1 = (void *)__LSDefaultsGetSharedInstance_sharedInstance;
  __LSDefaultsGetSharedInstance_sharedInstance = (uint64_t)v0;

}

@end
