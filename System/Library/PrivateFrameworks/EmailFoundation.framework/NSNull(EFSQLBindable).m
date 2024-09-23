@implementation NSNull(EFSQLBindable)

- (uint64_t)ef_SQLBinding
{
  return 0;
}

@end
