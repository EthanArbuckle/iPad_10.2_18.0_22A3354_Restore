@implementation NSNumber(EFSQLBindable)

- (id)ef_SQLBinding
{
  CFNumberType Type;

  Type = CFNumberGetType(a1);
  if ((unint64_t)Type > kCFNumberCGFloatType || ((1 << Type) & 0x13060) == 0)
  {
    +[EFSQLBinding bindingWithInt64:](EFSQLBinding, "bindingWithInt64:", -[__CFNumber longLongValue](a1, "longLongValue"));
  }
  else
  {
    -[__CFNumber doubleValue](a1, "doubleValue");
    +[EFSQLBinding bindingWithDouble:](EFSQLBinding, "bindingWithDouble:");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
