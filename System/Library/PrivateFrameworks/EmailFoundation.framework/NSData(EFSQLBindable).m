@implementation NSData(EFSQLBindable)

- (EFSQLBinding)ef_SQLBinding
{
  return +[EFSQLBinding bindingWithData:](EFSQLBinding, "bindingWithData:", a1);
}

@end
