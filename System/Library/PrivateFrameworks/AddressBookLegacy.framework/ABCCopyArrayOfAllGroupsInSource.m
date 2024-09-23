@implementation ABCCopyArrayOfAllGroupsInSource

uint64_t __ABCCopyArrayOfAllGroupsInSource_block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    if (*(_QWORD *)(a2 + 8))
      return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(result + 32));
  }
  return result;
}

@end
