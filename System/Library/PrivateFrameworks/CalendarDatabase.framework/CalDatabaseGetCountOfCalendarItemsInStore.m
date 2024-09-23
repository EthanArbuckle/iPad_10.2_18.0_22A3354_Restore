@implementation CalDatabaseGetCountOfCalendarItemsInStore

uint64_t __CalDatabaseGetCountOfCalendarItemsInStore_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  sqlite3_stmt *v5;
  int ID;
  int v7;
  int v8;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = *(sqlite3_stmt **)(a2 + 8);
    ID = CPRecordGetID();
    result = sqlite3_bind_int(v5, 1, ID);
    v7 = 2;
  }
  else
  {
    v7 = 1;
  }
  v8 = *(_DWORD *)(a1 + 40);
  if (v8 >= 1)
    return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), v7, v8);
  return result;
}

@end
