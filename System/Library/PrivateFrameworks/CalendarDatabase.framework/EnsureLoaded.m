@implementation EnsureLoaded

uint64_t ___EnsureLoaded_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v4;
  int ID;
  uint64_t result;
  int v7;

  v4 = *(sqlite3_stmt **)(a2 + 8);
  ID = CPRecordGetID();
  result = sqlite3_bind_int(v4, 1, ID);
  v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v7)
    return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 2, v7);
  return result;
}

@end
