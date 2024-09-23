@implementation ZNK2CI4Node23node

const __CFString *___ZNK2CI4Node23node_for_graphviz_statsERKNSt3__113unordered_mapIPKNS_11GraphObjectEjNS1_4hashIS5_EENS1_8equal_toIS5_EENS1_9allocatorINS1_4pairIKS5_jEEEEEENS0_9NodeStatsE_block_invoke(uint64_t a1, __CFDictionary *this)
{
  const __CFString *result;
  signed int Int32;
  void *v6;

  result = __CFDictionary::getInt32(this, (const __CFDictionary *)CFSTR("imgIndex"), 0);
  if (*(_DWORD *)(a1 + 56) == (_DWORD)result)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    Int32 = __CFDictionary::getInt32(this, (const __CFDictionary *)CFSTR("size"), 0);
    v6 = *(void **)(a1 + 48);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += Int32;
    return (const __CFString *)CIGVNodeSetColor(v6, (const char *)0xB);
  }
  return result;
}

@end
