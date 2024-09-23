@implementation _CDUncachedSentinel

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_122);
  return (id)sharedInstance__pasExprOnceResult;
}

- (id)interactionIfCached
{
  return 0;
}

- (BOOL)isUncachedSentinel
{
  return 1;
}

@end
