@implementation CNSharedProfileStateOracleTestDouble

+ (BOOL)isFeatureEnabled
{
  return 1;
}

+ (BOOL)shouldBypassPersistenceCheck
{
  return 1;
}

@end
