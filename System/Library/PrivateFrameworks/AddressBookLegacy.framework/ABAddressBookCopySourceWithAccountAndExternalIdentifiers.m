@implementation ABAddressBookCopySourceWithAccountAndExternalIdentifiers

void __ABAddressBookCopySourceWithAccountAndExternalIdentifiers_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v3;
  const char *v4;
  void (__cdecl *v5)(void *);
  sqlite3_stmt *v6;
  const char *v7;

  if (a2)
  {
    v3 = *(sqlite3_stmt **)(a2 + 8);
    if (v3)
    {
      v4 = (const char *)_CPCreateUTF8StringFromCFString();
      v5 = (void (__cdecl *)(void *))MEMORY[0x1E0C834A8];
      sqlite3_bind_text(v3, 1, v4, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
      v6 = *(sqlite3_stmt **)(a2 + 8);
      v7 = (const char *)_CPCreateUTF8StringFromCFString();
      sqlite3_bind_text(v6, 2, v7, -1, v5);
    }
  }
}

void __ABAddressBookCopySourceWithAccountAndExternalIdentifiers_block_invoke_2(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v2;
  const char *v3;

  if (a2)
  {
    v2 = *(sqlite3_stmt **)(a2 + 8);
    if (v2)
    {
      v3 = (const char *)_CPCreateUTF8StringFromCFString();
      sqlite3_bind_text(v2, 1, v3, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
    }
  }
}

@end
