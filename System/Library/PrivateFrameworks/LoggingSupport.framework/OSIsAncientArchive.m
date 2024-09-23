@implementation OSIsAncientArchive

uint64_t ___OSIsAncientArchive_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 40) == a2 && *(_DWORD *)a2 == 4096 && *(_QWORD *)(a2 + 8) >= 0x88uLL)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = strcmp((const char *)(a2 + 104), "X619AP") == 0;
  return 0;
}

@end
