@implementation NSNumber(sqlite3)

+ (id)hmbNumberWithSQLite3Column:()sqlite3 column:
{
  int v6;
  void *v7;

  v6 = sqlite3_column_type(a3, iCol);
  if (v6 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(a3, iCol));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(a3, iCol));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
