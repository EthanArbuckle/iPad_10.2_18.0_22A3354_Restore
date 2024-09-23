@implementation DDRelayCallAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Call Using Relay"));
}

- (id)iconName
{
  return CFSTR("phone");
}

- (int64_t)TTYType
{
  return 3;
}

@end
