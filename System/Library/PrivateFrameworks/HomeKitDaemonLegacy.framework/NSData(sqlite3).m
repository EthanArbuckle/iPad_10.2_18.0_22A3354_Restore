@implementation NSData(sqlite3)

+ (id)dataWithSQLite3ColumnNoCopy:()sqlite3 column:
{
  const void *v6;
  void *v7;

  v6 = sqlite3_column_blob(a3, iCol);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v6, sqlite3_column_bytes(a3, iCol), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sqlite3_column_type(a3, iCol) == 5)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

+ (id)dataWithSQLite3Column:()sqlite3 column:
{
  const void *v6;
  void *v7;

  v6 = sqlite3_column_blob(a3, iCol);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, sqlite3_column_bytes(a3, iCol));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sqlite3_column_type(a3, iCol) == 5)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

@end
