@implementation WFRequestPaymentAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.Passbook");
}

- (unint64_t)status
{
  return 4;
}

@end
