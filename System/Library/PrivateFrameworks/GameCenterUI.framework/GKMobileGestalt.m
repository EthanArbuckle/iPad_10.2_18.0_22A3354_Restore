@implementation GKMobileGestalt

+ (BOOL)wapiCapability
{
  return MGGetBoolAnswer();
}

+ (NSString)deviceClass
{
  return (NSString *)(id)MGGetStringAnswer();
}

+ (NSString)productType
{
  return (NSString *)(id)MGGetStringAnswer();
}

@end
