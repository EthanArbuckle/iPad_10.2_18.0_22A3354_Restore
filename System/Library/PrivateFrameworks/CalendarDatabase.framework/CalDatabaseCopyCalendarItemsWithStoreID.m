@implementation CalDatabaseCopyCalendarItemsWithStoreID

uint64_t __CalDatabaseCopyCalendarItemsWithStoreID_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 32));
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 2, *(_DWORD *)(a1 + 36));
}

@end
