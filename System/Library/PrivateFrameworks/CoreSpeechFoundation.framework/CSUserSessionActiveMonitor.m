@implementation CSUserSessionActiveMonitor

- (BOOL)isUserActive
{
  return 1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7562 != -1)
    dispatch_once(&sharedInstance_onceToken_7562, &__block_literal_global_7563);
  return (id)sharedInstance_sharedInstance_7564;
}

void __44__CSUserSessionActiveMonitor_sharedInstance__block_invoke()
{
  CSUserSessionActiveMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSUserSessionActiveMonitor);
  v1 = (void *)sharedInstance_sharedInstance_7564;
  sharedInstance_sharedInstance_7564 = (uint64_t)v0;

}

@end
