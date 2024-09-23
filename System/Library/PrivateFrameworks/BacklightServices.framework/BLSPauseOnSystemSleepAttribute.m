@implementation BLSPauseOnSystemSleepAttribute

+ (id)pauseOnSystemSleep
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)canBePaused
{
  return 0;
}

@end
