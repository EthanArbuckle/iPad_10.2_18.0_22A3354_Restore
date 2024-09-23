@implementation BKSEventFocusManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10145 != -1)
    dispatch_once(&sharedInstance_onceToken_10145, &__block_literal_global_10146);
  return (id)sharedInstance___shared_10147;
}

void __38__BKSEventFocusManager_sharedInstance__block_invoke()
{
  BKSEventFocusManager *v0;
  void *v1;

  v0 = objc_alloc_init(BKSEventFocusManager);
  v1 = (void *)sharedInstance___shared_10147;
  sharedInstance___shared_10147 = (uint64_t)v0;

}

@end
