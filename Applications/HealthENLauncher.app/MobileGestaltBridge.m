@implementation MobileGestaltBridge

+ (BOOL)wapiCapability
{
  return MGGetBoolAnswer(CFSTR("wapi"), a2);
}

@end
