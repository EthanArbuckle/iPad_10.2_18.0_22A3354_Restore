@implementation ABAddressBookCopyAccountWithIdentifier

void __ABAddressBookCopyAccountWithIdentifier_block_invoke(uint64_t a1, uint64_t a2)
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
