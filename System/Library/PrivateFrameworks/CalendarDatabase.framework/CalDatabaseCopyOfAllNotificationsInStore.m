@implementation CalDatabaseCopyOfAllNotificationsInStore

uint64_t ___CalDatabaseCopyOfAllNotificationsInStore_block_invoke(uint64_t a1, uint64_t a2)
{
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 32));
}

uint64_t ___CalDatabaseCopyOfAllNotificationsInStore_block_invoke_2(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v3;
  int ID;

  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 40));
  v3 = *(sqlite3_stmt **)(a2 + 8);
  ID = CPRecordGetID();
  return sqlite3_bind_int(v3, 2, ID);
}

@end
