@implementation CalDatabaseCopyNotificationWithUUID

uint64_t ___CalDatabaseCopyNotificationWithUUID_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v4;
  const char *CStringFromCFString;

  v4 = *(sqlite3_stmt **)(a2 + 8);
  CStringFromCFString = (const char *)CalCreateCStringFromCFString(*(const __CFString **)(a1 + 32));
  sqlite3_bind_text(v4, 1, CStringFromCFString, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 2, *(_DWORD *)(a1 + 40));
}

@end
