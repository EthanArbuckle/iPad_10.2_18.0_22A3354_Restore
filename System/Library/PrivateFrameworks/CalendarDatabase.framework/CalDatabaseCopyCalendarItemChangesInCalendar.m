@implementation CalDatabaseCopyCalendarItemChangesInCalendar

uint64_t __CalDatabaseCopyCalendarItemChangesInCalendar_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v4;
  int ID;
  uint64_t result;
  int v7;

  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 56));
  v4 = *(sqlite3_stmt **)(a2 + 8);
  ID = CPRecordGetID();
  sqlite3_bind_int(v4, 2, ID);
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 3, *(const char **)(a1 + 40), -1, 0);
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 4, *(const char **)(a1 + 40), -1, 0);
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 5, *(_DWORD *)(a1 + 56));
  result = sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 6, *(const char **)(a1 + 40), -1, 0);
  v7 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 360);
  if ((v7 & 0x80000000) == 0)
    return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 7, v7);
  return result;
}

@end
