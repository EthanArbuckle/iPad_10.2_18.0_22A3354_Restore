@implementation CSSymbolOwnerGetSectionWithName

uint64_t __CSSymbolOwnerGetSectionWithName_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  const char *v6;
  const char *Name;
  uint64_t result;
  uint64_t v9;

  v6 = (const char *)a1[6];
  Name = CSRegionGetName(a2, a3);
  result = strcmp(v6, Name);
  if (!(_DWORD)result)
  {
    v9 = *(_QWORD *)(a1[4] + 8);
    *(_QWORD *)(v9 + 40) = a2;
    *(_QWORD *)(v9 + 48) = a3;
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
  return result;
}

@end
