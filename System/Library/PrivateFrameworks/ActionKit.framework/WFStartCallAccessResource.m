@implementation WFStartCallAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.mobilephone");
}

- (unint64_t)status
{
  return 4;
}

@end
