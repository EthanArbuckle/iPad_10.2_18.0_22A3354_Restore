@implementation ZN2CI11ProgramNode19build

const __CFDictionary *___ZN2CI11ProgramNode19build_program_graphEPNS_4NodeEPNS_7ContextERNS_13NodeToNodeMapEb_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
  const __CFDictionary *result;

  result = *(const __CFDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      result = (const __CFDictionary *)CFEqual(result, a3);
      if (!(_DWORD)result)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

@end
