@implementation AMSCarrierMSISDNProvider

- (NSString)msisdn
{
  return +[AMSDevice phoneNumber](AMSDevice, "phoneNumber");
}

@end
