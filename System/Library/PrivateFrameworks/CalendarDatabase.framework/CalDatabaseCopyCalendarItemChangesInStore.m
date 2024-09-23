@implementation CalDatabaseCopyCalendarItemChangesInStore

uint64_t __CalDatabaseCopyCalendarItemChangesInStore_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v4;
  int ID;
  int v6;
  uint64_t result;
  int v8;

  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 56));
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = *(sqlite3_stmt **)(a2 + 8);
    ID = CPRecordGetID();
    sqlite3_bind_int(v4, 2, ID);
    v6 = 3;
  }
  else
  {
    v6 = 2;
  }
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), v6, *(const char **)(a1 + 40), -1, 0);
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), v6 + 1, *(const char **)(a1 + 40), -1, 0);
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), v6 + 2, *(_DWORD *)(a1 + 56));
  result = sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), v6 + 3, *(const char **)(a1 + 40), -1, 0);
  v8 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 360);
  if ((v8 & 0x80000000) == 0)
    return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), v6 | 4, v8);
  return result;
}

@end
