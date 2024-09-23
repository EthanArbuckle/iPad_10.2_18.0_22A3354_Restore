@implementation BLSInvalidOnSystemSleepAttribute

+ (id)invalidateOnSystemSleep
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)canBePaused
{
  return 0;
}

@end
