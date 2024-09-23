@implementation OSLogUUIDMapAddFromFile

uint64_t ___OSLogUUIDMapAddFromFile_block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char v12;

  if (*a2 != 24587)
    return 1;
  v3 = _catalog_create_with_chunk((uint64_t)a2, 0);
  if (v3)
  {
    v10 = v3;
    _OSLogUUIDMapAddFromCatalog(v3, *(_QWORD *)(a1 + 48));
    _catalog_destroy(v10);
    return 1;
  }
  _OSLogWarningMessage(*(void **)(a1 + 32), "failed to open catalog chunk", v4, v5, v6, v7, v8, v9, v12);
  result = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 22;
  return result;
}

@end
