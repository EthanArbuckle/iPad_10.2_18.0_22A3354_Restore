@implementation CDPMobileGestaltWrapper

- (BOOL)supportsPearl
{
  return MGGetBoolAnswer();
}

- (BOOL)supportsMesa
{
  return MGGetBoolAnswer();
}

@end
