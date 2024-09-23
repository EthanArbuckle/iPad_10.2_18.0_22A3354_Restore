@implementation CSManagedIndexConnection

+ (id)connectionUUID:(id)a3
{
  return CSManagedUUID(a3);
}

+ (id)serviceName
{
  return CFSTR("com.apple.managedcorespotlightd");
}

@end
