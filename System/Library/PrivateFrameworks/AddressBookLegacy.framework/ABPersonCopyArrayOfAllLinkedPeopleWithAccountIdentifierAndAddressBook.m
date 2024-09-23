@implementation ABPersonCopyArrayOfAllLinkedPeopleWithAccountIdentifierAndAddressBook

sqlite3_stmt *__ABPersonCopyArrayOfAllLinkedPeopleWithAccountIdentifierAndAddressBook_block_invoke(sqlite3_stmt *result, uint64_t a2)
{
  sqlite3_stmt *v3;
  sqlite3_stmt *v4;
  const char *v5;

  if (a2)
  {
    v3 = result;
    result = *(sqlite3_stmt **)(a2 + 8);
    if (result)
    {
      sqlite3_bind_int(result, 1, *((_DWORD *)v3 + 10));
      result = (sqlite3_stmt *)*((_QWORD *)v3 + 4);
      if (result)
      {
        v4 = *(sqlite3_stmt **)(a2 + 8);
        v5 = (const char *)_CPCreateUTF8StringFromCFString();
        return (sqlite3_stmt *)sqlite3_bind_text(v4, 2, v5, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
      }
    }
  }
  return result;
}

@end
