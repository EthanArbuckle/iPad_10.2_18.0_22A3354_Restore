@implementation CalDatabaseCopyExceptionDateChangesInCalendar

uint64_t __CalDatabaseCopyExceptionDateChangesInCalendar_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;

  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 48));
  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
  result = sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 3, 10);
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 360);
  if ((v5 & 0x80000000) == 0)
    return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 4, v5);
  return result;
}

@end
