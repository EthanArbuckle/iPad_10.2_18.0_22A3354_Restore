@implementation OSLogGenerateXattrs

uint64_t ___OSLogGenerateXattrs_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned __int8 *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == 4096)
  {
    v4 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 4);
    if (*(_QWORD *)(a2 + 8) <= 0xA7uLL)
    {
      uuid_clear(v4);
      return 1;
    }
    *(_OWORD *)v4 = *(_OWORD *)(a2 + 144);
    v3 = *(_DWORD *)a2;
  }
  if (v3 == 24587 && *(_DWORD *)(a2 + 4) >= 0x11u)
  {
    v5 = _catalog_create_with_chunk(a2, 0);
    if (v5)
    {
      v6 = *(_QWORD **)(v5 + 64);
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(v7 + 24);
        v9 = *(_QWORD *)(v7 + 32);
        do
        {
          if (v8 >= v6[2])
            v8 = v6[2];
          if (v9 <= v6[3])
            v9 = v6[3];
          v6 = (_QWORD *)*v6;
        }
        while (v6);
        *(_QWORD *)(v7 + 24) = v8;
        *(_QWORD *)(v7 + 32) = v9;
      }
      _catalog_destroy(v5);
    }
  }
  return 1;
}

@end
