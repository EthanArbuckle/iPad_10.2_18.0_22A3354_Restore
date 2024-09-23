@implementation NSData(ML3DatabaseDatatypesBridge)

- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:
{
  id v6;
  uint64_t v7;
  const char *v8;

  v6 = objc_retainAutorelease(a1);
  v7 = objc_msgSend(v6, "bytes");
  if (v7)
    v8 = (const char *)v7;
  else
    v8 = "";
  return sqlite3_bind_blob(a3, a4, v8, objc_msgSend(v6, "length"), 0);
}

- (uint64_t)ml_stringValueForSQL
{
  return 0;
}

@end
