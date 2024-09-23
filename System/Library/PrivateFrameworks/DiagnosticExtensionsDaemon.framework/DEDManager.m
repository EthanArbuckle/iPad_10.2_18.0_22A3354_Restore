@implementation DEDManager

+ (id)sharedInstance
{
  if (sharedInstance_once_4 != -1)
    dispatch_once(&sharedInstance_once_4, &__block_literal_global_25);
  return (id)sharedInstance_shared_3;
}

void __28__DEDManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared_3;
  sharedInstance_shared_3 = v0;

}

@end
