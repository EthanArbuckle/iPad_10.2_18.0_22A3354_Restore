@implementation NSXPCSerializationDebugInfoForObject

uint64_t ___NSXPCSerializationDebugInfoForObject_block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 48))
  {
    v4 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
      ++v4;
    }
    while (v4 < *(_QWORD *)(a1 + 48));
  }
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7 + 1;
  objc_msgSend(v5, "appendFormat:", CFSTR("%lld => "), v7);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", _NSXPCSerializationDebugInfoForObject(*(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 64) + *(_QWORD *)(a1 + 48)));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return 1;
}

uint64_t ___NSXPCSerializationDebugInfoForObject_block_invoke_2(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  if (*(_QWORD *)(a1 + 40))
  {
    v6 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 40));
  }
  if ((*((_DWORD *)a2 + 2) | 0x10) == 0x70)
  {
    v7 = _NSXPCSerializationDebugInfoForObject(*(_QWORD *)(a1 + 48), a2, 0);
    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "appendFormat:", CFSTR("%@ => "), v7, v10);
    else
      objc_msgSend(v8, "appendFormat:", CFSTR("<bad dictionary key @%lld>"), *a2, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("<unexpected dictionary key type %d @%lld>"), *((unsigned int *)a2 + 2), *a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", _NSXPCSerializationDebugInfoForObject(*(_QWORD *)(a1 + 48), a3, *(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return 1;
}

@end
