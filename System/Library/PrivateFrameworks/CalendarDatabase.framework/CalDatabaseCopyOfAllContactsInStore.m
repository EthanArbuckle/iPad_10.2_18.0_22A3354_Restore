@implementation CalDatabaseCopyOfAllContactsInStore

uint64_t __CalDatabaseCopyOfAllContactsInStore_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v2;
  int ID;

  v2 = *(sqlite3_stmt **)(a2 + 8);
  ID = CPRecordGetID();
  return sqlite3_bind_int(v2, 1, ID);
}

@end
