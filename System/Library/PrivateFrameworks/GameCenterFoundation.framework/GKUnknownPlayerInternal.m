@implementation GKUnknownPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)playerID
{
  return CFSTR("UnknownID");
}

- (BOOL)isUnknownPlayer
{
  return 1;
}

@end
