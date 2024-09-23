@implementation NSString(EFSQLBindable)

- (EFSQLBinding)ef_SQLBinding
{
  return +[EFSQLBinding bindingWithString:](EFSQLBinding, "bindingWithString:", a1);
}

@end
