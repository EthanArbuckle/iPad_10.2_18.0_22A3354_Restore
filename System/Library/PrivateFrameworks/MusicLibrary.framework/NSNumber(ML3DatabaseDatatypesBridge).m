@implementation NSNumber(ML3DatabaseDatatypesBridge)

- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:
{
  CFNumberType Type;
  double v9;

  Type = CFNumberGetType(a1);
  if ((unint64_t)Type > kCFNumberCGFloatType)
    return sqlite3_bind_int64(a3, a4, -[__CFNumber longLongValue](a1, "longLongValue"));
  if (((1 << Type) & 0x38E) != 0)
    return sqlite3_bind_int(a3, a4, -[__CFNumber intValue](a1, "intValue"));
  if (((1 << Type) & 0x10060) == 0)
    return sqlite3_bind_int64(a3, a4, -[__CFNumber longLongValue](a1, "longLongValue"));
  -[__CFNumber doubleValue](a1, "doubleValue");
  return sqlite3_bind_double(a3, a4, v9);
}

@end
