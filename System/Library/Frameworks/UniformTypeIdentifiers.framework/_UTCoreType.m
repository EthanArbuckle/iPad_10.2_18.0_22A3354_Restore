@implementation _UTCoreType

- (uint64_t)_constantIndex
{
  return (a1 - (uint64_t)&UniformTypeIdentifiers::CoreTypes::constants) >> 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)_isCoreType
{
  return 1;
}

- (uint64_t)version
{
  return 0;
}

@end
