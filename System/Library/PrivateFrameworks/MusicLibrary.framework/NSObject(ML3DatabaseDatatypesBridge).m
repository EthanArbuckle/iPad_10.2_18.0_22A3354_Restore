@implementation NSObject(ML3DatabaseDatatypesBridge)

- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:
{
  return sqlite3_bind_null(a3, a4);
}

- (uint64_t)ml_stringValueForSQL
{
  return 0;
}

@end
