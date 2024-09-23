@implementation NSUUID(sqlite3)

+ (__int128)hmbUUIDWithSQLite3Column:()sqlite3 column:
{
  __int128 *v6;
  __int128 *v7;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = (__int128 *)sqlite3_column_blob(a3, iCol);
  if (v6)
  {
    v7 = v6;
    if (sqlite3_column_bytes(a3, iCol) == 16)
    {
      v9 = *v7;
      return (__int128 *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v9);
    }
    v6 = 0;
  }
  return v6;
}

@end
