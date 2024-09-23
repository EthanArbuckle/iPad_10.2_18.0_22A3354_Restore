@implementation WFAddToReadingListAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.mobilesafari");
}

- (unint64_t)status
{
  return 4;
}

@end
