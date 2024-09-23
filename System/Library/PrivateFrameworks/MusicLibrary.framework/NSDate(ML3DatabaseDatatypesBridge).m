@implementation NSDate(ML3DatabaseDatatypesBridge)

- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:
{
  double v6;

  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return sqlite3_bind_double(a3, a4, v6);
}

- (uint64_t)ml_stringValueForSQL
{
  void *v1;
  uint64_t v2;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%f"), v2);
}

@end
