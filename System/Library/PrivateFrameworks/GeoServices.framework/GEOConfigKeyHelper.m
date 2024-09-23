@implementation GEOConfigKeyHelper

void __43___GEOConfigKeyHelper__lookupKeyProperties__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = *(_QWORD *)&a3 & 0xFF0000;
  if ((*(_QWORD *)&a3 & 0xFF0000uLL) >= 0x80000)
  {
    if ((*(_QWORD *)&a3 & 0xFF0000) == 0x80000)
    {
      v7 = 8;
      goto LABEL_10;
    }
    if (v6 == 983040)
    {
      v7 = 2;
      goto LABEL_10;
    }
  }
  else
  {
    if (v6 == 0x20000)
    {
      v7 = 6;
      goto LABEL_10;
    }
    if (v6 == 0x40000)
    {
      v7 = 7;
LABEL_10:
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v7;
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v5;

}

@end
