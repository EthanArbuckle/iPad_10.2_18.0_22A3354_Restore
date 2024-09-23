@implementation CalDatabaseCopyAlarmWithUUID

uint64_t __CalDatabaseCopyAlarmWithUUID_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v2;
  const char *CStringFromCFString;

  v2 = *(sqlite3_stmt **)(a2 + 8);
  CStringFromCFString = (const char *)CalCreateCStringFromCFString(*(const __CFString **)(a1 + 32));
  return sqlite3_bind_text(v2, 1, CStringFromCFString, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
}

@end
