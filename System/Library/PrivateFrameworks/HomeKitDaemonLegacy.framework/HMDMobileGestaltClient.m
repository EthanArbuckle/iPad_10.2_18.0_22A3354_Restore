@implementation HMDMobileGestaltClient

- (BOOL)supportsSiriHub
{
  return MGGetBoolAnswer();
}

- (BOOL)supportsReceivingARCStreamOverAirPlay
{
  return MGGetBoolAnswer();
}

- (NSString)serialNumber
{
  return (NSString *)(id)MGGetStringAnswer();
}

@end
