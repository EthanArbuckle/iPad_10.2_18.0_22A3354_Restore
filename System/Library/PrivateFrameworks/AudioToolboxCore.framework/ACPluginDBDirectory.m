@implementation ACPluginDBDirectory

uint64_t __50___ACPluginDBDirectory_eventStreamCallback_flags___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  v3 = a1 + 32;
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 8) == *(_QWORD *)(result + 88))
  {
    objc_msgSend((id)result, "bundlesChanged:shouldRescan:", *(_QWORD *)(result + 80), *(unsigned __int8 *)(result + 96));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 0;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  }
  return result;
}

@end
