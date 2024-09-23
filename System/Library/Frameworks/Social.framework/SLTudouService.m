@implementation SLTudouService

- (id)serviceType
{
  return CFSTR("com.apple.social.tudou");
}

- (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F150];
}

- (int64_t)authenticationStyle
{
  return 0;
}

@end
