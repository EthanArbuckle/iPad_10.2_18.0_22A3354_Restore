@implementation SLYoukuService

- (id)serviceType
{
  return CFSTR("com.apple.social.youku");
}

- (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F168];
}

- (int64_t)authenticationStyle
{
  return 0;
}

@end
