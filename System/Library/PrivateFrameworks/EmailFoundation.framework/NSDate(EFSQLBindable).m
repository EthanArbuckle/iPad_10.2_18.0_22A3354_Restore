@implementation NSDate(EFSQLBindable)

- (EFSQLBinding)ef_SQLBinding
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return +[EFSQLBinding bindingWithInt64:](EFSQLBinding, "bindingWithInt64:", vcvtmd_s64_f64(v1));
}

@end
