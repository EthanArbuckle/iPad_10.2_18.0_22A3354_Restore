@implementation NSNull(CCDatabaseValue)

- (uint64_t)databaseValue_toNumber
{
  return 0;
}

- (uint64_t)databaseValue_toString
{
  return 0;
}

- (uint64_t)databaseValue_toData
{
  return 0;
}

- (uint64_t)databaseValue_type
{
  return 4;
}

@end
