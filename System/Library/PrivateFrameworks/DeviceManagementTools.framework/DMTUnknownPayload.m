@implementation DMTUnknownPayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)(id)objc_opt_new();
}

@end
