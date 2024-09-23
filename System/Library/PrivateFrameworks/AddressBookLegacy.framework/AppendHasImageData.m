@implementation AppendHasImageData

BOOL __AppendHasImageData_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  sqlite3_stmt *v6;
  _BOOL8 v7;

  ABCAddressBookGetImageStore((CFStringRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "query"), "addressBook"));
  CPRecordStoreGetDatabase();
  CPSqliteDatabaseConnectionForReading();
  v4 = CPSqliteConnectionStatementForSQL();
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(sqlite3_stmt **)(v4 + 8);
  if (!v6)
    return 0;
  sqlite3_bind_int(v6, 1, a3);
  v7 = sqlite3_step(*(sqlite3_stmt **)(v5 + 8)) == 100 && sqlite3_column_int(*(sqlite3_stmt **)(v5 + 8), 0) > 0;
  CPSqliteStatementReset();
  return v7;
}

@end
