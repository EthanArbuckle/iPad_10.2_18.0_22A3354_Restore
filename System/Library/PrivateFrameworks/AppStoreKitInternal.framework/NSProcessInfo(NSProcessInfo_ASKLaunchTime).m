@implementation NSProcessInfo(NSProcessInfo_ASKLaunchTime)

- (double)ask_launchTime
{
  return *(double *)&ASKProcessLaunchTime;
}

@end
