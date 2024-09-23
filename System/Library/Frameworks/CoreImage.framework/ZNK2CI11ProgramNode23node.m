@implementation ZNK2CI11ProgramNode23node

const __CFString *___ZNK2CI11ProgramNode23node_for_graphviz_statsERKNSt3__113unordered_mapIPKNS_11GraphObjectEjNS1_4hashIS5_EENS1_8equal_toIS5_EENS1_9allocatorINS1_4pairIKS5_jEEEEEENS_4Node9NodeStatsE_block_invoke(uint64_t a1, __CFDictionary *this, const __CFString *a3)
{
  const __CFString *result;
  const __CFString *v6;

  result = (const __CFString *)__CFDictionary::getString(this, (const __CFDictionary *)CFSTR("id"), a3);
  if (result)
  {
    v6 = *(const __CFString **)(a1 + 48);
    if (v6)
    {
      result = (const __CFString *)CFStringHasPrefix(result, v6);
      if ((_DWORD)result)
      {
        CIGVNodeSetColor(*(void **)(a1 + 56), (const char *)7);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = __CFDictionary::getInt32(this, (const __CFDictionary *)CFSTR("x"), 0);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = __CFDictionary::getInt32(this, (const __CFDictionary *)CFSTR("y"), 0);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = (int)__CFDictionary::getInt32(this, (const __CFDictionary *)CFSTR("w"), 0);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = (int)__CFDictionary::getInt32(this, (const __CFDictionary *)CFSTR("h"), 0);
        result = __CFDictionary::getInt32(this, (const __CFDictionary *)CFSTR("size"), 0);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += (int)result;
      }
    }
  }
  return result;
}

@end
