@implementation OSLogIndexFile

uint64_t __50___OSLogIndexFile__loadCatalogMetadataForTimespan__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(_DWORD *)a2 == 24587)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 48) != -1)
      _catalog_lite_read_limits(a2, v2 + 56, v2 + 64);
  }
  else if (*(_DWORD *)a2 == 4096)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = *(_QWORD *)(a2 + 64);
  }
  return 1;
}

BOOL __39___OSLogIndexFile__loadHeaderMetadata___block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  int v2;

  v2 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == 4096 && *((_QWORD *)a2 + 1) >= 0xA8uLL)
  {
    uuid_copy((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24), a2 + 144);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return v2 != 4096;
}

@end
