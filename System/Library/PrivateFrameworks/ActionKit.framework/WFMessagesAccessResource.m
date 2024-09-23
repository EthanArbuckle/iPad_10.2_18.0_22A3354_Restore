@implementation WFMessagesAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.MobileSMS");
}

- (unint64_t)status
{
  return 4;
}

@end
