@implementation CSPrivateIndexConnection

+ (id)connectionUUID:(id)a3
{
  return CSPrivateUUID(a3);
}

+ (id)serviceName
{
  return CFSTR("com.apple.corespotlightservice");
}

@end
