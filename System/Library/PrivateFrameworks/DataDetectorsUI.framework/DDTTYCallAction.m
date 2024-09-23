@implementation DDTTYCallAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Call Using RTT/TTY"));
}

- (int64_t)TTYType
{
  return 2;
}

@end
