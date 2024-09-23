@implementation NSString(sqlite3)

+ (id)stringWithSQLite3Column:()sqlite3 column:
{
  void *v4;

  v4 = (void *)sqlite3_column_text(a3, iCol);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
