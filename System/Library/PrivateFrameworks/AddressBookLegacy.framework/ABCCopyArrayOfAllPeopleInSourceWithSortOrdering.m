@implementation ABCCopyArrayOfAllPeopleInSourceWithSortOrdering

sqlite3_stmt *__ABCCopyArrayOfAllPeopleInSourceWithSortOrdering_block_invoke(sqlite3_stmt *result, uint64_t a2)
{
  sqlite3_stmt *v2;
  int v3;

  if (a2)
  {
    v2 = result;
    result = *(sqlite3_stmt **)(a2 + 8);
    if (result)
    {
      v3 = *((_DWORD *)v2 + 8);
      if (v3 != -1)
        return (sqlite3_stmt *)sqlite3_bind_int(result, 1, v3);
    }
  }
  return result;
}

@end
