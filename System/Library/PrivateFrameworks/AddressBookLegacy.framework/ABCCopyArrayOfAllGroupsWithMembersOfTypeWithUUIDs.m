@implementation ABCCopyArrayOfAllGroupsWithMembersOfTypeWithUUIDs

uint64_t __ABCCopyArrayOfAllGroupsWithMembersOfTypeWithUUIDs_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  CFIndex v4;
  void (__cdecl *v5)(void *);
  sqlite3_stmt *v6;
  const char *v7;

  if (a2)
  {
    if (*(_QWORD *)(a2 + 8))
    {
      v3 = result;
      if (*(uint64_t *)(result + 32) >= 1)
      {
        v4 = 0;
        v5 = (void (__cdecl *)(void *))MEMORY[0x1E0C834A8];
        do
        {
          CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 40), v4);
          v6 = *(sqlite3_stmt **)(a2 + 8);
          ++v4;
          v7 = (const char *)_CPCreateUTF8StringFromCFString();
          result = sqlite3_bind_text(v6, v4, v7, -1, v5);
        }
        while (*(_QWORD *)(v3 + 32) > v4);
      }
    }
  }
  return result;
}

@end
