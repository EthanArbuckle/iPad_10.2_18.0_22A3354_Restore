@implementation HMDMobileGestaltClient

- (HMDMobileGestaltClient)initWithHomeSafetySecurityEnabled:(BOOL)a3
{
  HMDMobileGestaltClient *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDMobileGestaltClient;
  result = -[HMDMobileGestaltClient init](&v5, sel_init);
  if (result)
    result->_homeSafetySecurityEnabled = a3;
  return result;
}

- (HMDMobileGestaltClient)init
{
  return -[HMDMobileGestaltClient initWithHomeSafetySecurityEnabled:](self, "initWithHomeSafetySecurityEnabled:", 0);
}

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

- (BOOL)homeSafetySecurityEnabled
{
  return self->_homeSafetySecurityEnabled;
}

@end
